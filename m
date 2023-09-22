Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76DAE6FE2B
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 13:24:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.21057.1695389060593304345
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 06:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=eOjq6Wun;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.53, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32001d16a14so2021631f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1695389059; x=1695993859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXkT0E902mlE+f4VISeRsSp+QlNg48FppgdvIrQrltM=;
        b=eOjq6WunG+0J3e9vemwnvqCpjkGajU7UtMyQrflwN8LJdDfv8w/nLNV01nSQx8nWDb
         PukWLQKNtJk+N4pqrcd7qQY5nZyEDOO3Dwvnn602CRAM7xJXxZD/CfofGIuKNnf1PHP8
         cO4RIIZijrpWs9O22fEwr2zIAOSqNOZMCQNQEva1rOQWlgKEjW/wsy96nGy+Uv35sX6p
         hcSgmVWv1+eWYRWhD2J/ociMcuipxt/h8azLGawID+eeTvXFdPcVGUqnAOXxJKl1m6iY
         iOEDjxQzT4RYSTZbyibIUgAFUYtHa7oXPiWo3YTD/d27d2Mq2wWetw7O04HD6HHKPYq1
         pHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695389059; x=1695993859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jXkT0E902mlE+f4VISeRsSp+QlNg48FppgdvIrQrltM=;
        b=DP5r5ZUYCpA5rcgxq3XbzM2bPq9/KfG2bFKCU4GdZi8Nd4jlUsBjQc/RcNcKOVlWGO
         +lckyU6lqIWp6FHYeleB1D63q5Iq0tgTBcFvHT/35jsSu7kdYcyoTig9pSQv9BMiepfN
         OAkjWQE9ojhVlC+UwR+LTT0qsfFteTzYACBiiKYwr8eAYELlx1FD8fZj5JKp1MqsnOZX
         T1S1XhB8zHQjM2/UrLpUc3fkQEpUbQFibXU5B8JX+6rg8vfhqjLeW7MpvahiNLZy0rrk
         o8qIAEJR9F/gi1TDV2cJoXokuEyxGz/J5f9C+04LtDiH6GHhlMjJE2iLvuG4f9SvBYPB
         y5Zg==
X-Gm-Message-State: AOJu0Yw9DznTyHENv1zX8pRJ5elOL5LRny+DLV0y9ePby2keGrH4N12g
	w02teuEL+QLMObF11Gmvl8ctyf24UALWR3mx0FBGo2IXt52vI17JyNCMQSaroda5ReVjRdJKjgO
	e1yNjrrREJ/hhlwzxO25dVEPmZL02ab84n+M5uja9SEtqdCuL
X-Google-Smtp-Source: AGHT+IEaIDBVVKWqGepj5W4fWaUTE14+IVmiAFLL4rSgrW3BsR3ZfoEoJptNg9+i9gt9gg2TwY+D5w==
X-Received: by 2002:a05:6000:1376:b0:314:dc0:2fca with SMTP id q22-20020a056000137600b003140dc02fcamr8137174wrz.29.1695389057932;
        Fri, 22 Sep 2023 06:24:17 -0700 (PDT)
Received: from localhost (dslb-002-205-020-122.002.205.pools.vodafone-ip.de. [2.205.20.122])
        by smtp.gmail.com with ESMTPSA id a2-20020a5d5082000000b003143cb109d5sm4445899wrt.14.2023.09.22.06.24.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 06:24:17 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone,mickledore][PATCH] keepalived: fix CVE-2021-44225
Date: Fri, 22 Sep 2023 15:24:13 +0200
Message-ID: <20230922132413.676526-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 13:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105066

In Keepalived through 2.2.4, the D-Bus policy does not sufficiently
restrict the message destination, allowing any user to inspect and
manipulate any property. This leads to access-control bypass in some
situations in which an unrelated D-Bus system service has a settable
(writable) property.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-44225
https://github.com/acassen/keepalived/pull/2063

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
Since both kirkstone and mickledore use 2.2.2, and their recipes are
identical, the patch applies to both.

Only build and runtested on kirkstone though.

 .../keepalived/CVE-2021-44225.patch           | 44 +++++++++++++++++++
 .../keepalived/keepalived_2.2.2.bb            |  3 ++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/C=
VE-2021-44225.patch

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2021=
-44225.patch b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-20=
21-44225.patch
new file mode 100644
index 000000000000..ae387ac5faf4
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2021-44225.=
patch
@@ -0,0 +1,44 @@
+From 7977fec0be89ae6fe87405b3f8da2f0b5e415e3d Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.ch>
+Date: Tue, 23 Nov 2021 06:50:59 +0100
+Subject: [PATCH] dbus: fix policy to not be overly broad
+
+The DBus policy did not restrict the message destination, allowing any
+user to inspect and manipulate any property.
+
+Signed-off-by: Vincent Bernat <vincent@bernat.ch>
+
+CVE: CVE-2021-44225
+
+Upstream-Status: Backport [https://github.com/acassen/keepalived/commit/79=
77fec0be89ae6fe87405b3f8da2f0b5e415e3d]
+
+Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
+---
+ keepalived/dbus/org.keepalived.Vrrp1.conf | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/keepalived/dbus/org.keepalived.Vrrp1.conf b/keepalived/dbus/o=
rg.keepalived.Vrrp1.conf
+index 2b78a575c..b5ced6085 100644
+--- a/keepalived/dbus/org.keepalived.Vrrp1.conf
++++ b/keepalived/dbus/org.keepalived.Vrrp1.conf
+@@ -3,12 +3,15 @@
+  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+ <busconfig>
+ 	<policy user=3D"root">
+-		<allow own=3D"org.keepalived.Vrrp1"/>
+-		<allow send_destination=3D"org.keepalived.Vrrp1"/>
++		<allow own=3D"org.keepalived.Vrrp1" />
++		<allow send_destination=3D"org.keepalived.Vrrp1" />
+ 	</policy>
+ 	<policy context=3D"default">
+-		<allow send_interface=3D"org.freedesktop.DBus.Introspectable" />
+-		<allow send_interface=3D"org.freedesktop.DBus.Peer" />
+-		<allow send_interface=3D"org.freedesktop.DBus.Properties" />
++		<allow send_destination=3D"org.keepalived.Vrrp1"
++		       send_interface=3D"org.freedesktop.DBus.Introspectable" />
++		<allow send_destination=3D"org.keepalived.Vrrp1"
++		       send_interface=3D"org.freedesktop.DBus.Peer" />
++		<allow send_destination=3D"org.keepalived.Vrrp1"
++		       send_interface=3D"org.freedesktop.DBus.Properties" />
+ 	</policy>
+ </busconfig>
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb=
 b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
index 204d2fd1163c..dcfbf5f46bdc 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
@@ -10,8 +10,11 @@ HOMEPAGE =3D "http://www.keepalived.org/"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
=20
+PR =3D "r1"
+
 SRC_URI =3D "http://www.keepalived.org/software/${BP}.tar.gz \
            file://0001-layer4-Change-order-of-include-files.patch \
+           file://CVE-2021-44225.patch \
            "
 SRC_URI[sha256sum] =3D "103692bd5345a4ed9f4581632ea636214fdf53e45682e200aa=
b122c4fa674ece"
 UPSTREAM_CHECK_URI =3D "https://github.com/acassen/keepalived/releases"
--=20
2.42.0


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294



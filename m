Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAC4CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:16:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.33916.1761574572237790990
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iqaSvcTI;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4285169c005so2181439f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574571; x=1762179371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzFh/2u28uOz+sDlvb4LFYO5V9mkwEzNmUQMDC7uLUQ=;
        b=iqaSvcTI6/Wi1w9zaceyTKNTRWwh475LjsCIUyRCeaxh+C9rwW+xso2/9f+RH/faQj
         5ViktJ+AnqF2I/8MQvL/YBTThr96ESlkrpL3Q4l9wJiFPVY13otTVKBNCsLfTHQjcND3
         ZdUBMUP1DLFEx38d+8JTmiK9B5Nxz9NyVffph+sbq1YIEnO1bZASixf/j9KfOY6E3i/H
         RWcC2rRQRLb1k70gBkBcSPrUSgoZHtW1WNVYE/usw6inirxtLnoS8lgZTo9c9aRO4lu9
         pd8IASWAmHBhJfbIEpXPqmBU+GWfBTxX4zvAc3WSFf7oRICjSAf+Vhi9asJ352Jy4J9o
         CnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574571; x=1762179371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzFh/2u28uOz+sDlvb4LFYO5V9mkwEzNmUQMDC7uLUQ=;
        b=iQdNdwIO5RebLaq4mjy/+0AfDsyr3PSoSV2E1O/biFxH63sM74ByPGsL9FYu9NvSaf
         sy+u4AdHNxAQLyqANUhqGJqF8JxcyXnNXYfdA3b81VZ598mpD2nzVtIorqENB3Rp7ENp
         vJ2n6jOBILLzwLNUMVT9ReqsM63b8yoRnjs4UbvAHniYCcg+1PUDYTlUOYEWiwaQ+XTB
         k2rJN9ROpzuDNUt/MoW45ye+bdwB9euHrvGwkIMUbkrTImEDOom0MbBcYY9G+hTf8Irj
         Pv7DfA/jX9n5HX+xLsLfXiO64pl0nLHJ5MmIfh+9fctXM67YMPWu/AMpIYWKLiQIEZDb
         lwJQ==
X-Gm-Message-State: AOJu0YxLIwiEubxGDmNJyxBJNd/Rie36COQMj0TayNJBD48s8xCCWrW4
	+6myCLm+fPBA/F0hhf8gMjP2FIu0feTgVNYnzGkxnr1RdQxYLwCx80ffYzJnJw==
X-Gm-Gg: ASbGncsNVcStyBdzkd5QQOTgQTz7yUZs6fcsgbcSKkxITd8fbaA9Fz9rfPUQXfXGF1L
	YpGLc9NpfOA5n4reH82k7y5w2uNqqHcE7jvaIq8evSxdjFEpec+TSAofRmOrpXU9AH0eFgWfQdj
	QVr+k6wz4aHZ9c6/sXkIoTcPsmmPV4CoUf7U42d6o5tz0henfjuYiKmZ+0XdALStl5uee3lqlRI
	+hqx6sqPXKTbiCI0VpCmzc5HERxhRECkuyCeJJ5lZLULx8Z7BF+n7+6DM03fmV2AFiDyxz3zdaJ
	Hn+oT/YGYwq05RXvRC7jFRnmJSsvxaiRG6SBmcs0LL7cMn8v8NeP0iXy6NXgWpmnPzHktO5zn62
	J32LSjLnIo62qhp4KC90/6GFAD5VuHjlxD9/Px3N3JFZpK4+NwV5/DhraufX3icRfgqHksSJpAI
	Dtxf8iuLsf
X-Google-Smtp-Source: AGHT+IEEwzMb81PRxj2jY2lJk51s4qtif4IatELLiiXDtDUrUT1i9MUk0CPaHkLRe8LiPct+1C3DZw==
X-Received: by 2002:a05:6000:400d:b0:3ee:1461:1659 with SMTP id ffacd0b85a97d-42704d98980mr26708673f8f.31.1761574570468;
        Mon, 27 Oct 2025 07:16:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db80fsm14164067f8f.31.2025.10.27.07.16.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:16:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 10/10] keepalived: patch CVE-2021-44225
Date: Mon, 27 Oct 2025 15:15:57 +0100
Message-ID: <20251027141557.1893563-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027141557.1893563-1-skandigraun@gmail.com>
References: <20251027141557.1893563-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 14:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121050

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-44225

Pick patch mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../keepalived/CVE-2021-44225.patch           | 41 +++++++++++++++++++
 .../keepalived/keepalived_2.2.2.bb            |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2021-44225.patch

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2021-44225.patch b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2021-44225.patch
new file mode 100644
index 0000000000..01737c5734
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/CVE-2021-44225.patch
@@ -0,0 +1,41 @@
+From 585788ee03bfe204a2a796a5f096a499a02c65db Mon Sep 17 00:00:00 2001
+From: Vincent Bernat <vincent@bernat.ch>
+Date: Tue, 23 Nov 2021 06:50:59 +0100
+Subject: [PATCH] dbus: fix policy to not be overly broad
+
+The DBus policy did not restrict the message destination, allowing any
+user to inspect and manipulate any property.
+
+CVE: CVE-2021-44225
+Upstream-Status: Backport [https://github.com/acassen/keepalived/commit/7977fec0be89ae6fe87405b3f8da2f0b5e415e3d]
+
+Signed-off-by: Vincent Bernat <vincent@bernat.ch>
+---
+ keepalived/dbus/org.keepalived.Vrrp1.conf | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/keepalived/dbus/org.keepalived.Vrrp1.conf b/keepalived/dbus/org.keepalived.Vrrp1.conf
+index 2b78a57..b5ced60 100644
+--- a/keepalived/dbus/org.keepalived.Vrrp1.conf
++++ b/keepalived/dbus/org.keepalived.Vrrp1.conf
+@@ -3,12 +3,15 @@
+  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+ <busconfig>
+ 	<policy user="root">
+-		<allow own="org.keepalived.Vrrp1"/>
+-		<allow send_destination="org.keepalived.Vrrp1"/>
++		<allow own="org.keepalived.Vrrp1" />
++		<allow send_destination="org.keepalived.Vrrp1" />
+ 	</policy>
+ 	<policy context="default">
+-		<allow send_interface="org.freedesktop.DBus.Introspectable" />
+-		<allow send_interface="org.freedesktop.DBus.Peer" />
+-		<allow send_interface="org.freedesktop.DBus.Properties" />
++		<allow send_destination="org.keepalived.Vrrp1"
++		       send_interface="org.freedesktop.DBus.Introspectable" />
++		<allow send_destination="org.keepalived.Vrrp1"
++		       send_interface="org.freedesktop.DBus.Peer" />
++		<allow send_destination="org.keepalived.Vrrp1"
++		       send_interface="org.freedesktop.DBus.Properties" />
+ 	</policy>
+ </busconfig>
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
index 204d2fd116..ca476f8605 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
            file://0001-layer4-Change-order-of-include-files.patch \
+           file://CVE-2021-44225.patch \
            "
 SRC_URI[sha256sum] = "103692bd5345a4ed9f4581632ea636214fdf53e45682e200aab122c4fa674ece"
 UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"


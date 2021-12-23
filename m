Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76804C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 18:51:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.36828.1640285510079370861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Dec 2021 10:51:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YFw/u5vd;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id bm14so24852163edb.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Dec 2021 10:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LUlWRS+NARhFrPAQHHgcLndRM4vCE/JvfL+cbBJieGA=;
        b=YFw/u5vdIkX0hMrZqs7hKEa1c+F7i2yRj8HUynjqUxBwvH4Ib6dnfgie6psBvBskGw
         Vjn/CXhoCYIUAVr5Ei5xIOfFiS78PIrYZudAzW/+bGFLkzdhBKU+MrCq73IiqXIYbnRk
         tCO7g9FiQOxKpedA6e8hQo54Uz16d9J/iQRkPhaZIDwsPM1UoYjsFspJniT9LB9M0oRu
         efq+rnsryKkqDe+sRhRaMpbYsALS+OvhdywnYXk/jO9cQAUgAWTDkvt41wJw96hTgQpV
         Kz7AhOD/oKYs8fTvSU2YChU0x0Zed69d1cyn056skysO5+PDOSMxxzp1InX1yN2f797I
         Xv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LUlWRS+NARhFrPAQHHgcLndRM4vCE/JvfL+cbBJieGA=;
        b=vucmvHYR6nUaVEnR+L9OKeCKrz1T1bpTwqMPBYha3ncdlyFgXuWfvIw5rWUllSVZOF
         k/rluPjL0GsEFB4M9tcu/b4FXmOCra19MEh3eykQ1F4PJ5s0vJ0liyXlHdw9mBWR1it6
         yXQ/1aLjGZnKlxK7GkKldBBdkqOx0eWd7XPnZMFdh3NEfxKZEiYZtNvUzlcsASrTbIaW
         uKg9PtHhtxtZQd5fjT+KEAJdDw0x3P0he5qvfGN+uDdceouR8quPGbQYgX8Qhm6R3j3C
         kMtQ9L2ne7CDeIWmDpUuTg4zu6CK5t/cGYrIxIVtnL1P/66OJF3K4OZ5X1doQxdAyTy1
         fbUg==
X-Gm-Message-State: AOAM531vYpreqvzNN84DpzzPeMGZMrdexhTbgjpl7VAwUEw29t0O/9KT
	a/u1JlBT2B/IUFPqM7oN3rNfI5V21PE=
X-Google-Smtp-Source: 
 ABdhPJy2hvnZJEoRBXfn8l4F50MAnEw0aX+K1WZFGh08eiqxmVbcuVLXJkRrX+WjWdovUTXmY3JLLg==
X-Received: by 2002:a17:907:6095:: with SMTP id
 ht21mr2841489ejc.67.1640285508285;
        Thu, 23 Dec 2021 10:51:48 -0800 (PST)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.googlemail.com with ESMTPSA id
 a14sm2257367edt.95.2021.12.23.10.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 10:51:47 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: fix for commit
 8554624cc7f84e6b63b2ea4b94ee5fd2821021ca
Date: Thu, 23 Dec 2021 19:51:32 +0100
Message-Id: <20211223185132.52980-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Dec 2021 18:51:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94488

The previous commit was using a PACKAGECONFIG to enable or disable
the sending of anonymous data to Google Analytics.
This was giving QA issues.

Now the variable 'NETDATA_ANONYMOUS' is used to enable or disable
the opt-out.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
index 6824dd725..dbce1c432 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
@@ -20,9 +20,8 @@ UPSTREAM_CHECK_URI = "https://github.com/netdata/netdata/releases"
 
 S = "${WORKDIR}/${BPN}-v${PV}"
 
-PACKAGECONFIG ??= "\
-    anonymous \
-"
+# Stop sending anonymous statistics to Google Analytics
+NETDATA_ANONYMOUS ??= "enabled"
 
 inherit pkgconfig autotools-brokensep useradd systemd
 
@@ -62,8 +61,7 @@ do_install:append() {
     sed -i -e 's,@@libdir,${libexecdir},g' ${D}${sysconfdir}/netdata/netdata.conf
     sed -i -e 's,@@datadir,${datadir},g' ${D}${sysconfdir}/netdata/netdata.conf
 
-    # Stop sending anonymous statistics to Google Analytics
-    if ${@bb.utils.contains('PACKAGECONFIG', 'anonymous', 'true', 'false', d)}; then
+    if [ "${NETDATA_ANONYMOUS}" = "enabled" ]; then
         touch ${D}${sysconfdir}/netdata/.opt-out-from-anonymous-statistics
     fi
 
-- 
2.25.1



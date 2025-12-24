Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF12E75459
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 13:35:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.120547.1766583322305156656
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 05:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RWrEyt7P;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae77516so53774485e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 05:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766583320; x=1767188120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MvTTl1C/yYN0zl+KtN2R773SSfobNrn0EsghUiA5Ot8=;
        b=RWrEyt7P9QWOaCchlnnfywfnnkwTZgaM6StvJTXjYeCWqI7XebFvwc+aqKOJu7FYc2
         ca3Zfz9Lp6zrFvhvbhJA+IFGGltlC9jE3opeSdjAViaU5UT2PqjtKGdbnW7bCx3oct+z
         LqzgKZmpAd3pE9jmrxRnISS0irZrkzNGFmmtmtbXqUXDOgdGkurhVHOXiNupp+S4MkU8
         Ea+E6aXujY1VrPmavbhpZfDoYu1YBcIntV3fqzoPtD+pQJip6wYf3814Hp4Xacik84pq
         2WcmZaiVHn22B6SBJ+seZmFGz6L33GHxyqK6LI65c14pORjS87bxXcTWW7E6nbbp0Spn
         xd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766583320; x=1767188120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvTTl1C/yYN0zl+KtN2R773SSfobNrn0EsghUiA5Ot8=;
        b=cAfDAW7tld837dCmRsLU0ri6cIi2WwAECMGieU+JD9eXSDLzek7OOeDqjunN5HdD/l
         e17/J3dlgnCR63S9qLZNNDUNsuki7uUWleuEMQaBKJol4RKt+6A9GWGghXmHC8UlHO9w
         yMblLoQnW04ehjJMx2GlOm8jIFEKYZJdkPP+e3v1vK4RvGI6JMotmbnTi0aE45K0vGjF
         VcPAFWyyBPuWKRoVCMg7/aPGRabXvyA3cLU/iGOekt2pSwDyzB9DphNzcjtMUw8at7W0
         R8zTgkkpjyOzbn95RYv9RkHokAfw3DuDwdENoiVVCnjiLQNocx7jAfxMunWRpkAWW90I
         jCZA==
X-Gm-Message-State: AOJu0YwBPxpS1plK4/8MLt3QizJsuiCBoyjCSJ3AI4pgnf/2ve1BNE0s
	by+k2xemueGGr7sxwxVg6mNAnLwutm6VFzdqw+Wg/pZzrAHjQgO7tuYQUe0+fA==
X-Gm-Gg: AY/fxX6iSxx245MwgUXFTeHWiLKuZmyRhbpqWP5pS60WoaO8wdltPctGTQ8gblxh+c7
	FMHgFzzlWu4i29CEZJSgshpFjtx7phs+VoERMXqip3kYjeGqlUmrJSNZYiivRLg3MFxabxnwqXq
	7sNyjLcw/SPQN/jmJbP9kuGzAsHI4h70SOa0stOCR7zYWjDIPHNA+sa9lR1XlqFhUIuVvLXHNi1
	PWrQ4Lzxbf0PIAGswYVjVsrMECFXolYUJPkejk7eZldEi6aMx1z+xe/I1J3cI3QUIcIGT49YlLs
	BTVZHsrGtylnLcjyzsTYKWTLRVjDzHiuSoWrHeo4J2ulWHiqy3zSOsneOEBpMfHK4uF5f7QIJ84
	VaMneG/4AxgrYAhDoL9tO3R12ch72+GRXCzMPJAPO2eiA2cbOZZ8VIwnM5BjeXD+WIWrI95SC43
	SjVWNZmULM
X-Google-Smtp-Source: AGHT+IGdSn19dQPzY3b9hs9KzFX7w2buBw+g657AP8NJNda1/c7xtxAmZ9Lyjk7V9wbORT9VFiCuRw==
X-Received: by 2002:a05:600c:c08a:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47d197f67edmr136764305e9.27.1766583320274;
        Wed, 24 Dec 2025 05:35:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm35104136f8f.17.2025.12.24.05.35.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:35:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] zabbix: patch CVE-2025-49643
Date: Wed, 24 Dec 2025 14:35:19 +0100
Message-ID: <20251224133519.2060349-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 13:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122885

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-49643

The actual patch was identified by checking the file that was modified
in the tag 6.0.42, and also by looking at the Jira item referenced by it:
the patch references DEV-4466, the same ID that is referenced in the
Jira ticket[1] referenced by the NVD report (look in the "All Activity" tab).

[1]: https://support.zabbix.com/browse/ZBX-27284

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../zabbix/zabbix/CVE-2025-49643.patch        | 38 +++++++++++++++++++
 .../zabbix/zabbix_6.2.9.bb                    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2025-49643.patch

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2025-49643.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2025-49643.patch
new file mode 100644
index 0000000000..33566777bb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2025-49643.patch
@@ -0,0 +1,38 @@
+From 6677023e3d48faa83d011c0d9ec241c9e617ed78 Mon Sep 17 00:00:00 2001
+From: Ginta Berzina <ginta.berzina@zabbix.com>
+Date: Mon, 1 Sep 2025 14:10:12 +0300
+Subject: [PATCH] ..F....... [DEV-4466] fixed resource usage for image resize
+
+CVE: CVE-2025-49643
+Upstream-Status: Backport [https://github.com/zabbix/zabbix/commit/aeada86d3c8231e1e173c6a7ac19ea60bf899b86]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ ui/imgstore.php | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/ui/imgstore.php b/ui/imgstore.php
+index 125b3c3..04663e8 100644
+--- a/ui/imgstore.php
++++ b/ui/imgstore.php
+@@ -34,8 +34,8 @@ $fields = [
+ 	'css' =>			[T_ZBX_INT, O_OPT, P_SYS, null,				null],
+ 	'imageid' =>		[T_ZBX_STR, O_OPT, P_SYS, null,				null],
+ 	'iconid' =>			[T_ZBX_INT, O_OPT, P_SYS, DB_ID,				null],
+-	'width' =>			[T_ZBX_INT, O_OPT, P_SYS, BETWEEN(1, 2000),	null],
+-	'height' =>			[T_ZBX_INT, O_OPT, P_SYS, BETWEEN(1, 2000),	null],
++	'width' =>			[T_ZBX_INT, O_OPT, P_SYS, BETWEEN(1, 200),	null],
++	'height' =>			[T_ZBX_INT, O_OPT, P_SYS, BETWEEN(1, 200),	null],
+ 	'unavailable' =>	[T_ZBX_INT, O_OPT, null, IN([0, 1]),		null]
+ ];
+ check_fields($fields);
+@@ -58,10 +58,6 @@ if (isset($_REQUEST['css'])) {
+ 	foreach ($images as $image) {
+ 		$image['image'] = base64_decode($image['image']);
+ 		$ico = imagecreatefromstring($image['image']);
+-
+-		if ($resize) {
+-			$ico = imageThumb($ico, $width, $height);
+-		}
+ 		$w = imagesx($ico);
+ 		$h = imagesy($ico);
+ 
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.9.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.9.bb
index 13cd081b62..a3035026f0 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.9.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.9.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/oldstable/6.2/${BPN}-${PV}.tar.
     file://0001-Fix-configure.ac.patch \
     file://0001-initialize-msghdr-portably.patch \
     file://zabbix-agent.service \
+    file://CVE-2025-49643.patch \
 "
 SRC_URI[sha256sum] = "a2325be57b8027bb340bb602c33f8092165dbce4da562301c03867101a21efa6"
 


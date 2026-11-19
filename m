Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1945.1795113467074618102
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Vr/6S/TQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a05b210703so84493b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113466; x=1795718266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FKr6IdO3AGErrp84q6Y01mG8CJRDIV41AlHUtn2j/s=;
        b=Vr/6S/TQXfsrch0zi7ZzQ+QkpWaSyYqA6q0do4YDyScpRuE5nzUcNgYeRCUf10Uj5L
         jcrecmp+ogURau3Ouc+Wnqa/WaafGOXxkHSM8D9GyBN8YWUWAWySJ/q9Pf0tVJXSfond
         yLRFELiDfwSiXChNUrTgYv+cZ6eCSqM5ynkbacC1is27pNmIIhMpEuh/QwGo7YwqrrUb
         oeatQm3eRj3s8ZAsj9CeqvbcQozdR8c8phKMwcOMBSLeyJ0pAOujfRYDwI5YMtc1yLKQ
         0kM0Ea848QLQlcJhDpKsTsUnfaCTD9zp50fJ2vm3kK6BeNgQmWdFZECYK5jpR6cb43XT
         agdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113466; x=1795718266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3FKr6IdO3AGErrp84q6Y01mG8CJRDIV41AlHUtn2j/s=;
        b=PGuoFSwhdHm0hyBjxZxKpW7alGCtj5S/foRFVqCgq7kWMv9tdSYjlwfhRC3lO+IEnb
         zAh4aBqcEThEVSqkSoMwqCBwypSfiAMyFXv6sjZNacIUK0LoUR1tAPOziGoEMBUvkVPe
         lHSR5RJ3vCDUcbLSNlqf1Alyx+S4Z0c2aQ9BNHtSdmkGmZMsQ5NUHDkvR4Kfnuy6HZIY
         NxFnYjxyPDtj6KptdBkxmS02xrqGp4WIXhjmGNl4f3c16pBuZrc/E/y2Id1lSg/mSDiY
         ZqNzCXRci50gTBXYJ51/0bYNnKeSsMzjRnqXEdg2p/s1kRk1fVUEP8RpInZvd+Z1b8jm
         Avyg==
X-Gm-Message-State: APuU4Z8zhB3k9JkzRXnUssbZQySGqRX7spECMADT9eSY2P5cAFzRxS4p
	sEB3FZad8PkdWAshD3P+oFv+cNp8LvW0QOWAwnfetNSR75QtRILd/Ke9mkjDnQ==
X-Gm-Gg: AYBFou0j9TMimMPsMNv/B8cwExjlLeAHvb5P8Zq0T/QworIsLEglhYwZYCSwEFgSXHV
	7eSHE2zabeEuqEwwFogUa8HQl0uQ1GvISna7KUb17FBpW7FaZngJ6EnhKjy0YWSWc9HGAvp+5G6
	S7tR/4QhWfsIjKSc2KJ8zgmoGnAO6VKHxyWf3qD3MBgAFJGPDO0ytm4H4Ny4K97Br1PWKR5o+3M
	Z414SjZWPQWOxt+Y4b9XQsReBK7mKfmjf2J8QD4Iwrtc88o7cqiorlmshLbQHFrzUMy3JmTXu6w
	h5dvRlBzSo9Xck9cQ6O8QJLlHOsCdYzAFnANGILZ9zRDex9BuYK8REg9hNKDTM31RJJS2XCodFs
	XKPoIDWd5n/u56vjyhjrIXIxUixWzDx7H1x7xHDHlWi1LAnTf5mBUbyfP+w6oeLqkFt8xHre3WJ
	nSJdIuCIrh/8vTsbSZnqKUgVHoxoCxKjVUKk6FHCLooEurz500Xk1wbuYSTyFtpZXkJxJ9VV8BL
	7nBPUug26VDUMyfq5pNu7yQzRsl9gN/OOT44K6qb8WlF4OjUkHCsDD11kc8Y71DCHFuL8cV4DiL
	eSDyw/+TX0BPw0QTPjXWeVEAWY9DIT/mYx0tyU0dxIFyfF7nNr9Z0btKFmCl7g==
X-Received: by 2002:a05:6a20:2f98:b0:3fa:43b:3b86 with SMTP id adf61e73a8af0-4014bc4a0c2mr464044637.47.1795113466419;
        Thu, 19 Nov 2026 10:37:46 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:46 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 44/64] webmin: patch CVE-2026-125392
Date: Fri, 20 Nov 2026 07:33:12 +1300
Message-ID: <776f734c4f01992a64106eaee3bb746f2a13cdb3.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132734
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-125392

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../webmin/files/CVE-2026-125392.patch        | 26 +++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_2.653.bb   |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125392.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125392.patch b/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125392.patch
new file mode 100644
index 0000000000..f357eb703a
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125392.patch
@@ -0,0 +1,26 @@
+From 261c858c1f09b734add7239b835c1085eab3106c Mon Sep 17 00:00:00 2001
+From: Jamie Cameron <jcameron@webmin.com>
+Date: Sun, 8 Nov 2026 17:20:57 -0800
+Subject: [PATCH] Add HTML escaping in all-records mode
+
+(cherry picked from commit 224cbd91467c98c3147df695fe9abc8149183356)
+CVE: CVE-2026-125392
+Upstream-Status: Backport [https://github.com/webmin/webmin/commit/224cbd91467c98c3147df695fe9abc8149183356]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ bind8/edit_recs.cgi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bind8/edit_recs.cgi b/bind8/edit_recs.cgi
+index 2141c0a12..627143b37 100755
+--- a/bind8/edit_recs.cgi
++++ b/bind8/edit_recs.cgi
+@@ -268,7 +268,7 @@ for(my $i=0; $i<@_; $i++) {
+ 		if (length($joined) > 80) {
+ 			$joined = substr($joined, 0, 80)." ...";
+ 			}
+-		push(@cols, $joined);
++		push(@cols, &html_escape($joined));
+ 		}
+ 	if ($config{'allow_comments'} && $in{'type'} ne "WKS") {
+ 		push(@cols, &html_escape($r->{'comment'}));
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
index e4380e16a0..8598994a17 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
            file://CVE-2026-125391.patch \
+           file://CVE-2026-125392.patch \
             "
 SRC_URI[sha256sum] = "9acc680d3d45cee876f36fc8810ce68bb6e44a0365e245a4298a180e0d016696"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"

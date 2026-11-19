Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1942.1795113462719190335
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=n/iKW5hI;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8c6c06b3321so104106b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113462; x=1795718262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJ8Sqp2Qy8v/2Tm+GlgAu/UL6bsjajOG1m6Q/zvsfgI=;
        b=n/iKW5hIdtsNpm9nMfZGA/Xn7gn3eVDdKNjcHg52eA0EaGoQ338cU+/y+Z+Fm+2wt2
         NZLSG0vrZvW0OjCRTGIJfePq9V8fo/jypqqOQmPa73DXPVW0tmzZew3UFuZ6Fqs3pAPg
         G6tm8uihN39XPLcXBLNpHvoSzxuKLppJjtjaAI3bM6QomOU9qOenUmhuGIft0pSSyUe7
         +jzJcMWlSAYnP4m9Fa5WYobpGY1riuqkHe9zAdcyEt2xPh/MDRYhK1kUzp59qCo1vpA+
         sqklZC9kckvsaFtN6PK6kKTwFKKGn7N9Ct5wbfj1jWlyMqh8BvOfC7llmhJmgoAEvjwl
         RRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113462; x=1795718262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJ8Sqp2Qy8v/2Tm+GlgAu/UL6bsjajOG1m6Q/zvsfgI=;
        b=ZLFbOFtJTkUqgq/Rw7ps9HEShxAlVwkbAjo42i+L1OtbL8c7nSvget1bUTAYY1xzNY
         sfWHYGBqFpyjG6Tp3edA+bRuMXbAspEotmix8AIgvEmJKt2LJmy6TO37M6NMq7iBeNbV
         3SzM449E6dtGvAba6D7PWnrbLPH+2JSKCzFj/m7E5ZPKG1n3nWCE76+aZrO1/QECWnGZ
         nvX4raiowpK3E4MtRom2RyTD/KDwAcxCybs2Lz3xNC8xzoNjy7iBUIfdaO7FwCJ9uiZU
         j3Ln5KUEZ2Wni90Ex+13O9BuZQZbdAA1jor02rBqXigkkcIs/nsHxaSewi0inC/b80rI
         29sg==
X-Gm-Message-State: APuU4Z+C2hbjV0azFXNoP3UiVdszojYK30vQajkwhYfP9UvafbPUu7NG
	kErMx1XKmesRN1G2+hPz4UDkhMVuyLy1u3rXBB9QWj72XONDwjDvTLWNeGaUSg==
X-Gm-Gg: AYBFou3VVWgmZZcZn5hLqK5W503Gvh11YwSbq0kywKjcqIfG0dqLzEN+F7MFjkzIzSY
	6bCP35UwPGxnFYFgfCvEYQziy6vHIacy6wznen72Tch+vArC+9SXHu3B7ZqN9U91CWW6r0QaIuo
	U55ldVStasyWEIxeZYI2aT6LeQ7SeWF8n24rXqeMHOKDfQ22c9WzdCmE5/SOwNx0auac1R98Df0
	rmxWhSvl+++kBvJpseCM8Bm5cWzIxp5PHKHPEAfxHmBPdEjq1mrt+3qC95HGIa+fk1Dh3vjnnD5
	UkoN759HM0bA1Qo1KLyRW16SHcLpemYs2s7OnPZbZfw9LWRo3vEeIAjAn+npfbYpNHD4nuwNosW
	VKxHDP9m9pu6mUfK/5XLzsprSoP8oBPBnF7fwjn7e6/0bK1Nad2VzkYdsvEnzVr8RMT3pVgUZ/j
	lZXGJWxRVlQrJ37h8wo2NIDHiI2twpDxc6qEc/4Ud3UUk75XAf8v3cPHx4ryjxeRqpNESufBWv1
	W6O9jJL8KsxxvQTVfMS9UlVE6AQqWZx3Z+kCgZYG/7cUI1fYLCc7Y633d9caSDQFjLfPXPg5v+Z
	musIeTN83hIH++RvnS+u/tagqq1BsEMhAkQaVDCIkQYvxjCuJt2f0IC9kNLkOg==
X-Received: by 2002:a05:6a00:460e:b0:8b5:7fc8:867a with SMTP id d2e1a72fcca58-8c87ce31324mr475290b3a.36.1795113462066;
        Thu, 19 Nov 2026 10:37:42 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 42/64] tinyproxy: patch CVE-2026-125371
Date: Fri, 20 Nov 2026 07:33:10 +1300
Message-ID: <e379c63cbfa12fcaa62fbd22fd6aee6289efd76c.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132732
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-125371

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-125371.patch | 70 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-125371.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-125371.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-125371.patch
new file mode 100644
index 0000000000..7a86af207c
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-125371.patch
@@ -0,0 +1,70 @@
+From 8c8463fb1a0bf7db82d3dfc6f363d5b339e96cd3 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Tue, 15 Sep 2026 06:42:05 +0000
+Subject: [PATCH] acl: use hostspec parser to disallow suffix hostname matches
+
+the existing ad-hoc parsing in acl.c allowed an attacker to
+use e.g. an "untrusted.net" domain name to access a reachable
+tinyproxy instance if it had an allow list entry for "trusted.net".
+
+exploiting it would require that the attacker has prior knowledge
+of the instance's configuration or is damn good at guessing and
+well-budgeted to register lots of potentially matching domains.
+
+fix by re-using the existing hardened hostspec parser.
+
+closes #627
+
+(cherry picked from commit 3991ac8f98c6a9f05b3265018b812dbf2ca92c28)
+CVE: CVE-2026-125371
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/3991ac8f98c6a9f05b3265018b812dbf2ca92c28]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/acl.c | 25 +++++++++----------------
+ 1 file changed, 9 insertions(+), 16 deletions(-)
+
+diff --git a/src/acl.c b/src/acl.c
+index 2d141ba..db526db 100644
+--- a/src/acl.c
++++ b/src/acl.c
+@@ -105,7 +105,6 @@ acl_string_processing (struct acl_s *acl, const char *ip_address,
+ {
+         int match;
+         struct addrinfo hints, *res, *ressave;
+-        size_t test_length, match_length;
+         char ipbuf[512];
+ 
+         assert (acl && acl->h.type == HST_STRING);
+@@ -153,23 +152,17 @@ STRING_TEST:
+                         return -1;
+         }
+ 
+-        test_length = strlen (string_addr);
+-        match_length = strlen (acl->h.address.string);
+-
+         /*
+-         * If the string length is shorter than AC string, return a -1 so
+-         * that the "driver" will skip onto the next control in the list.
++         * compare the reverse-resolved client hostname against the ACL
++         * entry, using the shared hostspec matcher so that hostname
++         * entries are matched at label boundaries: plain entries match
++         * the whole hostname exactly, and leading-dot entries match the
++         * apex host plus every subdomain below it. This prevents
++         * suffix-collision bypasses, e.g. "Allow trusted.net" must not
++         * admit "untrusted.net" (GH issue #627).
+          */
+-        if (test_length < match_length)
+-                return -1;
+-
+-        if (strcasecmp
+-            (string_addr + (test_length - match_length),
+-             acl->h.address.string) == 0) {
+-                if (acl->access == ACL_DENY)
+-                        return 0;
+-                else
+-                        return 1;
++        if (hostspec_match (string_addr, &acl->h) != 0) {
++                return acl->access != ACL_DENY;
+         }
+ 
+         /* Indicate that no tests succeeded, so skip to next control. */
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index 46d3a4d7c6..86e7e906b1 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-54387.patch \
            file://CVE-2026-55202.patch \
            file://CVE-2026-54388.patch \
+           file://CVE-2026-125371.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

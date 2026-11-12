Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8302.1794467647586559469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 23:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GDoyP1FX;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso2946854a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 23:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467647; x=1795072447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJ8Sqp2Qy8v/2Tm+GlgAu/UL6bsjajOG1m6Q/zvsfgI=;
        b=GDoyP1FXX0sL/UKcjoFaf7exvygUrisVyM76sH3ih815kQLnknblF9eW84ZjUGLhPz
         g+W2jlUwDApSmr8tQhZ2T3ZvNawd5wuIrjyLJxbx35mLJk4RuJ5E5bZgLTLaP6V4SdCH
         y7eltoI63hflmO3cJ1CQp73LJD8ma3IcceDedB28sD4xj9tM569jGK7SBKVmGHAomvzX
         bsHiSL8oKx04nGqAajR5xzVsTwvsM1QvgP4psy4T8DkS9ixHWlCjA0Q+DuoKZgjkg3A9
         KqAQG4Um3qPltrnCSPE4SGmIEwKBuRE+NteKqkB4IdUp7uvvc+po09p+fXo3es8lIhug
         FaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467647; x=1795072447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJ8Sqp2Qy8v/2Tm+GlgAu/UL6bsjajOG1m6Q/zvsfgI=;
        b=DW2Pey4k7bLa+GQzjm37s3z22Nn3TQIkeZv9QXflPf7oPPuHWegYs5/faw0ItGIyNS
         1bpsKQrUWGVOuqrHfkbJlJDGXcVZWaohI0AgCjMppz0ekIsxQOQZi0Sd1W61epCArCyq
         gpug82AbWbKK1G+B2ok3WwKp3EI8FfKKQplp37uJtnX54QYgxZdKZCjvmn2Iz/iAui3S
         QP1mZi7EmRZVBNl2VRtVZavDI4Lpsj1BGnr2UcTSQAGqytiwA7a7HB/ts9c0ndv2nRV8
         542AJRnrpVH7LGIXlMj6ZVDK4UiJ0LfMiD0U427boIL+VpelZJ0WB0G7K9upiyssDDGq
         RefQ==
X-Gm-Message-State: APuU4Z9ZEvykyM0q8WWkmr2SJLdTzfPSng+LK6VILfeaxFiceuioD2+8
	Vtuc6FUm38kKt8mY8Mc+smWli4RJ6RgWHaisgbgBSppc1Fqfb0/rBk2AekUmAg==
X-Gm-Gg: AYBFou3g1E6xt6k02lhqOq1CYpd0DaGf48r9SZi1kUuEt0/awRoFOH1ES7lELXGY9Tr
	5W/FjzszRaQvUbwrGJnpGOW7X2AqfOuQIHF5HNFo41U8+DRKFMMtV+M5pwjuSxnW0A9v2ypD3Wo
	TV5pyFmcCarmPizcgX/2eN7r4R6RvpMbq2eJQZqayjxWi9Lrk7/xrAiCk/FKvMhrmpXTUJfk3TF
	LZpHqrvR5sQA1K05in6XnSXWaftTWka4EnpiE/eueoJ/rPNzvBey5mJZAqrBuWtN+Vrm2kC8myv
	UQ/qUOhHyoanYc+E3F5sY9NYTo/9ju7gewwNByxvhI8ULFTM3mNoRpF20AyWCBUs1GrDXKdwa+C
	nOcTZ1BDuLLSmQWAuBVFXVi9CDaT/PfxTfkAR1mrN07PKaDSBqh72pspMBWNr5fwPcynk24MsF9
	kL7WskZT61kbhJdByFMfSDderddgoPAkHBfX5sRiJn3PZiXzmjnyvRbofU29nScmxL1RjNOs8oQ
	zl6WSEbWQxdM6U4hlaBOcjqYTUeSYUhXY/BzpqY64ACyq620zvkdibUhlLi1WkirDbXw8ctqDRx
	ZI9VjfmOU2cmEHrTmFDbJm2Q7fDuma79IR4NkM7ALcc4XW2EyUxd08neXalSJ6VpVfFsuU2/EFo
	F/HOzVbw=
X-Received: by 2002:a17:90b:164b:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b182e940fdmr4488570a91.22.1794467646868;
        Wed, 11 Nov 2026 23:14:06 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7e062sm29018355ad.35.2026.11.11.23.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:14:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 5/6] tinyproxy: patch CVE-2026-125371
Date: Thu, 12 Nov 2026 20:13:47 +1300
Message-ID: <20261112071348.4144113-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112071348.4144113-1-ankur.tyagi85@gmail.com>
References: <20261112071348.4144113-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 07:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132204
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

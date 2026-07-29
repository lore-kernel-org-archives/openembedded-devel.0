Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC49C54F52
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:48 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3038.1785293082137869712
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=deu5JhCq;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1094124a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293081; x=1785897881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaOfoCKxWSwvRzqvgA174shU8TzA/oE2xnY9A9Vu7Ic=;
        b=deu5JhCqJEwxexIG7U3pY/6QZCSRd40Ji4xa8sUUAcmj4lWc99+XE5OA1AqJHQCEXv
         G79lbedHH3FS5Gl+FgxFwcvWlbUI/wwK9xVNXMvAMTJA0xcBFQ+YHXtyuyeCTl5BiNrB
         ZFdjwUzuXdoZw0Zuwt74+QXJYf127n9V0x3SO/E8FNCwl2N69M8PL0Nzj8+o6eRz3Ik+
         inBz3lyde5tdwsKVWNNdqBNWz0ziz0Le9pT4Ne7ckjXwsT9CE20m0kJL8hH7df/3vDgZ
         h08JRFaKs7dPszPbt7RsWxuoKUmzJMOGsoaSdkJcapjzaUev4cDLtTaHrKFV3DolMgiB
         WUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293081; x=1785897881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NaOfoCKxWSwvRzqvgA174shU8TzA/oE2xnY9A9Vu7Ic=;
        b=B0vx/aVBDeV3E12rRbd1hnPwFM1lcadU7dgyjd+FJpim72ef/6JYpmRXyLUWmypTaV
         JletrGsrhEAfV/d2KQdNkyUo1+uhQcV7JfQLEHICapUdcRxF9sPY1mvwZWLHk3izgf5j
         LAMXaUvc7y6Jmg2oqkNGUeNBAXcQGaG06lD0x1lyVU9INdMAyg4yOqICltQloGwBDod8
         nNUbJblbWbHcHjMjde10TdFBrI50MctHpq0ggoI0LrsvQgLXfLqLeRfR2+F9kB/PxxCA
         EuDm9wJ1jtBoux2di4xrGpSra8CZ5hEdXZeltfDwUXTilU/0UfesudoUyCRiJmwJ3c70
         h07A==
X-Gm-Message-State: AOJu0YzXbLn6pgQCODeZc8mX1JTMmBlNIUMf+yZbrYCTwFPjYs50N69+
	fVYMlqOuJiNhx+oy7W9pBCfwDMlWnIxG0mW75pJSw2XWJTVKsg1PqXaTgg9gLArk
X-Gm-Gg: AR+sD11coTTLJML2FJ03QJdc7h7cdS7AQxpPJbAj3qpDi0xCm7RpW0OVIbEcyp+13+h
	aC2KInl7StfjcKfgTyOdfYQR0SdnoN+dEui/aJz2crqHGnuyeoS0pn5+Gz18S9WiLdkDDItu5dm
	68sEEUVdbyvhOPMZNFXoKWBgaYbxSUZ7IoFkv4O7O77kYXNoOeiC6bWcBkKEEfXN0Ym0VKjhNSe
	1+8YBqgkEWMehNOv49YCcwqzynP9fyfBjXL2ZnRlGhGvA6UnVQSwE4d3cBvwwiqegyviMGx4cCg
	ZSWgVpp1LAAyiIiGJX22/obY71jI2N33HXvHdCuepmgSwomBTLXk87w6TPF0o8urCZc94It8NTy
	WbtwdyKxdfFThYMsQTqEwkCQ4LGRZGeN9WyV5eq0BbRpquBJiEx9Gur2phDkDSeN1YIcdJLhhjD
	mn+Ki/50k3j7swjDm0cidMuMH0NC4IgGUt6Wvo2Rtvm+Zv3n87WHd5VJyY1X3IWeVkYXnK4PtFL
	UwveYpyAJraJqrwwpWlYxzVj8Du5uxaDLqPodrIr61VAjRkN2CExF1HtXrqk/FxR+q+qTsyPEk2
	8ds8UWWSnxXIwOAJ2y0f8xMKfzxqXuyNcf+oob8W5EKJQM+J8BphPcLBADl0dmg8vaswbEPfFVF
	CPQ==
X-Received: by 2002:a05:6a21:151b:b0:3a8:800:bdf4 with SMTP id adf61e73a8af0-3c8e48e6c04mr519157637.33.1785293081443;
        Tue, 28 Jul 2026 19:44:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 17/18] tcsh: upgrade 6.24.12 -> 6.24.16
Date: Tue, 28 Jul 2026 19:44:19 -0700
Message-ID: <20260729024420.2328180-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128533

Changes across the 6.24.13 - 6.24.16 maintenance releases:
- Handle redirections in bracketed expressions, e.g. if { foo > /dev/null }.
- Recognize history searches in history expansion (!?foo<tab>).
- Fix !^:h and !^:t failing when no / is found.
- Add cross-build support for the gethost helper; add support for $?<.
- Fix issues with S-JIS handling; improve nls/Makefile.in compatibility hacks.

Makefile changed the gethost host-helper rule to use
CPPFLAGS_FOR_BUILD / CFLAGS_FOR_BUILD, which lack the -I. -I$(srcdir) include
paths, so the configure-generated config.h was invisible and do_compile failed.
Set EXTRA_OEMAKE CC_FOR_GETHOST and {CFLAGS,CPPFLAGS,LDFLAGS}_FOR_BUILD from
the BUILD_* vars and simplified do_compile:prepend to 'oe_runmake gethost'.
The *_FOR_BUILD vars are only consumed by the gethost rule, so the target
build is unaffected.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../tcsh/{tcsh_6.24.12.bb => tcsh_6.24.16.bb}      | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-shells/tcsh/{tcsh_6.24.12.bb => tcsh_6.24.16.bb} (66%)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.24.16.bb
similarity index 66%
rename from meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb
rename to meta-oe/recipes-shells/tcsh/tcsh_6.24.16.bb
index 058fe6a7c4..86529efb07 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.24.16.bb
@@ -13,13 +13,19 @@ SRC_URI = " \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
 "
-SRC_URI[sha256sum] = "e3270ce9667fd5bd2a046687659fcf5fd6a6781326f806ebd724f1e1c9cd4185"
-
-EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}'"
+SRC_URI[sha256sum] = "4208cf4630fb64d91d81987f854f9570a5a0e8a001a92827def37d0ed8f37364"
+
+# tcsh 6.24.16 changed the "gethost" build-host helper rule to use
+# CPPFLAGS_FOR_BUILD/CFLAGS_FOR_BUILD/LDFLAGS_FOR_BUILD instead of the target
+# CPPFLAGS/CFLAGS/LDFLAGS it used through 6.24.12. Those *_FOR_BUILD flags do
+# not carry the "-I. -I$(srcdir)" include paths the target CPPFLAGS had, so the
+# generated config.h (in the build dir) is not found. Supply the build-host
+# flags, including the include dirs, so gethost compiles with the native gcc.
+EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}' CFLAGS_FOR_BUILD='${BUILD_CFLAGS}' CPPFLAGS_FOR_BUILD='-I. -I${S} ${BUILD_CPPFLAGS}' LDFLAGS_FOR_BUILD='${BUILD_LDFLAGS}'"
 inherit autotools
 
 do_compile:prepend() {
-    oe_runmake CC_FOR_GETHOST='${BUILD_CC}' CFLAGS='${BUILD_CFLAGS}' LDFLAGS='${BUILD_LDFLAGS}' gethost
+    oe_runmake gethost
 }
 
 do_install:append () {


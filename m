Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33793.1794850380177395829
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:33:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ktdKhPoo;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so39610635e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794850378; x=1795455178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hY0NZVaj4CDoIXA/9jyGP5YZkc+VjNKaMlD2cb/bbOw=;
        b=ktdKhPooEI5k8JtSlVYxP61CZnGycUYw3SH5GvowfrHICGotxtiiE4yo0iJuLxUm4d
         ylB0jAjLMQxqgcOjt0DDizNBXs8agyK+Ss4YyZBMbVKnQRdwkzxcfyK7ObFCZrLptd/H
         1wK3aB7b7B7REgSX4nzR2GgSDjovz7wxnsb+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850378; x=1795455178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hY0NZVaj4CDoIXA/9jyGP5YZkc+VjNKaMlD2cb/bbOw=;
        b=JJYp6hrNxNQgYHxvuhd6MDd1S9bco3BfJ5KIo9khg10MM13yuLunVKmBAazTMdGeFU
         J1gOTWOF3k2y1rIfJFLaEnrgQ8eXipe6c9cnQIoAfeSIG+inZZkEgugjUaZZaBBT0AhU
         k1w51p5nF0bsCcrdeRcSqdESBk38c7f8aIuOUoMjsIxHDbAlvdYrdkkZY8AwC/4Pl0e9
         oFCGwp6R+AgiqBWsGsQXKHv5jhzWzbPPJBJ2zAUfETS6mGuZLgFyZu+WPAnajxEoInzS
         40/tOkSWW/VwPbj2JC1qlBWzuiJjl32visC80vB9r9wjkHjf4e4VSS6tkKbVwFu9rOL5
         HHuw==
X-Gm-Message-State: APuU4Z+6Oo6hEIZB60zvO+srQhZDV7UEw1tqkZk9uXV8rAuPZa6I3Ozw
	6exozComb/gHSt5ebWzX+Kt3fBBubf//oxL+8CxIbQ4hSnpP6tnVqTT5M+7tL9CtvMhhQLWIbFf
	emlrQ
X-Gm-Gg: AYBFou3kJuj75FTReTaIkQ5X7wboAQ9eMIx2mMd9hmGp+6K04B83Bk7GWP2AWamNbR6
	doNNfcyR4Iw7YSynOqqCf1D90gB3PDiwlkmeOenSgWZHNjHIdcO+rJDKiiiKKFKLB1rZrgS1ux6
	kZ3b4MUGFt7CPb9uyAxDGlLPJ/fynTmuQX8q02wTyHlbPOlyyvLT9fOJSPRHJBqsfkGDnMRqg/p
	dXfC2qCSqNOUHvycsveAkbGd+H3rB9XqQYkbL2The6lXDuYvIJGGmaQw9JsM0BA7hBquesyRSHB
	t/PFjLjpDlYXQRQuAC82EPXllFvgbhvtkAdnK/Ztg0pmnjaKh6JLpdtbm457PWkL/kGSHVkgkrw
	xp3XLUwcXhAhhQYhOpV3+3hpCmP8LlDMR1fes0DwvtLTC0fm1RMd2nI86KzwOlmdgH75B9NRR9C
	JKSg8PvEdUP8Uz5mVJpM51RtC61I3RsdxIrn3SMzcP+GCd4T5gIID7yRZdLF3PCsUV/4K8AG2XS
	+B67TuVVE8D3zHOUW7szmK97hLvC6qFT3dsJuBOP/YwCahfrTbG7ZshGzj89nkQq06zA0bW6n9x
	pB1EXkVxvWuH6k6Y6Te4DNWWvHb/DhJWf5PPOOZPPwJXshQVr5er6efUfL42cujwmuAO4/4sTvv
	qyQmlXixHOe+RSver/x7ytbu0ECWMxLGWPiBOSQRaTYUzW7MW7cWW8g==
X-Received: by 2002:a05:600c:8b55:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb55a02927mr229636685e9.3.1794850378249;
        Mon, 16 Nov 2026 09:32:58 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784231basm2988145e9.11.2026.11.16.09.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:32:57 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pycurl: Upgrade 7.48.0 -> 7.49.0
Date: Mon, 16 Nov 2026 19:32:53 +0200
Message-ID: <20261116173253.315326-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116173253.315326-1-leon.anavi@konsulko.com>
References: <20261116173253.315326-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132456
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.49.0:

- Fix test_readfunction_unsetopt hanging with a tty on stdin
- Fix skip location reporting in tests/util.py decorators
- Document AsyncCurlMulti blocking limitations
- Add SSH_HOSTKEYFUNCTION and some missing libcurl SSH constants
- Add a debug build of Python to Linux CI/CD
- Preserve pending exception across CurlMulti dealloc cleanup
- Ignore ResourceWarning in test_option_refcounting
- Fix Sphinx documentation build warnings
- Clean up the build system, removing dead and redundant setup.py
  and Makefile code
- Remove obsolete cruft from tests directory
- Remove outdated example scripts
- Move dev dependencies into PEP 735 groups and drop
  requirements-dev.txt
- Update LGPL v2.1 license text to the latest version
- Stop installing docs/examples via data_files in wheels
- Drop setup.py CLI argument parsing in favor of environment
  variables
- Remove dead Windows XP/pre-VS2010 handling, update OpenSSL lib
  default
- Add GitHub Actions workflow to build the docs
- Make releases a single dispatch-and-approve workflow
- Skip numpy for tests on Windows ARM64 with Python 3.10
- Make object teardown exception-safe and move Curl cleanup into
  tp_finalize
- Move CurlMulti cleanup into tp_finalize
- Drop the removed vcpkg non-http curl feature
- Use Python 3.12 for the vcpkg install on Linux
- Move CurlMime cleanup into tp_finalize
- Allow to free a mime that isn't attached to a Curl
- Accept CurlShare subclasses in setopt
- Clone and bootstrap vcpkg on all platforms
- Invalidate a mime part's subparts when its content is replaced
- Unify CurlShare cleanup into tp_finalize

Install README.rst tests/post_test.py:PostTest.test_post_file.

License-Update: Update LGPL v2.1 license text to the latest version

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pycurl_7.48.0.bb => python3-pycurl_7.49.0.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.48.0.bb => python3-pycurl_7.49.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.48.0.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.49.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.48.0.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.49.0.bb
index 1a941d86d5..cb24dce520 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.49.0.bb
@@ -8,11 +8,11 @@ SECTION = "devel/python"
 HOMEPAGE = "http://pycurl.io/"
 
 LICENSE = "LGPL-2.1-only OR MIT"
-LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
+LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
                     file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "b70961a76c412cd34f9cc2c9558e63f89fb37045c59eee396c585b52973be280"
+SRC_URI[sha256sum] = "d4327da9dea72768f942f831bbaa5a64adca4d7c89f3141da7a833d3c600ab90"
 
 SRC_URI += " file://run-ptest"
 
@@ -37,6 +37,7 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
     cp -f ${S}/setup.py ${D}${PTEST_PATH}
+    install -m 0644 ${S}/README.rst ${D}${PTEST_PATH}/
 }
 
 BBCLASSEXTEND  += "native nativesdk"
-- 
2.47.3


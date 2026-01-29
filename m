Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48FCD358CB
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 06:31:44 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9719.1769668296155037209
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jan 2026 22:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GlaXXlqk;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4801bc32725so4124695e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 22:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769668294; x=1770273094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ0jR4DGin5cRKW53pEz2i/xSP5Ws+adS+nQVxBfYgs=;
        b=GlaXXlqkrjBME/gY4eFtkvTGN9USqMzNnrYHanJlvrDrcOOEaS7qea/NoayKiuqcV6
         2ZG3WBUzhrvyHrkskwfhao6cDsSGAzRzdrg2faw0eJ62BMXkL6aZqWP15gbXza9e8Kr+
         HCupkk+5Dm01Q4IaBwrF75eKVxuNu8wbhAsmydeK3QU4wbfnJ0ffBfCXDRA8rZuzdaxT
         MQ8banMaGNF9iR7qLIWzTs43Yo9kAVAji4gpxMDL/gfQ1vaM0/CEhYBOPQWybMiDjHRf
         F999YqKcy1ronAY/C7mj1/cc3Jh51sSnbvwZ7borEfuDbebGzhACYwN90FaIlth4ut1V
         vcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668294; x=1770273094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UZ0jR4DGin5cRKW53pEz2i/xSP5Ws+adS+nQVxBfYgs=;
        b=ItzQuW88OvcL4hyzWHzNU6YXLtNcoiPJ9AwQvrVheyemFyWpA+qJjsY/cnItTj/YjX
         awU2FgKRw9xF4JKRoJaoREo0/U6KdtYM04rMjECygfZhMuH+kDieNFrrS70JcPyZtB/P
         1b+kSh+GC0brWlTXS50kbuYvAbr8B2+DGcIsyFy6cU0vjcJ5UhbYW0xrXt9nZ4Kq77py
         WGPlKdXVyESU5vDebyWKX+dFBkRXjgN0loFEGquKOA9lV24598nsOPL/rDLGGM4jpmgF
         FSBk+FYrFXGhralz0j/1nmRFIDxnoyLtfzOToWcpxyc36hVi7Mp02VXrohUaCVKp4hM4
         OWaQ==
X-Gm-Message-State: AOJu0Yw4v61YCR/9hcSUu1Q7UW6znV9hpw6ENY34/awPKzXBFkhk01Rt
	z1+45VDuJxJWNU+PeJMbXR7KLXsfcVfmm3dnigMECT19ReCg7lpra7Z9LxkUoY5Z
X-Gm-Gg: AZuq6aJjeSbWF2iIzukC5x5+k+ANccXBc/huqS1mvujYm0WQzl5KFYQTWT3gU9oJ6RY
	uvS0PN8KLDVrD8dQq2VNDoKvO3UitavAwSM1adeafnGAp6gI2rNv/YJRV2AEFlGHFLC3G3N+VZp
	AxVxRUEUCTNuuGNI1dRvEM181lnTyfvT2KIlhvcvsP45G+0oCay2XIKcVzE+wg/9oFD5FHnidvb
	Wcd6YXyyRH0kAoz92OL6RmIZsLFGQr6q+FKjNP+JdGMs7LLTauoCr5ACvETiEBHqiyinXEt6Pk4
	9LdFwTXUz5d7D5NBSwVdtQVOGOn3nkP25akWbmaHsw46uVkX8hEmZKHbEClUuKzs2+rwCAXiZbJ
	M3ywYYHj2D6PHWyUfR1QpmYV/0TYr3uyILcFtscwzluLk+MDbMTIMFfddW1oo1JKp/78nd/5ZHJ
	39peCXBfEd
X-Received: by 2002:a05:600c:524c:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-48069c2c45amr107640925e9.7.1769668294358;
        Wed, 28 Jan 2026 22:31:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3d1sm110750835e9.9.2026.01.28.22.31.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:31:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] libass: patch CVE-2020-24994
Date: Thu, 29 Jan 2026 07:31:29 +0100
Message-ID: <20260129063129.223926-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129063129.223926-1-skandigraun@gmail.com>
References: <20260129063129.223926-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 06:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123982

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-24994

Backport the commit that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libass/libass/CVE-2020-24994.patch        | 48 +++++++++++++++++++
 .../libass/libass_0.14.0.bb                   |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/libass/libass/CVE-2020-24994.patch

diff --git a/meta-oe/recipes-multimedia/libass/libass/CVE-2020-24994.patch b/meta-oe/recipes-multimedia/libass/libass/CVE-2020-24994.patch
new file mode 100644
index 0000000000..b0fc9297d8
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libass/libass/CVE-2020-24994.patch
@@ -0,0 +1,48 @@
+From 99eaa60314c4e28c2f0c295e165daf22c5601cc3 Mon Sep 17 00:00:00 2001
+From: Oleg Oshmyan <chortos@inbox.lv>
+Date: Thu, 4 Jan 2018 02:42:09 +0200
+Subject: [PATCH] parse_tags: don't recurse for nested \t()
+
+This fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=4892
+(stack overflow on deeply nested \t()).
+
+This is possible because parentheses do not nest and the first ')'
+terminates the whole tag. Thus something like \t(\t(\t(\t(\t() can be
+read in a simple loop with no recursion required. Recursion is also
+not required if the ')' is missing entirely and the outermost \t(...
+never ends.
+
+See https://github.com/libass/libass/pull/296 for more backstory.
+
+CVE: CVE-2020-24994
+Upstream-Status: Backport [https://github.com/libass/libass/commit/6835731c2fe4164a0c50bc91d12c43b2a2b4e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libass/ass_parse.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/libass/ass_parse.c b/libass/ass_parse.c
+index c83634a..991d1b6 100644
+--- a/libass/ass_parse.c
++++ b/libass/ass_parse.c
+@@ -650,8 +650,18 @@ char *parse_tag(ASS_Renderer *render_priv, char *p, char *end, double pwr)
+             k = pow(((double) (t - t1)) / delta_t, accel);
+         }
+         p = args[cnt].start;
+-        while (p < args[cnt].end)
+-            p = parse_tag(render_priv, p, args[cnt].end, k);    // maybe k*pwr ? no, specs forbid nested \t's
++        if (args[cnt].end < end) {
++            while (p < args[cnt].end)
++                p = parse_tag(render_priv, p, args[cnt].end, k);    // maybe k*pwr ? no, specs forbid nested \t's
++        } else {
++            assert(q == end);
++            // No other tags can possibly follow this \t tag,
++            // so we don't need to restore pwr after parsing \t.
++            // The recursive call is now essentially a tail call,
++            // so optimize it away.
++            pwr = k;
++            q = p;
++        }
+     } else if (complex_tag("clip")) {
+         if (nargs == 4) {
+             int x0, y0, x1, y1;
diff --git a/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb b/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
index 0e62307363..f0579ba25f 100644
--- a/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
+++ b/meta-oe/recipes-multimedia/libass/libass_0.14.0.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a42532a0684420bdb15556c3cdd49a75"
 
 DEPENDS = "enca fontconfig freetype libpng fribidi"
 
-SRC_URI = "git://github.com/libass/libass.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/libass/libass.git;branch=master;protocol=https \
+           file://CVE-2020-24994.patch \
+           "
 SRCREV = "73284b676b12b47e17af2ef1b430527299e10c17"
 S = "${WORKDIR}/git"
 


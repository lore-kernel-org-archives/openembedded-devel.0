Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0613AF30944
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:07:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41720.1772708836936146079
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TdAZAMSI;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48372efa020so70220685e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 03:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772708835; x=1773313635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0QVSjAY/97AJbT/R2eFzf1+ldJPRgBqB76tDwzlxNg=;
        b=TdAZAMSIs13GHX6GUCGacORUdi17rsHUskePNkldvfRVkhPglBlyKYRhaWVyi9OGf3
         Dba6TC/7zh3epsMiab7sy4MCDYXj0+OfjLFkQztKy3jEsHrf+P9UXjRgVfX3UFLbA3hz
         kbDdeouKX/DWJV1FFcy3kYc6QEBvCnX/RS9yZrx8+D8O8YoZqnfGfXmHGQ2U8t2feXba
         qND6tIHVrbN32L24ot3uRgwjLMa7LP8YXWdd+O0Z0lM4ypeAStcsgkUs/w/l9DJMb1/V
         ukprIMWapWXWFxMDmfpHgMkLB59JDS4T7q+flthY1B+PfsP09oWyFsDPttyHbrYsyRmy
         ntug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708835; x=1773313635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0QVSjAY/97AJbT/R2eFzf1+ldJPRgBqB76tDwzlxNg=;
        b=oRDCmNnBM0QfLt7euVeYnzB0P/gpTyJKvcp/oDRfDCecejZWY2IodFOcw0MurCjgWa
         iN+NawTMubTAApX5Po6LNHtTbb0ee9WrS2mXUGgAYD/OzNj+NtIPcqg3GQ9PIyNOSUTQ
         YID/ZSFiLnyrRfzmT1D9CWU9SCMEzQ8NyRYLQCqjyExZsLj4uBtpki1jbISYIbv7HVht
         IeiyZ9cpQzOpeAMyolqf3StAy5QXVDK5UdOilW/TeYd0ReMthS7lFNtMjhLFx4WRbozG
         jZklgi/luWd26/pW2mHLMAAiyF60t8lbSQg8dozkUc8ZCulJdHYJ9KMqm859BBphaVdw
         7Bug==
X-Gm-Message-State: AOJu0YxYdo74t1FcH0LPbrF2KlFqiEEL1s0roPL13o1ffke1VyR2l9Kk
	tIR7T+TZyvbiq0GaqPPRb0vjyJuMYf0P4dWdKRaCmU0VKCUIelEivygGHR4kJQ==
X-Gm-Gg: ATEYQzwnf2imn8DbWv4MpOSF+8+uxd9MeNXJ1HJ0liFNobhl9cxBRZYaelb8nRn+Q1V
	xpZ4u6rmGeU3R/UFv+0fVyzlzbrerhY3vlecZo5fCqEafVng3qQk4n03B1XjQW5fBgOf0CsxNdU
	/8mriK9d+kGzTfJKAIMQkyVcjAWl4vUglYwdW7UgGVuN2gtaEMlIt6Kky77TX/guGUF7XG1MwtU
	c8EWcXOS8vPCi6x5WAREWAakrRWD9i7o6wWmGBslxqg1wjHwMtC8Z+phdGOqEmrRJQfA3UjTnx1
	rs56O9iuAyxnDknYDH3AaoEAjG79lHlNhkjeOKMEIrQFTBJ2Wqd8EDHe3QS/lnhn0glskpCaATC
	nnW5tffrxaOwnNINjRDx5/DCMf6aLYkhKp9Tc/iGplFeV3FKCJZPuy5Ja5wOivryYFedM58PxMm
	eSdROywFnN+xy9mCNhsJY4
X-Received: by 2002:a05:600c:138a:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-4851989ca9cmr101619575e9.28.1772708835129;
        Thu, 05 Mar 2026 03:07:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851faeaec0sm32269505e9.11.2026.03.05.03.07.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:07:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 2/7] gimp: patch CVE-2025-2761
Date: Thu,  5 Mar 2026 12:07:08 +0100
Message-ID: <20260305110713.2893128-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305110713.2893128-1-skandigraun@gmail.com>
References: <20260305110713.2893128-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 11:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124867

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2761

Pick the patch from the relevant upstream bug[1].

[1]: https://gitlab.gnome.org/GNOME/gimp/-/issues/13073

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2025-2761.patch             | 34 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2761.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2761.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2761.patch
new file mode 100644
index 0000000000..670f6d9269
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2761.patch
@@ -0,0 +1,34 @@
+From 658a8a07b831b82bd9e9592c18f21e4d4d7392af Mon Sep 17 00:00:00 2001
+From: Alx Sa <cmyk.student@gmail.com>
+Date: Mon, 10 Mar 2025 04:07:44 +0000
+Subject: [PATCH] plug-ins: Fix ZDI-CAN-25100 for FLI plug-in
+
+Resolves #13073
+This patch adds a check to make sure we're not
+writing beyond the bounds of the "pos" array.
+This is the same check that we do earlier when
+writing pos[xc++], but it was left off of the last
+write command. Since "n" will be 0 if we get to the
+end of the array, it prevents us from writing beyond
+that.
+
+CVE: CVE-2025-2761
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/0806bc76ca74543d20e1307ccf6aebd26395c56c]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/file-fli/fli.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plug-ins/file-fli/fli.c b/plug-ins/file-fli/fli.c
+index c2e28e4..209b5ec 100644
+--- a/plug-ins/file-fli/fli.c
++++ b/plug-ins/file-fli/fli.c
+@@ -1026,7 +1026,7 @@ fli_read_lc_2 (FILE          *f,
+               xc += len << 1;
+             }
+         }
+-      if (lpf)
++      if (lpf && xc < n)
+         pos[xc] = lpn;
+       yc++;
+     }
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index afb1cd69e5..a04b3d0e4c 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -53,6 +53,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2025-15059.patch \
            file://CVE-2025-2760-1.patch \
            file://CVE-2025-2760-2.patch \
+           file://CVE-2025-2761.patch \
            "
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 


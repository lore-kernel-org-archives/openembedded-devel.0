Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BD1CEACD2
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 20:26:37 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7806.1763151994352569622
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 12:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aZoYXxw3;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso13111545e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 12:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763151993; x=1763756793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fburcfYwsp5CB63O8ZWLHWsJPKuLhYvl39K2uu2fUN8=;
        b=aZoYXxw38fy3ZA/z3RLInwj11UYFvt94zGvjrZ4g9ujTQEto2OB3rMQGEEKsH3kOmU
         JD5jyYkT79aSbyru+Koh16nbwpqm2ragUzk/lGROFXtmNR7DT27qcO5/e22skd9gjmO1
         a5JG7N1OkeIyPjZGKnzWzk4RIvKkEA9B0CNOLbneNMJMJ5Ze4lpMpUjfgrBaxVJoJ2w8
         nHDy/mmYq81Im/WM+XxxMl3Di+63P8eWk+HSZCKOgnirAK40E4lJ33CXroDuWGHX3lKS
         KD0I0KNAHAul959aSbQf/HnChS67QWE1sMnErBOgtdHmhKq4LisCRWnu6zEyFro9RVAR
         lzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763151993; x=1763756793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fburcfYwsp5CB63O8ZWLHWsJPKuLhYvl39K2uu2fUN8=;
        b=lYNpUdweA5Zo7SaQvitVJWoVJSE0doNTkuWW8Mwul9Qxa+8Iq8P7CffcJ5ufgIZF6q
         dUvPBuRxn0i61ybpUHdsgopIbCmZn2SmOhBnT/h88DL68FC0tA3KfyIGCRH/dz9Xjy7o
         SFKcZd91YiStzYNptjw01NIUzOWqrY+Ybc5Q2pAcofpqVCM3RdlWRn4lmvDihLhl0vNO
         GP+jvmV9UbWD6dLJdyXg90YE/m2Ct5tcijH1mse2ryoL2+YfzVxisCyhubT5FtXsO0CI
         OKeBrWKPCm/9qpr/yUwsf+AxZ7H75AXJLjg4LVV99KxAnwHPfweOm0BA2I8H0siqLSu7
         FBYg==
X-Gm-Message-State: AOJu0Yy7rgX30uiGEde8hXPGIUyQsdbAd7XZNT6PnKQYuQgRRZWz/h9X
	bYdF68v1ylOEpljFHrMaGFGGSyN45AfP8j4ltQ5Io1WcXltqJm2bPUSbJcUJkx7m
X-Gm-Gg: ASbGncuLgIKg1hJL8IHMm8NtjwlCNuXNAuxjICYjAlPHoq5QuGNnDMO/jh5e/hv8w2S
	jJMTx+52xwX6HiH4weZRosD/tI4Rx8B5ziYY9usxQKaxqoF/V6aVZUFDgsEkNT+FmAaBik35eaF
	S7Ow5ANbI6fADVomiUG/wQ+Q/08YHiUNL5Z7lzCTTQ7BJ358HPxEA1znOaOj766Q1joBYuh6IS1
	DZD0ovZ6O9SupyExQHOAg0QzIbzp2ot97oy0sa73FvCw3TSA9knL5istYvWEweJQlHi0e04Y7nJ
	1dOA6Ccxjm4tJtC4b23609b3OgbzQZJ36NNTvgQ9WZV61TiSm+GPM2sbYNX/JEnBYIJ96kg6cmW
	mqr2DjR/8IiAhxRYeRsui4yHHLiQhQjD3uWBrf932vp7fVROxaLMbcuc5GSsO3PiSiMOA8gkSga
	p9UifcMPuF
X-Google-Smtp-Source: AGHT+IGGoPPqT5viMmfW9ny/QL1q3DtSTfbDL//BVbj3MzGYWBRN225NC7bGHctNq71+Jnowb/b2Rg==
X-Received: by 2002:a05:600c:4f93:b0:477:bb0:751b with SMTP id 5b1f17b1804b1-4778fea1056mr41387945e9.27.1763151992459;
        Fri, 14 Nov 2025 12:26:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779527a656sm23617845e9.10.2025.11.14.12.26.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 12:26:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/6] libwmf: patch CVE-2015-4696
Date: Fri, 14 Nov 2025 21:26:26 +0100
Message-ID: <20251114202627.656631-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114202627.656631-1-skandigraun@gmail.com>
References: <20251114202627.656631-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 20:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121720

Details: https://nvd.nist.gov/vuln/detail/CVE-2015-4696

Pick the patch that mentions the vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwmf/libwmf/CVE-2015-4696.patch         | 37 +++++++++++++++++++
 .../recipes-extended/libwmf/libwmf_0.2.8.4.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch
new file mode 100644
index 0000000000..bd5fc4d85f
--- /dev/null
+++ b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch
@@ -0,0 +1,37 @@
+From f743ef455dfb1faade0ca5290994087ef8b12a98 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Caol=C3=A1n=20McNamara?= <caolanm@redhat.com>
+Date: Wed, 8 Aug 2018 14:00:49 +0100
+Subject: [PATCH] CVE-2015-4696
+
+CVE: CVE-2015-4696
+Upstream-Status: Backport [https://github.com/caolanm/libwmf/commit/f47cbdf96838c2daa7b8e489f59e62371d33352a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/player/meta.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/player/meta.h b/src/player/meta.h
+index 3e13688..f86c5f9 100644
+--- a/src/player/meta.h
++++ b/src/player/meta.h
+@@ -2585,6 +2585,8 @@ static int meta_dc_restore (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrlis
+ 			polyrect.BR[i] = clip->rects[i].BR;
+ 		}
+ 
++		if (FR->region_clip) FR->region_clip (API,&polyrect);
++
+ 		wmf_free (API,polyrect.TL);
+ 		wmf_free (API,polyrect.BR);
+ 	}
+@@ -2593,9 +2595,10 @@ static int meta_dc_restore (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrlis
+ 		polyrect.BR = 0;
+ 
+ 		polyrect.count = 0;
++	
++		if (FR->region_clip) FR->region_clip (API,&polyrect);
+ 	}
+ 
+-	if (FR->region_clip) FR->region_clip (API,&polyrect);
+ 
+ 	return (changed);
+ }
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index e135b1764b..bb1aecd16d 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -22,6 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=ta
            file://0001-configure-use-pkg-config-for-freetype.patch \
            file://CVE-2015-0848-CVE-2015-4588.patch \
            file://CVE-2015-4695.patch \
+           file://CVE-2015-4696.patch \
            "
 
 SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"


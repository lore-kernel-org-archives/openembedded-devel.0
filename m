Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DF9C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:45:55 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24477.1786747552029928401
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cDXf4V+E;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf27856f9cso15541385ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747551; x=1787352351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/VQ4Q1gk6fryo+5Aum+gCgM1Bk4YxiB/XVGkYr7+rHE=;
        b=cDXf4V+ELk0f7aTr9KXZ1hykpGWXfLAV5FDdOCjvaRihlMGc/AlN8gBAWSP9LNZCwl
         rSvp/xqdiRqy2CV0zWjYQinF8UEKy3W5yTx1vK6mpAXxKWjeKUGFomxcCIyc//4d479g
         8j2DTZO3Hcr+E5WyXB1xu+66xwdvgt/U0K03Zan3jjAwfE3VMuVDbfoF69wT6u9TJSlL
         RsVJaeQO8VgoQSk4WOlhrMnrwLlzfifKPnbDPumKF1TXbpVwJMhzdyktHuQwY2wywKmX
         pRzpCNR9a0jZ4JSB82gvZmgZa5NQ2r0SU1nRTz21esfm+cEvTW8pJhQZbaGHpVj9kIm4
         4dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747551; x=1787352351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/VQ4Q1gk6fryo+5Aum+gCgM1Bk4YxiB/XVGkYr7+rHE=;
        b=CYE4tE8f0mTkcqxBSotnytW/FrJ4xttvkhVgzw2TrKs2WSHTsYFoFggf11Kz+1+c89
         RFojc0kSHbkSS+EyuK4l2ksKnqfvrWZckHRKVpRyhLJ+PogroDhC3QT699c8CBO7hwaO
         81ByuOiSF3ILNc1gyM9r23I60sOe5pa+W8hz6Un/+fG42aN+/CCzGYe19mvyrkzYHXQr
         6AgeW6cn+jmV33O9iSMDiYVoTQd0SI8q6qNdiQCMNMocIxhMPqWRB6yLg5YCRGJ+Xz73
         kIAuUANSnjATOGP8cx7BUZ9YDfhq0E3bu4c4lSDRDXob5nZ7JEvHg1rlm4QmJRDeZ2JZ
         /4Vw==
X-Gm-Message-State: AOJu0YxDRD2egwIMSifnUr65eHrmpxgK1sSLvGOkLQu1bVP4GbgwyIm7
	rP1EWBY5g0SZZ41UC6jN4cCmllO6QqWW8CFiLZSKlC6AyFjqZ7pjuvLZscVmrX0U
X-Gm-Gg: AR+sD10tDbYmBWU+QpzYMYL+FXSKgPuuU7a05N1utuus+cCZYNkZgjQ7lBshXi1GVoN
	AerIc2bVpIFck4oadHtR5EGNRJ6xaHLWGJvb116QSKFnmg9Pt/KL5e+6RfPp708LEUnngkh8MkW
	C7UlqYiEZccEHhF9H24/7exTmBEVXt9NMc2BZZ/Yn899dfRVcHAnpX5Rs/l9JtBw70GdUEpyXQJ
	XyfQ315I25FnW8gHECxKw7zG3c1ldW79Pld8VJ3U7cnPNA4C+/DDglPECutgmvOhu/Sh5w3qeuE
	QS8z+PS7/2awnTLoTnd4U0Rmrrw/OyxUUPfzC3Zns7EUrmNeRphWyEBpkYjYOElUWkvjjW7yZBP
	psVKuo+IYxK4IP8nXgcQSUAfIOgAowFax+qxfy19uCgXspxCQyBufJmW0W2vAs/wxfHnMXw+med
	4XAhqMe6nCeE+HIXwZuVZEBXf1gFT9jewmVRwiKRwhzmyTy7AkXVQ9akTWz6dMFZAwRYISLsODc
	9JZmZym/BS90K2mlp8gTeduYnRUt2rYyWl8IqcPtHI/TZ377pvyuau7J0Dxtwq8rjwd4CKiL/oE
	sBd9HYLMdZAcG6EAf79but9XuZ3XW9NVompSp0UCPhnOSCwPfqybhoo+ilib4za7P+qkR/zJrke
	cEMzV93XffDJRZXG73pJrnq6uQEBUbBv+DKYWxlvxW7P+tbNB2HjAFfUyPw==
X-Received: by 2002:a05:6a20:9183:b0:3b4:870e:6f44 with SMTP id adf61e73a8af0-3cc71de5b86mr10471015637.35.1786747551289;
        Fri, 14 Aug 2026 15:45:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 007/109] source-code-pro-fonts: upgrade 2.030_1.050 -> 2.042_1.062
Date: Fri, 14 Aug 2026 15:43:53 -0700
Message-ID: <20260814224539.1523174-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129071

Adobe's 2.042R-u/1.062R-i/1.026R-vf release re-compiles all fonts so
that the static instances correspond to the variable-font versions;
uprights are at 2.042 and italics at 1.062.

Upstream also reorganised the release assets: instead of a single
all-formats source-code-pro-<ver>.zip containing a top-level versioned
directory (plus EOT/OTF/TTF/WOFF trees and a bundled LICENSE.txt), each
format is now published as its own archive that unpacks a bare OTF/
directory with no license file.  So SRC_URI now fetches
OTF-source-code-pro-2.042R-u_1.062R-i.zip with ;subdir=${BP}, S points
at that subdir, and LIC_FILES_CHKSUM references the common OFL-1.1 text
(the repository's LICENSE.md is the verbatim SIL OFL 1.1, only the
copyright year and Adobe notice differ, and it is no longer shipped in
the font archive).  UPSTREAM_CHECK_REGEX is adjusted for the new
"R-u" tag suffix.  All 14 OTF faces are packaged as before.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...0_1.050.bb => source-code-pro-fonts_2.042_1.062.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{source-code-pro-fonts_2.030_1.050.bb => source-code-pro-fonts_2.042_1.062.bb} (67%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.042_1.062.bb
similarity index 67%
rename from meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb
rename to meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.042_1.062.bb
index 38a5126eea..069b290436 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.030_1.050.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-code-pro-fonts_2.042_1.062.bb
@@ -3,19 +3,19 @@ require ttf.inc
 SUMMARY = "Adobe Source Code Pro"
 HOMEPAGE = "https://github.com/adobe-fonts/source-code-pro"
 LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c7c16bdc2c96af797293d68503e5c65c"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/${LICENSE};md5=fac3a519e5e9eb96316656e0ca4f2b90"
 
 inherit allarch fontcache
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-code-pro/releases/download/2.030R-ro/1.050R-it/source-code-pro-2.030R-ro-1.050R-it.zip \
+    https://github.com/adobe-fonts/source-code-pro/releases/download/2.042R-u/1.062R-i/1.026R-vf/OTF-source-code-pro-2.042R-u_1.062R-i.zip;subdir=${BP} \
     file://44-source-code-pro-fonts-fontconfig.conf \
 "
-SRC_URI[sha256sum] = "da2ac159497d31b0c6d9daa8fc390fb8252e75b4a9805ace6a2c9cccaed4932e"
-S = "${UNPACKDIR}/source-code-pro-2.030R-ro-1.050R-it"
+SRC_URI[sha256sum] = "754a2e3ebb945ae905d720ac5896b3b34acc9546dd6551ef9536869788629dae"
+S = "${UNPACKDIR}/${BP}"
 
 UPSTREAM_CHECK_URI = "https://github.com/adobe-fonts/source-code-pro/tags"
-UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+\.\d+)R"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+\.\d+)R-u"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/


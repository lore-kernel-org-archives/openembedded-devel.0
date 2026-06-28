Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2B6C44502
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:27 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69145.1782634339783976637
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gDHiFDgy;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bc871ecdfso3061065eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634339; x=1783239139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Kmx5nglJdVpVdVhYwyLLE1O/icNQ4DdK8TeLbhqOrE=;
        b=gDHiFDgyNc7nhjvO+agL4PgMyS0kHZ0DHVeUEMcGFWo0TFJ1OtrADEZGSfrGpkg/NO
         1oAFqC8maWEWi7eJraj5JXHTcnZHiYcc5xAv+vjuRXi7rDrd6Wla1zfn6qC122pQtpGF
         PSipYx5T/7NNG/8gGyM37QnK06pdlgv/CvwvZ9SjiJNdMS0G/T2yGmw9BDoZE+w6HQci
         k7BkgkTQ8GlG6iXi7qlxhZaaKwfC0TBDiLQb06MGQXXyWRjGGn8PDq9QOEtZr290ZXf/
         NPSpMgdt4CIqrcZ4xltkIfaZA4rphiSrY8o0exq6tlZiiIShf4hKtmcIuolHdR/dMhC4
         LfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634339; x=1783239139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Kmx5nglJdVpVdVhYwyLLE1O/icNQ4DdK8TeLbhqOrE=;
        b=IZ2DtPmigKKAyHC9vDVym2cqImHdcQAcl2kTbl7fO19z2lHfw//dh6Tpvbm5FVKv4D
         bHFr6mkSjtXELXVkw9VWHZ/sXbdYeHVoIMj5zqPQBG5LRreG6AX62prT3b9doEy5TcJq
         YEkllFzUqa+voiVI0a0dD796KPQx1HGt3LYB2u4FGLXP23wjtsISIzqLhyv8V2vkFBEV
         feWZYWOzrQ/jwOspcfaknUDWaeuD5YxafGKbJ5Bg7OmbpPMjLdaX7HT/aaVori6mpG1L
         Xzmiyc0uDCHwcs7AtWir6hc2Rv5ZwppyIcCjofZYFEOEvQq/eTvG/Pa6hUMtEp/xKMIN
         K2Ag==
X-Gm-Message-State: AOJu0YwhvNY7ebEe9TdNAOkQHN3evnx3QQyeD6opqN++qCe6Jy60DAQK
	tFO+dz2M6ag2OOGUK/+WGVWVxieKJFYS8VG/aN06Q92O05qrQP7GaWcP/+n3WtjTY5I6hg==
X-Gm-Gg: AfdE7clrzNlKJtfaYkgfdRy1JKSKigCY3j+EG4eS72z54xjjP3LB6VgU3DIL4mkePCz
	VlISprfmlRAoS2qyLNixqkJBIVs02wj9BcJuX4RpDcRhHKzbsg+3ah/urvk9u8jqkwEDka4wiXY
	Is5FqjdC0zGOVA4Dbu5vjbpMhbYcLYMdSTl6DI7i2tT0lzgLAJbf6a2chB5hhdZPJISHDcn9TW3
	+Cb69Ph/TzfdmnUmrZZMIuyxmIiA4/0nxWer+kkq6XbrEpGM/NGRazaE3ms24XqGkiwxiue5BW4
	qS0kMFMkQ44WPfQMKTzOPaGEjEWml3gD4UecW9BXuOa621T4kmsdDl82nGHdPCIeotamViJU7Lt
	2Qe6ZJs/ACI2wrcumbEiVvdBdqTd97M1qKdTiSqrLKiS6wzEJO3l6nS8AQt2xzx6kS7EeObFCpm
	opP11LITMEGUqTdLgEjz6tNgBvy4dnF0/hhKl5vU3FWJWdyczUsTh6WQFvlrH4JdFuvl4XNeM1k
	oJZtsLnb2LJyMWbiMkUG2DUFY0x0+yZCa9E+19neVijzQUroQfC0T26QqR+89flwCm49+XkXWpq
	NQEvbzYEsnnbZyHyY+hsZBvif40rQw==
X-Received: by 2002:a05:693c:3944:b0:30c:ab4d:3829 with SMTP id 5a478bee46e88-30cab4d3bddmr5731470eec.43.1782634339161;
        Sun, 28 Jun 2026 01:12:19 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 059/128] genimage: upgrade 19 -> 20
Date: Sun, 28 Jun 2026 01:10:10 -0700
Message-ID: <20260628081122.178348-59-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127869

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/genimage/{genimage_19.bb => genimage_20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/genimage/{genimage_19.bb => genimage_20.bb} (89%)

diff --git a/meta-oe/recipes-support/genimage/genimage_19.bb b/meta-oe/recipes-support/genimage/genimage_20.bb
similarity index 89%
rename from meta-oe/recipes-support/genimage/genimage_19.bb
rename to meta-oe/recipes-support/genimage/genimage_20.bb
index 7d760825e3..8e7f59e9f1 100644
--- a/meta-oe/recipes-support/genimage/genimage_19.bb
+++ b/meta-oe/recipes-support/genimage/genimage_20.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"
 DEPENDS = "libconfuse"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/genimage-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7ec4fcb865662a8b2ff20284819044ffa84137bf3ca16fb749701291bc01f108"
+SRC_URI[sha256sum] = "397545be2fa52d482c5fba9a11897c61324bfc559ea0efb700b9edba7a807b55"
 
 EXTRA_OECONF = "--enable-largefile"
 


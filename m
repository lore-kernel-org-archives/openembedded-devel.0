Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FBCD5AE40
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 08:54:08 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2355.1765616042786187678
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Dec 2025 00:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SpqeFoYC;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-299d40b0845so28881115ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 00:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765616041; x=1766220841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAtHDrl592yNAk0D/yWT7VFEC35h8Pb6syyoWx4L/rg=;
        b=SpqeFoYCj71d8zAR+n8i1tdjQVaT3zlfzdvSqjJHo26g38o01VNHq+fXq1xo5ssDTw
         U8w3EBVV2xKZa4K7qHT9lrSBLeESja3XbteRcDyBkCjV/ECNqvxkX0+cVySyAA6RTLof
         EoUqHpvy6OFBCTTa8K1FtNsVJ2+SzCXAmDbQcJsSPhkYnGYpka6FiOqGGhrJ6XzwjNgX
         QQ17bdOzu7sCvFiKWlTRtNl4PGwGuaBTBmLNaFbwiOcFiDEThEwMoLFss+sG45J1LOy/
         019kRlH3TnMy2ZqQVvL1CoBPmLjEt5Fa4mRQwVS810ps/ybgDJyAm5EycYQUHEvow6tx
         zzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765616041; x=1766220841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAtHDrl592yNAk0D/yWT7VFEC35h8Pb6syyoWx4L/rg=;
        b=OUrjInGJirel4EvVbBxp2EIB7CAumDKxKpKDpAhM7r9f9/LYXZJKYGED5fsRjpIjlF
         TRHomA3oVeuyIXwaNfjE201vxHUIJhpvAScO2rFPJ0BmruNeXQ/cgYVXJr7KqxkaOil/
         fprPoUbFjg0T43k0hcTN3e+B+9O2uglJBZtZxpMvoZdS4pjDHZlHOsQcEwIyZHy8H5y/
         byCNNVPlY1OAMuW2IpAz3xMA+mAnG/clTcBAkFEhEn5dlMwMfIEgVZbsdNNRO8DhihAI
         Yy+rV6wIrqx8V+zLK1ojLZCMLNNTUs2XDnFoFSZdDy54LJcOP2SXjOkiBpH2exXfjRHp
         z2FA==
X-Gm-Message-State: AOJu0YwcMzRtgKc97uOkp4twEsfmYz6UBeikUqdW0KnoYRmDOsT9LKaQ
	3Rn14Zpy345FuaNTur5xFXi5CfnHOJUqGBc4i6bbc7uWUmIGnu+t9BW5BvMngCP6
X-Gm-Gg: AY/fxX6xslt5Mf/XVk3Mry7mz3eNJ2OoJo8EFylQ9ae2TBBr8D+dyQ9I6FJuT3dDh6I
	N1BxD4VH3A8kfcfkfPeG0zb4nNezx8YjfY5jCJ9EszmrCCl25X+ylbf8QMRhiimFzdV5degmmDS
	WiKkPyOjjposdp+4KtS441vGhj3oJLsLnY5FH06FrXKPt72nDRbMSwbB88glnzmPFpqegyqpqhf
	gLBE7IAPthA1XRtJcIZxkGmn7pFrxSS5UFMt8dkDuPmkGzcTUJwxV03Qm38W5xoXcmWpZ/c+HON
	D2HldFu+vsbUv0vRdN0uPSvR+3NZ/4sXWaZn1Gxr/JKWmb9Z41tV5C1II2+smQwKmrSR9zgIwK1
	e8yOdYHlnBL706YoQyL5grB22fKMN0MxulBSd5HYFQphpQia6C6tlj5RdbpU7D/lQLbDfmb/3d8
	j2k8mIvWjqirRe3K2RGh5HGts92eIvvZgC+/teGDFO9DQYfqGU9T1b1Uo1GmrcXHMqftRn52hHK
	z4c52wH8GKwFkw9XqXWwJCdtHjLdHMw
X-Google-Smtp-Source: AGHT+IGmtnB23pswR+Mzo0Mtx0nlLpb3wswgKIqKNtpXVszyPs1HFa0/gl5aGgMOtyTyuxbv+btzsw==
X-Received: by 2002:a05:7022:3a0d:b0:11b:9386:7ed1 with SMTP id a92af1059eb24-11f34c505a5mr3928707c88.46.1765616041446;
        Sat, 13 Dec 2025 00:54:01 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b46f5sm24537579c88.5.2025.12.13.00.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 00:54:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 2/2] initramfs-kexecboot-klibc-image: Skip for riscv32
Date: Sat, 13 Dec 2025 00:53:58 -0800
Message-ID: <20251213085358.958063-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213085358.958063-1-raj.khem@gmail.com>
References: <20251213085358.958063-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 08:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122638

klibc is not yet ported to riscv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/images/initramfs-kexecboot-klibc-image.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-initramfs/recipes-core/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-core/images/initramfs-kexecboot-klibc-image.bb
index 3a8d9f7438..a99e5d42c4 100644
--- a/meta-initramfs/recipes-core/images/initramfs-kexecboot-klibc-image.bb
+++ b/meta-initramfs/recipes-core/images/initramfs-kexecboot-klibc-image.bb
@@ -9,4 +9,6 @@ IMAGE_INSTALL = "kexecboot-klibc kexec-klibc ubiattach-klibc"
 python () {
     if d.getVar('TARGET_ARCH') == "nios2":
         raise bb.parse.SkipRecipe("'nios2' not supported arch")
+    if d.getVar('TARGET_ARCH') == "riscv32":
+        raise bb.parse.SkipRecipe("'riscv32' not supported arch")
 }


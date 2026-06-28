Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3D3C43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:59 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14767.1782634377420642497
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZipMxeNR;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30c99ccb1afso2236174eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634377; x=1783239177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1p5c5mJfpwpDdpcmovXImp9hUiXE9bczwCJ3rLMfLg=;
        b=ZipMxeNRdr8Zr1iZ3lWiFS6SU5G0/x6ezk3X/GicB7gPLN1gGjTyBGpcGmtuvo4ARz
         umSoAIc+7uT/21kxNr5bJEXdRmryqA8+9feZew/USSQJBboPmyI4BPZ3xLhnlxki1bfm
         fMNIoqHGW9A+sqUES2bTT3Op2VeLbX1ARkMdrngFiWFHavO92emXH+y3iA1MrkXbpo62
         TbpBlkVL3U+C2bPGc+k/OuZiUNLa/pwK41ltcR7TMtYVMLIv3Y2O0UbanCktObJfde/Y
         MP8gswpIemBNq0CrXztDoXdb2ZGBGjL6FTz0QTg7v1K2+cdoptGBUSquWNDnqqQHW7ud
         7cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634377; x=1783239177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q1p5c5mJfpwpDdpcmovXImp9hUiXE9bczwCJ3rLMfLg=;
        b=ECfdpGmQ8OvUpHWEULjNijJW+7iPcJRqvcki5FwIYYoSANDS2HU06oqLRN0GruyHE0
         xH6WmgTcqhLMCQWPlurum5iuQbadpwCJ9R1UcEaThKkCspSA0lih5XTrkWE3CdNydCaZ
         jqLuSj7CbDYtgJvCUvaaXI4X9cz760GPbFTbGIRZ8F+iAET9iUj0Rh2GwUsYnfUhx8bQ
         sP6qbVjnBeqTqbi4RlswmIb+Lu9rRJmvpMVqVXFRkAFdZeLfhncpCPOEawskF/jIRhTn
         lwf6f7yRVcH1gEXkFA6KFoXKdD7n9w0gGeM3XOd7OCcyN5x7x82GxDeATvvprqyjpmcm
         gUiw==
X-Gm-Message-State: AOJu0YzgqSg6rw/osKQFl+528HZsRX86yJOSKaA57h3v9jfVroMVOrxj
	cGJLUSHsDRn266WTHBX0gtYb/4SeI1YtPED8NM5PDpV1kWOevhO6kl603wmX86v+O2j0IA==
X-Gm-Gg: AfdE7cm8pkZ5LCFv+2VYs8oivwvl4XgDoapQYLi5CDiBlJz90ONs47jyAeqKOzLhDK4
	ZEjeVQtrmjeHKbFCdl5XVWJlD1rzz61xyBKSROCO+AoIAjhQXjwA5YifybgkkH1vxnVeNJ7ZpcT
	WVsqCMs+u7WJ9TU5yYOTSppCfvGH/GzRWjXMgOo0rMlCfVCvC+zHIY6QqgGgNeA7+b4I628XLD7
	Vrvr1vbWtxckcg7LxFc4xaxUX6ykZuFvqc3doBbmPCpJmRLfGPbrKNIb5V0KI8mzL3qJ804fHOg
	+G3s+ZFA9uizRRvYpJa2aAYToBGRpW2TT/krilk1Uk9BC+J0HAwER4xeDwVDFKxjIofbnclrnOE
	dKrBCMon6uUI4KJpyVPYKG61lGdeJpxlhwe3T2o0ayaBU4VxsIVrMbyE3CFeqcCuEQTC465djli
	syW/kj4DumqJEVwMo5FvXc2MkudjBzfUj7zLyfpFqkM3LkNHgsS2uNTY4zcFWr4FNNymgoiWxmQ
	ucNzbEXtrf1rcqwkNuS1kfMgTsJIlyH+iy7tQkzpD+KxvTlT+Gbc3Xe9bAfMPSclb78E8sFEwAv
	lkMIHfhYcKdIpQJu1aTamw7ZbizUwSu/ZqBSay17
X-Received: by 2002:a05:7300:3b2c:b0:30c:50cd:840c with SMTP id 5a478bee46e88-30c84db3032mr12466097eec.11.1782634376742;
        Sun, 28 Jun 2026 01:12:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 100/128] libcamera: fix malformed -Wno-error=array-bounds flag
Date: Sun, 28 Jun 2026 01:10:51 -0700
Message-ID: <20260628081122.178348-100-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127910

Drop the stray trailing '=' that produced an invalid compiler option.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
index 9be439fdf1..2b351a39be 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
@@ -101,4 +101,4 @@ GLIBC_64BIT_TIME_FLAGS = ""
 
 INSANE_SKIP += "32bit-time"
 
-CXXFLAGS += "-Wno-error=array-bounds="
+CXXFLAGS += "-Wno-error=array-bounds"


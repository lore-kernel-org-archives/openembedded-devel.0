Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D261E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 11:05:29 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.15789.1736507119685344996
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 03:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RMezuTh1;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21669fd5c7cso31277215ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 03:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736507118; x=1737111918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tf4ZK+wM4Kasp9zJMhepERZ/ZEptTn5pA/1RGLQBNgo=;
        b=RMezuTh1oSP3pSx2iwzEIYAUwoE9GTlf6Tifc/NdAb7u3TnXAHMFtpMeVNu/fkwecE
         GOzeTx8Avr/QauRZZloAm0B7MS4hUELoypLcpCNdAOAcQSKDTPgkYDZaRl4vdcC+gl6m
         Y+NnXFsb7VydH1q4R3VmhhmKLfBopiLpd0X/wkkRAqpgxPYdNqBOj/493HBJZFGRleeW
         IgU5sJky8iiJQe7dko+gyiDSmdoJ9S71ISfLbN9It0ixJri+B5mH77+NftHf+mmxv0pe
         hb2uiGSQ+dsVmnnXFJi9bkJ4Zd4sO9w8YGf5Sao7tb/RWj3Np9nxG7wzM6CJpgficI6Y
         9XYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736507118; x=1737111918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tf4ZK+wM4Kasp9zJMhepERZ/ZEptTn5pA/1RGLQBNgo=;
        b=wkeS3RV1KtwtlqM6Tlb2nHlFeaY9nStebJAP7OI6Q8AJ96io/9gi3CsxoFvjIV4qQG
         Lnbiap+QFcepFQFpnvFeing19XWjaCGhgEET+kgZiZXVxzvzUV0lT1er/UeuVielPNzK
         LVEzvAkhJrTWYDZgThtSEBs19Tf43kxHu1zcvoWdyvhtPQQaoNUyDRAuV5xi6SrK2WKk
         wsmPqFN7IBTqtSwsv5yeE8S8t1B+UNTdvSt19UyoiC7iyE1bT5884MD46qc32ruZNHfR
         5ut42jP+TMEbEzo+Jf0x1mjIwyQV6WF2a1yM5XUivx3aCxYX238UYkndvjllRA6xC+3T
         1h7A==
X-Gm-Message-State: AOJu0YwmkXSnnB5EN0Iy2gDBN++ZcPv5wC6EXbibjRJInMgyfHkDoJcJ
	F7wqJznCZ1g9Wv2Fyb7IbB2PRT8EQlXlFMMHUCbpPhvY6SuHxRZSIVEcRw==
X-Gm-Gg: ASbGncuyEauF2cwC93FOnNPpq99cuZapSlrYCQy//Bxgsrf+zhm1MWkBEBHD4BcYDem
	R0S+6Qh/fSdg7i4SAxXoas9XAtdIv3zeCih+W/GyCLrb8aOev9FGMdHKrw/qrQnDEymNKUEKPOQ
	h7sLEKPwhHMETX+KkwkD05cRwiDw8mWCf+DCX/G20/EfAugsyceJVA+HiKe5GP2BQR2q54k/cWO
	1E86180ZqD9yL8s/UdlyQJoLKJD1Ojpsu4Hc3389vOKpFnKyzsEfEfP+xI++JDC6A==
X-Google-Smtp-Source: AGHT+IF2r7gLdN2m4qSu4lmkF+VIeV0YdNSu8P6ftifc9eCMlFGzvq3JyM+E+VXnJWb3bdHRQFQ7+w==
X-Received: by 2002:a17:902:d481:b0:216:6d48:9177 with SMTP id d9443c01a7336-21a83f43c6bmr42707585ad.11.1736507118450;
        Fri, 10 Jan 2025 03:05:18 -0800 (PST)
Received: from L-18010.kpit.com ([49.36.51.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d5047fc8sm2666855a12.57.2025.01.10.03.05.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:05:17 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][master][PATCH] fitimage.bbclass: Remove True option to getVar calls
Date: Fri, 10 Jan 2025 16:35:01 +0530
Message-Id: <20250110110501.246092-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 11:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114765

getVar() now defaults to expanding by default, thus remove the True
option from getVar() calls with a regex search and replace.

Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/classes/fitimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.bbclass
index ebd034883b..fef8974187 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -288,7 +288,7 @@ def fitimage_emit_subsection_signature(d, fd, sign_images_list):
 def fitimage_emit_section_config(d, fd, dtb, kernelcount, ramdiskcount, setupcount, bootscriptid, compatible, dtbcount):
     sign = d.getVar("FITIMAGE_SIGN")
     conf_default = None
-    conf_prefix = d.getVar('FITIMAGE_CONFIG_PREFIX', True) or ""
+    conf_prefix = d.getVar('FITIMAGE_CONFIG_PREFIX') or ""
 
     bb.note(f"Adding {dtb} section to ITS file")
 
@@ -302,7 +302,7 @@ def fitimage_emit_section_config(d, fd, dtb, kernelcount, ramdiskcount, setupcou
     if bootscriptid:
          conf_desc += ", u-boot script"
     if dtbcount == 1:
-        conf_default = d.getVar('FITIMAGE_DEFAULT_CONFIG', True) or f'{conf_prefix}{dtb}'
+        conf_default = d.getVar('FITIMAGE_DEFAULT_CONFIG') or f'{conf_prefix}{dtb}'
 
     if conf_default:
         fd.write(f'\t\tdefault = "{conf_default}";\n')
-- 
2.25.1



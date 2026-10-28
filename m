Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36795.1793167102876120389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 22:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QLgvZE1S;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1810702eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 22:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793167102; x=1793771902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dQCxHixwiK/LI7RZkfA+kHJh6LZXnPQHV8X4PDgM8E=;
        b=QLgvZE1ShmMRwRW8HDTuaLBlvnaZ9gErj6DDigsUoz1Uh0xZHnUSrTzYjonzjHA66q
         ZkOjjWqqB4AnOHuw8Y7vUG0YlmAS872aJXLWAcO59hKjm1+uPSLUM7p6hnba+FIKGj8g
         ctll9nc3zobRBAP77FrNaBLZjC1jXgI9c//ayUJzSvP/kJEecNhLdaP0N86PA749TAlI
         40D0w8+E7ydqaXgHC7+B8H+WzV4WWtXFHEaKjE9NEMIUDpPWe5dn4ivyPWH+tTELLjxs
         kX4F/4sOVPx9FJ1n5YWerInyEkbJ7RxLHucSFFvgPXVrdOSTw3j7HFkdLB3K4iPVnfcx
         ipmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793167102; x=1793771902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2dQCxHixwiK/LI7RZkfA+kHJh6LZXnPQHV8X4PDgM8E=;
        b=RWDa7Ji9dTf8YXtM3s3+Uu0LY0QuhnyT3rjD63tR6cHLlVxscg7fcBsfQ2WS/u4chG
         J+9T6EPlcBXJKujqNBSQSbmu08++wJ8N8sN/+Gq4I9GWjBqCAEf2HXm7AmUQ9fNNkrH0
         ApbjZMnZ8Ps5QpMI6z0/LgeaSx6yNBGMSwdOKFvCn2SbI6SniEzVCccrPTt1aE3+mywu
         IecKQxwnPJaBL67UgzIpscVtxtd8k2ugyRrdJJbm+HYWvmRVW1oiUCapwfCCI08arv3A
         oEbSVq6+4+JX1ZOedSAJHs+lWEYRaEVWdbO/IwitCp9+NihYLt5J0DANi6kD96lvJgUk
         yn4Q==
X-Gm-Message-State: AFq9FYIiTO2PXJPHmr+j0jJC55tZMUv1ja2+gCamM5tG4vuyR5NHm8Yj
	WSJ11XVGDpEHAuO/sKfxnKvEm32SvO7ead/SSzKYN5mScunG+a9t4FOyB9jKk98PJ98=
X-Gm-Gg: AYBFou3hwvzlXeGqJy4CH2DbtJUVHBim6RZ1GwQio7/SXULxRXFsX423p+2Q805sR/L
	RMzSfev1QVgorTAxoY/l7pB1q4IWZbysP0CTaBvLz50O+q63XqIFgj4B7uGSAPxTLU7knT+hlnF
	jSkMlaawUXFSsODwsE8myoxfu6/0eEg6Aqi//9RcE9B4z/fkVhoCI+kRfDz+WB+7hYuwdnGjbYX
	C2ooiAuJk4rq6BiIUMtuM70FBDrgiBY3OOW5sDmN1UY+bpM/+s5iZ1Bnf201E42fp68+OMPACEy
	AaZMMiDq5GspaFmjWtN+doKdHM5F/rjYECPN/Of/6IJ+bPOffjE8cF+zQwSyw4ZXSap4e2+e8hg
	z7QDFc0LB/PLkfqxSgB06K710atE3zVOenX8vLdi+rHDYr3FZE6O1M5bxEaF4eYt9R/j9jXLuy5
	baekMaOoJ7aH81GgWUUUAGT2i7QBOYsPganRPXYPfJMvfTeavSMOr0b+D3lfUu32kaw90I1vaFj
	2I5vwtABBlPiDRFRHDzOCG6ZrLCn9+nWxBAA92se82/CEd9mcSVWGu2ctL41wROUTHBWFihzfop
	m1LrEfrd/uI9IzEbl41xXflD1omwN3enzWq618AoFR8g8m8jAZWERUYa8ieqYpnf1cfhmPYdWIA
	yI6mhVhu4eh0tyawsQ9u0/Htn1u8DZM/jsZnHiBOR/euh0cJ/N8yM4OgWQ7mNb+VouBlSkdE1Ls
	wq4o8NUodqFLILm9D+YGjQUK0/1niENZReznDRpNZyinll2VTV3IjMH19QJHFH0ytfd4ksx1Zcm
	rBG3zMW2vnchGGSX4WjmrPJixI7dEunDUu4cfTCtVIrxk/HbAWtrYRoj/I0b0KAlIpcUNGDrXEu
	pJcR
X-Received: by 2002:a05:701b:290b:b0:17b:fea8:1425 with SMTP id a92af1059eb24-1a6cdc492bfmr1761234c88.30.1793167102159;
        Tue, 27 Oct 2026 22:58:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a37093esm2181914c88.3.2026.10.27.22.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:58:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/4] freerdp: Stop using gitpkgv
Date: Tue, 27 Oct 2026 22:58:16 -0700
Message-ID: <20261028055817.4055253-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028055817.4055253-1-khem.raj@oss.qualcomm.com>
References: <20261028055817.4055253-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131620
Content-Type: text/plain; charset="utf-8"

SRCREV is the 2.11.8 tag, so PKGV = "${GITPKGVTAG}" only evaluates to
2.11.8 with a full clone. With shallow clones it becomes 0.0-1-g<hash>,
a downgrade, and gitpkgv warns:

  WARNING: freerdp: Shallow cloning enabled - gitpkgv.bbclass will not
  generate sortable versions

Drop gitpkgv and let PKGV default to PV.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
index 2cc8dc6cf2..4cb71e0fc1 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
@@ -8,12 +8,11 @@ SECTION = "net"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-inherit pkgconfig cmake gitpkgv ptest
+inherit pkgconfig cmake ptest
 
 RDEPENDS:${PN}-ptest += "coreutils pcsc-lite-lib"
 
 PE = "1"
-PKGV = "${GITPKGVTAG}"
 
 SRCREV = "9b678b6d5a40ce01607d8c3b1b1416437c8416c4"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \

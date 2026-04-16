Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CC0F8E497
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 23:38:24 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29858.1776382702724305615
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 16:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MbQHqADM;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c63e942f3so307930c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 16:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776382702; x=1776987502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfw58uV1TF3xP8aNfC5Xy/uxHQxs2l58/DRkBEalec8=;
        b=MbQHqADMSqDo3kYAoUXxrqpSij4J3uFSjbJXNAQUewW9CjwMHdM3XnMK4LLUfv3Ag5
         de0Dt5NOVTFmAHHo1sITsK7HXseVplxIgvzzyTvZ8SwURAR2KuNTRD2AmXLJ023DMto1
         Wuf9qNdXJQP/yuM52zTOVM/NqQbrceaZLabjh2ydxJAANLS6nn6qOyRh6ODcAAetzUVg
         fAn+d+0UEG9xnSsOE2bo7SryA6hIFTGlKwbo2Q9eqZeSd3izeT6AIxfe7VQ5YUrDkROL
         F/BEvEP0GoBihfZi4wnmo+cse4HgxJrqkyy9QoIYVD0gOS7LyKGeUnbix2Hw3Vkv64bZ
         OUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776382702; x=1776987502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tfw58uV1TF3xP8aNfC5Xy/uxHQxs2l58/DRkBEalec8=;
        b=N/W8RlHsbqEkgAntwcp4s/Wj1FON6cErh7FaP5Gr13G3PU4B6Z0kF5G3kxftbaSx+y
         YcA7cigFvBkT0lAMcAd74QtgDBazTSdCf7andQM2AhojgIcff0mbbmfNCtxMuTzhNm34
         KzzZaDJvhpgg7XplZsaoDPS+vvq78CB84hf7vjm+zIs+l6JUqLuJkktuPJ3xlsv0KYOF
         +q+Bp5g13yfbxRTBxTlwEnEj9/v6fzBWWBsmkujJSqz3keLTk405XSp1itR4zx+u9U+4
         JnL6apY9wswFdzAj4M0T5kQYqM/WtY3SCnHbYyra5cxUoeVWVr24wgJuRqsDNObdGiGc
         h2yw==
X-Gm-Message-State: AOJu0Yw/3fDMIUwjpSVK4FdmKpkQYp1ccRqQV7hf4U/1Eu6o6o5iFugC
	DYAFW2IN+/UhtDy5poVXBobFZIVNTikSxR1uSFzzBYA4QDgQKsrTAnIT4KJV2XG9
X-Gm-Gg: AeBDiesUnxFWdA2ryAuC1tALPuWmdizHX9W8mqq7KuECFGP0Em7IYyiyfjHOfcBiToF
	cN/fgQWcrFEqZQcCkJtAxeHiMCwC36jHISAFfXrbXRtgMyEkdbXvgM+iRvY66Ho0p8SA5BUAyK8
	aTp83eEpnnstVH9etbkM5pmWMMcknqeY9eGWrho1+aVsJjK6led9oYJwBynufaTkXunnO3eqr/A
	EwxPoDcxmJEWR21BfboURZl3EswuZGPpZ09L19zQ2mZTwyUQnlC42C5SlMiEJPI0MokOFeHgKeJ
	YTrAwRUPrC7p0kEbSyZ536wZ+R4iprgxkXKRXe/kfib17KrihMrdzvlvdl+gvuCNdSgIUe+tPeo
	MuW7pRHOpj3RR0394OvWpkc9JR9Mvacl+uLMYZuFWkyxLMA39ohTd32aPK5vgxaOK/TIDfpBe4o
	62DIckBYj5gkBeu56aMhwj2lN/Lu5gPRJR/GD/qvYIO2w3YeZkEtzJQRhZxcCnnpeILumOdQsUC
	cdx9xtKdSyLVpGumtNGrEZlPw1dt3yVyPrAutooxMVVce5tLhJyjVNNsJ76/L3DGFuTAnwA3eLs
	Izc/ed+HUbBylRcHpjwd4Xk2F8ohr2GTPgILwE6sqEQJ8GP5fMhSl57vG5PrNQ==
X-Received: by 2002:a05:7301:1698:b0:2de:aafb:feed with SMTP id 5a478bee46e88-2e466044d92mr202987eec.6.1776382701872;
        Thu, 16 Apr 2026 16:38:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e4c3f4fe72sm247993eec.3.2026.04.16.16.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 16:38:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 2/4] streamripper: disable C23 support to fix configure check
Date: Thu, 16 Apr 2026 16:38:16 -0700
Message-ID: <20260416233818.3790619-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416233818.3790619-1-khem.raj@oss.qualcomm.com>
References: <20260416233818.3790619-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 23:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126421

Set ac_cv_prog_cc_c23=no to prevent autoconf from detecting C23
compiler support, avoiding potential build failures as the package
is not yet fully ported to support C23 standard.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/streamripper/streamripper_1.64.6.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
index 1600d9d3ef..480c132473 100644
--- a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
@@ -20,6 +20,8 @@ SRC_URI[sha256sum] = "c1d75f2e9c7b38fd4695be66eff4533395248132f3cc61f375196403c4

 inherit autotools pkgconfig

+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
+
 EXTRA_OECONF += "--with-included-argv=yes --with-included-libmad=no"
 EXTRA_OECONF += "\
     --with-ogg-includes=${STAGING_INCDIR} \


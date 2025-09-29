Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66AFCCA46F
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:35 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.52845.1759151072063645561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBcyVdzZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so1339797a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151070; x=1759755870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ES3m48ZoDge6VEoTIURvOSQoyMmVX3MdqK9cwiLuA34=;
        b=MBcyVdzZ8aNpdc9uz+oFzsu/pOE3xJjtruQWsTh5zGHG8fcHZauB/uwDCzuCGBXJl9
         HXbn71/7db7OQ/eoLyCHk+sL+VoCTt6EFhWuTuFSOUglVFaQG6N//2pGgB2tHdPxgkpV
         GoqYWDfq0Zl+bbfOF9uoa7CB7uvqVBbpqfK9BiT6cmrRa5yJbSngL9ystr+gmUHSjadU
         4sjzkyhQar20gGYUm332qAq+MiOhV1HzPABwjD4alsVJ9fZL0lbnKI4TjBPHZnL5uVbW
         vStVIgjk3E1WHbzUj05+sfaPSND8cReCoew0ooqSWF8Fjn4VmfSU9MLfPwz1uM7CSfTM
         lJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151070; x=1759755870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES3m48ZoDge6VEoTIURvOSQoyMmVX3MdqK9cwiLuA34=;
        b=k613ZOfeFIB845dEqzJUMDSoaV9lGz3RjQlV94r5pIbytBuGjZFtQkayS6eHSqIiTy
         iK2a0PlBaLHJT9CcecaR5+lcehsqHhDcaR/SjkV9U1KKRmNICHEDEeTz64xHWZ4Du45r
         ST3VXQEdxfZ/VDYxrETc03c2/I6myhfAeVCXVpjCKeK1kTjPTZWuMydXJOoLNPiD4e5A
         J4RU8rQ8+5jRmTMc+2wYwpg7lDeX7B9Y5KqFWjGtpnZrfeCuT5Wk6Yd0KCACjYIlOWgm
         z+QLc+fEu6cyRCq2vNKaPehpYIkiCYSQyppLasjzkp+TBMB7vF3fIHkc34XkRPh5qMIX
         IPEg==
X-Gm-Message-State: AOJu0Yw2nKRZjG5r6DbuKCNZ/CvD4Tc+1VMNPayc8lG/gmewGcMmt0qp
	TosyxzbFTjOZ5l0oIOzzOt9597dVdg1yneep/F65imywQlPSgQumBZoPqH/upQ==
X-Gm-Gg: ASbGncv5yBE7JSkjKJJS7U6j6bNyogEXbN30J0pAlSGAl8DVJdnM2I/sXHVfpWAYeK+
	HRWVJw9mBOVH2XbewVU5NRgdBiimO/iM0Jj1KaBbyZCxKl8gfvjLakXDXC0XIaZgWMUSdazPy/X
	Ne6dLz4NyHRaPm52zxDMp8cIPwdPKXPViFBf7DybRvtfYh9O+TkTMBYPl/7zHFhb+1/9d2moTip
	AuMNsRw4kgGO8QpCsRAXyFI+Ye+JcO1x1EB1RQx/hHmRR1jyfmyauE7FN+tXRdLqkB9q54jN2nR
	MELMkxcSexBuED5a57aX1KwdBkfwe7Veyped9/kCJ1AJF66lklt64P39gAsUf6+CSm3CmuzYLO+
	heXjz63U822du9/Oti/fMrk7ouwmsh78XhR3ZzbTVCQ==
X-Google-Smtp-Source: AGHT+IGt+GFAa1DWFEspDEOrcheRWBVhmlnqsywg1P4kfmYL0X0EblQWeP5me5hsYgWjFGYUI5L+kg==
X-Received: by 2002:a17:907:6e8b:b0:b0f:a22a:4c60 with SMTP id a640c23a62f3a-b34b90a6156mr1845621666b.11.1759151070196;
        Mon, 29 Sep 2025 06:04:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 03/22] lksctp-tools: upgrade 1.0.20 -> 1.0.21
Date: Mon, 29 Sep 2025 15:04:06 +0200
Message-ID: <20250929130425.2912077-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120016

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/sctp/lksctp-tools/blob/v1.0.21/ChangeLog

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4c3e3638b9fb8a26b91aac02803e93da256bdc7f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{lksctp-tools_1.0.20.bb => lksctp-tools_1.0.21.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.20.bb => lksctp-tools_1.0.21.bb} (96%)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
similarity index 96%
rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
index 51d9605624..e2484114e3 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.21.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
 "
 
-SRCREV = "311fcdeb5cb41612d4be66b16f0f2ad6675a6af8"
+SRCREV = "37d5f1225573b91d706a5e547d081f79963a9deb"
 
 PV .= "+git${SRCPV}"
 


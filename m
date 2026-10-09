Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933B4CA601F
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:06:15 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4394.1791540368986579836
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nsmRiJdH;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so4024705a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540368; x=1792145168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BG4hq7zp4UgGkrAfpsxUunqQ2Ty7Mn915KPnoV/sPe8=;
        b=nsmRiJdHkOKgR86+JRvn7hKLlUhAAGMSZ2IGlOfQmkH8khXvX9PD4bmMOJzz2A3bPg
         c6MnoE9idW8tQJszcAplBuFOUVvJqOe4/X120Np/bNcFSU+b4XglW0LH3eS97HxR/0yu
         oee9zLyeitJXg4Qa4ZPjdUpKpWaSRzEelTC0ehojD+XaWxQDMOt8JPgDDLIM/8oavz2q
         ty+dTfex1XF5NhqrC+nvzbHf0u6FrS4RMsFMpGigG36lRu8PV4X0OBShB0afIFBpsSIH
         pgMEinkJJ7YqoPLJxZRhcXKF/zx8SlZlgWjWsxOgpv7YxBH5NUOOVvVxrEm4iQLfxq/X
         KCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540368; x=1792145168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BG4hq7zp4UgGkrAfpsxUunqQ2Ty7Mn915KPnoV/sPe8=;
        b=vHu4QAucRMRtcBo4usS8UZoN2TgxgwAwpzpdp442+nsp2xZ3/Jfr8829Pr5uK0qpX1
         juqRLhLStJjjjVcWoElVXSpRAtoraQpLn0JsbbDKZFNwseKep4wRmNdXA4Tp2DzyhJb9
         AV+9IWB6mHj7EwpbbREGUKdZnJTuVGl9hNcVUDZxrW2FFkdi4JWxTP3qVEhvCVtG85mM
         uww/F+EC3UT9GvHNPuwCSJ9sUiniVhzS4Bi/l9H0mTTxuf2RGcoqIv5HwVYIT9P7UItW
         EAMrvL4OmG48kxVqu/qd+pAGZEmBJG6NPCRRRKnSzSP6MpZsSvXZI5pwqWywIWXXCXf1
         g2Ow==
X-Gm-Message-State: AFq9FYJMtA9sbrYPvDaHYrDe0rMBd2tsX+Q+3hNNMj9bSKLOEwUjbcQl
	3OZ0RQSpn8fwYXIqSFQ02Z0YbvqBFX6JWh3TEtvuF98xZiIWMe4awAlch04yl2w0
X-Gm-Gg: AYBFou0pT6bODslI3oy7VX/+rhD5i162et5RtTSLPA2H3XypDhtUdrbPFVANGBwOp1O
	GQw/wabNSJ1VxaUC1PlDLmJR4PSbC772sMhOgYpfIucMhDHZfZmdBE+sCgLRhBaDw6qFEmxeqNR
	K/INpkT7uYZKUuzFHIB8CbOJa5jSkPIC5LyHrQlNyVh+EFj2u/HyUeRm/n7a2svi/2K6XCLaLaU
	yvTxqm1emz4OMGxgIST2EbipuicBGn9cnR8Ug73nNC+HAfbO/iWJdImc8UUunPN70oBDQnx+xmw
	YjO35octoh8RSP6j8XUsd/TGf3qAYtyeYx8woqpQ3DZDRspuDmXsStza4NPgxIaoSLgeNbT3qFz
	tbnwMH9OfTc2AV3zBe+U7iHasB3nd9IODKSmwO92KLulX2u1dXJf3FFrlInagHB1YSwVwLkHPOE
	XRx7U37gvzNEE8vhygffYRb/iBCNEZMyX72rWefD5T+S3hkVWbiVyJMDy6Rg+tS9NFqZFffBS3A
	QFjUXhut0ojTnH5AgnwMWBtNZVQRjn5L4Doqse5yA==
X-Received: by 2002:a17:90b:224c:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3ab3a8ce938mr1351260a91.37.1791540368220;
        Fri, 09 Oct 2026 03:06:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm2723866a91.13.2026.10.09.03.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:06:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 2/8] znc: upgrade 1.10.2 -> 1.10.3
Date: Fri,  9 Oct 2026 23:05:37 +1300
Message-ID: <20261009100544.1428938-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
References: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130686

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/znc/znc/blob/znc-1.10.3/ChangeLog.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-irc/znc/{znc_1.10.2.bb => znc_1.10.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/znc/{znc_1.10.2.bb => znc_1.10.3.bb} (94%)

diff --git a/meta-networking/recipes-irc/znc/znc_1.10.2.bb b/meta-networking/recipes-irc/znc/znc_1.10.3.bb
similarity index 94%
rename from meta-networking/recipes-irc/znc/znc_1.10.2.bb
rename to meta-networking/recipes-irc/znc/znc_1.10.3.bb
index 7793813234..adb6546471 100644
--- a/meta-networking/recipes-irc/znc/znc_1.10.2.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.10.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib"
 SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https;tag=${BP}"
 
-SRCREV = "59af2206c62724eec0d8c43d3c1c0b70610ca1d9"
+SRCREV = "6bd91573cebd1e4ee954ebd4eb6db5b654e0e412"
 
 inherit cmake pkgconfig
 


Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48031.1795411849382914645
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rXkvv/HE;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38699cf08dfso2509773eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411849; x=1796016649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Zkco59dXtvd6mo2iwk2zBcCRbubBfORBRsXiIByl+Q=;
        b=rXkvv/HEQufl/CgE12ebuhWwDmPmQtlTnXegnQAneZk+IQrgHiCmUgcHpk5O/KcTpB
         NkyCzah8pBF45YZprwj+ln7ptjHwQaNCSK9ldx+yk/R8HAFBHVh/EJ+r/zzdR4dlCfmC
         VdYi2vk8m0+E29TiDrkyfI8JzVGqyZbi7DkKFjB9tmhEhUlHNZYcFkONRE4h05CeR2Cv
         TDnobMIddO/q0Zxb2G07vlhLl53cC7yVwUXyAxLLct4ciCxxP3Ks3/VMw1FjP75A8OYY
         HmYcH+BtJ608hgsGKNMFA0Mu5L7Tg0+d3pJ6pEYea//5peIA9AtQpLPVlyQEi2MP4q7d
         R6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411849; x=1796016649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Zkco59dXtvd6mo2iwk2zBcCRbubBfORBRsXiIByl+Q=;
        b=xP1ZJDtOf0dllaF3ij84hZpe9EreTP59LmuDPs47FMV6G+s7j2em706zO4Pvt7idgV
         wE7t5kwEeiTov9zOeWluezyVxTEnlvfSZwrlLDviM92JRRZgDBEErqUCQS0W68O3PSfP
         JFIIBZl0lbP4hVPaM8jeRoe6+wSCx92eEWnDLtawWoHyXX61f/Cu/p2gUM6BRLDmjJRe
         1L75dcGt85vOvsZZP8JXbaYbVSW8GCdMK/l5/E+a1jxIs86Fi7YJEQkYhOpJri7jo/2q
         SVtcG0Q9p3i+yKy5lFMH0PmDX7YMe5qs6rbZP1/Mim3F9BpVx0BmX/yo9TCZGihxNnsk
         RKoQ==
X-Gm-Message-State: APuU4Z9sKL04kL3V1FLGlyEf81MW8m8jwOZipO/0/qwgzQzdgXMOl4FS
	ZZmrmmnYfcT9LUAtBR6Mn4DeVW+d16omlPKIRAVMJA1GwC0DcY7+9GTpyR4OazX3770=
X-Gm-Gg: AZFdTZeVTDgWzm4YvqpnewkbZFg/X6tCh9Szgyidg4JIEvkqhp/SEUqH5SDb3Nmv/lW
	wOHrx9qdBIENQGAhyL7lGEVZXNS3b7iLL730dCAE/VwPdPTqlBa1kk1LO+xuTRxpIo+Da1O/fwu
	PSWyJIkcBH0Exnm1yRJDXu/x/HIHs+DmnMv0nm1XF/9FVeINJHZbcTHN4l/Mrnqs8pNkp1awfy3
	Jcg99q23TcVqbd9jFnh3XGeUzmaEMyRYcvURfUJS5tbTjehgoG8CYKTwoAluGyLB8VCxBePchZ9
	P6j2CPNqJoFsBMI0KidjYr9QvxFSLcuJosNkcxDG3Bdg7s7bqH4Wsh+lIrSxc+TZdLuWEnuuSl9
	yQdM4xNTUJhzEMjk2hhSxYzFBe7xzlJFS88FQNwBOq+X2RohISpd7Pfhfb0azEVNAeWXeF5CiO4
	FJTOaAB1fpehjGgIVfCoc7C72jv/q6qkW1DEmswL2c7ymYbtHVC16DgxRkHuW4i495NmqVzDJev
	JpmlogwjvQRyMD6fgZC9yDtTS18DPd/xxPFuonhfGCnr620ktviixrfSMoi+iAimte9QRTG7HIx
	3QEJVhmI0xGCIIf4ZBKbK4IPjTvyko1I+RAJmc0ISln6q/kjA5rz/aw/FtocAqh/3sX2Jpx1Pur
	p0m899H8BecofHoSMaB6Dp1/BRq4NtxWlxyYE7rSLFpe3oWK0d0LJSbaXpXmgNKLgg5ZqxJlPVT
	rfAaz0acdt2CcL9efUMfAEYwyOuysjFA7IUl1IqvcHy1bF5WLIP1WS6D0xDhXiiT3CJstyqBRMK
	UDDMOEShouWhewIPN8InnpJU5OrQcKwWRLZ6HXBCwHyQj5Dgs23eZhdXiCl/D4tsGuWTHaKp7Wj
	Yx66
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr16870492eec.2.1795411848734;
        Sun, 22 Nov 2026 21:30:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 15/42] imagemagick: upgrade 7.1.2-35 -> 7.1.2-36
Date: Sun, 22 Nov 2026 21:28:59 -0800
Message-ID: <20261123052953.3658549-43-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132830
Content-Type: text/plain; charset="utf-8"

Security and bug fix release: fixes for 31 GitHub security advisories
(e.g. GHSA-4jg2-g974-7w79 in the DPX encoder, GHSA-f3r8-89f9-mx43 in
the DOT decoder, GHSA-cvrx-j29f-c5q9 in the splay tree), stricter
write-failure checks across many coders, and fixes in resize, SVG path
arc parsing, JPEG size hints and grayscale conversions.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{imagemagick_7.1.2-35.bb => imagemagick_7.1.2-36.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-35.bb => imagemagick_7.1.2-36.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-35.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-36.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-35.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-36.bb
index 877aa4dbba..2dabbff118 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-35.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-36.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "5d1bcc55f2c83bc2ff802118b7369756610f3ad4"
+SRCREV = "dcec873ede2912a1b045a50fd54cd138ee5f3fa4"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8082.1795739716668066411
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=THCxiQ7l;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-385d8a00598so10997195eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739716; x=1796344516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytU+EEi28OkNCz0i0ebpbXIqbbqfM2uwNZbjl/dY54g=;
        b=THCxiQ7l5qGTFpHo3mKqcYco8+GE4YIiQmbRDxQKow+YvcX391oMSjBSbb15ApIglH
         o6EKtw8/Krm42+WA8nIdGzWPznC/N/IZaUz9fCKR1WMZqm4IzUdcQzZpdLQQNXXhDU4m
         7fRyfaRjJThfQbXPgmOuJWISwAhLE3rXcsbRit7hF3xZgg2qTgGGWt1fP+6EulixsSFK
         r+r3qi3LGWOApPKg3b0VAvrjHskRfIwctQuXlku+0sA81su1hC3lManCr1CmLDq45stP
         dL0dQX3a7M1Dd0hoizjzLGRHrQY8vRdN8+4tNpNfmU9UcURP4l8e4mb7cMLFcUmyD22m
         5kCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739716; x=1796344516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytU+EEi28OkNCz0i0ebpbXIqbbqfM2uwNZbjl/dY54g=;
        b=GKGPVSS2ynLzXr+fUrFGZX7w9NbguDCWUlG3wyYc1pCZ60Dyfqsa5VipFn+wBobRd9
         rfqnfiidUIWRnFcQ0oYDVgZVNUw7o+5ORhXKXAvsbhkDPknVXhTnrW7WghuCuABOGN+w
         qKSY8RthAUZO9TgY2q8NcpY9FRtpSSjr2j75N6SHHKN2D3ubPIzcXlmOpY8sYVs22lL7
         rIIUHiEH2pIDXNAvUphCzpVso+FGQem4PGJtT0J0EiDs+WuJcoinWNwCRCJK/Q7WBlbs
         afJoe7qWsYQkuyXQwIvF+8QC2UyVvVEVPKNS+Ids/T6mFzQ8s/nBI8qNsZiCJJLx+aLx
         7z/g==
X-Gm-Message-State: APuU4Z+99Jxk4t0jALjoLqQsWO9CHajCC3cwISuVkOwcq8QGbFRbXCXQ
	ytQ4Hbuji5W2UbPV9oAz7asvgHLNx9u9RVX+n7B9yTrlMtCdMpykLDy7jg2blsEa
X-Gm-Gg: AZFdTZf9TRfps453C4KQtnEP0T2aW5AI5TGMo8LqzeEHHfNVf1snVHa91HRo5j1b1hm
	TiwHq/FRkhmexJIvUInfUAYNfUrl/P4qq9dmPxIhIPslpLajrkdNh3jNFIFj2RkEJT6eCs8TN9c
	tlVwgtDgc9xBkZzDv+akYHPPkGuz5wODqIWtFYVGW2kVdyAlQwXA7sfGHlxv94hHzv9SrzzTM0h
	6uYpC0wltcluvzP0TxjEfw+5Y+NSLdNyx9ydxmfEsKvhkbime1yQicQ0oGMGuv659R+qEy6nTJ2
	fOjs1FMGr4CcGh4G7RyAIMZeh6bNAqOLU9j4AX3YSSRD4svXI5XGjjpSvbrZ2g3bTi2Zj5Us+Qy
	/eP/WmpRpkM5BZGr3dlSZoUA1siyUNH/jv+b0xBkXBEwHdWc9J7vIG8Lss0GVqUZ/ZDK+CLMYgx
	DrWxgSu/njfVIJsmlAsAYwLEsy+aiFkpVqdeaW5TythTnxvai0TR8TcYP70iX1vgIbLn6EqYQCb
	HRTOt+76D613kJ7Hdda+jL1TgWagBYjZpk9z4bGnPnHbJmE/oWFqwUTcKojKA3p0MVVkXjdNzJF
	fpgi2LHGRPaOICP2MttPZ3QjCtz26md3IRpGZX0/RK1QQ+5bBMUyALy94W08C0Bm/YAh01oazDW
	liWj81upkkJDDd333rLk7YgHqtYaei/ZYE10YTSQKiLPHWWBRQuRy54r6CdQmAMYN8KN1w9wUFA
	/T0ckjFldeeF0pulSqmr5wAX36yNmMsc4JK+b9ozHtaSd21JyUWuhun9XCLIZr4Okk6lf4ijmJs
	tDRa2fwuVyhJzWcvDai5/8AX602TnwqzWWFcHJ82/l06F0oo7tYMro0MVI0U67bZx8pTfWMkbk7
	520j
X-Received: by 2002:a05:7301:f02:b0:386:a3a1:6f24 with SMTP id 5a478bee46e88-386a3a17d5fmr17154820eec.24.1795739716026;
        Thu, 26 Nov 2026 16:35:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 44/69] broadcom-bt-firmware: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:00 -0800
Message-ID: <20261127003425.2166632-45-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133144
Content-Type: text/plain; charset="utf-8"

The default tag regex stopped at the underscore of tags like
v12.0.1.1105_p3 and reported "12.0.1.1105.". Match v<version> tags and
drop the _pN suffix, since the recipe carries it in PR (from the file
name), not in PV.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
index f6c1b0c60c..3f26172acd 100644
--- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
+++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
@@ -11,6 +11,7 @@ NO_GENERIC_LICENSE[Firmware-Broadcom-WIDCOMM] = "LICENSE.broadcom_bcm20702"
 LIC_FILES_CHKSUM = "file://LICENSE.broadcom_bcm20702;md5=c0d5ea0502b00df74173d0f8a48b619d"
 SRC_URI = "git://github.com/winterheart/broadcom-bt-firmware.git;branch=master;protocol=https"
 SRCREV = "a0eb4805dbb232f02f156b9351a23790c1a4cec7"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)(_p\d+)?$"
 
 PE = "1"
 

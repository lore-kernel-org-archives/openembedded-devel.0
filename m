Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48503.1795411813689015330
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AeVgbk/V;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6384736eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411813; x=1796016613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlGwUV5mrL9UFgsmkR7QrUrfZAqsnUThemGOriep4o4=;
        b=AeVgbk/VzGNJX9maIHtgWyBnBndH5wUtxkwfzkVfyuZP996QGbJfGKTQgbpvGIifVm
         w7tjNftRXlz4u402wnFWZz1qhdbaWUXa1ffc/FEtkFV5E3ocQ0MgFInJToP1twJdWhDx
         NMH/+wNdKfW3eI4QaD0bhessIKJMYwlQxLM2VPwx9ln/ir89jbsGamB1Lfhh7/wbEo8E
         3LBSjrTISZwadTnPskwb1l2lk+007Ar1ROuownRmomSKJoGDBzItWKnLq0NelgK8V5V2
         dzJnEPNgnJcF5GdfiGzbYaDsBIDgU686E501b9TBvop5JQJdm0thfSSrqqDPlYT+sc7x
         c87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411813; x=1796016613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QlGwUV5mrL9UFgsmkR7QrUrfZAqsnUThemGOriep4o4=;
        b=0tMeM41n8A8jZcgfTpBLzbaIP4UwvJBz87onXjQfmYTXqO6hSGWDNhEWQ43tHAfxVU
         CXghw4vEFbzituIAF8qipwfs0vO83Rfvg2lvkfCVO1xrULUL48X8fkh/KSa1Zo8bXg2O
         jssbGUFbc3V5AgPVV2Kq+swqj240rZXLHOAZN9wF0LmbaTEwrgHYE+GD/GMJKa7ntqOh
         LFQM6CXG+4XzuEWYv0lJZ1KP5vTZh8DQSJnoh96MIO//nWNBpmzpMzC0sMuUtjEdXmCJ
         oZ9RU4oc/57qdYLtayEV3Es42Yaignn1+sWMExnXO/MtLlczuSQ/15gomoF36tNwB5ua
         h8SA==
X-Gm-Message-State: APuU4Z/PZbVkElyrgOryOce1LzM6dmtLRV5lwoAWdJb/WX5x9hP7RoKw
	0KV3w1S3caQlzZwozOa8O//Td4wcdBu95C2hTM1VRuwpZ70f5vIfz5CC2jfP/4fPKgs=
X-Gm-Gg: AZFdTZcJulOf0g2X/99zPz5GhjGTZK5TCYCmmTZQcuKUGNmzYVNnKSeUiNAP6PWshZF
	y1WJueRHFELUQqo5IyHWcghh7XGP7tY+/5C7hcYTus2aNOvBU5JzXc5Tw0yujKxHfhUp1gTaTvx
	u9uFuE/Mq9xJ04exKdkdqxC6k+fYb+A39/GGFEtP05kdFsG2dO54zSz0we+qvvEdzIcVGYOfMsa
	AaGUh+Dcrlj3h5S0FUXZMjVWoIlwGqr4aDNQOLe7ODIlw5WySsJfKLgRTO9hH3C4DhKbM3MFtmQ
	nRyBhI1+RAuCNthUU0zAC143zsRMiHtfp5mb1Ee7uS/ZzLenKQAwPJHIjJ91qNRnTMOJC5z7Tkh
	nx+jQd1bgk1Nurwda8ZimndqB3NHQ1lADRf5yZfWTLvekVQFECeOKSp+kGLWg08p0vnxCi29zIc
	TJ+Q0SDB889rUqJy+5Uu7Aijy/NN19/4JIMRL0NOYtC5OUim8gLSB0688DziqXX4fIm07JZuab/
	O6Q3ipqtsOr25hAzhO32g+1zqgbff0XkbD3BXgNwaTBwnY3n/zAO0Juhql0xCopdVmALQTotW1i
	0JhaAsZN9eZMJ7hcWDK71wkvcW0B1pbRqiK9zsUQ+MhZ3a8mm4kFgb1fdejk+i615kuUSBM1wci
	nVfKzqHUgKW5DP23emqriUqn9soxTnRgavVxZ0+4YhGf0PSWXKk0nQUSWI+Lg+a2Qw+7iYQtRsH
	rCMo+TwPhdzrl7ej6PS42GKwfETAoJPJLlHX9vR4vz/NVmcKH8x+r9HcfOeRWk8cDpzeYE/YPVC
	IafKeCqxu9Lrbqxl6bBRw4YCnenVjaaQMV/haD5gHyk+7b8z36R33WWyJI0GwiUDOZOu+xyL6sL
	BU/ricxi4+Nud1c8AU2QGswa5Q==
X-Received: by 2002:a05:693c:62c3:b0:386:a9f4:2d49 with SMTP id 5a478bee46e88-386a9f42e68mr3122151eec.36.1795411812967;
        Sun, 22 Nov 2026 21:30:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 2/6] libsrtp: upgrade 2.8.1 -> 2.8.2
Date: Sun, 22 Nov 2026 21:28:29 -0800
Message-ID: <20261123052953.3658549-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132800
Content-Type: text/plain; charset="utf-8"

Bug fix release: check tag and MKI length before RTP unprotect
bounds (#845) and export the missing public cryptex functions in the
Windows def file (#829).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libsrtp/{libsrtp_2.8.1.bb => libsrtp_2.8.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/libsrtp/{libsrtp_2.8.1.bb => libsrtp_2.8.2.bb} (94%)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.1.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.2.bb
similarity index 94%
rename from meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.1.bb
rename to meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.2.bb
index c364e095b8..bfcc8b9022 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.1.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.2.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
 
 SRC_URI = "git://github.com/cisco/libsrtp.git;branch=2_8_x_throttle;protocol=https;tag=v${PV}"
-SRCREV = "6ff02afa8d2dc3f2e8896af391d137c1c66ff6fa"
+SRCREV = "448c27f9d976330f42f000000d6a0719b63dd073"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

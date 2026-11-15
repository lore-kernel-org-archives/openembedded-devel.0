Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3872.1794729032566080438
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HdegEeFY;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3704d30b84fso2948885eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729032; x=1795333832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5/OqJQlVS1oVItm1xbINqN5qCWAHgHoMfv68Z31Wx8=;
        b=HdegEeFY/SDhqBkZD8lu2qU5+x0O0frK8lK5bzi/W4Sz5sSjRXcQfRvk2vR8jjWS0P
         BgF2w+BBKndqNdV+bkoWp1wLW4u+9cfUiCJ7zbhMIdhkIp9Ee4pxT9UlO2zcGdbDlU2x
         iUeBGJD/UJAMCtanzZSiSTWay3fDeBK95kxlFbpfJOi68lb/Z7Piy/7jjvpiOX+wsp7x
         LBjYvGomlqPULPWA5WJBeVoyWYMH/6788W7MmioerexmPhxk3h439FPsVQvJrNxztosl
         sVjTmMMZpCoY1Qjeg1LuKMaeqyTgy17HB5PUoWEfMyN5EUnbOhdJiPHH5lEohe7h7Ejv
         zPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729032; x=1795333832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5/OqJQlVS1oVItm1xbINqN5qCWAHgHoMfv68Z31Wx8=;
        b=tCfc/pmw/Z6yQ5Kk5ApFLAcq0EZlVpe5sB8DLLD9MgXmMu0Z0In4RUhnHWY+T62c/6
         uLyaomRxIy3fU8WShRjABoe9faEnpAPyb6+c6/qFBISxlhJkbSmke3ezKS5TKaLa1Pmi
         e5uum+L94TzVzpWHzO8jyAx+gKItZTe31O6D4X6kSFN90fAnOimUMv1Dqnz0nk8aZOiS
         5usY0w4fGejkvEYYX9wWGVu1Rf/Hef2fZAb2CTUC0ostWCRy8W/f3taI9fB+2JxiyV7/
         8idvMzPL3diiHf3f//COoOuZHnXzCrh86MP2/s/UYXBw9nMW/h5pjJhkPSxUyPNCaylf
         nQBg==
X-Gm-Message-State: APuU4Z8TG8ljvghuDOdmUkQnjBcLjFpkKfJyDr/FhFOZmRJUBin+ty5k
	KNvRyfVb2dq0AmiKVN5t0uZC2YoXVJwsH/Zr7vYeu0ygVb9MfIn4idFj8qARyQsa
X-Gm-Gg: AYBFou3E6bk2n2luDsDu0rkOCg8qyFMN3ecfffQ8WeLuAyhXqA/YqInMOUcIFFURwN1
	zK+0C+aFpn8VaDpaFS4Map8/bM/vqB3HbhmNngluZ2GqVoAzHkMjGdDp7lbD95jeqhPqRXCEG4n
	nnFuIc/7TcEsQvRBkgcjpJcLB5ZZN6004CFOO+l4po0FseejxZ8IoJUKwqxFkKYLUtd+H8kub7s
	r1ebfIwjGoFeSofjgAt083kLurV1v+A6CXkWeoJbDBdwz/MRf34MMKSmW2XgSLZdlgNmp0JWxTW
	RLhQd9vsj1A94l60dXi5mmrCWOmt/iK+1J5LIWIbhNB4XVtyS6cTl6fKa8yehhFalEfjFF4ONnD
	Z/VSNVSqXG0DWhA9GjHtqkzMMWagHBbTcRVQRBF8SpqigOQFK8sObPddWHnhjfmgU9gzCVCuc0G
	vKLDdYZZNywQAMJVfkGmQ6Gopt+01e58MIWCjPH6yj+ZC5jSFjD6acM0zmc1iR/SunKAg8f5x4k
	pY06sbWxa4K+2EFUnDal+DQmZ9XU2jjSJz8wuPPyB7xJfHXWqjYtUh83huFmathTolykW0pjC3D
	YQCVLM4X9m7OufRM+2tI8qJijluEXR3NFC4u3cYDmVIBTEf+hI7VTed+Dx5zwYhJHvfZ9XstIVk
	WuYr2TXKJyv5DjwLIWfaDxNLOIM7d44AJXtoNi11JVSpepUniyR/wnMaPPV66tG81Sk4BbCY4Ar
	9LTGRQuFn4QaorAlkSSttPjNm+FBO9GrZe91++92IEjOJ6DjeN8X5dyC95+szQjU/5udQ8ZuNkB
	cETKCq9tTR9ERECPPx4/OPsMU/vysCeh+xrxrFA2fT6xFNZUCwHIImEt9DSlnvpuNnk+G0my0ux
	FjlO
X-Received: by 2002:a05:7301:f2b:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-37968d8b5c6mr7402235eec.40.1794729031893;
        Sat, 14 Nov 2026 23:50:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 44/96] poppler: upgrade 26.08.0 -> 26.11.0
Date: Sat, 14 Nov 2026 23:48:22 -0800
Message-ID: <20261115074918.2932593-44-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132314
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../poppler/{poppler_26.08.0.bb => poppler_26.11.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_26.08.0.bb => poppler_26.11.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_26.08.0.bb b/meta-oe/recipes-support/poppler/poppler_26.11.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_26.08.0.bb
rename to meta-oe/recipes-support/poppler/poppler_26.11.0.bb
index 8b0783d001..aa6a0f85b0 100644
--- a/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_26.11.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-cmake-Do-not-use-isystem.patch \
            file://0001-workaround-build-racing.patch \
            "
-SRC_URI[sha256sum] = "dc906e68cea698109706ac6aa3d2c9d4512fcfcac42d90b8afcda486d1b9abd0"
+SRC_URI[sha256sum] = "41c32680160addf5a8dd7a830e4869c01e9f6bee1abb91e44fabd1ba9d7828fb"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 

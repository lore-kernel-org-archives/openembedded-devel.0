Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48553.1795411897469446555
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0yo1gO/F;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3869b68caecso3587428eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411897; x=1796016697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdZAeY5ndKGfNFx+i8PpSzjaoelEEiKs4ei1Y+ufDNs=;
        b=0yo1gO/Fuq6TCYwC7rSa6UN8uNXszkOas9/IXw/z92OfR9ruSjtbexq8FuUPutqg51
         bPomj4+dAJ0mReX5IWJNFtro7B5CXobNNVjCAYhZtkZJ/VNiRg+rN5agzX+2VMcp/8E2
         qQ5VHYxYFZaluWKvlKPWYC32/LABgI/O6FwOymEptw6xBQqtHvb8bVOaFD71nD5t2zee
         ZIV6H5cwlAOS/ZSsOxwQk2JM7+/Qk/bTQhZcdcfhmPvM+X6hwWyPtXuyO9L/tIwS1qxj
         y5gz4mZM0liFiCAxWdSo7T/Umx9xH9QZbVoYcV0iltkHtnvObzhJp5pHpwrPz+4HdZpS
         Gplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411897; x=1796016697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdZAeY5ndKGfNFx+i8PpSzjaoelEEiKs4ei1Y+ufDNs=;
        b=g+bT+7C85qGrYqaQXFlcaPWEIBB6FMwwu3M8urHYu9YjcieYyv0CyvZgpaDMDtdCvZ
         w7H3S1P6/xNl3JFnrpFQljqBezXfTPVlhHDfmvY5E8wcvazzWZOGFA6/IiwjXy+nrH9p
         FHf8yZ431q//3KM7yWLNAJf2Xw/LnxRWqN82KRAVu7RrSf5Oen9F/PsY9xJbS15NiEZv
         +DcRWrtjE3j4mgyrTCFL18xnNEcJX0i3cpNJlBQpiEenF6d7ciGcRWqkUg+U5vDeV1R/
         I5IYxprWoVpJt7Vb+ikfHJ9sq+YFUe+LSmB8rN2GAf11lEoGFXnVR55C5TH8bEI/l4CO
         DaDg==
X-Gm-Message-State: APuU4Z/8ebXtgoHiQZQLU92gHbxhhfsR+I3cx+mUYCFxACwBozLIWnDr
	xc6+rff/ygJw/qu5clyMHUaUHAoIXpUib1F599cDIAyMEX6kJM09DPQO35L3AxRSi4A=
X-Gm-Gg: AZFdTZf1qCCNH8caRXRGF84ZEXaiwX+CxneSvxixbLe5LRPk7XC+Ph+Azq20wVh6An9
	u3EJCaM7YE0d6UxH6jfVNo9DNHdAsiZIU757eSbDdnJV3AQ3RvEHhSYlZ1dFA2+CsyNFevEtcvo
	cKpS06RXD8lU01tyMEx6C88qfYvLmHpmstY+Cyp4BvbExZPR4lUEhkcxkzt+FY1D5gK1U0/uQoC
	V55ibzQp282ZmD8zePVTWdKSjnrnlBqzvxDGKuy78ZU7Mhlpk9g0EPA4VSV/Ms5dXYGbEcYc+ix
	/5ZOYddAeFEfHwODnBal340rA2yfhboQkPvSyvICtK2nhcmd7TgJhiprbU4kAhEbyTtDv+ze9u8
	s87hNlHNj5hmKDZoPjObS4tVCoZE7QtkA83UVXREnFVbGRu745uAW2FcyOTHJXIvZo/MTA88vfQ
	yqSsx02waU9T0mpDjbp9MmFgwafHGrrF6yip2IPpaLPdfScyANz8+1xCOpn5ufUKeQgJj5gD8c5
	Yy2CFX6xcmTmywucg83NTptHwbPd1CJddzIT2j9a1oM1XuE9yQyiEDZv2jabXpElZ3BenHJkY5y
	GkjoLW2DaN9IcLS5wdwpXRAbEbcVG4sncI0kJhI7wbE1mM04H0BDo/xkdtu9liDTWzRGxrDfkQa
	NlMo0zjaxZ2M4LP510EaQn5FCf5q5CZoS8E9gVGsjMC8bpTejQDSdGYdVD8ziHo/Tl5iKpT1JI2
	ZetSNq/kH6Wzdu9QyYjaEV7SSdoEq1zg9S6WrRew6c1FBPzLYuZbrXMbu0zqk+cG/dBYNATEDNK
	nWm0TSEDBir6ef8D5CIuFfeB7CvolBr/QXtsF0TGGuuWqlR9hYYlfiVubvIid6XRHQXUaZGNCv6
	SHTP
X-Received: by 2002:a05:7300:f68e:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-3857015357fmr10759753eec.25.1795411896895;
        Sun, 22 Nov 2026 21:31:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 08/16] python3-pymongo: upgrade 4.20.0 -> 4.20.1
Date: Sun, 22 Nov 2026 21:29:38 -0800
Message-ID: <20261123052953.3658549-82-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132869
Content-Type: text/plain; charset="utf-8"

Bug fix release: retry getMore in load-balanced mode on retryable
overload errors, publish CommandFailedEvent for cancelled async
commands, sanitize parsing error messages and improve credential
validation.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-pymongo_4.20.0.bb => python3-pymongo_4.20.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.20.0.bb => python3-pymongo_4.20.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.20.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.20.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.20.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.20.1.bb
index df07df8c83..98d495ce4a 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.20.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "f773b0aec28687587cdeda490463a82debc4566a4a3620dcc8dada9d2c0a1acd"
+SRC_URI[sha256sum] = "1ac112b3ffa3d010cfc2fc54e3ae677a12c63d18c6115db4451df64f1a1175eb"
 
 CVE_PRODUCT = "mongodb:python_driver mongodb:pymongo"
 

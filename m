Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10246.1795752987701165937
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dsdeb9Ez;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b563e32936so3514465c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752987; x=1796357787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1d4UxHy7Hc1Snx9JWb+t1l3cj7F7EbwARi1zwW9TYw=;
        b=dsdeb9EzbQ3pcLCjt0gZonm50OdUI7s5WB5l1cohMsy8XTt+MCdAK52l8Rp6MJBpNh
         vgg8vkkvZcEMENB0xvqGzeOVf2LrvRnA+MDRpTG5HXnDl22DvkHAZEPdc/CW7VbKk8m0
         GwiSxG5qsRH+WfOsl2/EnpQubXIpi3fzq2tXyeix8xWgRv7zSIlZ46y6AWs1rmS62Adj
         mGsHelHaIKhAB6WDLbocWZBcXWcqja/SJCceqdZ8A3sNIcjVv/sgmwgpSX6UeRHaegwJ
         BjUzumFG7ZqHQWRQBqnCjckCngK87QvIDkfxtLrXNi95r9P+k69SWrqNkqJvA16F/HPR
         ji9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752987; x=1796357787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1d4UxHy7Hc1Snx9JWb+t1l3cj7F7EbwARi1zwW9TYw=;
        b=WuJkKx246JB8owBic1MTNlnnPXU7Z1rZ4Eig3UB/h86zV8Z42fYUmSrMgYeA64z1vB
         AV6k+RAMBmZscbwiH1DDme9jKOqonzj0Rb/AMlcnSxJs+YYQRddTbg2LG+/NBfKfSj47
         q6ePnFENskDOumUCT7mIIBkapYb4vTY/XdbW+EJVsrrUdmlchpA7eqIHaQY+WSCz5S8O
         USdvBvG3wMxFD0IYU2t157Jj1DhSW9d7aIBjYzP50htjYA7TCEuhi+uNCEr/5Iym2q+H
         fAlLNqdKEkl0UIz7tEAfoIXsMS+wY96TlUanGF9cCuT2SsM2ksru6L1HkyeBTKKH3Bld
         Do/g==
X-Gm-Message-State: APuU4Z+Et66AduMmepuPqtOdiILaHc5a9q1n5Pm8ER2pGy3ISzQXMZZt
	tg5CnSmh+DMtPvGaKcRkFUMsw467d8O3c2FLenqrODKWKEIhExVRRY74e7JKrw0m
X-Gm-Gg: AZFdTZfIr9yPjjfnxFfRMC00zsvO4Xh+4gOr/O9wYPnyV3EAuWLTogo6GszBtDTjPW3
	oGFv9gwKzMOgbDm3zOvjQn5jP3Mfx2HIBYnbP3+0P3JfCsw9XTtxUDeQnXonsNZFQCO8YJ1yjxR
	ZpHrVe+b3T4cs/seg7XtdLel5EQgBGaYh74tKROVI61GbhdysSiL2bsshfFMHHNE6sH19b+662+
	VjAw2fuMfFprUTj5grTQHNUvHE5DYirlDljbCsNxY4zPJ3BsWJ0rSKCuXUz+a+LvXpETBPuiAXz
	SB+SeU5inQ+IdLlEohNIrVeNV30ZLfcDCHEVn3Q+yLjJ2IYCSMzngFJ/GftseSx6olAx+GiKnu3
	fJvRiTYkgmVtfGm9zKShoN2gX1AD934AGgkc0tsEXpOvJ/287oQlRc+6HtYkrfelbzefqelDKUS
	dJzfmZWrFT7oAaWmYdEaZ/oMEr7Av7yitcqSEXBT355g0wzvoSKBDAze3wH9ITNUBggvb8Mbh6C
	NBxzTJzyM+qWocjN6ClnREt+Li2XsU3a7r80VtYiPfv1hBXMkInxv+DtgwbTGbGirCfzG+iSnpY
	Z8yifT5MqyQy58O3+a42X6ZFVSA1WNF+MPJLJDj0aE9Q5S6h7ubTvh0Ro8ln4ePCG1RdAnX62zP
	t1jdFLPQs2F2nDF01J8IEn4T1TaDSbSs4MAJgUK1eRpo6a7yDQrm57pb8HAsIINyD68ioQhlox0
	wsGfyAOpiMiSwNSvZPiLRTfucVdfEbgcRV9sTNBD14SA5H4EVP9tFCVG6w0EaxV4z3DzuQo9r6c
	WDWiO17XWZhtw52cqjWvok3GsySTewMnmARA2ARIZh/wciUU/CxrmitRzXYgbkiqiQPyTf4OnHp
	GOLm
X-Received: by 2002:a05:7023:a8b:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b5568feb77mr23187950c88.25.1795752986971;
        Thu, 26 Nov 2026 20:16:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 07/32] python3-reedsolo: Fix upstream version check
Date: Thu, 26 Nov 2026 20:15:49 -0800
Message-ID: <20261127041614.1775064-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133226
Content-Type: text/plain; charset="utf-8"

The recipe follows the 2.x series, which is only published as bN
pre-releases on PyPI, and the default pypi regex does not allow that
suffix, so the check found 2.0.13. Allow an optional bN suffix.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python3-reedsolo/python3-reedsolo_2.1.0b1.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
index f4f820f49a..1c7d1b1356 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
@@ -7,4 +7,6 @@ SRC_URI[sha256sum] = "e11528d63e75461d45b86c23f9db8260303d6ab6cae075fa9eddb44527
 
 inherit pypi python_setuptools_build_meta cython
 
+UPSTREAM_CHECK_REGEX = "(?i)reedsolo-(?P<pver>\d+(\.\d+)+(b\d+)?)\.tar\.gz"
+
 RDEPENDS:${PN} += "python3-core"

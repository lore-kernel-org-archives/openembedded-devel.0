Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8.1794851758044959926
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tt+TQqU/;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3791619605cso7088032eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851757; x=1795456557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3F57JMgGJdFxnZ8iCBCuEyKTi3++JTDrRAge4gDK8ME=;
        b=tt+TQqU/UpSJZtoJuJbrd3+BMHGj48hEQv0mBJ8bmuGjKnh6ZaiaD6bh50HUrZ5pGJ
         jc6KC55/AhVf4vfIA2PmxZbPaVPPF0TVLTAzJQFpsxtOHrMpvTS3YLr/Swl2OR/EQdnC
         eig+7C/Lw7pSQfmcN4JtwRChklHNhanA86ln63osEr25pprpfe1JPP/zbTXD3JwmVk4m
         kij2JBG8M8HGSOD5PaFUoXALESZdo6p7RIs59uH5hUuSAX3yLFgyj5UIpoJ2p1HcDBeX
         D8UkFuzAuTFwtI3wuBQR7GhPCSOw3K/BkhqCz79oMRoTVm6/uBMYl8SUViHnEe/z/jHL
         NQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851757; x=1795456557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3F57JMgGJdFxnZ8iCBCuEyKTi3++JTDrRAge4gDK8ME=;
        b=Z7yRfXHc1tt/qSJQ9IOM1prz7TAJ4/PZ7jVssekyUpZ2H+HehdWSLaqI6D+AlY8AWp
         mLg2fzjnq06e7glHeGZeqE5w2uSPzCKMvNF8fnaRPkU1AhS+xnFg3mADmJCTFO+KHxBO
         RuHRfhBnIvcB3HLEBKiCy0FSsaoRO1SdU6T5Tcs86b7N3E8W3pVRhdji1SqjDhfmcO6v
         G+16NZgE8Yob5kKS1HU0eQaKEyKi94jy5U2Gx3MSjICfj5jpduT9eaxWLjxrR4+nR0vP
         F4nFGM4WUTJDT0h5JOkPgUrnCIb613heon52wFpcu55Q5Gvda5dJSoVFoEEXaV2EjCqV
         4gqQ==
X-Gm-Message-State: APuU4Z++MRvMSr3O1HElwyPw6TPZnOEsD57OqhjzMH+UQXz/xTCXh93g
	IkQZgHwQh3vPoNN3uel+ujTwa4FQVYEria+Z3m3n+rXtl9ec8wG6XCuZQ/x3pLNL
X-Gm-Gg: AZFdTZdIBqgjxe2OPj3KmunBv9SpP1nzQNFHfEVDDPGHF+tvss+Kxutvs7qx76Egdd+
	wrs+wVmjAotSNBNoiIX0bwPlSF34DmWHBYqmG/JVMKAuR116kYPyxcJUcNLC701W1zxebguhmZu
	hC76lwop/rhtio3K0mtO/jv8OPW4/4//80Par3ljMlHcLmzibG8JBPi4p6s1cOBOAq6NLZpPxGA
	uYDFbbfdl6Wjfk5lFbwSnBYvtNdzCvHWYHTWmKqpl1OiV3eR73I7dRz14KoKWAiIuTmS3gFfz9W
	jtqg4UHe71GlzlR1XNmLUtQG937J7c/F6tZiBPlruV8BsAd5SIhDKymLiFo8S9F2UZ+7qfPqAfx
	taWgoGmuSmhSZp7KwEQMoTpuX0diWMIsH7bgn/y6MMjkNIkppbytKvX8oFwpxCVsQ9TaKYH5UzY
	GtjEgwyZFTNs4GmGEBOewBYON+6s7DLQFEHJB5/isTlSVgxgsH/wCV6MrSXxGgJeHfpxz/qlfwh
	wTSRqKaAxnKKqhFaNkp37ojhTBq5wLcEZCmECAwN+TtVPBQiyZkr+LIe403R7R3YknW5vNRzCYJ
	l7aCAdKKLQeoBpV4IjMH5ePf8CfF//r0eOXYlXqfkloG2JM/aOOUvcAF3n8SDCl5lunVXGHau5L
	8snbOxIXLoqNsBYJWfMuv1G1srg+O/Ycp+oRyIb/zEP2ovviUQJcWiajYMZ6Fth1oXJ4TrGjaef
	cWOyjNk9a6Hs2DVxGS6K+xPv35v+DxIDNi6LzPRqEbDcTiMJscjdFt4MqB5cX9gOs6LWvLSVISK
	D9YFjWv6krBaML0GJAmV5IlQ9WPKG6G7mLMyA/Ilqz0XSah/FDNrfKNwyTHBi23FliyoGkmZ64M
	TI0Tzjzbdb9mzFThrbKOeaUsBw==
X-Received: by 2002:a05:7300:5356:b0:381:db2:9772 with SMTP id 5a478bee46e88-3810db29d7bmr277115eec.29.1794851757372;
        Mon, 16 Nov 2026 09:55:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 085/105] python3-semver: upgrade 3.1.1 -> 3.1.2
Date: Mon, 16 Nov 2026 09:53:37 -0800
Message-ID: <20261116175359.342679-85-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132540
Content-Type: text/plain; charset="utf-8"

Changes:
- 3.1.2: deprecate cross-type Version equality; skip prerelease
  comparison in Version.compare when the result is known.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-semver_3.1.1.bb => python3-semver_3.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-semver_3.1.1.bb => python3-semver_3.1.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_3.1.1.bb b/meta-python/recipes-devtools/python/python3-semver_3.1.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-semver_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-semver_3.1.2.bb
index 867124ab01..2d2f9f2bd7 100644
--- a/meta-python/recipes-devtools/python/python3-semver_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.1.2.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/python-semver/python-semver"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3ce011bad2c5218ddd4973952a6db93a"
 
-SRC_URI[sha256sum] = "149b26cabada6f63212f97e94505d21578cb1d280cf714827f328d5e70765fea"
+SRC_URI[sha256sum] = "bea193552413194252d33ff26ce0962b76669bd1c6fb17e8e203ac37f072feaf"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

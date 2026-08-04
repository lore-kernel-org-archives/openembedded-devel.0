Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF8CC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:42 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24831.1785872500990963479
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TTO/s2dB;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38759bcd877so188516a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872500; x=1786477300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvDfQzOnJPfXHYBIG50/06ZqE7YRSFxf53ya0nVch90=;
        b=TTO/s2dBhzNQbvb2HyaqRVw4QdV6QbTEMdqbVM1ZQnCMXIefjfAh6/01Ta2787R2ez
         35a5WrY+NzL5ICtcnyuvvr798ejHMF4RxXBQb4SwDoWGMKCPoPkla0NOH+Jyh4vhyCCZ
         QIKoIB8UDm+3fEEPgRTzq/HBXKdUwM+RyUCu2R3Xh0iw6CWasrmoR/kgA+1iwbTxd1EC
         GFkIJYBhqGXbb5CL+U5eADH1rRI60NM4xwMJgoj6EoBOawR3baxFHoJF+ycKeF9/D4q8
         CVbSUxNR+LlNp/laYQr4L9uehKVs/q/150lI7Yz4qO+RInKPsT9uL3Vkz3YKt01/sIkG
         aykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872500; x=1786477300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GvDfQzOnJPfXHYBIG50/06ZqE7YRSFxf53ya0nVch90=;
        b=ahSskLCvkunFH13r3XAdBq1YOtKnEfXWBBhv7c6/D4Yh/EXPA+i4ApPpQVqxd2QK6K
         4IQif9QJNk6DQaFcB/TheY+4roW00th/2TCJ/jCgkZi1ncGWN2WrO003kX0oHoAhVobS
         k3bm0l7KQhzDcYdeo3LX1u+jtFuXA8B52NXWpThYqoY0yrreluZbYCih1XEn0YhZcKsn
         7xZ2y5mfji/FzLE37ZGIvzqGqshj4UAyK5y+qDLALSva3RB3LmwXKEcNfsXekuIiQLqd
         XaR+uUoAaD2ZFruTuSuVGw/HOZy6JCql/x3SUJf7tPTE4nzDtCHfjLWuhJWQsQho5ZY7
         B6eA==
X-Gm-Message-State: AOJu0YwuXL388JA1LhRvzHWpv8bik0mNC2rQfNaF7J73nAJID19ppLXt
	Rsyl4ajHLYzSTpXRdDPZcfavsY78vKJkHAcKLc7CGWi1YuSaZUeY8QwtANd8KatX
X-Gm-Gg: AR+sD13Aa92oSI036hzwPdR3TbheIBHrLTNd5x1Ijq+lcl+CZzLj/PV/XU6b3gEtZ18
	OHSQKnrWDHrB4R0gpLEJyc828scVQ5+MKS/7sqPDknhUtrFAajFkvcRjHQORXMPx39Lg00E5BvA
	Pk+LiWsqV3Ibzoi2ZX+ROHKuGdn8luMYHHSUDwphlHJ8czjig5iANVipglUmWivrNvC9rCZ4f/y
	VbHcN7I9d3xqUf8WFT0peHgr29rcDMRTak0QBW1TkVyVqInaLoPAY1/goiOpwZmCpwH7b5KEm3n
	9RRDZHxGLUYUNOkMb3uonN5kYr9zXI0fDTm56SdK5ccryWJrH3GdY+e8aOeVqXOkjs4Lr8rY3l4
	3aSyO3P1hYdGWu+r9O25Xeka1/vkXVD65/Z/UGXwhpwNAp4F5pzHtm0V7ssy892qGAnaX9p4LaW
	5tuJj98uK2juWILBpDUSGMuCYWFoUTtYYfmlkAGnOA6Yl5OOeBhF4k0SD2QOpTLD9RJ0w5EY3Xn
	g==
X-Received: by 2002:a05:6a21:6b01:b0:3b2:924c:566e with SMTP id adf61e73a8af0-3cb860767eemr1036060637.36.1785872500266;
        Tue, 04 Aug 2026 12:41:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 36/36] python3-rarfile: upgrade 4.3 -> 4.4
Date: Wed,  5 Aug 2026 07:40:03 +1200
Message-ID: <20260804194003.3158916-36-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128783

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>

Changelog:
https://github.com/markokr/rarfile/releases/tag/v4.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-rarfile_4.3.bb => python3-rarfile_4.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rarfile_4.3.bb => python3-rarfile_4.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb b/meta-python/recipes-devtools/python/python3-rarfile_4.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
rename to meta-python/recipes-devtools/python/python3-rarfile_4.4.bb
index f051e63b62..2229dcfda7 100644
--- a/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-rarfile_4.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1916695551f7eec48dfd97db9467b831"
 
 inherit setuptools3
 
-SRC_URI[sha256sum] = "0d8b5a7ffb9f8e9a7b002f2398905e4420c0cb373e799b48e48f418db9c8816a"
+SRC_URI[sha256sum] = "b7d29d671223cdc80e8b992df212d152ad88e6c961d4426c3fb2fefe8dd86fdf"
 
 inherit pypi
 


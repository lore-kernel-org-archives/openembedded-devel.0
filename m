Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id EF6A96FFA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 16:36:24 +0000 (UTC)
Received: by qkck189 with SMTP id k189so10767647qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 08:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4/M+B4BLgCIdwSldPurh0SlDiPCXi08lXf83I+lFysw=;
	b=M1iqXsH1Fo2JRZK3BktAhPXIrBd2RjPBks1+b8Gdy/dYrdPtjGhVHl1y66xRDaBJtj
	ovR0aQPTFQHb8ihvdJ1Ow1K/rFtFrc5SEmUKOksT9+7agqZVzjlrPtLw+tyd3+XpgToe
	rKyCQiIemCmIvsI1iyudrib48/EIOJltrvpqsz+R8lIwtD7+h68YNLMIqfvXHT9TmRqZ
	6qOTci25SbPDA2F6pOom1eEhhKojQ5JfZJYCwP29mi039TyeZBuPP/ijkPEqwY9o/P+n
	Ohw/57bbvMpBr359Sbd0EXIcMef4vObz0tfWc/mMrHuhWYB/LuoTyEfWdC7EI+M6V9zo
	cOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4/M+B4BLgCIdwSldPurh0SlDiPCXi08lXf83I+lFysw=;
	b=gzPz68QlnkHuXkZV6a6D0G12SdhtBlWxL6WfHuMKg3KcpPjaaeTmo+6RS6D6QndVdH
	PrwlWaNShncO7VZ7OaQgzYEihw+lDZd/NxipFvgVJfp4gg4MBgTSY9cRlEtYWEl0XYvO
	dQZo5JeYPruf2hpYzyMuQRgeq3HJEFkiEHlY41ur9EDgQeycst/9SuVWvVUZPCo/VEvU
	7bvXZKJQ0+3NYVqKWKcgAM3NXImgQQVV2ZfBtmeK28E+isW2YPi4jqnpu+qsK4STU6N2
	tezXYIEKNjpA0xieafPA2alFBo2tNbXfWTrxvEvce+WyydUaolVE4ASYmMPjFD/g4Zvr
	oDRQ==
X-Gm-Message-State: ALoCoQlLv/KMruafxYMlHGq5s/NIJPh7w1ebd1FPeTPXJNO6C5j7Mtl5+EusKtdH3Le89Ld5YqD7LydHh1l2yg6kE0XTqMsh5g==
X-Received: by 10.55.74.71 with SMTP id x68mr24267158qka.101.1449851784800;
	Fri, 11 Dec 2015 08:36:24 -0800 (PST)
Received: from localhost.localdomain ([177.194.217.47])
	by smtp.gmail.com with ESMTPSA id
	s74sm8271229qkl.36.2015.12.11.08.36.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Dec 2015 08:36:24 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Dec 2015 14:35:50 -0200
Message-Id: <1449851750-30926-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449851750-30926-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1449851750-30926-1-git-send-email-fabio.berton@ossystems.com.br>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-python][PATCH 2/2] python-cffi: Update to version 1.3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Dec 2015 16:36:25 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../python/{python-cffi_1.3.0.bb => python-cffi_1.3.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.3.0.bb => python-cffi_1.3.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-cffi_1.3.0.bb b/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-cffi_1.3.0.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
index 0336bd8..f3cdbd9 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
@@ -3,8 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS = "libffi python-pycparser"
 
-SRC_URI[md5sum] = "a40ed8c8ac653c8fc7d5603711b06eaf"
-SRC_URI[sha256sum] = "9daa53aff0b5cf64c85c10eab7ce6776880d0ee71b78cedeae196ae82b6734e9"
+SRC_URI[md5sum] = "deeba7c1fd32a66f1db587988d760c11"
+SRC_URI[sha256sum] = "d45dd39a770b4afb591c82555f6a8bbc1ac7eb019eda9b621eee1a0a72201220"
 
 inherit pypi
 
-- 
2.1.4



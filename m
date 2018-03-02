Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 84B277841A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 02:04:51 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id i14so3139653pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 18:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZvdCLTw6ZZ5AQZatqX+J8khxiy94SXzVaoTZ+ky2nwE=;
	b=Z++Yxpl+3bn+cywCS2jLYG6hlbJWgc5Ke3znsZP2m26HiGBQ7I/tCFikDbRwjd2/PY
	+wHDXftWaO/3pmM9G6ZNvOl/GgMsmMD5FRY5PENGC13onIx2Mb3OQ70nUfmxQF7sTHLx
	ZxREVNmjq/yhbS3EAFvSDKmgKioOtR+sm0UL/am/1DdQe57cMKyM4pyBTt7c0kCoLVyR
	+9QfoKcWxw12Pws3HIqar+8lRMBeMsL3dlNi/1rDapX7cW6BO56b/jhTZaQ17ipZJGLS
	NhRV+Lb051Qe9JPwEF63BBxQmJw9KluhHlKfivfNczFuw5IRAU0ib1NDo9RL2m309icw
	t/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZvdCLTw6ZZ5AQZatqX+J8khxiy94SXzVaoTZ+ky2nwE=;
	b=POh91LL2GZM038hDClHsXOGjC1b1AOMtUlL58Douu6ZVY1HOtjff/ajJZJy5RmjHda
	00aViqfxRFR32Kahl6qQU+CfNQV5oeYz5lTbwnxyRFc0gwCTAQ9unbSa1oFaPVnUIJdt
	W9Lk3oOyTsviuEC1c26SFUUin2PPfAVcP4F9+JJy8ptWfcCKRghYj7mFJSA+yUQYufvF
	CABk5EfVmVAarMRcQncgnp/ax2+8sV8kFDT0e3u1itY/vpTxwsfsnqs0uRtfDxuBkPEa
	KvVlCtkB0fosR6FtcJ49GxZi944Fs60jjyOXmlNT/FccYHPFQ26DhZEmuHenk4otNVjy
	UCbg==
X-Gm-Message-State: APf1xPDcgkxGnfimVtMBtlbWmqFifaGkgSp9uM6LHyvcrtsf3ykWU1gC
	QbYzMDPa800Y7kKs7HhNFqAK1Q==
X-Google-Smtp-Source: AG47ELvDo0izs83iUkozxwcHpDRTxvt5WEmUwrelvCdDij4MNoK0m0eU2UKEJsgHKnDt0k16uQ3ZnQ==
X-Received: by 10.99.144.74 with SMTP id a71mr3184289pge.244.1519956293159;
	Thu, 01 Mar 2018 18:04:53 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	h26sm8461129pgv.22.2018.03.01.18.04.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 18:04:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 18:04:43 -0800
Message-Id: <20180302020443.29914-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [meta-python][PATCH] python3-cryptography: Add -pthread to link flags
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
X-List-Received-Date: Fri, 02 Mar 2018 02:04:52 -0000

It builds openssl module which needs pthread_atfork()
but we do not link it with libpthread, which results
in runtime loading errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
index f64e51d3f..195923343 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
@@ -1,6 +1,8 @@
 inherit pypi setuptools3
 require python-cryptography.inc
 
+LDSHARED += "-pthread"
+
 SRC_URI += " \
     file://run-ptest \
 "
-- 
2.16.2



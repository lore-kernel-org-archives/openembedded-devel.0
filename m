Return-Path: <laurent.gourvenec@qarnot-computing.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E5D960190
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 08:09:25 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p138so2256964wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 01:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qarnot-computing-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yojxBam/X6wMdaElfKnbLr0ysDuFdhuAMDbmkFTHPyE=;
	b=oeChhUN3CxY2lTb0bFPccUQRbfDMpxBTZZElqu9mRkMmRN6Hz97P7JjGxoLNtLLxT1
	TcjVBUlJOKoTeirY5Me+Umjuhis36u0hrD9wJ2VoP4hPNiehG8jAmI3xZyStMnaTwuBl
	m0hhuE5t+bja8raoYDeE6rzZ1fr0wLbON9628ThzLh+2BsWO4h2Ak9q2zjtnzTY2GiTp
	HW6LrX+8ujOy+7r63l8DKDKTbFR5OgRxmBI/8elMov6R7vAEyQbVNNsRt8C0GLxIYuWI
	pwV7UJvSPRFBhn9HX8wrJSj3QsPp8B5Gunh+2zDO335HpvwWp3dq8H5j3MG2PIgy33lu
	cwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yojxBam/X6wMdaElfKnbLr0ysDuFdhuAMDbmkFTHPyE=;
	b=WbHf+Wcq3f+Wvvcieysb/6+RVZWmy0zFsCFSiaZXPwpcT0S7F5cDjOd3mYVNc2ePEu
	knXXQJX+1UWACG5bVZ23byvuJia0OaYv/1Cb42JUPdNQwIawf3aeP9M+CYEXJoA34MT5
	aO9kgh7BbRyLP+3Ef/HwHr+805k8DjVILJhp3cNE08gUAbyFFZmWRy1VaeuFP8sesb4I
	dXWoZpc4JneBZI3Etvkv6QPnojs07iGHOMtpp2580KEauJACNay8AAArWsP70y2iJFcI
	OKykfdxeT7RX6U8zkcmLbHafKfS0J2jNlTbTJHQs0UT1BJZ/jDRkEgCuGmsX1YXEMdTs
	bBFQ==
X-Gm-Message-State: AA6/9RkqfIF/VloYfWKLlnkGEecZCnYo1uBzPv1QeXCgbrcNTa8Twau+12jVOBZ+eS9O4g==
X-Received: by 10.28.143.82 with SMTP id r79mr2336845wmd.7.1475222966654;
	Fri, 30 Sep 2016 01:09:26 -0700 (PDT)
Received: from debiang.dev.qarnot.loc (127.147.89.92.rev.sfr.net.
	[92.89.147.127]) by smtp.gmail.com with ESMTPSA id
	n131sm2847325wmd.3.2016.09.30.01.09.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 01:09:26 -0700 (PDT)
From: =?UTF-8?q?Laurent=20Gourv=C3=A9nec?=
	<laurent.gourvenec@qarnot-computing.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2016 10:08:48 +0200
Message-Id: <1475222928-351-1-git-send-email-laurent.gourvenec@qarnot-computing.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-oe][daisy][PATCH] python-cython: update SRC_URI for new download location
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
X-List-Received-Date: Fri, 30 Sep 2016 08:09:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Laurent Gourvénec <laurent.gourvenec@qarnot-computing.com>
---
 meta-oe/recipes-devtools/python/python-cython_0.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
index 0bf057a..65db532 100644
--- a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
+++ b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
@@ -8,7 +8,7 @@ SRCNAME = "Cython"
 BBCLASSEXTEND = "native"
 PR = "r3"
 
-SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "https://pypi.python.org/packages/source/C/Cython/Cython-${PV}.tar.gz \
            file://0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch \
 "
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
2.1.4



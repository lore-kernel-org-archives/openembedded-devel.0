Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 558767D577
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:30:04 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id b10so14677448wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0yLqiQOroWSWMM1ssFfNJT1ZxojNXPFzNVONf/FV+CI=;
	b=JRkQQNdSS0tXoT3/Edlbm/rVB6smrft89ISONnNx9exvRD06z/zvWcmZAcltFHb+Ao
	xlS8nsn6bFAyHBpzVDo+k4kRlg1P/63qIWPbJjbiR9WVqpwe/9/v85IAfyvxDTnfkHIP
	jv0W6Q1ZkwDUb5ovDRXM5vTHnU53ZdMD81dUIV+KRh+WC82sCM5Xx4SJ69dv4TAVCmts
	0xf2CTOV1QiEfJ8Tpbzay7ZSl0cRBtc9ZP2cklFCdeE59KhucnL5wixsMf1xCUcsOexu
	Xd0p397P1hMYrLUbLMdtCTHQCtY5YE1X7qIGBctrrbqbY2GrikOUZ+9Z5lOVxszQ3amM
	33cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0yLqiQOroWSWMM1ssFfNJT1ZxojNXPFzNVONf/FV+CI=;
	b=Outvuf6GkH/b4QsFyRHRJqYh7Q2HguXJz71JtmP6pSi3vskjVIOCrPfI3fgstlbidJ
	qdby8SiMveYdpMaCqAqbE6eatWmFd5VL6oflcvDKTi3jYTLk9JGIg0ia7QiTK47GCJAr
	aQy3ClV8afNmjoV7jbD7RpjCh2wIdrC/8YWYzyNY2nyHa4uogVD/LQQ4qW144jYhVaoF
	itbJ7r3Hv92cPMYXhYx1SVW9yBy0Zf11TFmlG7Fx/tvlLElc360y5O0O2AR+nfKLkeQO
	E0N0r0aoXjixgGA++kYIiEn+b2h8nV5XDyTuuf7kRRzUN82208m2P8g1Wh743VHQ7zV3
	dAnw==
X-Gm-Message-State: APjAAAUwX5LMbDMdvcI6iKmfWmTPFiBZe96hH2yAyfaIDrnxEZRsLxSS
	qhatrQaugLYv8S/NBiQCeveA1jLh
X-Google-Smtp-Source: APXvYqzzQmZwEuJxiCs3/iLjEd2ZVLlwocFzHhyjofNiOC5QuIo4CXYUQ0oX9n/PVlcL1JHJme/n8A==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr16318876wmk.9.1557131404910;
	Mon, 06 May 2019 01:30:04 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	a22sm7526235wmb.47.2019.05.06.01.30.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:30:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:29:43 +0200
Message-Id: <20190506082948.22276-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506082948.22276-1-schnitzeltony@gmail.com>
References: <20190506082948.22276-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] itstool: rework - it went out too early
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
X-List-Received-Date: Mon, 06 May 2019 08:30:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* adjust dependencies
* adjust shebang correctly - caused errors not easy to debug in dependent
  packages

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/itstool/itstool_2.0.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
index b74d5f607..166e95b3a 100644
--- a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
+++ b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59c57b95fd7d0e9e238ebbc7ad47c5a5"
 
 inherit autotools python3native
 
-DEPENDS = "python3-native python3-lxml-native"
+DEPENDS = "python3-lxml-native"
 
 SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "655c6f78fc64faee45adcc45ccc5a57e"
@@ -13,10 +13,10 @@ SRC_URI[sha256sum] = "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100
 
 do_install_append() {
     # fix shebang of main script
-    sed -i 's:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${bindir}/${PYTHON_PN}:g' ${D}${bindir}/itstool
+    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/${PYTHON_PN} -s:' ${D}${bindir}/itstool
 }
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS_${PN} += "python3 python3-lxml"
+RDEPENDS_${PN} += "python3-lxml"
 
-- 
2.20.1



Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id AC4A57DAD3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 19:36:29 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id i68so11607588lfi.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xR6YY0Kt63SFrXcpOQMP2XFho7JnysYHs06CrqtEjC4=;
	b=LcI4bjynIEzw+5bRey2ZSfowM0TA7qB7rerIBFUZpPc0sLnD65ksJJ9uDw5G5VZu/9
	BZCexhP6wMe7947xnZWTE24tQp1OaGqZttAgIAewyEO6bH8/BA/btFNYxH2ohxbJ9uox
	VNF/dvc18C2o5qtdS1HpkUWlTwNp4s/syGvkYj2Gc53/UdSbclsqUxYrKRTXtQMmFR51
	inu353LGsgxh9o3sazQxfZHANEPqzHosO2eKtWfVhbLs2MgNV8cWx2Pmpq9Ad9eC5CQ3
	eYToGe7FM0SIUeArgr79uDWXgH1yDwzdea5P17cXoRcvxW0ZtBupQKPlPFPthQ6k0SWB
	zeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xR6YY0Kt63SFrXcpOQMP2XFho7JnysYHs06CrqtEjC4=;
	b=oi+5Gxq7EyPszjXqgJ9Q/Nku2elmdXmMCp25tV0D9+03fgoF/inawMYbojw3OuI+c9
	z6AcoB2JOPo2aIf+PFtqlYsbrm7kn6l89XL6ORWNyY+38Ww8xSZ+5faX/h6a7Er+vzAJ
	1OUjA8/CwcW0PKT/JfDN5jSKKmfMRaWe57EPLPMgwwSpcUXkcMWW/NIXumGQchPaININ
	mCs9CfBgtoDOt9hIux+VPKmc7SfbfWPnvOcjjwWxiMqHzS0WFZtyoXhNHKim3OSr7gKu
	w8UnnUDmzh5bTd3ZbmQciGRRlLuKph3M9yHDFPHDgbTBwpmYlDVbmlWzYZHUcD/qjc1m
	SUqA==
X-Gm-Message-State: APjAAAW5jtCE6IopvzpnYtIh1/1jBRNUVgDXjnWY5phvL2+jitd6keYR
	2QoO1f1orN+W+DVnCcEYZZbE8iDvgyWX1Q==
X-Google-Smtp-Source: APXvYqygno6yz50cKQw6PNG+S79HdbJGb2PWeWsbkuGMeE/PoEnKo1mPeMpe2rMotbMzxJYS6g5PFA==
X-Received: by 2002:a19:ee17:: with SMTP id g23mr37652302lfb.43.1556652989476; 
	Tue, 30 Apr 2019 12:36:29 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id
	y19sm8167798lfb.24.2019.04.30.12.36.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Apr 2019 12:36:28 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2019 21:36:26 +0200
Message-Id: <1556652986-22022-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] libmodbus: add documentation PACKAGECONFIG
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
X-List-Received-Date: Tue, 30 Apr 2019 19:36:30 -0000

From: Ming Liu <liu.ming50@gmail.com>

asciidoc, xmlto programs are being checked to decide if documentation
should be generated or not depending on if they are present, this will
definitely lead to a non-deterministic build.

Fix it by adding documentation to PACKAGECONFIG.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-extended/libmodbus/libmodbus.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus.inc b/meta-oe/recipes-extended/libmodbus/libmodbus.inc
index a01659a..b502177 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus.inc
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus.inc
@@ -10,4 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://libmodbus.org/releases/${BP}.tar.gz"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[documentation] = "--with-documentation,--without-documentation,asciidoc-native xmlto-native"
+
 inherit autotools pkgconfig
-- 
2.7.4



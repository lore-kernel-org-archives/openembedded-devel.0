Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id A737B7825E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 09:18:55 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id f28so9537221lfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7Qsf3lxasbFSfsGvqX3HRm6DNT56oXmW5OL4IGPEgxI=;
	b=efMQ43X2b2ocyEXlsxLPTnT64SgfReQHi/490e2V5eVlkz2fJgKDU5yFsnhtBSnPEL
	dXHT+1fERcBtO/I+X4ddayhc2low8Qs0h592Nz6UYqUzEYKCtiGVT9umITyeCcAcOERV
	Boqnd0i5wYIfw0EuCsWnraDn6TDxjlbF4lsNTA6T0/mYKYwus57m5I9uM2CF1xlSTvtE
	4TiIPLvnU20wzI507iJwOTHBueX3qvYVCLiii5RQZ1UqxqWRmZAIxaiLp4xl4Zht1W7m
	IZmPN6dBsZp/Kc9o4kjedSHTmSV76zIbQYixTbR5ggVp/mdmzyj+yzHSywyl74L4wf/Z
	Jmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7Qsf3lxasbFSfsGvqX3HRm6DNT56oXmW5OL4IGPEgxI=;
	b=VM/PNTnFVv6nAbeUtf6Dh+IOVmmylCpSiyDS29aKfaKz9dK71bTJlcjo6OzWv1rOH0
	AelypCV8qWIFT9/dEIDA9F7rL8c+faFWBdJug4qnWox/DiZZERTGsC7kTKKuRbCAHYeY
	eDnTnJ+6uJJVpwwNtYzrtqnm3RZj4s0EZwmPpWsfxcW1FQ7PZphxjLvMkt1T/HRq1Z2c
	TATzlR4QpLTmPQVTIGy+0Nv2U3oYwGr+ubjCD4ghos7U/ev2ftexDwX9IMAd+GxGQa3G
	TrZkI9hnlsxOxd+RHijiIsvTVck+MVG8PKnjnc98JJGT8eAfIIEsPXTg5MblprrJIFla
	9Zgw==
X-Gm-Message-State: AKS2vOzrvmzIznezaSnNf0GoNOGNeiMOnc6kskVW+cyp2eNGNInF0oWH
	c+PTuGrOwCw2xAhUcic=
X-Received: by 10.25.0.67 with SMTP id 64mr7517537lfa.117.1498814336047;
	Fri, 30 Jun 2017 02:18:56 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	t184sm1909667lff.6.2017.06.30.02.18.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 02:18:55 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 11:18:53 +0200
Message-Id: <20170630091853.1759-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-java][PATCH] icedtea7: Update checksums to latests upstream values
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
X-List-Received-Date: Fri, 30 Jun 2017 09:18:56 -0000

Appartently upstream has again changed the content of the files. Update
to the latest version.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-core/icedtea/icedtea7-native_2.1.3.bb      | 28 +++++++++++-----------
 .../icedtea/openjdk-7-03b147/fix-checksums.patch   |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/recipes-core/icedtea/icedtea7-native_2.1.3.bb b/recipes-core/icedtea/icedtea7-native_2.1.3.bb
index df2b01b6af5d..7391c658d7b5 100644
--- a/recipes-core/icedtea/icedtea7-native_2.1.3.bb
+++ b/recipes-core/icedtea/icedtea7-native_2.1.3.bb
@@ -8,29 +8,29 @@ SRC_URI[iced.md5sum] = "200e74ad440f9c4bfa21cc2bd94b4325"
 SRC_URI[iced.sha256sum] = "1929e57eb6718d30735e1e04e9e129457f845f7d7a8404b2b028740d0779ddb6"
 
 HOTSPOT_CHANGESET = "a456d0771ba0"
-SRC_URI[hotspot.md5sum] = "625d903e79e4f9aaf21cf98e369118e1"
-SRC_URI[hotspot.sha256sum] = "69719a9657b15e6bef1bef137a15d830293091fbc46616fe8759e863ba904442"
+SRC_URI[hotspot.md5sum] = "23c46cbb8e8a2e04dafa6ef63bc810c4"
+SRC_URI[hotspot.sha256sum] = "09a64fca0beff0759ef1b461d63ed6a00e43032972781bb3a55e49d8b93f67d0"
 
 CORBA_CHANGESET = "79ee8535bc51"
-SRC_URI[corba.md5sum] = "f9aae602c4d31203fcbf8dcfc5560ad9"
-SRC_URI[corba.sha256sum] = "00bf0b0996484db3d0497345ca5b14db4ffb2288b6c7adf8a003b2eafc396fb2"
+SRC_URI[corba.md5sum] = "0e04317a6a74fea66ecac51c6171413c"
+SRC_URI[corba.sha256sum] = "f61dad8d484e4a9e645b7fb73da87bc44f9986a074629154f37ed46be05f5b84"
 
 JAXP_CHANGESET = "77e7219c7424"
-SRC_URI[jaxp.md5sum] = "440258a557c3cf0d585304a04ab060b8"
-SRC_URI[jaxp.sha256sum] = "bb4beb62fae52d0ff871aefd64ae54eaed8978bff87df1e23f1bfead40ceae6d"
+SRC_URI[jaxp.md5sum] = "27ea9ad4c7a4c43eb1ccab8a0f365a50"
+SRC_URI[jaxp.sha256sum] = "9cfbc0efaface20f7188870b9bf5b0ebc73d745cd9a49d013cd4e81ba223ccdc"
 
 JAXWS_CHANGESET = "d92eda447bca"
-SRC_URI[jaxws.md5sum] = "52b1d409628184988ff0f1d1e4d0a853"
-SRC_URI[jaxws.sha256sum] = "566778320a0fa18ca93427d6afadc8bd3e416fd8249f9ce88e37e215f9295335"
+SRC_URI[jaxws.md5sum] = "4fb688cb0e2c703dfdedca187bb94070"
+SRC_URI[jaxws.sha256sum] = "6d0858d46b68d6e8488e70d1675e5b656aeb4ef51e8ee4e330e77219f92c1c0c"
 
 JDK_CHANGESET = "d7ecb57d3c61"
-SRC_URI[jdk.md5sum] = "db2a0f91f27ad7ebbc68db53691ca403"
-SRC_URI[jdk.sha256sum] = "b24bf93559804610a6e1078bea94adcec1b2f818dd600b12304926f6e86c6747"
+SRC_URI[jdk.md5sum] = "0e90a9d980d44998083343a3a7614bb5"
+SRC_URI[jdk.sha256sum] = "11146763409098a42dd9896f3fb7e7324a58c5cff5298009eb347ad26abeed51"
 
 LANGTOOLS_CHANGESET = "fd2fdb20d858"
-SRC_URI[langtools.md5sum] = "702becdfee546841ed038c79fa1a9909"
-SRC_URI[langtools.sha256sum] = "10fee41a0cdd1b166ff78e6426430c76af0f2358d026c181d325af1e41646c34"
+SRC_URI[langtools.md5sum] = "48335bb031d4c75e75823e2d70f17ef5"
+SRC_URI[langtools.sha256sum] = "3a4039348aa49547fffa96563b77b704c72e2ac3ead2c132843ba1e9fe4dbad2"
 
 OPENJDK_CHANGESET = "f89009ada191"
-SRC_URI[openjdk.md5sum] = "2bc941373ca4b033c9a25f972eec7858"
-SRC_URI[openjdk.sha256sum] = "5efd8e66f18fcbf45527bcc74aa3e6ed11f66bc793c88e3841925c4acb4827ba"
+SRC_URI[openjdk.md5sum] = "c26bbb33addfaeb14d28a1329b4b5a3e"
+SRC_URI[openjdk.sha256sum] = "54a0ef02b56b265b4122324e08a33c42ececbf2a300ada260611e7b6ccdba96d"
diff --git a/recipes-core/icedtea/openjdk-7-03b147/fix-checksums.patch b/recipes-core/icedtea/openjdk-7-03b147/fix-checksums.patch
index d7d1eb678168..cf93221aab04 100644
--- a/recipes-core/icedtea/openjdk-7-03b147/fix-checksums.patch
+++ b/recipes-core/icedtea/openjdk-7-03b147/fix-checksums.patch
@@ -17,7 +17,7 @@
 +JAXWS_SHA256SUM = 566778320a0fa18ca93427d6afadc8bd3e416fd8249f9ce88e37e215f9295335
 +JDK_SHA256SUM = b24bf93559804610a6e1078bea94adcec1b2f818dd600b12304926f6e86c6747
 +LANGTOOLS_SHA256SUM = 10fee41a0cdd1b166ff78e6426430c76af0f2358d026c181d325af1e41646c34
-+OPENJDK_SHA256SUM = 5efd8e66f18fcbf45527bcc74aa3e6ed11f66bc793c88e3841925c4acb4827ba
++OPENJDK_SHA256SUM = a7532b99d7e30a92e6eefbb68e41e5a0853ac8b037e43712fc2c4f2ccd8719ed
  
  CACAO_VERSION = a567bcb7f589
  CACAO_SHA256SUM = d49f79debc131a5694cae6ab3ba2864e7f3249ee8d9dc09aae8afdd4dc6b09f9
-- 
2.11.0



Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web12.7971.1614688793800319938
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 04:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=X9H8F6fV;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 03C525C0190;
	Tue,  2 Mar 2021 07:39:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 02 Mar 2021 07:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=25tjQINhM1/g2ySS3KpDiD90Nr
	hi5RZ/vsurOEvzr8g=; b=X9H8F6fVruExOJkyr0pcQRfENfY6AivjwS0dXnHg6A
	6KLYYFjqswa80n3wGZF29u143T7bmp0whzds9KGX9KvEAZD9VlpqmhB1Wglol7Rh
	fG2K22qXDj3GV2GMPRpnNfVG/p5QcuL+JehDu0HSQVtgmdSwa6vAVR6BE9y6Z5N4
	kbYf2+BPdLoqKeJmMAs32S6ev9PjzvUEVfVQcrAQjI6ARY9QlA0UNjTxgFjM7/vm
	GyDlJ59AlwcnESv3rhUQHwSaC0MsOO6AWNa5ZOg5uscx+QbD4RHzcV72aocKdEvI
	Sog5qVSscUfBH8Ypua4T5wsWoHGeHoYuGcKqhXcw2zWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=25tjQINhM1/g2ySS3
	KpDiD90Nrhi5RZ/vsurOEvzr8g=; b=wziflBnzjJ2z8emRbxK0+r9UX7+3ujo8z
	IQiKgUtH1w8Szvm2PMY3T6L4HW8Xv1ThaJjHmN4LMDveTocP329nz6uginXDhoh0
	iWX/BS4+imStiX7LRJdLT3dODeCdSDwbMwaEsmp2zOtCzY3eMThsOM6WX6et9prj
	IIw9TRgeY86ryoPY7+1TaQMKuWk24WgcwQ3WkDraryyHAotEYsILK1huYuy7Vgru
	HhKZRjx5ILKUgpT7nhpz5TXZmiooA0LEcsq7R53mGbKH1x9h4M9zQi975dH10ZeO
	6Y/k4Zj6U+Bpp1s6HSG82wv1CeliaPOKJMBjDJ6llNX3iz/uAXScg==
X-ME-Sender: <xms:GDI-YGnHcgwoKbJ80elsLeSP75_OVBgDJMNFzPe7mZsw8EwHs1qMKQ>
    <xme:GDI-YPY52heJjFMpqaqUMuhyhxd0edBjnizE0k5z-fg_m2wea6wo_qaGioLLX8iwc
    5zcOTzskF-iK_6yfwc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpedvvedukedtudejgeelheejfeelte
    dufedtudelgeevffefieetkeevfeffvdeiveenucffohhmrghinhepghhrphgtrdhiohen
    ucfkphepuddtledrudegiedrfeejrddukedvnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:GDI-YK-YkXLv1BEaxZdNZD5aD4VYU8EBoEa9CPFZVpCDQ47blA7xwQ>
    <xmx:GDI-YGZ1JY7ORCApxq3JocQJ0NKZ_VAulBqUgWt5k4veb0kIjA8mAA>
    <xmx:GDI-YMeh6QsBHBwcSGO981oF5QtZ6v99E55PF6QqATZRw_IYvt6zQg>
    <xmx:GTI-YJGC26K8HXFWh3AyhVMLX-YnjRoBsHGZ87fUfmmZKVgvsg-GeQ>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5B2BB240057;
	Tue,  2 Mar 2021 07:39:52 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][dunfell][PATCH] python-grpcio-tools: Fix DEPENDS append to grpcio module
Date: Tue,  2 Mar 2021 12:39:34 +0000
Message-Id: <20210302123934.1585766-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

There was a missing whitespace leading to errors like:

ERROR: Nothing PROVIDES 'python3python3-grpcio' (but
[...]/meta-openembedded/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
DEPENDS on
or otherwise requires it). Close matches:
  python3-grpcio

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta-python/recipes-devtools/python/python-grpcio-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
index 1a15c48de..a3d34cf46 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools.inc
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Google gRPC tools"
 HOMEPAGE = "http://www.grpc.io/"
 SECTION = "devel/python"
 
-DEPENDS_append = "${PYTHON_PN}-grpcio"
+DEPENDS += "${PYTHON_PN}-grpcio"
 RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 
 LICENSE = "Apache-2.0"
-- 
2.30.1


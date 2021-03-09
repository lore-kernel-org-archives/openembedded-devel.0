Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.13143.1615312090838541366
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=jMiwD3DR;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id D20FD10B2;
	Tue,  9 Mar 2021 12:48:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 09 Mar 2021 12:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=k1gQ9E3okHTzphBLU1E6cDuT6O
	VeXgfP5uqJx45/MRY=; b=jMiwD3DRTaJ2k7zxoYs1hkPJJsqVqeJ//3KSCZMuP8
	jIBT7JtMtGuo6AwOTXvOWQ13srkmMv9CoAM0yxHINATh5987AuvfAOhI1DTcaj4I
	7lALg70Gr/3l0fpZ8RQKs53Bof/vjVf0sedo9I8JDASGvlFY3xPDSG4N9zO7y0zc
	orif815tgjqa6l9aXqQtrNXcjoHeLqmDpYK32pDe03IVMluJTcsx/fBdjd85q+62
	32SQjO2xQ3Vwtkk96ZiUL4Pg2nlirH5xBbLw9UsS2mAdzb+7ivKhfVYvk8RmEH5O
	GxnLHg8sr/yCttN38gjubz3ddJlRaXazZSd84jeWB5Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=k1gQ9E3okHTzphBLU
	1E6cDuT6OVeXgfP5uqJx45/MRY=; b=HOFGrJ6WAhPWLiybgyREIHlcHnJRnYlYF
	HiMuf47lDt0lN3XdHKyXC0X26xnqgc/YhsYFXtFKX01ZcdguXsILLZsVoIOBJeaF
	qolEcZE0m8nhs7NN61S/wJ0eQLM4uTEam3j+BtetT6WpSzz5Qivq8El/G8XIDDGX
	SUAQOVg7PynC6WEfTnNaeFTcsWQSJYjHCUeQWly+aZEG5Yo6U5Ki9/5HP6l7MFy/
	TFxQt0RltB9sB5OEl7/5qn4wGWTWLvCttWsQ4jFQwQg13GdyyfNYpoK3E/8hUn6s
	4DGSAmqa+vj+6pLF0+UZQo22hP6/vIrZzspRkv0eo8JN2AQIvmf5A==
X-ME-Sender: <xms:2LRHYBwLJ52Rr9_cxm5bUoKorKMaJSlJRQoLujeSS6dPFfemu-MBZw>
    <xme:2LRHYK6V_1663L0m7896Rq_6gHpaIO8egYzoyRa90CgR7N-Vv-4xwtqaZW8BoYU1U
    eglPoGJQp0Y6mIdDOI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjeekteffveeklefhveeludeuke
    ffiefhjefgudfhieetueelledtgeekfeeiffeinecuffhomhgrihhnpehphihpihdrohhr
    ghenucfkphepuddtledrudegiedrfeejrddukedvnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:2LRHYLUGh6V0rhEfWBWFcM5UHsYkaE5lr4qpDRn4ytOLb-IHr3IE9A>
    <xmx:2LRHYG2B3iNrISj1Qf73KzAu5pE7CPavWDcW4no8-S__lgvRCtkCJA>
    <xmx:2LRHYA2NS-2jzWWK8sMkVVtyfCsGr6CA3awKQ4-cDNik89xhP1vcbQ>
    <xmx:2bRHYNU5gPf1zgdxFHuqTj6nlW6JwigVSVVT2ybWqcyZcIQ7a_idYg>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 79DE41080059;
	Tue,  9 Mar 2021 12:48:08 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python v4][PATCH 1/6] python3-ifaddr: Integrate a dependency of pysonos
Date: Tue,  9 Mar 2021 17:47:23 +0000
Message-Id: <20210309174728.207503-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../recipes-devtools/python/python3-ifaddr_0.1.7.bb    | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
new file mode 100644
index 000000000..4fff7d1e5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Cross-platform network interface and IP address enumeration \
+library"
+HOMEPAGE = "https://pypi.org/project/ifaddr/"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8debe8d42320ec0ff24665319b625a5e"
+
+SRC_URI[sha256sum] = "1f9e8a6ca6f16db5a37d3356f07b6e52344f6f9f7e806d618537731669eb1a94"
+
+inherit pypi setuptools3
-- 
2.30.1


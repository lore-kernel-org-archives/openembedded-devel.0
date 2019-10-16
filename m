Return-Path: <prvs=185bab654=alistair.francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 50A287F37E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571241815; x=1602777815;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=raPGpBsp4Wme14dyjIFhvyXAKSykcxEDdtscLs6sJpQ=;
	b=b08i2SLB2Tyaizm7PXFtFr4bvrcjyDERKg1aMJ3PRqDw2IhFf3SnZY2u
	iS3hL0COIwrBLYWdIzyLIX69uhLG6sgahrnwMc1FKTSbfBkiRr9mz+9b/
	kzQarThZLg08kztL9Hi647X3f5gN/UHriqyw+JWU43tt9spjHU9E6GyJZ
	FHiualDTTD2ozetHYAAd+jzhiRrUDPkwsTjHCDIbcHpz4HGOal8+42yZ+
	HfwUuqPDAX9di2THvawbHw5hUuWpPGO2DjcdaO0yvtq6Tx61KB9fKWEht
	12XDk4K1kWqkW6XHWhTfzkhtCVnAHB37aLxdtLVgd77tFQacHx7dq1Ebt Q==;
IronPort-SDR: MeCRZec+MR3kkQsZJHULfjeazYJ8JkzbKt98B8gHjiWFglqNicfCojpe6JfAmQmDQGGu5HmC5h
	MJ+Tl/8SJSAs/qKz/oxer6ZzS6938fMvwfqA4UgRtf1QGy8gGOMPBiEMqg5oIQxep5W5bhgRtG
	JhuQgxHAObkPYVkilsPn6Iy0CpVB08uwHILjyyfBT/ig4MC+5LnbEOB8gRA+pIGw/FXfEAdxqO
	Qn7Crg2gxYAOVZffNkUey+UdgTencR5SO2Tj3cX3KhXHqSubbttSb2E7sWB01k+OpiEsk9MqMV
	gbM=
X-IronPort-AV: E=Sophos;i="5.67,304,1566835200"; d="scan'208";a="120680403"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2019 00:03:34 +0800
IronPort-SDR: X0n54M7bfWMe+ac9aKZR9OYxISrnFto/WdHTKD3p/45IKTPQ1Du8IEBrrts2EpYh4VI+1+RphD
	RhRvzchtS2ChysCDhqnkpZXp1GfWIsDMVWraIMB2OQAIZmNgs69BI+/RUTfKE/YEqysunkJcqv
	Apfbftv6/lgUcC6fNB8s44k96WnUmUMXCgfhnEE1EW6rTg71nEq22bymgKxGCbT2bGngCWY3+X
	T+DanZx0R6+eQCsI314xpDUfDyvbn+SAj8N9OCkA7uz/JLKEE1pt89SPhj3KPTZZepVYU34uEE
	7u7Jb6o6zigMfwJpfdvIu62i
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	16 Oct 2019 08:59:22 -0700
IronPort-SDR: D8G302+O/DdqEBNcEoNkJiVyajdvMX+wmAF1zAWLjn1VDj/mfwqAl/RG2M9/V+ZWLKtCxCj1s+
	xZxsknu4QgnE81HkITeF0wH536kaVPl8I2/dWL3I2x/F/5olcrk6c/APlgGgyNh5RdOb8G3bJk
	lBRtIHCsTpaDhPiG2CmC6pUK+8jRhLn3pWEK5xzmjYSayxmUMZnMH4wsa2GicBrhsvQweXg9al
	DiFMkg6c2LC5SAQWqkiO4JLI5MDU+fcXh4lqBB1GEQu6KDiKn/JeUJOP+0eUs8mQVKwdzDXZmN
	RUk=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2019 09:03:34 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Oct 2019 08:58:44 -0700
Message-Id: <20191016155844.20847-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016155844.20847-1-alistair.francis@wdc.com>
References: <20191016155844.20847-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 5/5] python3-google-api-python-client: Initial commit of 1.7.11
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
X-List-Received-Date: Wed, 16 Oct 2019 16:03:34 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../python/python3-google-api-python-client_1.7.11.bb    | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb
new file mode 100644
index 000000000..25e3b9c3f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb
@@ -0,0 +1,9 @@
+SUMMARY = "The Google API Client for Python is a client library for accessing the Plus, Moderator, and many other Google APIs."
+HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
+
+SRC_URI[md5sum] = "6e28e8caf2e4d55ed5b7c48a538a61c9"
+SRC_URI[sha256sum] = "a8a88174f66d92aed7ebbd73744c2c319b4b1ce828e565f9ec721352d2e2fb8c"
+
+inherit pypi setuptools3
-- 
2.23.0



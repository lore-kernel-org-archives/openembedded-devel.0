Return-Path: <prvs=184014d2e=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 835E07F46F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571180344; x=1602716344;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=ZI5Ml/jWMkYhiFlX0OCT/l0HzI0E+Ynae2kVaDciqHo=;
	b=MnBSjKkVkZMUD8jojX6CCiwyKvKP9iG7fT5jDxgHznRb+DBeLKSV8k4Z
	A+6gXOn69Ik6eJEKM8t/TKW52J0x8JRRkP7GGBiCGEWnJFkF8Iu0BtsR1
	TJ+hgqxDWkSPE1Q0prfH7h7KOmNDaL4Cy9fVdZoFWfoovrlBYn13QErtm
	0Ry55LcfTTq7HzpQj2uDpNdGQGd+MQRC06Dq/DajSP5cNDNaGvIo9eX6N
	mDPwC4pBEbY1A+nlmJmzSrGvuiFodhpVez+ARsTo9BK6/4CCDd8Gi429s
	xW/MWbZcjFcQfAyDtcH9fQJvbJ+njOTlDCGKrgxFZ8NaYO4bVN5kbSqWo g==;
IronPort-SDR: Y5KUi21YX/fv/Aff7qUtBE4XIECDcOYez261ytkQy6zXqNXvsCrI//Lg75S8B0z9jSXnuJGw0C
	YXAe8hU5gQHOf2R2FnzBn2WWMXYD/ElVlD0uWsidJa6JCNc+bfjC0ces56UegiWTss+L7lgzxv
	Z2ZSY/weYGbXRidu6/zSnDm+27z+pqD0feUuAT2fl4ZsDgvpzRhADRFjVBBTeHpj4ZI9qZrgl6
	g089MESghWRegAe+cb+pAyho+FjgPTlRTjMi0do2TKtsamz8VV8eyXznjf3o64NJmeBxUjojzR
	7ZA=
X-IronPort-AV: E=Sophos;i="5.67,301,1566835200"; d="scan'208";a="122194673"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2019 06:59:04 +0800
IronPort-SDR: ZJMQEZGc/eeNf4ihIQME7HnhS/cR3NjKUdMI9SpOUt/MMchFEQJaKr3DTg8JfwFT/HQPbLg0rM
	yTTVLqrTs72kdoOYC1e2qzTcNQ+aHlCj6/YaIefFtOGl9ulzLr5MkaDML2tb+hf83qsPa9bwKG
	mu3jfFjIoZoaqiM9gQDToO78VlXIkY1bMS5RXTc+60Vd+/sdQqThQkC7imVeSKE147/znAosNX
	KGdUZJlSpp3cdzkvYCAJropx76TfXydQJsTl5RG7Bp+dXDhD5D2hy1LMBJnQQaRT43oyGy51q3
	Fv6t2YRuGorWdNWcWVbqE555
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Oct 2019 15:54:51 -0700
IronPort-SDR: 6SM3UYYseqgI9bKI0jLvXPU0yhAfExwd9ZZsB0e94rl/06fkU8zFCuABnW4o9OAm9e39ZR/Vk4
	G+lGnggwkfQEqSrnUVVqEJOBxwuXwBtHr4nHWYK3IDat5NWWgQ3DwpkhqA2j4tm0KIu9Rzyr+h
	fRd1B1pPjPVA49mjlj6kU9NkKb1qAVTOEeutoE9nVtxHBGesQbvczXsb12ZYBDN7NIed+6qthT
	wCckI1A0Mt7z6ohdQ3MP0naQdY56v3DzaUPo5lPNyopivbFEaQ4CFYZ2xveHTeSbOQgkDjrXWy
	D6w=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Oct 2019 15:59:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 15:54:19 -0700
Message-Id: <20191015225422.18179-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015225422.18179-1-alistair.francis@wdc.com>
References: <20191015225422.18179-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 4/7] python3-msk: Initial commit of version 0.3.13
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
X-List-Received-Date: Tue, 15 Oct 2019 22:59:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-devtools/python/python3-msk_0.3.13.bb     | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-msk_0.3.13.bb

diff --git a/meta-python/recipes-devtools/python/python3-msk_0.3.13.bb b/meta-python/recipes-devtools/python/python3-msk_0.3.13.bb
new file mode 100644
index 000000000..3f2aaf48d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-msk_0.3.13.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A tool to help with creating, uploading, and upgrading Mycroft skills on the skills repo."
+HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-kit"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.md;md5=2f90e43663eddf1c33087419fbb35e28"
+
+SRC_URI[md5sum] = "11d9fc865ef627efe68f25fc113974e8"
+SRC_URI[sha256sum] = "55be86ff2cd0087016759f2b15b40861cda2a8d8a8d0c669fdacdf32a77a10da"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-git"
-- 
2.23.0



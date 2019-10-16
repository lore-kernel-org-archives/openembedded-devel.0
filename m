Return-Path: <prvs=185bab654=alistair.francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5885E7F37E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571241814; x=1602777814;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=cUtfShSuHyW3Fb+958svYpfwf7L1XqUC0KrZLElftn4=;
	b=nOFEeOXjI0GSSj3m7wTKGu520rqMzIKondrjbX5E7cPUxrdgalulST20
	EKtfaAWAmany+QMsqiJw03Iz57FIgY8gpmDjwKK3mV4OQamDgGFfNP0LX
	ogkfBrUQ6cABIVlscVILtfx4huplG5YD6it+/NDHt/any5KjzycQMZli4
	s5u5ZUh0Pks7amHtN9W3XJtmNpMSuIMLMzOA19HZlOykXTjIUsVcqkQGb
	xexiNyfiKLMViNYyznBXWevADRLs5wBqrWilDZaYgEcoa0MV0whhpl1li
	ooe64xuB69wypvsZW7nDn9hBJX/dJPC2th9RBvN/qxheOJQXU6osaAD53 Q==;
IronPort-SDR: wIYEfOdzyT5/Vu8ooXNWB/S/EvPYUknDn3DCeu3cO+OzMXCMAiyg0Mg98tiqzCaUr38GI7vNZD
	T/3rwNsT/j7f/u8IVi9gGHuMHAQH6SN64cAp6wJqeCfmgqPrLRLRddu/UySK7nq8lml4WWAm/c
	ltx2pDJ50DqoS5hppWZ6qArdnW8v6WCkbbpQYOyjBi047m1eSKN2D5ykm0LluvlW8lL+3YRRVe
	iD7ORp3YjamANP8Uw5vAxuVdkE8ccDoqJfRXKfI1zEuQFVDk4tRD1fPh7hraRuq0EZmUhJYl7Q
	Bg8=
X-IronPort-AV: E=Sophos;i="5.67,304,1566835200"; d="scan'208";a="120680397"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2019 00:03:34 +0800
IronPort-SDR: 0LeCPgNfJZcPBYYteEztEV9OWJA9US8Qxa9/VSagveMaqCv5YCSmoQCLw+2hYOHt4jjKtX7dwR
	CUtI03seVXhcFiQ6dpGj/hpAsWvaj1UO/xkPSzQR05wvaohwOIUUbEXwo5RKZQgbNuH96VBhV/
	Ht5PygUsX3fZ3OrJ2Jd+hMLhtTgyYBpaHw9QXPPndRKcbAvXrsxY5CbiE7KYzOxq7N0varbIXp
	MxhpLE4KqwJfr571lEzLhJGypfSGRfZOZmvlNFMbx4HWz/veP3gm96BQTDxI8GTe0GNlsxpXQd
	4VUBzvL3QXRE4c3y1DTf78tb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	16 Oct 2019 08:59:21 -0700
IronPort-SDR: Kfbx2ONVW+RqR2bCHN+Ku7teWc0PwbqKF7R9aIjgaeCwdW7gOJRUk/djkYLKuSYnKthIaG/QyE
	JJ0xYeEJmfZwokMkp31mHGs2EpBiz+e8pMuobtiXp/nFyCmsm/a/ru+GEpCM1gONBJyqAdplBG
	P+N/sXy8VWAs/sHHY/hHdTZf4EArizC1/b/v450bl8Qh6mFNf2ujPTJw8iHiuLjf/k1Neg1+XE
	rfuYJPMeUbui/TgDEAKWvNZkoKVjt+LXTEJf2WhUVypRuU4Ef5QrR1cC8/wWXS7Pom5iHDKNgx
	f+Y=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2019 09:03:34 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Oct 2019 08:58:40 -0700
Message-Id: <20191016155844.20847-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 1/5] python3-pako: Initial commit of version 0.2.3
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
X-List-Received-Date: Wed, 16 Oct 2019 16:03:33 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-devtools/python/python3-pako_0.2.3.bb        | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pako_0.2.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
new file mode 100644
index 000000000..24efa44e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
@@ -0,0 +1,9 @@
+SUMMARY = "The universal package manager library"
+HOMEPAGE = "https://github.com/MycroftAI/pako"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
+
+SRC_URI[md5sum] = "8eb7077075091c50e4b8a9f939607277"
+SRC_URI[sha256sum] = "6be55fd8c5a2a6f02974f37438c1c47a3d9e764ce81c9d0a1a8c9a1815a59778"
+
+inherit pypi setuptools3
-- 
2.23.0



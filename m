Return-Path: <prvs=185bab654=alistair.francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id B05037F380
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571241815; x=1602777815;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=xaBPsdLmq29afAShvmKNC6IyODs9Ho1i8C8DsFbcGmU=;
	b=QWenludU0zXk2TvTYOXByAbily12rKvOS2o1mIt48rpBN4cWoLxQgmtF
	mANFbp/RyI/ipx3Qb3y0PRc8hvPySafOIxG16nngXLEAx73lit8aVcWD3
	NEYUPVBdb4WBh9NIFhYUH6vlQDJGpesOx6MrP3+JOKfkexU+F8ssaf8sa
	/v72C9dvZ6VjBDOhS47XGySt/5M0LGCUYKoM9oz+1ZQ6U8/3IXM30Kr0e
	5GEz50BSyLRP3uSE/Wmtka/ofmiGx/mG/qCgVq969SR5asobeCjKZj8Uz
	xauU1n9UsGwj0WFGQn7Dkf3ShKwft0fEG6YbpGLHlPnSpFDL9YX5/Z8R/ g==;
IronPort-SDR: k/JJKawjk2YX7yTxSLfyo38Vi+jtu+xtO8Fnp+d1CHrQqCdwLKtr/P7LqF9kyQFVc/C4eVo4CD
	m4OaYBkyi1i1qF5Zilymr1IEWlKZvw0xSp10/hckMJNUBf1X4B4pOKD4/pt/mdg2OLQW0Wcqd2
	XfNLqd46wBNEcDmMIEZAU6bpwbTeSYMjDi8scJL/cqTlDKoIdV+85jLYa4x3zSQ7e1G9gQ9c/g
	eA0Rt56/7BJkvXbzsXPMOYHW+syTmz9W5QQ0oEANFRYCZZ5BxNiCUz1+kKjvzEOqfYMVjYtWMO
	e/E=
X-IronPort-AV: E=Sophos;i="5.67,304,1566835200"; d="scan'208";a="120680399"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2019 00:03:34 +0800
IronPort-SDR: dzn+WgexQEa36MzrRVsPnR6SGmXx7X5Ob/mX/67XibTqjSqoAuudhtqjAOtJhZKcAmtXhLrtRZ
	Y3yZdpH83s+5iqOPadctQ5xPHoTJ3ieBXUeuXhEEE30lis2a9bnv1jE60frnTyOQKAwdTR1z2G
	x5K/EbTlGnv0xWOfcPjQWSPxfINnjTv/BNcYEJTerZvctiZh8NSf4ZhugnRAao1SzZpk8Tr/gG
	pW8aqSXSgWrUQdNemqrcof9VjnsWK0j+f7OzKrwUDN/wzkYts7orSVOJNuxdjgkBjjRAuxsUUV
	/eK0xvHnyczASbplYATvhbh3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	16 Oct 2019 08:59:21 -0700
IronPort-SDR: ZaiW/ipxVYkMoTihNnGKCT8pbUbyQmqNdO0jl/yp3SPtI+/0lOUwQMtjtUzyERSTybvWJLsYYE
	SFsDkqO0eGTcrjMCSpECkFI47ElilrYo3zsnqqdpXgNfm+Ot6MWycay0218NSEkyBZ+01e0s7X
	myZGjTHEBVgyPiKizMn8kcrJy2SuDXPpkaRH6nDWjuiGcg8z1zm9PrfsrDfNDGN+yOLBTxDejZ
	RZLKQO+ZkLzYna/fjUcoq9K9hvo2K+eq0yXOKBuEQTiyGbqwUbwSHADLXSOlz7nky0B9bS+R08
	XaE=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2019 09:03:34 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Oct 2019 08:58:42 -0700
Message-Id: <20191016155844.20847-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016155844.20847-1-alistair.francis@wdc.com>
References: <20191016155844.20847-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 3/5] python3-msm: Initial commit of version 0.8.3
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
 .../python/python3-msm_0.8.3.bb               | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-msm_0.8.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb b/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb
new file mode 100644
index 000000000..24e1ccb3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Mycroft Skill Manager, in python!"
+HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
+
+SRC_URI[md5sum] = "d5f580c58389b337f5577cb92f36e788"
+SRC_URI[sha256sum] = "c201785997f3b766ec376a89bbb3367889ac542183ca26733ffe002bb94917b4"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    python3-pako \
+    python3-monotonic \
+    python3-appdirs \
+"
+
+do_install_append() {
+    # Stop this from being installed
+    rm -rf ${D}/usr/share
+}
-- 
2.23.0



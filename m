Return-Path: <prvs=156d039a9=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id D36887FD93
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 22:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568760126; x=1600296126;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=mXGRL+6qcNXKFyDubpW7tFmsl5W49LrFTF/TK8s90uo=;
	b=G6XNXx3IAitGrR/Qwf2buxj2ob6NBlUsebnF40uh2chaP9tnG4t1xTZF
	pGGf7mu9xlt/gd6CzNGOfzKHEJFvuCbvyfHVzw6G7Q0ymv2Hfu+9g1QYP
	1PZzfwPoq8LAC95nFvgj/M65YVVxPS4nJoxsQ0GEXp3p6U9n2i/PG4QOM
	rmJ103IzjXFA+8agybn8n/mofKzzcJxsYseAWNSAlgfYAxNDfYu/HsOem
	ve2dKU3hJoNvA6YoVP6gJXC00n4mylv19huYKoa/yLDj51HoESIKniV8P
	N3CPByCDgd3Ro7/tCf6jNC/5uSfWBLIZvgfCKu/wWcwuIzG4ABz9VbrM5 g==;
IronPort-SDR: TfVEZAB9XFKG3bNQl3q8lAKfKwkW/KEsrD/Eshfnvp2oogyQ9Taz+1wR9qsap7X7BMmIkJi6xd
	ZnbX+nHuBs96/Pq5JUrR77GOl7ErnEX84EGiczEX029b21F+HgCF6X3auS0vR+s+LGwTy00a93
	+6dRyxWTQIpf/nk+NQ86pzEfxWtOmHM4SRt42nuDKdrnLha/NtrhuAHSNsCKnIkMIrIO9wej34
	HejnMhRE/r7itrAtrOygIsR85uzU0boRkHZ48fvBAAvy6TFs+Q3dKaf7/ox9c/383QvTAVft00
	LMQ=
X-IronPort-AV: E=Sophos;i="5.64,518,1559491200"; d="scan'208";a="120052154"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 Sep 2019 06:42:04 +0800
IronPort-SDR: dFVnEOHQCxqqs0h0tlwpY+Rp+kBFCPQb529AVDmHvNbLvsOFfCvVOpVRpHur2fC/MiAOmPPVz0
	KdoH6TOMRl3XWCLu4+qYs2cksgHLdJEw/jUQl1Yk+yXAbxCIMZqqdNBCHA/EFDrvLYKDQsoJqW
	TNqxkvJSXzO9RG47chXBGb9CtcB/zMROwj9wjEARekQOfwdxfHcAfd9eKkwKyMDkbwNcG2IDVg
	Q9gdfUQ8M0DVSPKlloEXe4rnVndWsvFrBMDnh+X2NfJyuKQESsmqhc7R5HJ7Wters1eF5xTUhH
	IVAk/PMD/O52NLQJY0o/gAPi
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Sep 2019 15:38:39 -0700
IronPort-SDR: nENvV23QS2udRE3EC3tH/jdsFagEt+PDDA0B0zqOOIoaUihzooT+BeC8ba3rT4DzdJaCvrFXfD
	l0TeO91F+9UdbOLLYXoYgcZkfohgSENI3eguxByeFcfgVFdmOIYAfjjGHTQVbWp3gknlXz4xfR
	guE0h9a6fxi/ovFjEUlSRvxnVU88XP4xJ9KXrMDgft9wRZZDIlxLEeAi3Xube5+/z7B8vQGsG/
	ClxSFkfwyKDN8Ayc5jVS0WZEwMigIgYBiKWPNJsE2GPbqCMnC7wkGiwSnJ42W8mZH+jbyMv5nY
	T58=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Sep 2019 15:42:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2019 15:37:53 -0700
Message-Id: <20190917223757.19701-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917223757.19701-1-alistair.francis@wdc.com>
References: <20190917223757.19701-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] python3-padatious: Initial commit of 0.4.7
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
X-List-Received-Date: Tue, 17 Sep 2019 22:42:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-devtools/python/python3-padatious_0.4.7.bb   | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb b/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb
new file mode 100644
index 000000000..4abe7c747
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb
@@ -0,0 +1,9 @@
+SUMMARY = "An efficient and agile neural network intent parser. Padatious is a core component of Mycroft AI."
+HOMEPAGE = "https://github.com/MycroftAI/padatious"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.md;md5=77baec496a458dd0e0fc4ca64cd305bc"
+
+SRC_URI[md5sum] = "1f53967a1633baa8fd48f11139808a33"
+SRC_URI[sha256sum] = "3c235942ff4151a3c36536fd776bd8a6d4d57c97046723d2fa80a89b34faac1f"
+
+inherit pypi setuptools3
-- 
2.23.0



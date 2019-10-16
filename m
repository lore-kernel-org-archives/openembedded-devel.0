Return-Path: <prvs=185bab654=alistair.francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id D77AF7F37E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571241815; x=1602777815;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=ZI5Ml/jWMkYhiFlX0OCT/l0HzI0E+Ynae2kVaDciqHo=;
	b=KeZoXqPZe6gEmD6WQwhdgna/uHRUaxgGyOuukJ3KEeB4ukn0YNPBcXLx
	YX5xhVUSTxBt19XIjlGICWr3HJF/91pRIKhfk5LIcgViSuiL9DEQeOwdR
	lXXL4z1OQbaNncOHN6ZNLo9Yp5/6L37hv5QLAZVLTv4m7986TLeq2SNCt
	ulEUInrO6c7r2cnnFo0wABLFAmjc4UwIMlf+CSVyJ5CIvC3yvQR6xA9//
	NR2Z+IxQnXoC7ugNSncpkevVh6HdyY88DGHadd6jSXf1cVN2pusN+lend
	ocNopPdX263p7AO6zX7Yz1e3xKuJA7gUiHbef+VwRJhyQzEe72YKfD0z9 Q==;
IronPort-SDR: gCZWMajsNksJpPa9vIvEy7bUgvjkoMv04vxxn/H0SOK16VPW5QGF2x8/pOlw1HLGhrezTUhU6o
	ZcowvMa3AtftU9DOoevhKyh9c1u3THj2s8q6BEf8Co2dVt2Nnuq/uiRt2Y57Mj+I7Jc6EpRz4K
	W9jkGRtlckdXFr9a90h1fMjNu0R1lp5HVZ/udWtT+Y/rJUBITFpEXJCL8P8V4onCFdezKQWriE
	67f4utXTn/dEHykDxVUfKJGDoyhjBLt7KgkF1fBCfmZtr5Q9oJ28ZLu+sf4goE2y6dAQD68DXC
	WeI=
X-IronPort-AV: E=Sophos;i="5.67,304,1566835200"; d="scan'208";a="120680401"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2019 00:03:34 +0800
IronPort-SDR: 7Sj80owAMOvKnd7ZKJ3jvMRNP/pf4mnelYla6vYzX11bbWEA1EwaBbFaBDAUDYZee79vwa01Qi
	1zBn1hjp/iT+Kgk8yOMBF6z9F78395JBPK0DcKsOcf4aKXR+UeChj7RGlGanplqDKSr5TDnRCz
	GjrRWbecw36V7VlizfTRMBuhGATJ+7bdr5GtOQlgOqz3ACcHJHDLwgRYUMMNmn/S3oXdZmWf/5
	byM8OARAvB+Hi9jJ59h2uaeOKvohsJIjIKVja+tVYEL0KDndgK3akipRHfegi7zfV2oaKYlan9
	thkiftJWDn0TKMeGkkfRF890
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	16 Oct 2019 08:59:21 -0700
IronPort-SDR: i+CI2K7dmnqUOfwLnYOJvS8Kbvqkr6tnlPssM3N0eKhqtq2QC/MwXfauIYsscHhjohz0Wc+YBi
	ntskm7zPXw4wlXAQmGzHMWL4DcW/j7oupCAZV+0NR05nq6fPhdRFuN2QyK3dAFwab6wXkeJAVx
	v0oz2/nAg7kBQOcEJAvdocVD3agnu0VOfno9orhFlYnyV3BTUDERSYTbba9tYYqoyzYmYbd08n
	WroMfg7SN32/45hTI7yfYblr/Hm6lf982PmaNqMbpJsG/vgXCH6jLx1JT3XlS/WF1J0qD1/jDz
	gGY=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2019 09:03:34 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Oct 2019 08:58:43 -0700
Message-Id: <20191016155844.20847-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016155844.20847-1-alistair.francis@wdc.com>
References: <20191016155844.20847-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 4/5] python3-msk: Initial commit of version 0.3.13
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



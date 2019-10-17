Return-Path: <prvs=18631316f=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 950EB7F6A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 21:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571346879; x=1602882879;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=ZI5Ml/jWMkYhiFlX0OCT/l0HzI0E+Ynae2kVaDciqHo=;
	b=porGSPJD3Y156abcJQhazcKj50krV3HUJaivNXgiWaWfOHpYYEqLXJ0S
	Qw99AWTwEqjJs1WALxbH9c36OiqgG6Glq8TDh/On4DGHTQmhHZ7R2QNQu
	L/dlvx/J9yyj+d3W2ommAruhtjeXIMrfE5gMPSOLraGK0kWQgdieQiHZ3
	JT5PZDccCYEhtmCxFrwWGX4JJZv5oUVb4S4yF4CMJrpTUtRjbFA+lG0ga
	xHVS2UQcL3mCo/CT+lgTQw4s2OUxwghXFgn4MeupIJin3LvB9gnTlXjLG
	hsbhxClSZKdMRKre9wHFtfMtzx6+/USXuV7IsygS2u0TcROpJCnt/Dwpl A==;
IronPort-SDR: ZY/oeqMDL3lub+P/Njnrb+cu+KgMcyQ5nJxLB5lj5792ELVSieoAJ+D2xFe2+VX1GxReITh7G2
	cxL/Kw6dgdFJ1rwUi24+8RnajMat+P8MIzDsvYLGZgJ3Y/X0/r1VQwZWVlFQR/a3USmAHV1MXj
	juZmDDz8dyRokjCsruXM4H4qc/Mb7A/MW1apP/NJm1CPne4d2t0NeD6SF846SlU+NrJU0mf4VT
	D8pmKGoRPolr26y424NP4rv4p0zwZLQfn017dfdcEQ2npnzJwb7wtUinMZGPA1EFT9J/0nqY7z
	Va4=
X-IronPort-AV: E=Sophos;i="5.67,309,1566835200"; d="scan'208";a="125212828"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 05:07:31 +0800
IronPort-SDR: AaRrgW19GJcJQ6A7lJQVjfG4Dq+kcKxyKt66t78wvC273/Wi+sN6heWQuxSV5FZ8XM7PJxq1po
	uVcA8NMwjph0oBwNfLcLogUR7MM9IjlZLGm85EzKV+jNLPhcnRsmn53Atwdq40CeMy2F/oVakV
	btiwRcsXWz0IMb1iPs2SWz3upUbGuQOmXvefF9kQd+KsCXPKuKfblQQs5snGN7wRrra8xgKEz6
	s7xKKSWSQ9NuJz6tPUKh5UjtqPjgjZmI5k8txkhPzhLo1Iv92ysdOFZnI1oD+fTeqQ29K9y38i
	tIu3G+U/QFGxqtba/5IXKQdN
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Oct 2019 14:03:10 -0700
IronPort-SDR: vqi5TYN5vQvdz9jBfuZN07TsOsvFeKkh+3+YVGRsa7Al3jPH7mNp5CSb9YvAhPBVzwzlLwWkAj
	Rr2LmfyU9rI0jU/Rm3H6hdagzTo75XCfn2Mxq4MwjExti1qoHRWCKJeDsJgYYYhfuTaFB1SviK
	y/OMKpS8tBVs/olR9jUOTUcRXkjAAN9krlGZPgclFW4tSEfysVBV4nVT5zLY0xdGEgbtQOxRuu
	iqoBN0WCC/morXuXhLZkFiJzLPovrs0mTT9LSsYe1PijOip4NxgD2wZrsbnKgWNHv/Q+85Z6D3
	ynY=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Oct 2019 14:07:30 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 14:02:45 -0700
Message-Id: <20191017210246.19550-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017210246.19550-1-alistair.francis@wdc.com>
References: <20191017210246.19550-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v3 4/5] python3-msk: Initial commit of version 0.3.13
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
X-List-Received-Date: Thu, 17 Oct 2019 21:14:37 -0000
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



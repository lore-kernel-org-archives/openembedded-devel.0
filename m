Return-Path: <prvs=18631316f=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id A7E747F69D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 21:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571346879; x=1602882879;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=raPGpBsp4Wme14dyjIFhvyXAKSykcxEDdtscLs6sJpQ=;
	b=JPrOzXoERLrKhzibMXxDEbNcFu0GGxsfmNPWQPvw+O3F+qSy1O9YwEXT
	efDs/xFHu/XE43rqLVbCTHC/mpDdwLUkOpN/9HgxyBqOdXO+fx/8QO8LS
	yQrGxGvoocwN5S5gBPsxXV265+FGxB4vwBo5rF0n1zwcLgNHbwOIZeW6u
	tHJ5Njaj7SmhCo3P6RFETys8SwXxcTdQVdqS3SXkpyZ8cklxdBZlJ2tCQ
	zP9n9gVzSu6BqgSL59tIyOziD2lyvA0Yo9mPN3ZLQEbisFf5fBkxxqeVR
	1JJQ9G4c8q8vFfFXjDyzYqR9uKwV+0XCU49Ovw85TqLP4s10cFfryxcAO g==;
IronPort-SDR: N73Sy3G08lxKidfgMDruCPGmcRSFvNYEXApeTnKIwZ/CdibIw6AT76Y/dbLFsdOoxAZ3ZQPPWa
	ILHWJKRQJIte0OLedcTiU2G1O1uPhhA/PPg/Tx2FHjMZUt1cZpVtrID+25ZzLajeMKFH2iI8xQ
	3fTxabukV2k7DiLta0cpLw+vMNND8lAUTmWThFVXcog08LDQmmqW4FA1lU7HUpbfxPxiqYmx5o
	qOv4e87778Socdre42sC/aT62rHiO5WbNIliYnrFN9W+FV/LFB0Nq8nUVi0j65jmM6Ndxfx76O
	qL0=
X-IronPort-AV: E=Sophos;i="5.67,309,1566835200"; d="scan'208";a="125212829"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 05:07:31 +0800
IronPort-SDR: bM6b//FeWyox4LQKg5jE8k5W10cuQNw5JjNxd5YgK2u9jbp4dCE6nV0Fw13+JvNkAzY2TlV/ZN
	ym2ipwYiyvwNiejhImcL7l8qrWmzJbedSd+m81jhQ49kDODLSZK5PF1Hd+WTmt0x9rmcB1M2hD
	WsuUg+nlqirDqiQ39/pBI1G0FtYhNtqrYdpoy2zKwOPqiaD5Z7xIFm8Uwjf9j6VbYFkWzH1ASV
	yywP/YRrKVWlGigwDG7KbVWK3Kb7Z1Km0mgI70g62ye8iwtu6Nt5tTX2ZVD/GhCFsdf8JEDZLh
	uCnaaQWzGhCmWw0zI8Bb7YrD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Oct 2019 14:03:10 -0700
IronPort-SDR: Q2gtJqj/zbxI16FufiRii+65GinqIFDyoqTy+U7CDltS4r0k1Zke27J1El4tJjAhiw1YJgtIzf
	K8CJ4xZoRtatuMIwhD8rc349DT7Xdr2U1RyL+fTMhwBd7+AnD9qKCtZI+4NXhUOxs2dQcO2hkR
	zMBid1itPr5A+VqHRDaLu8N4D7Egj4P6CXA969ZEmHfXovqjS3nXRc/ViBd1zLtcL7w5JsWqYm
	NuLOJ1NW3BMtSLMATa+BySBxaBU98QA8u9PfE5i3Ae4/wMCY9hkeBADgYU32B1sb+vF0IuyW6J
	APc=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Oct 2019 14:07:30 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 14:02:46 -0700
Message-Id: <20191017210246.19550-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017210246.19550-1-alistair.francis@wdc.com>
References: <20191017210246.19550-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v3 5/5] python3-google-api-python-client: Initial commit of 1.7.11
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
X-List-Received-Date: Thu, 17 Oct 2019 21:14:38 -0000
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



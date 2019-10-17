Return-Path: <prvs=18631316f=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id E34517F69D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571346878; x=1602882878;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=yqWriy/w7dvEUyuQysJgbh0iQbG6kWdhqmZtIFZaO2M=;
	b=VEzEmIZc6BEx5x1RsyWPs71aS8ULnF4DNiTJHr71Ll591DOFzs+z5cts
	2Z4pjms9mo/ymitUCDbKGjyY1/UJnt2O01LuKwjiLaNRBKPt5rN+84KS+
	ZOrqCUe9oHpt6rTBm55fyo0dBy9624SBwvBssjitqFlbvoDalxzfYHq3x
	yUba8ZxExb9X4A69kITQIdzgrReGxcqTFOTe6SyI42RKeNtwS/0pUBtmO
	My4pBVcnUlTCd182jrRTKmIVY8Z5FAzZlbiGeP1mf9gYt0x7gecfVMM2p
	wXcBdzoS4FD+f5JI35+owv/iuoM8uZvt/+Ed65LiGnrF7xvfwKn9Set4N w==;
IronPort-SDR: b+PwS36lSlIcRecE9FZLGiC1+ibRv4Cp56G9GlEvwCnIEu6sW49xhpS8jNbNZ0Npdnipe9n/n8
	RqYoFqWtX5qimnw1wZcoM2sMFBl3raXXzPRRuriKq8lhV92c3zr9Rn6FUj19JNlqK5DFJjffiQ
	Ncr2Fx8Y+oUlRcA0gAcMlTfsH9elCpuo0/My8XGH7qvlsi6qFk3fOjlSdEyov6hWUr0qB2qAeQ
	X3EREt9FSi/9Z9cm/TBfEzrrNxdXCuD5A5eeYGa3ng4yCkFZgli/PBw3Tgk839tRcwVLpQCXYf
	+Dk=
X-IronPort-AV: E=Sophos;i="5.67,309,1566835200"; d="scan'208";a="125212826"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 05:07:31 +0800
IronPort-SDR: CF2E9U5LWClk7FdOvqnp1y66QZHNzEGAP9XkhjJic21QRQgQ2al+bc5ffa9t6QY7McxvR1hCqp
	/BjOt5I7lZWwXo2O4dP3oICxwFy1vt3oPnyLPH6BnIo1dxalE6i12T/MWvMU8zx++B2tjxtfgs
	Um5RIzKLOXywzFTqOCYjolmAlPG8+XaEMbZiGYVzOhAmowpphX82ahsUuwfe5kHOlqTSCh8du/
	5j6Y27VPI54tw1ffosHdGKpESznOF87itq5ByNimfu4ExPKF+pmI2LEmei3vZpzsWnUF+AEycR
	8mSx393OAo2iHkR77AdDhLTR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Oct 2019 14:03:10 -0700
IronPort-SDR: wX+gt1AniqCGMvvbPt9xJzp7IBagMsDihE6TzLU4AShV0h0wIGuwoDS6zwb5vXUjcrCBzAYWBX
	Ao7k52iXEkci/jZK3a+n5BJJ521EsgHpXIxy0n634VHLqore9RylfHK/la0dkXB/sI1hPQXEq6
	LM5XRbauFyb0cJzU7kNqzVOCXY57DcKk9kV7TiI3odvi8SqRRtcNAUlec96sBUZQYL+XUx6yW5
	1euM8S1AXNj8ru+vRQT1VnMt9P9+PcL44AOrm48FRxlOLT0oeqmApH1mY272OVPsu0Qhd3CMad
	O2Q=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Oct 2019 14:07:30 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 14:02:43 -0700
Message-Id: <20191017210246.19550-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017210246.19550-1-alistair.francis@wdc.com>
References: <20191017210246.19550-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v3 2/5] python3-monotonic: Initial commit of version 1.5
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
 .../recipes-devtools/python/python3-monotonic_1.5.bb     | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-monotonic_1.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb b/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb
new file mode 100644
index 000000000..94b90524b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb
@@ -0,0 +1,9 @@
+SUMMARY = "This module provides a monotonic() function which returns the value (in fractional seconds) of a clock which never goes backwards."
+HOMEPAGE = "https://github.com/atdt/monotonic"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[md5sum] = "9f81cb0e5966479754453dea2b6822f4"
+SRC_URI[sha256sum] = "23953d55076df038541e648a53676fb24980f7a1be290cdda21300b3bc21dfb0"
+
+inherit pypi setuptools3
-- 
2.23.0



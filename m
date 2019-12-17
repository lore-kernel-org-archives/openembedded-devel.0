Return-Path: <prvs=2476bd972=alistair.francis@wdc.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Dec 2019 17:57:22 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id F05427FDD2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 17:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1576605445; x=1608141445;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=UO+7GVGFd1d23nPLVcr3/mghonSkZRmZup9sF3pO1Qo=;
	b=VWM0Y8agJ0wa9BPwOiR2EYkrEh+RWXBxSzF2D02g8sM84sy3i1ox7T06
	qxTG66RwcKDHTSWMUATyhmT8OeHe8epLvbaelo6BtaBr7lU/UX1lCycsT
	B4K8dhZrLv6XsNniBfK2b+P5XCJqP6YF7EX7D053+gaSoKj8epDD3YvRw
	PsylFV/vMsstsZig/6HO3bZg/YEj0AAlkbBi2P1y1S0zLNrcri/AWQUap
	XHpnwONWJRo6sjWbdfQ6cVckFAHLm863LfFoYzS2GqU/UKCycRr2khgpt
	5470kgrt1JHjMd8f+6QNKt68gtSiC9FpLhB0OQ+jouKDV98HGq+e49nFw Q==;
IronPort-SDR: 4MwAGWJPtF1HXMtMQYS+nZg6VnYSziZFSgkX8lINxdIjMGb5qjo0q28IBhlrHbe3B4gG2STOXX
	HivpYJuDTHGB82smyO40Q6bs0iQya4LNMB9KPzOgerIsnBLCp9IUqCScRYBSAFOVEH1INVQZDh
	/LI9FrubYbIhNcuwb/jO3ZgvAIp10M8eT8+c3OUEunsplqpPYdD76NtVbLW8MeQtREFDv42Lxl
	wsPGOXt7aOBkXo1OZkaKPxA5N0HUxrXKQxhsDj/TjjX/t8ONjpx26nMO2T54I2yWwPrc6+cVK5
	Ga8=
X-IronPort-AV: E=Sophos;i="5.69,326,1571673600"; d="scan'208";a="127176242"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2019 01:50:19 +0800
IronPort-SDR: aLV4AvKKVpVPuJag3w8JjZ5aGr4KVoSYKpGCa/huutg7vLJJLLI8LzVWivRXjRW4+cHz1TelxT
	vmlD8u1uDEpRw9gzpP/G0xYCqe8L5Oc0Trf66OzSaCBEfWOGiEaz7iZANH6n8hQLgIlI700seG
	JbW/LnVGapY7KX+FzY1rT88hxzwL9fjtUNPx96AM1WIlqVJogrXZYCsdxmHHV5ekwi1zMx94JO
	nDBhuDingXWajZl+lzPbgZP5rpqrK78upp8UqZQ5Eur/QEaObgMuxmEpJ/QMZAzpAQ0Wx9OkZR
	LsWJTH5twHIIH2TurUceC3sZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 09:44:21 -0800
IronPort-SDR: aN3/4qnB1n9PJDDiIuWCc743ZhuAuFlBC7WSLvqcVf7K7/bS15XJmvP7MX9B+pipbpJYanJExg
	S6VqoMHL3QOkNgtRaZOQjmPms3bogzH7mURk6rowymZ3Z4pmRWfuDJEASJBKfVAiIbEq1aH9xr
	sp/hv1vFGPWbGHP/ksA7maDLhihuBxpBc31fSQQPx0wVd9bBiue3vfBcETSBEXczH2tnzE0b0T
	0KB66nwq7Y0vbcJ6eis0AvSxo4lTZzVOcRax97U2VNcoaR9W8I2qOG73gLOLN2xY8jKWrFDjP7
	3qM=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.158.235])
	by uls-op-cesaip02.wdc.com with ESMTP; 17 Dec 2019 09:50:19 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Dec 2019 09:44:27 -0800
Message-Id: <20191217174427.4001-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] mycroft: RDEPENDS on mpg123 to allow singing
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
X-List-Received-Date: Tue, 17 Dec 2019 17:57:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
index 3c7bd8963..62d1ad7f7 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
@@ -79,7 +79,7 @@ RDEPENDS_${PN} += "python3-requests python3-pillow \
 # Mycroft uses Alsa, PulseAudio and Flac
 RDEPENDS_${PN} += "alsa-utils alsa-plugins alsa-tools"
 RDEPENDS_${PN} += "pulseaudio pulseaudio-misc pulseaudio-server"
-RDEPENDS_${PN} += "flac"
+RDEPENDS_${PN} += "flac mpg123"
 
 # Mycroft can do this itself on the target, but it's quicker to do it here
 RDEPENDS_${PN} += "mimic"
-- 
2.24.0



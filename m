Return-Path: <prvs=2494fb295=alistair.francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 041656C0B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1576789249; x=1608325249;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=NvfZJodpzrzuFSFOwwQRc96g0eFzZaSthQATwGtieIs=;
	b=fnQxp9pL7sF9UcI1x1Yq1yLNWjPpx9wsgOqlYujjVaTUob/1Ma7nJIxD
	gq0BT1ctoBc3itVGQGIyx+/lUfABlDIbgljSWLsdTp3/+gMhaf14NYnTQ
	TL/Gz6wSiqJtP1JHQkHLY8BgJMZ+Qi1S2ft+Rmp4m0jNFFoV4Oe1Slg7z
	aqWq+2gt3E9LyBvSAJfZw3M85R2VveKjoRs4MAJpn+j37FPztpwB0pvGG
	xgiSI9MpxO5TH86w0g/XAHK+tCw8VDLUOBHtZjl2Yjee9c7WmVKZ/oKnH
	vsM8m62dYV5EHfSrNWdJithU08NFwTSlMZPkacThmdcOj+x2c37q3eT6i A==;
IronPort-SDR: CppBAVRvZo1QdJ7l+A9RCFU29jOqRftLg7eKTUEGQfn+seW4OCHkoDHSY2kRXBrCGp4aJmmTh/
	KMutgE8qXw5ASD7vRoQM8outdmFBuVn57W33f45N21vM8d647rUjgx+pImU8XBGL6Onb+3Wmw7
	qI2bas10LDOP+9/fKQUtzj12BfSpLDH7/6KCOnRuDBKYMsUqdFMBx7YOG70vkolcLYvq67Ebp4
	ykarAYj4MLXqpaTgzB/rfhiYcWUXnlSlqAdLPA815h3iahb6GYLrxr0KAANHuptyuVjhlQTCMi
	C0k=
X-IronPort-AV: E=Sophos;i="5.69,333,1571673600"; d="scan'208";a="125752341"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2019 05:00:48 +0800
IronPort-SDR: /nLocSdcfhO/DEtjG+c5rndSFKPkirgdwxqOwSl78ac21LUvQ3d/kXHPNYBsETuyiBQki8HnNb
	YlsdzrvB8Faam01HlUzufzJJIcSdRF9U8bT6EVSJywF5M4VvwJseYDBkffGwywYIlLawBiSiEv
	q/U33uy16AEEU+yrAkRoy6qAtvsWu3oaSf0bAlAA4U8oFvg3lbUDyFUU93TpZzFLxPxSCkc88B
	rTRB5oNqi+D4xnxcPze7NOisMGKoAukzNB3m2u98lebthLsCcBppnvy7TJKH6vOj354pXAfJu2
	WWSrRRypg7W3xrcnvXhSyOHA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	19 Dec 2019 12:55:10 -0800
IronPort-SDR: GtACMcJRbg4iGPZ1GuCTA1bxnBB52rtQfaf46w2+CcxgkOuj5JLeydQqw/Qm94T+DiIT/YIe5Z
	xbgRmxQhXNO4+5M/d0UPGMqEF7SdSqoycLKcwgFp/NU2CugaoSDMdwwKhU42R7UlJ4oIVLnzWZ
	kti+N1JhhQ7PKVzwnlWPm5aQmnLNjGZoHaqs3fb8xjQiLiFJqQQ5pE/xvuaSZxbmvsUkm2WZ6/
	0Z14j5/Yh6KJyJxHtVtZm/mgiFqPMn+75cyz9mDe2EISOvQANomBYY8cJY6A89d78DBK7cMwo6
	g9s=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.158.235])
	by uls-op-cesaip02.wdc.com with ESMTP; 19 Dec 2019 13:00:50 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2019 12:54:57 -0800
Message-Id: <20191219205457.28136-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openocd: Enable remote-bitbang build option
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
X-List-Received-Date: Thu, 19 Dec 2019 21:00:48 -0000
Content-Transfer-Encoding: 8bit

Enable the remote-bitbang via PACKAGECONFIG to allow connecting to
verilator instances.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 9ec77fdc4..e95f1cfa5 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -53,4 +53,5 @@ FILES_${PN} = " \
   "
 
 PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
-PACKAGECONFIG ??= "sysfsgpio"
+PACKAGECONFIG[remote-bitbang] = "--enable-remote-bitbang,--disable-remote-bitbang"
+PACKAGECONFIG ??= "sysfsgpio remote-bitbang"
-- 
2.24.0



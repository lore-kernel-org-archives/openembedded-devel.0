Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7D22373D89
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 04:56:50 +0000 (UTC)
Received: by pachj5 with SMTP id hj5so112784034pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 21:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5K07VDjtRzcjaiLjgTSoFXuNwTd5lZOdp1N++Wu0L/c=;
	b=RhdNTf6AiHKpFJi2iFWwgJA3DqvGmn0t7erdN7Hq4rrgaNo51tZjXqlNdrmSAljhRt
	UndKfheMZykdijRzG1RDTzdFW+/as5YkApiOAS/7W42iFQDQZ/TlCyyr581cI8xtEWu/
	/bTe9cABHBvJdV/rmSp96GO9QXdmzgTETgbr52FaHcybTGd0KE30TKe/BL8aNUF0tkU8
	QCHCO7waUPXmKjCn4xCk1y1pxEB8bc8X2hEN30P8NLelV4J5J8IoDZ33DKJ7cWlNq0Bi
	jcZ8Dy6lC5tKD8IVmSi2UVyB96NuT+199y0ALAKdjaIxp8p1HeYPBI+mBsZ1obzdvIlq
	g3Zw==
X-Received: by 10.66.102.103 with SMTP id fn7mr69230230pab.85.1437454610685;
	Mon, 20 Jul 2015 21:56:50 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ti10sm24817215pab.20.2015.07.20.21.56.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 21:56:49 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id D3DFBFC0E51; Mon, 20 Jul 2015 21:56:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Mon, 20 Jul 2015 21:56:34 -0700
Message-Id: <e00844ed8cb964857c73acd8495ae98250c9020f.1437454485.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437454485.git.akuster808@gmail.com>
References: <cover.1437454485.git.akuster808@gmail.com>
Subject: [PATCH 1/5] ptpd: disable libpcap detection via pcap-config
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jul 2015 04:56:50 -0000

From: Stefan Agner <stefan@agner.ch>

When the host system provides pcap-config, the configure scripts
detect that and add a bogous CPPFLAG:

checking for pcap-config... /usr/bin/pcap-config
checking if we want to build with libpcap support... yes, pcap-config
...
PCAP_CPPFLAGS =  -I/usr/include

Which down the line can lead to compile errors due to wrong headers
being included. Fix this issue by using --with-pcap-config=no which
prevents detection using pcap-config but does "guessing", which works
fine for OE.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
index db74e44..b6abfee 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
@@ -8,7 +8,7 @@ SECTION = "network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://README;md5=2452033fe374283f29579898663b1aa8"
 
-DEPENDS = "libpcap"
+DEPENDS = "linux-libc-headers libpcap"
 
 inherit autotools
 
@@ -30,7 +30,7 @@ S = "${WORKDIR}/ptpd-${PV}"
 
 EXTRA_OEMAKE = ""
 
-EXTRA_OECONF += "--disable-snmp"
+EXTRA_OECONF += "--disable-snmp --with-pcap-config=no"
 
 do_install() {
     install -d ${D}${bindir} ${D}${mandir}/man8
-- 
1.9.1



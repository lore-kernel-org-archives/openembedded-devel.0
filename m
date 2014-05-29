Return-Path: <sipke.vriend@xilinx.com>
X-Greylist: delayed 943 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 May 2014 22:47:09 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0186.outbound.protection.outlook.com [207.46.163.186])
	by mail.openembedded.org (Postfix) with ESMTP id 813B96FD34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 22:47:09 +0000 (UTC)
Received: from BN1AFFO11FD029.protection.gbl (10.58.52.34) by
	BN1AFFO11HUB028.protection.gbl (10.58.52.138) with Microsoft SMTP
	Server (TLS) id 15.0.949.9; Thu, 29 May 2014 22:31:25 +0000
Received: from xsj-gw1 (149.199.60.83) by
	BN1AFFO11FD029.mail.protection.outlook.com (10.58.52.184) with
	Microsoft SMTP Server id 15.0.949.9 via Frontend Transport;
	Thu, 29 May 2014 22:31:25 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)
	by xsj-gw1 with esmtp (Exim 4.63)
	(envelope-from <sipke.vriend@xilinx.com>) id 1Wq8r6-0002mq-U4
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 May 2014 15:31:24 -0700
From: Sipke Vriend <sipke.vriend@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 May 2014 08:31:21 +1000
X-Mailer: git-send-email 1.9.0
X-RCIS-Action: ALLOW
Message-ID: <7bb55d33-4d2c-447c-8d25-3e395bb6e2c6@BN1AFFO11FD029.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(438001)(199002)(189002)(31696002)(83322001)(89996001)(92566001)(76482001)(85852003)(83072002)(87286001)(93916002)(79102001)(20776003)(70736001)(64706001)(47776003)(87936001)(92726001)(88136002)(77982001)(50986999)(77156001)(81342001)(31966008)(19580405001)(99396002)(74662001)(86362001)(104166001)(80022001)(21056001)(81542001)(74502001)(104016001)(53416003)(102836001)(19580395003)(50466002)(74316001)(33646001)(50226001)(62966002)(44976005)(48376002)(4396001)(46102001)(32563001)(23106003);
	DIR:OUT; SFP:; SCL:1; SRVR:BN1AFFO11HUB028; H:xsj-gw1; FPR:;
	MLV:sfv; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: xilinx.onmicrosoft.com
X-Microsoft-Antispam: BL:0; ACTION:Default; RISK:Low; SCL:0; SPMLVL:NotSpam;
	PCL:0; RULEID:
X-Forefront-PRVS: 022649CC2C
Received-SPF: Pass (: domain of xilinx.com designates 149.199.60.83 as
	permitted sender) receiver=; client-ip=149.199.60.83; helo=xsj-gw1;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=sipke.vriend@xilinx.com; 
Cc: sipkev@xilinx.com
Subject: [meta-oe][PATCH] mplayer: Inherit python3native
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
X-List-Received-Date: Thu, 29 May 2014 22:47:16 -0000
Content-Type: text/plain

A host machine without python3 on the PATH fails to build
mplayer.

Inherit python3native to avoid host dependency on python3.

Signed-off-by: Sipke Vriend <sipke.vriend@xilinx.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 65fab1f..d5e8028 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -5,6 +5,8 @@ DEPENDS = "libvpx libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
            libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses \
            libxv virtual/libx11 libass speex faad2"
 
+inherit python3native
+
 RDEPENDS_${PN} = "mplayer-common"
 PROVIDES = "mplayer"
 RPROVIDES_${PN} = "mplayer"
-- 
1.9.0




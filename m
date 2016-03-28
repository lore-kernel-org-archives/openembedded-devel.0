Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 0042660797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2016 13:20:01 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2SDK2Ur015900; Mon, 28 Mar 2016 08:20:02 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016032808200278-273185 ;
	Mon, 28 Mar 2016 08:20:02 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Mar 2016 16:19:33 +0300
Message-Id: <1459171173-1527-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/28/2016 08:20:02 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/28/2016 08:20:02 AM,
	Serialize complete at 03/28/2016 08:20:02 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-28_10:, , signatures=0
Subject: [meta-oe][PATCH] openconnect: add recipe
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
X-List-Received-Date: Mon, 28 Mar 2016 13:20:03 -0000

openconnect is a FOSS VPN client designed to work with Cisco AnyConnect
and Pulse Connect Secure (Juniper SSL).

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../recipes-connectivity/openconnect/openconnect_git.bb  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/openconnect/openconnect_git.bb

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
new file mode 100644
index 0000000..241de30
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Open client for Cisco AnyConnect VPN"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
+
+DEPENDS = "vpnc libxml2 gnutls"
+
+PV = "7.06"
+
+SRCREV = "35542d52202672b8c12ecc63867432128244013a"
+SRC_URI = "git://git.infradead.org/users/dwmw2/openconnect.git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--disable-static"
-- 
2.7.4



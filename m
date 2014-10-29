Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 93773601A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 14:39:08 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s9TEd9bT023391 for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 09:39:09 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014102909390896-402249 ;
	Wed, 29 Oct 2014 09:39:08 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Oct 2014 09:39:07 -0500
Message-Id: <1414593547-15468-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.1.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 10/29/2014 09:39:08 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 10/29/2014 09:39:09 AM,
	Serialize complete at 10/29/2014 09:39:09 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.28,
	0.0.0000
	definitions=2014-10-29_05:2014-10-28, 2014-10-29,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH] openvpn: bypass check for /sbin/ip on the host
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
X-List-Received-Date: Wed, 29 Oct 2014 14:39:14 -0000

In the commit 'openvpn: use default iproute2 path', the configure flag
to explicitly set the iproute2 path was removed, since busybox now
provides the 'ip' applet at the default path.  However, setting this
flag is necessary to bypass the configure-time check for /sbin/ip on the
host, which will otherwise fail if iproute2 is not installed on the
host.  Add back the flag (pointing to the correct path), and add a
comment to describe why this is necessary.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
index 53801cb..1fb722a 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
@@ -19,6 +19,9 @@ CFLAGS += "-fno-inline"
 EXTRA_OECONF += "--enable-password-save --enable-iproute2"
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-plugin-auth-pam', d)}"
 
+# Explicitly specify IPROUTE to bypass the configure-time check for /sbin/ip on the host.
+EXTRA_OECONF += "IPROUTE=/sbin/ip"
+
 do_install_append() {
     install -d ${D}/${sysconfdir}/init.d
     install -d ${D}/${sysconfdir}/openvpn
-- 
2.1.1



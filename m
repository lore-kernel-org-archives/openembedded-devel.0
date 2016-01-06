Return-Path: <ovidiu.vancea@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 121AB73219
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 13:45:03 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u06Dj36W016670 for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jan 2016 07:45:03 -0600
Received: from ovidiu-ro-l0.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016010607450319-1741911 ;
	Wed, 6 Jan 2016 07:45:03 -0600 
From: Ovidiu Vancea <ovidiu.vancea@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 6 Jan 2016 15:45:01 +0200
Message-Id: <1452087901-23648-1-git-send-email-ovidiu.vancea@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/06/2016 07:45:03 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/06/2016 07:45:03 AM,
	Serialize complete at 01/06/2016 07:45:03 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-06_09:, , signatures=0
Subject: [meta-networking][PATCH] dnsmasq: Listen only on loopback and disable DHCP
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
X-List-Received-Date: Wed, 06 Jan 2016 13:45:06 -0000

Dnsmasq functions as DHCP and DNS servers by default and listens on all
interfaces. This conflicts with other DHCP or DNS servers already on
the network and corrupts DNS configuration on Windows systems.

We noticed that after installing docker, the Linux system became a
magnet for DNS requests coming from Windows systems. Dnsmasq is a
dependency for lxc which is recommended for docker.

Windows periodically broadcasts DHCPInform and DHCP servers reply with
DHCPAck. If the DHCPAck from the Linux target reaches the Windows
system first, Windows changes its DNS server IP to the Linux system
running dnsmasq. Dnsmasq ends up forwarding the DNS requests to the
official DNS server and replies back the answer to the original
requestor. The Linux system transparently becomes a DNS proxy on the
subnet.

Signed-off-by: Ovidiu Vancea <ovidiu.vancea@ni.com>
---
 meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
index 1a198a3..bd0ee00 100755
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
@@ -77,7 +77,7 @@ bogus-priv
 #except-interface=
 # Or which to listen on by address (remember to include 127.0.0.1 if
 # you use this.)
-#listen-address=
+listen-address=127.0.0.1
 
 # On systems which support it, dnsmasq binds the wildcard address,
 # even when it is listening on only some interfaces. It then discards
@@ -114,7 +114,7 @@ bogus-priv
 # repeat this for each network on which you want to supply DHCP
 # service.
 #dhcp-range=192.168.0.50,192.168.0.150,12h
-dhcp-range=10.0.0.10,10.0.0.200,2h
+#dhcp-range=10.0.0.10,10.0.0.200,2h
 
 # This is an example of a DHCP range where the netmask is given. This
 # is needed for networks we reach the dnsmasq DHCP server via a relay 
-- 
2.1.4



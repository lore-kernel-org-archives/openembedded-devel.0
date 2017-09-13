Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1512578585
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 03:10:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8D3Avjl013438
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 12 Sep 2017 20:10:57 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 12 Sep 2017 20:10:56 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Tue, 12 Sep 2017 20:10:57 -0700
Message-ID: <20170913031057.65309-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] tcpdump: update to 4.9.2 to fix CVEs
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
X-List-Received-Date: Wed, 13 Sep 2017 03:10:57 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Refer to http://www.tcpdump.org/tcpdump-changes.txt:

Fix buffer overflow vulnerabilities:
  CVE-2017-11543 (SLIP)
  CVE-2017-13011 (bittok2str_internal)
Fix infinite loop vulnerabilities:
  CVE-2017-12989 (RESP)
  CVE-2017-12990 (ISAKMP)
  CVE-2017-12995 (DNS)
  CVE-2017-12997 (LLDP)
Fix buffer over-read vulnerabilities:
  CVE-2017-11541 (safeputs)
  CVE-2017-11542 (PIMv1)
  CVE-2017-12893 (SMB/CIFS)
  CVE-2017-12894 (lookup_bytestring)
  CVE-2017-12895 (ICMP)
  CVE-2017-12896 (ISAKMP)
  CVE-2017-12897 (ISO CLNS)
  CVE-2017-12898 (NFS)
  CVE-2017-12899 (DECnet)
  CVE-2017-12900 (tok2strbuf)
  CVE-2017-12901 (EIGRP)
  CVE-2017-12902 (Zephyr)
  CVE-2017-12985 (IPv6)
  CVE-2017-12986 (IPv6 routing headers)
  CVE-2017-12987 (IEEE 802.11)
  CVE-2017-12988 (telnet)
  CVE-2017-12991 (BGP)
  CVE-2017-12992 (RIPng)
  CVE-2017-12993 (Juniper)
  CVE-2017-11542 (PIMv1)
  CVE-2017-11541 (safeputs)
  CVE-2017-12994 (BGP)
  CVE-2017-12996 (PIMv2)
  CVE-2017-12998 (ISO IS-IS)
  CVE-2017-12999 (ISO IS-IS)
  CVE-2017-13000 (IEEE 802.15.4)
  CVE-2017-13001 (NFS)
  CVE-2017-13002 (AODV)
  CVE-2017-13003 (LMP)
  CVE-2017-13004 (Juniper)
  CVE-2017-13005 (NFS)
  CVE-2017-13006 (L2TP)
  CVE-2017-13007 (Apple PKTAP)
  CVE-2017-13008 (IEEE 802.11)
  CVE-2017-13009 (IPv6 mobility)
  CVE-2017-13010 (BEEP)
  CVE-2017-13012 (ICMP)
  CVE-2017-13013 (ARP)
  CVE-2017-13014 (White Board)
  CVE-2017-13015 (EAP)
  CVE-2017-11543 (SLIP)
  CVE-2017-13016 (ISO ES-IS)
  CVE-2017-13017 (DHCPv6)
  CVE-2017-13018 (PGM)
  CVE-2017-13019 (PGM)
  CVE-2017-13020 (VTP)
  CVE-2017-13021 (ICMPv6)
  CVE-2017-13022 (IP)
  CVE-2017-13023 (IPv6 mobility)
  CVE-2017-13024 (IPv6 mobility)
  CVE-2017-13025 (IPv6 mobility)
  CVE-2017-13026 (ISO IS-IS)
  CVE-2017-13027 (LLDP)
  CVE-2017-13028 (BOOTP)
  CVE-2017-13029 (PPP)
  CVE-2017-13030 (PIM)
  CVE-2017-13031 (IPv6 fragmentation header)
  CVE-2017-13032 (RADIUS)
  CVE-2017-13033 (VTP)
  CVE-2017-13034 (PGM)
  CVE-2017-13035 (ISO IS-IS)
  CVE-2017-13036 (OSPFv3)
  CVE-2017-13037 (IP)
  CVE-2017-13038 (PPP)
  CVE-2017-13039 (ISAKMP)
  CVE-2017-13040 (MPTCP)
  CVE-2017-13041 (ICMPv6)
  CVE-2017-13042 (HNCP)
  CVE-2017-13043 (BGP)
  CVE-2017-13044 (HNCP)
  CVE-2017-13045 (VQP)
  CVE-2017-13046 (BGP)
  CVE-2017-13047 (ISO ES-IS)
  CVE-2017-13048 (RSVP)
  CVE-2017-13049 (Rx)
  CVE-2017-13050 (RPKI-Router)
  CVE-2017-13051 (RSVP)
  CVE-2017-13052 (CFM)
  CVE-2017-13053 (BGP)
  CVE-2017-13054 (LLDP)
  CVE-2017-13055 (ISO IS-IS)
  CVE-2017-13687 (Cisco HDLC)
  CVE-2017-13688 (OLSR)
  CVE-2017-13689 (IKEv1)
  CVE-2017-13690 (IKEv2)
  CVE-2017-13725 (IPv6 routing headers)

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../recipes-support/tcpdump/{tcpdump_4.9.1.bb => tcpdump_4.9.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.9.1.bb => tcpdump_4.9.2.bb} (90%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
similarity index 90%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
index 40106975e..d38540e34 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[md5sum] = "1e0293210b0dea5ef18e88e4150394b7"
-SRC_URI[sha256sum] = "f9448cf4deb2049acf713655c736342662e652ef40dbe0a8f6f8d5b9ce5bd8f3"
+SRC_URI[md5sum] = "9bbc1ee33dab61302411b02dd0515576"
+SRC_URI[sha256sum] = "798b3536a29832ce0cbb07fafb1ce5097c95e308a6f592d14052e1ef1505fe79"
 
 export LIBS=" -lpcap"
 
-- 
2.13.0



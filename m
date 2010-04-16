Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2oqc-00071E-4b
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 18:56:54 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id BFDFFEA9A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 12:53:25 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Fri, 16 Apr 2010 12:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=q2Jx6CDe/AcDQl5S0Enh2ph3Mx0=;
	b=o0FPY9Mq0sGfeCGqm4SSPIj1MGCRpM11Z4qPHhlhGQnQLf0afVG0glQFratnTYIY0mpmtlZGs5TcIWg0NN+9bHwXmKx+wYXcKZST1a+yKM0HgQvffBTj9FZhJRyn0Yq2vlViBuHf7akH1dBv6SZuS/rTXuOcpdXJ2T2QtGPOC1Q=
X-Sasl-enc: irNJP+TH/l/fVmYXy9mbTs8qNB9lQHPanNkbRQZXooPa 1271436805
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 2D8D44A83D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 12:53:25 -0400 (EDT)
Date: Fri, 16 Apr 2010 18:53:23 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
Message-ID: <alpine.DEB.1.10.1004161852390.13187@vitus.devnet.local>
References: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/5] netbase: add tb5200l specific /etc/network/interfaces
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Apr 2010 16:56:55 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

* eth0, usb for host connectivity
* can0, can1 to control CAN devices

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/netbase/netbase/tb5200l/interfaces |   33 ++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 recipes/netbase/netbase/tb5200l/interfaces

diff --git a/recipes/netbase/netbase/tb5200l/interfaces b/recipes/netbase/netbase/tb5200l/interfaces
new file mode 100644
index 0000000..9b27ef0
--- /dev/null
+++ b/recipes/netbase/netbase/tb5200l/interfaces
@@ -0,0 +1,33 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+# Wired ethernet interface of "tiny box"
+auto eth0
+iface eth0 inet dhcp
+
+
+# Ethernet/RNDIS gadget (g_ether)
+# ... or on host side, usbnet and random hwaddr
+iface usb0 inet static
+	address 192.168.0.202
+	netmask 255.255.255.0
+	network 192.168.0.0
+	gateway 192.168.0.200
+
+# CAN interfaces
+auto can0
+iface can0 inet manual
+	pre-up ip link set $IFACE type can bitrate 125000 listen-only off
+	up /sbin/ifconfig $IFACE up
+	down /sbin/ifconfig $IFACE down
+
+auto can1
+iface can1 inet manual
+	pre-up ip link set $IFACE type can bitrate 125000 listen-only off
+	up /sbin/ifconfig $IFACE up
+	down /sbin/ifconfig $IFACE down
+
-- 
1.5.6.5




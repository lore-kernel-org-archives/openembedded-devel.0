Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RPk43-0004v4-GX
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 01:06:19 +0100
Received: (qmail invoked by alias); 13 Nov 2011 23:59:59 -0000
Received: from p5B0A37D1.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.55.209]
	by mail.gmx.net (mp051) with SMTP; 14 Nov 2011 00:59:59 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+eCMFYKg2eCAqF4HS1w6jQ8yDxeY+eFD0CNikwra
	p+OJ76jxuqvA6y
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Nov 2011 01:05:00 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201111140105.00784.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: networkmanager: update to 0.9.2.0 causes trouble
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
X-List-Received-Date: Mon, 14 Nov 2011 00:06:19 -0000
X-Groupsio-MsgNum: 35375
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_ssFwO6AVdFY2yQo"

--Boundary-00=_ssFwO6AVdFY2yQo
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

since

commit 037cb32f99f229c9c55a029bec088ebc7f59d278
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Nov 11 12:50:38 2011 +0100

    networkmanager: update to 0.9.2.0

wlan connects successfully to my router but *fails* to connect external 
locations.

networkmanager / nm-applet set up my network as
eth0: IPv4 fixed IP
wlan0: WPA & WPA 2 Personal / IPv4 DHCP

Attached you find the results for networkmanager 0.9.2 and networkmanager 0.9.0 
(reverted 037cb32f99f229c9c55a029bec088ebc7f59d278)

My suggestion:
* revert 037cb32f99f229c9c55a029bec088ebc7f59d278 until fixed
* send a note to gnome bugzilla

Andreas

--Boundary-00=_ssFwO6AVdFY2yQo
Content-Type: text/plain;
  charset="UTF-8";
  name="ping-networkmanager-0.9.0"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="ping-networkmanager-0.9.0"

sh-4.2# ping google.com
PING google.com (209.85.148.106): 56 data bytes
64 bytes from 209.85.148.106: seq=0 ttl=57 time=29.294 ms
64 bytes from 209.85.148.106: seq=1 ttl=57 time=27.497 ms


--Boundary-00=_ssFwO6AVdFY2yQo
Content-Type: text/plain;
  charset="UTF-8";
  name="ping-networkmanager-0.9.2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="ping-networkmanager-0.9.2"

sh-4.2# ping google.com
PING google.com (209.85.148.106): 56 data bytes
ping: sendto: Network is unreachable


--Boundary-00=_ssFwO6AVdFY2yQo
Content-Type: text/plain;
  charset="UTF-8";
  name="route-networkmanager-0.9.0"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="route-networkmanager-0.9.0"

sh-4.2# route 
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         speedport.ip    0.0.0.0         UG    0      0        0 wlan0
192.168.2.0     *               255.255.255.0   U     2      0        0 wlan0
192.168.11.0    *               255.255.255.0   U     1      0        0 eth0


--Boundary-00=_ssFwO6AVdFY2yQo
Content-Type: text/plain;
  charset="UTF-8";
  name="route-networkmanager-0.9.2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="route-networkmanager-0.9.2"

sh-4.2# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.2.0     *               255.255.255.0   U     0      0        0 wlan0
192.168.11.0    *               255.255.255.0   U     0      0        0 eth0


--Boundary-00=_ssFwO6AVdFY2yQo--

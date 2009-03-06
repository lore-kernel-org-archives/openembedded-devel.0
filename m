Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LfhBW-0001KM-IS
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 22:02:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 6FDAE1409204;
	Fri,  6 Mar 2009 21:59:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K7GBaTo60FdV; Fri,  6 Mar 2009 21:59:30 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 0D14B1416BA2;
	Fri,  6 Mar 2009 21:59:30 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 06 Mar 2009 21:57:50 +0100
Message-Id: <1236373070.7461.49.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Cc: Matthias Hentges <matthias@hentges.net>
Subject: [PATCH] new interface is already up but udev must call ifup anyway
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
X-List-Received-Date: Fri, 06 Mar 2009 21:02:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Few weeks ago yet another change happened in the dark, and network did
not start to work automatically after inserting my WLAN card.

Debugging this problem, I found that interface is already up=EF=BB=BF but=
 not
configured when /etc/udev/scripts/network.sh is called. This script
thinks, that card is already configured and quits. This behavior is
intentional and was introduced three years ago=EF=BB=BF (and working).

The fix actually reverts following change:
Author: Matthias Hentges <oe@hentges.net>
Date:   Thu Apr 20 16:01:09 2006 +0000
    udev: network.sh: Do not ifup an already configured network device ag=
ain.

That is why I am asking:

Is anybody aware of change, that made new interfaces up without
configuring them? Was it an intention or not?

Matthias, do you remember, which problem it addressed?

My card is prism2 based wlan card. Firmware is upgraded into card RAM.

diff --git a/packages/udev/files/network.sh b/packages/udev/files/network=
.sh
index 182c26d..c97f9f0 100644
--- a/packages/udev/files/network.sh
+++ b/packages/udev/files/network.sh
@@ -47,7 +47,7 @@ fi
 if grep -q "iface \+$INTERFACE" /etc/network/interfaces; then
   case $ACTION in
     add)
-    	ifconfig | grep -q "^$INTERFACE" || ifup $INTERFACE
+    	ifup $INTERFACE
     	;;
     remove)
     	ifdown $INTERFACE


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




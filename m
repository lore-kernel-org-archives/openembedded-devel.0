Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVyZB-0003dM-Ao for openembedded-devel@lists.openembedded.org;
	Sat, 07 Oct 2006 00:53:17 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id B61F240654F; Fri,  6 Oct 2006 15:21:35 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061006222135.B61F240654F@tinman.treke.net>
Date: Fri,  6 Oct 2006 15:21:35 -0700 (PDT)
Subject: [Bug 1460] New: Socket LP CF WLAN card not working on OZ3.5.4.1 on C860
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2006 22:53:17 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1460

           Summary: Socket LP CF WLAN card not working on OZ3.5.4.1 on C860
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: kelly.harding@gmail.com
         QAContact: tinderbox-oe@gmx.net


On my Zaurus C860, using the OZ3.5.4.1/OPIE install, my Socket LP CF WLAN card
won't work.

Get when doing dmesg:

pccard: card ejected from slot 0
pccard: PCMCIA card inserted into slot 0
pcmcia: registering new device pcmcia0.0
orinoco 0.15rc3 (David Gibson <hermes@gibson.dropbear.id.au>, Pavel Roskin
<proski@gnu.org>, et al)
spectrum_cs 0.15rc3 (Pavel Roskin <proski@gnu.org>, David Gibson
<hermes@gibson.dropbear.id.au>, et al)
eth0: Hardware identity 8000:0001:0000:0000
eth0: Station identity  0021:0002:0002:0001
eth0: Firmware determined as Symbol F3.91-71
eth0: Ad-hoc demo mode supported
eth0: IEEE standard IBSS ad-hoc mode supported
eth0: WEP supported, 104-bit key
eth0: MAC address 00:A0:F8:A1:73:73
eth0: Station name "Prism  I"
eth0: ready
eth0: index 0x01: Vcc 3.3, irq 40, io 0xc4820000-0xc4820047
hermes @ c4820000: Truncating LTV record from 8 to 6 bytes. (rid=0xfd43,
len=0x0005)
ADDRCONF(NETDEV_UP): eth0: link is not ready
pccard: card ejected from slot 0
pccard: PCMCIA card inserted into slot 0
pcmcia: registering new device pcmcia0.0
eth0: Hardware identity 8000:0001:0000:0000
eth0: Station identity  0021:0002:0002:0001
eth0: Firmware determined as Symbol F3.91-71
eth0: Ad-hoc demo mode supported
eth0: IEEE standard IBSS ad-hoc mode supported
eth0: WEP supported, 104-bit key
eth0: MAC address 00:A0:F8:A1:73:73
eth0: Station name "Prism  I"
eth0: ready
eth0: index 0x01: Vcc 3.3, irq 40, io 0xc4820000-0xc4820047
hermes @ c4820000: Truncating LTV record from 8 to 6 bytes. (rid=0xfd43,
len=0x0005)
ADDRCONF(NETDEV_UP): eth0: link is not ready
hermes @ c4820000: Truncating LTV record from 8 to 6 bytes. (rid=0xfd43,
len=0x0005)
ADDRCONF(NETDEV_UP): eth0: link is not ready

cardctl ident shows:

Socket 0:
 product info: "Socket", "CF+ LP WLAN Card Rev A", "1.00"
 manfid: 0x0104, 0x0001
 function: 6 (network)

Network settings have been double checked and verified, all settings are
correct, including WEP key. I know the card works perfectly, as under Cacko
1.23 the card works flawlessly. Under OZ3.5.4.1 nothing.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.



Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NesCA-0007Ta-FI
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 16:40:13 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 9885749127F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2010 16:37:39 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 9 Feb 2010 16:38:35 +0100
Message-ID: <4B71815C.6050208@dresearch.de>
Date: Tue, 09 Feb 2010 16:38:04 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B7145A5.70808@dresearch.de>
	<1265716784.16488.1.camel@mattotaupa>	<4B716090.2090104@dresearch.de>
	<20100209132913.GC24852@ibawizard.net>
In-Reply-To: <20100209132913.GC24852@ibawizard.net>
X-OriginalArrivalTime: 09 Feb 2010 15:38:35.0241 (UTC)
	FILETIME=[F10A1590:01CAA99D]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: confused by netbase/udev
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
X-List-Received-Date: Tue, 09 Feb 2010 15:40:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Petr =C5=A0tetiar wrote:
> man 5 interfaces?
>=20
> Quote:
>=20
> " lines beginning with the word "auto" are used to identify the physica=
l
> interfaces to be brought up when ifup is run with  the  -a  option.   (=
This
> option  is  used  by  the  system  boot scripts.)  Physical interface n=
ames
> should follow the word "auto" on the same line.  There can be multiple =
"auto"
> stanzas.  ifup brings the named interfaces up in the order listed.  "

OK, i try to solve one problem after the other. Let's accept that
every new USB-NIC gets a new name for now (using a pool of interface name=
s).

I've tried to create a /etc/network/interfaces which fits my wishes:

------------->snip<----------------
# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)

# the loopback interface
auto lo
iface lo inet loopback

# interfaces to bring up at boot time
auto eth0

# the onboard NIC
iface eth0 inet dhcp

# interfaces to bring up when hotplugging
allow-hotplug eth1 eth2 eth3 eth4 eth5 eth6 eth7 eth8

# additional USB-NIC's
iface eth1 inet dhcp
iface eth2 inet dhcp
iface eth3 inet dhcp
iface eth4 inet dhcp
iface eth5 inet dhcp
iface eth6 inet dhcp
iface eth7 inet dhcp
iface eth8 inet dhcp
------------->snip<----------------

This works fine when hotplugging, but the USB-NIC is not recognised
when connected while booting up. :(

I tried to change the one line responsible for that to

  auto eth0 eth1 eth2 eth3 eth4 eth5 eth6 eth7 eth8

This works better but leads to dirty errors messages while booting
and shutdown for disconnected interfaces:

boot:
eth1: unknown interface: No such device
eth2: unknown interface: No such device
eth3: unknown interface: No such device
eth4: unknown interface: No such device
eth5: unknown interface: No such device
eth6: unknown interface: No such device
eth7: unknown interface: No such device
eth8: unknown interface: No such device

shutdown:
Deconfiguring network interfaces... cat: /var/run/udhcpc.eth0.pid: No suc=
h file or directory
cat: /var/run/udhcpc.eth1.pid: No such file or directory
eth1: unknown interface: No such device
cat: /var/run/udhcpc.eth2.pid: No such file or directory
eth2: unknown interface: No such device
cat: /var/run/udhcpc.eth3.pid: No such file or directory
eth3: unknown interface: No such device
cat: /var/run/udhcpc.eth4.pid: No such file or directory
eth4: unknown interface: No such device
cat: /var/run/udhcpc.eth5.pid: No such file or directory
eth5: unknown interface: No such device
cat: /var/run/udhcpc.eth6.pid: No such file or directory
eth6: unknown interface: No such device
cat: /var/run/udhcpc.eth7.pid: No such file or directory
eth7: unknown interface: No such device
cat: /var/run/udhcpc.eth8.pid: No such file or directory
eth8: unknown interface: No such device
done.

I'm not really happy with that. :(

Steffen




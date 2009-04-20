Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Lvpx5-0005mt-7i
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 11:38:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 87FD61417180;
	Mon, 20 Apr 2009 11:35:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHFAHax9if1C; Mon, 20 Apr 2009 11:35:48 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 168081416BA2;
	Mon, 20 Apr 2009 11:35:47 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <359c5480903061431t30283e9dgda3d57aedfbb8999@mail.gmail.com>
References: <1236373070.7461.49.camel@utx.utx.cz>
	<359c5480903061431t30283e9dgda3d57aedfbb8999@mail.gmail.com>
Date: Mon, 20 Apr 2009 11:33:50 +0200
Message-Id: <1240220030.14678.5.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Cc: Matthias Hentges <matthias@hentges.net>, devel@lists.openmoko.org
Subject: Re: [PATCH] new interface is already up but udev must call ifup anyway
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
X-List-Received-Date: Mon, 20 Apr 2009 09:38:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nicola Mfb wrote in Fri 03/06 2009 at 23:31 +0100:=20
> 2009/3/6 Stanislav Brabec <utx@penguin.cz>
>=20
> > Few weeks ago yet another change happened in the dark, and network di=
d
> > not start to work automatically after inserting my WLAN card.
> >
> > Debugging this problem, I found that interface is already up=EF=BB=BF=
 but not
> > configured when /etc/udev/scripts/network.sh is called. This script
> > thinks, that card is already configured and quits. This behavior is
> > intentional and was introduced three years ago=EF=BB=BF (and working)=
.
> >
> > The fix actually reverts following change:
> > Author: Matthias Hentges <oe@hentges.net>
> > Date:   Thu Apr 20 16:01:09 2006 +0000
> >    udev: network.sh: Do not ifup an already configured network device
> > again.
> >
> > That is why I am asking:
> >
> > Is anybody aware of change, that made new interfaces up without
> > configuring them? Was it an intention or not?
> >
>=20
> I had the same problem with bnep bluetooth networking, and another issu=
e
> when spawing dhcp, take a look at:
> http://lists.openmoko.org/pipermail/devel/2009-February/004895.html

I researched this problem a bit. It seems, that it's caused by
wpa_supplicant. New wpa_supplicant quickly responds to the device
addition. It turns the device up and sets up the wireless link, but not
network.

It causes several problems:
- link is up -> no ifup

After applying mentioned patch:
- AP lookup takes about 20 seconds. Too much for dhcp client =3D>
  it fails. Surprisingly avahi succeeds.

Proposed solution:
Either:
wpa_wupplicant should perform (or trigger somehow) wlan network hotplug
completely (i. e. call ifup after network association instead of udev
device addition)
or:
Revert previous behavior - "passive" wpa_supplicant.
or:
Apply mentioned patch. Ugly, it fixes only symptom, not the cause.

________________________________________________________________________

Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




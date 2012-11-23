Received: from 7.mo3.mail-out.ovh.net ([46.105.57.200]
	helo=mo3.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TbuxR-0006Rw-WE
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:14:22 +0100
Received: from mail632.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 10C42FF9AB1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2012 15:33:19 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Nov 2012 16:22:13 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 23 Nov 2012 16:22:10 +0200
Date: Fri, 23 Nov 2012 15:22:10 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Koen Kooi <koen@dominion.thruhere.net>, Khem Raj <raj.khem@gmail.com>
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Message-ID: <20121123152210.326773a3@eb-e6520>
In-Reply-To: <20121123135008.GC2808@ad.chargestorm.se>
References: <cover.1353603007.git.paul.eggleton@linux.intel.com>
	<k8nh49$jq6$1@ger.gmane.org>
	<20121123131256.GB2808@ad.chargestorm.se>
	<20121123143619.7997e637@eb-e6520>
	<20121123135008.GC2808@ad.chargestorm.se>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.1 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 9696812949597302089
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrvdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrvdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH 0/3] Fix ntp bbappends
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
X-List-Received-Date: Fri, 23 Nov 2012 15:14:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Fri, 23 Nov 2012 14:50:09 +0100,
Anders Darander <anders@chargestorm.se> a =E9crit :

>=20
> * Eric B=E9nard <eric@eukrea.com> [121123 14:36]:
>=20
> > Le Fri, 23 Nov 2012 14:12:57 +0100,
> > Anders Darander <anders@chargestorm.se> a =E9crit :
>=20
> > >=20
> > > * Koen Kooi <koen@dominion.thruhere.net> [121123 10:54]:
> > >=20
> > > > Op 22-11-12 17:54, Paul Eggleton schreef:
> > > > > This is the meta-systemd patch series corresponding to the recent=
ly sent=20
> > > > > out patches for ntp in meta-networking. 1/3 and 2/3 should be app=
lied=20
> > > > > ASAP even if 3/3 is not applied immediately, as the layer is curr=
ently=20
> > > > > broken; 3/3 needs to wait until after the meta-networking patches=
 go in.
> > >=20
> > > > 1/3 and 2/3 have been applied.
> > >=20
> > > Could you, or Eric, apply them to danny also, or should we do a new p=
ull-request?
> > >=20
> > please simply provide the commit hash you want to provide so that I can
> > easily cherry-pick them
>=20
>=20
> Sure, as I'm out of office, I'll only list the commit hashes here, in
> order (otherwise I would have sent a pull request).
>=20
> 7da3e44c0dc53c05acce387bf5461d0e292f8d34
> c6fe627660a6085f9377337f486e11bad92082e4
>=20
> These are (in the same order):
> meta-systemd: Move ntp recipes to 'meta-networking' sublayer
> meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p5
>=20
> These commits will make meta-systemd parse again.
>=20
OK, unfortunately I don't yet have the right to commit on danny :
remote: W refs/heads/danny meta-openembedded eric_benard DENIED by
fallthru
remote: error: hook declined to update refs/heads/danny
To git@git.openembedded.org:meta-openembedded
 ! [remote rejected] danny -> danny (hook declined)

Koen, Khem : may you please unlock the access ?

Thanks,
Eric



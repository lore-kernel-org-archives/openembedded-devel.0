Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PkyXG-00071J-Mo
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 13:43:42 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PkyWM-0007E9-5D by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Feb 2011 13:42:48 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PkyWK-0002qu-Cm
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 13:42:44 +0100
Date: Thu, 3 Feb 2011 13:42:44 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110203124244.GJ4580@excalibur.local>
References: <20110203093253.GG4580@excalibur.local>
	<201102031054.08764.ml@vdm-design.de> <20110203101242.GF3265@jama>
MIME-Version: 1.0
In-Reply-To: <20110203101242.GF3265@jama>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: libnl vs. libnl2 madness
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
X-List-Received-Date: Thu, 03 Feb 2011 12:43:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Thu, 2011-02-03 at 11:12, Martin Jansa wrote:
> On Thu, Feb 03, 2011 at 10:54:08AM +0100, Thomas Zimmermann wrote:
> > On Thursday 03 February 2011 10:32:53 Stefan Schmidt wrote:
> >=20
> > At that time there was just one recipe depending on libnl2 and that was=
 FSO2.
> > I think one month ago JaMa has build the first SHR image without libnl(=
1),=20
>=20
> yes after couple of changes
> http://git.openembedded.org/cgit.cgi/openembedded/log/?h=3Dorg.openembedd=
ed.dev&qt=3Dgrep&q=3Dlibnl
>=20
> > until then it was impossible because of some important parts. I'm not s=
ure but=20
> > i think the main blocker was bluez4 (Can't check now).
>=20
> Yes older bluez4 with nl plugin (which was removed later).

Good, so bluez is of the table.

> and:
> http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/70b13d30=
b335b8fd67116d3bc0834382a77bc319
> 81      ANGSTROM_BLACKLIST_pn-bmon =3D "bmon depends on libnl we want lib=
nl2"
> 82	ANGSTROM_BLACKLIST_pn-crda =3D "crda depends on libnl we want libnl2"

No idea about these two.

> 83	ANGSTROM_BLACKLIST_pn-hostap-daemon =3D "hostap-daemon depends on libn=
l we want libnl2"

Should be fine to build with CONFIG_LIBNL20 set. Its the same codebase as
wpa-supplicant.

> 84	ANGSTROM_BLACKLIST_pn-ibrdtn =3D "ibrdtn depends on libnl we want libn=
l2"

Maybe I should get a stab at this as I'm the main user of it in OE. :)

> 85	ANGSTROM_BLACKLIST_pn-iw =3D "iw depends on libnl we want libnl2"

Need to check latest version for libnl2 support. Should not be to hard to c=
hange
it.

> 86	ANGSTROM_BLACKLIST_pn-lowpan-tools =3D "lowpan-tools depends on libnl =
we want libnl2"

When I'm going to poke ibrdtn I could take a look here as well. Maybe Dmitr=
y .

> 87	ANGSTROM_BLACKLIST_pn-networkmanager =3D "networkmanager depends on li=
bnl we want libnl2"
> 88	ANGSTROM_BLACKLIST_pn-networkmanager-openvpn =3D "networkmanager-openv=
pn depends on libnl we want libnl2"

Those two have a pretty big code base and I'm not going to dive into it (ag=
ain).

> 89	ANGSTROM_BLACKLIST_pn-pstree =3D "pstree depends on libnl we want libn=
l2"
> 90	ANGSTROM_BLACKLIST_pn-rfkill =3D "rfkill depends on libnl we want libn=
l2"

Need to check latest version for libnl2 support. Should not be to hard to c=
hange
it.

> I didn't check if those can be built with libnl2 or if they work properly=
 with libnl2.

As you can see I would be willing to work on some of these. Personally I wo=
uld
aim for getting the recipes over to libnl2 and the kill libnl1 for good in =
OE.

> But be aware that we had enough issues in runtime (build passes ok) cause=
d by libnl1 built in same sysroot=20
> as libnl2 (that's why I had to blacklist libnl2 in SHR).

Thats one more reason to get rid of the old version. :)

regards
Stefan Schmidt



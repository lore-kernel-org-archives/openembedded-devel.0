Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1P6OCe-0004uD-2R
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 15:50:41 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 0F4601D36170; Thu, 14 Oct 2010 15:50:06 +0200 (CEST)
Date: Thu, 14 Oct 2010 15:50:06 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101014135006.GL28423@ibawizard.net>
References: <20101014124548.GJ28423@ibawizard.net>
	<i9705t$i6g$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i9705t$i6g$1@dough.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] ts72xx, ts73xx, ts74xx? How to handle properly	similar machines
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
X-List-Received-Date: Thu, 14 Oct 2010 13:50:41 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Koen Kooi <k.kooi@student.utwente.nl> [2010-10-14 15:22:05]:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 14-10-10 14:45, Petr =A9tetiar wrote:
> > Hi,
> >=20
> > I've been asked if I could add support for the ts7400 board/machine i=
n the OE.
> > It's not a big deal, it's just an addition of one patch to the kernel=
 recipe.
> >=20
> > While I'll be into it, I was thinking about adding the base for the p=
ossible
> > future addition of ts7300[2] boards also. Althought I own only ts7800=
 and
> > ts7250, the ts7200[4], ts7300 and ts7400 families looks like they hav=
e a lot
> > of common and it would be possible to have for example one kernel for=
 all of
> > them.
> >=20
> > The question is, how to handle this correctly in OE? On the IRC, I wa=
s pointed
> > to the SOC_FAMILY[3], but it says "The use of SOC_FAMILY as an overri=
de is
> > currently a distribution or local setting", what does it mean?
>=20
> It means you need to use angstrom or set is as override in local.conf

You mean setting it to something like a SOC_FAMILY =3D "ts7xxx"? And then=
 do
something like this, from recipes/ti/ti-linuxutils.inc:

do_compile() {
    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS

    case ${SOC_FAMILY} in
    dm365)
            modules=3D"cmem edma irq";;
    omap3)
            modules=3D"cmem sdma";;
        dm355)
            modules=3D"cmem edma irq";;
    *)
            modules=3D"cmem"
    esac

Well, I'm not OE/bitbake expert, but using something like
do_compile_append_SOC_FAMILY() would fit more in OE style for me. I can't=
 find
any other usage of it. Anyway I think, that it would be abuse of SOC_FAMI=
LY,
something like the SBC_FAMILY would be more apropriate, but again, I'm no=
t OE
expert and I don't know what is possible.

-- ynezz



Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B90C572A78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 14:15:13 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1ZcDUP-0004eU-De from Joe_MacDonald@mentor.com ;
	Wed, 16 Sep 2015 07:15:13 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Sep 2015 07:15:12 -0700
Received: by burninator (Postfix, from userid 1000)	id 78FD358781C; Wed, 16
	Sep 2015 10:14:04 -0400 (EDT)
Date: Wed, 16 Sep 2015 10:14:04 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20150916141404.GC7147@mentor.com>
References: <1442339663-15101-1-git-send-email-fabio@bertux.com>
	<20150915180454.GB10507@mentor.com>
	<CAP9ODKou_0-g3pN6Kh4b9wT+3W5ZeJLP614FduLnxp456n4dvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKou_0-g3pN6Kh4b9wT+3W5ZeJLP614FduLnxp456n4dvA@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Fabio Berton <fabio.berton@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Qian Lei <qianl.fnst@cn.fujitsu.com>
Subject: Re: [meta-networking][PATCH] lldpd: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Sep 2015 14:15:13 -0000
X-Groupsio-MsgNum: 57392
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline

--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

I see there's a new version to look at but this is the thread where the
discussion is happening that I want to continue, so here we go.  :-)

[Re: [oe] [meta-networking][PATCH] lldpd: Add recipe] On 15.09.15 (Tue 17:3=
3) Otavio Salvador wrote:

> Hello Joe,
>=20
> On Tue, Sep 15, 2015 at 3:04 PM, Joe MacDonald <Joe_MacDonald@mentor.com>=
 wrote:
> > [[oe] [meta-networking][PATCH] lldpd: Add recipe] On 15.09.15 (Tue 14:5=
4) Fabio Berton wrote:
> >
> >> From: Fabio Berton <fabio.berton@ossystems.com.br>
> >>
> >> lldpd is a 802.1AB implementation, a L2 network discovery protocol.
> >> It also supports CDP, EDP and various other protocols.
> >
> > I haven't looked at this in great detail yet, but it appears like it
> > would provide the same functionality as lldpad, already in
> > meta-networking:
> >
> > commit 6781f9b5dc60bbd39727aeaa74c13dd31eb73838
> > Author: Qian Lei <qianl.fnst@cn.fujitsu.com>
> > Date:   Thu Dec 11 17:36:20 2014 +0800
> >
> >     lldpad: Add new recipe
> >
> >     LLDPAD contains the Linux user space daemon and configuration tool =
for
> >     Intel LLDP Agent with Enhanced Ethernet support for the Data Center.
> >
> >     Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> >     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >
> > I've no objection to carrying two different implementations,
> > particularly if one is more complete than the other or if one is more
> > actively developed, but I do have a couple of requests for you given
> > that you're the second one on the scene.
>=20
> It seems the lldpd is way more actively maintained. We have a customer
> using this in an environment with some thousands of network devices
> with great success and we wished to upstream the recipe and avoid
> maintaining a closed recipe for no reason.

I'm good with that.  Coming from a carrier background I know that
frequent updates does not necessarily mean more stable, but actively
developed with real-world users is convincing enough for me to merge
this.

> >    - Can you update your recipe (and the other, if necessary) to provide
> >      an appropriate PROVIDES / CONFLICTS variable?
>=20
> I am not sure we should. Being two alternatives nothing blocks someone
> to install both.

I thought about that, but the question in my mind is does it make sense
to install both?  If they both tried to start up at boot via
initscripts/systemd, would they conflict with each other or do they
manage that gracefully?  I really don't know.

> To be honest, maybe this one could replace the old one for
> meta-network future users, if Qian Lei agrees.

I'd really like that, if it turns out lldpad is a reasonable subset of
lldpd functionality.

Either way I'll take a look at the latest patch set and if there's
anything specific in there I have to comment on, I will, otherwise we'll
give everyone else on the list a bit of time to respond and then make a
call about the specifics of merging this.

--=20
-Joe MacDonald.
:wq

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV+XksAAoJEEn8ffcsOfaWGLEIANIl22qJOT/uru1pwHjRw8Ph
n6vYmoKWxSN3Dwk2LmzdWRhKrBuZm0kOOqDOGke1ChBd2m6SBceA2hbWBh5GazHC
1AQCfMw40qzPhSD4vNLybeQoFpbMungqjOHy+tW2pFoC/48gLK6fIP7UWftBYkTw
q07Ffc3M2XS3Tapdq8baJidBV4MixBzsh1ONYVHlcKeTCA0cRhLdGCP/Dr1ymdyf
dlAqZ/sK+7lgpLBe+Yu/0H9/VOdElORKNO0w0uXWBf2YocngLW0sasmDY9HBiGzx
zhDaw3aM8mAwOf7o3MOvzZdon+NK6S5v2C4fdiEfZsW571jsyK4qCzYt7s/TcwQ=
=Z9NZ
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--

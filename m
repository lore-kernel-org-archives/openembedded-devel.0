Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbAXv-0008FM-Ui
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 14:41:04 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2733013eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 05:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NyRGN9h5sXiEEYjee4H43BDmmiBqasAv60rgD0DzsZY=;
	b=f4isdjD9FBwz0GvPMxVcUblBi9/QAJgi6gAEBlGrCAOKwWyvVYmwm/qQuaujLpzSkr
	olfjta9mJf3/SJ2/M9nkvdCcEg5icna6Y9aroJT71EyxXJzWOGZdMOjnPrJ0OPU7eOZ5
	V225vaDI+Eekl5mcpC483QfhR54hoU1FgpXeLxwAK5Qgxku9h9tAmpaWWOMT9hUFs4ob
	t+FDHMHiHGZpaHcRiHQxfwh9x47PUCP0b04vTjrRk1Z5dMedT1Emn4gOh1FTS3EccsNB
	bd8CXYAkZGtPi2QpYP1tT58vUoD2BVcU6TV9MMlR1YsCef6KymKtYvXFK/K9XKM29ptU
	zLXQ==
Received: by 10.14.176.68 with SMTP id a44mr45783280eem.1.1353504411172;
	Wed, 21 Nov 2012 05:26:51 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v47sm199692eeo.9.2012.11.21.05.26.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 05:26:50 -0800 (PST)
Date: Wed, 21 Nov 2012 14:26:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121121132646.GJ12637@jama.jama.net>
References: <k6b5r8$edu$1@ger.gmane.org>
 <50ACD301.9000109@balister.org>
MIME-Version: 1.0
In-Reply-To: <50ACD301.9000109@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: yocto 1.3 branch for meta-openembedded layers, RFC wanted.
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
X-List-Received-Date: Wed, 21 Nov 2012 13:41:04 -0000
X-Groupsio-MsgNum: 41602
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XigHxYirkHk2Kxsx"
Content-Disposition: inline

--XigHxYirkHk2Kxsx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2012 at 08:11:29AM -0500, Philip Balister wrote:
> On 10/25/2012 06:55 AM, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Hi,
> >
> > We need a branch to track oe-core 'danny' and I am swamped till ELC-E
> > happens, so I would like to hold off on patches that make meta-oe layers
> > incompatible with oe-core 'danny'.
> >
> > As for branch maintenance: any volunteers for managing the meta-openemb=
edded
> > 'danny' branches? There doesn't need to be a single maintainer, but it =
would
> > be nice to have one person coordinating everything, even if it's just
> > pulling in danny-next branches from the layer maintainers every week or=
 so.
> >
> > As I said above, I'm swamped for the next 3 weeks, so can people who ha=
ve
> > used or are using the 'denzil' branch weigh in with feedback/anecdotes/=
etc?
> > I have such a document for oe-core 'denzil', which I keep failing to se=
nd
> > out, but it boils down to "better predictability for merge windows". Pl=
ease
> > share your experience for meta-oe here.
>=20
> What is happening on this front? Since oe-core dropp qt-4.8.1, builds=20
> including meta-oe are now broken.

And meta-oe needs to have
http://patches.openembedded.org/patch/38519/
applied also for danny (even with my last question still not answered).

But without it at least navit lost gypsy and some other layers could
also assume that gypsy is somewhere in oe-core+meta-oe.

> If the branch maintainers are not ready to go, we need to apply patches=
=20
> that fix builds, even if thy break compatibility with Danny.

In worst case danny branch can be created from revision before qt4-4.8.1
bbappends are dropped.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XigHxYirkHk2Kxsx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCs1pYACgkQN1Ujt2V2gBzHpQCfUyNrvnv/t4nAtrR9y4TzBfQq
DNkAn218DdChrk/yABn2wznSeeYBHeY1
=d0b+
-----END PGP SIGNATURE-----

--XigHxYirkHk2Kxsx--

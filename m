Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sn31O-0005WW-4U
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jul 2012 09:32:10 +0200
Received: by wgbdr1 with SMTP id dr1so8261478wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2012 00:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vNNuP4JpQnl77sK7C1blSUGqen4zK8yRB28g6Pihlow=;
	b=NJib+vWJLapMtIaNdwjXwOU6eM6sXrNGihspXJRZL+amJgShSd/7hmxEivoMyGSQY+
	u13eGAlmO/v6DJRUbc8BCj0enJSqvZj1RnfKTwAyCyPcAnATZGY4daxBe78ajUCsQX4A
	zcwXPNScfnR0tvuTPRaB68iwahc+GftVBhtwmt2QjGI9aHBiguL0E3PX8y4G3WB/70pd
	WjEPKvksj0sP+FP7V/UrfWJMzrY4nc1kGh9LMoxIUBsyxBidKc6cXS7JVEoXQPFdkGtz
	XlXJJ1pCyn7TcUSO2iEUTeCanyLsAVEIppIU72FsiuVEAv4F+u/5rXsQww36Ci1e/k38
	H5iA==
Received: by 10.216.166.197 with SMTP id g47mr9005799wel.179.1341559264887;
	Fri, 06 Jul 2012 00:21:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id db7sm4295702wib.6.2012.07.06.00.21.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jul 2012 00:21:03 -0700 (PDT)
Date: Fri, 6 Jul 2012 09:21:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Message-ID: <20120706072102.GG3708@jama.jama.net>
References: <1341518383-20990-1-git-send-email-elvis.dowson@gmail.com>
	<20120705201635.GC3708@jama.jama.net>
	<80F4FA6C-14E4-4392-9796-D4D5D7090C3C@gmail.com>
MIME-Version: 1.0
In-Reply-To: <80F4FA6C-14E4-4392-9796-D4D5D7090C3C@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openembedded] lighttpd: Rename to lighttpd_1.4.31.bbappend.
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
X-List-Received-Date: Fri, 06 Jul 2012 07:32:10 -0000
X-Groupsio-MsgNum: 39502
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WkfBGePaEyrk4zXB"
Content-Disposition: inline

--WkfBGePaEyrk4zXB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 06, 2012 at 07:00:46AM +0400, Elvis Dowson wrote:
> Hi,
>=20
> On Jul 6, 2012, at 12:16 AM, Martin Jansa wrote:
>=20
> > On Thu, Jul 05, 2012 at 11:59:43PM +0400, Elvis Dowson wrote:
> >> This commit renames the lighttpd bbappend file to match the recipe ver=
sion
> >> provided in poky/meta-oe/recipes-extended/lighttpd
> >=20
> > This ^ doesn't make sense to me.
> >=20
> > Recipes are provided by oe-core and path
> > poky/meta-oe/recipes-extended/lighttpd doesn't exist in poky repo AFAIK.
> >=20
>=20
> The comment should have read poky/meta/recipes-extended/lighttpd
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-extended=
/lighttpd

No, that repo from where they come is called oe-core and poky as repo is
just mixin of other repositories.

so call it oe-core and if you want to provide path then without "poky/"
prefix.

Cheers,

>=20
> I will resend the patch, after correcting the comments.
>=20
> Elvis Dowson
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WkfBGePaEyrk4zXB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/2kd4ACgkQN1Ujt2V2gBw6YQCePAr6TUxRTkibRoSSdxcvN3vT
/REAnRchrCi+e410io7NPQBsH1B9WITz
=hLM3
-----END PGP SIGNATURE-----

--WkfBGePaEyrk4zXB--

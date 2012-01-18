Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RnY7x-0006oP-M6
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 17:12:45 +0100
Received: by eekd41 with SMTP id d41so208607eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2012 08:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GkOY71E2RURLnrgdNNNArGQWTMXT6uqeFEdqGL6mniI=;
	b=RI3P2HOMMm4gFhUIKy2dQg2gWDfIyvmYYoVifKCFIBB5QLj1Nnu/CZEhpXxg83RAdh
	p/hwgF44kEKzLjp/Vz9vB6JtCkY0ZyHmvnHAjylE047UppdToGKu2lehkOoGCSa55pB1
	0JQO7luYfl8vPPitEW7+NNhfABtSGEYpNOa4I=
Received: by 10.14.11.97 with SMTP id 73mr380906eew.2.1326902707294;
	Wed, 18 Jan 2012 08:05:07 -0800 (PST)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	y12sm101227308eeb.11.2012.01.18.08.05.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 08:05:05 -0800 (PST)
Date: Wed, 18 Jan 2012 17:05:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120118160503.GA18110@jama.jama.net>
References: <ED3E0BCACD909541BA94A34C4A164D4C402355CD@post.tritech.se>
MIME-Version: 1.0
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C402355CD@post.tritech.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance] Packaged staging -- dependency problem
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
X-List-Received-Date: Wed, 18 Jan 2012 16:12:45 -0000
X-Groupsio-MsgNum: 36562
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2012 at 03:51:37PM +0000, Mats K=E4rrman wrote:
> Well, now at least it pulls packages from the mirror instead of building =
them but there is a but.
>=20
> When building glib-2.0, do_configure uses autotools and the configure scr=
ipt of glib-2.0 wants to use sed from sysroots. sed-native exists in the mi=
rror but has not been installed in sysroots. I am uncertain where the depen=
dency on sed (or sed-native?) is missing/should be added. In the glib recip=
e or for autotools class? (this time i looked in master but found no releva=
nt patches.)
>=20
> Any advice?
>=20
> BR // Mats
>=20
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Mats K=E4rrman [Mats.Karrma=
n@tritech.se]
> Sent: Wednesday, January 18, 2012 3:57 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [2011.03-maintenance] Packaged staging, anyone?
>=20
> Hi Tom,
>=20
> Thanks for answering.
> I just found the fix in master branch (sorry for not looking there first)=
, commit       1aeea48674d3e831a5830e43ad4fdcfab295ebd2 on /classes/package=
d-staging.bbclass.
> Apparently you helped fixing this issue then :)
> I have tried the patch and it works for me so I will send you a pull-requ=
est shortly.
>=20
> BR // Mats
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Tom Rini [tom.rini@gmail.co=
m]
> Sent: Wednesday, January 18, 2012 3:49 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [2011.03-maintenance] Packaged staging, anyone?
>=20
> On Wed, Jan 18, 2012 at 2:33 AM, Mats K=E4rrman <Mats.Karrman@tritech.se>=
 wrote:
> > Hi,
> >
> > I'm trying to set up packaged staging for my project. I found some inst=
ructions in the packaged-staging.bb file header and some info in the mailin=
g list that I followed but it don't seem to work. Everything is built from =
scratch anyway -- no error messages.
> [snip]
>=20
> After populating the pstage mirror directory, when you do bitbake -e
> somepkg (where somepkg is in the pstage mirror) do the PSTAGE*
> variables expand such that the file it's looking for as a pstage
> exist?  What if you use python or some other trivial http server and
> try and use the mirror that way?  I seem to recall I had an issue with
> PSTAGE_MIRROR and file URIs but I forget if there was a good solution
> to it (or if making use of python -m SImpleHTTPServer was the
> solution).
>=20
> --
> Tom

Hi Mats,

can you please setup your mail client to prefix the text you're replying
to with something (e.g. '> ') and write your reply under relevant parts
of previous discussion?

In current format it's hard to see what was written by Tom and what's
written by you.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8W7a8ACgkQN1Ujt2V2gByZ+ACfU7bjQNINIxfrnn0lW4nbKm5W
BcUAoKRztfsAjcfOk/YQfC0VjMhqivkG
=LnAK
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--

Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SIRHk-00028b-UE
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 23:10:32 +0200
Received: by wera1 with SMTP id a1so1560412wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 14:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gK1qAplzNy3pgWFhdXI+w6Wb84xlmkvRC1qHQEco5TY=;
	b=MZNzUqPjZy2u80pVj1aEoIPLaOdV1lWzOs7XgNoxvgfVRf1MpvAJQh4sq3iLIY0Bvv
	QN9fxGDEpNUBdBABDbBG/DVLRh0fIICkSgeJ3Bt3gpKWaRWYTCo0Wdc39WdswR1qeDWE
	csMS04NK/IzxJO1S68zic+gf0foPWwBdZdWhLOV34lAwTAI5wQ+BsSxPhGEdkSQfejic
	U845Jch7in2m5n8jd7tW/UjmEFJpOFDj1jiTZekmZtC5M77HuvueV47Vx/IN5yTYr9Rh
	HQlqVxC0RQGdpchtR9wXcKx4bIcEYdIfYdEkaXT60ZViUnXc7CMp8wJfMTGsqdKz7wIS
	Skyw==
Received: by 10.180.79.72 with SMTP id h8mr547987wix.1.1334264472362;
	Thu, 12 Apr 2012 14:01:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n8sm25563479wix.10.2012.04.12.14.01.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Apr 2012 14:01:09 -0700 (PDT)
Date: Thu, 12 Apr 2012 23:01:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Apelete Seketeli <apelete@seketeli.net>
Message-ID: <20120412210108.GA3945@jama.jama.net>
References: <1334180792-20535-1-git-send-email-apelete@seketeli.net>
	<20120411125503.GB3637@jama.jama.net>
	<20120412204417.GD3256@hermes>
MIME-Version: 1.0
In-Reply-To: <20120412204417.GD3256@hermes>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: Update SRC_URI to git.yoctoproject.org
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
X-List-Received-Date: Thu, 12 Apr 2012 21:10:33 -0000
X-Groupsio-MsgNum: 38237
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 10:44:17PM +0200, Apelete Seketeli wrote:
> Le 11-Apr-12, Martin Jansa a =E9crit:
> > On Wed, Apr 11, 2012 at 11:46:32PM +0200, Apelete Seketeli wrote:
> > > This updates SRC_URI as the svn.openmoko.org repository is now down.
> > > All the changes of this patch were picked from oe-core and brought
> > > over.
> > >=20
> > > Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> > > ---
> > >  .../opkg-utils/opkg-utils/add-license-field.patch  |   39 ++++++++++=
+++++++
> > >  .../opkg-utils/arfile_header_split.patch           |   10 +++++
> > >  .../opkg-utils/index-ignore-filenotfound.patch     |   19 ++++++++
> > >  recipes/opkg-utils/opkg-utils/mtime-int.patch      |    3 ++
> > >  recipes/opkg-utils/opkg-utils/shebang.patch        |   46 ++++++++++=
++++++++++
> > >  recipes/opkg-utils/opkg-utils_git.bb               |   31 ++++++++++=
+++
> > >  recipes/opkg-utils/opkg-utils_svn.bb               |   27 ----------=
--
> > >  7 files changed, 148 insertions(+), 27 deletions(-)
> > >  create mode 100644 recipes/opkg-utils/opkg-utils/add-license-field.p=
atch
> > >  create mode 100644 recipes/opkg-utils/opkg-utils/shebang.patch
> > >  create mode 100644 recipes/opkg-utils/opkg-utils_git.bb
> > >  delete mode 100644 recipes/opkg-utils/opkg-utils_svn.bb
> >=20
> > All those patches were sent as git patches for git.yoctoproject.org.. s=
o=20
> > you can ping yocto ML to apply them sooner then after 1.2 release to ma=
ke this patch
> > a bit smaller :).
> >=20
> > See
> > https://lists.yoctoproject.org/pipermail/yocto/2012-March/007851.html
>=20
> Sorry for the giant patch, I wasn't sure if I should split it since
> the patch files in the commit are needed for the recipe to work.
>=20
> Concerning the patches sent to the yocto ML, we may have a
> misunderstanding here.
> This patch I sent is picked from oe-core and I would like someone to
> review it and ultimately apply it to *oe-classic* (I need it for the
> jlime distribution, which is only available in oe-classic for now).
> It seemed to me that the yocto project is based on oe-core, so I don't
> understand why I should get in touch with them to get some part of the
> changes applied on their side (of oe-core, if I am not mistaken).

To get those changes applied in=20
http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/

so that you would just use newer SRCREV with all those patches already
applied in upstream git repo without any local patches needed (the same
change - removal of local patches in favor of newer SRCREV will happen
in oe-core too after it's applied in opkg-utils repo).

> I probably missed some point you were trying to make, could you tell
> me how to get this into oe-classic ?

I know this was for oe-classic.. hope it's clearer now..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+HQpQACgkQN1Ujt2V2gBwh8QCePc4XQDwPolDGyivyZ5wR2bbf
Bs0AoIuDWEy4+gF9TLQGPSyAOG0Nkk+e
=L1Jr
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--

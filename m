Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDKfY-0007C8-8F
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 21:06:00 +0200
Received: by wera1 with SMTP id a1so1239996wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 11:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p8nkH9ZfuCyggljmUCvbX1Xk5EK1HGUmKuEMpKblXQc=;
	b=cy9ViGSMvwhJH16EAKrcLOtXsMs7/8lk60X+0Z/9dYMVrmIpWu4ANB1GxDusXUtHwT
	8q3DwN30nTM0/loHDoFnyTYAzwo72sUlWfHxPkY/dGAri8mDBt77OT2V/KtE0Hz2tHqY
	zx1lXd6y2HTeShD4PwPkKGL33qrz3ReMa+16tuIdnDX58I8Z0kbp9jbqRQoiYC5vhF8/
	/Vllnx2J62BjbbFwo7DTgS4kXuVEv50pKs7ycps956XohRWdG6u0mXYmTlO4Uc03wj0h
	7PE1MT4OdQ54ol0XLLpEotugBdDbDm5e8SNkhF6f9AoRmZnWRIAIWP4UMxna5Jut7eL4
	ICTQ==
Received: by 10.180.89.9 with SMTP id bk9mr8315403wib.11.1333047416501;
	Thu, 29 Mar 2012 11:56:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 6sm32457104wiz.1.2012.03.29.11.56.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 11:56:55 -0700 (PDT)
Date: Thu, 29 Mar 2012 20:56:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120329185657.GB25815@jama.jama.net>
References: <cover.1333002899.git.Martin.Jansa@gmail.com>
	<082c61be8baa1e3b863ef083ff98ac97a6c594aa.1333002899.git.Martin.Jansa@gmail.com>
	<3065bcbfb2b5c24a3e316375b0afbedadf265665.1333002899.git.Martin.Jansa@gmail.com>
	<CAAQYJAts20KyLfPtXY3wUCd8R9awthfsPue+sbw6UuWcuujW0g@mail.gmail.com>
	<20120329134519.GL4004@jama.jama.net>
	<20120329154005.GF17470@denix.org>
MIME-Version: 1.0
In-Reply-To: <20120329154005.GF17470@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH 2/2] recipes-kernel: use shared linux.inc from meta-oe
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
X-List-Received-Date: Thu, 29 Mar 2012 19:06:00 -0000
X-Groupsio-MsgNum: 38079
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 11:40:05AM -0400, Denys Dmytriyenko wrote:
> On Thu, Mar 29, 2012 at 03:45:19PM +0200, Martin Jansa wrote:
> > On Thu, Mar 29, 2012 at 11:52:15AM +0200, Andrea Adami wrote:
> > > On Thu, Mar 29, 2012 at 8:35 AM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
> > > > * notice that ARM_KEEP_OABI default value is now 0 instead of 1
> > > > =A0but only linux-hackndev and linux-handhelds-2.6-2.6.21 had
> > > > =A0CONFIG_OABI_COMPAT=3Dy in defconfigs so this shouldn't change an=
ything
> > > >
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > >=20
> > > Martin,
> > >=20
> > > I have some concerns here, because I don't think meta-handeld should
> > > depend on meta-oe.
> > > (I know udev .bbappend requires it now but talking with Paul we found
> > > a better solution and udev will disappear from layer soon).
> >=20
> > Denis wanted linux.inc also in some smaller layer then meta-oe, so maybe
> > we can create meta-bsp-support in meta-opememebedded repository and move
> > it there?
> >=20
> > Having linux.inc copy for each BSP is wrong.
>=20
> Remind me, what was the reason to have linux.inc as a separate file in th=
e=20
> first place? I mean, can we roll it back to kernel.bbclass in OE-Core? If=
 not,=20

I guess that linux-yocto would not like linux.inc functionality in
kernel.bbclass, but I haven't looked into linux-yocto much, but I guess
it's still using kernel.bbclass..

> maybe it would be easier to push it as is to OE-Core, since it's much cle=
aner=20
> now?

yes if someone wants to push it there, feel free

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk90sHkACgkQN1Ujt2V2gBxtRACfeoN+0Lx0Dlz03UJ3+r3n6vzt
C6oAoKRfDehGqr+LomXHevHvigK57v1Y
=okaY
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--

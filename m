Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 735AE770C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 16:17:05 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1abVw1-0000ej-DG from Joe_MacDonald@mentor.com ;
	Thu, 03 Mar 2016 08:17:05 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Mar 2016 08:17:05 -0800
Received: by burninator (Postfix, from userid 1000)	id C98D3581D60; Thu,  3
	Mar 2016 11:17:02 -0500 (EST)
Date: Thu, 3 Mar 2016 11:17:02 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20160303161701.GA4671@mentor.com>
References: <1448440079-4533-1-git-send-email-jackie.huang@windriver.com>
	<1448440079-4533-2-git-send-email-jackie.huang@windriver.com>
	<CANBf+V2nZwQ-UGi3wDnKyzHHU8wCoO6i74D5tYxjfwv+g1TAtQ@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C80D944@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C80D944@ALA-MBA.corp.ad.wrs.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] iscsitarget: skip the arch test for kernel modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2016 16:17:06 -0000
X-Groupsio-MsgNum: 60326
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jackie,

[Re: [oe] [PATCH 2/2] iscsitarget: skip the arch test for kernel modules] O=
n 16.03.03 (Thu 04:41) Huang, Jie (Jackie) wrote:

> > On Wed, Nov 25, 2015 at 3:27 AM, <jackie.huang@windriver.com> wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >=20
> > Kernel modules may not have the same architecture as user space.
> > So we tell INSANE_SKIP to skip checking the arch for the modules.
> > This is consistent with other kernel modules and the kernel recipe.
> >=20
> > This one still hasn't been merged and since iscsitarget is currently un=
buildable,=20
> > I'm not in a rush to merge this one particularly since I'm not really c=
lear on the=20
> > logic underlying the change.  I searched the archives and found your re=
sponse to=20
> > Martin was essentially "see my netmap-modules patch for an explanation"=
 and in that=20
> > one the explanation was basically "this is the way other kernel modules=
 do it".=20
>=20
> I think I meant to refer to this one which is not merged either:
> commit 6727154c929f3dc8ed86bab29aa1de88620906e9
> Author: Jackie Huang <jackie.huang@windriver.com>
> Date:   Tue Nov 17 01:44:47 2015 -0800
>=20
>     netmap-modules: skip the arch check for kernel module
>    =20
>     When building on a multilib capable BSP, it's possible for the
>     kernel bit size to be different than the userspace. Avoid the
>     QA test when building the kernel module.
>    =20
>     Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>=20
> sorry that if the explanation is not clear enough.
>=20
> > I merged that one but now I'm thinking I shouldn't have without more
> > careful consideration. =20
>=20
> The one you merged is "netmap-modules: Modules may not have the same arch=
 as userspace"
> and Mark helped to split and re-word the commit message like what it is n=
ow.

Okay, so at least I am looking at what I think I'm looking at.

> > Am I correct in thinking that this problem only shows up when you're
> > building for multilib? =20
>=20
> We have BSPs with a 64 bit kernel + modules + 32 bit userspace by default=
, the
> problem always show up when we're building such BSP, and we have a bbclas=
s to
> add INSANE_SKIP for internal modules:
>=20
> # sanity updates. The do_package_qa_prepend and vmlinux sanity
> # flags allow a 64 bit kernel + modules to be packaged against a
> # 32 bit userspace. If external modules are built, they must supply
> # their own INSANE_SKIP_<module> =3D "arch" if they want to be properly
> # packaged.
> python do_package_qa_prepend () {

I guess in this case you mean it's a bbclass that's internal to Wind
River, I did a quick search and couldn't find the code you reference above
anywhere in my poky tree.

> > I've reverted "netmap-modules: Modules may not have the same arch as us=
erspace" in my contrib=20
> > tree at http://git.openembedded.org/meta-openembedded-contrib/log/?h=3D=
joeythesaint/meta-networking-next=20
> > and my initial test builds showed no QA issues related to netmap-module=
s and the arch checks. =20
> > So I started looking around for other kernel modules doing something si=
milar and I don't actually=20
> > see this "INSANE_SKIP_kernel-module-*" construct being used anywhere el=
se in meta-oe or poky=20
> > (and at the least I would expect something like cryptodev-module to nee=
d it, it looks like an=20
> > analogue to me).  Can you fill me in on what's special with iscsitarget=
 and netmap, because=20
> > even if it is a multilib issue, why wouldn't that be showing up for oth=
er kernel modules built=20
> > in poky?
>=20
> That's because there is no such BSP like I mentioned above in poky, I
> undersatand if this is not accpeted, we may add this in our own layer.

I think that's best, since otherwise the you'll be submitting these
changes for any external module to support a use-case that we don't have
in Yocto and there's no obvious corresponding behaviour in poky.

Thanks.

--=20
-Joe MacDonald.
:wq

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW2GN6AAoJEEn8ffcsOfaWHHEIAMgHDJFYYf3oC+pBW+98u/Ag
+0C3sz9S+E/bhNBBZkc8HxxNu19K/dkSJAqnCdja4hn2BvAssDwXTwKI2/1zvEJT
78VZYrgBXaGIxqHphxJJsr9cI1cwIzlFv9LZHtAeAs66w20Od2/DVAO4wURrd8gm
QLMorOLddsbNRFa42L0y6WWjBDqBGt9WrtGPE4MN+IyH4rpqoZwTwnfETWQtYOii
7LOKIDGvj8VwKjqBlJ2dxnwwVZQvtCnlS6/6XGsvY1+5lBf1O+KkR261YZwn6AGh
i7ZEwn++fw+yNiWSLERILwzrqTWyM3aEd4P8CI7mAPqtILgEZYFxMl3+yxXOyHk=
=fj3E
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--

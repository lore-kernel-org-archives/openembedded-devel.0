Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.11092.1615825006620522587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C97BA40BFF;
	Mon, 15 Mar 2021 16:16:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rj0rsCxqTFlR; Mon, 15 Mar 2021 16:16:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8FF5640A77;
	Mon, 15 Mar 2021 16:16:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 55904174543; Mon, 15 Mar 2021 12:16:41 -0400 (EDT)
Date: Mon, 15 Mar 2021 12:16:41 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Armin Kuster <akuster808@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, "Bajjuri, Praneeth" <praneeth@ti.com>,
	Changqing Li <changqing.li@windriver.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][dunfell PATCH] thin-provisioning-tools: switch branch from master to main
Message-ID: <20210315161641.GL4892@denix.org>
References: <20210315011408.6604-1-praneeth@ti.com>
 <938d2927-7eb0-c273-d4a2-6adacb09ecb8@ti.com>
 <0ad669ca-d9e5-bd46-74f3-13e01f7d6e37@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0ad669ca-d9e5-bd46-74f3-13e01f7d6e37@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Armin,

Could you please merge this backport to dunfell ASAP, as GitHub branch=20
renaming broke dunfell builds. Thanks a lot!

--=20
Denys


On Mon, Mar 15, 2021 at 08:48:04AM -0700, Khem Raj wrote:
> I think yes, this should help dunfell if backported.
>=20
> On 3/15/21 8:45 AM, Bajjuri, Praneeth wrote:
> >
> >
> >On 3/14/2021 8:14 PM, praneeth@ti.com wrote:
> >>From: Changqing Li <changqing.li@windriver.com>
> >
> >Have observed build errors like the below
> >
> >DEBUG: Mirror fetch failure for url
> >git://github.com/jthornber/thin-provisioning-tools;protocol=3Dhttps
> >(original url: git://github.com/jthornber/thin-provisioning-tools)
> >DEBUG: Fetcher failure: Unable to find revision
> >5e5409f48b5403d2c6dffd9919b35ad77d6fb7b4 in branch master even
> >from upstream
> >ERROR: Fetcher failure: Unable to find revision
> >5e5409f48b5403d2c6dffd9919b35ad77d6fb7b4 in branch master even
> >from upstream
> >ERROR: Fetcher failure for URL:
> >'git://github.com/jthornber/thin-provisioning-tools'. Unable to
> >fetch URL from any source.
> >
> >and looked like the switching branch to main was missing on dunfell br=
anch.
> >
> >Please advise if this is the right fix.
> >
> >
> >>
> >>Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >>Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>[cherry pick commit 260809cffdaad4fcd42b0977090f2c467a5474ef to dunfe=
ll]
> >>Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> >>---
> >>=A0 .../thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb=A0=A0=
=A0 | 2 +-
> >>=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-pro=
visioning-tools_0.8.5.bb b/meta-oe/recipes-support/thin-provisioning-tool=
s/thin-provisioning-tools_0.8.5.bb
> >>
> >>index 9f89bac22..3f82734ac 100644
> >>--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioni=
ng-tools_0.8.5.bb
> >>
> >>+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioni=
ng-tools_0.8.5.bb
> >>
> >>@@ -7,7 +7,7 @@ SECTION =3D "devel"
> >>=A0 LIC_FILES_CHKSUM =3D
> >>"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> >>=A0 S =3D "${WORKDIR}/git"
> >>-SRC_URI =3D "git://github.com/jthornber/thin-provisioning-tools \
> >>+SRC_URI =3D
> >>"git://github.com/jthornber/thin-provisioning-tools;branch=3Dmain
> >>\
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0001-do-not-strip-pdata_t=
ools-at-do_install.patch \
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://use-sh-on-path.patch \
> >>=A0 "
> >>
>=20

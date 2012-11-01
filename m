Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TTw0r-0004rb-VG
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 15:44:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA1EVHfS001654
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Nov 2012 07:31:17 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 1 Nov 2012 07:31:15 -0700
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 3EFA47FCE	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2012 10:30:58 -0400 (EDT)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	55F1B6A7921; Thu,  1 Nov 2012 10:31:14 -0400 (EDT)
Date: Thu, 1 Nov 2012 10:31:14 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121101143114.GF4673@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<1351009220-30119-4-git-send-email-morgan.little@windriver.com>
	<3989989.S5U52SNN0R@helios> <50920DAB.7070206@gmail.com>
MIME-Version: 1.0
In-Reply-To: <50920DAB.7070206@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Thu, 01 Nov 2012 14:44:55 -0000
X-Groupsio-MsgNum: 41402
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+ts6NCQ4mrNQIV8p"
Content-Disposition: inline

--+ts6NCQ4mrNQIV8p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] O=
n 12.11.01 (Thu 06:50) Martin Erts=E5s wrote:

> On 11/01/12 02:08, Paul Eggleton wrote:
> >On Tuesday 23 October 2012 12:20:20 Morgan Little wrote:
> >>-PACKAGES +=3D "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
> >...
> >>+PACKAGES +=3D "${PN}-date ${PN}-bin ${PN}-tickadj ${PN}-utils"
> >I'm not particularly happy with this change. Apart from the fact that it
> >wasn't mentioned in the commit message, it breaks any recipe that depend=
s upon
> >the previous ntpdate package. Could we go back to the old ntpdate name f=
or the
> >package or at the very least provide an RPROVIDES for the old name? I'm =
happy
> >to submit a patch to do this once there is agreement either way.
> >
> >Cheers,
> >Paul
> >
> I agree with you. Also find it kind of strange to change from
> ntpdate to ntp-date, as the universally known name of that module is
> ntpdate. Don't really see the rational of changing that to ntp-date
> in the recipe.

Agreed.  Though if there's a good reason to rename in ntp-date, that's
fine with me, so long as we go with Paul's suggestion of having an
RPROVIDES for ntpdate.  It's probably best to leave it as ntpdate,
though.

--=20
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind Ri=
ver
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283

--+ts6NCQ4mrNQIV8p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCSh7IACgkQPN8S4W6ZZncE5QCeNcVhMTrXI/ptqG1ST5P9RDu+
FZQAmwVuGw+UEtyILky7iluy4eirT3FI
=cPer
-----END PGP SIGNATURE-----

--+ts6NCQ4mrNQIV8p--

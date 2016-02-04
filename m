Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DA9E777351
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2016 18:11:46 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1aRONe-0003th-Hf from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2016 10:11:46 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2; Thu, 4 Feb 2016
	10:11:46 -0800
Received: by burninator (Postfix, from userid 1000)	id 6CE97580520; Thu,  4
	Feb 2016 13:11:45 -0500 (EST)
Date: Thu, 4 Feb 2016 13:11:45 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20160204181145.GA4778@mentor.com>
References: <1454598513-29263-1-git-send-email-mark.asselstine@windriver.com>
	<20160204160759.GA2573@jama>
	<CAPuovE+N45VRb-3hOM9gJYAmKkx_6Yp3ayMNcHeV_v+X77VUCQ@mail.gmail.com>
	<20160204170751.GB2573@jama>
MIME-Version: 1.0
In-Reply-To: <20160204170751.GB2573@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] ntp: remove empty libexecdir to prevent potential QA issues
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
X-List-Received-Date: Thu, 04 Feb 2016 18:11:47 -0000
X-Groupsio-MsgNum: 59844
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] ntp: remove empty libexecdir to prevent =
potential QA issues] On 16.02.04 (Thu 18:07) Martin Jansa wrote:

> On Thu, Feb 04, 2016 at 11:51:56AM -0500, Mark Asselstine wrote:
> > On Thu, Feb 4, 2016 at 11:07 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > > On Thu, Feb 04, 2016 at 10:08:33AM -0500, Mark Asselstine wrote:
> > >> Depending on the configuration used to build ntp it is possible to
> > >> have an empty libexecdir. This can cause QA issues. Add a test at the
> > >> end of install() to remove libexecdir if it is empty, thus avoiding
> > >> the possibility of QA issues, regardless of configuration.
> > >>
> > >> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > >> ---
> > >>  meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb | 3 +++
> > >>  1 file changed, 3 insertions(+)
> > >>
> > >> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb b/me=
ta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
> > >> index f9f900e..cb09e77 100644
> > >> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
> > >> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
> > >> @@ -94,6 +94,9 @@ do_install_append() {
> > >>
> > >>      install -d ${D}${systemd_unitdir}/ntp-units.d
> > >>      install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp=
-units.d/60-ntpd.list
> > >> +
> > >> +    # Remove an empty libexecdir.
> > >> +    [ ! "$(ls -A ${D}${libexecdir})" ] && rm -r ${D}${libexecdir}
> > >
> > > Isn't this the same as:
> > >
> > > rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
> > >
> > > ?
> >=20
> > It appears to be. rmdir is not a command I use often so I didn't look
> > to see if it was suitable for the job. Want me to resend with rmdir or
> > you care to make the swap prior to merging?
>=20
> Joe is maintainer of meta-networking, but I would prefer you to send v2.

Yeah, please do.

-J.

>=20
> > Mark
> >=20
> >=20
> > >
> > >>  }
> > >>
> > >>  PACKAGES +=3D "ntpdate sntp ${PN}-tickadj ${PN}-utils"
> > >> --
> > >> 2.1.4
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
-Joe MacDonald.
:wq

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWs5RdAAoJEEn8ffcsOfaWL+4H/RogdTkZsAc7z3ztClrSWtsS
7PCC8Ht0RJ5Q1n2CdT69BsOAwyVbw9/OuGyMq4Mrruw0v4rLTew/OVhGVh9sSgSg
b4EPlaLFJbKIA2/8fVfg2KJUzZt5/nLkfM6CvmtVMwW88I73UEZWipAQl+Sokd00
4hd/rViA/WdueHcqIrc5g5V9vg0qot/CLOOEjiJSFlvcff2ciURUc+JNku1TC+QO
eHkRTl+doiSurP5Cyfh5GV9nL76beZ5ncWziSs4O48iqOx/cL7S3VkMSzYsrIdOq
X2coQHrwgJKuO3ijk1EIZ0u1DBZwh/U47joTRk+EQZhedjpMl2nfnS0PixKrY9I=
=DLrM
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--

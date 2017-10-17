Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 087DF78302
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 17:23:28 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1e4VaT-0001sO-SG from Joe_MacDonald@mentor.com ;
	Tue, 17 Oct 2017 10:23:29 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 17 Oct 2017 10:23:29 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 1000)	id
	431C5581059; Tue, 17 Oct 2017 13:23:28 -0400 (EDT)
Date: Tue, 17 Oct 2017 13:23:28 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20171017172327.5aipmv2frrjsszbk@mentor.com>
References: <cover.1507147924.git.paul.eggleton@linux.intel.com>
	<4da0611806ae98b10f6ae00200b3e292a068f940.1507147924.git.paul.eggleton@linux.intel.com>
	<CAMKF1sp6TG-LrCUq-FMp+z_mR6Yh-CiRXT0tDvJXVsYr+97VPg@mail.gmail.com>
	<20171017051134.GC9221@denix.org>
	<CAMKF1sro2nuRcguZzsVOj5B2dNzw6P5KKrkK5dmuzpk_eX8e6g@mail.gmail.com>
	<CA+chaQeZpm=FAXVETU4x9scAECJ3EURrjjo54JhddHeDBzXWkg@mail.gmail.com>
	<CAMKF1sqfVVcvf6Hz9tPF7xobT-P64z16mbTQNQ9+t=-kSwo2-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqfVVcvf6Hz9tPF7xobT-P64z16mbTQNQ9+t=-kSwo2-A@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] mdns: move from meta-intel-iot-middleware
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
X-List-Received-Date: Tue, 17 Oct 2017 17:23:29 -0000
X-Groupsio-MsgNum: 69244
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="trqhn7lugpdkrp3f"
Content-Disposition: inline

--trqhn7lugpdkrp3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 1/1] mdns: move from meta-intel-iot-middl=
eware] On 17.10.17 (Tue 10:01) Khem Raj wrote:

> On Tue, Oct 17, 2017 at 9:58 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > I agree with Khem, I've merged oprofile even when it fails with musl,
> > because that was the main reason for moving it from oe-core to meta-oe,=
 but
> > we don't want to burden Khem with more new musl issues when they are
> > detected soon enough (my world builds don't use musl, so I depend on Kh=
em to
> > provide feedback when he can) .
> >
> > On Tue, Oct 17, 2017 at 6:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Mon, Oct 16, 2017 at 10:11 PM, Denys Dmytriyenko <denis@denix.org>
> >> wrote:
> >> > On Mon, Oct 16, 2017 at 09:19:25PM -0700, Khem Raj wrote:
> >> >> On Wed, Oct 4, 2017 at 1:20 PM, Paul Eggleton
> >> >> <paul.eggleton@linux.intel.com> wrote:
> >> >> > The following improvements have been made over the recipe that wa=
s in
> >> >> > meta-intel-iot-middleware (a layer which is no longer actively
> >> >> > maintained):
> >> >> >
> >> >> > * Upgrade to latest upstream version (765.50.9)
> >> >> > * Fix compilation failures by passing CC and LD
> >> >> > * Fix "no GNU hash in the ELF binary" issue
> >> >> > * Point S at the correct source subdirectory so that "make clean"
> >> >> > works
> >> >> > * Fix lack of soname on libdns_sd.so leading to missing RDEPENDS =
QA
> >> >> > error
> >> >> > * Add SUMMARY
> >> >> >
> >> >>
> >> >>
> >> >> This has been accepted into master but it fails to build with musl
> >> >
> >> > Is musl a requirement for meta-oe?
> >>
> >> We have fixed it to a point where we have around 10-12 recipes which
> >> don't compile
> >> with musl, and it would be better to keep this level as such and
> >> especially when we
> >> know its failing. its a requirement for oe-core
>=20
> I do world builds on master-next with musl on qemumips and rpi3
> continuously, with a known set of failures, if a new one shows up
> I tend to report.

I obviously haven't been building with musl either, but if it's not that
difficult to add to my autobuilder configuration, I'd be happy to.  Is
https://github.com/kraj/meta-musl/blob/master/README.md the best source
for how to get started with a musl build?

--=20
-Joe MacDonald.
:wq

--trqhn7lugpdkrp3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlnmPI8ACgkQSfx99yw5
9pYZXAf/f+Tf9xjN6w3/R3/dWpnaSBbdqouUcnXqipy9FJJ1psAct/6iaUGMJr4G
MPsHIFeUA2H3Hau2GTfOX1xNuE4BZRYuVWbjqwrw6AtPmcUc6IZLIkyjdyp4B3Rk
ME+4QQmaItQU0XMiWPsvhz8GujUy5Vu9FpKg4HjQxxMwNN1XOJRGqNy/s+60LcgS
AKo5TPymcIGNTCWR2DePY4PCOOFu614G9TXMgd5AQEBKqYH8urB2KtiAfqIpUiFP
FZHRIa40BSxHzda6kxqlWKOdUCVU+o1Ha1JgEiGiarVxaUK/A+P4c1a1IjUF7OER
j4F15Afd63di23WdCVF3y6shKJbJJg==
=KrKI
-----END PGP SIGNATURE-----

--trqhn7lugpdkrp3f--

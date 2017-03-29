Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42B7F6FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 12:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5302D18117;
	Wed, 29 Mar 2017 14:01:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id OB0Sxjht1LIF; Wed, 29 Mar 2017 14:01:20 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2498F18111;
	Wed, 29 Mar 2017 14:01:19 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B76601A092;
	Wed, 29 Mar 2017 14:01:19 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABF721A091;
	Wed, 29 Mar 2017 14:01:19 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 29 Mar 2017 14:01:19 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id A01631F39;
	Wed, 29 Mar 2017 14:01:19 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 29 Mar 2017 14:01:19 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 29 Mar 2017 14:01:19 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Wed, 29 Mar 2017 14:01:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Cody Piersall <cody@arrc.ou.edu>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-OE] Remove do_install_append() from zsh recipe.
Thread-Index: AQHSpLoY7eDvc8QLy0Gu7YiObf31x6GqcSQAgAAGawCAAUS4IA==
Date: Wed, 29 Mar 2017 12:01:19 +0000
Message-ID: <ee687593cd1147c4a8d76a304c4a874c@XBOX02.axis.com>
References: <1490372204-4336-1-git-send-email-cody@arrc.ou.edu>
	<CAJ86T=U6Xyrh2D4xYizX6Ly7b=6gg+Wxid1VkB60_0idG=RBwg@mail.gmail.com>
	<CAKEinFyVVOoy1FNpQKhAJKEPz9R53xsLUu7YBKeDHqzPzTemDA@mail.gmail.com>
In-Reply-To: <CAKEinFyVVOoy1FNpQKhAJKEPz9R53xsLUu7YBKeDHqzPzTemDA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-OE] Remove do_install_append() from zsh recipe.
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
X-List-Received-Date: Wed, 29 Mar 2017 12:01:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Cody Piersall
> Sent: den 28 mars 2017 20:30
> To: openembeded-devel
> Subject: Re: [oe] [meta-OE] Remove do_install_append() from zsh recipe.
>=20
> Hi Andre,
>=20
> Thanks for the response.
>=20
> On Tue, Mar 28, 2017 at 1:06 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > On Fri, Mar 24, 2017 at 9:16 AM, Cody Piersall <cody@arrc.ou.edu>
> wrote:
> >> do_install_append() removes a lot of useful functionality from the
> zsh
> shell.
> >
> > What exactly is this "useful functionality" ?
> >
> > Maybe it could be put in a separate package.
> The recipe currently in meta-oe removes a lot of features that make zsh
> a
> powerful shell.
> A lot of zsh's nice interactive functionality is provided by files that
> live in
> /usr/share/zsh:  things like typing "cd <TAB>" only completing on
> directories,
> integration/completion with git commands, completion for various unix
> utilities.  The big
> drawback is that it takes up 5.5M of disk space.  For my platform this
> isn't an issue, but
> it could be for other people.

It definitely sounds as it should be packaged in a separate package=20
then, e.g., ${PN}-extras.

> Unfortunately, the recipe I posted does not actually even work -- I
> posted
> before testing
> (I didn't set FILES correctly, and some things were expecting zsh to be
> in
> /bin instead of
> /usr/bin).  Sorry for wasting anyone's time if you tried it out.  I
> have a
> working/tested
> version now:
>=20
>=20
> diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
> b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
> index 39b2d95..1c06ef0 100644
> --- a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
> +++ b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
> @@ -34,6 +34,7 @@ EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> ALTERNATIVE_${PN} =3D "sh"
> ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
> +ALTERNATIVE_LINK_NAME[zsh] =3D "${base_bindir}/zsh"

That does not do anything since there is no zsh in=20
ALTERNATIVE_${PN}. And there should not be any need for it.

> ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/${BPN}"
> ALTERNATIVE_PRIORITY =3D "100"
> @@ -45,7 +46,10 @@ do_configure () {
> }
> do_install_append () {
> - rm -fr ${D}/usr/share
> + if ! [ -e ${D}/bin/zsh ]; then
> + mkdir -p ${D}/bin
> + ln -s ${bindir}/zsh ${D}/bin/zsh
> + fi
> }

Please rewrite as:

do_install_append() {
	if [ ! -e ${D}${base_bindir}/zsh ]; then
		mkdir -p ${D}${base_bindir}
		ln -s ${bindir}/zsh ${D}${base_bindir}/zsh
	fi
}

> pkg_postinst_${PN} () {
> @@ -59,3 +63,8 @@ FILES_${PN}-dbg +=3D "\
> ${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
> ${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
> "
> +
> +FILES_${PN} +=3D "\
> + ${datadir}/${PN} \
> + ${base_bindir}/zsh \

No need to add ${base_bindir}/zsh as FILES_${PN} contains ${base_bindir}/*=
=20
by default.

> +"
>=20
> Cody

//Peter



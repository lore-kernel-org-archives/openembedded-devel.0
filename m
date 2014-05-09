Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f180.google.com (unknown [209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 882C660196
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 22:24:43 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id p9so5743655lbv.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2014 15:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KU6KBOTCmRoAXZaM1jybhporBiwyv0OKpGDdKzaXFa4=;
	b=Z7ZpX2rQmlYwYw14Orw85p0bXmmKQjusxgsBLeiRxZVP1fjcfzI453bh9pYjtQpBNh
	H3uovodJUlyCZ1A7dE9ToPaKzVF+SdLcPxyXgRN8iKp5GwkdaOCTs1wg86X0w6dG7aY8
	C9rpiJ+ckYYLrl6q0rCR43LumMguBK+7F9RNOpGRz5uz1o5H0oS5VSGSTy4RG4NTH0bA
	mpb1FmIIX5bGp/Ej3QrTkMl6HkTAnMm0ttNQADbLFL99ThY5AgYB/vd370ByIsnxT7Ur
	RzGJQIca03hnwK8eUCkKljGxBsDX0Pw1nfM/3lfcYg1se5waTqT2N9rRVcgHm0Ep2dEL
	8FEg==
X-Received: by 10.152.4.201 with SMTP id m9mr11455lam.50.1399674283896;
	Fri, 09 May 2014 15:24:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o1sm5523698lbw.16.2014.05.09.15.24.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 May 2014 15:24:42 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 10 May 2014 00:25:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140509222506.GB22774@jama>
References: <1399401265-29167-1-git-send-email-donald.poole@swri.org>
	<1399401265-29167-2-git-send-email-donald.poole@swri.org>
	<20140509125043.GT30955@jama> <CF926D2A.3263%donald.poole@swri.org>
MIME-Version: 1.0
In-Reply-To: <CF926D2A.3263%donald.poole@swri.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Add install support for native builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 May 2014 22:24:46 -0000
X-Groupsio-MsgNum: 49821
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline

--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2014 at 04:36:22PM +0000, Poole Jr, Donald R. wrote:
> On 5/9/14, 7:50 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>=20
>=20
> >On Tue, May 06, 2014 at 01:34:24PM -0500, Donald R. Poole, Jr. wrote:
> >> From: "Donald R. Poole, Jr" <donald (dot) poole (at) swri (dot) org>
> >>=20
> >> Currently, if you are building native applications with Qt5, the
> >>current qmake5_base_do_install() method assumes an install into the
> >>image folder for the target. Since the native builds handle this a
> >>little differently, this patch should account for the native install
> >>scenario.
> >
> >Add SOB line.
>=20
> I=B9m not familiar with the acronym SOB (I=B9m still learning about this
> process). Is that State of Bitbake? If so, what does State of Bitbake mea=
n?

Signed-off-by

>=20
> >
> >> ---
> >>  classes/qmake5.bbclass      |    8 ++++++--
> >>  classes/qmake5_base.bbclass |   46
> >>+++++++++++++++++++++----------------------
> >>  2 files changed, 29 insertions(+), 25 deletions(-)
> >>=20
> >> diff --git a/classes/qmake5.bbclass b/classes/qmake5.bbclass
> >> index e1dda0d..01454f3 100644
> >> --- a/classes/qmake5.bbclass
> >> +++ b/classes/qmake5.bbclass
> >> @@ -19,6 +19,10 @@ do_configure() {
> >>      qmake5_base_do_configure
> >>  }
> >> =20
> >> -do_install() {
> >> -    qmake5_base_do_install
> >> +do_install_class-target() {
> >> +    qmake5_base_do_install_target
> >> +}
> >> +
> >> +do_install_class-native() {
> >> +    qmake5_base_do_install_native
> >>  }
> >> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> >> index df8a59a..5a380d0 100644
> >> --- a/classes/qmake5_base.bbclass
> >> +++ b/classes/qmake5_base.bbclass
> >> @@ -161,32 +161,32 @@ qmake5_base_do_configure () {
> >>      ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT}
> >>-r $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die
> >>"Error calling $CMD"
> >>  }
> >> =20
> >> -qmake5_base_do_install() {
> >> +qmake5_base_do_install_target() {
> >>      # Fix install paths for all
> >> -    if [ "${BUILD_SYS}" =3D "${HOST_SYS}" ] ; then
> >> -        find -name "Makefile*" | xargs sed -i
> >>"s,(INSTALL_ROOT),(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
> >> -    else
> >> -        find -name "Makefile*" | xargs sed -i
> >>"s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
> >> -    fi
> >> +    find -name "Makefile*" | xargs sed -i
> >>"s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
> >
> >This looks like incremental patch from your v1, please rebase and send
> >v3.
>=20
> Will do.
>=20
> >
> >> =20
> >>      oe_runmake install INSTALL_ROOT=3D${D}
> >> =20
> >> -    # Only do this for target builds. Native install work a little
> >>differently
> >> -    if [ "${BUILD_SYS}" !=3D "${HOST_SYS}" ] ; then
> >> -        # everything except HostData and HostBinaries is prefixed with
> >>sysroot value,
> >> -        # but we cannot remove sysroot override, because that's useful
> >>for pkg-config etc
> >> -        # In some cases like QtQmlDevTools in qtdeclarative, the sed
> >>above does not work,
> >> -        # fix them manually
> >> -        if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n
> >>"${STAGING_DIR_TARGET}" ] ; then
> >> -            echo "Some files are installed in wrong directory
> >>${D}${STAGING_DIR_TARGET}"
> >> -            cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
> >> -            rm -rf ${D}${STAGING_DIR_TARGET}
> >> -            # remove empty dirs
> >> -            TMP=3D`dirname ${D}/${STAGING_DIR_TARGET}`
> >> -            while test ${TMP} !=3D ${D}; do
> >> -                rmdir ${TMP}
> >> -                TMP=3D`dirname ${TMP}`;
> >> -            done
> >> -        fi
> >> +    # everything except HostData and HostBinaries is prefixed with
> >>sysroot value,
> >> +    # but we cannot remove sysroot override, because that's useful for
> >>pkg-config etc
> >> +    # In some cases like QtQmlDevTools in qtdeclarative, the sed above
> >>does not work,
> >> +    # fix them manually
> >> +    if [ -d ${D}${STAGING_DIR_TARGET} ] ; then
> >> +        echo "Some files are installed in wrong directory
> >>${D}${STAGING_DIR_TARGET}"
> >> +        cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
> >> +        rm -rf ${D}${STAGING_DIR_TARGET}
> >> +        # remove empty dirs
> >> +        TMP=3D`dirname ${D}/${STAGING_DIR_TARGET}`
> >> +        while test ${TMP} !=3D ${D}; do
> >> +            rmdir ${TMP}
> >> +            TMP=3D`dirname ${TMP}`;
> >> +        done
> >>      fi
> >>  }
> >> +
> >> +qmake5_base_do_install_native() {
> >
> >Why don't you use
> >
> >qmake5_base_do_install_class-native() {
> >
> >here and leave qmake5.bbclass and qmake5_base_do_install as it is?
>=20
> The reason I didn=B9t use qmake5_base_do_install_class-native() is because
> the system couldn=B9t find the native/target overrides in the
> qmake5_base.bbclass. So, I put them in the qmake5.bbclass.
>=20
> >
> >> +    # Fix install paths for all
> >> +    find -name "Makefile*" | xargs sed -i
> >>"s,(INSTALL_ROOT),(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
> >> +
> >> +    oe_runmake install INSTALL_ROOT=3D${D}
> >> +}
> >> --=20
> >> 1.7.9.5
> >>=20
> >> --=20
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >--=20
> >Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> Donald R. Poole, Jr.
> Research Engineer
> Voice: 210.522.3131 | Fax: 210.522.4931
> Tactical Networks & Communications (tacticalnetworks.swri.org)
> Southwest Research Institute (SwRI)
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNtVcIACgkQN1Ujt2V2gBzY3gCfZvGnNBNEzoQM7hZYH/eDbDME
iWoAn0YnvzOOKwKrrH6PhSD1Zw48Pv/S
=rSi+
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--

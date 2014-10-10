Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5A10871853
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 10:42:43 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so1576544wiv.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 03:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+dt55mbOKNsE9rsjadNYQzm4YA6bZ5zj5NB767HCsU0=;
	b=0NWv4bPGAoWphldAVeVGQJ9Q7BNviLVmpIgI9+YrEaYzMfOmKeuYac/C8KW3fBEmDs
	59KpB4gXKoCn24LVvgHG/KOTCzc/yYI6gUnNZI6XdZo/cHz8CAqrHUDX3n9x6oKtdkyr
	o2Mtdd9+E5SKH6s+qr+56wkJV5qbP0LqyoYgkAkrHHqV1g+wlydt/UKXq0WyWm0Bk1tK
	Wt3LzCJbBG0z2aMP05E3BbLEpdO1Yp5PXX0jMg4WvkgT0FVSHTy4zZQ34dAIpjX22YmL
	/mx5f7lp9jMaLrZI5MfyE+lbPyeSlYDz3fNvb518HrKtxXDDEz8e4PNIWbJHai6dz8rQ
	QLsw==
X-Received: by 10.180.10.9 with SMTP id e9mr3867545wib.74.1412937764756;
	Fri, 10 Oct 2014 03:42:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lk6sm6564643wjb.26.2014.10.10.03.42.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Oct 2014 03:42:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Oct 2014 12:43:50 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141010104350.GM12322@jama>
References: <5436C3C0.4040904@urbanec.net>
MIME-Version: 1.0
In-Reply-To: <5436C3C0.4040904@urbanec.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] Better support for upgrading packages in opkg and update-rc.d.bbclass
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
X-List-Received-Date: Fri, 10 Oct 2014 10:42:46 -0000
X-Groupsio-MsgNum: 52428
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5V5c01chtBAiSHoy"
Content-Disposition: inline

--5V5c01chtBAiSHoy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2014 at 04:20:00AM +1100, Peter Urbanec wrote:
> init-ifupdown inherits default implementations of prerm, postrm, preinst
> and postinst from update-rc.d.bbclass. Unfortunately these default
> implementations don't deal with package upgrades as well as they could.
>=20
> What ends up happening is that opkg starts downloading and unpacking
> packages sequentially. As it downloads and unpacks each package, opkg
> calls prerm, preinst and postrm hook scripts. Once all packages are
> unpacked, the postinst script is finally called for all packages as part
> of the "configure" stage.
>=20
> The default prerm and preinst scripts stop networking. Networking is not
> brought back up again until postinst is called, but that only happens
> after all the packages have been downloaded, unpacked and installed. This
> leaves a window where any package that needs to be downloaded after
> init-ifupdown is encountered will fail.
>=20
> This fixes the problem by enhancing opkg to also provide the "upgrade"
> argument to prerm and postrm, to (partially) match what dpkg does. See
> https://wiki.debian.org/MaintainerScripts for dpkg diagrams that clarify
> the intended process. opkg lacks the full functionality of dpkg, but for
> the purpose of this exercise, they are similar enough.
>=20
> I have submitted a patch to the opkg-devel list to include the "upgrade"
> argument.
>=20
> The second part of the solution is an update to the default implementatio=
ns
> of the pre- and post- scripts provided by update-rc.d.bbclass. The scripts
> are now careful to remove themselves using the old package context and to
> delay the restart of a service until the configure stage called from the
> postinst script.

Wrong ML -> oe-core

>=20
> ---
>  meta/classes/update-rc.d.bbclass                   | 75 +++++++++++++---=
------
>  .../opkg/upgrade-argument-for-pre_postrm.patch     | 30 +++++++++
>  meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
>  3 files changed, 77 insertions(+), 29 deletions(-)
>  create mode 100644 meta/recipes-devtools/opkg/opkg/upgrade-argument-for-=
pre_postrm.patch
>=20
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.=
bbclass
> index bc1aa7d..c29457f 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -14,45 +14,62 @@ INITSCRIPT_PARAMS ?=3D "defaults"
>   INIT_D_DIR =3D "${sysconfdir}/init.d"
>  -updatercd_preinst() {
> -if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
> -	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> +# During an upgrade, the pre/postrm scripts from old package are called
> +# and the pre/postinst scripts called are from the new package.
> +# See https://wiki.debian.org/MaintainerScripts for dpkg diagrams.
> +# opkg uses a subset, which lacks most of the error handling.
> +
> +# Old package context, step 1
> +updatercd_prerm() {
> +if [ "x$1" !=3D "xupgrade" ] ; then
> +  ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
>  fi
> -if type update-rc.d >/dev/null 2>/dev/null; then
> -	if [ -n "$D" ]; then
> -		OPT=3D"-f -r $D"
> -	else
> -		OPT=3D"-f"
> -	fi
> -	update-rc.d $OPT ${INITSCRIPT_NAME} remove
> +if [ -z "$D" ]; then
> +  OPT=3D""
> +else
> +  OPT=3D"-r $D"
>  fi
> -}
> -
> -updatercd_postinst() {
>  if type update-rc.d >/dev/null 2>/dev/null; then
> -	if [ -n "$D" ]; then
> -		OPT=3D"-r $D"
> -	else
> -		OPT=3D"-s"
> -	fi
> -	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
> +  update-rc.d $OPT ${INITSCRIPT_NAME} remove
>  fi
>  }
>  -updatercd_prerm() {
> -if [ -z "$D" ]; then
> -	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> -fi
> +# New package context, step 2
> +updatercd_preinst() {
> +case "$1" in
> +  upgrade)
> +    ;;
> +  *)
> +    ;;
> +esac
>  }
>  +# Old package context, step 3
>  updatercd_postrm() {
> +case "$1" in
> +  upgrade)
> +    ;;
> +  *)
> +    ;;
> +esac
> +}
> +
> +# N.B. Step 4 runs after all packages have been through steps 1-3 and th=
erefore we
> +#      need to delay service restarts during upgrade until here. Otherwi=
se we end
> +#      up with situations, like networking going down in the middle of "=
opkg upgrade",
> +#      thus resulting in failures to fetch further packages.
> +
> +# New package context, step 4
> +updatercd_postinst() {
>  if type update-rc.d >/dev/null 2>/dev/null; then
> -	if [ -n "$D" ]; then
> -		OPT=3D"-r $D"
> -	else
> -		OPT=3D""
> -	fi
> -	update-rc.d $OPT ${INITSCRIPT_NAME} remove
> +  if [ -n "$D" ]; then
> +    OPT=3D"-r $D"
> +  else
> +    # This will catch the upgrade case and result in a restart.
> +    ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> +    OPT=3D"-s"
> +  fi
> +  update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
>  fi
>  }
>  diff --git a/meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_po=
strm.patch b/meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_postr=
m.patch
> new file mode 100644
> index 0000000..5bea82a
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_postrm.pat=
ch
> @@ -0,0 +1,30 @@
> +From: Peter Urbanec
> +Subject: [opkg] Use "upgrade" argument in prerm and postrm scripts
> +
> +Current implementation of opkg makes it difficult to distinguish between
> +package removal or upgrade in prerm and postrm scripts. The following pa=
tch
> +will make it easier and is close(r) to what dpkg does.
> +
> +diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
> +index 07401b2..52454f8 100644
> +--- a/libopkg/opkg_remove.c
> ++++ b/libopkg/opkg_remove.c
> +@@ -292,7 +292,7 @@ opkg_remove_pkg(pkg_t *pkg, int from_upgrade)
> +      pkg->state_want =3D SW_DEINSTALL;
> +      opkg_state_changed++;
> + +-     if (pkg_run_script(pkg, "prerm", "remove") !=3D 0) {
> ++     if (pkg_run_script(pkg, "prerm", from_upgrade ? "upgrade" : "remov=
e") !=3D 0) {
> +          if (!conf->force_remove) {
> +              opkg_msg(ERROR, "not removing package \"%s\", "
> +                              "prerm script failed\n", pkg->name);
> +@@ -310,7 +310,7 @@ opkg_remove_pkg(pkg_t *pkg, int from_upgrade)
> +        feel free to fix this. */
> +      remove_data_files_and_list(pkg);
> +
> +-     err =3D pkg_run_script(pkg, "postrm", "remove");
> ++     err =3D pkg_run_script(pkg, "postrm", from_upgrade ? "upgrade" : "=
remove");
> +
> +      remove_maintainer_scripts(pkg);
> +      pkg->state_status =3D SS_NOT_INSTALLED;
> + diff --git a/meta/recipes-devtools/opkg/opkg_0.2.2.bb b/meta/recipes-de=
vtools/opkg/opkg_0.2.2.bb
> index 3dd7489..9c0045e 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.2.2.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
> @@ -4,6 +4,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases/$=
{BPN}/${BPN}-${PV}.tar.gz
>             file://no-install-recommends.patch \
>             file://add-exclude.patch \
>             file://opkg-configure.service \
> +           file://upgrade-argument-for-pre_postrm.patch \
>  "
>   S =3D "${WORKDIR}/${BPN}-${PV}"
> --=20
> 2.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5V5c01chtBAiSHoy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ3uGYACgkQN1Ujt2V2gBxMgACbB0jOnmYwsEd8iJtoVf0WcdKZ
/pkAn0ZY6BZYILFHvYlVahToAHCJB1yb
=SKUt
-----END PGP SIGNATURE-----

--5V5c01chtBAiSHoy--

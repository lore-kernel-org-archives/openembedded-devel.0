Return-Path: <joe@deserted.net>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id D02596F7A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 14:31:49 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so2642486iec.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 07:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=5PTO9BN/ch5JTFv0nyCPE720Z2Nss35NTy4L0K5Ec7c=;
	b=PzADP9y2en+Qn+msNANh1fbfi2x9Ja5+K6xd5noredvNOLOBDxVr9+8HMtGQIBbkeY
	i/++4AMq+0N+wVxT8AX9Ld0p+jNNZuQvNrKY/leUv8xab2bKVJ8bme1wBQzpi87R2NRx
	CacTk9RcgWQcGyUOPIDQOUCm1TkJnu85Hmu8zcDyLJV/RFJHLLdvYpzVQwOjwwQvmKxY
	B3156bgHkeq3K0tuchMUe6ckeEd8NWy7FCF6ygt8Jtq5tvdRugq4lBXLQQW40/jVMBnJ
	aDvZqebhI/NTiVBtTfibBOVCJaqwE6GFAcb8onKCyetnpSfNRchqNGH703FNKHzhxv+W
	dCXQ==
X-Gm-Message-State: ALoCoQlxcSMI6i7MuyYz1X+76ObRFfSLXRl/KVH/EpcVy0xnuAHq9hXjSqlrmUjGjXWz8lNMKhwF
X-Received: by 10.42.39.6 with SMTP id f6mr1367311ice.83.1394807510370;
	Fri, 14 Mar 2014 07:31:50 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	kb5sm19832438igb.1.2014.03.14.07.31.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 14 Mar 2014 07:31:49 -0700 (PDT)
Date: Fri, 14 Mar 2014 10:31:46 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140314143145.GF8326@deserted.net>
References: <1393915122-28181-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1393915122-28181-1-git-send-email-jackie.huang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH v2] strongswan: update verion to 5.1.1
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
X-List-Received-Date: Fri, 14 Mar 2014 14:31:50 -0000
X-Groupsio-MsgNum: 48672
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7mxbaLlpDEyR1+x6"
Content-Disposition: inline

--7mxbaLlpDEyR1+x6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I think this is what we were looking for.  Merged, thanks.

-J.

[[oe] [meta-networking][PATCH v2] strongswan: update verion to 5.1.1] On 14=
=2E03.04 (Tue 14:38) jackie.huang@windriver.com wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> * Add a patch to fix the function parameter.
> * Add PACKAGECONFIG for optional packages instead of explicitly
>   disable, and set sqlite and curl as default.
> * Remove the split package strongswan-plugins.
> * Add configure option --without-lib-prefix so it doesn't
>   search for libraries in includedir and libdir to avoid QA error.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../strongswan/files/fix-funtion-parameter.patch   |   98 ++++++++++++++=
++++++
>  .../recipes-support/strongswan/strongswan_5.0.0.bb |   36 -------
>  .../recipes-support/strongswan/strongswan_5.1.1.bb |   45 +++++++++
>  3 files changed, 143 insertions(+), 36 deletions(-)
>  create mode 100644 meta-networking/recipes-support/strongswan/files/fix-=
funtion-parameter.patch
>  delete mode 100644 meta-networking/recipes-support/strongswan/strongswan=
_5.0.0.bb
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
_5.1.1.bb
>=20
> diff --git a/meta-networking/recipes-support/strongswan/files/fix-funtion=
-parameter.patch b/meta-networking/recipes-support/strongswan/files/fix-fun=
tion-parameter.patch
> new file mode 100644
> index 0000000..da96983
> --- /dev/null
> +++ b/meta-networking/recipes-support/strongswan/files/fix-funtion-parame=
ter.patch
> @@ -0,0 +1,98 @@
> +fix the function parameter
> +
> +Upstream-Status: pending
> +
> +Original openssl_diffie_hellman_create has three parameters, but
> +it is reassigned a function pointer which has one parameter, and
> +is called with one parameter, which will lead to segment fault
> +on PPC, Now we simply correct the number of parameters.
> +
> +    #0  0x484d4aa0 in __GI_raise (sig=3D6)
> +         at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
> +    #1  0x484d9930 in __GI_abort () at abort.c:91
> +    #2  0x10002064 in segv_handler (signal=3D11) at charon.c:224
> +    #3  <signal handler called>
> +    #4  0x48d89630 in openssl_diffie_hellman_create (group=3DMODP_1024_B=
IT, g=3D...,
> +         p=3D<error reading variable: Cannot access memory at address 0x=
0>)
> +         at openssl_diffie_hellman.c:143
> +    #5  0x482c54f8 in create_dh (this=3D0x11ac6e68, group=3DMODP_1024_BI=
T)
> +         at crypto/crypto_factory.c:358
> +    #6  0x48375884 in create_dh (this=3D<optimized out>, group=3D<optimi=
zed out>)
> +         at sa/keymat.c:132
> +    #7  0x483843b8 in process_payloads (this=3D0x51400a78, message=3D<op=
timized
> +    out>)
> +         at sa/tasks/ike_init.c:200
> +    #8  0x483844d0 in process_r (this=3D0x51400a78, message=3D0x51500778)
> +         at sa/tasks/ike_init.c:319
> +    #9  0x48374c9c in process_request (message=3D0x51500778, this=3D0x51=
400d20)
> +         at sa/task_manager.c:870
> +    #10 process_message (this=3D0x51400d20, msg=3D0x51500778) at
> +    sa/task_manager.c:925
> +    #11 0x4836c378 in process_message (this=3D0x514005f0, message=3D0x51=
500778)
> +         at sa/ike_sa.c:1317
> +    #12 0x48362270 in execute (this=3D0x515008d0)
> +         at processing/jobs/process_message_job.c:74=20
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c | 8 +++++++-
> + src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h | 4 +++-
> + src/libstrongswan/plugins/openssl/openssl_plugin.c         | 1 +
> + 3 files changed, 11 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c =
b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
> +index ff33824..bd21446 100644
> +--- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
> ++++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
> +@@ -142,7 +142,7 @@ METHOD(diffie_hellman_t, destroy, void,
> + /*
> +  * Described in header.
> +  */
> +-openssl_diffie_hellman_t *openssl_diffie_hellman_create(
> ++openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
> + 							diffie_hellman_group_t group, chunk_t g, chunk_t p)
> + {
> + 	private_openssl_diffie_hellman_t *this;
> +@@ -197,5 +197,11 @@ openssl_diffie_hellman_t *openssl_diffie_hellman_cr=
eate(
> +=20
> + 	return &this->public;
> + }
> ++openssl_diffie_hellman_t *openssl_diffie_hellman_create( diffie_hellman=
_group_t group)
> ++{
> ++	chunk_t g;
> ++	chunk_t p;
> ++	openssl_diffie_hellman_create_custom(group, g, p);
> ++}
> +=20
> + #endif /* OPENSSL_NO_DH */
> +diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h =
b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
> +index 53dc59c..eb69eaa 100644
> +--- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
> ++++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
> +@@ -44,8 +44,10 @@ struct openssl_diffie_hellman_t {
> +  * @param p				custom prime, if MODP_CUSTOM
> +  * @return				openssl_diffie_hellman_t object, NULL if not supported
> +  */
> +-openssl_diffie_hellman_t *openssl_diffie_hellman_create(
> ++openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
> + 							diffie_hellman_group_t group, chunk_t g, chunk_t p);
> ++openssl_diffie_hellman_t *openssl_diffie_hellman_create(
> ++							diffie_hellman_group_t group);
> +=20
> + #endif /** OPENSSL_DIFFIE_HELLMAN_H_ @}*/
> +=20
> +diff --git a/src/libstrongswan/plugins/openssl/openssl_plugin.c b/src/li=
bstrongswan/plugins/openssl/openssl_plugin.c
> +index ff25086..c76873d 100644
> +--- a/src/libstrongswan/plugins/openssl/openssl_plugin.c
> ++++ b/src/libstrongswan/plugins/openssl/openssl_plugin.c
> +@@ -388,6 +388,7 @@ METHOD(plugin_t, get_features, int,
> + 			PLUGIN_PROVIDE(DH, MODP_1024_BIT),
> + 			PLUGIN_PROVIDE(DH, MODP_1024_160),
> + 			PLUGIN_PROVIDE(DH, MODP_768_BIT),
> ++		PLUGIN_REGISTER(DH, openssl_diffie_hellman_create_custom),
> + 			PLUGIN_PROVIDE(DH, MODP_CUSTOM),
> + #endif
> + #ifndef OPENSSL_NO_RSA
> +--=20
> +1.8.3
> +
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.0.0.=
bb b/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
> deleted file mode 100644
> index eb49494..0000000
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -DESCRIPTION =3D "strongSwan is an OpenSource IPsec implementation for th=
e \
> -Linux operating system."
> -HOMEPAGE =3D "http://www.strongswan.org"
> -SECTION =3D "console/network"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> -DEPENDS =3D "gmp openssl flex-native flex bison-native"
> -PR =3D "r5"
> -
> -SRC_URI =3D "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "c8b861305def7c0abae04f7bbefec212"
> -SRC_URI[sha256sum] =3D "efc13c86e715b5e596d9d8535640c830f83e977fe521afd2=
c70d68926c4b573e"
> -
> -EXTRA_OECONF =3D "--disable-curl --disable-soup --disable-ldap \
> -        --enable-gmp --disable-mysql --disable-sqlite \
> -        --enable-openssl"
> -
> -EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', '--wit=
h-systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-systemdsys=
temunitdir', d)}"
> -
> -inherit autotools systemd
> -
> -RRECOMMENDS_${PN} =3D "kernel-module-ipsec"
> -
> -PACKAGES +=3D "${PN}-plugins"
> -FILES_${PN} +=3D "${libdir}/ipsec/lib*${SOLIBS}"
> -FILES_${PN}-dev +=3D "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*=
=2Ela"
> -FILES_${PN}-staticdev +=3D "${libdir}/ipsec/*.a"
> -FILES_${PN}-dbg +=3D "${libdir}/ipsec/.debug ${libdir}/ipsec/plugins/.de=
bug ${libexecdir}/ipsec/.debug"
> -FILES_${PN}-plugins +=3D "${libdir}/ipsec/plugins/*"
> -
> -INSANE_SKIP_${PN}-plugins =3D "staticdev"
> -
> -RPROVIDES_${PN} +=3D "${PN}-systemd"
> -RREPLACES_${PN} +=3D "${PN}-systemd"
> -RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "${PN}.service"
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.=
bb b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
> new file mode 100644
> index 0000000..a2a2333
> --- /dev/null
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
> @@ -0,0 +1,45 @@
> +DESCRIPTION =3D "strongSwan is an OpenSource IPsec implementation for th=
e \
> +Linux operating system."
> +SUMMARY =3D "strongSwan is an OpenSource IPsec implementation"
> +HOMEPAGE =3D "http://www.strongswan.org"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +DEPENDS =3D "gmp openssl flex-native flex bison-native"
> +
> +SRC_URI =3D "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
> +        file://fix-funtion-parameter.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "e3af3d493d22286be3cd794533a8966a"
> +SRC_URI[sha256sum] =3D "fbf2a668221fc4a36a34bdeac2dfeda25b96f572d551df02=
2585177953622406"
> +
> +EXTRA_OECONF =3D "--enable-gmp \
> +        --enable-openssl \
> +        --without-lib-prefix \
> +"
> +
> +EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', '--wit=
h-systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-systemdsys=
temunitdir', d)}"
> +
> +PACKAGECONFIG ??=3D "sqlite3 curl \
> +        ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
> +"
> +PACKAGECONFIG[sqlite3] =3D "--enable-sqlite,--disable-sqlite,sqlite3,"
> +PACKAGECONFIG[ldap] =3D "--enable-ldap,--disable-ldap,openldap,"
> +PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl,"
> +PACKAGECONFIG[soup] =3D "--enable-soup,--disable-soup,libsoup-2.4,"
> +PACKAGECONFIG[mysql] =3D "--enable-mysql,--disable-mysql,mysql5,"
> +
> +inherit autotools systemd
> +
> +RRECOMMENDS_${PN} =3D "kernel-module-ipsec"
> +
> +FILES_${PN} +=3D "${libdir}/ipsec/lib*${SOLIBS} ${libdir}/ipsec/plugins/=
*.so"
> +FILES_${PN}-dbg +=3D "${libdir}/ipsec/.debug ${libdir}/ipsec/plugins/.de=
bug ${libexecdir}/ipsec/.debug"
> +FILES_${PN}-dev +=3D "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*=
=2Ela ${libdir}/ipsec/plugins/*.la"
> +FILES_${PN}-staticdev +=3D "${libdir}/ipsec/*.a ${libdir}/ipsec/plugins/=
*.a"
> +
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +RREPLACES_${PN} +=3D "${PN}-systemd"
> +RCONFLICTS_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "${BPN}.service"
--=20
-Joe MacDonald.
:wq

--7mxbaLlpDEyR1+x6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlMjEtEACgkQwFvcllog0XyWlQCfWYn18jTgHvbXX96sDMzD7n8J
4l8AnRISMbYClekSvLOSqiKJTXVYpAiV
=KUDa
-----END PGP SIGNATURE-----

--7mxbaLlpDEyR1+x6--

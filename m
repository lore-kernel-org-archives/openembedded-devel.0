Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 45DEF60670
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 01:07:17 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id e65so53410280pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 17:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=wHxfJSX9w5AiHARsfLWtyxoWiEmShGDXDVFRJTbwDoE=;
	b=KiHLP5uFg8P6cr4se6QK8msrOCpwPse7PAncOtZRESTJWazD100DmTDtm8f8EjfFxt
	E/wjzuzlxdfXAlt59bhW+6yMVjyYnlcZ/XflRCwbxeug8srxlWgC/OKXpgBEWk1m6nxP
	LQeU3JeJAZabNAdoAtoum5djwVNifeqwThFqHhgzgzRBLakO9qQyOcj8wUVgxCwQZKqp
	Jg4W3ISEWXlHomV98K319fNDcJvab6lxHN44DpmtFXgvrKaBu6dwk4i9CS3MBKB44lzB
	VkqFUFulmMcDxBYDAWVlYlTkvDZEMjUc0F5MehB2tDWx4gusiChyC1gk86wmaq9sDsO+
	w7EA==
X-Received: by 10.98.68.132 with SMTP id m4mr30446025pfi.79.1452560838888;
	Mon, 11 Jan 2016 17:07:18 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	y18sm25849217pfi.84.2016.01.11.17.07.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 17:07:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452072833-9938-1-git-send-email-daicy.fnst@cn.fujitsu.com>
Date: Mon, 11 Jan 2016 17:07:12 -0800
Message-Id: <97A0EB4C-8F32-46BB-8659-B57316C6E54F@gmail.com>
References: <1452072833-9938-1-git-send-email-daicy.fnst@cn.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-oe][PATCH] syslog-ng: 3.5.4.1 -> 3.6.4
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
X-List-Received-Date: Tue, 12 Jan 2016 01:07:19 -0000
X-Groupsio-MsgNum: 59474
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D4E652CE-3B5E-4AFB-9F87-FA80FDBACEA6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D4E652CE-3B5E-4AFB-9F87-FA80FDBACEA6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 6, 2016, at 1:33 AM, Dai Caiyun <daicy.fnst@cn.fujitsu.com> =
wrote:
>=20
> Upgrade syslog-ng from 3.5.4.1 to 3.6.4.
>=20
> 1) Modify the syslog-ng.service-the-syslog-ng-service.patch,since the =
datas has been changed.
> 2) Delete these patches,since they are not needed any more.
>    afsql-afsql_dd_insert_db-refactor.patch
>    deinit-the-new-config-when-reverting-to-the.patch
>    free-global-LogTemplateOptions.patch
>    still-free-the-unconsumed-item.patch
>    syslog-ng-verify-the-list-before-del.patch
>    rewrite-expr-grammar.ym-Free-up-token.patch
>    logwriter-dont-allocate-a-new-buffer.patch
> 3) Fix WARNING:
>    QA Issue: syslog-ng-libs rdepends on libpcre, but it isn't a build =
dependency? [build-deps]
>    QA Issue: syslog-ng rdepends on libpcre, but it isn't a build =
dependency? [build-deps]
> 4) Fix ERROR: QA Issue: non -staticdev package contains static .a =
library:
>    =
work/i586-poky-linux/syslog-ng/3.6.4-r0/packages-split/syslog-ng/usr/lib/s=
yslog-ng/libtest/libsyslog-ng-test.a' [staticdev]
>=20
> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> ---
> .../files/syslog-ng.service-the-syslog-ng-service.patch       |  3 +--
> meta-oe/recipes-support/syslog-ng/syslog-ng.inc               |  3 ++-
> .../syslog-ng/{syslog-ng_3.5.4.1.bb =3D> syslog-ng_3.6.4.bb}    | 11 =
++---------
> 3 files changed, 5 insertions(+), 12 deletions(-)
> rename meta-oe/recipes-support/syslog-ng/{syslog-ng_3.5.4.1.bb =3D> =
syslog-ng_3.6.4.bb} (44%)
>=20
> diff --git =
a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-=
service.patch =
b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-=
service.patch
> index 90d3ef2..650b663 100644
> --- =
a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-=
service.patch
> +++ =
b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-=
service.patch
> @@ -15,12 +15,11 @@ diff --git a/contrib/systemd/syslog-ng.service =
b/contrib/systemd/syslog-ng.servi
> index fc16f8d..8e09deb 100644
> --- a/contrib/systemd/syslog-ng.service
> +++ b/contrib/systemd/syslog-ng.service
> -@@ -3,9 +3,8 @@ Description=3DSystem Logger Daemon
> +@@ -3,8 +3,7 @@ Description=3DSystem Logger Daemon
>  Documentation=3Dman:syslog-ng(8)
>=20
>  [Service]
> -Type=3Dnotify
> - Sockets=3Dsyslog.socket
> -ExecStart=3D/usr/sbin/syslog-ng -F
> +ExecStart=3D/usr/sbin/syslog-ng -F -p /var/run/syslogd.pid

may be use @var@ and replace it with ${localstatedir} during do_install


>  ExecReload=3D/bin/kill -HUP $MAINPID
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc =
b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index 54f6920..f8db897 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -80,8 +80,9 @@ PACKAGES =3D+ "${PN}-libs ${PN}-libs-dev =
${PN}-libs-dbg"
> FILES_${PN}-libs =3D "${libdir}/${BPN}/*.so =
${libdir}/libsyslog-ng-*.so*"
> FILES_${PN}-libs-dev =3D "${libdir}/${BPN}/lib*.la"
> FILES_${PN}-libs-dbg =3D "${libdir}/${BPN}/.debug"
> +FILES_${PN}-staticdev =3D "${libdir}/${BPN}/libtest/*.a"
> INSANE_SKIP_${PN}-libs =3D "dev-so"
> -RDEPENDS_${PN} +=3D "${PN}-libs"
> +RDEPENDS_${PN} +=3D "${PN}-libs libpcre=E2=80=9D
>=20

Actually the error is not about missing runtime dependency, it has =
already computed that.
the error is about missing build time dependency which provides this =
runtime dependency,
so you need

DEPENDS +=3D =E2=80=9Clibpcre"


> CONFFILES_${PN} =3D "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
>=20
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb =
b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> similarity index 44%
> rename from meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
> rename to meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> index e8940c0..73609af 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> @@ -1,22 +1,15 @@
> require syslog-ng.inc
>=20
> SRC_URI +=3D " \
> -    file://afsql-afsql_dd_insert_db-refactor.patch \
> -    file://deinit-the-new-config-when-reverting-to-the.patch \
>     file://fix-a-memory-leak-in-log_driver_free.patch \
>     file://fix-config-libnet.patch \
>     file://fix-invalid-ownership.patch \
>     file://Fix-the-memory-leak-problem-for-mutex.patch \
>     file://Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch =
\
> -    file://free-global-LogTemplateOptions.patch \
> -    file://still-free-the-unconsumed-item.patch \
> -    file://syslog-ng-verify-the-list-before-del.patch \
>     file://configure.patch \
>     file://dbifix.patch \
> -    file://rewrite-expr-grammar.ym-Free-up-token.patch \
> -    file://logwriter-dont-allocate-a-new-buffer.patch \
>     file://syslog-ng.service-the-syslog-ng-service.patch \
> "
>=20
> -SRC_URI[md5sum] =3D "ff3bf223ebafbaa92b69a2d5b729f368"
> -SRC_URI[sha256sum] =3D =
"92c6969e4172b4fd32390f80043b4de7b116f29989d8c2e5a8a687ee6dcd6f66"
> +SRC_URI[md5sum] =3D "e9f401615e92e5eb27396c995c1446ba"
> +SRC_URI[sha256sum] =3D =
"7be11df31ac7d716f1f952e22b5ae8e2049edd633a41b223776a853d9106f4e7"
> --
> 1.9.1
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_D4E652CE-3B5E-4AFB-9F87-FA80FDBACEA6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUUcUACgkQuwUzVZGdMxTsQwCfUTBj4u6I9oz9ZnOZgoP1bVMx
lDwAnRSftZBhTQ44lHbN0eOkeXzzmZOE
=au8Z
-----END PGP SIGNATURE-----

--Apple-Mail=_D4E652CE-3B5E-4AFB-9F87-FA80FDBACEA6--

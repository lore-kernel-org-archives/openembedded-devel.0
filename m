Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LzvoP-00058h-8w
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 May 2009 18:42:09 +0200
Received: by an-out-0708.google.com with SMTP id b6so1546773ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2009 09:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=vV4Lt+Fylg01RI19Qor56a0B6CTbozRkQPYInRhLz/Y=;
	b=DqDb45y/1YilNtouRmfwfZlk3DhyCxSXKryFM3BLk9P72EMh5VhuF0tboBwF04pbY1
	MR0XEvlV+Ubs+7F+JtlH0eurFPc73zqwLH1j28nc9hcX/be0+CphnIla8/zW6vhNxh+o
	Us0EkjSlVlY5+nAffauGObL7B2fCWZGN6yGE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=AGoZZFa+Ygpa/TjcRzXvlOpTNVo2h0lbqI6le4Cin/ihNxN7ceJSUu9Dz45mu1AGoq
	64ectAb/Xyf9p0REF8WSrAeT93cPz3Kj32FCUYQ7MfeEMVf4bw3y9HJYb3jUjenjV+TL
	CdK7S3fiOrawE29bO2Kakf0O/gL0lYJ82vm/Q=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.153.9 with SMTP id a9mr6273965ane.139.1241195799761; Fri, 
	01 May 2009 09:36:39 -0700 (PDT)
In-Reply-To: <1241181034-25945-2-git-send-email-khimov@altell.ru>
References: <1241181034-25945-1-git-send-email-khimov@altell.ru>
	<1241181034-25945-2-git-send-email-khimov@altell.ru>
Date: Fri, 1 May 2009 13:36:39 -0300
X-Google-Sender-Auth: 9dce15c3436d3e72
Message-ID: <be7a9f3d0905010936v2cfb14can492f41735b6d7cf8@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] bridge-utils: add version 1.4
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
X-List-Received-Date: Fri, 01 May 2009 16:42:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Fri, May 1, 2009 at 9:30 AM, Roman I Khimov <khimov@altell.ru> wrote:
> ---
> =A0conf/checksums.ini =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A04 ++++
> =A0recipes/bridge-utils/bridge-utils.inc =A0 =A0| =A0 24 ++++++++++++++++=
++++++++
> =A0recipes/bridge-utils/bridge-utils_1.2.bb | =A0 28 ++------------------=
--------
> =A0recipes/bridge-utils/bridge-utils_1.4.bb | =A0 =A01 +
> =A04 files changed, 31 insertions(+), 26 deletions(-)
> =A0create mode 100644 recipes/bridge-utils/bridge-utils.inc
> =A0create mode 100644 recipes/bridge-utils/bridge-utils_1.4.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 9a2c473..9485f6b 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -3034,6 +3034,10 @@ sha256=3Dc93b9fab6b12a80bcf69114aab66d1d298455e926=
9c44f9e5f6430c142f9e349
> =A0md5=3D1e6cff57ac90d7ab984d9512fdd9f2dd
> =A0sha256=3Dc93b9fab6b12a80bcf69114aab66d1d298455e9269c44f9e5f6430c142f9e=
349
>
> +[http://downloads.sourceforge.net/bridge/bridge-utils-1.4.tar.gz]
> +md5=3D0182fcac3a2b307113bbec34e5f1c673
> +sha256=3D876975e9bcc302aa8b829161ea3348b12b9b879f1db0dc98feaed8d0e5dd593=
3
> +
> =A0[http://www.ludd.luth.se/~torger/files/brutefir-1.0i.tar.gz]
> =A0md5=3D33fcf84a41d38f5aac24c57a66a2c3ee
> =A0sha256=3De0f3988afb0a84a89f38153fd5617615e9bcf32bb747ee981c99c44d3c423=
6f6
> diff --git a/recipes/bridge-utils/bridge-utils.inc b/recipes/bridge-utils=
/bridge-utils.inc
> new file mode 100644
> index 0000000..ba4d582
> --- /dev/null
> +++ b/recipes/bridge-utils/bridge-utils.inc
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "Tools for ethernet bridging."
> +HOMEPAGE =3D "http://bridge.sourceforge.net/"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPL"
> +DEPENDS =3D "sysfsutils"
> +RRECOMMENDS =3D "kernel-module-bridge"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--with-linux-headers=3D${STAGING_INCDIR}"
> +
> +do_install_append () {
> + =A0 =A0 =A0 mv ${D}${sbindir}/brctl ${D}${sbindir}/brctl.${PN}
> +}
> +
> +pkg_postinst_${PN} () {
> + =A0 =A0 =A0 update-alternatives --install ${sbindir}/brctl brctl brctl.=
${PN} 100
> +}
> +
> +pkg_prerm_${PN} () {
> + =A0 =A0 =A0 update-alternatives --remove brctl brctl.${PN}
> +}
> diff --git a/recipes/bridge-utils/bridge-utils_1.2.bb b/recipes/bridge-ut=
ils/bridge-utils_1.2.bb
> index 51414f5..dd1def4 100644
> --- a/recipes/bridge-utils/bridge-utils_1.2.bb
> +++ b/recipes/bridge-utils/bridge-utils_1.2.bb
> @@ -1,26 +1,2 @@
> -DESCRIPTION =3D "Tools for ethernet bridging."
> -HOMEPAGE =3D "http://bridge.sourceforge.net/"
> -SECTION =3D "console/network"
> -LICENSE =3D "GPL"
> -DEPENDS =3D "sysfsutils"
> -RRECOMMENDS =3D "kernel-module-bridge"
> -PR =3D "r1"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz"
> -
> -inherit autotools
> -
> -EXTRA_OECONF =3D "--with-linux-headers=3D${STAGING_INCDIR}"
> -
> -do_install () {
> - =A0 =A0 =A0 autotools_do_install
> - =A0 =A0 =A0 mv ${D}${sbindir}/brctl ${D}${sbindir}/brctl.${PN}
> -}
> -
> -pkg_postinst_${PN} () {
> - =A0 =A0 =A0 update-alternatives --install ${sbindir}/brctl brctl brctl.=
${PN} 100
> -}
> -
> -pkg_prerm_${PN} () {
> - =A0 =A0 =A0 update-alternatives --remove brctl brctl.${PN}
> -}
> +require bridge-utils.inc
> +PR =3D "r2"
> diff --git a/recipes/bridge-utils/bridge-utils_1.4.bb b/recipes/bridge-ut=
ils/bridge-utils_1.4.bb
> new file mode 100644
> index 0000000..1c2dea6
> --- /dev/null
> +++ b/recipes/bridge-utils/bridge-utils_1.4.bb
> @@ -0,0 +1 @@
> +require bridge-utils.inc
> --
> 1.6.2.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br



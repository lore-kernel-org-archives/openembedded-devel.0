Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id B323471A22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2016 19:55:33 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i85so3442121pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2016 12:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=BW+O5tnRcNPApg5CdtUtC1L1+8ih45DZZ3msOu/pJSM=;
	b=YD2kuKv+HhlSo6zHFsShFNvhep73rF2CieKrrS3k5EW29h5bqCIBKD6TbS2BZhF4HZ
	sUK7qIHjwhTZMLjaJiCmz5cG4qGuE9lziNVyFbp79VMrIDYlUYg9ZW2/LJLexDndHNTA
	mkuUrpTeaPqZtg22QPa6Yxb6Yievmbogfo3bTLSYxe95ufw97XxdEX2LMaZSi4NxREJs
	WWYQuVF3AUwP9VReFYQqSXvtLbr6XFrDNLPPDEL5eYbDfGeEsft48i8vSlMOtvwyRxqV
	7RGwcUtF1azBM6kJfn+mvoD+tLu9ktTOXOKqSJ8VRFbXQqiBXGtzKZNJRJ+ZrA6XRE4U
	6UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=BW+O5tnRcNPApg5CdtUtC1L1+8ih45DZZ3msOu/pJSM=;
	b=i+J6AJNsXhMCBT+/v8SWF6aZt37n2FUn/zGUv3a3GDHThK8h/hmebGIFTlOeupt8S+
	EES0Bn5kZ/2v2Xsvv2SPPajjQLGu7SZBkcHLOpDnXIR9ULXJlknsa4j7qr9XPkNnDFOu
	tMRhduPudwbcIDeloXFR7pHmAPDe/c5zNJQcgh6An5Jd8pzk8nG4YIkbAdQb90OSPR4q
	sZKS4XJc5p5vYddmvIW0yiwpJAdq1q7S46kCcjb7PstiIqAhC0o9cut767+FdLlIMcfd
	O0iDCC7r3AZ6GHFO2T6qeW+qeDT2yuucqmKF5aUpJWjqd9IBJb9eB23l887qXrcs00rB
	Xh0g==
X-Gm-Message-State: ABUngvdFB0mQbDlyEk0GTw1tE9cxDCB4xCgxjHydSEoC6XkSpvbiJUgmyvBFQF6rF8bcrA==
X-Received: by 10.99.115.14 with SMTP id o14mr14721947pgc.44.1477598134566;
	Thu, 27 Oct 2016 12:55:34 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:98cf:ea9b:f72:6b74?
	([2601:646:8882:b8c:98cf:ea9b:f72:6b74])
	by smtp.gmail.com with ESMTPSA id
	z87sm13610818pfk.67.2016.10.27.12.55.33
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Oct 2016 12:55:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1477587755-24666-1-git-send-email-denis@denix.org>
Date: Thu, 27 Oct 2016 12:55:33 -0700
Message-Id: <64B593B9-ABC1-4FAA-975D-144F46C7B134@gmail.com>
References: <1477587755-24666-1-git-send-email-denis@denix.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: Ian Ray <ian.ray@ge.com>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-oe][krogoth][PATCH] syslog-ng: expand service file @variables@ earlier
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
X-List-Received-Date: Thu, 27 Oct 2016 19:55:34 -0000
X-Groupsio-MsgNum: 63621
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CF55B3F5-0C3C-47FD-A8BF-56E8A46F0248";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CF55B3F5-0C3C-47FD-A8BF-56E8A46F0248
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 27, 2016, at 10:02 AM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>=20
> From: Ian Ray <ian.ray@ge.com>
>=20
> Move variable expansion of @SBINDIR@, @LOCALSTATEDIR@, and =
@BASEBINDIR@
> earlier during install, to before the systemd service file is =
installed
> by an automake rule.
>=20
> Signed-off-by: Ian Ray <ian.ray@ge.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc =
b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index 4e0f697..898e9c2 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -60,6 +60,12 @@ do_configure_prepend() {
>     eval "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '', =
'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=3D64//" =
${S}/configure.in', d)}"
> }
>=20
> +do_install_prepend() {
> +    sed -i -e 's,@SBINDIR@,${sbindir},g' =
${S}/contrib/systemd/*.service
> +    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' =
${S}/contrib/systemd/*.service
> +    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' =
${S}/contrib/systemd/*.service
> +}

perhaps, its better to sed the installed artifacts in staging area under =
${D}
it can be done during post install and then ${S} is not edited as it is =
doing
right now.

> +
> do_install_append() {
>     install -d ${D}/${sysconfdir}/${BPN}
>     install ${WORKDIR}/syslog-ng.conf =
${D}${sysconfdir}/${BPN}/${BPN}.conf
> @@ -70,9 +76,6 @@ do_install_append() {
>     install -d ${D}/${localstatedir}/lib/${BPN}
>     # Remove /var/run as it is created on startup
>     rm -rf ${D}${localstatedir}/run
> -    sed -i -e 's,@SBINDIR@,${sbindir},g' =
${S}/contrib/systemd/*.service
> -    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' =
${S}/contrib/systemd/*.service
> -    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' =
${S}/contrib/systemd/*.service
> }
>=20
> FILES_${PN} +=3D "${datadir}/include/scl/ ${datadir}/xsd =
${datadir}/tools"
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_CF55B3F5-0C3C-47FD-A8BF-56E8A46F0248
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgSW7UACgkQuwUzVZGdMxQjqQCaAoNkFNU013R9MOW6tt1O4C19
HvQAnitfqVPZKQr/MLc7U9xEu0V99oiX
=OrOE
-----END PGP SIGNATURE-----

--Apple-Mail=_CF55B3F5-0C3C-47FD-A8BF-56E8A46F0248--

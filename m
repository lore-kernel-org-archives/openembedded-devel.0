Return-Path: <joe@deserted.net>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id ABDA56CA1F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 17:13:44 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so1908364eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 10:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=t4z5oW6D6DFuonMZazCHYcLvr08DQNcMqexXm/k8oLA=;
	b=k2PDYbRGnkIQEZOfWrltLqW8aP2Zx58qOUlxTJROIZkcne7DP7Aedpzu7Q68cQ4D/p
	Cai+l9231bLNq0G57/+EppZmEoLoPDpcX78rG6aFs9ppyO4OeX1HqCcgCIURx5831y+n
	BGlDLlDWhhYnqmV0bCMy27lzwFyY6nnAs63lugNP1v1gOJo4LGZGxQvutg/d+gYeHKMV
	vl1wzlIZ61NM0balcznWCrFxSBAvRzbdTjGFXKGBxqanCx8B8E3oIhFxA5j+glr+op7N
	dbpifkK8W2vYL6kXcsALOu+oAs+82M/+k08147YomUyyxdqinjsgqTmU9+J0a4qTlyUi
	Nrvg==
X-Gm-Message-State: ALoCoQkUMAnCfxN7NUoCioIUQirx14lm5eNXouvQjqGPOAreeDln/b1FTkNtJ6oK2EXKgDldm4Q3
X-Received: by 10.15.102.71 with SMTP id bq47mr4779201eeb.66.1379956425705;
	Mon, 23 Sep 2013 10:13:45 -0700 (PDT)
Received: from deserted.net ([128.224.252.2]) by mx.google.com with ESMTPSA id
	bn13sm43835616eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 10:13:44 -0700 (PDT)
Date: Mon, 23 Sep 2013 13:13:40 -0400
From: Joe MacDonald <joe@deserted.net>
To: b40290@freescale.com
Message-ID: <20130923171338.GC25887@deserted.net>
References: <1379927191-21769-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1379927191-21769-1-git-send-email-b40290@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/3] snort: add recipe
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
X-List-Received-Date: Mon, 23 Sep 2013 17:13:45 -0000
X-Groupsio-MsgNum: 46308
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline

--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Actually, something else just occurred to me, too.

[[oe] [meta-networking][PATCH 1/3] snort: add recipe] On 13.09.23 (Mon 17:0=
6) b40290@freescale.com wrote:

> diff --git a/meta-networking/recipes-connectivity/snort/files/volatiles b=
/meta-networking/recipes-connectivity/snort/files/volatiles
> new file mode 100644
> index 0000000..e3ab51d
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/files/volatiles
> @@ -0,0 +1,2 @@
> +# <type> <owner> <group> <mode> <path> <linksource>
> +d snort snort 0755 /var/log/snort none
> \ No newline at end of file

Since you're going to be in there again anyway, can you fix this, too?

> diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb =
b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> new file mode 100644
> index 0000000..5a165ef
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> @@ -0,0 +1,86 @@
> +DESCRIPTION =3D "snort - a free lightweight network intrusion detection =
system for UNIX and Windows."
> +HOMEPAGE =3D "http://www.snort.org/"
> +LICENSE =3D "GPL"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D78fa8ef966b48fbf9095e13cc9237=
7c5"
> +
> +DEPENDS =3D "libpcap libpcre daq libdnet"
> +
> +SRC_URI =3D " ${GENTOO_MIRROR}/${BP}.tar.gz;name=3Dtarball \
> +            file://disable-inaddr-none.patch \
> +            file://disable-dap-address-space-id.patch \=20
> +	    file://snort.init \
> +	    file://default \
> +            file://logrotate \
> +	    file://volatiles \
> +          "

When you go back at this, can you also try to adopt the format laid out
by Peter here:

http://permalink.gmane.org/gmane.comp.handhelds.openembedded.core/41673

And I don't think the ";name=3Dtarball" is required here.  Is it?

-J.

> +SRC_URI[tarball.md5sum] =3D "4111df01a4f21bd1d328a18b76d625bd"
> +SRC_URI[tarball.sha256sum] =3D "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6=
186a014baa451d43cdb0b3bc"
> +
> +inherit autotools  gettext=20
> +
> +EXTRA_OECONF =3D " \
> +	--enable-gre \   =20
> +	--enable-linux-smp-stats \
> +	--enable-reload \
> +	--enable-reload-error-restart \
> +	--enable-targetbased \
> +	--disable-static-daq \
> +	"
> +
> +do_install_append() {
> +	install -d ${D}/${sysconfdir}/snort/rules
> +	install -d ${D}/${sysconfdir}/snort/preproc_rules
> +	install -d ${D}/${sysconfdir}/default/volatiles
> +	mkdir -p ${D}/${sysconfdir}/init.d
> +	for i in map config conf dtd; do
> +		cp ${S}/etc/*.$i ${D}/${sysconfdir}/snort/
> +	done
> +	cp ${S}/preproc_rules/*.rules ${D}/${sysconfdir}/snort/preproc_rules/
> +	install -m 0644 ${WORKDIR}/default ${D}/${sysconfdir}/default/snort
> +	install -m 0644 ${WORKDIR}/volatiles ${D}/${sysconfdir}/default/volatil=
es/snort
> +	install -m 0755 ${WORKDIR}/snort.init ${D}/${sysconfdir}/init.d/snort
> +	mkdir -p ${D}/${localstatedir}/log/snort
> +	install -d ${D}${sysconfdir}/logrotate.d
> +	install -m 0644 ${WORKDIR}/logrotate ${D}${sysconfdir}/logrotate.d/snort
> +}
> +
> +pkg_postinst_${PN}() {
> +	grep -q ^snort: /etc/group || addgroup snort
> +	grep -q ^snort: /etc/passwd || \
> +		adduser --disabled-password --home=3D/var/log/snort/ --system \
> +			--ingroup snort --no-create-home -g "snort" snort
> +	${sysconfdir}/init.d/populate-volatile.sh update
> +}
> +
> +PACKAGES =3D+ "${PN}-logrotate"
> +FILES_${PN}-logrotate =3D "${sysconfdir}/logrotate.d/snort"
> +FILES_${PN} +=3D " \
> +	${libdir}/snort_dynamicengine/*.so.* \
> +	${libdir}/snort_dynamicpreprocessor/*.so.* \
> +	${libdir}/snort_dynamicrules/*.so.* \
> +	"
> +FILES_${PN}-dbg +=3D " \
> +	${libdir}/snort_dynamicengine/.debug \
> +	${libdir}/snort_dynamicpreprocessor/.debug \
> +	${libdir}/snort_dynamicrules/.debug \
> +	"
> +FILES_${PN}-staticdev +=3D " \
> +	${libdir}/snort_dynamicengine/*.a \
> +	${libdir}/snort_dynamicpreprocessor/*.a \
> +	${libdir}/snort_dynamicrules/*.a \
> +	${libdir}/snort/dynamic_preproc/*.a \
> +	${libdir}/snort/dynamic_output/*.a \
> +	"
> +FILES_${PN}-dev +=3D " \
> +	${libdir}/snort_dynamicengine/*.la \
> +	${libdir}/snort_dynamicpreprocessor/*.la \
> +	${libdir}/snort_dynamicrules/*.la \
> +	${libdir}/snort_dynamicengine/*.so \
> +	${libdir}/snort_dynamicpreprocessor/*.so \
> +	${libdir}/snort_dynamicrules/*.so \
> +	${prefix}/src/snort_dynamicsrc \
> +	"
> +
> +RRECOMMENDS_${PN} +=3D "${PN}-logrotate"
> +RRECOMMENDS_${PN} +=3D "barnyard"
> +RSUGGESTS_${PN}-logrotate +=3D "logrotate"
--=20
-Joe MacDonald.
:wq

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJAdsIACgkQwFvcllog0XxEdgCgs5zA3CUQMnrfEbvNdq1MTYxB
lAYAn3ZVrLZBm//rqlPQ6xPoPrbX5eRJ
=xyTn
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--

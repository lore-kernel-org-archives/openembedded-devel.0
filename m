Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id C1387601F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jan 2015 03:09:50 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id eu11so22128885pac.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 19:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=aLJxS3WqFIMJWhx0eA7fZm47sesXRo6qyyFSrsPl124=;
	b=bAR7UKV5z4qT9I6lQu0uDoI4o/XRp6Z8dHUWzDd5l4WbD2Il7FC+4XS8G54G4LovJj
	I0axdB5FVJ2dX2xAaLC3Dqvz5tjVkF5DROoJFRQZRoK8WPXke/cvogo6OiR1swPxwT+2
	XTK1wDqp3jnZoU88LpVE4mlHuwpoXp7cgGtxLAvRcRVqRKaRpWRYti8eEvdFuDMfod/p
	bSpDxqzYJH/ztoDC0/CP9NAIqltrbimaRugxWqqEh0I+A9GsHFTs2+w1llyNbJSrbWp7
	vShipzrq/G4UslEt0i53zeiCYe59pUDIWLJOifcxYvCJmks6xFScZIGUhXR8zrqSYP11
	nMWg==
X-Received: by 10.66.171.206 with SMTP id aw14mr110655029pac.40.1420081790885; 
	Wed, 31 Dec 2014 19:09:50 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:57d:8d0:eedc:6d7a?
	([2601:9:3580:84c:57d:8d0:eedc:6d7a])
	by mx.google.com with ESMTPSA id h2sm3371008pdo.62.2014.12.31.19.09.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Dec 2014 19:09:50 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1420014126-30814-1-git-send-email-biannm@cn.fujitsu.com>
Date: Wed, 31 Dec 2014 19:09:49 -0800
Message-Id: <FB0357A0-FF54-472E-9D02-E7FCE744AFE5@gmail.com>
References: <1420014126-30814-1-git-send-email-biannm@cn.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1993)
Subject: Re: [meta-networking][PATCH] opensaf: add recipe
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
X-List-Received-Date: Thu, 01 Jan 2015 03:09:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 31, 2014, at 12:22 AM, Bian Naimeng <biannm@cn.fujitsu.com> =
wrote:
>=20
> OpenSAF is an open source implementation of the SAF AIS specification
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
> .../opensaf/install-samples-from-srcdir.patch      | 11 ++++++
> .../recipes-daemons/opensaf/opensaf_4.5.0.bb       | 40 =
++++++++++++++++++++++
> 2 files changed, 51 insertions(+)
> create mode 100644 =
meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-srcdi=
r.patch
> create mode 100644 =
meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
>=20
> diff --git =
a/meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-src=
dir.patch =
b/meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-src=
dir.patch
> new file mode 100644
> index 0000000..016b64f
> --- /dev/null
> +++ =
b/meta-networking/recipes-daemons/opensaf/opensaf/install-samples-from-src=
dir.patch
> @@ -0,0 +1,11 @@
> +--- opensaf-4.5.0.orig/Makefile.am	2014-12-31 14:45:54.088797989 =
+0800
> ++++ opensaf-4.5.0/Makefile.am	2014-12-31 14:45:08.328796688 =
+0800
> +@@ -219,7 +219,7 @@ install-data-local:
> + 	$(mkinstalldirs) $(DESTDIR)$(pkgpiddir)
> + 	$(mkinstalldirs) $(DESTDIR)$(lockdir)
> + 	$(mkinstalldirs) $(DESTDIR)$(pkglocalstatedir)
> +-	cp -R samples/ $(DESTDIR)$(pkgdatadir)
> ++	cp -R $(srcdir)/samples/ $(DESTDIR)$(pkgdatadir)
> +=20
> + install-data-hook:
> + 	@for i in $$(grep -lr -e 'xxLIBDIRxx' -e 'xxLOGDIRxx' -e =
'xxCLCCLIDIRxx' $(DESTDIR)$(pkgimmxml_svcdir)/*.xml) ; do \
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb =
b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> new file mode 100644
> index 0000000..a58de5c
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> @@ -0,0 +1,40 @@
> +SUMMARY =3D "OpenSAF is an open source implementation of the SAF AIS =
specification"
> +DESCRIPTION =3D "OpenSAF is an open source project established to =
develop a base platform \
> +middleware consistent with Service Availability Forum (SA Forum) \
> +specifications, under the LGPLv2.1 license. The OpenSAF Foundation =
was \
> +established by leading Communications and Enterprise Computing =
Companies to \
> +facilitate the OpenSAF Project and to accelerate the adoption of the =
OpenSAF \
> +code base in commercial products. \
> +The OpenSAF project was launched in mid 2007 and has been under =
development by \
> +an informal group of supporters of the OpenSAF initiative. The =
OpenSAF \
> +Foundation was founded on January 22nd 2008 with Emerson Network =
Power, \
> +Ericsson, Nokia Siemens Networks, HP and Sun Microsystems as founding =
members."
> +HOMEPAGE =3D "http://www.opensaf.org"
> +
> +inherit autotools useradd systemd pkgconfig
> +
> +SRC_URI =3D =
"http://jaist.dl.sourceforge.net/project/opensaf/releases/${BPN}-${PV}.tar=
.gz \
> +           file://install-samples-from-srcdir.patch"
> +
> +SRC_URI[md5sum] =3D "534c0a99438a62c4c8dda56cfa67300c"
> +SRC_URI[sha256sum] =3D =
"2f5ba57fe67e94099c0df82d0a0dd207b5c583c93030035ba354c97b5471b590"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING.LIB;md5=3Da916467b91076e631dd8edb7424769c7"
> +
> +DEPENDS =3D "libxml2 python"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +GROUPADD_PARAM_${PN} =3D "-f -r opensaf"
> +USERADD_PARAM_${PN} =3D  "-r -g opensaf -d ${datadir}/opensaf/ -s =
${sbindir}/nologin -c \"OpenSAF\" opensaf"
> +
> +SYSTEMD_SERVICE_${PN} +=3D "opensafd.service"
> +SYSTEMD_AUTO_ENABLE =3D =E2=80=9Cdisable"

why disable ?

> +
> +FILES_${PN} +=3D "/run=E2=80=9D

hmmm /run is usually tmpfs so this should be solved differently.

> +
> +INSANE_SKIP_${PN} =3D "dev-so"
> +
> +do_install_append() {
> +    rm -rf "${D}${localstatedir}/run"
> +}
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



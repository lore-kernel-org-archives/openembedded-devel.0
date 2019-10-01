Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id BB44C7E3BC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2019 03:22:04 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l3so19820872qtr.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2019 20:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E6XaEo5hP7bubyUh3N609pqSA0A8/gX7sofjCJso4tk=;
	b=hemxKmIxi/wTXmLo1ilDrGtgxWJaqzNnHfuzmy/TTVyGBEujqGWk7qliRZezuYykVC
	6FhLlIWwbjktAOcRzNnjZV82l52MNWVIDgzuHkpUi3FdF9fN8Jai6ARljsaKxp/Lr21s
	gQR5yKN97fcrYeUUdFQCvQdttscnafkPfATIEPUEFLO/zy7EIxnXw4aSqd+u8rwBhKrs
	xieaqju9y8y6Bx6HGJ48GJEtkZPr34D6xXZB0G5TH+rHedAIfycow1PU6/qOk9zz/y47
	LGcv3oVqjCdor/NcX8nIyKW5noSNSjcu9CVtuzdLoY1vrSOGeX/chEgcKMDRZqVf5ZZj
	7T3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E6XaEo5hP7bubyUh3N609pqSA0A8/gX7sofjCJso4tk=;
	b=Z1xZ2ufnGiyQfbcFcU2tcmTj7AjfUZpg2ZxqeAJxmskqHoZe0k0w648pZFyv809KR6
	pnvWSRi2rDRQztPzPo5FnrKCUV/WFQ7q+h7Jt0CLHf9l/UDmk3gsIXtevuBSWKCGEHTC
	tVPvWoJT5p7L+4gshUfEo/emE62AVv8DCc/2NUi+amxEKf8pT2/ZPZJkWaVZIdBMp+cl
	73cqQdf/TmnDu58IuvBO0OxTNgRys/XM+ki3MJeBVUtTRBQyQNTGrhdHK1V0r4QSPjej
	JIxwrJJTxUK8/28U9dc/3x7RpqIU6YwZT+m2YvZ+QrDgD2eNu2PyESWP9bNA2pJ4NJ6j
	4Zaw==
X-Gm-Message-State: APjAAAX5hgehH4xjXXUPemuzDq0PtpIj7yZlJ9Een3tqFGeeX+TY1w7u
	I7dyI9O02VnSQpPieCRcDnlMlgqpw0NAHMymHN8=
X-Google-Smtp-Source: APXvYqxMv+N1aQAfpGZVP41fMs/j2DtnPTVNC9lQU82Vjy6g4YWwVxSxyGcEqn3gp1BIdHSX6AhlwRn4Bwnw52w3L9c=
X-Received: by 2002:a0c:d0aa:: with SMTP id z39mr23816165qvg.175.1569900124921;
	Mon, 30 Sep 2019 20:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqbBYpZn9a8CnG8Nc+4PWXTtGCZFEes=Ntxzq9_VZt==Q@mail.gmail.com>
	<20190930221119.30225-1-dan.callaghan@opengear.com>
In-Reply-To: <20190930221119.30225-1-dan.callaghan@opengear.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Sep 2019 20:21:38 -0700
Message-ID: <CAMKF1srXJ6OA4sUCqJVOoAC7inNGS38UwWgY7TAdEPdMdj5nJg@mail.gmail.com>
To: Dan Callaghan <dan.callaghan@opengear.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] firewalld: update to 0.7.1
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
X-List-Received-Date: Tue, 01 Oct 2019 03:22:05 -0000
Content-Type: text/plain; charset="UTF-8"

Fails in configure

https://errors.yoctoproject.org/Errors/Details/272275/

perhaps xmlto-native docbook-xml-dtd4-native
docbook-xsl-stylesheets-native deps are needed

On Mon, Sep 30, 2019 at 3:12 PM Dan Callaghan
<dan.callaghan@opengear.com> wrote:
>
> ---
>  ...a-separate-directory-outside-the-sou.patch | 68 -------------------
>  ...{firewalld_0.6.4.bb => firewalld_0.7.1.bb} | 14 ++--
>  2 files changed, 9 insertions(+), 73 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
>  rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.6.4.bb => firewalld_0.7.1.bb} (87%)
>
> diff --git a/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch b/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
> deleted file mode 100644
> index 28d590242..000000000
> --- a/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -firewalld: fix building in a separate directory outside the source tree
> -
> -Upstream-Status: Accepted [https://github.com/firewalld/firewalld/pull/456]
> -Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> -
> ---- a/config/Makefile.am
> -+++ b/config/Makefile.am
> -@@ -377,11 +377,11 @@ install-config:
> -       $(MKDIR_P) $(DESTDIR)$(sconfdir)/zones
> -       $(MKDIR_P) $(DESTDIR)$(sconfdir)/helpers
> -       $(MKDIR_P) $(DESTDIR)$(prefixlibdir)
> --      cp -r icmptypes $(DESTDIR)$(prefixlibdir)
> --      cp -r ipsets $(DESTDIR)$(prefixlibdir)
> --      cp -r services $(DESTDIR)$(prefixlibdir)
> --      cp -r zones $(DESTDIR)$(prefixlibdir)
> --      cp -r helpers $(DESTDIR)$(prefixlibdir)
> -+      cp -r $(srcdir)/icmptypes $(DESTDIR)$(prefixlibdir)
> -+      cp -r $(srcdir)/ipsets $(DESTDIR)$(prefixlibdir)
> -+      cp -r $(srcdir)/services $(DESTDIR)$(prefixlibdir)
> -+      cp -r $(srcdir)/zones $(DESTDIR)$(prefixlibdir)
> -+      cp -r $(srcdir)/helpers $(DESTDIR)$(prefixlibdir)
> -
> - uninstall-config:
> -       rmdir $(DESTDIR)$(sconfdir)/icmptypes
> ---- a/doc/xml/Makefile.am
> -+++ b/doc/xml/Makefile.am
> -@@ -69,7 +69,8 @@ edit = sed \
> -       -e 's|\@PREFIX\@|$(prefix)|' \
> -       -e 's|\@SYSCONFDIR\@|$(sysconfdir)|' \
> -       -e 's|\@PACKAGE_STRING\@|$(PACKAGE_STRING)|' \
> --      -e 's|\@IFCFGDIR\@|$(IFCFGDIR)|'
> -+      -e 's|\@IFCFGDIR\@|$(IFCFGDIR)|' \
> -+      -e 's|@SRCDIR@|$(srcdir)|'
> -
> - transform-man.xsl: transform-man.xsl.in
> -       $(edit) $< >$@
> ---- a/doc/xml/firewall-cmd.xml.in
> -+++ b/doc/xml/firewall-cmd.xml.in
> -@@ -1,10 +1,10 @@
> - <?xml version="1.0" encoding="utf-8"?>
> - <!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
> - [
> --<!ENTITY authors SYSTEM "authors.xml">
> --<!ENTITY seealso SYSTEM "seealso.xml">
> --<!ENTITY notes SYSTEM "notes.xml">
> --<!ENTITY errorcodes SYSTEM "errorcodes.xml">
> -+<!ENTITY authors SYSTEM "@SRCDIR@/authors.xml">
> -+<!ENTITY seealso SYSTEM "@SRCDIR@/seealso.xml">
> -+<!ENTITY notes SYSTEM "@SRCDIR@/notes.xml">
> -+<!ENTITY errorcodes SYSTEM "@SRCDIR@/errorcodes.xml">
> - ]>
> -
> - <!--
> ---- a/doc/xml/firewalld.xml.in
> -+++ b/doc/xml/firewalld.xml.in
> -@@ -1,9 +1,9 @@
> - <?xml version="1.0" encoding="utf-8"?>
> - <!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
> - [
> --<!ENTITY authors SYSTEM "authors.xml">
> --<!ENTITY seealso SYSTEM "seealso.xml">
> --<!ENTITY notes SYSTEM "notes.xml">
> -+<!ENTITY authors SYSTEM "@SRCDIR@/authors.xml">
> -+<!ENTITY seealso SYSTEM "@SRCDIR@/seealso.xml">
> -+<!ENTITY notes SYSTEM "@SRCDIR@/notes.xml">
> - ]>
> -
> - <!--
> diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
> similarity index 87%
> rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
> rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
> index d9d5cad75..ad11ec5c3 100644
> --- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
> +++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
> @@ -6,11 +6,10 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
> -           file://0001-fix-building-in-a-separate-directory-outside-the-sou.patch \
>             file://firewalld.init \
>  "
> -SRC_URI[md5sum] = "e63bdd65a4d2f6338f60b31e91bb5525"
> -SRC_URI[sha256sum] = "5a82a72fd9ad4cbbfb805bae615faa9b91a27855245de0fef3bcb06439394852"
> +SRC_URI[md5sum] = "32c16df3f6cc859d0df627baf5ee8401"
> +SRC_URI[sha256sum] = "88bc63a011209ac046fb5d7bfc73ddcc0bc616ddf3013bbb6bf1a421cb497f76"
>
>  # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
>  # xmlto-native is needed to populate /etc/xml/catalog.xml in the sysroot so that xsltproc finds the docbook xslt
> @@ -19,7 +18,9 @@ DEPENDS = "intltool-native glib-2.0-native libxslt-native docbook-xsl-stylesheet
>  inherit gettext autotools bash-completion python3native gsettings systemd update-rc.d
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> -PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_unitdir}/system/,--disable-systemd"
> +PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd"
> +
> +PACKAGES += "${PN}-zsh-completion"
>
>  # iptables, ip6tables, ebtables, and ipset *should* be unnecessary
>  # when the nftables backend is available, because nftables supersedes all of them.
> @@ -37,10 +38,11 @@ EXTRA_OECONF = "\
>      --without-ebtables \
>      --without-ebtables-restore \
>      --disable-sysconfig \
> +    --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml \
>  "
>
>  INITSCRIPT_NAME = "firewalld"
> -SYSTEMD_SERVICE = "firewalld.service"
> +SYSTEMD_SERVICE_${PN} = "firewalld.service"
>
>  do_install_append() {
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> @@ -65,9 +67,11 @@ do_install_append() {
>
>  FILES_${PN} += "\
>      ${PYTHON_SITEPACKAGES_DIR}/firewall \
> +    ${datadir}/dbus-1 \
>      ${datadir}/polkit-1 \
>      ${datadir}/metainfo \
>  "
> +FILES_${PN}-zsh-completion = "${datadir}/zsh/site-functions"
>
>  RDEPENDS_${PN} = "\
>      nftables \
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


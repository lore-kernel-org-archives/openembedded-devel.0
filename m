Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id F0CC07E544
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 16:48:15 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n7so103444qtb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3kDa1LM/TMLp1ACZKPhCTFkBdgNm9eBvC4/G+NCl2Bg=;
	b=VO0CoE/rp8H9v5Je0NmpLSwuMbF4PVQfzztGuXxr9AUYjHI/x4/tLvlb6gqFOE+AmS
	mIhEE0akChQ93Z1/pajsEPs2VqhJZ7xkcZIWRSunuvGMjwSVWK0qwPwM+/oNEt/P5aah
	BUtQEUr6mhGFZVUP3KZZFRTQgolk9o/vjF21kVA/VcFRxwyaWIH6vXkJ+jqktEoOqn2d
	nkXLp6KjPGG6K7+5yfd1QuRFHtHDymHLqt7Ph3X5Zr5SxFTS4cbTeeg97/AeCp0f4yXC
	RNpgFYQGDMyFmB9kiK7FxhQxeFdLtxkRTx1R2hJ3XodUErgbuuWF6YrjDjBQc3V36DGo
	BYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3kDa1LM/TMLp1ACZKPhCTFkBdgNm9eBvC4/G+NCl2Bg=;
	b=G8rasJnxUfAZAwOOCLh//pO5bLt3fpg1p61t21kl+p3oRyv11HjtV4z7HJ3Zmzz/jI
	zSG9msry0S5avpGebkYMKat31DtuE922NU9s+gXZ7lhi3inbo9E9xoq+4W15XcIQlaDf
	QSiDHcKT34FDjjDh/5uVjwkyFCDYkpFM4KBHljVE1qq5/xDwyQIcCBpLosEFZc0L0MSU
	0eO5r3JAjtOT+/VwcrrWrSJ834KhBuedkhGJkw/1bY7yd4Gc36vwe9kAtROeF1SE1paZ
	R7dtPkrrcQhDqZjlOUTrn8DkNzKSfJ7n459LclBRT3LsjsrFSnEfjAJ54VgaMRsiP3Bp
	QV7Q==
X-Gm-Message-State: APjAAAWezeGh2VBxvYpqVbP9NV25aErP9DOhrl9m121CoeP2+YxqAzQc
	dLFcsWlXbiclllqZxSNOPHhLb7wIhULu6laEc4KK1nOlOxY=
X-Google-Smtp-Source: APXvYqz50+izT0o2mn8H+IZqbGzl2Bd52qowVn6Q6dzh+L0Zna4/Nu6thax8oIZTny6QbigMC97e0nhLsJ4gTccExvI=
X-Received: by 2002:ad4:5551:: with SMTP id v17mr284734qvy.65.1569430096457;
	Wed, 25 Sep 2019 09:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190925073551.8311-1-dan.callaghan@opengear.com>
In-Reply-To: <20190925073551.8311-1-dan.callaghan@opengear.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2019 09:47:50 -0700
Message-ID: <CAMKF1sqbBYpZn9a8CnG8Nc+4PWXTtGCZFEes=Ntxzq9_VZt==Q@mail.gmail.com>
To: Dan Callaghan <dan.callaghan@opengear.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] firewalld: update to 0.7.1
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
X-List-Received-Date: Wed, 25 Sep 2019 16:48:16 -0000
Content-Type: text/plain; charset="UTF-8"

Fails https://errors.yoctoproject.org/Errors/Details/271958/

On Wed, Sep 25, 2019 at 12:36 AM Dan Callaghan
<dan.callaghan@opengear.com> wrote:
>
> ---
>  ...a-separate-directory-outside-the-sou.patch | 68 -------------------
>  ...{firewalld_0.6.4.bb => firewalld_0.7.1.bb} | 13 ++--
>  2 files changed, 8 insertions(+), 73 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
>  rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.6.4.bb => firewalld_0.7.1.bb} (88%)
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
> similarity index 88%
> rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
> rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
> index 5955072f1..15567f636 100644
> --- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
> +++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
> @@ -5,11 +5,10 @@ LICENSE = "GPLv2+"
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
> @@ -18,7 +17,9 @@ DEPENDS = "intltool-native glib-2.0-native libxslt-native docbook-xsl-stylesheet
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
> @@ -39,7 +40,7 @@ EXTRA_OECONF = "\
>  "
>
>  INITSCRIPT_NAME = "firewalld"
> -SYSTEMD_SERVICE = "firewalld.service"
> +SYSTEMD_SERVICE_${PN} = "firewalld.service"
>
>  do_install_append() {
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> @@ -64,9 +65,11 @@ do_install_append() {
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


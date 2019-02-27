Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 49FD57CB92
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 01:36:42 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id y140so8908278qkb.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 17:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JRaiuXl6blJbD2pynvepQu9Ccd5m4q7z7sL9OCGkTik=;
	b=H3ieKbhVMro6Oodelub/zMrnZ/O3BQEdWUcv1oS+HlZbOjMsYFQuJVwr+jcgcYLp5b
	2m+kz1nqBeEXvXJFBnu+SusRuLKmdv+7dwpzW6408XZn/EPJEVMRyjXmSMn/dAtv/790
	d/VRzMGmWCjMnkC/cdAfVHTvH9ZysunKCPR5OryPcGM//4J0E34JB0u9bl+4Kc7qfx7q
	FMrd8ice4gy6plc8Qp/07PVSkyGPNyU7LuNPmQfixJcO7QZMHx+1fx5FQnkUgQcKatkZ
	H0Spj7X6i5Cfy3NxO1siZaAqowskH/573KrFBJPy7Z0NgvdvoV7X1ILjLwgQWOzAFQZW
	z91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JRaiuXl6blJbD2pynvepQu9Ccd5m4q7z7sL9OCGkTik=;
	b=X/Byu6n09D/3U/jcRnpLbKhLbmtVv5uixThgcO7ue1mKp2AKsHiYGg1RFPkqkWv7gk
	Cg0OvTHND3B8X8U4SkTT5qxwbQldtu4hcXLmJYsqTmjxbLHUVB6s+trqLoNdT2yDnl/W
	3XXTPnx6hjCB87JTAcwGPzbFzQ8AqYG+yYZTPIojzTR9VUpNdTednzyX6f+oJ+9MhN74
	MkQOJL1we2TbwEEynyQ+C/hgv0PZpxgQzD61AKsu6LL5PC3zKFKzaZUJaFoV4UgsXl3d
	1RhciwCAsOrMus2Mwv1CWaSXsIbH/zQJlMvV6Wtejgv8cmzJ22kiqCVAkDPUzDKH71GG
	J+dw==
X-Gm-Message-State: AHQUAub8dzUZxo/NLfTjRayKG9cMBHNESCduPMGfGh7VAjm+ZeKN8+9y
	wdVTMkPVI2vTGMedUMtFx2KzGVCXxoc91sDmzZY=
X-Google-Smtp-Source: AHgI3IYyMwiWbovh9gHlbHP5gzifS4qZLuyDvOfEYolMY3lcMzfTQUOF1/i4JITJT7N2XTnmNtljARvM48AwiJv25IE=
X-Received: by 2002:a37:e10c:: with SMTP id c12mr340166qkm.315.1551231402874; 
	Tue, 26 Feb 2019 17:36:42 -0800 (PST)
MIME-Version: 1.0
References: <20190225061757.24421-1-dan.callaghan@opengear.com>
In-Reply-To: <20190225061757.24421-1-dan.callaghan@opengear.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 17:36:17 -0800
Message-ID: <CAMKF1so7ONWosmZ8ZLoESHnb9tRiWqA2tBYq=SstnoXq9CP0mw@mail.gmail.com>
To: Dan Callaghan <dan.callaghan@opengear.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] firewalld: add new recipe
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
X-List-Received-Date: Wed, 27 Feb 2019 01:36:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 8:51 PM Dan Callaghan
<dan.callaghan@opengear.com> wrote:
>

Fails to build for mips
https://errors.yoctoproject.org/Errors/Details/230515/

> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
>  ...a-separate-directory-outside-the-sou.patch | 77 +++++++++++++++++++
>  .../firewalld/files/firewalld.init            | 48 ++++++++++++
>  .../firewalld/firewalld_0.6.3.bb              | 68 ++++++++++++++++
>  3 files changed, 193 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
>  create mode 100644 meta-networking/recipes-connectivity/firewalld/files/firewalld.init
>  create mode 100644 meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb
>
> diff --git a/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch b/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
> new file mode 100644
> index 000000000..3f34ff2e4
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
> @@ -0,0 +1,77 @@
> +firewalld: fix building in a separate directory outside the source tree
> +
> +Upstream-Status: Submitted [https://github.com/firewalld/firewalld/pull/456]
> +Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> +
> +diff --git a/config/Makefile.am b/config/Makefile.am
> +index 7048d2ee..5270d408 100644
> +--- a/config/Makefile.am
> ++++ b/config/Makefile.am
> +@@ -377,11 +377,11 @@ install-config:
> +       $(MKDIR_P) $(DESTDIR)$(sconfdir)/zones
> +       $(MKDIR_P) $(DESTDIR)$(sconfdir)/helpers
> +       $(MKDIR_P) $(DESTDIR)$(prefixlibdir)
> +-      cp -r icmptypes $(DESTDIR)$(prefixlibdir)
> +-      cp -r ipsets $(DESTDIR)$(prefixlibdir)
> +-      cp -r services $(DESTDIR)$(prefixlibdir)
> +-      cp -r zones $(DESTDIR)$(prefixlibdir)
> +-      cp -r helpers $(DESTDIR)$(prefixlibdir)
> ++      cp -r $(srcdir)/icmptypes $(DESTDIR)$(prefixlibdir)
> ++      cp -r $(srcdir)/ipsets $(DESTDIR)$(prefixlibdir)
> ++      cp -r $(srcdir)/services $(DESTDIR)$(prefixlibdir)
> ++      cp -r $(srcdir)/zones $(DESTDIR)$(prefixlibdir)
> ++      cp -r $(srcdir)/helpers $(DESTDIR)$(prefixlibdir)
> +
> + uninstall-config:
> +       rmdir $(DESTDIR)$(sconfdir)/icmptypes
> +diff --git a/doc/xml/Makefile.am b/doc/xml/Makefile.am
> +index 8c93ab9c..d0313e3e 100644
> +--- a/doc/xml/Makefile.am
> ++++ b/doc/xml/Makefile.am
> +@@ -69,7 +69,8 @@ edit = sed \
> +       -e 's|\@PREFIX\@|$(prefix)|' \
> +       -e 's|\@SYSCONFDIR\@|$(sysconfdir)|' \
> +       -e 's|\@PACKAGE_STRING\@|$(PACKAGE_STRING)|' \
> +-      -e 's|\@IFCFGDIR\@|$(IFCFGDIR)|'
> ++      -e 's|\@IFCFGDIR\@|$(IFCFGDIR)|' \
> ++      -e 's|@SRCDIR@|$(srcdir)|'
> +
> + transform-man.xsl: transform-man.xsl.in
> +       $(edit) $< >$@
> +diff --git a/doc/xml/firewall-cmd.xml.in b/doc/xml/firewall-cmd.xml.in
> +index c2606553..24d77858 100644
> +--- a/doc/xml/firewall-cmd.xml.in
> ++++ b/doc/xml/firewall-cmd.xml.in
> +@@ -1,9 +1,9 @@
> + <?xml version="1.0" encoding="utf-8"?>
> + <!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
> + [
> +-<!ENTITY authors SYSTEM "authors.xml">
> +-<!ENTITY seealso SYSTEM "seealso.xml">
> +-<!ENTITY notes SYSTEM "notes.xml">
> ++<!ENTITY authors SYSTEM "@SRCDIR@/authors.xml">
> ++<!ENTITY seealso SYSTEM "@SRCDIR@/seealso.xml">
> ++<!ENTITY notes SYSTEM "@SRCDIR@/notes.xml">
> + <!ENTITY errorcodes SYSTEM "errorcodes.xml">
> + ]>
> +
> +diff --git a/doc/xml/firewalld.xml.in b/doc/xml/firewalld.xml.in
> +index de802059..3d319b04 100644
> +--- a/doc/xml/firewalld.xml.in
> ++++ b/doc/xml/firewalld.xml.in
> +@@ -1,9 +1,9 @@
> + <?xml version="1.0" encoding="utf-8"?>
> + <!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
> + [
> +-<!ENTITY authors SYSTEM "authors.xml">
> +-<!ENTITY seealso SYSTEM "seealso.xml">
> +-<!ENTITY notes SYSTEM "notes.xml">
> ++<!ENTITY authors SYSTEM "@SRCDIR@/authors.xml">
> ++<!ENTITY seealso SYSTEM "@SRCDIR@/seealso.xml">
> ++<!ENTITY notes SYSTEM "@SRCDIR@/notes.xml">
> + ]>
> +
> + <!--
> +--
> +2.20.1
> +
> diff --git a/meta-networking/recipes-connectivity/firewalld/files/firewalld.init b/meta-networking/recipes-connectivity/firewalld/files/firewalld.init
> new file mode 100644
> index 000000000..08e8930b9
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/firewalld/files/firewalld.init
> @@ -0,0 +1,48 @@
> +#!/bin/sh
> +
> +### BEGIN INIT INFO
> +# Provides: firewalld
> +# Required-Start: $syslog $local_fs messagebus
> +# Required-Stop:
> +# Default-Start: 2 3 4 5
> +# Default-Stop: 0 1 6
> +# Short-Description:
> +# Description:
> +### END INIT INFO
> +
> +. /etc/init.d/functions
> +
> +firewalld=/usr/sbin/firewalld
> +pidfile=/var/run/firewalld.pid
> +
> +case "$1" in
> +    start)
> +        echo -n "Starting firewalld: "
> +        start-stop-daemon --start --quiet --exec $firewalld
> +        echo "."
> +        ;;
> +    stop)
> +        echo -n "Stopping firewalld: "
> +        start-stop-daemon --stop --quiet --pidfile $pidfile
> +        echo "."
> +        ;;
> +    restart)
> +        echo -n "Stopping firewalld: "
> +        start-stop-daemon --stop --quiet --pidfile $pidfile
> +        echo "."
> +        echo -n "Starting firewalld: "
> +        start-stop-daemon --start --quiet --exec $firewalld
> +        echo "."
> +        ;;
> +    reload)
> +        echo -n "Reloading firewalld: "
> +        firewall-cmd --reload
> +        echo "."
> +        ;;
> +    status)
> +        firewall-cmd --state
> +        ;;
> +    *)
> +        echo "Usage: /etc/init.d/firewalld {start|stop|restart|reload|status}" >&2
> +        exit 1
> +esac
> diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb
> new file mode 100644
> index 000000000..6526b1e91
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb
> @@ -0,0 +1,68 @@
> +SUMMARY = "Dynamic firewall daemon with a D-Bus interface"
> +HOMEPAGE = "https://firewalld.org/"
> +BUGTRACKER = "https://github.com/firewalld/firewalld/issues"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "https://github.com/firewalld/firewalld/archive/v${PV}.tar.gz \
> +           file://firewalld.init \
> +           file://0001-fix-building-in-a-separate-directory-outside-the-sou.patch \
> +"
> +SRC_URI[md5sum] = "5ef954d9b6b244ffeabcd226be1867a0"
> +SRC_URI[sha256sum] = "039ad56ea6d6553aadf33243ea5b39802d73519e46a89c80c648b2bd1ec78aeb"
> +
> +# glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
> +# xmlto-native is needed to populate /etc/xml/catalog.xml in the sysroot so that xsltproc finds the docbook xslt
> +DEPENDS = "intltool-native glib-2.0-native libxslt-native docbook-xsl-stylesheets-native xmlto-native"
> +
> +inherit gettext autotools bash-completion python3native gsettings systemd update-rc.d
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> +PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd"
> +
> +# /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by
> +# the Red Hat-specific init script which we aren't using, so disable it
> +EXTRA_OECONF = "--with-nft=${sbindir}/nft --disable-sysconfig"
> +
> +INITSCRIPT_NAME = "firewalld"
> +
> +do_install_append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +        :
> +    else
> +        # firewalld ships an init script but it contains Red Hat-isms, replace it with our own
> +        rm -rf ${D}${sysconfdir}/rc.d/
> +        install -d ${D}${sysconfdir}/init.d
> +        install -m0755 ${WORKDIR}/firewalld.init ${D}${sysconfdir}/init.d/firewalld
> +    fi
> +
> +    # We ran ./configure with PYTHON pointed at the binary inside $STAGING_BINDIR_NATIVE
> +    # so now we need to fix up any references to point at the proper path in the image.
> +    # This hack is also in distutils.bbclass, but firewalld doesn't use distutils/setuptools.
> +    if [ ${PN} != "${BPN}-native" ]; then
> +        sed -i -e s:${STAGING_BINDIR_NATIVE}/python3-native/python3:${bindir}/python3:g \
> +            ${D}${bindir}/* ${D}${sbindir}/* ${D}${sysconfdir}/firewalld/*.xml
> +    fi
> +    sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g \
> +        ${D}${bindir}/* ${D}${sbindir}/* ${D}${sysconfdir}/firewalld/*.xml
> +}
> +
> +FILES_${PN} += "\
> +    ${PYTHON_SITEPACKAGES_DIR}/firewall \
> +    ${datadir}/polkit-1 \
> +    ${datadir}/metainfo \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    nftables \
> +    python3-core \
> +    python3-io \
> +    python3-fcntl \
> +    python3-shell \
> +    python3-syslog \
> +    python3-xml \
> +    python3-dbus \
> +    python3-slip-dbus \
> +    python3-decorator \
> +    python3-pygobject \
> +"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqUE-0003kS-Tk
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:08:43 +0100
Received: by pxi17 with SMTP id 17so263354pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=AwNd94RfOl8gTPiwie6Df8axSzlXS0nE4cgIsIwMh34=;
	b=Ydxe+AmtnTzMSogOWVG2eY9hy4ltt2jMERGguRcVpWTILSTbk14CyVoqih7Ma3UdnV
	yxcApP6V7On5BrJtA2+uP9XzsCl/L2NrFpCfpw9zB6V1q5L6MpNL3fWGeRsn4ryPlgjh
	TKK5HsxwanEtfjvdxAKf14J4m37dHVhT5kwe4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=hXtzdfYpfdDvbMlu1HRpOJ4EVEwaF4qJ8TqAKJ8nNbcssf0882m/tC9vrRYDicCuS0
	8I4PI4uUfB6QqCikn+w9AF7EpAiV+OReA6MNv4AqzBYU+dLC7GQzhqaml9LUv+4m/1UO
	Iic2YlgnYLTAkwDmPGm6XtPN+AkspoGR68vsU=
Received: by 10.142.241.10 with SMTP id o10mr927636wfh.67.1297897650178;
	Wed, 16 Feb 2011 15:07:30 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x35sm347775wfd.1.2011.02.16.15.07.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 15:07:28 -0800 (PST)
Date: Wed, 16 Feb 2011 15:07:31 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216230731.GR14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-3-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1297855134-19216-3-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 03/13] cups: drop unused versions
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
X-List-Received-Date: Wed, 16 Feb 2011 23:08:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 11:18), Otavio Salvador wrote:
> Drop versions not being in use:
> 
>  - 1.1.23 and 1.2.7 - old and not preferred by any distro
>  - 1.3.8 and 1.4.3 - D_P -1 and not preferred by any distro
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/cups/cups-1.1.23/strftime_fix.patch        |   26 -----
>  .../cups/cups-1.3.8/use_echo_only_in_init.patch    |   11 --
>  recipes/cups/cups-1.4.3/configure.patch            |  117 --------------------
>  recipes/cups/cups-1.4.3/skip_tools.patch           |   51 ---------
>  .../cups/cups-1.4.3/use_echo_only_in_init.patch    |   11 --
>  recipes/cups/cups_1.1.23.bb                        |   51 ---------
>  recipes/cups/cups_1.2.7.bb                         |   80 -------------
>  recipes/cups/cups_1.3.8.bb                         |   11 --
>  recipes/cups/cups_1.4.3.bb                         |   15 ---
>  9 files changed, 0 insertions(+), 373 deletions(-)
>  delete mode 100644 recipes/cups/cups-1.1.23/strftime_fix.patch
>  delete mode 100644 recipes/cups/cups-1.3.8/use_echo_only_in_init.patch
>  delete mode 100644 recipes/cups/cups-1.4.3/configure.patch
>  delete mode 100644 recipes/cups/cups-1.4.3/skip_tools.patch
>  delete mode 100644 recipes/cups/cups-1.4.3/use_echo_only_in_init.patch
>  delete mode 100644 recipes/cups/cups_1.1.23.bb
>  delete mode 100644 recipes/cups/cups_1.2.7.bb
>  delete mode 100644 recipes/cups/cups_1.3.8.bb
>  delete mode 100644 recipes/cups/cups_1.4.3.bb
> 
> diff --git a/recipes/cups/cups-1.1.23/strftime_fix.patch b/recipes/cups/cups-1.1.23/strftime_fix.patch
> deleted file mode 100644
> index 81f224f..0000000
> --- a/recipes/cups/cups-1.1.23/strftime_fix.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Index: cups-1.1.23/scheduler/classes.c
> -===================================================================
> ---- cups-1.1.23.orig/scheduler/classes.c
> -+++ cups-1.1.23/scheduler/classes.c
> -@@ -622,7 +622,7 @@ SaveAllClasses(void)
> - 
> -   curtime = time(NULL);
> -   curdate = localtime(&curtime);
> --  strftime(temp, sizeof(temp) - 1, CUPS_STRFTIME_FORMAT, curdate);
> -+  strftime(temp, sizeof(temp) - 1, "%Y-%m-%d %H:%M", curdate);
> - 
> -   cupsFilePuts(fp, "# Class configuration file for " CUPS_SVERSION "\n");
> -   cupsFilePrintf(fp, "# Written by cupsd on %s\n", temp);
> -Index: cups-1.1.23/scheduler/printers.c
> -===================================================================
> ---- cups-1.1.23.orig/scheduler/printers.c
> -+++ cups-1.1.23/scheduler/printers.c
> -@@ -1066,7 +1066,7 @@ SaveAllPrinters(void)
> - 
> -   curtime = time(NULL);
> -   curdate = localtime(&curtime);
> --  strftime(temp, sizeof(temp) - 1, CUPS_STRFTIME_FORMAT, curdate);
> -+  strftime(temp, sizeof(temp) - 1, "%Y-%m-%d %H:%M", curdate);
> - 
> -   cupsFilePuts(fp, "# Printer configuration file for " CUPS_SVERSION "\n");
> -   cupsFilePrintf(fp, "# Written by cupsd on %s\n", temp);
> diff --git a/recipes/cups/cups-1.3.8/use_echo_only_in_init.patch b/recipes/cups/cups-1.3.8/use_echo_only_in_init.patch
> deleted file mode 100644
> index 21ff0e5..0000000
> --- a/recipes/cups/cups-1.3.8/use_echo_only_in_init.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- a/init/cups.sh.in.orig	2008-10-04 16:50:46.000000000 -0300
> -+++ b/init/cups.sh.in	2008-10-04 16:51:39.000000000 -0300
> -@@ -68,7 +68,7 @@
> - 		ECHO_ERROR=:
> - 		;;
> - 
> --	Linux*)
> -+	DISABLELinux*)
> - 		IS_ON=/bin/true
> - 		if test -f /etc/init.d/functions; then
> - 			. /etc/init.d/functions
> diff --git a/recipes/cups/cups-1.4.3/configure.patch b/recipes/cups/cups-1.4.3/configure.patch
> deleted file mode 100644
> index 877e8d3..0000000
> --- a/recipes/cups/cups-1.4.3/configure.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> ---- cups-1.4.3/configure.orig	2010-04-08 11:14:19.092296014 +0200
> -+++ cups-1.4.3/configure	2010-04-08 11:19:02.661417938 +0200
> -@@ -10940,114 +10940,6 @@
> -     		OPTIM="-fPIC $OPTIM"
> - 	fi
> - 
> --	# The -fstack-protector option is available with some versions of
> --	# GCC and adds "stack canaries" which detect when the return address
> --	# has been overwritten, preventing many types of exploit attacks.
> --	{ echo "$as_me:$LINENO: checking if GCC supports -fstack-protector" >&5
> --echo $ECHO_N "checking if GCC supports -fstack-protector... $ECHO_C" >&6; }
> --	OLDCFLAGS="$CFLAGS"
> --	CFLAGS="$CFLAGS -fstack-protector"
> --	cat >conftest.$ac_ext <<_ACEOF
> --/* confdefs.h.  */
> --_ACEOF
> --cat confdefs.h >>conftest.$ac_ext
> --cat >>conftest.$ac_ext <<_ACEOF
> --/* end confdefs.h.  */
> --
> --int
> --main ()
> --{
> --
> --  ;
> --  return 0;
> --}
> --_ACEOF
> --rm -f conftest.$ac_objext conftest$ac_exeext
> --if { (ac_try="$ac_link"
> --case "(($ac_try" in
> --  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
> --  *) ac_try_echo=$ac_try;;
> --esac
> --eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
> --  (eval "$ac_link") 2>conftest.er1
> --  ac_status=$?
> --  grep -v '^ *+' conftest.er1 >conftest.err
> --  rm -f conftest.er1
> --  cat conftest.err >&5
> --  echo "$as_me:$LINENO: \$? = $ac_status" >&5
> --  (exit $ac_status); } && {
> --	 test -z "$ac_c_werror_flag" ||
> --	 test ! -s conftest.err
> --       } && test -s conftest$ac_exeext &&
> --       $as_test_x conftest$ac_exeext; then
> --  OPTIM="$OPTIM -fstack-protector"
> --		{ echo "$as_me:$LINENO: result: yes" >&5
> --echo "${ECHO_T}yes" >&6; }
> --else
> --  echo "$as_me: failed program was:" >&5
> --sed 's/^/| /' conftest.$ac_ext >&5
> --
> --	{ echo "$as_me:$LINENO: result: no" >&5
> --echo "${ECHO_T}no" >&6; }
> --fi
> --
> --rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
> --      conftest$ac_exeext conftest.$ac_ext
> --	CFLAGS="$OLDCFLAGS"
> --
> --	# The -pie option is available with some versions of GCC and adds
> --	# randomization of addresses, which avoids another class of exploits
> --	# that depend on a fixed address for common functions.
> --	{ echo "$as_me:$LINENO: checking if GCC supports -pie" >&5
> --echo $ECHO_N "checking if GCC supports -pie... $ECHO_C" >&6; }
> --	OLDCFLAGS="$CFLAGS"
> --	CFLAGS="$CFLAGS -pie -fPIE"
> --	cat >conftest.$ac_ext <<_ACEOF
> --/* confdefs.h.  */
> --_ACEOF
> --cat confdefs.h >>conftest.$ac_ext
> --cat >>conftest.$ac_ext <<_ACEOF
> --/* end confdefs.h.  */
> --
> --int
> --main ()
> --{
> --
> --  ;
> --  return 0;
> --}
> --_ACEOF
> --rm -f conftest.$ac_objext
> --if { (ac_try="$ac_compile"
> --case "(($ac_try" in
> --  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
> --  *) ac_try_echo=$ac_try;;
> --esac
> --eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
> --  (eval "$ac_compile") 2>conftest.er1
> --  ac_status=$?
> --  grep -v '^ *+' conftest.er1 >conftest.err
> --  rm -f conftest.er1
> --  cat conftest.err >&5
> --  echo "$as_me:$LINENO: \$? = $ac_status" >&5
> --  (exit $ac_status); } && {
> --	 test -z "$ac_c_werror_flag" ||
> --	 test ! -s conftest.err
> --       } && test -s conftest.$ac_objext; then
> --  PIEFLAGS="-pie -fPIE"
> --		{ echo "$as_me:$LINENO: result: yes" >&5
> --echo "${ECHO_T}yes" >&6; }
> --else
> --  echo "$as_me: failed program was:" >&5
> --sed 's/^/| /' conftest.$ac_ext >&5
> --
> --	{ echo "$as_me:$LINENO: result: no" >&5
> --echo "${ECHO_T}no" >&6; }
> --fi
> --
> --rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> --	CFLAGS="$OLDCFLAGS"
> --
> - 	if test "x$with_optim" = x; then
> - 		# Add useful warning options for tracking down problems...
> - 		OPTIM="-Wall -Wno-format-y2k $OPTIM"
> diff --git a/recipes/cups/cups-1.4.3/skip_tools.patch b/recipes/cups/cups-1.4.3/skip_tools.patch
> deleted file mode 100644
> index 2721101..0000000
> --- a/recipes/cups/cups-1.4.3/skip_tools.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> ---- cups-1.4.3/ppdc/Makefile.orig	2010-04-07 12:38:56.650327699 +0200
> -+++ cups-1.4.3/ppdc/Makefile	2010-04-07 12:40:05.842418876 +0200
> -@@ -243,8 +243,8 @@
> - 	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o genstrings genstrings.o \
> - 		libcupsppdc.a ../cups/libcups.a $(LIBGSSAPI) $(SSLLIBS) \
> - 		$(DNSSDLIBS) $(COMMONLIBS) $(LIBZ)
> --	echo Generating localization strings...
> --	./genstrings >sample.c
> -+#	echo Generating localization strings...
> -+#	./genstrings >sample.c
> - 
> - 
> - #
> -@@ -261,9 +261,9 @@
> - 	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdc-static ppdc.o libcupsppdc.a \
> - 		../cups/libcups.a $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
> - 		$(COMMONLIBS) $(LIBZ)
> --	echo Testing PPD compiler...
> --	./ppdc-static -l en,fr -I ../data foo.drv
> --	./ppdc-static -l en,fr -z -I ../data foo.drv
> -+#	echo Testing PPD compiler...
> -+#	./ppdc-static -l en,fr -I ../data foo.drv
> -+#	./ppdc-static -l en,fr -z -I ../data foo.drv
> - 
> - 
> - #
> -@@ -291,15 +291,15 @@
> - 		$(COMMONLIBS) $(LIBZ)
> - 	echo Testing PPD importer...
> - 	$(RM) -r ppd ppd2 sample-import.drv
> --	./ppdc-static -I ../data sample.drv
> --	./ppdi-static -I ../data -o sample-import.drv ppd/*
> --	./ppdc-static -I ../data -d ppd2 sample-import.drv
> --	if diff -qr ppd ppd2; then \
> --		echo PPD import OK; \
> --	else \
> --		echo PPD import FAILED; \
> --		exit 1; \
> --	fi
> -+#	./ppdc-static -I ../data sample.drv
> -+#	./ppdi-static -I ../data -o sample-import.drv ppd/*
> -+#	./ppdc-static -I ../data -d ppd2 sample-import.drv
> -+#	if diff -qr ppd ppd2; then \
> -+#		echo PPD import OK; \
> -+#	else \
> -+#		echo PPD import FAILED; \
> -+#		exit 1; \
> -+#	fi
> - 
> - 
> - #
> diff --git a/recipes/cups/cups-1.4.3/use_echo_only_in_init.patch b/recipes/cups/cups-1.4.3/use_echo_only_in_init.patch
> deleted file mode 100644
> index 21ff0e5..0000000
> --- a/recipes/cups/cups-1.4.3/use_echo_only_in_init.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- a/init/cups.sh.in.orig	2008-10-04 16:50:46.000000000 -0300
> -+++ b/init/cups.sh.in	2008-10-04 16:51:39.000000000 -0300
> -@@ -68,7 +68,7 @@
> - 		ECHO_ERROR=:
> - 		;;
> - 
> --	Linux*)
> -+	DISABLELinux*)
> - 		IS_ON=/bin/true
> - 		if test -f /etc/init.d/functions; then
> - 			. /etc/init.d/functions
> diff --git a/recipes/cups/cups_1.1.23.bb b/recipes/cups/cups_1.1.23.bb
> deleted file mode 100644
> index 877187f..0000000
> --- a/recipes/cups/cups_1.1.23.bb
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -DESCRIPTION = "An Internet printing system for Unix."
> -SECTION = "console/utils"
> -LICENSE = "GPL LGPL"
> -DEPENDS = "openssl jpeg libpng zlib fakeroot-native"
> -INC_PR = "r7"
> -PR = "${INC_PR}.1"
> -
> -SRC_URI = "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
> -           file://strftime_fix.patch"
> -
> -inherit autotools binconfig
> -
> -LDFLAGS += " -L${STAGING_LIBDIR} "
> -
> -do_compile () {
> -	#Eeeks! Hack alert!
> -	grep CUPS config.h.in~ | grep define >> config.h
> -	sed -i s:STRIP:NOSTRIP: Makedefs
> -	sed -i s:serial:: backend/Makefile
> -
> -	oe_runmake "SSLLIBS=-lssl -lcrypto -L${STAGING_LIBDIR}" \
> -		   "LIBPNG=-lpng -lm -L${STAGING_LIBDIR}" \
> -		   "LIBJPEG=-ljpeg -L${STAGING_LIBDIR}" \
> -		   "LIBZ=-lz -L${STAGING_LIBDIR}" \
> -		   "-I."
> -}
> -
> -fakeroot do_install () {
> -	oe_runmake "DSTROOT=${D}" install
> -}
> -
> -do_stage () {
> -	install -d ${STAGING_INCDIR}/cups
> -	install ${S}/cups/*.h ${STAGING_INCDIR}/cups/
> -	install ${S}/filter/*.h ${STAGING_INCDIR}/cups/
> -	oe_libinstall -C cups -so libcups ${STAGING_LIBDIR}
> -	oe_libinstall -C filter -so libcupsimage ${STAGING_LIBDIR}
> -}
> -
> -#package the html for the webgui inside the main packages (~1MB uncompressed)
> -FILES_${PN} += "${datadir}/doc/cups/images \
> -		${datadir}/doc/cups/*html \
> -		${datadir}/doc/cups/*.css \
> -		"
> -
> -
> -
> -
> -
> -SRC_URI[md5sum] = "4ce09b1dce09b6b9398af0daae9adf63"
> -SRC_URI[sha256sum] = "87da0f7b1e03236e183045f1e787957132658ead56c4b0f80ac7f86c1574a85e"
> \ No newline at end of file
> diff --git a/recipes/cups/cups_1.2.7.bb b/recipes/cups/cups_1.2.7.bb
> deleted file mode 100644
> index 3f9c120..0000000
> --- a/recipes/cups/cups_1.2.7.bb
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -DESCRIPTION = "An Internet printing system for Unix."
> -SECTION = "console/utils"
> -LICENSE = "GPL LGPL"
> -DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
> -INC_PR = "r7"
> -PR = "${INC_PR}.1"
> -
> -SRC_URI = "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
> -	  "
> -
> -inherit autotools binconfig
> -
> -LDFLAGS += " -L${STAGING_LIBDIR} "
> -
> -EXTRA_OECONF = " \
> -                --enable-gnutls \
> -		--enable-dbus \
> -		--enable-browsing \
> -                --disable-openssl \
> -		--disable-tiff \
> -		--without-php \
> -		--without-perl \
> -		--without-python \
> -		--without-java \
> -               "
> -
> -
> -do_configure() {
> -	gnu-configize
> -	libtoolize --force
> -	oe_runconf
> -}
> -
> -do_compile () {
> -	sed -i s:STRIP:NOSTRIP: Makedefs
> -	sed -i s:serial:: backend/Makefile
> -
> -	echo "all:"    >  man/Makefile
> -	echo "install:" >> man/Makefile
> -
> -	oe_runmake "SSLLIBS=-lgnutls -L${STAGING_LIBDIR}" \
> -		   "LIBPNG=-lpng -lm -L${STAGING_LIBDIR}" \
> -		   "LIBJPEG=-ljpeg -L${STAGING_LIBDIR}" \
> -		   "LIBZ=-lz -L${STAGING_LIBDIR}" \
> -		   "-I."
> -}
> -
> -fakeroot do_install () {
> -	oe_runmake "DSTROOT=${D}" install
> -}
> -
> -do_stage () {
> -	install -d ${STAGING_INCDIR}/cups
> -	install ${S}/cups/*.h ${STAGING_INCDIR}/cups/
> -	install ${S}/filter/*.h ${STAGING_INCDIR}/cups/
> -	oe_libinstall -C cups -so libcups ${STAGING_LIBDIR}
> -	oe_libinstall -C filter -so libcupsimage ${STAGING_LIBDIR}
> -}
> -
> -FILES_${PN}-dbg += "${libdir}/cups/backend/.debug \
> -                    ${libdir}/cups/cgi-bin/.debug \
> -		    ${libdir}/cups/filter/.debug \
> -		    ${libdir}/cups/monitor/.debug \
> -		    ${libdir}/cups/notifier/.debug \
> -		    ${libdir}/cups/daemon/.debug \
> -		    "
> -#package the html for the webgui inside the main packages (~1MB uncompressed)
> -
> -FILES_${PN} += "${datadir}/doc/cups/images \
> -		${datadir}/doc/cups/*html \
> -		${datadir}/doc/cups/*.css \
> -                ${datadir}/icons/ \
> -	       "
> -
> -
> -
> -
> -
> -SRC_URI[md5sum] = "bf44783d9b46130bee9f2995e6055470"
> -SRC_URI[sha256sum] = "e7485d6b3dcbd338a2361aff66c516f8dfafc1c81ea5b01396f6ee5f365c4eb3"
> \ No newline at end of file
> diff --git a/recipes/cups/cups_1.3.8.bb b/recipes/cups/cups_1.3.8.bb
> deleted file mode 100644
> index fd37246..0000000
> --- a/recipes/cups/cups_1.3.8.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require cups.inc
> -
> -SRC_URI += "file://use_echo_only_in_init.patch"
> -PR = "${INC_PR}.1"
> -
> -DEFAULT_PREFERENCE = "-1"
> -
> -EXTRA_OECONF += " --disable-gssapi "
> -
> -SRC_URI[md5sum] = "90ed7449948994ad1b22b0b177ab6ba6"
> -SRC_URI[sha256sum] = "d488980f84ad0e6044a67859144306980624cafb654eb0cab071b3e46fee6e1d"
> diff --git a/recipes/cups/cups_1.4.3.bb b/recipes/cups/cups_1.4.3.bb
> deleted file mode 100644
> index f562725..0000000
> --- a/recipes/cups/cups_1.4.3.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -require cups14.inc
> -
> -SRC_URI += "file://use_echo_only_in_init.patch \
> -		    file://skip_tools.patch \
> -		    file://configure.patch \
> -			"
> -
> -SRC_URI[md5sum] = "e70b1c3f60143d7310c1d74c111a21ab"
> -SRC_URI[sha256sum] = "47a559b1c50192b94479ae7dab132ea0008727045d4993501cf0a6df0c64db97"
> -
> -PR = "r3"
> -
> -DEFAULT_PREFERENCE = "-1"
> -
> -EXTRA_OECONF += " --disable-gssapi --disable-largefile --enable-debug --disable-relro "
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem



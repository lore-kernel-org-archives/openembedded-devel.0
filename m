Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PpijF-0003GA-4n
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 15:51:41 +0100
Received: by iyj8 with SMTP id 8so1277642iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 06:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=nSbFoe5pqAOhzx1REnPK0Py6jrKJ+5inxgI2z5mo5fo=;
	b=BdI2VKE9F2kaWsd9OtPe/EiIgBFeAHVcqtjQQ/yRMOsHz29BNBVhCIu7fjRJOr5N6P
	c9EWXu8cpIdnJ5O+69i7ypphMnVpQtM1ewds1HZFdYG0mU0I1onBkZ8gXEkgNrg13/Dt
	X5/kkJmMkZiVkjYQ1kX9TzwDgTssJsYiEerOA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Dk8pGXZlJLXZ/4c91ZCoyfZDRj8br9+KlMPafhsgbxZWGcRsaE6+We2AzJRz0jqJ2f
	6Pl091hGbrCgblqIOpclKfCVJOkuAEpICqeAbxOPuMfBg6NcVtHrbM6VGrRZs0FTQNZW
	Jic9kl81JUPGXLAjUiCULWfMs0yMNXsvr4Ohg=
MIME-Version: 1.0
Received: by 10.42.180.131 with SMTP id bu3mr948179icb.366.1297867829424; Wed,
	16 Feb 2011 06:50:29 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Wed, 16 Feb 2011 06:50:29 -0800 (PST)
In-Reply-To: <1297855134-19216-3-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-3-git-send-email-otavio@ossystems.com.br>
Date: Wed, 16 Feb 2011 15:50:29 +0100
Message-ID: <AANLkTimd3pu-WH_0Co3Y-eHkJtyxunnTtsGdrdiwE4cD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 16 Feb 2011 14:51:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/16 Otavio Salvador <otavio@ossystems.com.br>:
> Drop versions not being in use:
>
> =A0- 1.1.23 and 1.2.7 - old and not preferred by any distro
> =A0- 1.3.8 and 1.4.3 - D_P -1 and not preferred by any distro
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/cups/cups-1.1.23/strftime_fix.patch =A0 =A0 =A0 =A0| =A0 26 --=
---
> =A0.../cups/cups-1.3.8/use_echo_only_in_init.patch =A0 =A0| =A0 11 --
> =A0recipes/cups/cups-1.4.3/configure.patch =A0 =A0 =A0 =A0 =A0 =A0| =A011=
7 --------------------
> =A0recipes/cups/cups-1.4.3/skip_tools.patch =A0 =A0 =A0 =A0 =A0 | =A0 51 =
---------
> =A0.../cups/cups-1.4.3/use_echo_only_in_init.patch =A0 =A0| =A0 11 --
> =A0recipes/cups/cups_1.1.23.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 51 ---------
> =A0recipes/cups/cups_1.2.7.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 80 -------------
> =A0recipes/cups/cups_1.3.8.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 11 --
> =A0recipes/cups/cups_1.4.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 15 ---
> =A09 files changed, 0 insertions(+), 373 deletions(-)
> =A0delete mode 100644 recipes/cups/cups-1.1.23/strftime_fix.patch
> =A0delete mode 100644 recipes/cups/cups-1.3.8/use_echo_only_in_init.patch
> =A0delete mode 100644 recipes/cups/cups-1.4.3/configure.patch
> =A0delete mode 100644 recipes/cups/cups-1.4.3/skip_tools.patch
> =A0delete mode 100644 recipes/cups/cups-1.4.3/use_echo_only_in_init.patch
> =A0delete mode 100644 recipes/cups/cups_1.1.23.bb
> =A0delete mode 100644 recipes/cups/cups_1.2.7.bb
> =A0delete mode 100644 recipes/cups/cups_1.3.8.bb
> =A0delete mode 100644 recipes/cups/cups_1.4.3.bb
>
> diff --git a/recipes/cups/cups-1.1.23/strftime_fix.patch b/recipes/cups/c=
ups-1.1.23/strftime_fix.patch
> deleted file mode 100644
> index 81f224f..0000000
> --- a/recipes/cups/cups-1.1.23/strftime_fix.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Index: cups-1.1.23/scheduler/classes.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- cups-1.1.23.orig/scheduler/classes.c
> -+++ cups-1.1.23/scheduler/classes.c
> -@@ -622,7 +622,7 @@ SaveAllClasses(void)
> -
> - =A0 curtime =3D time(NULL);
> - =A0 curdate =3D localtime(&curtime);
> -- =A0strftime(temp, sizeof(temp) - 1, CUPS_STRFTIME_FORMAT, curdate);
> -+ =A0strftime(temp, sizeof(temp) - 1, "%Y-%m-%d %H:%M", curdate);
> -
> - =A0 cupsFilePuts(fp, "# Class configuration file for " CUPS_SVERSION "\=
n");
> - =A0 cupsFilePrintf(fp, "# Written by cupsd on %s\n", temp);
> -Index: cups-1.1.23/scheduler/printers.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- cups-1.1.23.orig/scheduler/printers.c
> -+++ cups-1.1.23/scheduler/printers.c
> -@@ -1066,7 +1066,7 @@ SaveAllPrinters(void)
> -
> - =A0 curtime =3D time(NULL);
> - =A0 curdate =3D localtime(&curtime);
> -- =A0strftime(temp, sizeof(temp) - 1, CUPS_STRFTIME_FORMAT, curdate);
> -+ =A0strftime(temp, sizeof(temp) - 1, "%Y-%m-%d %H:%M", curdate);
> -
> - =A0 cupsFilePuts(fp, "# Printer configuration file for " CUPS_SVERSION =
"\n");
> - =A0 cupsFilePrintf(fp, "# Written by cupsd on %s\n", temp);
> diff --git a/recipes/cups/cups-1.3.8/use_echo_only_in_init.patch b/recipe=
s/cups/cups-1.3.8/use_echo_only_in_init.patch
> deleted file mode 100644
> index 21ff0e5..0000000
> --- a/recipes/cups/cups-1.3.8/use_echo_only_in_init.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- a/init/cups.sh.in.orig =A0 =A0 2008-10-04 16:50:46.000000000 -0300
> -+++ b/init/cups.sh.in =A02008-10-04 16:51:39.000000000 -0300
> -@@ -68,7 +68,7 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ECHO_ERROR=3D:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;
> -
> -- =A0 =A0 =A0Linux*)
> -+ =A0 =A0 =A0DISABLELinux*)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 IS_ON=3D/bin/true
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test -f /etc/init.d/functions; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 . /etc/init.d/functions
> diff --git a/recipes/cups/cups-1.4.3/configure.patch b/recipes/cups/cups-=
1.4.3/configure.patch
> deleted file mode 100644
> index 877e8d3..0000000
> --- a/recipes/cups/cups-1.4.3/configure.patch
> +++ /dev/null
> @@ -1,117 +0,0 @@
> ---- cups-1.4.3/configure.orig =A02010-04-08 11:14:19.092296014 +0200
> -+++ cups-1.4.3/configure =A0 =A0 =A0 2010-04-08 11:19:02.661417938 +0200
> -@@ -10940,114 +10940,6 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OPTIM=3D"-fPIC $OPTIM"
> - =A0 =A0 =A0 fi
> -
> -- =A0 =A0 =A0# The -fstack-protector option is available with some versi=
ons of
> -- =A0 =A0 =A0# GCC and adds "stack canaries" which detect when the retur=
n address
> -- =A0 =A0 =A0# has been overwritten, preventing many types of exploit at=
tacks.
> -- =A0 =A0 =A0{ echo "$as_me:$LINENO: checking if GCC supports -fstack-pr=
otector" >&5
> --echo $ECHO_N "checking if GCC supports -fstack-protector... $ECHO_C" >&=
6; }
> -- =A0 =A0 =A0OLDCFLAGS=3D"$CFLAGS"
> -- =A0 =A0 =A0CFLAGS=3D"$CFLAGS -fstack-protector"
> -- =A0 =A0 =A0cat >conftest.$ac_ext <<_ACEOF
> --/* confdefs.h. =A0*/
> --_ACEOF
> --cat confdefs.h >>conftest.$ac_ext
> --cat >>conftest.$ac_ext <<_ACEOF
> --/* end confdefs.h. =A0*/
> --
> --int
> --main ()
> --{
> --
> -- =A0;
> -- =A0return 0;
> --}
> --_ACEOF
> --rm -f conftest.$ac_objext conftest$ac_exeext
> --if { (ac_try=3D"$ac_link"
> --case "(($ac_try" in
> -- =A0*\"* | *\`* | *\\*) ac_try_echo=3D\$ac_try;;
> -- =A0*) ac_try_echo=3D$ac_try;;
> --esac
> --eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
> -- =A0(eval "$ac_link") 2>conftest.er1
> -- =A0ac_status=3D$?
> -- =A0grep -v '^ *+' conftest.er1 >conftest.err
> -- =A0rm -f conftest.er1
> -- =A0cat conftest.err >&5
> -- =A0echo "$as_me:$LINENO: \$? =3D $ac_status" >&5
> -- =A0(exit $ac_status); } && {
> -- =A0 =A0 =A0 test -z "$ac_c_werror_flag" ||
> -- =A0 =A0 =A0 test ! -s conftest.err
> -- =A0 =A0 =A0 } && test -s conftest$ac_exeext &&
> -- =A0 =A0 =A0 $as_test_x conftest$ac_exeext; then
> -- =A0OPTIM=3D"$OPTIM -fstack-protector"
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0{ echo "$as_me:$LINENO: result: yes" >&5
> --echo "${ECHO_T}yes" >&6; }
> --else
> -- =A0echo "$as_me: failed program was:" >&5
> --sed 's/^/| /' conftest.$ac_ext >&5
> --
> -- =A0 =A0 =A0{ echo "$as_me:$LINENO: result: no" >&5
> --echo "${ECHO_T}no" >&6; }
> --fi
> --
> --rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
> -- =A0 =A0 =A0conftest$ac_exeext conftest.$ac_ext
> -- =A0 =A0 =A0CFLAGS=3D"$OLDCFLAGS"
> --
> -- =A0 =A0 =A0# The -pie option is available with some versions of GCC an=
d adds
> -- =A0 =A0 =A0# randomization of addresses, which avoids another class of=
 exploits
> -- =A0 =A0 =A0# that depend on a fixed address for common functions.
> -- =A0 =A0 =A0{ echo "$as_me:$LINENO: checking if GCC supports -pie" >&5
> --echo $ECHO_N "checking if GCC supports -pie... $ECHO_C" >&6; }
> -- =A0 =A0 =A0OLDCFLAGS=3D"$CFLAGS"
> -- =A0 =A0 =A0CFLAGS=3D"$CFLAGS -pie -fPIE"
> -- =A0 =A0 =A0cat >conftest.$ac_ext <<_ACEOF
> --/* confdefs.h. =A0*/
> --_ACEOF
> --cat confdefs.h >>conftest.$ac_ext
> --cat >>conftest.$ac_ext <<_ACEOF
> --/* end confdefs.h. =A0*/
> --
> --int
> --main ()
> --{
> --
> -- =A0;
> -- =A0return 0;
> --}
> --_ACEOF
> --rm -f conftest.$ac_objext
> --if { (ac_try=3D"$ac_compile"
> --case "(($ac_try" in
> -- =A0*\"* | *\`* | *\\*) ac_try_echo=3D\$ac_try;;
> -- =A0*) ac_try_echo=3D$ac_try;;
> --esac
> --eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
> -- =A0(eval "$ac_compile") 2>conftest.er1
> -- =A0ac_status=3D$?
> -- =A0grep -v '^ *+' conftest.er1 >conftest.err
> -- =A0rm -f conftest.er1
> -- =A0cat conftest.err >&5
> -- =A0echo "$as_me:$LINENO: \$? =3D $ac_status" >&5
> -- =A0(exit $ac_status); } && {
> -- =A0 =A0 =A0 test -z "$ac_c_werror_flag" ||
> -- =A0 =A0 =A0 test ! -s conftest.err
> -- =A0 =A0 =A0 } && test -s conftest.$ac_objext; then
> -- =A0PIEFLAGS=3D"-pie -fPIE"
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0{ echo "$as_me:$LINENO: result: yes" >&5
> --echo "${ECHO_T}yes" >&6; }
> --else
> -- =A0echo "$as_me: failed program was:" >&5
> --sed 's/^/| /' conftest.$ac_ext >&5
> --
> -- =A0 =A0 =A0{ echo "$as_me:$LINENO: result: no" >&5
> --echo "${ECHO_T}no" >&6; }
> --fi
> --
> --rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> -- =A0 =A0 =A0CFLAGS=3D"$OLDCFLAGS"
> --
> - =A0 =A0 =A0 if test "x$with_optim" =3D x; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 # Add useful warning options for tracking d=
own problems...
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 OPTIM=3D"-Wall -Wno-format-y2k $OPTIM"
> diff --git a/recipes/cups/cups-1.4.3/skip_tools.patch b/recipes/cups/cups=
-1.4.3/skip_tools.patch
> deleted file mode 100644
> index 2721101..0000000
> --- a/recipes/cups/cups-1.4.3/skip_tools.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> ---- cups-1.4.3/ppdc/Makefile.orig =A0 =A0 =A02010-04-07 12:38:56.6503276=
99 +0200
> -+++ cups-1.4.3/ppdc/Makefile =A0 2010-04-07 12:40:05.842418876 +0200
> -@@ -243,8 +243,8 @@
> - =A0 =A0 =A0 $(CXX) $(ARCHFLAGS) $(LDFLAGS) -o genstrings genstrings.o \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 libcupsppdc.a ../cups/libcups.a $(LIBGSSAPI=
) $(SSLLIBS) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(DNSSDLIBS) $(COMMONLIBS) $(LIBZ)
> -- =A0 =A0 =A0echo Generating localization strings...
> -- =A0 =A0 =A0./genstrings >sample.c
> -+# =A0 =A0 echo Generating localization strings...
> -+# =A0 =A0 ./genstrings >sample.c
> -
> -
> - #
> -@@ -261,9 +261,9 @@
> - =A0 =A0 =A0 $(CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdc-static ppdc.o libcup=
sppdc.a \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ../cups/libcups.a $(LIBGSSAPI) $(SSLLIBS) $=
(DNSSDLIBS) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(COMMONLIBS) $(LIBZ)
> -- =A0 =A0 =A0echo Testing PPD compiler...
> -- =A0 =A0 =A0./ppdc-static -l en,fr -I ../data foo.drv
> -- =A0 =A0 =A0./ppdc-static -l en,fr -z -I ../data foo.drv
> -+# =A0 =A0 echo Testing PPD compiler...
> -+# =A0 =A0 ./ppdc-static -l en,fr -I ../data foo.drv
> -+# =A0 =A0 ./ppdc-static -l en,fr -z -I ../data foo.drv
> -
> -
> - #
> -@@ -291,15 +291,15 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(COMMONLIBS) $(LIBZ)
> - =A0 =A0 =A0 echo Testing PPD importer...
> - =A0 =A0 =A0 $(RM) -r ppd ppd2 sample-import.drv
> -- =A0 =A0 =A0./ppdc-static -I ../data sample.drv
> -- =A0 =A0 =A0./ppdi-static -I ../data -o sample-import.drv ppd/*
> -- =A0 =A0 =A0./ppdc-static -I ../data -d ppd2 sample-import.drv
> -- =A0 =A0 =A0if diff -qr ppd ppd2; then \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0echo PPD import OK; \
> -- =A0 =A0 =A0else \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0echo PPD import FAILED; \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0exit 1; \
> -- =A0 =A0 =A0fi
> -+# =A0 =A0 ./ppdc-static -I ../data sample.drv
> -+# =A0 =A0 ./ppdi-static -I ../data -o sample-import.drv ppd/*
> -+# =A0 =A0 ./ppdc-static -I ../data -d ppd2 sample-import.drv
> -+# =A0 =A0 if diff -qr ppd ppd2; then \
> -+# =A0 =A0 =A0 =A0 =A0 =A0 echo PPD import OK; \
> -+# =A0 =A0 else \
> -+# =A0 =A0 =A0 =A0 =A0 =A0 echo PPD import FAILED; \
> -+# =A0 =A0 =A0 =A0 =A0 =A0 exit 1; \
> -+# =A0 =A0 fi
> -
> -
> - #
> diff --git a/recipes/cups/cups-1.4.3/use_echo_only_in_init.patch b/recipe=
s/cups/cups-1.4.3/use_echo_only_in_init.patch
> deleted file mode 100644
> index 21ff0e5..0000000
> --- a/recipes/cups/cups-1.4.3/use_echo_only_in_init.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- a/init/cups.sh.in.orig =A0 =A0 2008-10-04 16:50:46.000000000 -0300
> -+++ b/init/cups.sh.in =A02008-10-04 16:51:39.000000000 -0300
> -@@ -68,7 +68,7 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ECHO_ERROR=3D:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;
> -
> -- =A0 =A0 =A0Linux*)
> -+ =A0 =A0 =A0DISABLELinux*)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 IS_ON=3D/bin/true
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test -f /etc/init.d/functions; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 . /etc/init.d/functions
> diff --git a/recipes/cups/cups_1.1.23.bb b/recipes/cups/cups_1.1.23.bb
> deleted file mode 100644
> index 877187f..0000000
> --- a/recipes/cups/cups_1.1.23.bb
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -DESCRIPTION =3D "An Internet printing system for Unix."
> -SECTION =3D "console/utils"
> -LICENSE =3D "GPL LGPL"
> -DEPENDS =3D "openssl jpeg libpng zlib fakeroot-native"
> -INC_PR =3D "r7"
> -PR =3D "${INC_PR}.1"
> -
> -SRC_URI =3D "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.=
bz2 \
> - =A0 =A0 =A0 =A0 =A0 file://strftime_fix.patch"
> -
> -inherit autotools binconfig
> -
> -LDFLAGS +=3D " -L${STAGING_LIBDIR} "
> -
> -do_compile () {
> - =A0 =A0 =A0 #Eeeks! Hack alert!
> - =A0 =A0 =A0 grep CUPS config.h.in~ | grep define >> config.h
> - =A0 =A0 =A0 sed -i s:STRIP:NOSTRIP: Makedefs
> - =A0 =A0 =A0 sed -i s:serial:: backend/Makefile
> -
> - =A0 =A0 =A0 oe_runmake "SSLLIBS=3D-lssl -lcrypto -L${STAGING_LIBDIR}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBPNG=3D-lpng -lm -L${STAGING_LIBD=
IR}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBJPEG=3D-ljpeg -L${STAGING_LIBDIR=
}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBZ=3D-lz -L${STAGING_LIBDIR}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"-I."
> -}
> -
> -fakeroot do_install () {
> - =A0 =A0 =A0 oe_runmake "DSTROOT=3D${D}" install
> -}
> -
> -do_stage () {
> - =A0 =A0 =A0 install -d ${STAGING_INCDIR}/cups
> - =A0 =A0 =A0 install ${S}/cups/*.h ${STAGING_INCDIR}/cups/
> - =A0 =A0 =A0 install ${S}/filter/*.h ${STAGING_INCDIR}/cups/
> - =A0 =A0 =A0 oe_libinstall -C cups -so libcups ${STAGING_LIBDIR}
> - =A0 =A0 =A0 oe_libinstall -C filter -so libcupsimage ${STAGING_LIBDIR}
> -}
> -
> -#package the html for the webgui inside the main packages (~1MB uncompre=
ssed)
> -FILES_${PN} +=3D "${datadir}/doc/cups/images \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/doc/cups/*html \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/doc/cups/*.css \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> -
> -
> -
> -
> -
> -SRC_URI[md5sum] =3D "4ce09b1dce09b6b9398af0daae9adf63"
> -SRC_URI[sha256sum] =3D "87da0f7b1e03236e183045f1e787957132658ead56c4b0f8=
0ac7f86c1574a85e"
> \ No newline at end of file
> diff --git a/recipes/cups/cups_1.2.7.bb b/recipes/cups/cups_1.2.7.bb
> deleted file mode 100644
> index 3f9c120..0000000
> --- a/recipes/cups/cups_1.2.7.bb
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -DESCRIPTION =3D "An Internet printing system for Unix."
> -SECTION =3D "console/utils"
> -LICENSE =3D "GPL LGPL"
> -DEPENDS =3D "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
> -INC_PR =3D "r7"
> -PR =3D "${INC_PR}.1"
> -
> -SRC_URI =3D "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.=
bz2 \
> - =A0 =A0 =A0 =A0 "
> -
> -inherit autotools binconfig
> -
> -LDFLAGS +=3D " -L${STAGING_LIBDIR} "
> -
> -EXTRA_OECONF =3D " \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-gnutls \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-dbus \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-browsing \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-openssl \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --disable-tiff \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-php \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-perl \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-python \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-java \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> -
> -
> -do_configure() {
> - =A0 =A0 =A0 gnu-configize
> - =A0 =A0 =A0 libtoolize --force
> - =A0 =A0 =A0 oe_runconf
> -}
> -
> -do_compile () {
> - =A0 =A0 =A0 sed -i s:STRIP:NOSTRIP: Makedefs
> - =A0 =A0 =A0 sed -i s:serial:: backend/Makefile
> -
> - =A0 =A0 =A0 echo "all:" =A0 =A0> =A0man/Makefile
> - =A0 =A0 =A0 echo "install:" >> man/Makefile
> -
> - =A0 =A0 =A0 oe_runmake "SSLLIBS=3D-lgnutls -L${STAGING_LIBDIR}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBPNG=3D-lpng -lm -L${STAGING_LIBD=
IR}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBJPEG=3D-ljpeg -L${STAGING_LIBDIR=
}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"LIBZ=3D-lz -L${STAGING_LIBDIR}" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"-I."
> -}
> -
> -fakeroot do_install () {
> - =A0 =A0 =A0 oe_runmake "DSTROOT=3D${D}" install
> -}
> -
> -do_stage () {
> - =A0 =A0 =A0 install -d ${STAGING_INCDIR}/cups
> - =A0 =A0 =A0 install ${S}/cups/*.h ${STAGING_INCDIR}/cups/
> - =A0 =A0 =A0 install ${S}/filter/*.h ${STAGING_INCDIR}/cups/
> - =A0 =A0 =A0 oe_libinstall -C cups -so libcups ${STAGING_LIBDIR}
> - =A0 =A0 =A0 oe_libinstall -C filter -so libcupsimage ${STAGING_LIBDIR}
> -}
> -
> -FILES_${PN}-dbg +=3D "${libdir}/cups/backend/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/cups/cgi-bin/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/filter/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/monitor/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/notifier/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/daemon/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> -#package the html for the webgui inside the main packages (~1MB uncompre=
ssed)
> -
> -FILES_${PN} +=3D "${datadir}/doc/cups/images \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/doc/cups/*html \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/doc/cups/*.css \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/icons/ \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0"
> -
> -
> -
> -
> -
> -SRC_URI[md5sum] =3D "bf44783d9b46130bee9f2995e6055470"
> -SRC_URI[sha256sum] =3D "e7485d6b3dcbd338a2361aff66c516f8dfafc1c81ea5b013=
96f6ee5f365c4eb3"
> \ No newline at end of file
> diff --git a/recipes/cups/cups_1.3.8.bb b/recipes/cups/cups_1.3.8.bb
> deleted file mode 100644
> index fd37246..0000000
> --- a/recipes/cups/cups_1.3.8.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require cups.inc
> -
> -SRC_URI +=3D "file://use_echo_only_in_init.patch"
> -PR =3D "${INC_PR}.1"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -EXTRA_OECONF +=3D " --disable-gssapi "
> -
> -SRC_URI[md5sum] =3D "90ed7449948994ad1b22b0b177ab6ba6"
> -SRC_URI[sha256sum] =3D "d488980f84ad0e6044a67859144306980624cafb654eb0ca=
b071b3e46fee6e1d"
> diff --git a/recipes/cups/cups_1.4.3.bb b/recipes/cups/cups_1.4.3.bb
> deleted file mode 100644
> index f562725..0000000
> --- a/recipes/cups/cups_1.4.3.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -require cups14.inc
> -
> -SRC_URI +=3D "file://use_echo_only_in_init.patch \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://skip_tools.patch \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://configure.patch \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> -
> -SRC_URI[md5sum] =3D "e70b1c3f60143d7310c1d74c111a21ab"
> -SRC_URI[sha256sum] =3D "47a559b1c50192b94479ae7dab132ea0008727045d499350=
1cf0a6df0c64db97"
> -
> -PR =3D "r3"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -EXTRA_OECONF +=3D " --disable-gssapi --disable-largefile --enable-debug =
--disable-relro "
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



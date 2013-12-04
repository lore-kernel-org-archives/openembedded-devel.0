Return-Path: <koen.kooi@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 24C5A6DEF3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 08:17:55 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id ca18so7829457wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 00:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=EvzRYOJ01SFoABd70uPwDV/xFPqSRmK9xNbc+RF326E=;
	b=tpIK2HWnMLhdF994hViURgS6AFMhp2eTdVVFdTD8+0pVzUd6f90+STkCeXp/uzg2T/
	qPGaB0JgChLtI3EVZ0+UGNRqkcryBt/EnE2oW2wQXNCPQiAcA1cQBO3FUgKJj9OYB9/k
	zcn+Ky+6hpGAvYZH5/qIlvReWLz4MUOHB3v4DGEjP1n++TDHyV3sZ+W8Nb7GYD3He429
	S2JQugizpRx0Lez/kybmneCoBl5TaMe2ysrqRLXU/MKVtP1t61d9jkVtiZ27xy/g7pm/
	5EDHbrEuZM+gwynF2vBCSEuNz83Fc1dEwULAzNpdAyluq+C1Rh0gsDjSJYolblWjjVy2
	XdFw==
X-Received: by 10.194.187.101 with SMTP id fr5mr944308wjc.76.1386145074789;
	Wed, 04 Dec 2013 00:17:54 -0800 (PST)
Received: from ?IPv6:2001:610:612::41bf:ed69:95cd:91fe?
	([2001:610:612:0:41bf:ed69:95cd:91fe])
	by mx.google.com with ESMTPSA id g16sm4657016wiw.6.2013.12.04.00.17.52
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Dec 2013 00:17:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Koen Kooi <koen.kooi@gmail.com>
In-Reply-To: <1386144039-26620-1-git-send-email-fathi.boudra@linaro.org>
Date: Wed, 4 Dec 2013 09:19:13 +0100
Message-Id: <1FB7EC79-6063-4FE7-8027-D785F654D4D8@dominion.thruhere.net>
References: <1386144039-26620-1-git-send-email-fathi.boudra@linaro.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
X-Mailer: Apple Mail (2.1822)
Cc: "openembedded-devel@lists.openembedded.org List"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] acpica: update recipe to 20131115 release
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
X-List-Received-Date: Wed, 04 Dec 2013 08:17:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 dec. 2013, om 09:00 heeft Fathi Boudra <fathi.boudra@linaro.org> =
het volgende geschreven:

> drop fix-parallel-build.patch
> update md5sum/sha256sum
> refresh no-werro.patch
>=20
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

Minor nit: the diff is a bit hard to read, could you use -M next time =
for updates?

Acked-by: Koen Kooi <koen.kooi@linaro.org>

> ---
> meta-oe/recipes-extended/acpica/acpica_20130823.bb | 37 ----------
> meta-oe/recipes-extended/acpica/acpica_20131115.bb | 36 ++++++++++
> .../acpica/files/fix-parallel-build.patch          | 80 =
----------------------
> .../recipes-extended/acpica/files/no-werror.patch  | 26 +++----
> 4 files changed, 47 insertions(+), 132 deletions(-)
> delete mode 100644 meta-oe/recipes-extended/acpica/acpica_20130823.bb
> create mode 100644 meta-oe/recipes-extended/acpica/acpica_20131115.bb
> delete mode 100644 =
meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch
>=20
> diff --git a/meta-oe/recipes-extended/acpica/acpica_20130823.bb =
b/meta-oe/recipes-extended/acpica/acpica_20130823.bb
> deleted file mode 100644
> index 15dbeba..0000000
> --- a/meta-oe/recipes-extended/acpica/acpica_20130823.bb
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -SUMMARY =3D "ACPICA tools for the development and debug of ACPI =
tables"
> -DESCRIPTION =3D "The ACPI Component Architecture (ACPICA) project =
provides an \
> -OS-independent reference implementation of the Advanced Configuration =
and \
> -Power Interface Specification (ACPI). ACPICA code contains those =
portions of \
> -ACPI meant to be directly integrated into the host OS as a =
kernel-resident \
> -subsystem, and a small set of tools to assist in developing and =
debugging \
> -ACPI tables."
> -HOMEPAGE =3D "http://www.acpica.org/"
> -SECTION =3D "console/tools"
> -LICENSE =3D "BSD | GPLv2"
> -LIC_FILES_CHKSUM =3D =
"file://generate/unix/readme.txt;md5=3D204407e197c1a01154a48f6c6280c3aa"
> -DEPENDS =3D "bison flex"
> -PR=3D"r1"
> -
> -SRC_URI =3D =
"https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
> -    file://cross-compile.patch \
> -    file://no-werror.patch \
> -    file://fix-parallel-build.patch"
> -
> -SRC_URI[md5sum] =3D "6694a6a5baa4a23fba892b8ad23f3959"
> -SRC_URI[sha256sum] =3D =
"dcaf8bcdd146006e7c480d4249e014e38eb2ae3e4d2d40f90ec454312cc7e4d1"
> -
> -S =3D "${WORKDIR}/acpica-unix2-${PV}"
> -
> -EXTRA_OEMAKE =3D "'OPT_CFLAGS=3D-Wall'"
> -
> -do_install() {
> -    install -D -p -m0755 generate/unix/bin*/iasl ${D}${bindir}/iasl
> -    install -D -p -m0755 generate/unix/bin*/acpibin =
${D}${bindir}/acpibin
> -    install -D -p -m0755 generate/unix/bin*/acpiexec =
${D}${bindir}/acpiexec
> -    install -D -p -m0755 generate/unix/bin*/acpihelp =
${D}${bindir}/acpihelp
> -    install -D -p -m0755 generate/unix/bin*/acpinames =
${D}${bindir}/acpinames
> -    install -D -p -m0755 generate/unix/bin*/acpisrc =
${D}${bindir}/acpisrc
> -    install -D -p -m0755 generate/unix/bin*/acpixtract =
${D}${bindir}/acpixtract
> -}
> -
> -COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
> diff --git a/meta-oe/recipes-extended/acpica/acpica_20131115.bb =
b/meta-oe/recipes-extended/acpica/acpica_20131115.bb
> new file mode 100644
> index 0000000..8c9ecd4
> --- /dev/null
> +++ b/meta-oe/recipes-extended/acpica/acpica_20131115.bb
> @@ -0,0 +1,36 @@
> +SUMMARY =3D "ACPICA tools for the development and debug of ACPI =
tables"
> +DESCRIPTION =3D "The ACPI Component Architecture (ACPICA) project =
provides an \
> +OS-independent reference implementation of the Advanced Configuration =
and \
> +Power Interface Specification (ACPI). ACPICA code contains those =
portions of \
> +ACPI meant to be directly integrated into the host OS as a =
kernel-resident \
> +subsystem, and a small set of tools to assist in developing and =
debugging \
> +ACPI tables."
> +HOMEPAGE =3D "http://www.acpica.org/"
> +SECTION =3D "console/tools"
> +LICENSE =3D "BSD | GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://generate/unix/readme.txt;md5=3D204407e197c1a01154a48f6c6280c3aa"
> +DEPENDS =3D "bison flex"
> +
> +SRC_URI =3D =
"https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
> +    file://cross-compile.patch \
> +    file://no-werror.patch \
> +    "
> +
> +SRC_URI[md5sum] =3D "1bd5b14c4c567ca2a113c05f4b28f29c"
> +SRC_URI[sha256sum] =3D =
"d699a880b84e04205eda2d5ad048c1c38a57289240caa5f0fb7ebdcd3aac83d2"
> +
> +S =3D "${WORKDIR}/acpica-unix2-${PV}"
> +
> +EXTRA_OEMAKE =3D "'OPT_CFLAGS=3D-Wall'"
> +
> +do_install() {
> +    install -D -p -m0755 generate/unix/bin*/iasl ${D}${bindir}/iasl
> +    install -D -p -m0755 generate/unix/bin*/acpibin =
${D}${bindir}/acpibin
> +    install -D -p -m0755 generate/unix/bin*/acpiexec =
${D}${bindir}/acpiexec
> +    install -D -p -m0755 generate/unix/bin*/acpihelp =
${D}${bindir}/acpihelp
> +    install -D -p -m0755 generate/unix/bin*/acpinames =
${D}${bindir}/acpinames
> +    install -D -p -m0755 generate/unix/bin*/acpisrc =
${D}${bindir}/acpisrc
> +    install -D -p -m0755 generate/unix/bin*/acpixtract =
${D}${bindir}/acpixtract
> +}
> +
> +COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
> diff --git =
a/meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch =
b/meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch
> deleted file mode 100644
> index 42e3fb1..0000000
> --- a/meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -diff --git a/generate/unix/iasl/Makefile =
b/generate/unix/iasl/Makefile
> -index e9520ed..1b73d7a 100644
> ---- a/generate/unix/iasl/Makefile
> -+++ b/generate/unix/iasl/Makefile
> -@@ -212,13 +212,10 @@ INTERMEDIATES =3D \
> - MISC =3D \
> - 	$(OBJDIR)/aslcompilerparse.h\
> - 	$(OBJDIR)/aslcompiler.y.h\
> --	$(OBJDIR)/aslcompilerparse.output\
> - 	$(OBJDIR)/dtparserparse.h\
> - 	$(OBJDIR)/dtparser.y.h\
> --	$(OBJDIR)/dtparserparse.output\
> - 	$(OBJDIR)/prparserparse.h\
> --	$(OBJDIR)/prparser.y.h\
> --	$(OBJDIR)/prparserparse.output
> -+	$(OBJDIR)/prparser.y.h
> -=20
> - #
> - # Flags specific to iASL compiler
> -@@ -240,21 +237,29 @@ include ../Makefile.rules
> - $(OBJDIR)/aslcompilerlex.c :   $(ASL_COMPILER)/aslcompiler.l =
$(ASL_COMPILER)/aslsupport.l
> - 	$(LEX) $(LFLAGS) -PAslCompiler -o$@ =
$(ASL_COMPILER)/aslcompiler.l
> -=20
> --$(OBJDIR)/aslcompilerparse.c $(OBJDIR)/aslcompilerparse.h : =
$(ASL_COMPILER)/aslcompiler.y
> -+$(OBJDIR)/aslcompilerparse.c : $(ASL_COMPILER)/aslcompiler.y
> - 	$(YACC) $(YFLAGS) -pAslCompiler -o$@ $?
> -=20
> - $(OBJDIR)/dtparserlex.c :      $(ASL_COMPILER)/dtparser.l
> - 	$(LEX) $(LFLAGS) -PDtParser -o$@ $?
> -=20
> --$(OBJDIR)/dtparserparse.c $(OBJDIR)/dtparserparse.h : =
$(ASL_COMPILER)/dtparser.y
> -+$(OBJDIR)/dtparserparse.c : $(ASL_COMPILER)/dtparser.y
> - 	$(YACC) $(YFLAGS) -pDtParser -o$@ $?
> -=20
> - $(OBJDIR)/prparserlex.c :      $(ASL_COMPILER)/prparser.l
> - 	$(LEX) $(LFLAGS) -PPrParser -o$@ $?
> -=20
> --$(OBJDIR)/prparserparse.c $(OBJDIR)/prparserparse.h : =
$(ASL_COMPILER)/prparser.y
> -+$(OBJDIR)/prparserparse.c : $(ASL_COMPILER)/prparser.y
> - 	$(YACC) $(YFLAGS) -pPrParser -o$@ $?
> -=20
> -+$(OBJDIR)/aslcompilerparse.h : $(OBJDIR)/aslcompilerparse.c
> -+	touch $@
> -+
> -+$(OBJDIR)/dtparserparse.h : $(OBJDIR)/dtparserparse.c
> -+	touch $@
> -+
> -+$(OBJDIR)/prparserparse.h:  $(OBJDIR)/prparserparse.c
> -+	touch $@
> -=20
> - #
> - # Rename the headers produced by bison/yacc
> -@@ -279,19 +284,21 @@ $(OBJDIR)/prparser.y.h: =
$(OBJDIR)/prparserparse.h
> - # by the utilities above and they are not necessarily ANSI C, etc.
> - #
> - $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
> --	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
> -=20
> - $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
> --	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
> -=20
> - $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
> --	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
> -=20
> - $(OBJDIR)/dtparserparse.o :    $(OBJDIR)/dtparserparse.c
> --	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
> -=20
> - $(OBJDIR)/prparserlex.o :      $(OBJDIR)/prparserlex.c
> --	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
> -=20
> - $(OBJDIR)/prparserparse.o :    $(OBJDIR)/prparserparse.c
> --	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $<
> -+
> -+$(OBJECTS): $(HEADERS)
> diff --git a/meta-oe/recipes-extended/acpica/files/no-werror.patch =
b/meta-oe/recipes-extended/acpica/files/no-werror.patch
> index 9f96552..5d28f47 100644
> --- a/meta-oe/recipes-extended/acpica/files/no-werror.patch
> +++ b/meta-oe/recipes-extended/acpica/files/no-werror.patch
> @@ -8,29 +8,25 @@ Author: Fathi Boudra <fathi.boudra@linaro.org>
>=20
> --- a/generate/unix/iasl/Makefile
> +++ b/generate/unix/iasl/Makefile
> -@@ -279,19 +279,19 @@ $(OBJDIR)/prparser.y.h: $(OBJDIR)/prpars
> +@@ -266,19 +266,19 @@ $(OBJDIR)/prparser.y.h: $(OBJDIR)/prpars
>  # by the utilities above and they are not necessarily ANSI C, etc.
>  #
>  $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
> --	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> +-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
> ++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
>=20
>  $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
> --	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> +-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
> ++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
>=20
>  $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
> --	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> +-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
> ++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
>=20
>  $(OBJDIR)/dtparserparse.o :    $(OBJDIR)/dtparserparse.c
> --	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> +-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
> ++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
>=20
>  $(OBJDIR)/prparserlex.o :      $(OBJDIR)/prparserlex.c
> --	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> -=20
> - $(OBJDIR)/prparserparse.o :    $(OBJDIR)/prparserparse.c
> --	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $?
> -+	$(CC) -c $(CFLAGS) -Wall -o$@ $?
> +-	$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
> ++	$(CC) -c $(CFLAGS) -Wall -o$@ $<
> --=20
> 1.8.1.2
>=20
>=20



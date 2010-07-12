Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OYCZK-00036X-If
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 08:32:48 +0200
Received: by bwz10 with SMTP id 10so2614676bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 23:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=C0JTsYNC8FQVXFayXcD+C0/UNBKUmotRUbAw/d0BN6E=;
	b=FvUf2re3ZK7pA9spcz0eq61iR+IJx6dC4U5+45KVeJOAPh4irhtGSw4+yskLnbZNl8
	gWydvlVgRswyehuLatwT68GYY7ACx0VtPa24zBTeany4PrbiKmhU5pJLzS7wWyE2vI4+
	kchpmHl4cS6sPNrVh2WwlNdbWP7UPUOYMwWfI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GNUbPZgJ4eCG9YTt3J/l7D1tUQw8p+qUTS8VwXJosM3mNno/yavr1cnb6OFXDljnOY
	MGV0/49UgTtyaAO9b6wdZGW5KPkCCO/mBUY0PBvp9FcNYu+nBqMpWlSp2D6Z2fmmpRo9
	owGQux3WEDugsICe4Qlur+06bQ1rUL90/g5xE=
MIME-Version: 1.0
Received: by 10.204.47.38 with SMTP id l38mr9815205bkf.154.1278916072546; Sun, 
	11 Jul 2010 23:27:52 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Sun, 11 Jul 2010 23:27:52 -0700 (PDT)
In-Reply-To: <AANLkTikZcDFs2duycC7tzPCVdu6-8vqjQKF_etRBGiAR@mail.gmail.com>
References: <AANLkTinu9HQ1P7ppw_mBT5lX2zUuZ31QIL-sPQDdkPqM@mail.gmail.com>
	<1278833542-16021-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikZcDFs2duycC7tzPCVdu6-8vqjQKF_etRBGiAR@mail.gmail.com>
Date: Mon, 12 Jul 2010 08:27:52 +0200
Message-ID: <AANLkTikaTTK2ydMB4WuP2X5MpHybcQYCqyRNXQpoMt11@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc 4.1.x: patch Makefile.in for cross compile badness
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
X-List-Received-Date: Mon, 12 Jul 2010 06:32:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/12 Khem Raj <raj.khem@gmail.com>:
> On Sun, Jul 11, 2010 at 12:32 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> When compiling gcc target code make passes -I(GMPINC)
>> but this one points to the host dir (it is set to HOST_GMPINC
>> which in oe points to tmp/sysroots/i686-linux/usr/include)
>> This patch breaks the env var $(INCLUDES) in two
>> and only uses the TARGET specific part for compiling libgcc
>> and the crt stuff.
>>
>> This has been fully tested with gcc 4.1.2. For 4.1.0 and 4.1.0 it is
>> verified that the patch applies properly
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>
>
> Please bump PR too.

Will do. Thanks for the Ack.
>
>> ---
>>
>> see also =A0the thread
>> [RFC] gcc patch to avoid host include when compiling gcc-cross
>> on the oe ML
>>
>> I'll apply if I get two acks. After that I'll try to find time to
>> port it to newer versions too (but if someone else would like to
>> give that a stab, be my guest).
>> ---
>> =A0recipes/gcc/gcc-4.1.0.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A04 ++-
>> =A0recipes/gcc/gcc-4.1.0/Makefile.in.patch | =A0 47 ++++++++++++++++++++=
+++++++++++
>> =A0recipes/gcc/gcc-4.1.1.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
>> =A0recipes/gcc/gcc-4.1.1/Makefile.in.patch | =A0 47 ++++++++++++++++++++=
+++++++++++
>> =A0recipes/gcc/gcc-4.1.2.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
>> =A0recipes/gcc/gcc-4.1.2/Makefile.in.patch | =A0 47 ++++++++++++++++++++=
+++++++++++
>> =A06 files changed, 146 insertions(+), 1 deletions(-)
>> =A0create mode 100644 recipes/gcc/gcc-4.1.0/Makefile.in.patch
>> =A0create mode 100644 recipes/gcc/gcc-4.1.1/Makefile.in.patch
>> =A0create mode 100644 recipes/gcc/gcc-4.1.2/Makefile.in.patch
>>
>> diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
>> index bfaf699..34d3502 100644
>> --- a/recipes/gcc/gcc-4.1.0.inc
>> +++ b/recipes/gcc/gcc-4.1.0.inc
>> @@ -11,7 +11,9 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar=
.bz2;name=3Darchive \
>> =A0 =A0 =A0 =A0file://arm-nolibfloat.patch \
>> =A0 =A0 =A0 =A0file://arm-softfloat.patch \
>> =A0 =A0 =A0 =A0file://zecke-xgcc-cpp.patch \
>> - =A0 =A0file://pr34130.patch"
>> + =A0 =A0 =A0 file://pr34130.patch \
>> + =A0 =A0 =A0 file://Makefile.in.patch \
>> + =A0 =A0 =A0 =A0"
>>
>> =A0SRC_URI_append_fail-fast =3D " file://zecke-no-host-includes.patch "
>>
>> diff --git a/recipes/gcc/gcc-4.1.0/Makefile.in.patch b/recipes/gcc/gcc-4=
.1.0/Makefile.in.patch
>> new file mode 100644
>> index 0000000..140116a
>> --- /dev/null
>> +++ b/recipes/gcc/gcc-4.1.0/Makefile.in.patch
>> @@ -0,0 +1,47 @@
>> +Index: gcc-4.1.2/gcc/Makefile.in
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.1.2.orig/gcc/Makefile.in
>> ++++ gcc-4.1.2/gcc/Makefile.in
>> +@@ -405,7 +405,7 @@ LIMITS_H_TEST =3D [ -f $(SYSTEM_HEADER_DIR
>> + TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
>> +
>> + xmake_file=3D@xmake_file@
>> +-tmake_file=3D@tmake_file@
>> ++tmake_file=3D@tmake_file@ /home/frans/oe/tmp_angstrom/work/nios2-linux=
/gcc-cross-4.1.2-r22.1/temp/t-oe
>> + out_file=3D$(srcdir)/config/@out_file@
>> + out_object_file=3D@out_object_file@
>> + md_file=3D$(srcdir)/config/@md_file@
>> +@@ -548,7 +548,7 @@ LIBGCC2_INCLUDES =3D
>> + TARGET_LIBGCC2_CFLAGS =3D
>> +
>> + # Options to use when compiling crtbegin/end.
>> +-CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -=
g0 \
>> ++CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CF=
LAGS) -g0 \
>> + =A0 -finhibit-size-directive -fno-inline-functions -fno-exceptions \
>> + =A0 -fno-zero-initialized-in-bss -fno-unit-at-a-time \
>> + =A0 $(INHIBIT_LIBC_CFLAGS)
>> +@@ -845,9 +845,13 @@ BUILD_VARRAY =3D build/varray.o
>> + # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
>> + # currently being compiled, in both source trees, to be examined as we=
ll.
>> + # libintl.h will be found in ../intl if we are using the included libi=
ntl.
>> +-INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
>> ++#
>> ++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the h=
ost
>> ++# include dir) is used for compiling libgcc.a
>> ++TARGET_INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
>> + =A0 =A0 =A0 =A0 =A0-I$(srcdir)/../include @INCINTL@ \
>> +- =A0 =A0 =A0 =A0 $(CPPINC) $(GMPINC)
>> ++ =A0 =A0 =A0 =A0 $(CPPINC)
>> ++INCLUDES =3D $(TARGET_INCLUDES) $(GMPINC)
>> +
>> + .c.o:
>> + =A0 =A0 =A0 $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
>> +@@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
>> + =A0 =A0 =A0 $(MAKE) \
>> + =A0 =A0 =A0 =A0 CFLAGS=3D"$(CFLAGS) $(WARN_CFLAGS)" \
>> + =A0 =A0 =A0 =A0 CONFIG_H=3D"$(TCONFIG_H)" TM_H=3D"$(TM_H)" \
>> +- =A0 =A0 =A0 =A0INCLUDES=3D"$(INCLUDES)" \
>> ++ =A0 =A0 =A0 =A0INCLUDES=3D"$(TARGET_INCLUDES)" \
>> + =A0 =A0 =A0 =A0 MAKEOVERRIDES=3D \
>> + =A0 =A0 =A0 =A0 -f libgcc.mk all
>> +
>> diff --git a/recipes/gcc/gcc-4.1.1.inc b/recipes/gcc/gcc-4.1.1.inc
>> index 3b813b0..19f2423 100644
>> --- a/recipes/gcc/gcc-4.1.1.inc
>> +++ b/recipes/gcc/gcc-4.1.1.inc
>> @@ -32,6 +32,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar=
.bz2;name=3Darchive \
>> =A0 =A0 =A0 =A0 file://gcc-4.1.1-e300cx.patch \
>> =A0 =A0 =A0 =A0 file://pr34130.patch \
>> =A0 =A0 =A0 =A0file://sed-fixinc-backslash.patch \
>> + =A0 =A0 =A0 file://Makefile.in.patch \
>> =A0 =A0 =A0 =A0"
>>
>> =A0SRC_URI_append_sh3 =A0=3D " file://sh3-installfix-fixheaders.patch "
>> diff --git a/recipes/gcc/gcc-4.1.1/Makefile.in.patch b/recipes/gcc/gcc-4=
.1.1/Makefile.in.patch
>> new file mode 100644
>> index 0000000..140116a
>> --- /dev/null
>> +++ b/recipes/gcc/gcc-4.1.1/Makefile.in.patch
>> @@ -0,0 +1,47 @@
>> +Index: gcc-4.1.2/gcc/Makefile.in
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.1.2.orig/gcc/Makefile.in
>> ++++ gcc-4.1.2/gcc/Makefile.in
>> +@@ -405,7 +405,7 @@ LIMITS_H_TEST =3D [ -f $(SYSTEM_HEADER_DIR
>> + TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
>> +
>> + xmake_file=3D@xmake_file@
>> +-tmake_file=3D@tmake_file@
>> ++tmake_file=3D@tmake_file@ /home/frans/oe/tmp_angstrom/work/nios2-linux=
/gcc-cross-4.1.2-r22.1/temp/t-oe
>> + out_file=3D$(srcdir)/config/@out_file@
>> + out_object_file=3D@out_object_file@
>> + md_file=3D$(srcdir)/config/@md_file@
>> +@@ -548,7 +548,7 @@ LIBGCC2_INCLUDES =3D
>> + TARGET_LIBGCC2_CFLAGS =3D
>> +
>> + # Options to use when compiling crtbegin/end.
>> +-CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -=
g0 \
>> ++CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CF=
LAGS) -g0 \
>> + =A0 -finhibit-size-directive -fno-inline-functions -fno-exceptions \
>> + =A0 -fno-zero-initialized-in-bss -fno-unit-at-a-time \
>> + =A0 $(INHIBIT_LIBC_CFLAGS)
>> +@@ -845,9 +845,13 @@ BUILD_VARRAY =3D build/varray.o
>> + # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
>> + # currently being compiled, in both source trees, to be examined as we=
ll.
>> + # libintl.h will be found in ../intl if we are using the included libi=
ntl.
>> +-INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
>> ++#
>> ++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the h=
ost
>> ++# include dir) is used for compiling libgcc.a
>> ++TARGET_INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
>> + =A0 =A0 =A0 =A0 =A0-I$(srcdir)/../include @INCINTL@ \
>> +- =A0 =A0 =A0 =A0 $(CPPINC) $(GMPINC)
>> ++ =A0 =A0 =A0 =A0 $(CPPINC)
>> ++INCLUDES =3D $(TARGET_INCLUDES) $(GMPINC)
>> +
>> + .c.o:
>> + =A0 =A0 =A0 $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
>> +@@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
>> + =A0 =A0 =A0 $(MAKE) \
>> + =A0 =A0 =A0 =A0 CFLAGS=3D"$(CFLAGS) $(WARN_CFLAGS)" \
>> + =A0 =A0 =A0 =A0 CONFIG_H=3D"$(TCONFIG_H)" TM_H=3D"$(TM_H)" \
>> +- =A0 =A0 =A0 =A0INCLUDES=3D"$(INCLUDES)" \
>> ++ =A0 =A0 =A0 =A0INCLUDES=3D"$(TARGET_INCLUDES)" \
>> + =A0 =A0 =A0 =A0 MAKEOVERRIDES=3D \
>> + =A0 =A0 =A0 =A0 -f libgcc.mk all
>> +
>> diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
>> index 3b6cf30..8771e18 100644
>> --- a/recipes/gcc/gcc-4.1.2.inc
>> +++ b/recipes/gcc/gcc-4.1.2.inc
>> @@ -29,6 +29,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar=
.bz2;name=3Darchive \
>> =A0 =A0 =A0 =A0file://gfortran.patch \
>> =A0 =A0 =A0 =A0 file://gcc-4.0.2-e300c2c3.patch \
>> =A0 =A0 =A0 =A0 file://pr34130.patch \
>> + =A0 =A0 =A0 file://Makefile.in.patch \
>> =A0 =A0 =A0 =A0"
>>
>> =A0SRC_URI_append_sh3 =A0=3D " file://sh3-installfix-fixheaders.patch "
>> diff --git a/recipes/gcc/gcc-4.1.2/Makefile.in.patch b/recipes/gcc/gcc-4=
.1.2/Makefile.in.patch
>> new file mode 100644
>> index 0000000..140116a
>> --- /dev/null
>> +++ b/recipes/gcc/gcc-4.1.2/Makefile.in.patch
>> @@ -0,0 +1,47 @@
>> +Index: gcc-4.1.2/gcc/Makefile.in
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.1.2.orig/gcc/Makefile.in
>> ++++ gcc-4.1.2/gcc/Makefile.in
>> +@@ -405,7 +405,7 @@ LIMITS_H_TEST =3D [ -f $(SYSTEM_HEADER_DIR
>> + TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
>> +
>> + xmake_file=3D@xmake_file@
>> +-tmake_file=3D@tmake_file@
>> ++tmake_file=3D@tmake_file@ /home/frans/oe/tmp_angstrom/work/nios2-linux=
/gcc-cross-4.1.2-r22.1/temp/t-oe
>> + out_file=3D$(srcdir)/config/@out_file@
>> + out_object_file=3D@out_object_file@
>> + md_file=3D$(srcdir)/config/@md_file@
>> +@@ -548,7 +548,7 @@ LIBGCC2_INCLUDES =3D
>> + TARGET_LIBGCC2_CFLAGS =3D
>> +
>> + # Options to use when compiling crtbegin/end.
>> +-CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -=
g0 \
>> ++CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CF=
LAGS) -g0 \
>> + =A0 -finhibit-size-directive -fno-inline-functions -fno-exceptions \
>> + =A0 -fno-zero-initialized-in-bss -fno-unit-at-a-time \
>> + =A0 $(INHIBIT_LIBC_CFLAGS)
>> +@@ -845,9 +845,13 @@ BUILD_VARRAY =3D build/varray.o
>> + # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
>> + # currently being compiled, in both source trees, to be examined as we=
ll.
>> + # libintl.h will be found in ../intl if we are using the included libi=
ntl.
>> +-INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
>> ++#
>> ++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the h=
ost
>> ++# include dir) is used for compiling libgcc.a
>> ++TARGET_INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
>> + =A0 =A0 =A0 =A0 =A0-I$(srcdir)/../include @INCINTL@ \
>> +- =A0 =A0 =A0 =A0 $(CPPINC) $(GMPINC)
>> ++ =A0 =A0 =A0 =A0 $(CPPINC)
>> ++INCLUDES =3D $(TARGET_INCLUDES) $(GMPINC)
>> +
>> + .c.o:
>> + =A0 =A0 =A0 $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
>> +@@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
>> + =A0 =A0 =A0 $(MAKE) \
>> + =A0 =A0 =A0 =A0 CFLAGS=3D"$(CFLAGS) $(WARN_CFLAGS)" \
>> + =A0 =A0 =A0 =A0 CONFIG_H=3D"$(TCONFIG_H)" TM_H=3D"$(TM_H)" \
>> +- =A0 =A0 =A0 =A0INCLUDES=3D"$(INCLUDES)" \
>> ++ =A0 =A0 =A0 =A0INCLUDES=3D"$(TARGET_INCLUDES)" \
>> + =A0 =A0 =A0 =A0 MAKEOVERRIDES=3D \
>> + =A0 =A0 =A0 =A0 -f libgcc.mk all
>> +
>> --
>> 1.6.4.2
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



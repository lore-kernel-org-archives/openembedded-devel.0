Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OXTv6-0005MN-FD
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Jul 2010 08:52:18 +0200
Received: by bwz10 with SMTP id 10so1852858bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 23:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RrXz/U69dBla7njUU4+cslFkarMPK55IfJpjug09CVM=;
	b=Od0XXHyE7EeEYig2AnXIpxPGDRCKm2w4/MI8CfHlawpRtMdzB3wk9IDF+AIvTsMqU+
	SZAG7QEbLbo04iQ9qP5xgxlEGyWWslMrw7KJJcQHas2Ft2wOUzDDaSzpOb2NSu5Vsbnu
	efAfoOLqYfaVf+AHn8aOgjaHzBWvL/DTPDWvU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EZmX7YFN+fJjlbm3Q6FtT3ok0wuHODTxKRA7udebL8s0b3FKWqrgCwdv7RvOGH9dat
	t/X4AoFR3WuWK2acQTt7NVRWoAlOkVC5ICHRzs6ATmDAEb69/U7b/dsTkXFJ2wIIjjbz
	xOl+BB2BEYNsy906BpAvfsdqJwr0fy68RoXow=
MIME-Version: 1.0
Received: by 10.204.48.75 with SMTP id q11mr8426284bkf.0.1278744444163; Fri, 
	09 Jul 2010 23:47:24 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Fri, 9 Jul 2010 23:47:24 -0700 (PDT)
In-Reply-To: <AANLkTik1KwzaMkn6ZBH9-BkMVPb09p_1SSjJClwJxsMS@mail.gmail.com>
References: <AANLkTilZLkPIUyR-9VUjtukyfTDo7KzcAPt0p0og_zCD@mail.gmail.com>
	<AANLkTik1KwzaMkn6ZBH9-BkMVPb09p_1SSjJClwJxsMS@mail.gmail.com>
Date: Sat, 10 Jul 2010 08:47:24 +0200
Message-ID: <AANLkTinu9HQ1P7ppw_mBT5lX2zUuZ31QIL-sPQDdkPqM@mail.gmail.com>
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
Subject: Re: [RFC] gcc patch to avoid host include when compiling gcc-cross
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
X-List-Received-Date: Sat, 10 Jul 2010 06:52:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/9 Khem Raj <raj.khem@gmail.com>:
> On Fri, Jul 9, 2010 at 4:57 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Since the introduction of linux-libc-headers-native my gcc-cross fails
>> to build (unless I avoid building linux-libc-headers-native by telling
>> that it is ASSUME_PROVIDED).
>>
>> Reason is that linux-libc-headers-native installs the host
>> asm/unistd.h in sysroots/i686-linux/usr/include/asm/unistd.h
>> My architecture (nios2) has a different unistd.h.
>>
>> Now gcc-cross compiles libgcc.a and adds among others $(GMPINC) to the
>> include path.
>> However this is a host path pointing to sysroots/i686-linux/usr/include.
>> This causes gcc-cross for nios2 to pick up the wrong unistd.h (causing
>> compilation of libgcc to fail).
>>
>> libgcc does not need GMP (at least not to my knowledge) and having a
>> host include when compiling target code does not seem like a good idea
>> either.
>> In order to fix this I've made a small patch to Makefile.in
>> This one creates a new var TARGET_INCLUDES which contains all includes
>> minus GMPINC.
>> THen INCLUDES is defined to $(TARGET_INCLUDES) $(GMPINC.) (to get the
>> original includes back.
>> And lastly the build rule for libgcc.a is modified to use
>> $(TARGET_INCLUDES) instead of =A0$(INCLUDES)
>>
>> Below is the patch I made. This is not yet a formal patch submission.
>> Instead this posting is made for a few reasons
>> - to create awareness and explain the issue
>
> The approach is ok. however it has to be applied to other libraries too
> and also the crt so its not limited to libgcc only.

crtstuff.c also needed this
libgcc2 has its own set of CFLAGS and does not use $(INCLUDES)
test-protoize-simple: uses INCLUDES, but that looks to me as host code
(not fully sure though)
libgcov does only depend on libgcc but has no rule

and there is this line:
ALL_CPPFLAGS =3D $(INCLUDES) $(CPPFLAGS) $(X_CPPFLAGS) $(T_CPPFLAGS)
As far as I can see it, this one is for host too (but it is part of
the rule .c.o)

I think the following patch suffices:
Index: gcc-4.1.2/gcc/Makefile.in
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- gcc-4.1.2.orig/gcc/Makefile.in
+++ gcc-4.1.2/gcc/Makefile.in
@@ -548,7 +548,7 @@ LIBGCC2_INCLUDES =3D
 TARGET_LIBGCC2_CFLAGS =3D

 # Options to use when compiling crtbegin/end.
-CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0 \
+CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFLAGS=
) -g0 \
   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
   -fno-zero-initialized-in-bss -fno-unit-at-a-time \
   $(INHIBIT_LIBC_CFLAGS)
@@ -845,9 +845,13 @@ BUILD_VARRAY =3D build/varray.o
 # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
 # currently being compiled, in both source trees, to be examined as well.
 # libintl.h will be found in ../intl if we are using the included libintl.
-INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+#
+# TARGET_INCLUDES is added to avoid that GMPINC (which points to the host
+# include dir) is used for compiling libgcc.a
+TARGET_INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
 	   -I$(srcdir)/../include @INCINTL@ \
-	   $(CPPINC) $(GMPINC)
+	   $(CPPINC)
+INCLUDES =3D $(TARGET_INCLUDES) $(GMPINC)

 .c.o:
 	$(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
@@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
 	$(MAKE) \
 	  CFLAGS=3D"$(CFLAGS) $(WARN_CFLAGS)" \
 	  CONFIG_H=3D"$(TCONFIG_H)" TM_H=3D"$(TM_H)" \
-	  INCLUDES=3D"$(INCLUDES)" \
+	  INCLUDES=3D"$(TARGET_INCLUDES)" \
 	  MAKEOVERRIDES=3D \
 	  -f libgcc.mk all


>
>> - to get some feedback on the patch
>> - if there are suggestion for improvements or for better solutions I'd
>> like to know
>> - and last but not least: assuming the patch is ok, how are we going
>> to get it in.
>> I've tested this for gcc 4.1.2 (but there are 20 other gcc versions arou=
nd :-( )
>
> We need to patch all used gcc versions 4.5 and 4.4 and 4.3

Well I can see if the patch applies , but I don't think I'm able to
test all the versions (let alone for all architectures)

Frans
>
>>
>> Enjoy! Frans.
>>
>> Index: gcc-4.1.2/gcc/Makefile.in
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- gcc-4.1.2.orig/gcc/Makefile.in
>> +++ gcc-4.1.2/gcc/Makefile.in
>> @@ -845,9 +845,13 @@ BUILD_VARRAY =3D build/varray.o
>> =A0# -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
>> =A0# currently being compiled, in both source trees, to be examined as w=
ell.
>> =A0# libintl.h will be found in ../intl if we are using the included lib=
intl.
>> -INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
>> +#
>> +# TARGET_INCLUDES is added to avoid that GMPINC (which points to the ho=
st
>> +# include dir) is used for compiling libgcc.a
>> +TARGET_INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
>> =A0 =A0 =A0 =A0 =A0 -I$(srcdir)/../include @INCINTL@ \
>> - =A0 =A0 =A0 =A0 =A0$(CPPINC) $(GMPINC)
>> + =A0 =A0 =A0 =A0 =A0$(CPPINC)
>> +INCLUDES =3D $(TARGET_INCLUDES) $(GMPINC)
>>
>> =A0.c.o:
>> =A0 =A0 =A0 =A0$(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION=
)
>> @@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
>> =A0 =A0 =A0 =A0$(MAKE) \
>> =A0 =A0 =A0 =A0 =A0CFLAGS=3D"$(CFLAGS) $(WARN_CFLAGS)" \
>> =A0 =A0 =A0 =A0 =A0CONFIG_H=3D"$(TCONFIG_H)" TM_H=3D"$(TM_H)" \
>> - =A0 =A0 =A0 =A0 INCLUDES=3D"$(INCLUDES)" \
>> + =A0 =A0 =A0 =A0 INCLUDES=3D"$(TARGET_INCLUDES)" \
>> =A0 =A0 =A0 =A0 =A0MAKEOVERRIDES=3D \
>> =A0 =A0 =A0 =A0 =A0-f libgcc.mk all
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



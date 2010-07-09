Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OXCHJ-0003um-Sf
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 14:02:14 +0200
Received: by bwz10 with SMTP id 10so1242091bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=GiWzqYscWooYvz0gSfOtxCAXfiVXZAOJyQt8ZCvKds0=;
	b=ZtSqBVRSsEmSUL2xCVtdf1UF3nAvCBTigTdYD61vOW67C4vTRiSBS6UcIURuDRmati
	tobFwl2/dU2NdNucSYVujmur85Aq4ILAaWn64MkCNGxAtYa14CtceaEQANjinJwxmM9e
	nvzZUz12Fc0dmUicBs6Aoz6lcDRjYR9ILqgkE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=IpjBGMN8TDDQ6WQt8KH9AU+Q0q1+tFlSz8XryPmHXXVqS3Tn8jXuck/7CX7Mdixp2O
	PlXa5ox6xeu6guNDSMMr9aeyOVKlpMwgrus+sZey6NSWyUkLryE+o2We2yKBHj/5Ruds
	+2BlB9TWYQoFwqJel8BETsGnkT5dTcLSsRHP4=
MIME-Version: 1.0
Received: by 10.204.34.2 with SMTP id j2mr7245404bkd.21.1278676626567; Fri, 09 
	Jul 2010 04:57:06 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Fri, 9 Jul 2010 04:57:06 -0700 (PDT)
Date: Fri, 9 Jul 2010 13:57:06 +0200
Message-ID: <AANLkTilZLkPIUyR-9VUjtukyfTDo7KzcAPt0p0og_zCD@mail.gmail.com>
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
Subject: [RFC] gcc patch to avoid host include when compiling gcc-cross
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
X-List-Received-Date: Fri, 09 Jul 2010 12:02:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Since the introduction of linux-libc-headers-native my gcc-cross fails
to build (unless I avoid building linux-libc-headers-native by telling
that it is ASSUME_PROVIDED).

Reason is that linux-libc-headers-native installs the host
asm/unistd.h in sysroots/i686-linux/usr/include/asm/unistd.h
My architecture (nios2) has a different unistd.h.

Now gcc-cross compiles libgcc.a and adds among others $(GMPINC) to the
include path.
However this is a host path pointing to sysroots/i686-linux/usr/include.
This causes gcc-cross for nios2 to pick up the wrong unistd.h (causing
compilation of libgcc to fail).

libgcc does not need GMP (at least not to my knowledge) and having a
host include when compiling target code does not seem like a good idea
either.
In order to fix this I've made a small patch to Makefile.in
This one creates a new var TARGET_INCLUDES which contains all includes
minus GMPINC.
THen INCLUDES is defined to $(TARGET_INCLUDES) $(GMPINC.) (to get the
original includes back.
And lastly the build rule for libgcc.a is modified to use
$(TARGET_INCLUDES) instead of  $(INCLUDES)

Below is the patch I made. This is not yet a formal patch submission.
Instead this posting is made for a few reasons
- to create awareness and explain the issue
- to get some feedback on the patch
- if there are suggestion for improvements or for better solutions I'd
like to know
- and last but not least: assuming the patch is ok, how are we going
to get it in.
I've tested this for gcc 4.1.2 (but there are 20 other gcc versions around :-( )

Enjoy! Frans.

Index: gcc-4.1.2/gcc/Makefile.in
===================================================================
--- gcc-4.1.2.orig/gcc/Makefile.in
+++ gcc-4.1.2/gcc/Makefile.in
@@ -845,9 +845,13 @@ BUILD_VARRAY = build/varray.o
 # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
 # currently being compiled, in both source trees, to be examined as well.
 # libintl.h will be found in ../intl if we are using the included libintl.
-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+#
+# TARGET_INCLUDES is added to avoid that GMPINC (which points to the host
+# include dir) is used for compiling libgcc.a
+TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
 	   -I$(srcdir)/../include @INCINTL@ \
-	   $(CPPINC) $(GMPINC)
+	   $(CPPINC)
+INCLUDES = $(TARGET_INCLUDES) $(GMPINC)

 .c.o:
 	$(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
@@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
 	$(MAKE) \
 	  CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
 	  CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
-	  INCLUDES="$(INCLUDES)" \
+	  INCLUDES="$(TARGET_INCLUDES)" \
 	  MAKEOVERRIDES= \
 	  -f libgcc.mk all



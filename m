Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OBLvT-00047M-ED
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 07:53:12 +0200
Received: by vws1 with SMTP id 1so62783vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 May 2010 22:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Qjfuu1DoWdk9KVZx8nnzH3tyNnlEiuT1i10qwX5cqaA=;
	b=SRNyt5y6Xy7ApUKGzv0s1Y5+rcvHnXWI8bIgLLte2aA7B3yhHvPVKWg9XIxmFHMv7/
	TjkQl1e0xxtoaIkil03K+X1DHVIPf6GjDT9K9x16gFCj5bRDhm0/XKEvuKoKgC7wOuZR
	j22f7nzrPQBTR6ScI/9omMzzvm7NY8v9wwLvM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=WSarc21cVb1vDnaHTAQCpcpDYCOBN4yvkDmy27/tx6imYQ8bDRlkv2DOjpWUwJyCwc
	7M36MUUDy9FbKJQ0ZcmLIXUJQYw55HOWnovL4vQ4dnDciejJ9W/5dZt/yB8Fuq9d77HQ
	jGTX/7VqYGsAcS9yBiEv2le8X1ey2l4WKxwro=
Received: by 10.220.88.81 with SMTP id z17mr2895117vcl.154.1273470558737;
	Sun, 09 May 2010 22:49:18 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id s9sm42652998vcr.15.2010.05.09.22.49.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 09 May 2010 22:49:17 -0700 (PDT)
Date: Sun, 9 May 2010 22:49:21 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100510054921.GA11084@gmail.com>
References: <1273249883.457.336.camel@trini-m4400>
	<g2zac9c93b11005080006zb474ea8dj506101d1dde2ed42@mail.gmail.com>
	<1273331468.22943.217.camel@trini-m4400>
	<1273429494.22943.225.camel@trini-m4400>
MIME-Version: 1.0
In-Reply-To: <1273429494.22943.225.camel@trini-m4400>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: calamari (ppc e500v2) failure
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
X-List-Received-Date: Mon, 10 May 2010 05:53:12 -0000
X-Groupsio-MsgNum: 19129
Content-Type: multipart/mixed; boundary="DocE+STaALJfprDB"
Content-Disposition: inline

--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (09/05/10 11:24), Tom Rini wrote:
> On Sat, 2010-05-08 at 08:11 -0700, Tom Rini wrote:
> > On Sat, 2010-05-08 at 09:06 +0200, Frans Meulenbroeks wrote:
> > > 2010/5/7 Tom Rini <tom_rini@mentor.com>:
> > > > Hey all,
> > > >
> > > > With DISTRO=minimal and MACHINE=calamari, I see the following failure in
> > > > gnutls (using fe4ff6940b06c73d5b88224b99750bf65accf13d in oe.dev):
> > > > http://pastebin.com/cjAStcLb and I confirmed this prior to the RP merge,
> > > > so this is unrelated.
> > > 
> > > Which eglibc is that?
> > > The issues I had seemed due to some catch22 situation that I cured; I
> > > started a clean build yesterday before I left work & can tell the
> > > results on monday.
> > > My distro was angstrom, machine calamari, this uses eglibc 2.10. Is
> > > minimal also using 2.10 or is it at 2.11
> > > 
> > > I can also try to kick off a minimal build on monday
> > 
> > minimal is eglibc 2.10.  I'll try an Angstrom build.
> 
> With Angstrom, gcc-cross-initial fails building libgcc, config.log has:
> cc1: error: not configured for ABI: 'spe'
> configure:2591: $? = 1
> configure: failed program was:
> ... standard empty program ...
> configure:2605: error: cannot compute suffix of object files: cannot
> compile
> 
> Ubuntu 9.10 x86_64 host

Could you test with attached gcc patch please. This should fix the
undefined symbol error. You could use minimal distro for SPE targets
it should work. Please let me know if it works for you.

Thanks
-Khem




> 
> 
> -- 
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--DocE+STaALJfprDB
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="optspace.diff"

diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
index fe8b486..892d684 100644
--- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -21,10 +21,7 @@ OBJC ?= ",objc"
 # hidden symbols in libgcc.a which linker complains
 # when linking shared libraries further in the build like (gnutls)
 
-OPTSPACE_linux-gnuspe ?= ""
-OPTSPACE_linux-uclibcspe ?= ""
-OPTSPACE ?= "--enable-target-optspace"
-
+OPTSPACE = "${@base_contains('TARGET_ARCH', 'powerpc', '', '--enable-target-optspace',d)}"
 # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
 FORTRAN ?= ",f77"
 LANGUAGES ?= "c,c++${OBJC}${FORTRAN}${JAVA}"
diff --git a/recipes/gcc/gcc-cross-initial.inc b/recipes/gcc/gcc-cross-initial.inc
index 97002f9..25d7ba5 100644
--- a/recipes/gcc/gcc-cross-initial.inc
+++ b/recipes/gcc/gcc-cross-initial.inc
@@ -12,11 +12,11 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--disable-multilib \
 		--disable-__cxa_atexit \
 		--enable-languages=c \
-		--enable-target-optspace \
 		--program-prefix=${TARGET_PREFIX} \
 		--with-sysroot=${STAGING_DIR_TARGET} \
 		--with-build-sysroot=${STAGING_DIR_TARGET} \
 		${EXTRA_OECONF_INITIAL} \
+		${OPTSPACE} \
 		${@get_gcc_fpu_setting(bb, d)} \
 		${@get_gcc_mips_plt_setting(bb, d)}"
 
diff --git a/recipes/gcc/gcc-cross-intermediate.inc b/recipes/gcc/gcc-cross-intermediate.inc
index 0c06d6f..cbc8638 100644
--- a/recipes/gcc/gcc-cross-intermediate.inc
+++ b/recipes/gcc/gcc-cross-intermediate.inc
@@ -10,10 +10,10 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--disable-multilib \
 		--disable-threads \
 		--enable-languages=c \
-		--enable-target-optspace \
 		--program-prefix=${TARGET_PREFIX} \
 		--with-sysroot=${STAGING_DIR_TARGET} \
 		--with-build-sysroot=${STAGING_DIR_TARGET} \
+		${OPTSPACE} \
 		${EXTRA_OECONF_INTERMEDIATE} \
 		${@get_gcc_fpu_setting(bb, d)} \
 		${@get_gcc_mips_plt_setting(bb, d)}"

--DocE+STaALJfprDB--

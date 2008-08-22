Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KWaRM-0007cj-Ul
	for openembedded-devel@openembedded.org; Fri, 22 Aug 2008 19:28:49 +0200
Received: by yx-out-1718.google.com with SMTP id 4so383289yxp.30
	for <openembedded-devel@openembedded.org>;
	Fri, 22 Aug 2008 10:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=N08lO7IlkJ3gEgvBgP1YiXaqh5idO33aMILAQxh7Uo4=;
	b=rKkq4I0goP6WLh4HYnTih+7Jmg8mVAAqxlyjJPBx9cLh3WV9TDBwl5fINQDu5BaQ1q
	ZQIyjjHQO1m8NzeS0VhaReeaY9axKUbEul4eixt2MXzB4TEPWrW9+FsV+W8HZLTsb7e4
	kHpH/oNXaVeQorajhi3p9+jb8zKLM6mofS1F0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=b1IlcsdMlTNN8BaC5aA+HZ/mBZYsOJw9te8WTKFQGnzmDB6nTK3GSes/LNhvBVu+3t
	J5VuesUAO52Dgz5F/Cib3OKJHs5SB/XgyyodMUVy6SMIPN1k/z+rRiT/bDXW83PkszYj
	EVsZjeM5X44isHaRahj2bj5RGA2jRJ6+QlOPs=
Received: by 10.142.172.12 with SMTP id u12mr496376wfe.35.1219426053087;
	Fri, 22 Aug 2008 10:27:33 -0700 (PDT)
Received: from localhost ( [128.107.165.209])
	by mx.google.com with ESMTPS id 32sm3061314wfc.12.2008.08.22.10.27.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Aug 2008 10:27:32 -0700 (PDT)
Date: Fri, 22 Aug 2008 10:27:31 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080822172731.GA8514@gmail.com>
References: <19c1b8a90808211825v497fc98jaf9aa6af3a2881d0@mail.gmail.com>
	<1219396099.21890.20.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1219396099.21890.20.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org
Subject: Re: provide libc-dev in glibc eglibc
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
X-List-Received-Date: Fri, 22 Aug 2008 17:28:49 -0000
X-Groupsio-MsgNum: 5790
Content-Type: multipart/mixed; boundary="DocE+STaALJfprDB"
Content-Disposition: inline

--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/08/08 10:08), Phil Blundell wrote:
> On Thu, 2008-08-21 at 18:25 -0700, Khem Raj wrote:
> > This patch makes an alias for libc-dev which points to libc6-dev in
> > glibc and eglibc. This makes this package have same name like uclibc.
> > This helps in writing recipes which uses these dev packages to use
> > just one name and do not worry about what system library is in use.
> 
> Is the existing libc-dev package (i.e. the one from uclibc) concrete or
> virtual?  If the former then you should call this new alias something
> like "virtual-libc-dev" and make uclibc's libc-dev provide it as well.
> If libc-dev is already a pure virtual then I guess adding a direct
> RPROVIDES for glibc is harmless enough, though it might still be a good
> idea to use the "virtual-libc-dev" naming for clarity and to avoid any
> future imbroglio with other libraries.

libc-dev is not virtual in uclibc, it is concrete package name. So as you suggest I used a different name virtual-libc-dev in the attached patch. 

> 
> By the way, your diffs always seem to come out with MIME-type
> "application/octet-stream" which makes them a bit tedious to view.
> Could you send them as something like text/diff or text/plain in future?

sometimes I use the webclient and that hoses things up. I hope its better this time

Thx

-Khem


> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

#
# old_revision [db5edf1d33af46eb85f6703cd580fdbf069f719f]
#
# patch "packages/eglibc/eglibc_svn.bb"
#  from [175848d8e38b548d456707101f14158a0aef0c9f]
#    to [579f64f2be97fb0ccba90c0527996365db04d69b]
# 
# patch "packages/glibc/glibc_2.5.bb"
#  from [28f2f9a3a57828b85bdecaf06acd329fee9c0b86]
#    to [76dfe8533318cb5562fd8d7cc7fb176b60ec8cb0]
# 
# patch "packages/glibc/glibc_2.6.1.bb"
#  from [57bf7eb6dae142987a9e81c5916a9181d7ec554a]
#    to [d1c3a2677ee3782a7c42edf9fc8a1abe269dc4ea]
# 
# patch "packages/glibc/glibc_2.7.bb"
#  from [e91e43390c8241eaa333acc59cfd49359d7979fe]
#    to [4d9139ab5c9440611da75d340fb3cd3623e7b2e5]
# 
# patch "packages/tasks/task-native-sdk.bb"
#  from [e9aff3af03f3423a34dcb2853582e08fdd66a6a5]
#    to [80fba75c8d21780b6f54763256f5828453d33f13]
# 
# patch "packages/uclibc/bfin-uclibc_svn.bb"
#  from [e6c66ba278e5ce02ed11b35bd5f35655d2bee089]
#    to [f5887aff60acb829eb361dbaf20d5948d6fdb684]
# 
# patch "packages/uclibc/uclibc.inc"
#  from [b9731e1c2f88c691c051a5483ea18e8f61e1d9ba]
#    to [87c57651af3b432e1e276e442f06fb540434c6bb]
# 
# patch "packages/uclibc/uclibc_0.9.26.bb"
#  from [8c4ecfedfcea87b3c96dbc1c2c39a80890f8bb42]
#    to [a9c5c7a53dff8b42c1ad2b3439fcf1d5b68c2f49]
# 
# patch "packages/uclibc/uclibc_0.9.27.bb"
#  from [df5f9a00d2118c5b62001047dbcb53adbe3cd3c3]
#    to [d9aad4f438701e3d54c1b13cbc3ac614ad29f946]
# 
# patch "packages/uclibc/uclibc_0.9.28.bb"
#  from [57793a0bc95945f45c0f3916bb2c11edd2d3a217]
#    to [82aad93faa17a5e28331876152cc398f2fd4b7cd]
# 
# patch "packages/uclibc/uclibc_0.9.29.bb"
#  from [8b02df79e5136a8b2833ea26f26f95484bc814ec]
#    to [36b3e0ba61c9b81964d2c2a0a34ac781598ecf46]
# 
# patch "packages/uclibc/uclibc_nptl.bb"
#  from [4999fa82e8cb40cbff3508bf2427ca942ce9fc73]
#    to [85b1eb580e28f1a763097e52412f6e961f7eed1c]
# 
# patch "packages/uclibc/uclibc_svn.bb"
#  from [eaf1abec09168bb845c5cc7719513cfa957f0072]
#    to [da7c4cf07c2da423ae14ee83bc3e9059f0a09962]
#
============================================================
--- packages/eglibc/eglibc_svn.bb	175848d8e38b548d456707101f14158a0aef0c9f
+++ packages/eglibc/eglibc_svn.bb	579f64f2be97fb0ccba90c0527996365db04d69b
@@ -3,7 +3,7 @@ PV = "2.8+svnr${SRCREV}"
 # DEFAULT_PREFERENCE = "-1"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/eglibc-svn"
 PV = "2.8+svnr${SRCREV}"
-PR = "r9"
+PR = "r10"
 SRC_URI = "svn://svn.eglibc.org;module=trunk \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \
            file://etc/ld.so.conf \
@@ -12,7 +12,7 @@ PACKAGES_DYNAMIC = "libc6*"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
 PACKAGES_DYNAMIC = "libc6*"
-RPROVIDES_${PN}-dev = "libc6-dev"
+RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 PROVIDES_${PN}-dbg = "glibc-dbg"
 
 # the -isystem in bitbake.conf screws up glibc do_stage
@@ -39,7 +39,6 @@ python __anonymous () {
                                    bb.data.getVar('TARGET_OS', d, 1))
 }
 
-           
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile --disable-debug --without-gd \
                 --enable-clocale=gnu \
============================================================
--- packages/glibc/glibc_2.5.bb	28f2f9a3a57828b85bdecaf06acd329fee9c0b86
+++ packages/glibc/glibc_2.5.bb	76dfe8533318cb5562fd8d7cc7fb176b60ec8cb0
@@ -1,10 +1,10 @@ require glibc.inc
 require glibc.inc
-PR = "r16"
+PR = "r17"
 
 ARM_INSTRUCTION_SET = "arm"
 
 PACKAGES_DYNAMIC = "libc6*"
-RPROVIDES_${PN}-dev = "libc6-dev"
+RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
============================================================
--- packages/glibc/glibc_2.6.1.bb	57bf7eb6dae142987a9e81c5916a9181d7ec554a
+++ packages/glibc/glibc_2.6.1.bb	d1c3a2677ee3782a7c42edf9fc8a1abe269dc4ea
@@ -1,8 +1,8 @@ require glibc.inc
 require glibc.inc
-PR = "r10"
+PR = "r11"
 
 PACKAGES_DYNAMIC = "libc6*"
-RPROVIDES_${PN}-dev = "libc6-dev"
+RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
============================================================
--- packages/glibc/glibc_2.7.bb	e91e43390c8241eaa333acc59cfd49359d7979fe
+++ packages/glibc/glibc_2.7.bb	4d9139ab5c9440611da75d340fb3cd3623e7b2e5
@@ -3,9 +3,9 @@ PACKAGES_DYNAMIC = "libc6*"
 ARM_INSTRUCTION_SET = "arm"
 
 PACKAGES_DYNAMIC = "libc6*"
-RPROVIDES_${PN}-dev = "libc6-dev"
+RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 
-PR = "r6"
+PR = "r7"
 
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
============================================================
--- packages/tasks/task-native-sdk.bb	e9aff3af03f3423a34dcb2853582e08fdd66a6a5
+++ packages/tasks/task-native-sdk.bb	80fba75c8d21780b6f54763256f5828453d33f13
@@ -1,10 +1,11 @@ LICENSE = "MIT"
 DESCRIPTION = "Packages required for native (on-device) SDK"
 LICENSE = "MIT"
-DEPENDS = "gcc binutils make patch patchutils diffstat diffutils automake flex bison gawk sed grep"
-RDEPENDS = "gcc-symlinks g++-symlinks binutils-symlinks make libc6-dev \
+DEPENDS = "virtual/libc gcc binutils make patch patchutils diffstat diffutils automake flex bison gawk sed grep"
+RDEPENDS = "gcc-symlinks g++-symlinks cpp-symlinks binutils-symlinks \
+	    make virtual-libc-dev \
 	    flex flex-dev bison gawk sed grep autoconf automake make \
 	    patch patchutils diffstat diffutils libstdc++-dev"
-PR = "r2"
+PR = "r3"
 
 ALLOW_EMPTY = "1"
 PACKAGES = "${PN}"
============================================================
--- packages/uclibc/bfin-uclibc_svn.bb	e6c66ba278e5ce02ed11b35bd5f35655d2bee089
+++ packages/uclibc/bfin-uclibc_svn.bb	f5887aff60acb829eb361dbaf20d5948d6fdb684
@@ -7,7 +7,7 @@ UCLIBC_BASE ?= "0.9.29"
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.29"
-PR = "r2"
+PR = "r3"
 PV = "${UCLIBC_BASE}+svnr${SRCREV}"
 
 require uclibc.inc
============================================================
--- packages/uclibc/uclibc.inc	b9731e1c2f88c691c051a5483ea18e8f61e1d9ba
+++ packages/uclibc/uclibc.inc	87c57651af3b432e1e276e442f06fb540434c6bb
@@ -52,7 +52,7 @@ FILES_uclibc-thread-db = "/lib/libthread
 FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
 FILES_uclibc-gconv = "${libdir}/gconv"
 FILES_uclibc-thread-db = "/lib/libthread_db*"
-RPROVIDES_uclibc-dev += "libc-dev"
+RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
 
 #
 # This locale file gets copied into uClibc-${PV}/extra/locale/ prior to
============================================================
--- packages/uclibc/uclibc_0.9.26.bb	8c4ecfedfcea87b3c96dbc1c2c39a80890f8bb42
+++ packages/uclibc/uclibc_0.9.26.bb	a9c5c7a53dff8b42c1ad2b3439fcf1d5b68c2f49
@@ -1,4 +1,4 @@
-PR = "r10"
+PR = "r11"
 
 require uclibc.inc
 
============================================================
--- packages/uclibc/uclibc_0.9.27.bb	df5f9a00d2118c5b62001047dbcb53adbe3cd3c3
+++ packages/uclibc/uclibc_0.9.27.bb	d9aad4f438701e3d54c1b13cbc3ac614ad29f946
@@ -1,5 +1,5 @@ DEFAULT_PREFERENCE = "1"
 DEFAULT_PREFERENCE = "1"
-PR = "r10"
+PR = "r11"
 
 require uclibc.inc
 
============================================================
--- packages/uclibc/uclibc_0.9.28.bb	57793a0bc95945f45c0f3916bb2c11edd2d3a217
+++ packages/uclibc/uclibc_0.9.28.bb	82aad93faa17a5e28331876152cc398f2fd4b7cd
@@ -1,5 +1,5 @@ DEFAULT_PREFERENCE = "1"
 DEFAULT_PREFERENCE = "1"
-PR = "r14"
+PR = "r15"
 
 require uclibc.inc
 
============================================================
--- packages/uclibc/uclibc_0.9.29.bb	8b02df79e5136a8b2833ea26f26f95484bc814ec
+++ packages/uclibc/uclibc_0.9.29.bb	36b3e0ba61c9b81964d2c2a0a34ac781598ecf46
@@ -7,7 +7,7 @@ UCLIBC_BASE ?= "0.9.29"
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.29"
-PR = "r24"
+PR = "r25"
 DEFAULT_PREFERENCE = "1"
 
 require uclibc.inc
============================================================
--- packages/uclibc/uclibc_nptl.bb	4999fa82e8cb40cbff3508bf2427ca942ce9fc73
+++ packages/uclibc/uclibc_nptl.bb	85b1eb580e28f1a763097e52412f6e961f7eed1c
@@ -8,8 +8,8 @@ PV = "${UCLIBC_BASE}+svnr${SRCREV}"
 #
 UCLIBC_BASE ?= "0.9.29"
 PV = "${UCLIBC_BASE}+svnr${SRCREV}"
-PR = "r0"
-#DEFAULT_PREFERENCE = "2"
+PR = "r1"
+DEFAULT_PREFERENCE = "2"
 #DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so take
 # precedence.
 
============================================================
--- packages/uclibc/uclibc_svn.bb	eaf1abec09168bb845c5cc7719513cfa957f0072
+++ packages/uclibc/uclibc_svn.bb	da7c4cf07c2da423ae14ee83bc3e9059f0a09962
@@ -8,7 +8,7 @@ PV = "${UCLIBC_BASE}+svnr${SRCREV}"
 #
 UCLIBC_BASE ?= "0.9.29"
 PV = "${UCLIBC_BASE}+svnr${SRCREV}"
-PR = "r13"
+PR = "r14"
 #DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so take
 # precedence.
 

--DocE+STaALJfprDB--

Received: from mail-bk0-f49.google.com ([209.85.214.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1U35mP-0000ht-RT
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Feb 2013 15:15:21 +0100
Received: by mail-bk0-f49.google.com with SMTP id w11so659933bku.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2013 05:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=UzUNb/YMp8v+TGnlfoKZbzJdjIyV2aZhGwhx3M0NbMU=;
	b=x/xUupXNoyDoDZbiBV/QqNThNapVhFHkaTP378L5ha4KRYcwl3idz9N+Okfo0blK98
	4kGFk/QJ9wdtHe08BKqC3XIBlAgUdTQ5+wWCoSoBpSImFk5KY9z4pPWK7fLG13TpfYGK
	2t/k2XG5j7jwhw43K0JY/ZGm3t5nOcJ9laBGFZhzvSoA31ugpt2tKC/d4Ao4t6tNOSLf
	/X2s9KvY3mC1hSaV28dn02hT5H4Sdk8u/afq1SiCFFDA5TM+wc4A8hlzpe6gi9McIUG2
	tbA71TBQh08TLmuRvQICodUIYzUVR/O+GAUbWel41bdUhLXhy7AK/Av0Sf5oXoIme9CF
	OD4A==
X-Received: by 10.204.149.140 with SMTP id t12mr2507942bkv.123.1360159166785; 
	Wed, 06 Feb 2013 05:59:26 -0800 (PST)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.204.25.141 with HTTP; Wed, 6 Feb 2013 05:59:05 -0800 (PST)
In-Reply-To: <CAO7m3AmfONKCwbwrduXVtxQdfxOAduZVG8EnKJQgCa8RN5V7Ww@mail.gmail.com>
References: <CAO7m3AmfONKCwbwrduXVtxQdfxOAduZVG8EnKJQgCa8RN5V7Ww@mail.gmail.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Wed, 6 Feb 2013 22:59:05 +0900
X-Google-Sender-Auth: k4N-ptqjK0LK27djxPueBatGxiQ
Message-ID: <CAPESJy4Z9y_jkA_02=-6dYxLPbQqVKVyxreGseN1tVLy=jFr7g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: User Application with Shared Library - do_rootfs fails
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
X-List-Received-Date: Wed, 06 Feb 2013 14:15:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

I can't find DEPENDS keyword and RDEPENDS keyword in your recipes.
Is it done at will?
-- 
Takeshi Hamasaki

2013/2/5 Thomas Besemer <thomas.besemer@gmail.com>:
> I am generating some source code in the OE/Yocto world.  This work requires
> that a shared library exist.  I am able to to build the shared library, and
> maybe install it, and then build the test code against it.  Both these
> builds work.  Final assembly of Root FS fails.
>
> Below are my two recipes.  Appears that the <libgcpy_gc6016sa.so> does not
> get installed correctly (does build).  The recipe for <gcpytest> does work,
> but it does find the library during build.
>
> If I build each indepdent of the other, it's fine.  But, once I try to
> build <core-image-minimal> it complains that the library is not there.
>
>
> | error: Failed dependencies:
>
> | libgcpy_gc6016.so.1 is needed by gcpytest-1-r0.armv7a_vfp_neon
>
> ---
>
> <gcpy-dev.bb>
>
> DESCRIPTION = "GCPY Server application"
>
> SECTION = "gcsim"
>
> LICENSE = "MIT"
>
> LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>
> PR = "r0"
>
> SRC_URI = "file://gcpy-dev.tar"
>
> S = "${WORKDIR}"
>
> do_compile() {
>
> oe_runmake
>
> }
>
> do_install() {
>
> oe_libinstall -so libgcpy_gc6016 ${STAGING_LIBDIR}
>
> install -m 0644 ${S}/gcpy_target_lib.h ${STAGING_INCDIR}
>
> oe_libinstall -so libgcpy_gc6016.so ${D}${libdir}
>
> }
>
>  EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH}
> GC5330_TOOL_PREFIX=${TARGET_PREFIX} SKIP_STRIP=y"
>
> FILES_${PN}-dev = "${D}${libdir}/libgcpy_gc6016.so"
>
> ---
>
> <gcpytest.bb>
>
> DESCRIPTION = "Simple GCPY Test application"
>
> SECTION = "gcsim"
>
> LICENSE = "MIT"
>
> LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>
> PR = "r0"
>
> SRC_URI = "file://gcpytest.c"
>
> S = "${WORKDIR}"
>
> do_compile() {
>
> ${CC} gcpytest.c -o gcpytest -lgcpy_gc6016 -lrt
>
> }
>
> do_install() {
>
> install -d ${D}${bindir}
>
> install -m 0755 gcpytest ${D}${bindir}
>
> }
>
> REQUIRES = " gcpy-dev"
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



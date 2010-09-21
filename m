Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1Oy88K-0005iI-2u
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 21:04:04 +0200
Received: by wwi14 with SMTP id 14so6968171wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 12:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=CHi2tqcR1K5oe6C763Mb9xGJROK3VGkk2hLW8zpuC5A=;
	b=VR2OaIAwlVm1lnZaqk/a8JN5ASkGPkqKshEY12ae+NTC0oKfJweAiosYmWQsKDPO5q
	rN73uDhNrByzSSPZQU0fRtZ2qwE/lyfHf53AmtsbD65gGJTF3410tUJXosqiNBI161Bl
	9cWnewtMIUpRpP0pFnQt1UcmkPzVf94MDs9R0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Lp5gBSTnSorRPmUeJoOtIxW8S8ZfvGazK3B7p0jizxEIT1K8Cwofr/8sogz67U4jT+
	AA7mypSUlvye0QXGaEEx7ervaJ8Opw+Qt64xI7Wodb9doLAnYZ3Y7T0YEh0ZZxnN2Dsn
	qgANGu4df8T2no654awBf3tWlxCi/2IAp/TzQ=
MIME-Version: 1.0
Received: by 10.216.0.76 with SMTP id 54mr9661613wea.49.1285095840165; Tue, 21
	Sep 2010 12:04:00 -0700 (PDT)
Received: by 10.216.202.35 with HTTP; Tue, 21 Sep 2010 12:04:00 -0700 (PDT)
In-Reply-To: <20100921184841.GC11562@denix.org>
References: <AANLkTinWU3xoXzvcF7J6ExWjuh+gB9O6U2uChdTi77Bj@mail.gmail.com>
	<20100921184841.GC11562@denix.org>
Date: Tue, 21 Sep 2010 15:04:00 -0400
Message-ID: <AANLkTikC7PF2mPRgOEeFcWuGtCQkJAqt0e_WWvgF2w0M@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: george.huntingtoniii@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: trying to use external-toolchain-csl with angstrom
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
X-List-Received-Date: Tue, 21 Sep 2010 19:04:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

If I just have the TARGET_VENDOR = "-none", but not the TARGET_SYS =
"arm-none-linux-gnueabi",
then I get an error from external-toolchain-csl.bb telling me it couldn't
stat /opt/arm/arm-2009q3/arm-angstrom-linux-gnueabi/libc/lib/*

does that mean that the (external-toolchain-csl.bb) recipe should change to
use ${TOOLCHAIN_SYSPATH} instead of ${TOOLCHAIN_PATH}/${TARGET_SYS}
?


On Tue, Sep 21, 2010 at 2:48 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Tue, Sep 21, 2010 at 02:27:23PM -0400, George C. Huntington, III wrote:
> > I had to set TARGET_SYS = "arm-none-linux-gnueabi" in my local.conf to
> get
> > the toolchain to be used, but now it appears that the gmp configure
> script
> > doesn't like getting passed "--target=arm-none-linux-gnueabi"  am I just
> > configuring things wrong?
>
> Hi,
>
> I see that you copied most of toolchain setup in your local.conf from
> arago.
> But, in reality, you don't need all that. I haven't tried external
> toolchain
> with Agstrom lately, but you should only need to setup these 4 variables:
>
> TOOLCHAIN_PATH = "/opt/arm/arm-2009q3"
> TARGET_VENDOR = "-none"
> TOOLCHAIN_TYPE = "external"
> TOOLCHAIN_BRAND = "csl"
>
> You may also need PATH_prepend like in your example below, if you don't set
> your system PATH accordingly before using OE. Everything else should be
> taken
> care by the framework automatically.
>
> --
> Denys
>
>
> > here is my local.conf:
> >
> > DISTRO = "angstrom-2008.1"
> >
> > DL_DIR = "${OEDIR}/downloads"
> >
> > BBFILES := "${OEDIR}/openembedded/recipes/*/*.bb
> > ${OEDIR}/openembedded.custom/recipes/*/*.bb"
> > BBFILE_COLLECTIONS = "upstream custom"
> > BBFILE_PATTERN_upstream = "^${OEDIR}/openembedded/recipes/"
> > BBFILE_PATTERN_custom = "^${OEDIR}/openembedded.custom/recipes"
> > BBFILE_PRIORITY_upstream = "5"
> > BBFILE_PRIORITY_custom = "10"
> >
> > IMAGE_FSTYPES = "jffs2 tar cpio.gz"
> >
> > BBINCLUDELOGS = "yes"
> >
> > CVS_TARBALL_STASH = ""
> > ANGSTROM_FEED_CONFIGS = ""
> > #DEBIAN_MIRROR = "ftp://ftp.us.debian.org/debian/pool"
> >
> > #ENABLE_BINARY_LOCALE_GENERATION = "0"
> >
> > PREFERRED_VERSION_mono = "2.4.2.3"
> > PREFERRED_VERSION_mono-mcs-intermediate = "2.4.2.3"
> > PREFERRED_VERSION_mono-native = "2.4.2.3"
> >
> > #PREFERRED_VERSION_directfb = "1.4.1"
> >
> > #PREFERRED_VERSION_mono = "svn"
> > #PREFERRED_VERSION_mono-mcs-intermediate = "svn"
> > #PREFERRED_VERSION_mono-native = "svn"
> >
> > # Black magic to automatically set SDK_PATH out of PATH - don't touch
> this!
> > # Works with pretty much any external toolchain, like CS Lite or MV Pro 5
> > # Handles cross-toolchain vs. native toolchain
> > # SDK_PATH can be overwritten externally by META_SDK_PATH, e.g. for SDK
> > TOOLCHAIN_PATH = "/opt/arm/arm-2009q3"
> > TOOLCHAIN_SYSPATH = "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"
> > #~ PATH_prepend = "${TOOLCHAIN_PATH}/bin"
> > SDK_PATH = "${@[bb.data.getVar('TOOLCHAIN_PATH', d, 1),
> > bb.data.getVar('META_SDK_PATH', d,
> 1)][bool(bb.data.getVar('META_SDK_PATH',
> > d, 1))]}"
> > # Set the necessary variables to use binary CodeSourcery Lite
> > TARGET_VENDOR = "-none"
> > TARGET_SYS = "arm-none-linux-gnueabi"
> > TARGET_CPPFLAGS_append = " -I${SDK_PATH}/${TARGET_SYS}/libc/usr/include "
> > TARGET_LDFLAGS_prepend = " -L${SDK_PATH}/${TARGET_SYS}/libc/lib
> > -Wl,-rpath-link,${SDK_PATH}/${TARGET_SYS}/libc/lib "
> > TOOLCHAIN_TYPE = "external"
> > TOOLCHAIN_BRAND = "csl"
> >
> >
> > # add the following to site.conf if you want to go
> > # faster, use less space, etc
> > #PARALLEL_MAKE = "-j 5"
> > #BB_NUMBER_THREADS = "4"
> > #INHERIT += "rm_work"
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


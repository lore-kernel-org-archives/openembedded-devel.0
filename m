Received: from mail-ie0-f172.google.com ([209.85.223.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UeA7b-0002m3-Mj
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 22:22:31 +0200
Received: by mail-ie0-f172.google.com with SMTP id 16so12734778iea.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 13:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/qmrpDqRO5EpFpC636vtP3ou5t0MuXptxio8lYyK4v0=;
	b=VOjnDAxzrC/GovaFoJsw83QpJO7rsY3fCVAxJDCC9awHhhI5+AwMYO//wiemyQxED7
	HOt/YYlihurOaTikDzQhQCloSzjbM8nC73wnUG+rK0yCuukv+yuU1LnHTzVISwFONqT1
	1AzwChA6efVY3H6l117lmrvDFknRk6R4m+DhvdWhIfxW8ocSV88dhoPfrJN5C6kPiDzl
	rEcd1MowEnTMe5K+dX4X4n36uo15IysV7TY68k45gohXSMnDIfbdIRpJjOfrkyD2RcnC
	KpowDnrAS379cVSfZbbX4IZKxh2Cn8fOb2chE3xTdIhuLIPLU/zQec+Ys1pmYMLpV8rK
	Q5JQ==
MIME-Version: 1.0
X-Received: by 10.50.87.10 with SMTP id t10mr3586182igz.108.1368993843828;
	Sun, 19 May 2013 13:04:03 -0700 (PDT)
Received: by 10.50.109.133 with HTTP; Sun, 19 May 2013 13:04:03 -0700 (PDT)
In-Reply-To: <20130519115236.GF3196@jama>
References: <1368457185-8140-1-git-send-email-philip@balister.org>
	<20130519073217.GA3196@jama> <5198B21A.5090907@balister.org>
	<20130519115236.GF3196@jama>
Date: Sun, 19 May 2013 13:04:03 -0700
Message-ID: <CAMKF1srgbEqRkgemR1n+wKjASNLZnRkn4QHeX=wd7XkzPW+F=w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] gnuradio : Update recipe to build on all machines again.
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
X-List-Received-Date: Sun, 19 May 2013 20:22:37 -0000
Content-Type: text/plain; charset=UTF-8

On Sunday, May 19, 2013, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, May 19, 2013 at 07:06:02AM -0400, Philip Balister wrote:
>> On 05/19/2013 03:32 AM, Martin Jansa wrote:
>> > On Mon, May 13, 2013 at 10:59:45AM -0400, Philip Balister wrote:
>> >> Also updated the git repo address after recent changes in hosting.
>> >>
>> >> The recipe failed to build for machines without neon as a tune
feature.
>> >> The cmake config options have been changed so that it configures
properly
>> >> now.
>> >>
>> >> Test on armv7a, x86, and x86-64.
>> >>
>> >> Signed-off-by: Philip Balister <philip@balister.org>
>> >> ---
>> >>  meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 10 +++-------
>> >>  1 file changed, 3 insertions(+), 7 deletions(-)
>> >>
>> >> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bbb/meta-oe/recipes-connectivity/gnuradio/
gnuradio_git.bb
>> >> index edd4615..9e6998b 100644
>> >> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
>> >> +++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
>> >> @@ -70,7 +70,7 @@ SRCREV = "5f69899e059e9bea58f92af61f70fc3f63825087"
>> >>  GIT_REPO = "gnuradio.git"
>> >>  GIT_BRANCH = "master"
>> >>
>> >> -SRC_URI = "git://
gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH};protocol=git \
>> >> +SRC_URI = "git://
git.gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH};protocol=git \
>> >>  "
>> >>
>> >>  S="${WORKDIR}/git"
>> >> @@ -88,15 +88,11 @@ EXTRA_OECMAKE = "-DENABLE_GR_ATSC=FALSE \
>> >>                   -DQT_LIBRARY_DIR=${STAGING_LIBDIR} \
>> >>
-DQT_QTCORE_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtCore.so \
>> >>
-DQT_QTGUI_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtGui.so \
>> >> +                 ${@base_contains('TUNE_FEATURES', 'neon', \
>> >> +                     '-Dhave_mfpu_neon=1', '-Dhave_mfpu_neon=0', d)}
\
>> >>  "
>> >>
>> >>  inherit distutils-base cmake pkgconfig
>> >>
>> >>  EXTRA_OEMAKE = "-C ${OECMAKE_BUILDPATH}"
>> >>
>> >> -# Only builds for machines with neon instructions. Problem is in
upstream cmake.
>> >> -python () {
>> >> -    if not oe.utils.contains ('TUNE_FEATURES', 'neon', True, False,
d):
>> >> -        raise bb.parse.SkipPackage("'neon' not in TUNE_FEATURES")
>> >> -}
>> >
>> > Hi,
>> >
>> > this enables gnuradio to build on qemu* MACHINEs I'm testing and it
>> > failed on all 3 because of docs generation, can you disable it?
>> >
>> > | [ 20%]
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/gr-trellis.xml:6:
warning: failed to load external entity
"/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/docbookx.dtd"
>> > | ]>
>> > |   ^
>> > | warning: failed to load external entity
"/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/docbookx.dtd"
>> > | validity error : Could not load the external subset "docbookx.dtd"
>> > | Document
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/gr-trellis.xml
does not validate
>> >
> Can be in separate patch, but I would like to apply them together (so
> that I don't get new failure on world builds)
>
>> It built on my machine, I wonder if there is a host contamination issue?
>
> docs are broken for long time:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2416

Can you cook patches for these native recipes for oe-core seems you know
most about the issue
It would really be very helpful
>
> a lot of components is disabling docs (if configure option available) or
> dropping them from SUBDIRs in Makefile.am with sed.
>
> Cheers,
>
>>
>> Philip
>>
>> > Cheers,
>> >
>> >
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>>
>
>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>


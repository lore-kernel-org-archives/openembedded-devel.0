Return-Path: <anatol.oe@belski.net>
X-Greylist: delayed 526 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 21 Jul 2019 16:49:10 UTC
Received: from h1123647.serverkompetenz.net (klapt.com [85.214.73.107])
	by mail.openembedded.org (Postfix) with ESMTP id 5A2AB7EE4F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:49:10 +0000 (UTC)
Received: by h1123647.serverkompetenz.net (Postfix, from userid 1006)
	id 1778817A318A; Sun, 21 Jul 2019 18:40:24 +0200 (CEST)
Received: from fringe.fritz.box (i5387DFE8.versanet.de [83.135.223.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by h1123647.serverkompetenz.net (Postfix) with ESMTPSA id 8870017A05A3; 
	Sun, 21 Jul 2019 18:40:21 +0200 (CEST)
Message-ID: <ac1bbc9481bceb0f95d454981dcb6a03b31da472.camel@belski.net>
From: Anatol Belski <anatol.oe@belski.net>
To: Khem Raj <raj.khem@gmail.com>, Anatol Belski <anbelski@microsoft.com>, 
	openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 18:40:10 +0200
In-Reply-To: <497ba06b-0113-3430-f9be-8d80a6ed6fde@gmail.com>
References: <20190721013327.27634-1-anbelski@microsoft.com>
	<497ba06b-0113-3430-f9be-8d80a6ed6fde@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] Finer gperftools packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Jul 2019 16:49:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,

thanks for the review. 

On Sat, 2019-07-20 at 19:17 -0700, Khem Raj wrote:
> Hi Anatol
> 
> On 7/20/19 6:33 PM, Anatol Belski via Openembedded-devel wrote:
> > This splits gperftools into
> > 
> > - gperftools script
> > - gperftools profiler and other libs
> > - libtcmalloc-minimal
> > - docs and other stuff
> > 
> > Especially the libctmalloc-minimal is what is useful if only an
> > improved
> > allocator needs to be used. The gperftools package stays otherwise
> > fully
> > backward compatible, as it depends on any necessary lib packages.
> > Though, the lib packages can be installed separately, which allows
> > for
> > more flexibility and for cleaner image contents.
> > 
> > Signed-off-by: Anatol Belski <anbelski@microsoft.com>
> > ---
> >   .../gperftools/gperftools_2.7.bb              | 23
> > +++++++++++++++++++
> >   1 file changed, 23 insertions(+)
> > 
> > diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
> > b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
> > index c8b91278d..badf0d203 100644
> > --- a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
> > +++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
> > @@ -28,3 +28,26 @@ COMPATIBLE_HOST_mipsarch_libc-glibc = "null"
> >   ARM_INSTRUCTION_SET_armv5 = "arm"
> >   ARM_INSTRUCTION_SET_toolchain-clang_arm = "arm"
> >   
> > +PACKAGES = "${PN} ${PN}-dbg ${PN}-doc ${PN}-libs ${PN}-libs-dev
> > ${PN}-libs-staticdev libtcmalloc-minimal"
> > +
> 
> some of these are default so instead of rewriting the variable 
> completely lets add/delete whatever is needed
> 
> PACKAGE_BREFORE_PN += "libtcmalloc-minimal ${PN}-libs"
> 
Good tip, i'm going to rewrite this based on this and other tips you
gave below, which will simplify a lot.

> > +EXTRA_OECONF_append += " --enable-static"
> > +
> 
> why do we need this ?
> > +FILES_${PN} = "${bindir}/*"
> > +FILES_${PN}-doc = "${docdir} ${mandir}"
> 
> we wont need these
> 
> > +FILES_${PN}-libs = "${libdir}/libprofiler*${SOLIBS}
> > ${libdir}/libprofiler*${SOLIBS}\
> > +		${libdir}/libtcmalloc${SOLIBS} \
> > +		${libdir}/libtcmalloc_debug${SOLIBS} \
> > +		${libdir}/libtcmalloc_and_profiler*${SOLIBS}"
> 
> do we need a separate libs package ? what does it give us ?
The point on this is a usual separation to allow libs to be used
separately from binaries. It was a kind of a "collateral improvement"
while being on it. Whereby in this case sure the pperf script is just a
175K perl script, so probably it's an overhead. So intsead, one would
have just libtcmalloc-minimal separated, as it sure a huge win for C++
apps, and otherwise let gperftools and gperftools-[static]dev handle
the rest. Would this be a better approach?

Thanks

Anatol

> > +FILES_${PN}-libs-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV}
> > ${libdir}/lib*.la ${libdir}/pkgconfig"
> > +FILES_${PN}-libs-staticdev = "${libdir}/*.a"
> 
> not needed
> > +FILES_libtcmalloc-minimal =
> > "${libdir}/libtcmalloc_minimal*${SOLIBS}
> > ${libdir}/libtcmalloc_minimal_debug*${SOLIBS}"
> > +
> > +RDEPENDS_${PN} = "${PN}-libs (= ${EXTENDPKGV})"
> > +RDEPENDS_${PN}-libs = "libtcmalloc-minimal (= ${EXTENDPKGV})"
> > +RDEPENDS_${PN}-libs-dev = "${PN}-libs (= ${EXTENDPKGV})
> > libtcmalloc-minimal (= ${EXTENDPKGV})"
> > +RDEPENDS_${PN}-libs-staticdev = "${PN}-libs-dev (= ${EXTENDPKGV})"
> > +
> > +SECTION_${$PN}-doc = "doc"
> > +SECTION_${PN}-libs-dev = "devel"
> > +SECTION_${PN}-libs-staticdev = "devel"
> > +



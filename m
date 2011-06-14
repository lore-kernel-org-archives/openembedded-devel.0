Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QWVlS-0004TH-J9
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 17:42:50 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMS004XBE4JQBA3@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Jun 2011 10:38:56 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3E69F14AF5D; Tue,
	14 Jun 2011 11:38:43 -0400 (EDT)
Date: Tue, 14 Jun 2011 11:38:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110614153843.GB1324@denix.org>
References: <4DF6DBCE.7010404@gmail.com> <it731q$utn$1@dough.gmane.org>
MIME-version: 1.0
In-reply-to: <it731q$utn$1@dough.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] ti-dsplink: Fixed location of toolchain
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
X-List-Received-Date: Tue, 14 Jun 2011 15:42:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 14, 2011 at 09:36:26AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 14-06-11 05:55, Joel A Fernandes wrote:
> > ti-dsplink: Fixed location of toolchain to build ti-dsplink.
> 
> It sadly really needs an absolute path to the tools :(

So, what was this patch trying to fix anyway? Is there something broken?

-- 
Denys


> > Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> > ---
> >  recipes/ti/ti-dsplink.inc |   34 +++++++++++++++++-----------------
> >  1 files changed, 17 insertions(+), 17 deletions(-)
> > 
> > diff --git a/recipes/ti/ti-dsplink.inc b/recipes/ti/ti-dsplink.inc
> > index c48ec41..bbdc35a 100644
> > --- a/recipes/ti/ti-dsplink.inc
> > +++ b/recipes/ti/ti-dsplink.inc
> > @@ -94,23 +94,23 @@ do_compile() {
> >      # Build the gpp user space library
> >      cd ${DSPLINK}/gpp/src/api && make \
> >        CROSS_COMPILE="${TARGET_PREFIX}" \
> > -      CC="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> > -      AR="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> > -      LD="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ld" \
> > -      COMPILER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> > -      ARCHIVER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> > +      CC="${CC}" \
> > +      AR="${AR}" \
> > +      LD="${LD}" \
> > +      COMPILER="${CC}" \
> > +      ARCHIVER="${AR}" \
> >        KERNEL_DIR="${STAGING_KERNEL_DIR}" \
> >        all
> >  
> >      # Build the gpp kernel space (debug and release)
> >      cd ${DSPLINK}/gpp/src && make \
> > -      OBJDUMP="${TARGET_PREFIX}objdump" \
> > +      OBJDUMP="${OBJDUMP}" \
> >        CROSS_COMPILE="${TARGET_PREFIX}" \
> > -      CC="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> > -      AR="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> > -      LD="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ld" \
> > -      COMPILER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> > -      ARCHIVER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> > +      CC="${CC}" \
> > +      AR="${AR}" \
> > +      LD="${LD}" \
> > +      COMPILER="${CC}" \
> > +      ARCHIVER="${AR}" \
> >        KERNEL_DIR="${STAGING_KERNEL_DIR}" \
> >        BASE_BUILDOS="${STAGING_KERNEL_DIR}" \
> >        all
> > @@ -122,12 +122,12 @@ do_compile() {
> >        OSINC_PLATFORM="${TOOLCHAIN_PATH}/lib/gcc/${TARGET_SYS}/$(${TARGET_PREFIX}gcc -dumpversion)/include" \
> >        OSINC_TARGET="${BASE_TOOLCHAIN}/target/usr/include" \
> >        CROSS_COMPILE="${TARGET_PREFIX}" \
> > -      CC="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> > -      LD="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> > -      AR="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> > -      COMPILER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> > -      LINKER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> > -      ARCHIVER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> > +      CC="${CC}" \
> > +      AR="${AR}" \
> > +      LD="${LD}" \
> > +      COMPILER="${CC}" \
> > +      ARCHIVER="${AR}" \
> > +      LINKER="${CC}" \
> >        KERNEL_DIR="${STAGING_KERNEL_DIR}" \
> >        all
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFN9w96MkyGM64RGpERAkk+AJ9kAE91Op6450wG1xySGpAa3drFXQCfSNcO
> F1rBpao1N5wwWAlNk6kwiqU=
> =x1pA
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



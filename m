Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QLwGW-0007gP-QT
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 13:47:12 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QLvob-0003xG-QY
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 13:18:24 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DD10D32.30609@opendreambox.org>
References: <1302825782-17120-1-git-send-email-obi@opendreambox.org>
	<1302825782-17120-2-git-send-email-obi@opendreambox.org>
	<4DD10D32.30609@opendreambox.org>
Date: Mon, 16 May 2011 12:44:03 +0100
Message-ID: <1305546243.2429.1.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/2] kernel.bbclass: pass AR, NM and OBJCOPY to make
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
X-List-Received-Date: Mon, 16 May 2011 11:47:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm mildly curious as to what Montavista can have done that requires a
custom version of ar.  But the patch looks fine to me anyway.

Acked-by: Phil Blundell <philb@gnu.org>

p.

On Mon, 2011-05-16 at 13:40 +0200, Andreas Oberritter wrote:
> Ping
> 
> On 04/15/2011 02:03 AM, Andreas Oberritter wrote:
> > - Fixes build with certain vendor-supplied Montavista kernels.
> > - Pass the same set of variables to every invocation of make.
> > - Create KERNEL_*SUFFIX, TARGET_*_KERNEL_ARCH and HOST_*_KERNEL_ARCH
> >   for the three variables, analogue to LD.
> > 
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> >  classes/kernel.bbclass |   28 ++++++++++++++++++++++++----
> >  1 files changed, 24 insertions(+), 4 deletions(-)
> > 
> > diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> > index bded15d..b97b725 100644
> > --- a/classes/kernel.bbclass
> > +++ b/classes/kernel.bbclass
> > @@ -41,19 +41,39 @@ KERNEL_PRIORITY = "${@bb.data.getVar('PV',d,1).split('-')[0].split('.')[-1]}"
> >  
> >  KERNEL_RELEASE ?= "${KERNEL_VERSION}"
> >  
> > +KERNEL_ARSUFFIX ?= ""
> >  KERNEL_CCSUFFIX ?= ""
> >  KERNEL_LDSUFFIX ?= ""
> > +KERNEL_NMSUFFIX ?= ""
> > +KERNEL_OBJCOPYSUFFIX ?= ""
> >  
> >  # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
> >  # specific options necessary for building the kernel and modules.
> >  #FIXME: should be this: TARGET_CC_KERNEL_ARCH ?= "${TARGET_CC_ARCH}"
> > +TARGET_AR_KERNEL_ARCH ?= ""
> > +HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
> >  TARGET_CC_KERNEL_ARCH ?= ""
> >  HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
> >  TARGET_LD_KERNEL_ARCH ?= ""
> >  HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
> > +TARGET_NM_KERNEL_ARCH ?= ""
> > +HOST_NM_KERNEL_ARCH ?= "${TARGET_NM_KERNEL_ARCH}"
> > +TARGET_OBJCOPY_KERNEL_ARCH ?= ""
> > +HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
> >  
> > +KERNEL_AR = "${AR}${KERNEL_ARSUFFIX} ${HOST_AR_KERNEL_ARCH}"
> >  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}"
> >  KERNEL_LD = "${LD}${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
> > +KERNEL_NM = "${NM}${KERNEL_NMSUFFIX} ${HOST_NM_KERNEL_ARCH}"
> > +KERNEL_OBJCOPY = "${OBJCOPY}${KERNEL_OBJCOPYSUFFIX} ${HOST_OBJCOPY_KERNEL_ARCH}"
> > +
> > +KERNEL_EXTRA_OEMAKE = " \
> > +	AR='${KERNEL_AR}' \
> > +	CC='${KERNEL_CC}' \
> > +	LD='${KERNEL_LD}' \
> > +	NM='${KERNEL_NM}' \
> > +	OBJCOPY='${KERNEL_OBJCOPY}' \
> > +"
> >  
> >  # Where built kernel lies in the kernel tree
> >  KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
> > @@ -82,17 +102,17 @@ EXTRA_OEMAKE = ""
> >  
> >  kernel_do_compile() {
> >  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> > -	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> > +	oe_runmake include/linux/version.h ${KERNEL_EXTRA_OEMAKE}
> >  	if [ "${KERNEL_MAJOR_VERSION}" != "2.6" ]; then
> > -		oe_runmake dep CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> > +		oe_runmake dep ${KERNEL_EXTRA_OEMAKE}
> >  	fi
> > -	oe_runmake ${KERNEL_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> > +	oe_runmake ${KERNEL_IMAGETYPE} ${KERNEL_EXTRA_OEMAKE}
> >  }
> >  
> >  do_compile_kernelmodules() {
> >  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> >  	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> > -		oe_runmake modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> > +		oe_runmake modules ${KERNEL_EXTRA_OEMAKE}
> >  	else
> >  		oenote "no modules to compile"
> >  	fi
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





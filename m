Return-Path: <denis@denix.org>
X-Greylist: delayed 3604 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Apr 2016 19:23:29 UTC
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A92F62133
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 19:23:29 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00JNN32OTAA0@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Apr 2016 13:23:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8
	a=6oOP8dcQzyAVWIcBl4sA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 3893e836; Wed, 20 Apr 2016 18:23:12 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B8C90161FB3; Wed,
	20 Apr 2016 14:23:11 -0400 (EDT)
Date: Wed, 20 Apr 2016 14:23:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20160420182311.GL16135@denix.org>
References: <1460410351-25968-1-git-send-email-j-stiffler@ti.com>
	<20160412050910.GW16135@denix.org>
MIME-version: 1.0
In-reply-to: <20160412050910.GW16135@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe][PATCH] llvm: correct fix for the multilib libdir
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
X-List-Received-Date: Wed, 20 Apr 2016 19:23:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Ping? I see it in master-next, what's an ETA on merging it to master?


On Tue, Apr 12, 2016 at 01:09:10AM -0400, Denys Dmytriyenko wrote:
> On Mon, Apr 11, 2016 at 05:32:30PM -0400, Jacob Stiffler wrote:
> > * If llvm.inc is used for native and nativesdk class packages, the
> >   resulting llvm-config is broken since "${base_libdir}" is prefixed
> >   with the full patch to sysroot
> > * Replace "/lib" with "/${baselib}" instead of "${base_libdir}" as
> >   "${base_libdir}" is the full path and "${baselib}" is the name of
> >   the multilib directory.
> > 
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> 
> Acked-by: Denys Dmytriyenko <denys@ti.com>
> Tested-by: Denys Dmytriyenko <denys@ti.com>
> 
> 
> > ---
> >  meta-oe/recipes-core/llvm/llvm.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
> > index 31b2db4..02d4617 100644
> > --- a/meta-oe/recipes-core/llvm/llvm.inc
> > +++ b/meta-oe/recipes-core/llvm/llvm.inc
> > @@ -61,7 +61,7 @@ do_configure_prepend() {
> >      sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/llvm-config/llvm-config.cpp
> >  
> >      # Fix the hardcoded libdir in llvm-config
> > -    sed -i 's:/lib\>:${base_libdir}:g' ${S}/tools/llvm-config/llvm-config.cpp
> > +    sed -i 's:/lib\>:/${baselib}:g' ${S}/tools/llvm-config/llvm-config.cpp
> >  
> >      # Fails to build unless using separate directory from source
> >      mkdir -p ${LLVM_BUILD_DIR}
> > @@ -72,7 +72,7 @@ do_compile() {
> >      cd ${LLVM_BUILD_DIR}
> >  
> >      # Fix libdir for multilib
> > -    sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)${base_libdir}:g' Makefile.config
> > +    sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)/${baselib}:g' Makefile.config
> >  
> >      oe_runmake \
> >          AR="${BUILD_AR}" \
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


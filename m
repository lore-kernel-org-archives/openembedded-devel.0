Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id CE9A8755B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:14:21 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 90E21679C0B9;
	Wed,  6 Jun 2018 23:14:21 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EAE9A679C0B7;
	Wed,  6 Jun 2018 23:14:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.itconsulting-heinold.de (x5ce7b54a.dyn.telefonica.de
	[92.231.181.74]) by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Wed,  6 Jun 2018 23:14:18 +0200 (CEST)
Date: Wed, 6 Jun 2018 23:14:15 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <20180606211415.GB16170@mail.itconsulting-heinold.de>
References: <20180510160956.85938-1-jason.wessel@windriver.com>
	<6bf492f0-0f73-4b58-5eab-70f5213f0963@skidata.com>
MIME-Version: 1.0
In-Reply-To: <6bf492f0-0f73-4b58-5eab-70f5213f0963@skidata.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] icetea7, openjdk-8: Fix depenency to xproto -> xorgproto
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
X-List-Received-Date: Wed, 06 Jun 2018 21:14:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 06, 2018 at 11:57:42AM +0200, Richard Leitner wrote:

Hi,

I have applied the patch to master and master-next.

Should it be applied to some stable branches?

Bye Henning

PS: Thanks for testing it.
> Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
> and
> Tested-by: Richard Leitner <richard.leitner@skidata.com>
> 
> Please take this patch as otherwise the build fails with oe-core's
> current master.
> 
> regards;Richard.L
> 
> On 05/10/2018 06:09 PM, Jason Wessel wrote:
> > The latest oe-core has changed the X protocol header provider package
> > name.
> > 
> > Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> > ---
> >  recipes-core/icedtea/icedtea7-native.inc  | 2 +-
> >  recipes-core/openjdk/openjdk-8-cross.inc  | 2 +-
> >  recipes-core/openjdk/openjdk-8-native.inc | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> > index d4cf7ac..2c9fa92 100644
> > --- a/recipes-core/icedtea/icedtea7-native.inc
> > +++ b/recipes-core/icedtea/icedtea7-native.inc
> > @@ -12,7 +12,7 @@ DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
> >            "
> >  
> >  PACKAGECONFIG ??= ""
> > -PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xproto-native libxt-native libxext-native libxrender-native"
> > +PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
> >  
> >  OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
> >  CFLAGS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ' -DHEADLESS=true', d)}"
> > diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
> > index d70c946..46f13fd 100644
> > --- a/recipes-core/openjdk/openjdk-8-cross.inc
> > +++ b/recipes-core/openjdk/openjdk-8-cross.inc
> > @@ -21,7 +21,7 @@ PACKAGECONFIG ??= " \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
> >      gif jpeg png zlib \
> >  "
> > -PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender libxtst"
> > +PACKAGECONFIG[x11] = "--with-x,,libx11 xorgproto libxt libxext libxrender libxtst"
> >  PACKAGECONFIG[cups] = "--with-cups,,cups"
> >  PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib"
> >  
> > diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
> > index d674474..b782c32 100644
> > --- a/recipes-core/openjdk/openjdk-8-native.inc
> > +++ b/recipes-core/openjdk/openjdk-8-native.inc
> > @@ -10,7 +10,7 @@ DEPENDS = "\
> >  SRC_URI_append += "file://handle_extra_output.patch"
> >  
> >  PACKAGECONFIG ??= "gif jpeg png zlib"
> > -PACKAGECONFIG[x11] = "--with-x,,libx11-native xproto-native libxt-native libxext-native libxrender-native"
> > +PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
> >  PACKAGECONFIG[cups] = "--with-cups,,cups"
> >  PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
> >  PACKAGECONFIG[gif] = "--with-giflib=system,--with-giflib=bundled,giflib-native"
> > 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


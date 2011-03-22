Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Q25ck-0004TR-T5
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 18:44:06 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 328AE11000B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 18:31:19 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3151711000B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 18:31:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225144151.adsl.alicedsl.de
	[92.225.144.151]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 18:31:18 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 248B53C0C3; Tue, 22 Mar 2011 18:30:49 +0100 (CET)
Date: Tue, 22 Mar 2011 18:30:49 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110322173047.GA10685@rhein.zuhause.netz>
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300780910-28866-3-git-send-email-heinold@inf.fu-berlin.de>
	<20110322171954.GA22283@sakrah.homelinux.org>
MIME-Version: 1.0
In-Reply-To: <20110322171954.GA22283@sakrah.homelinux.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH 2/3] cairo.inc: let arm, mips and ppc depend on libatomic-ops
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
X-List-Received-Date: Tue, 22 Mar 2011 17:44:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 22, 2011 at 10:19:54AM -0700, Khem Raj wrote:
> On (22/03/11 09:01), heinold@inf.fu-berlin.de wrote:
> > From: Henning Heinold <heinold@inf.fu-berlin.de>
> > 
> > 
> > Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
> > ---
> >  recipes/cairo/cairo.inc |    9 ++++++++-
> >  1 files changed, 8 insertions(+), 1 deletions(-)
> > 
> > diff --git a/recipes/cairo/cairo.inc b/recipes/cairo/cairo.inc
> > index c60d7d9..fad50b3 100644
> > --- a/recipes/cairo/cairo.inc
> > +++ b/recipes/cairo/cairo.inc
> > @@ -1,15 +1,22 @@
> >  SECTION = "libs"
> >  PRIORITY = "optional"
> > -DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
> >  DESCRIPTION = "Cairo graphics library"
> >  LICENSE = "MPL LGPL"
> >  
> > +DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
> > +
> > +DEPENDS_append_arm = " libatomic-ops"
> > +DEPENDS_append_mips = " libatomic-ops"
> > +DEPENDS_append_mipsel = " libatomic-ops"
> > +DEPENDS_append_ppc = " libatomic-ops"
> > +

No,

but how do you will filter it? We have no versions dep in bitbake.

Bye Henning



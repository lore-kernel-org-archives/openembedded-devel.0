Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q0DQC-0005jR-QM
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 14:39:24 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q0DOY-0002wQ-Rf
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 14:37:43 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110317125759.GA3585@jama.jama.net>
References: <1300363716-32402-1-git-send-email-Martin.Jansa@gmail.com>
	<1300364979.9054.2.camel@phil-desktop>
	<20110317125759.GA3585@jama.jama.net>
Date: Thu, 17 Mar 2011 13:41:19 +0000
Message-ID: <1300369279.9054.3.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] gtk+: define empty PACKAGES_DYNAMIC_virtclass-native
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
X-List-Received-Date: Thu, 17 Mar 2011 13:39:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 13:57 +0100, Martin Jansa wrote:
> On Thu, Mar 17, 2011 at 12:29:39PM +0000, Phil Blundell wrote:
> > On Thu, 2011-03-17 at 13:08 +0100, Martin Jansa wrote:
> > > --- a/recipes/gtk+/gtk+_2.18.6.bb
> > > +++ b/recipes/gtk+/gtk+_2.18.6.bb
> > > @@ -19,6 +19,7 @@ EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes
> > >  EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-cups"
> > >  
> > >  PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
> > > +PACKAGES_DYNAMIC_virtclass-native = ""
> > 
> > Can you not put this in gtk+.inc?
> 
> Not all 13 versions we have are including gtk+.inc. But after rechecking
> I could put it only to 4 recipes (I'll resend smaller patch).
> 
> bitbake@jama ~/dev/recipes/gtk+ $ git grep BBCLASSEXTEND
> gtk+_2.14.2.bb:BBCLASSEXTEND = "native"
> gtk+_2.18.6.bb:BBCLASSEXTEND = "native"
> gtk+_2.20.0.bb:BBCLASSEXTEND = "native"
> gtk+_2.20.1.bb:BBCLASSEXTEND = "native"
> 
> and let the older versions die with migration to meta-oe or let
> someone who cares about gtk to remove them completely.

The four versions you mentioned there do all include gtk+.inc (only the
very old ones like 2.6 don't).  So you can put it there and make an even
smaller patch with the same effect.

p.





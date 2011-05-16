Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QLwHx-0007wl-Cd
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 13:48:41 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QLvq4-0003xP-KM
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 13:19:52 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DD10D20.6080005@opendreambox.org>
References: <1302825782-17120-1-git-send-email-obi@opendreambox.org>
	<4DD10D20.6080005@opendreambox.org>
Date: Mon, 16 May 2011 12:45:47 +0100
Message-ID: <1305546347.2429.3.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2] kernel.bbclass: pass KERNEL_VERSION through legitimize_package_name
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
X-List-Received-Date: Mon, 16 May 2011 11:48:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I can't help thinking that, in this day and age, those PKG assignments
probably belong in some distro configuration rather than the recipe
itself, and it might be worth thinking about booting them out at some
point.  But, as long as they are there, your change is obviously
sensible.

Acked-by: Phil Blundell <philb@gnu.org>

p.

On Mon, 2011-05-16 at 13:40 +0200, Andreas Oberritter wrote:
> Ping
> 
> On 04/15/2011 02:03 AM, Andreas Oberritter wrote:
> > - KERNEL_VERSION may contain characters unsuitable for package
> >   names, e.g. underscores. Use legitimize_package_name to replace
> >   those characters.
> > 
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> >  classes/kernel.bbclass |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> > index 0187fb3..bded15d 100644
> > --- a/classes/kernel.bbclass
> > +++ b/classes/kernel.bbclass
> > @@ -245,8 +245,8 @@ RDEPENDS_kernel = "kernel-base"
> >  # Allow machines to override this dependency if kernel image files are 
> >  # not wanted in images as standard
> >  RDEPENDS_kernel-base ?= "kernel-image"
> > -PKG_kernel-image = "kernel-image-${KERNEL_VERSION}"
> > -PKG_kernel-base = "kernel-${KERNEL_VERSION}"
> > +PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> > +PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
> >  ALLOW_EMPTY_kernel = "1"
> >  ALLOW_EMPTY_kernel-base = "1"
> >  ALLOW_EMPTY_kernel-image = "1"
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





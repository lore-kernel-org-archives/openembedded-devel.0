Received: from [64.233.162.226] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1HeZeo-0000pj-Ar
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2007 18:38:54 +0200
Received: by nz-out-0506.google.com with SMTP id m22so479002nzf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2007 09:38:52 -0700 (PDT)
Received: by 10.115.32.1 with SMTP id k1mr827579waj.1177000732375;
	Thu, 19 Apr 2007 09:38:52 -0700 (PDT)
Received: by 10.115.92.3 with HTTP; Thu, 19 Apr 2007 09:38:52 -0700 (PDT)
Message-ID: <432beae0704190938o5ae0bf04k81fe388e8faa2c09@mail.gmail.com>
Date: Thu, 19 Apr 2007 09:38:52 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <20070419162539.GA29294@fh-wedel.de>
MIME-Version: 1.0
References: <E1HeU56-0006o4-VP@linuxtogo.org>
	<157361400.20070419145713@vanille-media.de>
	<1176998423.5833.99.camel@localhost.localdomain>
	<20070419162539.GA29294@fh-wedel.de>
Subject: Re: [oe-commits] org.oe.dev mtx-3a.conf, nylon-image-base.bb: removed remaints from old OE code (PACKAGE_INSTALL instead of IPKG_INSTALL)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2007 16:38:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/19/07, Martin Dietze <di@fh-wedel.de> wrote:
> On Thu, April 19, 2007, Richard Purdie wrote:
>
> > > > -inherit image_ipk
> > > > -inherit nylon_image
> > > > -LICENSE = MIT
> > > > +inherit image
> > > > +inherit nylon-image
> > > > +LICENSE = "MIT"
> > >
> > > Are you sure about that? image_ipk looks about right for me.
> >
> > image_ipk is incorrect and I'd mentioned this being a problem on the
> > mailing list - it was causing parsing errors. We have multiple image
> > generation types now and selecting them like that in .bb files doesn't
> > make sense so images just inherit image.
>
> I just noticed that not inheriting image_ipk actually gives me
> problems because ipkg-native is no longer automatically
> DEPENDed. Is this a bug or a featuer? In the latter case -
> where are maintainers supposed to put the necessary
> configuration?
>

I believe that is meant to be inherited on a distro level. The images
are generic and the distro chooses what package format it wants to
use.

-- 
Justin Patrin



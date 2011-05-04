Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QHfNc-0001J3-Aq
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 18:56:52 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QHfGr-0000uL-LO
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 18:49:53 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DC17C80.3060001@gravedo.de>
References: <1304524228-25642-1-git-send-email-morphis@gravedo.de>
	<1304525388.15795.386.camel@phil-desktop> <4DC17C80.3060001@gravedo.de>
Date: Wed, 04 May 2011 17:54:14 +0100
Message-ID: <1304528054.15795.417.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] cmake.bbclass: set the rpath for binaries build with cmake to ${libdir}
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
X-List-Received-Date: Wed, 04 May 2011 16:56:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-04 at 18:19 +0200, Simon Busch wrote:
> On 04.05.2011 18:09, Phil Blundell wrote:
> > On Wed, 2011-05-04 at 17:50 +0200, Simon Busch wrote:
> >> +# We need to set the rpath to the correct directory as cmake does not provide any
> >> +# directory as rpath by default
> >> +  echo "set( CMAKE_INSTALL_RPATH ${libdir} )" >> ${WORKDIR}/toolchain.cmake
> > 
> > Shouldn't this be inside some kind of guard for native?  You don't want
> > rpath in target binaries, do you?
> 
> Thanks for the hint!
> 
> You mean something like:
> 
> if not bb.data.inherits_class('native', d)
>    and not bb.data.inherits_class('cross', d):

I think you have the sense backwards but yes, that's the general idea.
Though I must admit I don't quite understand why the rpath setting from
BUILD_LDFLAGS is not turning up in cmake's final link.  It might be
worth investigating why that isn't working for you in case this patch is
just papering over some deeper problem.

p.





Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1Iy9ae-0006Id-UD
	for openembedded-devel@openembedded.org; Fri, 30 Nov 2007 18:23:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lAUHKeYM015692
	for <openembedded-devel@openembedded.org>; Fri, 30 Nov 2007 17:20:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15525-04 for <openembedded-devel@openembedded.org>;
	Fri, 30 Nov 2007 17:20:36 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lAUHKXO6015686
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 30 Nov 2007 17:20:33 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <432beae0711300821n2783416n645bcefecfbef4d@mail.gmail.com>
References: <f96d234e0711300615kb15b49bif5d815156f3b12c3@mail.gmail.com>
	<432beae0711300821n2783416n645bcefecfbef4d@mail.gmail.com>
Date: Fri, 30 Nov 2007 17:20:32 +0000
Message-Id: <1196443233.6783.47.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: creating ipks for all package dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2007 17:23:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-11-30 at 08:21 -0800, Justin Patrin wrote:
> On Nov 30, 2007 6:15 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> > I recently ran into an issue where I bitbake'd subversion.  I then
> > tried to install subversion from an ipkg feed, and ipkg complained
> > about dependencies not being available (neon, etc).  It turns out that
> > bitbake does not run the do_package_write_ipk task due to recent
> > corrections in the way dependencies are handled, so the ipks for
> > subversion dependencies where not in the feeds.  Richard suggested
> > merging a task from poky that forces all ipk files to be generated.
> > It has not been merged in OE, and to use do the following:
> >
> > bitbake <your recipe> -c buildall
> >
> > This will force ipks for all dependencies of <your recipe> to be built
> > as well as the package you are building.
> 
> This really sounds like a bug to me....why would bitbake not build the
> ipks for runtime dependencies of a package?

Its not a bug. It does depend what you define "bitbake x" to mean.

One definition is run target x's do_build task and any dependent tasks.

Another definition could be to run target x's do_build task and the
do_build tasks of any dependencies.

OE defines what "do_build" is and can therefore chose between the above
choices, it isn't a bitbake problem. Both have use cases. The second
definition breaks the first, adding a buildall task makes both use cases
possible. If you always want buildall you can set BB_DEFAULT_TASK =
"buildall" in local.conf in theory to.

So hopefully we've got the flexible solution which lets everyone do what
they want/need?

Cheers,

Richard




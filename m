Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HUONP-0004gY-Ly
	for openembedded-devel@openembedded.org; Thu, 22 Mar 2007 15:34:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2MEYppJ012045;
	Thu, 22 Mar 2007 14:34:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11823-03; Thu, 22 Mar 2007 14:34:48 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2MEYjHd012036
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 22 Mar 2007 14:34:46 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20070320033120.GA8678@thegnar.org>
References: <20070320033120.GA8678@thegnar.org>
Date: Thu, 22 Mar 2007 14:34:45 +0000
Message-Id: <1174574086.5949.32.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bitbake and OE opperation
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
X-List-Received-Date: Thu, 22 Mar 2007 14:34:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2007-03-19 at 20:31 -0700, Mark Gross wrote:
> I'm trying to understand the way bit bake builds the dependency trees
> and works at a low level.   Trying to reverse engineer it from the
> python code is difficult.  Does anyone recommend any browser tools for
> navigating a large python code base like bit bake?

I don't have any tools to recommend to help with this but you might find
the recent trunk versions easier to follow as the parts are more split
into modules.

> I've read the documentation pages I could find but I haven't found any
> "theory of operation" types of documents.  Are there any such things?

Did you read the bitbake manual? If so, thats around as low level as the
documentation goes since most OE users don't usually need to delve into
what bitbake does behind the scenes and the manual is a mostly complete
document of its API.

If you are interested, there are emails in the archive talking about
specific changes that have been made to the code such as multithreading.
Also, if there is anything you want clarified, I'm happy to explain
things if I can.

> The questions I have are:
> How does a simple command line "bitbake slogos-image" translate into
> building all the components?  

Bitbake only looks at a small subset of the metadata and is conceptually
quite simple. Speaking in simply terms, bitbake looks at what each file
PROVIDES and also what each file DEPENDS on.

Once it has a target, it can look at what dependencies it needs (from
DEPENDS and maybe RDEPENDS). It can then find providers for those
dependencies which can be influenced by things like PREFERRED_PROVIDER
and PREFERRED_VERSION. This cycle then repeats until it has a build
chain. It converts that chain into a list of tasks and then executes
each task in turn.

In bitbake trunk, taskdata.py generates the metadata model in memory and
then runqueue.py "compiles" that metedata into a single queue and builds
it. If a task fails, it can recompile the metadata and try a different
build path should the user wish.

Note that bitbake 1.6 or less handles this totally differently and the
code was rewritten in 1.7 onwards.

> How does bitbake push in the ./configure command line options?

Bitbake knows nothing about this, it just knows about a list of tasks.
autotools.bbclass defines a do_configure task which knows how to pass
options set in an EXTRA_OECONF variable to a configure commandline. The
classes are a powerful abstraction feature but are part of OE, not
bitbake.

> Are there tools for doing analysis on the open embedded bb library?  

What kind of analysis?

Regards,

Richard






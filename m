Received: from [63.231.195.116] (helo=mpls-qmqp-05.inet.qwest.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <indigo_red@qwest.net>) id 1HUS9u-000088-N3
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2007 19:37:11 +0100
Received: from mpls-pop-15.inet.qwest.net (mpls-pop-15.inet.qwest.net
	[63.231.195.15])
	by mpls-qmqp-05.inet.qwest.net (Postfix) with QMQP id 0AFC162D644
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2007 18:37:10 +0000 (UTC)
Received: from wsip-70-167-201-107.ph.ph.cox.net (HELO DELLLee.qwest.net)
	(70.167.201.107)
	by mpls-pop-15.inet.qwest.net with SMTP; 22 Mar 2007 18:37:08 -0000
Message-Id: <5.1.1.6.2.20070322113306.03239e70@mail.phnx.qwest.net>
X-Sender: indigo_red@mail.phnx.qwest.net
X-Mailer: QUALCOMM Windows Eudora Version 5.1.1
Date: Thu, 22 Mar 2007 11:37:12 -0700
To: openembedded-devel@lists.openembedded.org
From: Lee Studley <indigo_red@qwest.net>
In-Reply-To: <1174574086.5949.32.camel@localhost.localdomain>
References: <20070320033120.GA8678@thegnar.org>
	<20070320033120.GA8678@thegnar.org>
Mime-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
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
X-List-Received-Date: Thu, 22 Mar 2007 18:37:12 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hi,
I personally like www.activestate.com/Products/Komodo/   komodo
( linux and Windows ) for searching large projects. About $30 and is well 
worth it.

It has good grepping and module/object search tools. It can do single 
stepping and breakpoints in Python ( and other langs ) within the gui and 
some pretty good variable watch windows.
-Lee


At 02:34 PM 3/22/2007 +0000, you wrote:
>Hi,
>
>On Mon, 2007-03-19 at 20:31 -0700, Mark Gross wrote:
> > I'm trying to understand the way bit bake builds the dependency trees
> > and works at a low level.   Trying to reverse engineer it from the
> > python code is difficult.  Does anyone recommend any browser tools for
> > navigating a large python code base like bit bake?
>
>I don't have any tools to recommend to help with this but you might find
>the recent trunk versions easier to follow as the parts are more split
>into modules.
>
> > I've read the documentation pages I could find but I haven't found any
> > "theory of operation" types of documents.  Are there any such things?
>
>Did you read the bitbake manual? If so, thats around as low level as the
>documentation goes since most OE users don't usually need to delve into
>what bitbake does behind the scenes and the manual is a mostly complete
>document of its API.
>
>If you are interested, there are emails in the archive talking about
>specific changes that have been made to the code such as multithreading.
>Also, if there is anything you want clarified, I'm happy to explain
>things if I can.
>
> > The questions I have are:
> > How does a simple command line "bitbake slogos-image" translate into
> > building all the components?
>
>Bitbake only looks at a small subset of the metadata and is conceptually
>quite simple. Speaking in simply terms, bitbake looks at what each file
>PROVIDES and also what each file DEPENDS on.
>
>Once it has a target, it can look at what dependencies it needs (from
>DEPENDS and maybe RDEPENDS). It can then find providers for those
>dependencies which can be influenced by things like PREFERRED_PROVIDER
>and PREFERRED_VERSION. This cycle then repeats until it has a build
>chain. It converts that chain into a list of tasks and then executes
>each task in turn.
>
>In bitbake trunk, taskdata.py generates the metadata model in memory and
>then runqueue.py "compiles" that metedata into a single queue and builds
>it. If a task fails, it can recompile the metadata and try a different
>build path should the user wish.
>
>Note that bitbake 1.6 or less handles this totally differently and the
>code was rewritten in 1.7 onwards.
>
> > How does bitbake push in the ./configure command line options?
>
>Bitbake knows nothing about this, it just knows about a list of tasks.
>autotools.bbclass defines a do_configure task which knows how to pass
>options set in an EXTRA_OECONF variable to a configure commandline. The
>classes are a powerful abstraction feature but are part of OE, not
>bitbake.
>
> > Are there tools for doing analysis on the open embedded bb library?
>
>What kind of analysis?
>
>Regards,
>
>Richard
>
>
>
>
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


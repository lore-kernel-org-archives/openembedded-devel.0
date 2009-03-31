Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LomGv-0001Bv-AR
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 00:17:31 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHE0022W5SRCGE3@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	31 Mar 2009 17:14:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D6A296B83A8; Tue,
	31 Mar 2009 18:14:50 -0400 (EDT)
Date: Tue, 31 Mar 2009 18:14:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090331221450.GA31451@denix.org>
References: <1238452829.7128.4.camel@alap> <gqsel4$g9v$1@ger.gmane.org>
	<1238511677.7128.86.camel@alap>
MIME-version: 1.0
In-reply-to: <1238511677.7128.86.camel@alap>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] add hotplug2 package
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
X-List-Received-Date: Tue, 31 Mar 2009 22:17:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 31, 2009 at 09:01:17AM -0600, Angus Ainslie wrote:
> > > +LDFLAGS += "-lglibc"
> > 
> > I don't think that actually works, and if it did, uclibc would break
> 
> Without that I get undefined refeences
> 
>  loader.c:(.text+0x14): undefined reference to `dlclose'
>  workers/loader.o: In function `worker_load':
>  loader.c:(.text+0x44): undefined reference to `dlopen'
>  loader.c:(.text+0x5c): undefined reference to `dlsym'
>  loader.c:(.text+0x84): undefined reference to `dlerror'
> 
> > > +do_configure () {
> > > +}
> > 
> > missing colon between the braces. But more importantly: why inherit 
> > autotools when you're not going to run configure?
> 
> I was under the mistaken impression that autotools need to be included
> to get do_compile() and do_install(). It seems those are the defaults.
> 
> There is a deeper problem that without the inherit autotools then the
> LDFLAGS above fails to find glibc. Is there something missing in the
> default case ?

Wow, I'm surprised "-lglibc" above even worked for you:

$ find rootfs -name 'libglibc*'
$

Those undefined references above are provided by libdl.so, which needs:

LDFLAGS += " -ldl"

And no need for autotools.

-- 
Denys



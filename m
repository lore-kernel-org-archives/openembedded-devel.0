Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1L0KjK-000526-ID
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Nov 2008 19:46:18 +0100
Received: from gandalf.denix.org ([71.255.226.167]) by vms173007.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KA800L91HC6KUY0@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	12 Nov 2008 12:43:19 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 385166B83B5; Wed,
	12 Nov 2008 13:44:16 -0500 (EST)
Date: Wed, 12 Nov 2008 13:44:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <1226236934.5378.7.camel@dax.rpnet.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081112184416.GA6234@denix.org>
MIME-version: 1.0
References: <20081023230928.GA21151@denix.org>
	<f96d234e0810240638u1026aec9y6b258bba5708315f@mail.gmail.com>
	<1224861430.6356.20.camel@dax.rpnet.com>
	<f96d234e0811071157j71bc59bbjf71e865c32e40a81@mail.gmail.com>
	<1226236934.5378.7.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: RFC: Add http_proxy and ftp_proxy to BitBake white list
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
X-List-Received-Date: Wed, 12 Nov 2008 18:46:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Nov 09, 2008 at 01:22:14PM +0000, Richard Purdie wrote:
> On Fri, 2008-11-07 at 14:57 -0500, Cliff Brake wrote:
> > I've attempted to merge your patches and test, but the http_proxy is
> > still not preserved for wget.  A few notes:
> > 
> > wget does not pass through runfetchcmd() so exportvars stuff never
> > gets called there.
> > 
> > try_mirror also has some http_proxy stuff, but it does not appear to
> > be used by wget.
> > 
> > wget.py looks at HTTP_PROXY, but why HTTP_PROXY vs http_proxy?  If I
> > set HTTP_PROXY in local.conf, it then works.

Richard,

Thanks for your work.

> For various reasons I've now had some experience of using bitbake behind
> some pretty strict proxy setups. The problem is that its not as simple
> as just setting http_proxy since some addresses need to go through the
> proxy but things like a local source mirror might be on an internal
> network and therefore shouldn't go through the proxy.

Why not use the standard $no_proxy environment variable to list addresses 
inside the firewall?

> I hence reworked things so you set HTTP_PROXY but can also set
> HTTP_PROXY_IGNORE which is a list of base urls which should not use the
> proxy. The fetcher code will only set http_proxy to HTTP_PROXY if the
> url is not in the ignore list.
> 
> FTP_PROXY and ftp_proxy works in a similar way.

Looks redundant, as it can be achieved like this:

$ export http_proxy=proxy.company.com:80
$ export no_proxy=company.com,interweb.net

> > So, is the idea the user has to set HTTP_PROXY in a conf file for wget
> > proxy to work?  What are the downsides to using http_proxy from the
> > environment?  At any rate, it seems like we have some inconsistencies
> > in the various fetcher methods.
> 
> The idea is the user sets HTTP_PROXY and optionally HTTP_PROXY_IGNORE to
> make http proxying work. I'm planning to make bitbake ignore http_proxy
> from the environment due to the problems is causes with mirror servers
> behind the proxy.
> 
> Hopefully this clears up the intent of the patches, the improvements are
> based on real world usage problems.

Even though I'd prefer it to be fixed properly with 15-year-old http_proxy and 
no_proxy environment variables, it does not matter too much, as long as any 
kind of http/ftp proxy support is merged into upstream BitBake, please. :) 
Thanks.

-- 
Denys



Received: from [206.46.252.42] (helo=vms042pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1L0WfE-0003zI-Sc
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Nov 2008 08:30:53 +0100
Received: from gandalf.denix.org ([71.255.226.167])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0KA90070WGS019C2@vms042.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	13 Nov 2008 01:28:49 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 072536B83A8; Thu,
	13 Nov 2008 02:28:48 -0500 (EST)
Date: Thu, 13 Nov 2008 02:28:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20081112184416.GA6234@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081113072847.GA9523@denix.org>
MIME-version: 1.0
References: <20081023230928.GA21151@denix.org>
	<f96d234e0810240638u1026aec9y6b258bba5708315f@mail.gmail.com>
	<1224861430.6356.20.camel@dax.rpnet.com>
	<f96d234e0811071157j71bc59bbjf71e865c32e40a81@mail.gmail.com>
	<1226236934.5378.7.camel@dax.rpnet.com>
	<20081112184416.GA6234@denix.org>
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
X-List-Received-Date: Thu, 13 Nov 2008 07:30:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Nov 12, 2008 at 01:44:16PM -0500, Denys Dmytriyenko wrote:
> On Sun, Nov 09, 2008 at 01:22:14PM +0000, Richard Purdie wrote:
> > For various reasons I've now had some experience of using bitbake behind
> > some pretty strict proxy setups. The problem is that its not as simple
> > as just setting http_proxy since some addresses need to go through the
> > proxy but things like a local source mirror might be on an internal
> > network and therefore shouldn't go through the proxy.
> 
> Why not use the standard $no_proxy environment variable to list addresses 
> inside the firewall?
> 
> > I hence reworked things so you set HTTP_PROXY but can also set
> > HTTP_PROXY_IGNORE which is a list of base urls which should not use the
> > proxy. The fetcher code will only set http_proxy to HTTP_PROXY if the
> > url is not in the ignore list.
> > 
> > FTP_PROXY and ftp_proxy works in a similar way.
> 
> Looks redundant, as it can be achieved like this:
> 
> $ export http_proxy=proxy.company.com:80
> $ export no_proxy=company.com,interweb.net
> 
> > > So, is the idea the user has to set HTTP_PROXY in a conf file for wget
> > > proxy to work?  What are the downsides to using http_proxy from the
> > > environment?  At any rate, it seems like we have some inconsistencies
> > > in the various fetcher methods.
> > 
> > The idea is the user sets HTTP_PROXY and optionally HTTP_PROXY_IGNORE to
> > make http proxying work. I'm planning to make bitbake ignore http_proxy
> > from the environment due to the problems is causes with mirror servers
> > behind the proxy.
> > 
> > Hopefully this clears up the intent of the patches, the improvements are
> > based on real world usage problems.
> 
> Even though I'd prefer it to be fixed properly with 15-year-old http_proxy and 
> no_proxy environment variables, it does not matter too much, as long as any 
> kind of http/ftp proxy support is merged into upstream BitBake, please. :) 
> Thanks.

And speaking of proxies - since recently you removed GIT_PROXY_COMMAND from 
the list of exported variables, what's the correct method of using Git behind 
the proxy with BitBake?

-- 
Denys



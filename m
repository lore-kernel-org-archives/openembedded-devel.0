Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KzARa-0001Mc-8K
	for openembedded-devel@openembedded.org; Sun, 09 Nov 2008 14:35:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mA9DMMnL016196
	for <openembedded-devel@openembedded.org>; Sun, 9 Nov 2008 13:22:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16051-04 for <openembedded-devel@openembedded.org>;
	Sun,  9 Nov 2008 13:22:19 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mA9DME1S016188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 9 Nov 2008 13:22:14 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <f96d234e0811071157j71bc59bbjf71e865c32e40a81@mail.gmail.com>
References: <20081023230928.GA21151@denix.org>
	<f96d234e0810240638u1026aec9y6b258bba5708315f@mail.gmail.com>
	<1224861430.6356.20.camel@dax.rpnet.com>
	<f96d234e0811071157j71bc59bbjf71e865c32e40a81@mail.gmail.com>
Date: Sun, 09 Nov 2008 13:22:14 +0000
Message-Id: <1226236934.5378.7.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Sun, 09 Nov 2008 13:35:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Cliff,

On Fri, 2008-11-07 at 14:57 -0500, Cliff Brake wrote:
> I've attempted to merge your patches and test, but the http_proxy is
> still not preserved for wget.  A few notes:
> 
> wget does not pass through runfetchcmd() so exportvars stuff never
> gets called there.
> 
> try_mirror also has some http_proxy stuff, but it does not appear to
> be used by wget.
> 
> wget.py looks at HTTP_PROXY, but why HTTP_PROXY vs http_proxy?  If I
> set HTTP_PROXY in local.conf, it then works.

For various reasons I've now had some experience of using bitbake behind
some pretty strict proxy setups. The problem is that its not as simple
as just setting http_proxy since some addresses need to go through the
proxy but things like a local source mirror might be on an internal
network and therefore shouldn't go through the proxy.

I hence reworked things so you set HTTP_PROXY but can also set
HTTP_PROXY_IGNORE which is a list of base urls which should not use the
proxy. The fetcher code will only set http_proxy to HTTP_PROXY if the
url is not in the ignore list.

FTP_PROXY and ftp_proxy works in a similar way.

> So, is the idea the user has to set HTTP_PROXY in a conf file for wget
> proxy to work?  What are the downsides to using http_proxy from the
> environment?  At any rate, it seems like we have some inconsistencies
> in the various fetcher methods.

The idea is the user sets HTTP_PROXY and optionally HTTP_PROXY_IGNORE to
make http proxying work. I'm planning to make bitbake ignore http_proxy
from the environment due to the problems is causes with mirror servers
behind the proxy.

Hopefully this clears up the intent of the patches, the improvements are
based on real world usage problems.

Cheers,

Richard






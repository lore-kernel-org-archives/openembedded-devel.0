Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Md2J1-0005oL-Ia
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 15:31:24 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id D85FA1B10C07
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 13:18:05 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 15:13:48 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1250260162-9541-1-git-send-email-oe-devel@rolf.leggewie.biz>
In-Reply-To: <1250260162-9541-1-git-send-email-oe-devel@rolf.leggewie.biz>
MIME-Version: 1.0
Message-Id: <200908171513.49062.holger+oe@freyther.de>
Subject: Re: [PATCH] base.bbclass: introduce OE source mirror network as last resort for do_fetch
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
X-List-Received-Date: Mon, 17 Aug 2009 13:31:28 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 14 August 2009 16:29:22 Rolf Leggewie wrote:
> Updating recipes and checksums.ini for vanishing upstream hosts or simple
> restructuring can quickly become a chore for OE devs if taken seriously.
> The OE user experience suffers severely when at any given point in time 4
> to 5 recipes on average fail do_fetch for a simple image.
>
> The solution is for OE to provide its own caching of upstream sources.
> mirrors.openembedded.org is a swarm of possibly incomplete source mirrors
> provided by the community and load-balanced via DNS round robin.  They
> act as a first line of defense and lower bandwidth load on melo which
> hosts sources.openembedded.org.  The melo mirror aims to have a complete
> copy of free-to-publish sources used by the current org.oe.dev branch.
>
> Some distributions have provided source mirrors in the past for their
> users. I think it's time for a general and all-encompassing solution.
>
> The infrastructure is being currently put in place.  This patch will
> turn on the OE sources mirror network by default.

Acked-by: Holger Freyther <zecke@selfish.org>

I think having a last resort is good to have. Some recipes are unfetchable 
faster than you can commit it (fakeroot I look like you...giving me that hong 
kong feeling)


> ---
>  classes/base.bbclass |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 5363e5c..51648da 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -1312,6 +1312,10 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/ 
> ftp://gd.tuwien.ac.at/utils/adm
> ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/ 
> ftp://sunsite.ualberta.ca/pub/Mirror/lsof/
> ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/ 
> ftp://the.wiretapped.net/pub/security/host-security/lsof/
> http://www.apache.org/dist  http://archive.apache.org/dist
> +ftp://.*/.*     http://mirrors.openembedded.org/
> +https?$://.*/.* http://mirrors.openembedded.org/
> +ftp://.*/.*     http://sources.openembedded.org/
> +https?$://.*/.* http://sources.openembedded.org/
>
>  }



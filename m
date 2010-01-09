Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NTOpf-00053k-28
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 01:05:35 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KVY00LFCDGW7XT3@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	08 Jan 2010 18:03:01 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3958614AF60; Fri,
	08 Jan 2010 19:02:56 -0500 (EST)
Date: Fri, 08 Jan 2010 19:02:56 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100109000256.GA31902@denix.org>
References: <1262985279.3445.2.camel@pblack-ubuntu>
MIME-version: 1.0
In-reply-to: <1262985279.3445.2.camel@pblack-ubuntu>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: small fix for u-boot on DM365 DVM
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
X-List-Received-Date: Sat, 09 Jan 2010 00:05:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 08, 2010 at 04:14:39PM -0500, Phil Black wrote:
> The machine conf for the davinci dm365 EVM board was wrong.  This patch
> fixes it.
> 
> diff --git a/conf/machine/dm365-evm.conf b/conf/machine/dm365-evm.conf
> index 1fd5123..5a51616 100644
> --- a/conf/machine/dm365-evm.conf
> +++ b/conf/machine/dm365-evm.conf
> @@ -5,4 +5,4 @@
>  require conf/machine/include/davinci.inc
>  require conf/machine/include/dm365.inc
>  
> -UBOOT_MACHINE = "davinci_dm365evm_config"
> +UBOOT_MACHINE = "davinci_dm365_evm_config"

Unfortunately, it's not that simple. U-boot 2009.08 and later uses dm365evm 
name, while older versions use dm365_evm name. The latest update to u-boot 
recipe changed PV forward to 2009.11-rc1, while SRCREV was changed backwards 
to 2009.06-rc0, which is not correct. So, the actual code was downgraded, but 
the name change was not reflected in the conf file...
The above inconsistency needs to be changed first before changing the name.

-- 
Denys



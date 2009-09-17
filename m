Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mo5Iq-0006ex-EN
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 02:56:55 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQ3004JXBWXSHF4@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Sep 2009 19:55:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D277214AF5F; Wed,
	16 Sep 2009 20:55:44 -0400 (EDT)
Date: Wed, 16 Sep 2009 20:55:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090917005544.GB3599@denix.org>
References: <4AB0BBA2.8030607@iki.fi>
MIME-version: 1.0
In-reply-to: <4AB0BBA2.8030607@iki.fi>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] armv5te mentioned twice on eabi-capable list
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
X-List-Received-Date: Thu, 17 Sep 2009 00:56:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Sep 16, 2009 at 01:19:14PM +0300, Aleksandr Koltsoff wrote:
> (My first patch generated with git, please be gentle :-).
> 
> armv5te is mentioned twice in the arm_eabi_supporting_arches list of
> sane-toolchain.inc. Remove the latter occurance.
> 
>  def compute_os_portion_of_target_triplet (d):
>  	import bb
>  	arm_eabi_supporting_arches = "armv6 armv6-novfp \
> -	armv5te iwmmxt armv7a armv7 armv6 armv5teb armv5te armv4t"
> +	armv5te iwmmxt armv7a armv7 armv6 armv5teb armv4t"

Looks like armv6 is also mentioned twice...

>  	ppc_spe_supporting_arches = "ppce500v2 ppce500"

Denys



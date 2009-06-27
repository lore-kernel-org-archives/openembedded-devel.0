Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MKRdD-0005Bi-D1
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Jun 2009 08:43:23 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLV00FZMWSOSXJ2@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	27 Jun 2009 01:31:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E439D14AF5F; Sat,
	27 Jun 2009 02:31:35 -0400 (EDT)
Date: Sat, 27 Jun 2009 02:31:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090627063135.GA22521@denix.org>
References: <7D58AE12-9642-4B1C-97F4-075F1E7447D3@mac.com>
	<1246037427.8887.73.camel@lenovo.internal.reciva.com>
	<385B45B4-00BE-45E6-BDD1-81EE7DBF7B83@mac.com>
	<20090627044253.GA22137@denix.org>
	<70A323C0-6A73-4282-91BC-5E78D23B03F0@mac.com>
MIME-version: 1.0
In-reply-to: <70A323C0-6A73-4282-91BC-5E78D23B03F0@mac.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Incorrect PR number appended to /tmp/work/ recipe folder
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
X-List-Received-Date: Sat, 27 Jun 2009 06:43:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Jun 27, 2009 at 08:48:34AM +0400, Elvis Dowson wrote:
> Thanks for the info, Denys!
>
> On Jun 27, 2009, at 8:42 AM, Denys Dmytriyenko wrote:
>
>>> Why would it pick r37 of all the PV series for that particular recipe? 
>>> :-)
>>
>> conf/machine/include/omap3.inc:
>> MACHINE_KERNEL_PR = "r37"
>
> So does that mean I have to remove the PV = "r45" from my 
> linux-omap3-2.6.29.bb recipe file?

You don't have to remove it, but it means your actual PR is being set from 
MACHINE_KERNEL_PR regardless of what you set it in the recipe.

-- 
Denys



Received: from [17.148.16.98] (helo=asmtpout023.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MsQc8-0000rT-Fb
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 02:30:47 +0200
MIME-version: 1.0
Received: from [87.201.169.202] by asmtp023.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KQP00674IPV8850@asmtp023.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	28 Sep 2009 17:30:00 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <1254173087.29003.54.camel@orest.ift.cs.uni-potsdam.de>
Date: Tue, 29 Sep 2009 04:29:54 +0400
Message-id: <1B3E09B5-7699-49C8-970D-8CC5A3E94E0D@mac.com>
References: <1254173087.29003.54.camel@orest.ift.cs.uni-potsdam.de>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1076)
X-SA-Exim-Connect-IP: 17.148.16.98
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How do I build OE for PPC-405 inside Virtex 4?
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
X-List-Received-Date: Tue, 29 Sep 2009 00:30:47 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii; format=flowed; delsp=yes

Hi,

On Sep 29, 2009, at 1:24 AM, Ali Akbar Zarezadeh wrote:

>
> Starting Dropbear SSH server: modprobe: FATAL: Could not
> load /lib/modules/2.6.29-rc5/modules.dep: No such file or directory
>
> modprobe: FATAL: Could not load /lib/modules/2.6.29-rc5/modules.dep:  
> No
> such file or directory
>
> ----------------------------------------------------------------------------------------------------------------------
>
> Considering the log, I have checked the /lib/modules/ directory in  
> my OE
> and it seems the version is "oe/tmp/rootfs/lib/modules/2.6.24-rc3"  
> and I
> guess maybe the problem is the mismatch between the version of Linux
> kernel from Xilinx and OE. IF it is the reason, what should be the
> solution?
>

I've seen a similar error message, when building a higher version  
linux-omap3 recipe, say linux-omap3-2.6.31, and then do a bitbake  
clear linux-omap3-2.6.31 and build a lower version of the linux- 
omap3-2.6.29 and create the rootfs, after disabling the linux- 
omap3-2.6.31 recipe.

The net result is that when the rootfs gets built, the /lib/modules  
folder contains files from both the v2.6.31 and v2.6.29 recipes, and  
give me the same version mismatch error message that you're seeing  
right now.

The solution is to completely delete you OE tmp folder and rebuild  
again, ensuring that only a single version of the recipe gets built.

Best regards,

Elvis




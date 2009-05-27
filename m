Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M9P04-0008GU-32
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 May 2009 21:41:20 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KKB00I2REWU0456@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	27 May 2009 13:19:48 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8FE0014AF5F; Wed,
	27 May 2009 14:19:42 -0400 (EDT)
Date: Wed, 27 May 2009 14:19:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090527181942.GA22904@denix.org>
References: <4A1C49B6.5050108@soundmetrics.com>
	<4A1D5C11.5020905@soundmetrics.com>
MIME-version: 1.0
In-reply-to: <4A1D5C11.5020905@soundmetrics.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] PowerVR init script
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
X-List-Received-Date: Wed, 27 May 2009 19:41:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 27, 2009 at 08:28:17AM -0700, John Faith wrote:
> John Willis wrote:
>>> Hello,
>>> Please review the attached patch which lets the PowerVR init script
>>> handle start, stop and restart.
>>
>> I could have sworn I pushed this as a patch some time ago but it must have
>> got lost.
>> This is the PowerVR init script we have been using for some time without
>> issue on the Beagle and Pandora.
>>
>> It supports start/stop/restart/force-reload and modprobes the modules 
>> rather
>> than the insmod/find combo.
>> Other than that it is comparable to your patch.
>>
>> One other note is that you will need to bump the PR on the libgles-omap3_*
>> recipes (esp. 3.00.00.06 as that is the one in common use) so that the new
>> script gets baked in.
>
> Hi John,
> Your script works for me if I use insmod instead of modprobe, since it 
> seems that the default arago-base-image busybox does not have depmod 

John,

That is an outdated info - arago-base-image now includes full module-init-tools 
with depmod:
http://arago-project.org/files/releases/2009.05-rc1/images/arago/arago-base-image-glibc-ipk-2009.05-arago-testlab/installed-packages.txt

> enabled.  Also the devmem2 package was not enabled, but that's easy to fix.
>
> It looks like you submitted a patch 2009-03-06.  Did you get any feedback?

-- 
Denys



Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LeMyc-0005Bh-S4
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 06:15:35 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFW00LPNZQOMQRV@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	02 Mar 2009 23:11:13 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 043416B83B5; Tue,
	03 Mar 2009 00:11:11 -0500 (EST)
Date: Tue, 03 Mar 2009 00:11:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090303051111.GD26643@denix.org>
References: <gh8v57$5nk$1@ger.gmane.org> <49380C4F.1050809@dls.net>
	<49380EAC.5020809@dls.net> <gh94ov$rdk$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <gh94ov$rdk$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: invalidating udev cache, how?
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
X-List-Received-Date: Tue, 03 Mar 2009 05:15:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Dec 04, 2008 at 06:41:50PM +0100, Koen Kooi wrote:
> On 04-12-08 18:09, Mike (mwester) wrote:
>> Mike (mwester) wrote:
>>
>>> A slight improvement would be to make the dev.tar file dependent upon
>>> the bootargs; i.e. invalidate /etc/dev.tar file if the boot command line
>>> doesn't match the current command line.  This could be a very fast
>>> operation, just "cmp /proc/cmdline /etc/dev_cmdline" or similar.
>>
>> As I consider this further, we could actually just save and compare
>> /proc/atags if that's present on the device in question (falling back to
>> /proc/cmdline if not present).  That would catch *any* changes passed in
>> to the kernel via the bootloader.
>>
>> Flashing a new kernel would seem to be another logical place to
>> invalidate the cache, so adding a comparison of "uname -rv" would be a
>> reasonable way to catch that.
>
> That should indeed take care of bootargs and kernel version changes. I'm 
> still tempted to add option 2) to all that :)

Sorry for bringing up this old discussion. Are there any plans to implement 
the above checks in udev?

-- 
Denys



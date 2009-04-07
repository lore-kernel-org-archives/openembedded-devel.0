Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LrF5u-0006OA-Qr
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 19:28:31 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHQ00B2CR189AWY@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Apr 2009 12:24:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 345706B83B5; Tue,
	07 Apr 2009 13:24:44 -0400 (EDT)
Date: Tue, 07 Apr 2009 13:24:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090407172444.GB11203@denix.org>
References: <mailman.55349.1238837263.4692.openembedded-devel@lists.openembedded.org>
	<49DB651F.7060408@cs.cmu.edu>
MIME-version: 1.0
In-reply-to: <49DB651F.7060408@cs.cmu.edu>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: /linuxrc link to /bin/busybox causes booting to fail, (sysvinit should be used instead)
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
X-List-Received-Date: Tue, 07 Apr 2009 17:28:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 07, 2009 at 10:37:19AM -0400, David Huggins-Daines wrote:
>>
>> On 03-04-09 22:44, David Huggins-Daines wrote:
>>> > Hi,
>>> >
>>> > When booting base-image or minimal-image from a ramdisk, I get errors
>>> > like the following:
>>
>> Do you have 
>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=5261978d6f9600640c1ea4f1393e18772d4f9657 
>> in your OE tree?
>>   
> I do, I think, but actually I discovered the reason for this.  It's a 
> subtlety of the Linux boot process which I didn't previously understand.  
> Basically the kernel will use /linuxrc as init if and only if the root 
> filesystem on the command line is different from the root partition.  So if 
> you are using a ramdisk root (and not an initrd), you need to put 
> root=/dev/ram0 on the kernel command line.

As I told you before - your bootargs is to blame. Sorry I was not very 
specific, but I've seen it fail the same exact way when there was a spelling 
problem in root= option or it was missing entirely...

-- 
Denys



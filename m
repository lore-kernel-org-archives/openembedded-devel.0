Received: from [64.233.182.191] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1IyuUp-0000cG-6S
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Dec 2007 20:28:55 +0100
Received: by nf-out-0910.google.com with SMTP id h3so2279966nfh
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2007 11:25:33 -0800 (PST)
Received: by 10.78.201.2 with SMTP id y2mr831003huf.1196623533184;
	Sun, 02 Dec 2007 11:25:33 -0800 (PST)
Received: from ?10.0.0.6? ( [85.99.157.98])
	by mx.google.com with ESMTPS id h7sm10992646nfh.2007.12.02.11.25.28
	(version=SSLv3 cipher=OTHER); Sun, 02 Dec 2007 11:25:29 -0800 (PST)
Date: Sun, 2 Dec 2007 21:27:34 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <525897579.20071202212734@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <475283BC.2030903@whitby.id.au>
References: <47520EA7.8030507@whitby.id.au> <47526A83.30109@student.utwente.nl>
	<475283BC.2030903@whitby.id.au>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Inclusion of bootloader utilities in task-base
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Dec 2007 19:28:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Sunday, December 2, 2007, 12:06:52 PM, you wrote:

> Koen Kooi wrote:
>> Rod Whitby schreef:
>>> Some MACHINE configurations have FEATURES defined for 'uboot' and
>>> 'redboot'.  It looks like these are intended to identify the bootloader
>>> used on that machine.
>> 
>>> These turn on additions to RDEPENDS in task-base for some bootloader
>>> utilities.
>> 
>>> RFC #2: Shouldn't these be RRECOMMENDS unless they are absolutely
>>> critical, so that you can ipkg remove them if you don't want them.
>> 
>> I'm not familiar with the finer points of bootloaders, so I'm not really
>> qualified to respond to this, but if the utils are _critical_, they
>> should be RDEPENDS in task-boot, not task base.

> Agreed.  In the case of redboot and apex, they are not that critical.

> The redboot util 'fis' is used to reflash fis directory partitions.

> The apex util 'apex-env' is used to change the kernel cmdline from userspace.

  This raises the question if user should be allowed (far less
required) to change bootloader's standard cmdline as *the normal
course of using distro* (== task-base). So, maybe the 1st choice ("Is
it good idea at all") is worth more attention.

> Dunno about the uboot util package.

> -- Rod


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




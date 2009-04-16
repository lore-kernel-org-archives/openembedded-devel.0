Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LuRat-0008Hg-J6
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 15:25:36 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI700I0Q3RFL3PF@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	16 Apr 2009 08:21:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 01D176B83B5; Thu,
	16 Apr 2009 09:21:14 -0400 (EDT)
Date: Thu, 16 Apr 2009 09:21:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090416132114.GA6379@denix.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF75B@hiob.intern.dresearch.de>
	<gs6so4$8mb$2@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <gs6so4$8mb$2@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux_2.6.24.bb: patch file unavailable
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
X-List-Received-Date: Thu, 16 Apr 2009 13:25:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 16, 2009 at 11:11:32AM +0200, Koen Kooi wrote:
> On 16-04-09 10:51, Sledz, Steffen wrote:
>> linux_2.6.24.bb since 2008-02-16 14:33:38 +0000 contains
>>
>> SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.24.tar.bz2 
>> \
>>             
>> http://kamikaze.waninkoko.info/patches/2.6.24/kamikaze1/broken-out/squashfs-lzma-2.6.24.patch;patch=1 
>> \
>>
>> But this patch is no longer available there:
>>
>> $ wget 
>> http://kamikaze.waninkoko.info/patches/2.6.24/kamikaze1/broken-out/squashfs-lzma-2.6.24.patch
>> --07:58:38--  
>> http://kamikaze.waninkoko.info/patches/2.6.24/kamikaze1/broken-out/squashfs-lzma-2.6.24.patch
>>             =>  `squashfs-lzma-2.6.24.patch'
>> Resolving kamikaze.waninkoko.info... failed: Name or service not known.
>>
>> Does somebody know a new URL for that?
>
> http://www.angstrom-distribution.org/unstable/sources/squashfs-lzma-2.6.24.patch
>
>> Or should i upload a copy to the OE repo from my local sources cache?
>
> Personally I strongly dislike using patches from remote hosts, since the 
> get changed/deleted/etc beyond our control.
>
> FWIW: squashfs is now in mainline :)

But not LZMA yet.

-- 
Denys



Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OLehs-0003oQ-1C
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 17:58:03 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OLedf-000473-2n from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 08:53:23 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 7 Jun 2010 08:53:22 -0700
Received: from [172.30.80.218] ([172.30.80.218]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Jun 2010 09:53:21 -0600
Message-ID: <4C0D15F0.9090909@mentor.com>
Date: Mon, 07 Jun 2010 08:53:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C09946F.9040401@mentor.com> <201006062311.28237.roman@khimov.ru>
In-Reply-To: <201006062311.28237.roman@khimov.ru>
X-OriginalArrivalTime: 07 Jun 2010 15:53:21.0834 (UTC)
	FILETIME=[8E3BF0A0:01CB0659]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add locking on tasks that add	package_update_index_ipk
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
X-List-Received-Date: Mon, 07 Jun 2010 15:58:07 -0000
X-List-Received-Date: Mon, 07 Jun 2010 15:58:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Roman I Khimov wrote:
> В сообщении от Суббота 05 июня 2010 04:03:59 автор Tom Rini написал:
>> We add a lockfile of do_populate_sdk and do_rootfs (in rootfs_ipk) that
>> is also the lockfile that package_update_index_ipk uses.  With enough
>> threads it is possible that one image (or meta-toolchain) is attempting
>> to use the package index while another has only reached the point of
>> generating the index leading to an empty index being seen later on.
> 
> Am I right that effectively it makes rootfs creation sequential? It's bad for 
> performance.

Yes, this does introduce a bottleneck at these points.

> Probably it's time to fix ipkg-make-index to not touch index 
> files if no new packages are found as was suggested some time ago:
> 
> http://patchwork.openembedded.org/patch/744/
> 
> But thinking about it a bit more, ipkg-make-index hack won't really fix the 
> issue in this case, as we can have image A with a set of packages, image B 
> with a similar set of packages plus additional package P and then A would do 
> package_update_index_ipk and enter do_rootfs, then P gets completed, 
> package_update_index_ipk for B is started and the package index really needs 
> an update, thus things can break again.
 >
 > Maybe it's easier to make those indexes per-image for performance.

Right.  The problem is that we really need the index to be per user of 
the feed.  I don't know enough about ipkg to say if we could move the 
indices to ${WORKDIR} and keep the packages where they are (and then, 
what do folks that populate a feed need?) but that would solve this 
particular problem.

-- 
Tom Rini
Mentor Graphics Corporation



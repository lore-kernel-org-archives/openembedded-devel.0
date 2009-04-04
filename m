Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad@mail.asoft.ru>) id 1Lq1vU-0003kU-Lb
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 11:12:34 +0200
Received: from localhost ([95.72.100.66]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n3499q03020186
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 4 Apr 2009 13:09:55 +0400
Date: Sat, 4 Apr 2009 13:09:46 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@openembedded.org
Message-ID: <20090404090946.GA13413@rainbow>
References: <1237150071-24115-1-git-send-email-mad_soft@inbox.ru>
	<gqnn72$f5t$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gqnn72$f5t$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Sat, 04 Apr 2009 13:09:56 +0400 (MSD)
X-SA-Exim-Connect-IP: 83.222.19.8
X-SA-Exim-Mail-From: mad@mail.asoft.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] base-files: add noatime to rootfs mount	options
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
X-List-Received-Date: Sat, 04 Apr 2009 09:12:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 13:48 Sun 29 Mar     , Koen Kooi wrote:
> On 15-03-09 21:47, Dmitry Artamonow wrote:
>> In most machines' fstabs rootfs mounted with 'defaults' option.
>> This implies that atime logging is on - i.e. on every read from
>> filesystem kernel writes atime stamp to files' metadata.
>> Here in embedded world, where rootfs is usually stored on some
>> kind of flash (internal NAND/NOR, or external SD/MMC/CF card)
>> it is a real problem, because higher number of writes causes
>> flash wearing, higher system load and higher chance of filesystem
>> corruption.
>>
>> Fix it by adding noatime to rootfs mount options in fstab.
>
> Isn't 'relatime' a better option?

Maybe yes, but we need more care in this case, because relatime has
been introduced in 2.6.20 [1], and there's still can be machines using
older kernels (judging solely by looking at the recipes in recipes/linux).
I fear that we may break booting on these machines by passing
unsupported option to mount.

[1] http://kernelnewbies.org/Linux_2_6_20#head-6804816ab4f07548635032afbedd3e1f4eb3d1d7

> regards,
>
> Koen
>

-- 
Best regards,
Dmitry "MAD" Artamonow




Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad@mail.asoft.ru>) id 1LixDO-0006vm-G5
	for openembedded-devel@openembedded.org; Sun, 15 Mar 2009 21:45:50 +0100
Received: from localhost ([95.72.103.219]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n2FKj8qx030193
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2009 23:45:12 +0300
Date: Sun, 15 Mar 2009 23:45:09 +0300
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@openembedded.org
Message-ID: <20090315204509.GA17505@rainbow>
References: <49BAA810.4070906@cesgames.com>
MIME-Version: 1.0
In-Reply-To: <49BAA810.4070906@cesgames.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Sun, 15 Mar 2009 23:45:12 +0300 (MSK)
X-SA-Exim-Connect-IP: 83.222.19.8
X-SA-Exim-Mail-From: mad@mail.asoft.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: automatic fsck?
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
X-List-Received-Date: Sun, 15 Mar 2009 20:45:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 13:38 Fri 13 Mar     , JustinLove wrote:

> So far I've figured out:
>
> - fstab has '1' in last column for rootfs
> - Install e2fsprogs-fsck and/or e2fsprogs-e2fsck
> - change ENABLE_ROOTFS_FSCK=yes in /etc/default/rcS
> - Specify "ro" on kernel command line
> - "shutdown -F -r now", but this has no effect, I still get the warning 
> message
>
> What am I missing?

If I remember correctly, you also need to specify your fs type (ext3 instead
of auto) and real device (/dev/mmcblk0p2 instead of rootfs) in your
fstab. Maybe that'll help.

In fact there's other problem, and much bigger - by default rootfs
gets mounted with 'defaults' option, and it silently wears your flash,
because 'defaults' imply atime turned on. It may be one of the causes
of FS corruption too. Guess, I'll roll a patch fixing that.

-- 
Best regards,
Dmitry "MAD" Artamonow




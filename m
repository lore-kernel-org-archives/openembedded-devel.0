Received: from [64.135.192.34] (helo=mail.FoxValley.net ident=qmailr)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <justin.love@cesgames.com>) id 1LjIMP-0002Cm-Pu
	for openembedded-devel@openembedded.org; Mon, 16 Mar 2009 20:20:33 +0100
Received: (qmail 25521 invoked from network)
	for openembedded-devel@lists.openembedded.org;
	16 Mar 2009 14:19:49 -0500
Received: from 64-135-210-33.foxvalley.net (HELO ?127.0.0.1?) (64.135.210.33)
	by mail.foxvalley.net with SMTP; 16 Mar 2009 14:19:49 -0500
Message-ID: <49BEA64D.8020904@cesgames.com>
Date: Mon, 16 Mar 2009 14:19:41 -0500
From: JustinLove <justin.love@cesgames.com>
User-Agent: Thunderbird 2.0.0.19 (Windows/20081209)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49BAA810.4070906@cesgames.com> <20090315204509.GA17505@rainbow>
In-Reply-To: <20090315204509.GA17505@rainbow>
X-SA-Exim-Connect-IP: 64.135.192.34
X-SA-Exim-Mail-From: justin.love@cesgames.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	RDNS_NONE autolearn=ham version=3.2.5
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
X-List-Received-Date: Mon, 16 Mar 2009 19:20:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Dmitry Artamonow wrote:
> If I remember correctly, you also need to specify your fs type (ext3 instead
> of auto) and real device (/dev/mmcblk0p2 instead of rootfs) in your
> fstab. Maybe that'll help.

One or both of those was successful.  Guess I was unscientific in applying both 
at once ;^)

> In fact there's other problem, and much bigger - by default rootfs
> gets mounted with 'defaults' option, and it silently wears your flash,
> because 'defaults' imply atime turned on. It may be one of the causes
> of FS corruption too. Guess, I'll roll a patch fixing that.

I also added 'noatime' to fstab, but 'mount' does not show noatime set for 
either rootfs or /dev/root.

I tried using rootflags=noatime on the kernel command line, but it said it was 
an unrecognized mount option, and failed to mount root at all.

-- 
Justin Love

Creative Electronics & Software
650 Sundown Road
South Elgin, IL 60177

Phone 847-695-0023 x233
FAX   847-695-0483




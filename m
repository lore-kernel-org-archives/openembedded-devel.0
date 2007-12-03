Received: from [209.85.134.190] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1IzCBJ-0002sZ-V7
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2007 15:21:58 +0100
Received: by mu-out-0910.google.com with SMTP id w8so1401258mue
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2007 06:18:31 -0800 (PST)
Received: by 10.82.134.12 with SMTP id h12mr10997674bud.1196691508219;
	Mon, 03 Dec 2007 06:18:28 -0800 (PST)
Received: from ?10.0.0.7? ( [88.252.44.150])
	by mx.google.com with ESMTPS id b30sm10536731ika.2007.12.03.06.18.14
	(version=SSLv3 cipher=OTHER); Mon, 03 Dec 2007 06:18:27 -0800 (PST)
Date: Mon, 3 Dec 2007 16:19:51 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <783254142.20071203161951@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <475322B8.8000501@whitby.id.au>
References: <47520EA7.8030507@whitby.id.au> <47526A83.30109@student.utwente.nl>
	<475283BC.2030903@whitby.id.au>
	<525897579.20071202212734@gmail.com>
	<475322B8.8000501@whitby.id.au>
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
X-List-Received-Date: Mon, 03 Dec 2007 14:21:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Sunday, December 2, 2007, 11:25:12 PM, you wrote:

> Paul Sokolovsky wrote:
>>   This raises the question if user should be allowed (far less
>> required) to change bootloader's standard cmdline as *the normal
>> course of using distro* (== task-base). So, maybe the 1st choice ("Is
>> it good idea at all") is worth more attention.

> Ah, this is a question about which parts of task-base a DISTRO should
> include or not (by use of it's DISTRO_FEATURES).  Not about whether
> task-base should give distros the choice in the first place.

  Ok.

> Is Angstrom (the only DISTRO which currently has this feature enabled)
> meant to be a hand-holding-for-naive-users distro, or a power-users distro?

  Apparently, leaning more towards the first, than to the second. On my
memory, at least some MTD-related utility was cut from Angstrom for
the reasons that users may shoot themselves in foot with it. Other
util (ipkg-link) is not incuded for purely idiosyncratic reasons, bit
with the same motivation - "users may mess up with it".

  But well, I'm not arguing if you should include the utils in
question or not, but rather on more general question what should go
into standard image (or images of different types), and what not.
Then, it would be easier to decide on particulars, and assess, if some
exception is worth here or there. Motivation is that it's not possible
to fit any useful util at all, and space is precious.

> And yes, it's most likely that an end-user distro would put a shell script
> wrapper around the bootloader utility to safeguard the user for normal
> end-user operations like changing the rootfs load location, or setting up
> nfsroot operation.

> -- Rod


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




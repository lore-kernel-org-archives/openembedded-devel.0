Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4OIM-0004c0-I3
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2007 23:18:42 +0100
Received: by fg-out-1718.google.com with SMTP id 22so288165fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2007 14:13:51 -0800 (PST)
Received: by 10.86.51.2 with SMTP id y2mr6934093fgy.17.1197929631746;
	Mon, 17 Dec 2007 14:13:51 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id j12sm18237722fkf.2007.12.17.14.13.50
	(version=SSLv3 cipher=OTHER); Mon, 17 Dec 2007 14:13:51 -0800 (PST)
Date: Tue, 18 Dec 2007 00:19:12 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <335513874.20071218001912@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4766EAC5.10906@student.utwente.nl>
References: <4765E992.2040805@protium.com>
	<4710722265.20071217130911@gmail.com>
	<47668695.5010701@protium.com> <828321445.20071217170249@gmail.com>
	<4766BEA8.1020709@protium.com> <4766EAC5.10906@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: RFC: Renaming uboot-utils
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
X-List-Received-Date: Mon, 17 Dec 2007 22:18:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Monday, December 17, 2007, 11:31:49 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Andy Wilcox schreef:

>> A few kernels will need to add the u-boot-utils-native dependency,
>> notably the linkstation.  I'll make these adjustments in the commit.

> And witness the joys of using linux.inc: automagic dependency on mkimage
> for machines that need it!

  Actually, that magic is pretty dumb ;-) :

# Not every device needs mkimage to generate a kernel image, but lets make OE a bit more
# friendly and increase the "Just Works(TM) factor. Building uboot takes only a minute. 
DEPENDS += " u-boot-mkimage-openmoko-native "

P.S. As of now, u-boot, u-boot-utils-native,
u-boot-mkimage-openmoko-native all stage mkimage. Waste. Need to
cleanup.
  

> regards,

> Koen




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




Received: from smtprelay-h11.telenor.se ([62.127.194.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqQJA-0005Zj-OQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 13:19:09 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h11.telenor.se (Postfix) with ESMTP id A92A2EB2F8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 13:16:11 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvETAM4Qm0tT4zvyPGdsb2JhbAAHh1qTGQEBAQE3uEGEewQ
X-IronPort-AV: E=Sophos;i="4.49,632,1262559600"; d="scan'208";a="49562055"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 13 Mar 2010 13:16:08 +0100
Message-ID: <4B9B8207.1040909@atmel.com>
Date: Sat, 13 Mar 2010 13:16:07 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268429974-12872-1-git-send-email-ulf.samuelsson@atmel.com>
	<hnfpdp$mg6$1@dough.gmane.org>
In-Reply-To: <hnfpdp$mg6$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 62.127.194.4
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] multimedia:;Add media contents to rootfs
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
X-List-Received-Date: Sat, 13 Mar 2010 12:19:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi skrev:
> On 12-03-10 22:39, Ulf Samuelsson wrote:
>> This package will copy the contents of "multimedia.tar.bz2."
>> (Note the dot at the end) to the "/home/root/multimedia" directory
>> in the target. By replacing the empty default file, you
>> can add your own multimedia files for testing.
> 
>> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> 
> 
> NAK. Package never never touch $HOME, if you want things installed into
> $HOME, look into /etc/skel.
> 

The purpose is not to have a "multimedia" directory in each home
so I dont think "/etc/skel" is applicable.

The purpose of this package is to be able to easily load some
jpeg pictures, movies, mp3 files into the root file system
when you build a demo.

It is not likely to be used for a real products

At the moment, the package should not install *anything*,
until a developer replaces the file with own content.

To use it, you create a directory structure with your media file,
create a b2zip'd tarball, and replace the "multimedia.tar.bz2."

Dont have any specific preference for /home,
just seems to be practical for a demo.

Come to think about it, it probably makes more sense to
put it in '${D}/'.


This will allow you to update any part of the file system
with whatever you want.

If that is not OK, then what about "${D}//usr" ?

-- 
Best Regards
Ulf Samuelsson




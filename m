Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O3pKd-0000vG-Ny
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 13:40:05 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id CB266EA9B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 07:36:32 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Mon, 19 Apr 2010 07:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=T022/tZPYxbkHUBIIYD1YunkD4E=;
	b=agdk139p0+kL3BQAQbEoIci5xH8nKjjPAoxD30VCtdJV04+/p4tdAASPJNo0xyrp7pRja7IlHN4ZKiK7s8Wdb+o0I+Po8gLspjaSfdn0MTbsH6827iRZSu0V7Fc6MZFvnAxFuFJ3BZNtqdLAafT9jmeXIZUCJ0sSYqjZC531+xw=
X-Sasl-enc: D4aTBwYwDAS5NDvr2iC8B8vOXNzNxR0c5//rZrTRP86a 1271676992
Received: from [192.168.1.34] (hnvr-4d079781.pool.mediaWays.net [77.7.151.129])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 311C03A72F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 07:36:32 -0400 (EDT)
Date: Mon, 19 Apr 2010 13:37:50 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hqeo6e$lcs$1@dough.gmane.org>
Message-ID: <alpine.LNX.2.00.1004191330520.5137@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
	<alpine.DEB.1.10.1004161851540.13187@vitus.devnet.local>
	<hqeo6e$lcs$1@dough.gmane.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/5] base-files: tb5200l specific changes
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
X-List-Received-Date: Mon, 19 Apr 2010 11:40:05 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Sun, 18 Apr 2010, Koen Kooi wrote:

> On 16-04-10 18:52, Vitus Jensen wrote:
>> * create /opt directory
>
>> +++ b/recipes/base-files/base-files_3.0.14.bb
>
>> -	   /mnt /media /media/card /media/cf /media/net /media/ram \
>> +	   /opt /mnt /media /media/card /media/cf /media/net /media/ram \
>
> NACK!
>
> /opt will automatically get created when a package gets installed to it,
> so base-files is the wrong place to create it.
> Using /opt is almost as bad as poking at $HOME from inside packages...

I would like to mount the second half of internal flash to /opt, so that 
packages which install there actually have a enough room.  See fstab 
contained in the patch.

Do you propose another directory?  I've found no free directory in 
the list created by base-files.  If this is considered a local issue I 
will move the changes in our local overlay and remove the patch from the 
list.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers



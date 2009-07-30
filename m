Received: from [74.125.78.146] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MWXMW-0001eZ-SR
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 17:16:09 +0200
Received: by ey-out-1920.google.com with SMTP id 3so362033eyh.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2009 08:01:08 -0700 (PDT)
Received: by 10.210.63.18 with SMTP id l18mr1619107eba.11.1248966068022;
	Thu, 30 Jul 2009 08:01:08 -0700 (PDT)
Received: from ?192.168.1.64? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 7sm1273444eyb.37.2009.07.30.08.01.06
	(version=SSLv3 cipher=RC4-MD5); Thu, 30 Jul 2009 08:01:07 -0700 (PDT)
Message-ID: <4A71B5AD.1080002@xora.org.uk>
Date: Thu, 30 Jul 2009 16:01:01 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>	<1244206438.6643.46.camel@port4>	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>	<1244635240.28486.7.camel@hammer.suse.cz>	<20090730105711.GA29595@zlo.nu>	<1248952464.21030.110.camel@hammer.suse.cz>	<20090730114922.GA29793@zlo.nu>	<1248956053.21030.133.camel@hammer.suse.cz>	<20090730125001.GA30052@zlo.nu>	<c384c5ea0907300622k5ab4bc15yeae9f448312fb887@mail.gmail.com>
	<20090730144831.GA30445@zlo.nu>
In-Reply-To: <20090730144831.GA30445@zlo.nu>
Subject: Re: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks	libtool's do_configure [PATCH]
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
X-List-Received-Date: Thu, 30 Jul 2009 15:16:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Marc Olzheim wrote:
> On Thu, Jul 30, 2009 at 03:22:19PM +0200, Leon Woestenberg wrote:
>   
>>> My /bin/sh is a dash, I should have known, my apologies.  I have a patch
>>>
>>>       
>> Testing with dash rather than bash is GOOD due to it adhering to POSIX
>> without much of the bash-specifics.
>>     
>
> Well, I agree, but judging by commit
> e0ed375a8dfb292bdd72f5891917ef81f361f15c to classes/sanity.bbclass, I
> assumed the policy was to require /bin/bash for /bin/sh instead of
> fixing bashisms.
>
> To not be obligated to use bash, I added the attached patch.
>
>   
OE is always supposed to run on dash, unfortuneately a lot of the stuff 
it builds is written by people less caring. I beleive that commit was 
spurred by a libtool failure on dash.

Graeme




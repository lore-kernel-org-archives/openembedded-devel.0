Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GTgOn-0003gZ-3V
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Sep 2006 17:05:05 +0200
Received: by py-out-1112.google.com with SMTP id i75so1537555pye
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Sep 2006 07:59:52 -0700 (PDT)
Received: by 10.35.135.12 with SMTP id m12mr2980025pyn;
	Sat, 30 Sep 2006 07:59:52 -0700 (PDT)
Received: from CUBE ( [85.202.124.203])
	by mx.gmail.com with ESMTP id c1sm3600764nzd.2006.09.30.07.59.51;
	Sat, 30 Sep 2006 07:59:52 -0700 (PDT)
Date: Sat, 30 Sep 2006 17:59:49 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <310040615.20060930175949@gmail.com>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <451D7FC2.8070600@dominion.kabel.utwente.nl>
References: <451D6EA3.5000609@dominion.kabel.utwente.nl>
	<11437084.20060929230541@gmail.com>
	<451D7FC2.8070600@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: Did someone break X ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Sep 2006 15:05:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Friday, September 29, 2006, 11:19:14 PM, you wrote:


>>> ERROR: No providers of runtime build target xserver-kdrive after filtering (for
>>> ['/home/koen/OE/monotone/org.openembedded.dev/packages/xorg-xserver/xserver-kdrive_X11R7.1-1.1.0.bb'])
[]
>>
>>     Well, it's not easy to grasp anything form these messages. While I
>> hacked xserver-kdrive_X11R7.1-1.1.0.bb (rather, it's patches)
>> yesterday, that was to make it build (do_configure) for angstrom arm.
>> 
>>    What about suspecting --enable-w100 switch Michael Lauer had to
>> disable in xserver-kdrive_git.bb to make it build for x86?

> Mickeyl had a problem *during* build, OE isn't letting me *start* a build right now, while
> it did do that yesterday. I looks like something changed with (R)DEPENDS.

  Ok, turned out that I missed to commit xcalibrateext_git.bb (did it
some time ago and forgot since). Fixed now. Worth doing
"mtn ls unknown" regularly...

> regards,

> Koen

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




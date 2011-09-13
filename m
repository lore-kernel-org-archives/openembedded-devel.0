Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1R3QRm-00023b-GR
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 12:42:34 +0200
Received: (qmail 11038 invoked by uid 2404007); 13 Sep 2011 10:37:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from 87-206-60-144.dynamic.chello.pl (HELO ?192.168.1.112?)
	(marcin@juszkiewicz.com.pl@87.206.60.144)
	by host4.kei.pl with ESMTPA; 13 Sep 2011 10:37:26 -0000
Message-ID: <4E6F3267.80505@juszkiewicz.com.pl>
Date: Tue, 13 Sep 2011 12:37:27 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110906 Thunderbird/7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E6E2161.3070004@juszkiewicz.com.pl>
	<1315841184-4706-1-git-send-email-sledz@dresearch-fe.de>
	<1315907128.4195.8.camel@mattotaupa>
	<4E6F2963.6070606@dresearch-fe.de>
In-Reply-To: <4E6F2963.6070606@dresearch-fe.de>
X-Enigmail-Version: 1.4a1pre
Subject: Re: [PATCH v2] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernels
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
X-List-Received-Date: Tue, 13 Sep 2011 10:42:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 13.09.2011 11:58, Steffen Sledz pisze:
>> > I am not sure about the policy in oe.dev, but could you add a patch
>> > header, please [1].
>> > 
>> > Upstream-Status: Backport [2.6.(which one?)]
> Marcin, can you write something to this? I just adapted your patch to the 2.6.24 headers.

In BugLabs we used Poky 'pinky' and then switched to OpenEmbedded
2009-stable tree. At that time we used 2.6.2x linux-libc-headers as this
was present in both trees and selected by default.

When BUG 2.0 prototypes started working we started move from phoneme to
openjdk as java-vm provider. To build openjdk newer linux-libc-headers
were needed due to lack of HWCAP_THUMBEE define in 2.6.2x ones. Patching
default version was better solution then switching to newer one as it
gave us smaller chance of build failures.

And that's whole story of it.



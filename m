Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PE5Gy-0003Kv-K5
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 20:14:57 +0100
Received: (qmail 17508 invoked by uid 503); 4 Nov 2010 19:43:50 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 4 Nov 2010 19:43:50 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 Nov 2010 21:14:06 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 4 Nov 2010 21:14:05 +0200
Message-ID: <4CD305FC.7070305@eukrea.com>
Date: Thu, 04 Nov 2010 20:14:04 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288864342-20973-1-git-send-email-eric@eukrea.com>
	<4CD2FAF0.4080905@freyther.de>
In-Reply-To: <4CD2FAF0.4080905@freyther.de>
X-Ovh-Tracer-Id: 431219664836406601
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] qt4-embedded: tune QT_ARCH for armv6
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
X-List-Received-Date: Thu, 04 Nov 2010 19:14:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 04/11/2010 19:26, Holger Freyther a écrit :
> On 11/04/2010 10:52 AM, Eric Bénard wrote:
>> this is a RFC, I think it can also be used on qt 4.6.x and on armv7.
>> Setting QT_ARCH to armv6 enable some asm optimized functions in QT.
>
> Do you know the consequences of this change? E.g. in the painting
> engine unaligned memory access will be allowed. I am not sure that Nokia has
> ever benchmarked what is faster (aligned/unaligned) access. So it would be
> very interesting to know the perf difference. E.g. use qttracereply to measure it.
>
> Phil do you happen to know why unaligned access got allowed starting from
> armv6? How fast will it be?
>
in the painting engine, from what I saw in the .h, the asm optimisations are 
only enabled when using ARM RCVT compiler and not when using gcc but I have 
not checked everywhere in the code so I'm not sure of this.

Eric



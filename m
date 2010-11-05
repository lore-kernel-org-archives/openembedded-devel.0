Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PEIoy-0006ez-Ns
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 10:42:57 +0100
Received: (qmail 30654 invoked by uid 503); 5 Nov 2010 09:46:45 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 5 Nov 2010 09:46:45 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Nov 2010 11:42:05 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 5 Nov 2010 11:42:04 +0200
Message-ID: <4CD3D16C.70901@eukrea.com>
Date: Fri, 05 Nov 2010 10:42:04 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288864342-20973-1-git-send-email-eric@eukrea.com>	<4CD2FAF0.4080905@freyther.de>	<4CD305FC.7070305@eukrea.com>
	<4CD3CF1E.4040804@freyther.de>
In-Reply-To: <4CD3CF1E.4040804@freyther.de>
X-Ovh-Tracer-Id: 15090436452347653449
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
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
X-List-Received-Date: Fri, 05 Nov 2010 09:42:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 05/11/2010 10:32, Holger Freyther a écrit :
> On 11/04/2010 08:14 PM, Eric Bénard wrote:
>> in the painting engine, from what I saw in the .h, the asm optimisations are
>> only enabled when using ARM RCVT compiler and not when using gcc but I have
>> not checked everywhere in the code so I'm not sure of this.
>
> that is something else, I also have a partially applied C implementation that
> appears to be faster than the brute force armv6 code.
>
OK where is the code you are talking about in qt ?

> One benefit of using armv6 is that the atomic code will use a different
> implementation (ldrex,strex IIRC instead of swp). In any case please use
> something like qttracereply to see if passing armv6 is giving any benefit at all.
>
I can, do you have a quick howto run this ?

One thing : what I see here is that qtdemo was crashing after a random time 
and now (with armv6) it runs stable for hours.

Eric



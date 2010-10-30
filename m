Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PBzAj-0004vb-Su
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 02:19:52 +0200
Received: (qmail 31301 invoked by uid 503); 30 Oct 2010 00:48:07 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 30 Oct 2010 00:48:07 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Oct 2010 02:19:06 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 30 Oct 2010 02:19:04 +0200
Message-ID: <4CCB6477.5050703@eukrea.com>
Date: Sat, 30 Oct 2010 02:19:03 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288395329-10474-1-git-send-email-eric@eukrea.com>	<4CCB5DC0.3030607@eukrea.com>
	<20101030001628.GB2437@gmail.com>
In-Reply-To: <20101030001628.GB2437@gmail.com>
X-Ovh-Tracer-Id: 7239254927960681801
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
Subject: Re: [PATCH] busybox: remove unused versions
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
X-List-Received-Date: Sat, 30 Oct 2010 00:19:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 30/10/2010 02:16, Khem Raj a écrit :
> On (30/10/10 01:50), Eric Bénard wrote:
>> Le 30/10/2010 01:35, Eric Bénard a écrit :
>>> keep the following versions :
>>> 1.2.1 (used by oplinux)
>>> 1.7.2 (used by nylon)
>>> 1.13.2 (used by angstrom, kaeilos and slugos)
>>> 1.17.1 (used by angstrom)
>>> 1.17.3 (latest one)
>>>
>> forget this one, 1.16.2 should not be removed as it's used by shr.
>>
>
> may be SHR maintainers can chime in if they can move to newer ones.
> otherwise we keep it.
>
I just saw 1.11.3 is also needed for busybox-static_1.11.3

1.14.3 don't have DEFAULT_PREFRENCE set to -1 so it  can be used as a 
fallback, so in the end only 1.15.3 can go.

Eric



Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PdOwQ-0005Zr-AY
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 16:18:22 +0100
Received: (qmail 20312 invoked by uid 503); 13 Jan 2011 15:52:25 -0000
Received: from b9.ovh.net (HELO mail173.ha.ovh.net) (213.186.33.59)
	by 31.mail-out.ovh.net with SMTP; 13 Jan 2011 15:52:24 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Jan 2011 17:17:49 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Jan 2011 17:17:49 +0200
Message-ID: <4D2F179D.4060701@eukrea.com>
Date: Thu, 13 Jan 2011 16:17:49 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294867230-7827-1-git-send-email-eric@eukrea.com>	<4D2E47AE.5060803@mentor.com>	<4D2EAC19.6020203@eukrea.com>
	<4D2F16B4.4090107@mentor.com>
In-Reply-To: <4D2F16B4.4090107@mentor.com>
X-Ovh-Tracer-Id: 1701516236065516873
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 1/3] strace: add patch allowing compilation with kernel	headers >= 2.6.32
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
X-List-Received-Date: Thu, 13 Jan 2011 15:18:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/01/2011 16:13, Tom Rini wrote:
> On 01/13/2011 12:39 AM, Eric Bénard wrote:
>> On 13/01/2011 01:30, Tom Rini wrote:
>>> On 01/12/2011 02:20 PM, Eric Bénard wrote:
>>>> tested with kernel headers 2.6.31& 2.6.37 : both compile fine.
>>>
>>> Is there a reason to not switch to 4.5.20, or even newer instead?
>>>
>> I would like to do that but I don't know if 4.5.20 needs patches.
>
> I haven't tried .37, but it doesn't for .34 (when .14 does). To be clear, I'm
> suggesting we look at removing the D_P = -1 from .20. My assumption is that
> since .20 is the latest it probably doesn't need ARM EABI patches (and
> probably not the SH patches either).
>
OK lets go

Eric



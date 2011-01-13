Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PdODI-0004Fb-4T
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 15:31:44 +0100
Received: (qmail 15851 invoked by uid 503); 13 Jan 2011 15:05:44 -0000
Received: from b9.ovh.net (HELO mail173.ha.ovh.net) (213.186.33.59)
	by 31.mail-out.ovh.net with SMTP; 13 Jan 2011 15:05:44 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Jan 2011 16:31:10 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Jan 2011 16:31:09 +0200
Message-ID: <4D2F0CAD.8000600@eukrea.com>
Date: Thu, 13 Jan 2011 15:31:09 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294867230-7827-1-git-send-email-eric@eukrea.com>	<1294867230-7827-2-git-send-email-eric@eukrea.com>	<1294867230-7827-3-git-send-email-eric@eukrea.com>	<4D2E47EE.2040801@mentor.com>
	<4D2EF927.8050504@eukrea.com>
	<lyzkr49adq.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyzkr49adq.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Ovh-Tracer-Id: 913386301460753737
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 3/3] mtd-utils: add 1.4.1
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
X-List-Received-Date: Thu, 13 Jan 2011 14:31:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Enrico,

On 13/01/2011 14:54, Enrico Scholz wrote:
> Eric Bénard<eric@eukrea.com>  writes:
>
>>> Is there a reason we're perpetuating lzo1 for newer stuff rather than
>>> switching to lzo2?
>>>
>> lzo1 seems necessary :
>> compr_lzo.c:29:19: fatal error: lzo1x.h: No such file or directory
>
> mtd-utils build fine here after removing *all* the lzo1 related patches
> and the do_configure_prepend().
>
you're right, I should have read more carefully the recipe. Updated path follows.

Eric



Received: from 70.mail-out.ovh.net ([91.121.185.63])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OmCn4-00036U-AP
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 23:36:51 +0200
Received: (qmail 17827 invoked by uid 503); 19 Aug 2010 21:31:14 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 70.mail-out.ovh.net with SMTP; 19 Aug 2010 21:31:14 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 19 Aug 2010 23:36:31 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 19 Aug 2010 23:36:29 +0200
Message-ID: <4C6DA3DD.4080501@eukrea.com>
Date: Thu, 19 Aug 2010 23:36:29 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <7FC9418E-5EF5-4750-BFD7-DB7E43B38513@chumby.com>	<i4iq60$g6i$1@dough.gmane.org>
	<B49DA616-CD60-4E6E-A141-C3637BA9EB24@chumby.com>
In-Reply-To: <B49DA616-CD60-4E6E-A141-C3637BA9EB24@chumby.com>
X-Ovh-Tracer-Id: 11807593799174827337
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.63
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] Add chumby falconwing kernel recipe
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
X-List-Received-Date: Thu, 19 Aug 2010 21:36:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sean,

Le 19/08/2010 21:21, Sean Cross a écrit :
> On Aug 19, 2010, at 1:32 AM, Koen Kooi wrote:
>> Can't this me merged into the .26.28 kernel recipe?
>>
> I can do that, but the resulting patch is 28 megabytes. I think
> that's a bit big.
>
> It's Freescale's kernel patch, which supports all of their
> processors, not just the i.MX233.  My guess is that nobody's tried to
> get these patches into the kernel upstream.
>
> The resulting patch I get is mostly an additive patch, as I count
> 800,000 added lines in the patch, and 1200 removed lines.
>
maybe using Freecale git server with the right revision will allow you
to only have one smaller patch which adds support of your board :
http://opensource.freescale.com/git?p=imx/linux-2.6-imx.git;a=summary

Eric



Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OdJZx-0000RL-AS
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 11:02:34 +0200
Received: (qmail 15905 invoked by uid 503); 26 Jul 2010 09:09:13 -0000
Received: from b7.ovh.net (HELO mail643.ha.ovh.net) (213.186.33.57)
	by 29.mail-out.ovh.net with SMTP; 26 Jul 2010 09:09:13 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Jul 2010 11:02:19 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 26 Jul 2010 11:02:17 +0200
Message-ID: <4C4D4F19.7030800@eukrea.com>
Date: Mon, 26 Jul 2010 11:02:17 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.7) Gecko/20100713 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>	<i2fjoo$iiu$1@dough.gmane.org>
	<20100724212502.GA4218@gmail.com>	<i2gsqi$8sv$1@dough.gmane.org>
	<i2h6dv$1ni$1@dough.gmane.org>	<AANLkTi=oZobRgCAqUv+vtYocHvH2BSbRBH-V09GEJrrc@mail.gmail.com>
	<i2hklm$9no$1@dough.gmane.org>
In-Reply-To: <i2hklm$9no$1@dough.gmane.org>
X-Ovh-Tracer-Id: 5699586805116349769
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 87.98.216.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Make multi-machine toolchains to co-exist.
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
X-List-Received-Date: Mon, 26 Jul 2010 09:02:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 25/07/2010 17:19, Koen Kooi a écrit :
> On 25-07-10 16:30, Khem Raj wrote:
>>> Actually I have yet another patch which uses a new variable called
>>> TARGET_SUB_ARCH
>>> which fixes this issue. I am attaching this here.
>
> That gives me a lot of:
>
> NOTE: Handling BitBake files: / (7837/8428) [92 %]ERROR: Information not
> available for target 'armv7a-linux-gnueabi'
> ERROR: argument of type 'NoneType' is not iterable while parsing
> /OE/org.openembedded.dev/recipes/openssl/openssl_0.9.7g.bb
> ERROR: Information not available for target 'armv7a-linux-gnueabi'
> NOTE:<type 'exceptions.TypeError'>:argument of type 'NoneType' is not
> iterable while evaluating:
> ${@siteinfo_get_endianess(d)}
> NOTE:<type 'exceptions.TypeError'>:argument of type 'NoneType' is not
> iterable while evaluating:
> ${@base_conditional('SITEINFO_ENDIANESS', 'le', '-DL_ENDIAN',
> '-DB_ENDIAN', d)}         -DTERMIO -fexpensive-optimizations
> - -frename-registers -fomit-frame-pointer -O2 -ggdb3 -Wall
> NOTE:<type 'exceptions.TypeError'>:argument of type 'NoneType' is not
> iterable while evaluating:
> ${@'${CFLAG}'.replace('-O2', '')}
> ERROR: argument of type 'NoneType' is not iterable while parsing
> /OE/org.openembedded.dev/recipes/openssl/openssl_0.9.7g.bb

same thing here, I had to revert this patch to get things running.

Eric



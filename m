Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OeRtm-0003Sl-Os
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 14:07:43 +0200
Received: (qmail 20467 invoked by uid 1003); 29 Jul 2010 12:07:21 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 29 Jul 2010 12:07:21 -0000
Message-ID: <4C516EF8.3080804@balister.org>
Date: Thu, 29 Jul 2010 08:07:20 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<i2rik7$ds1$1@dough.gmane.org>
In-Reply-To: <i2rik7$ds1$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Thu, 29 Jul 2010 12:07:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 07/29/2010 05:45 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 29-07-10 10:50, Frans Meulenbroeks wrote:
>> Dear all,
>>
>> Given the discussions on quality that sometimes pop up (and also triggered
>> by Robert's message), I decided to kick off a bitbake -k world.
>
> Could you first explain to me why 'bitbake world' is a good way to
> measure quality?
>
> I would think that building something like console-image and looking at
> the following would be a much better metric:
>
> * does it build?
> * are all the rootfs types working?
> * does the image do what it is supposed to do?
> * Are all the licenses of the output packages correct?
> * Do the output packages have any spurious deps?
> * Is the content of the output packages correct?
> * Are there any known CVEs in the resulting packages?
> * Did packaged-staging do its job?
> * What kind of QA errors and warnings were raised?
> * Did all recipes pass recipe_sanity?
> * Did all recipes conform to oe-stylize.py?
>
> etc
>
> I would actually advocate removing the 'world' feature from bitbake/OE
> to stop people from wasting time on looking at bitbake world and have
> them fix actual problems.

bitbake world seems to be the source of pointless listserv discussions. 
Does it serve any purpose?

Philip



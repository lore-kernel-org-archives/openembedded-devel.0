Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L5PFi-0003E8-6N
	for openembedded-devel@openembedded.org; Wed, 26 Nov 2008 19:36:53 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L5PCl-0001wO-4X
	for openembedded-devel@openembedded.org; Wed, 26 Nov 2008 18:33:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 26 Nov 2008 18:33:39 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 26 Nov 2008 18:33:39 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 26 Nov 2008 19:33:29 +0100
Message-ID: <ggk4pp$c9e$1@ger.gmane.org>
References: <ggjnpc$qhg$1@ger.gmane.org>	<200811261755.53197.mickey@vanille-media.de>	<1227721214.19934.33.camel@mill.internal.reciva.com>	<ggk26f$30a$1@ger.gmane.org>	<48239d390811261012w26eb9a9fva6c7eacf4aff0a50@mail.gmail.com>
	<20081126182400.GA27631@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <20081126182400.GA27631@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: preferred-provider at the image level a.k.a why is all this fso stuff in my non-fso image
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
X-List-Received-Date: Wed, 26 Nov 2008 18:37:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-11-08 19:24, Denys Dmytriyenko wrote:
> On Wed, Nov 26, 2008 at 09:12:34PM +0300, Sergey Lapin wrote:
>> I just need to mention we have same kind of problems with mplayer vs
>> mplayer-maemo recipe,
>> when you try to put e.g. mencoder into IMAGE_INSTALL, mplayer-maemo
>> recipe is used instead of mplayer one.
>> Also, which is weird, I was able to reproduce this lots of times on
>> one my setup even with build from scratch,
>> and was unable to do so with my another setup.
>
> Sorry for my naive question, but why can't it be specified with
>
> PREFERRED_PROVIDER_mplayer = "mplayer"

That works at buildtime, opkg doesn't know about preferred_provider.

regards,

Koen






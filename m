Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LCxW8-00007p-1M
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 15:36:52 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LCxRk-000733-8p
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 14:32:20 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 17 Dec 2008 14:32:20 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Dec 2008 14:32:20 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Dec 2008 15:32:11 +0100
Message-ID: <gib2hb$nk2$1@ger.gmane.org>
References: <494907CC.2020009@epfl.ch>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081211 Shredder/3.0b2pre
In-Reply-To: <494907CC.2020009@epfl.ch>
Sender: news <news@ger.gmane.org>
Subject: Re: Best way to tune a distro and to build a toolchain for it
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
X-List-Received-Date: Wed, 17 Dec 2008 14:36:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-12-08 15:08, Valentin Longchamp wrote:
> Hello,
>
> We have designed a processor board in our laboratory that we are going
> to use to control our robots for experiments. The board is now supported
> in OE (mx31moboard machine) and I am very happy to be able to build a
> Linux distro for our board thank to OE.
>
> Until now I have used the Angstrom distro with success. Now since my use
> is mostly going to be for a robot with no screen (and of course no
> PIM/agenda, games and these kinds of things) I have always built a
> console-image. However now I would like to add some packages by default
> in the images that I want to build for our robot (for instance hal is
> needed by one of our softs, I would like it to be included by default).
>
> I could do this by adding these packages in the MACHINE_EXTRA_RDEPENDS
> variable in the machine config file, but I think this is more a distro
> question.

No, it's image question. Stuff that goes into an image is an image 
question. I have multiple devices without a screen and use angstrom on 
it without troubles. There's absolutely no need for yet another distro.

> To summarize: what would be the best way to create a "robotic version"
> of angstrom in OE ?

Create tasks and images for it. There's absolutely no need for yet 
another distro.

> The second question is about toolchains. This platform is going to be
> used by many other labs that are going to use our robots or at least our
> hardware. I would like to be able to build a "sdk" for them, with all
> the libs that we include by default in their sdk (because I already fear
> all the mechanical engineers that would have to build OE ...). I can
> build meta-toolchain, but how could I tune a toolchain so that it
> includes for instance all the headers for the libs that I would add in
> my "robotic version" of anstrom ?

Have a look at meta-sdk*.bb, that shows how you can install packages 
into a toolchain.

regards,

Koen

>
> Thank you for your help.
>
> Val
>





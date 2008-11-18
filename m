Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L2VZY-0001c2-6Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 19:45:12 +0100
Received: from p5b036248.dip.t-dialin.net ([91.3.98.72]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1L2VXA-0000d7-E3 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2008 19:42:47 +0100
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1L2VYv-0003rL-Og for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 19:44:33 +0100
Date: Tue, 18 Nov 2008 19:44:33 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081118184433.GA12762@dodger.lab.datenfreihafen.org>
References: <20081118155949.GA2279@datenfreihafen.org>
	<gfus5g$aep$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gfus5g$aep$1@ger.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: E-Ten Glofiish M800 support
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
X-List-Received-Date: Tue, 18 Nov 2008 18:45:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2008-11-18 at 17:57, Koen Kooi wrote:
> On 18-11-08 16:59, Stefan Schmidt wrote:
>>
>> I just pushed a branch with basic machine and kernel support for the M800 from
>> E-Ten. Normally Winodws Mobile based device. Linux support is ongoing.
>>
>> http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=0ea0875a3e5456f701df08e0974821a4e8852f55
>>
>> As it is just machine, kernel recipe and sane-srcrev it should not break
>> anything. Still I would like to ask for review before pushing it in.
>>
>> How does folks feel about it?
>
> Only some small comments:
>
> conf/machine/eten-m800.conf:
> IMAGE_FSTYPES ?= "tar.gz"
>
> change that to += so people don't shoot themselves in the foot too easily

Good point. Changed.

> linux-eten_2.6.24+git.bb:
> git://git.openmoko.org/git/kernel.git;protocol=git;branch=stable \
>
> Would it make sense to merge this into the openmoko kernel recipe since  
> it's building from the same tree? I'm trying to cut down the number of  
> linux-foo recipes whenever possible, but it a seperate recipe is easier,  
> go for it.

I thought about this. My point about not doing it is that it could easily be
that I switch the git repo soon. We just sat up a git tree with WIP stuff. Not
sure which one I like to have in OE in the long run. I would go for keeping it
and think about how it turns out.

> do_configure_prepend() {
>   install -m 0644 ${S}/arch/arm/configs/glofiish_defconfig  
> ${WORKDIR}/defconfig
>
> Please include the defconfig in OE, it's really tedious to have to add  
> patches to SRC_URI when changing the defconfig.

Damn, got me. ;)

This is the usual kernel hacker vs. buildsystem maintainer problem. With my
kernel hat on I would like OE to use the newest defconfig to keep in sync
easily. With the OE hat I see that it sometimes makes sense to have a seperate
defconfig. Will put a defconfig in.

> Everything else looks good.

Great, thanks for the review.

If nobody else finds problems with this I'll push it in tomorrow.

regards
Stefan Schmidt

PS: Any people prefer to have patches inlined for easier review, or are all fine
with a link to webgit here?



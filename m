Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L2Tve-0006Ho-9N
	for openembedded-devel@openembedded.org; Tue, 18 Nov 2008 17:59:54 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L2TtH-0005Tx-VP
	for openembedded-devel@openembedded.org; Tue, 18 Nov 2008 16:57:28 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 18 Nov 2008 16:57:27 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 18 Nov 2008 16:57:27 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 18 Nov 2008 17:57:19 +0100
Message-ID: <gfus5g$aep$1@ger.gmane.org>
References: <20081118155949.GA2279@datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <20081118155949.GA2279@datenfreihafen.org>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Tue, 18 Nov 2008 16:59:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-11-08 16:59, Stefan Schmidt wrote:
> Hello.
>
> I just pushed a branch with basic machine and kernel support for the M800 from
> E-Ten. Normally Winodws Mobile based device. Linux support is ongoing.
>
> http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=0ea0875a3e5456f701df08e0974821a4e8852f55
>
> As it is just machine, kernel recipe and sane-srcrev it should not break
> anything. Still I would like to ask for review before pushing it in.
>
> How does folks feel about it?

Only some small comments:

conf/machine/eten-m800.conf:
IMAGE_FSTYPES ?= "tar.gz"

change that to += so people don't shoot themselves in the foot too easily

linux-eten_2.6.24+git.bb:
git://git.openmoko.org/git/kernel.git;protocol=git;branch=stable \

Would it make sense to merge this into the openmoko kernel recipe since 
it's building from the same tree? I'm trying to cut down the number of 
linux-foo recipes whenever possible, but it a seperate recipe is easier, 
go for it.

do_configure_prepend() {
   install -m 0644 ${S}/arch/arm/configs/glofiish_defconfig 
${WORKDIR}/defconfig

Please include the defconfig in OE, it's really tedious to have to add 
patches to SRC_URI when changing the defconfig.

Everything else looks good.

regards,

Koen





Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1P8rpV-00018i-23
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 11:53:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id BB4C9A5128
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 10:52:23 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id gp+BzF2-mDco
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 10:52:23 +0100 (BST)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 9604EA510E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 10:52:22 +0100 (BST)
Message-ID: <4CC00D57.4070601@xora.org.uk>
Date: Thu, 21 Oct 2010 10:52:23 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.11) Gecko/20101013 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i9p1d0$7q4$1@dough.gmane.org>
In-Reply-To: <i9p1d0$7q4$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 09:53:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 21/10/2010 10:33, Koen Kooi wrote:
> Hi,
>
> Recipes/linux is a mess and recipes/u-boot is as well. It would be a
> nice topic for OEDEM to see if we discuss switching to a poky BSP model.
> It would boil down to:
>
> 1 base bblayer with shared files:
> * conf/machine/include
> * recipes/linux/*.inc
>
> 1 bblayer per machine or SOC_FAMILY containing:
> * machine.conf
> * first and second stage bootloaders
> * kernel
>
> So, what are peoples thoughts on this? I haven't thought this through
> myself, so feel free to point out any show stoppers.
> I do not want this to turn into a "splitting the metadata" discussion,
> while I'm all for that, it really is a seperate effort and discussion.
> But any bblayer style split would benefit from OE being a collection of
> git submodules instead of a monolithic tree[1].
>
> Regards,
>
> Koen
>
> [1] Provided git submodules stop sucking so hard in future git versions
This is something I have advocated before but never formally presented a
RFC to OEDEM.

With this model it quickly becomes clear which machines have support.

The only problem comes with BLAH_machine type overides. Are they done as
amend.inc (or whatever the current method is) in overlay or are they
allowed into main repo. I think amend.inc in this case is probably the
way to go.

Probably some form of dummy machine (maybe x86) needs to be defined in
main repo just so main repo can be parsed.

Graeme





Received: from mk-filter-1-a-1.mail.uk.tiscali.com ([212.74.100.52])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <superaorta@gmail.com>) id 1OOS6q-0006XN-Cw
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 11:07:04 +0200
X-Trace: 421604857/mk-filter-1.mail.uk.tiscali.com/B2C/$b2c-THROTTLED-DYNAMIC/b2c-CUSTOMER-DYNAMIC-IP/79.70.159.171/None/superaorta@gmail.com
X-SBRS: None
X-RemoteIP: 79.70.159.171
X-IP-MAIL-FROM: superaorta@gmail.com
X-SMTP-AUTH: 
X-Originating-Country: GB/UNITED KINGDOM
X-MUA: KMail/1.9.9
X-IP-BHB: Once
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AsEaALzdFkxPRp+r/2dsb2JhbACBOgORGoYMgQCFD3GuKoduLohUhRoE
X-IronPort-AV: E=Sophos;i="4.53,419,1272841200"; d="scan'208";a="421604857"
Received: from 79-70-159-171.dynamic.dsl.as9105.com ([79.70.159.171])
	by smtp.tiscali.co.uk with ESMTP; 15 Jun 2010 10:02:36 +0100
From: superaorta@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jun 2010 10:02:34 +0100
User-Agent: KMail/1.9.9
References: <201006150815.32214.superaorta@gmail.com> <4C173712.3070405@ge.com>
In-Reply-To: <4C173712.3070405@ge.com>
MIME-Version: 1.0
Message-Id: <201006151002.35045.superaorta@gmail.com>
X-SA-Exim-Connect-IP: 212.74.100.52
X-SA-Exim-Mail-From: superaorta@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: comedi / angstrom
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
X-List-Received-Date: Tue, 15 Jun 2010 09:07:04 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


> GPIO. Comedi consists of 2 parts:
>
> 1) Kernel drivers - which seem to be in the staging directory of the
> kernel tree, so can be enabled via a custom defconfig. This would need
> adding to OEs metadata, but is fairly simple. First you need to know
> which kernel is being built for your machine, assuming your machine is
> "foo" and OE is building the stock 2.6.32 kernel (I think you can check
> by running 'opkg list | grep "kernel -" ' on your board), then add your
> edited defconfig as
> "openembedded/recipes/linux/linux-2.6.32/foo/defconfig". The config
> currently used is probably here already, so that just needs to be modified.
>
> 2) Userspace libraries - I have a bitbake file for version 0.8.1 that I
> hadn't got around to pushing yet (didn't think there would be any
> interest either). I'll push that in a minute. You will either need to
> add it to the bitbake image you want to build or you can add it and it's
> dependencies at run time using the package manager (opkg).
>
> Clean the kernel and (I think) task-base and rebuild your image.
>
> Hope that helps,
>
> Martyn


Martyn,


thanks - this looks promising but I think there is an added complication - I 
am running 2.6.29 on the board and I think the comedi drivers were moved to  
kernel staging after this time.

opkg list |grep "kernel -"
kernel - 2.6.29-r46.1 - Linux kernel for OMAP processors

To be honest I think I am out of my depth on this and very short of time- I 
have had the BB running a stock system for a long while and haven't touched 
this, the git / bitbake system I setup yesterday on my linux box doesn't seem 
to match it and I haven't a clue what I am doing with it.

I think I'm going to try the ubuntu bb install, I understand debian etc a bit 
better and I think comedi is ready packaged for unbuntu...

Thanks for your help,

SA



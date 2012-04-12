Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SIPVn-0006XM-No
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 21:16:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3CIPKsI004626
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 11:25:20 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Apr 2012 11:25:19 -0700
Message-ID: <4F871E0E.7080500@windriver.com>
Date: Thu, 12 Apr 2012 13:25:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <CAHTvVMen9K_AGfn8O7GMgKvY0XZ-oiDg3oOmSz_sBK6GSGChtQ@mail.gmail.com>
In-Reply-To: <CAHTvVMen9K_AGfn8O7GMgKvY0XZ-oiDg3oOmSz_sBK6GSGChtQ@mail.gmail.com>
Subject: Re: Hard floating point support for armv7a wmmx2 processor in oe-core
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
X-List-Received-Date: Thu, 12 Apr 2012 19:16:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/12 12:38 PM, Nicolas Aguirre wrote:
> Hi,
>
> I'm building an oe-core minimal image and toolchain for the cubox[1]
> which has a Marvell Armada 510 SoC, also known as Dove.
> It's a armv7 Arm processor with wmmx2 instruction set [2].
>
> I setup a new machine for the cubox and added :
> require conf/machine/include/arm/arch-armv7a.inc
> in my cubox.conf file
>
> I also added
> ARM_FP_MODE = "hardfp"
> TARGET_FPU = "hardfp"
> in my local.conf file.

That is not how to enable the mode with the newer tune infrastructure.  You need 
to simply enable a tune, in your machine configuration, that matches the desired 
output.

The following are the defined VFP (hard float requires VFP) tunes for hard float:

armv7ahf armv7athf armv7ahf-neon armv7athf-neon

the "t" varients support thumb, but don't have it enabled by default..

the -neon variants also enabled the neon instructions.

I do not know what the "wmmx2" instructions are, if they are different from VFP 
and Neon, then it sounds like you need a custom tune.

Your machine configure should set DEFAULTTUNE = "..." where "..." is the tune 
you want for that given machine.  (armv7ahf should be a safe place to start.)

> It finished the build sucessfully for angstrom efl-nodm-image.
>
> I don't know exactly which option enable and where to add it to enable
> hard floating point.
> I see in meta-oe/meta/conf/machine/include/arm/arch-armv7a.inc
> references to the armv7ahf architecture but without idea how to
> activate it.
>
> Btw is the 'a' after armv7 important for me ? As it seems that this
> arm core is an armv7 and not armv7a. I dont find arch-armv7.inc file
> in oe-core.

There was a recent commit that seemed to indicate that armv7 don't really exist, 
and everything is an armv7a....  One of the ARM experts will have to help 
clarify that point.

> Another problem is, how to add support for wmmx2 instruction set ?
> There is tune-iwmmxt.inc but it seems to refer to armv5 arch. There is
> a way to enable this instruction set ?

Figure out the correct set of commands for gcc to support this processor, and I 
can help you define a custom tune file.

The few references I found in a quick google search seem to indicate that the 
core does support thumb, it should use the armv7-a compilation, and there is 
little to no support for the wmmx2 instructions.

--Mark

> Any help would be appreciate :)
>
> [1] http://www.solid-run.com/products/cubox
> [2] http://www.marvell.com/application-processors/armada-500/
>
> regards,




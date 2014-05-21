Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (unknown [216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 9CF5F65F1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 20:31:34 +0000 (UTC)
Received: (qmail 8942 invoked by uid 1003); 21 May 2014 20:31:35 -0000
Received: from unknown (HELO ?192.168.1.122?) (philip@opensdr.com@108.44.91.50)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	21 May 2014 20:31:35 -0000
Message-ID: <537D0D26.8070505@balister.org>
Date: Wed, 21 May 2014 16:31:34 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAN-NoH3tU4wfadSOS4F78DQrqar9sHz_3Ecf49ENEog=P06=MQ@mail.gmail.com>	<CFA27259.284985%rcalhoun@shotspotter.com>
	<CAN-NoH3B+3+9QuWOLaMpcjxD0FhkETFqyDr1CKRPO7kXU0UFXg@mail.gmail.com>
In-Reply-To: <CAN-NoH3B+3+9QuWOLaMpcjxD0FhkETFqyDr1CKRPO7kXU0UFXg@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: how to create a new layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 May 2014 20:31:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/21/2014 04:05 PM, Richard Cagley wrote:
> On Wed, May 21, 2014 at 12:26 PM, Robert Calhoun
> <rcalhoun@shotspotter.com> wrote:
>>
>>
>> On 5/21/14 2:26 PM, "Richard Cagley" <rcagley@gmail.com> wrote:
>>
>>> I'd like to create a new machine that inherits from an existing
>>> machine. What's the easiest way to do this?
>>>
>>> Looking through the yocto documentation I see "yocot-bsp create" but I
>>> don't seem to have that executable. Do I need to use this or is there
>>> an alternate method?
>>
>> The script is in: poky/scripts/yocto-bsp
>>
>> You don't really need it. The script creates a directory structure for you
>> and generates some files, but there is nothing magical about it; you can
>> create those manually using the meta-yocto-bsp layer as an example.
>> Machine configs are in poky/meta-yocto-bsp/conf/machine.
>>
>> To make bitbake use your new layer:
>> a) add your layer to poky/build/conf/bblayers.conf so that that bitbake
>> knows what directories to search
>> b) set your machine name in poky/build/conf/local.conf
>>
>> I would recommend putting your own layer into git (or scm of choice).
>> Switching branches on poky will make the build fail if your .bbappends no
>> longer match up with recipes in oe-core, so it's helpful to be able to
>> switch between e.g. "a version of my layer that works with branch daisy"
>> and "a version of my layer that works with branch master".
>>
>> Rob Calhoun
>>
> oh, I don't think I'm using poky so I guess that's the reason I didn't
> find yocto-bsp
> 
> I'm using oe-core/meta-xilinx and for testing I've created a new test
> layer "meta-me" so my bblayers looks like this
> 
> BBLAYERS ?= " \
>   /home/rcagley/oe-zed-gcc-min/openembedded-core/meta \
>   /home/rcagley/oe-zed-gcc-min/meta-xilinx \
>   /home/rcagley/oe-zed-gcc-min/meta-oe/meta-oe \
>   /home/rcagley/oe-zed-gcc-min/meta-me \
>   "
> 
> In my local.conf I have
> MACHINE ??= "zedboard-zynq7"
> 
> My current main goal is to make my build consume a .bbappend file I
> have in meta-me/recipes-kernel/linux.
> 
> 1.) What is the minimum set of files I need to do this? I'd guess at
> least meta-me/conf/local.conf. Anything else?

You do not need a per layer local.conf

> 2.) Do I need to change the machine name? If so, how to I inherit
> zedboard-zynq7?

Make a conf/machine/me.conf.

You can use one of the zynq machines as a starting point.

You'll need a conf/layer.conf also.

Philip

> 
> The yocto manuals talk to creating a new layer, but I'm less clear on
> how to basically inherit everything.
> 
> BTW, thanks for the tip about git/matching branches. That's a good idea.
> 


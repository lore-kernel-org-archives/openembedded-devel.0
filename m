Received: from exprod5og110.obsmtp.com ([64.18.0.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1OOUG0-0005jj-TT
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 13:24:43 +0200
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob110.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTBdh7TqpgVTnMdpIzzDyQkY12fAo5isB@postini.com;
	Tue, 15 Jun 2010 04:20:15 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip08.e2k.ad.ge.com with ESMTP; 15 Jun 2010 05:33:59 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 15 Jun 2010 05:33:59 -0400
Message-ID: <4C174905.5020701@ge.com>
Date: Tue, 15 Jun 2010 10:33:57 +0100
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201006150815.32214.superaorta@gmail.com> <4C173712.3070405@ge.com>
	<201006151002.35045.superaorta@gmail.com>
In-Reply-To: <201006151002.35045.superaorta@gmail.com>
X-SA-Exim-Connect-IP: 64.18.0.20
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 15 Jun 2010 11:24:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

superaorta@gmail.com wrote:
>> GPIO. Comedi consists of 2 parts:
>>
>> 1) Kernel drivers - which seem to be in the staging directory of the
>> kernel tree, so can be enabled via a custom defconfig. This would need
>> adding to OEs metadata, but is fairly simple. First you need to know
>> which kernel is being built for your machine, assuming your machine is
>> "foo" and OE is building the stock 2.6.32 kernel (I think you can check
>> by running 'opkg list | grep "kernel -" ' on your board), then add your
>> edited defconfig as
>> "openembedded/recipes/linux/linux-2.6.32/foo/defconfig". The config
>> currently used is probably here already, so that just needs to be modified.
>>
>> 2) Userspace libraries - I have a bitbake file for version 0.8.1 that I
>> hadn't got around to pushing yet (didn't think there would be any
>> interest either). I'll push that in a minute. You will either need to
>> add it to the bitbake image you want to build or you can add it and it's
>> dependencies at run time using the package manager (opkg).
>>
>> Clean the kernel and (I think) task-base and rebuild your image.
>>
>> Hope that helps,
>>
>> Martyn
>>     
>
>
> Martyn,
>
>
> thanks - this looks promising but I think there is an added complication - I 
> am running 2.6.29 on the board and I think the comedi drivers were moved to  
> kernel staging after this time.
>   

Some appear to be there, however it's only a handful. You could add a
patch (look in the .bb file for the kernel below and the associated
directory. The patch is usually named in "SRC_URI" or "SRC_URI_foo"
(assuming foo again) and the patch is placed in the associated
directory. You'll probably need to pull any patches out of OE that are
added for your board to build a usable kernel, in addition to patching
it to provide the Comedi driver you need, so you are probably going to
need to understand a bit about OE to do that.

> opkg list |grep "kernel -"
> kernel - 2.6.29-r46.1 - Linux kernel for OMAP processors
>
> To be honest I think I am out of my depth on this and very short of time- I 
> have had the BB running a stock system for a long while and haven't touched 
> this, the git / bitbake system I setup yesterday on my linux box doesn't seem 
> to match it and I haven't a clue what I am doing with it.
>
>   

It's probably moved on. You'll probably need to do a complete build, or
ask some specific questions WRT the (I assume pre-built) build you are
running and how to generate extra packages. Though I'm afraid I can't be
of much assistance there, I run OE mainly on x86 and PPC at the moment.

> I think I'm going to try the ubuntu bb install, I understand debian etc a bit 
> better and I think comedi is ready packaged for unbuntu...
>
>   

I assume that it's just the build system, i.e. Bitbake. That's not going
to get you very far - you will still need the metadata and build an
image for the board. In some respects it will be harder as the version
of Bitbake may be out of sync with the metadata and the approach you
will need to take may vary subtly from that which is documented for OE.

Comedi is probably packaged for Ubuntu, but I not sure this is going to
run on your board. A quite search makes me think that Ubuntu may do an
Embedded OMAP build, but I'm not sure what that has to do with Bitbake.

Which OE tree are you trying to use, "org.openembeded.dev",
"stable-2009" or something else?

> Thanks for your help,
>   

np,

Martyn
> SA
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189




Received: from exprod5og108.obsmtp.com ([64.18.0.186])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1OORdw-0007ul-P3
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 10:37:15 +0200
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob108.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTBc6q2ZZLwmzQvS35KT6bcaq4Ty8/Bgy@postini.com;
	Tue, 15 Jun 2010 01:32:47 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip08.e2k.ad.ge.com with ESMTP; 15 Jun 2010 04:17:23 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 15 Jun 2010 04:17:23 -0400
Message-ID: <4C173712.3070405@ge.com>
Date: Tue, 15 Jun 2010 09:17:22 +0100
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201006150815.32214.superaorta@gmail.com>
In-Reply-To: <201006150815.32214.superaorta@gmail.com>
X-SA-Exim-Connect-IP: 64.18.0.186
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
X-List-Received-Date: Tue, 15 Jun 2010 08:37:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

superaorta@gmail.com wrote:
> I would like to build comedi (www.comedi.org) for my beagle board. From the 
> instructions for comedi, "you will need to havea correctly configured Linux 
> kernel source tree".
>
> I have built comedi on many platforms without trouble but I'm completely lost 
> in Angstrom - I have the kernel source (2.6.29 from kernel.org) but I don't 
> know where to find the config files. I have done this on and x86 host: 
> http://www.angstrom-distribution.org/building-angstrom
>
> I don't fancy building comedi using bitbake because I have not the slightest 
> idea how to adapt it to this purpose. The easiest thing seems to me is to 
> find the correctly configures kernel source and config files and install them 
> on the beagleboard then build comedi locally.
>
> Any advice? overwhelmed and stuck here.
>
>   

I built comedi into one of our builds for testing a parallel port as
GPIO. Comedi consists of 2 parts:

1) Kernel drivers - which seem to be in the staging directory of the
kernel tree, so can be enabled via a custom defconfig. This would need
adding to OEs metadata, but is fairly simple. First you need to know
which kernel is being built for your machine, assuming your machine is
"foo" and OE is building the stock 2.6.32 kernel (I think you can check
by running 'opkg list | grep "kernel -" ' on your board), then add your
edited defconfig as
"openembedded/recipes/linux/linux-2.6.32/foo/defconfig". The config
currently used is probably here already, so that just needs to be modified.

2) Userspace libraries - I have a bitbake file for version 0.8.1 that I
hadn't got around to pushing yet (didn't think there would be any
interest either). I'll push that in a minute. You will either need to
add it to the bitbake image you want to build or you can add it and it's
dependencies at run time using the package manager (opkg).

Clean the kernel and (I think) task-base and rebuild your image.

Hope that helps,

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189




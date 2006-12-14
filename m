Received: from [192.132.34.13] (helo=amail.unina.it)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <ranaldo@unina.it>) id 1Gupuy-000727-W0
	for openembedded-devel@openembedded.org; Thu, 14 Dec 2006 13:42:33 +0100
Received: from blaster.unina.it ([192.132.34.15]) (authenticated bits=0)
	by amail.unina.it (8.13.4/8.13.4) with ESMTP id kBEFRA7d002846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 14 Dec 2006 16:27:10 +0100
From: Nicola Ranaldo <ranaldo@unina.it>
To: samgreen@gmail.com, openembedded-devel@openembedded.org
User-Agent: KMail/1.9.5
References: <7b4fff750612131111t3e58ec7fo51fd8cee1a436628@mail.gmail.com>
In-Reply-To: <7b4fff750612131111t3e58ec7fo51fd8cee1a436628@mail.gmail.com>
MIME-Version: 1.0
Date: Thu, 14 Dec 2006 13:39:15 +0100
Message-Id: <200612141339.15619.ranaldo@unina.it>
Subject: Re: Looking for Familiar/iPAQ local.conf example
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Dec 2006 12:42:33 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 13 December 2006 20:11, Sam Green wrote:
> Hello,
>
> I have followed http://www.openembedded.org/wiki/GettingStarted _very_
> carefully, but I am unable to get past the "bitbake nano" step. Here is the
> output:
[...]

> OE Build Configuration:
> BB_VERSION     = "1.6.3"
> OE_REVISION    = "7dc5c6145f5a9f64aba3521e24e1a0b1ff7f0e0e"
> TARGET_ARCH    = "arm"
> TARGET_OS      = "linux"
> MACHINE        = "h3800"
> DISTRO         = "familiar"
> DISTRO_VERSION = "0.8.4"
> TARGET_FPU     = "soft"
[...]
> I think my problem is my local.conf. Can someone developing for
> Familiar/iPAQ post theirs?
>
> Thanks,
> Sam

I'm not an OE expert, i'm trying to answer you as i had your problems before.
Familiar is unmantained in OE, and the 0.8.4 build was born from a separate OE 
tree (http://familiar.handhelds.org/#build). If you need to compile packages 
outside the official familiar build, you have to contact familiars 
mantainers, or try to copy .bb file from official OE or write them.  You my 
try to contact Paul Sokolovsky too as it wrote a configuration file to 
produce packages compatible with familiar 0.8.4.
I need, for example, qt-x11-4.1.2 for my familiar on h2200 as i'm writing a qt 
tool that use some >=4.1 api and i'll want to port it in openembedded.
I found the bitbake file in OE but not in familiar tree. I do not know if 
building it in OE and installing on familiar is safe, or it will be safe in 
the future!, so i'm wasting time for a week in trying to compile angstrom for 
h2200 failing with a "no init found" (#1667 on bugs.openembedded.org), and 
now i'm trying to compile familiar build and trying to port the 4.1.2 bb file 
from OE hoping it runs. After that i'll try to write my first .bb to compile 
my qt tool, and if it will run i 'll finally patch the code to be nice 
displayed an a small screen. I want to contribute to OE in general (i'm think 
i'm not alone), but the problem is that due to lack of documentation i do not 
know if i'll have all the time in doing it, probabily i'll wait for 3/4 
months and return to OE/angstrom/familiar to check if somethink changed.
If was not precise please correct me!

Regards

	Nicola Ranaldo



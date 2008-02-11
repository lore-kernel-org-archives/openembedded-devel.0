Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JObe1-0004nr-55
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2008 17:36:37 +0100
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JOc6S-0001i1-UB
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2008 18:06:00 +0100
Message-ID: <47B079AA.2000400@kernelconcepts.de>
Date: Mon, 11 Feb 2008 17:36:58 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <75A74BC0-4CCC-44E8-BABE-A41508970838@computer.org>
In-Reply-To: <75A74BC0-4CCC-44E8-BABE-A41508970838@computer.org>
X-Enigmail-Version: 0.95.0
Subject: Re: Some questions on configuring OE
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
X-List-Received-Date: Mon, 11 Feb 2008 16:36:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Dr. H. Nikolaus Schaller schrieb:
> The Acer n30 hangs in the X11 touchscreen calibration because the  
> touch does not work. And the power management is worse than the one  
> in the old Letux kernel. So I suspect that not all patches are  
> applied when using the default machine/acern30.conf of OE.

If the touchscreen issue is not a kernel problem check your /etc/X11/Xserver
script (from xserver-(kdrive-)common package) if it has support for your device.

> Questions:
> 1. I could not find out if and which of the Letux n30 patches have  
> been included to the MACHINE = "acern30" so far

The acern30.conf defines that the linux_2.6.14.bb is used. So unless something
else overrides this (your local.conf or the distro maybe) you will get 2.6.14
which applies a lot of patches for the n30. You would have to check
linux_2.6.14.bb what these patches are and where they come from.

> 2. if not, I have some patch files from the Letux project - but how  
> and where should I configure those?

Just add them to the linux kernel bb. The default linux_2.6.14.bb is a good
example how additional machine dependent patches are applied.

> 3. What do I need to change to compile OpenMoko for OABI so that it  
> really boots?

I don't think there are special needs for OpenMoko, its a setting in the distro
definition you use. angstrom-2008.1-legacy.conf should contain the bits doing
the right thing.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76



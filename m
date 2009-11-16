Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1N9yzr-0005os-DA
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 11:39:50 +0100
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1N9z6V-0006BI-Em
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 11:46:39 +0100
Message-ID: <4B012BA3.5080309@kernelconcepts.de>
Date: Mon, 16 Nov 2009 11:38:27 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <c384c5ea0911100825s66f64234s8d1c27b66221faca@mail.gmail.com>
In-Reply-To: <c384c5ea0911100825s66f64234s8d1c27b66221faca@mail.gmail.com>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: addtask menuconfig after do_configure (instead of do_patch)?
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
X-List-Received-Date: Mon, 16 Nov 2009 10:39:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Leon Woestenberg schrieb:
> classes/kernel.bbclass:
> 
> -addtask menuconfig after do_patch
> +addtask menuconfig after do_configure
> 
> This will make sure the OE default configuration is used as the
> default config before going into the menu.

this might be a good idea. I guess this would be the desired starting point.

> Downside is that menuconfig will probably not work for new kernel
> recipes without defconfig.

Yes true, but to be honest: Do we really need to support this? I am willing to
learn but currently I do not see much of use in kernel recipes without defconfig.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en



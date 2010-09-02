Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1OrCWy-00057l-Jm
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 18:21:36 +0200
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1OrCdz-0006nX-Cs
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 18:28:07 +0200
Message-ID: <4C7FCEBD.6050407@kernelconcepts.de>
Date: Thu, 02 Sep 2010 18:20:13 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C7FCA85.8050807@gmail.com>
In-Reply-To: <4C7FCA85.8050807@gmail.com>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: minimal-image doesn't boot
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
X-List-Received-Date: Thu, 02 Sep 2010 16:21:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Marco,

Marco Cavallini schrieb:
> I have been trying to run a minimal-image on an ARM system, because I
> plan to use it on a 16MB NOR Flash.
> 
> I started wirh a PXA270 based board but I faced to puzzling jffs2
> errors, then I tried on a more reliable machine (for me) Ronetix-pm9263
> with same results.
> 
> Does anybody tested minimal-image recently?
> Did it work?
> With which machine?
> 
> Any hint will be greatly appreciated.

this looks like either the jffs2 image are completely messed up (not very
likely) or something went wrong while flashing. Do the bootloader agree with the
kernels about the partition layout and was the root flash partition erased
completely?

I do not have a Ronetix board around which would be useful to verify but I could
try it with the SimOne I have - I built a minimal image for it recently but
didn't test it so far.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en



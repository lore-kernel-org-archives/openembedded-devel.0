Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1RObjQ-0001hY-Cr
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 22:00:20 +0100
Received: from [77.182.190.96] (helo=[192.168.23.109])
	by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1ROc28-0001qr-Gi
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 22:19:40 +0100
Message-ID: <4EBC39EB.2060004@kernelconcepts.de>
Date: Thu, 10 Nov 2011 21:54:03 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EBC2FEF.5020405@kernelconcepts.de> <j9hc2l$b8u$3@dough.gmane.org>
In-Reply-To: <j9hc2l$b8u$3@dough.gmane.org>
X-Enigmail-Version: 1.1.2
Subject: Re: RFC: Clean up omap3.inc
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
X-List-Received-Date: Thu, 10 Nov 2011 21:00:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Koen,

Am 10.11.2011 21:27, schrieb Koen Kooi:
> Wrong. You can do the following in your machine.conf:
> 
> require omap3.inc
> 
> EXTRA_IMAGEDEPENDS = "whatever"

this is a workaround for a bad misconception. EXTRA_IMAGEDEPENDS could have been
appended everywhere and this intrusive override might break quite a lot.

> In OE classic, no. In meta-ti the cleanup is already underway.

I do not care bout meta-ti, its is broken in OE classic.


Removing this hardcoded dependency would not break anything. Only the board
maintainers who want to get it built automatically would have to add it.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en



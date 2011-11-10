Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1ROb4B-0005at-Mn
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 21:17:43 +0100
Received: from [77.182.190.96] (helo=[192.168.23.109])
	by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1RObMt-0001lE-KY
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 21:37:03 +0100
Message-ID: <4EBC2FEF.5020405@kernelconcepts.de>
Date: Thu, 10 Nov 2011 21:11:27 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.2
Subject: RFC: Clean up omap3.inc
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
X-List-Received-Date: Thu, 10 Nov 2011 20:17:44 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi all,

omap3.inc currently contains this line:

EXTRA_IMAGEDEPENDS += "u-boot x-load"

This makes it hard to build for an OMAP3 based machine without providing a
x-load configuration for it. Actually I do not think hardcoding a particular
bootloader for a class of SoC is a good idea at all. The selection whether a
bootloader needs to be build and which one to select should be a matter of the
machine configuration.

Could we please get rid of this and fix the board descriptions?

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en



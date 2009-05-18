Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1M6A4O-0003Bl-2l
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 23:08:24 +0200
Received: from [78.54.213.71] (helo=[192.168.1.177])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1M6A0c-0004kZ-B7
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 23:04:30 +0200
Message-ID: <4A11CC90.5020707@kernelconcepts.de>
Date: Mon, 18 May 2009 23:01:04 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>	<200905181716.24601.khimov@altell.ru>	<4A11B5B4.8040804@kernelconcepts.de>
	<200905182342.19486.khimov@altell.ru>
In-Reply-To: <200905182342.19486.khimov@altell.ru>
X-Enigmail-Version: 0.95.7
Subject: Re: [oe-commits] Roman I Khimov : (e)glibc-package: fix kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 21:08:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Roman I Khimov schrieb:
> Does 0.9.1 support "-E ..." parameter? That's the only reason for such 
> behavior I could think of currently.

Obviously not... looks like commit 6065fa491c009118ae282ae933215649cccfcd24
introduced this. It works if I revert the qemu command line changes.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en



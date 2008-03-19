Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JbwPQ-0001ka-73
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Mar 2008 12:24:45 +0100
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Jbwvd-0003rG-6K
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Mar 2008 12:57:57 +0100
Message-ID: <47E0F805.4020706@kernelconcepts.de>
Date: Wed, 19 Mar 2008 12:24:53 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <3D9ECBB5-7C37-4D62-8D15-F2F0673EB867@student.utwente.nl>
In-Reply-To: <3D9ECBB5-7C37-4D62-8D15-F2F0673EB867@student.utwente.nl>
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] error out on .la files pointing to ${WORKDIR}
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
X-List-Received-Date: Wed, 19 Mar 2008 11:24:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Koen Kooi schrieb:
> Things in stagin (e.g. .la files) point to ${WORKDIR} are broken and
> should die. If we want packaged-staging and rm_work to function we
> need to fix them. Since we are all lazy we need some incentive:

I'm not really a fan of enforcing things by breaking builds. I agree that we
need to fix this soon, but since some of this bugs are harmless and do not
affect the build at all I would not want to handle this that strict. If these
wrong files really break packaged-staging we get errors that force us to fix the
critical ones anyway.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76



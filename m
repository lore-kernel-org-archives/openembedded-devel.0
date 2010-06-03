Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1OKCAK-00048x-9G
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 17:17:08 +0200
Received: from meyreuil.atmel.fr (meyreuil [10.159.254.132])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id o53CvgJP025241;
	Thu, 3 Jun 2010 05:57:43 -0700 (PDT)
Received: from [127.0.0.1] (pc245_112.atmel.fr [10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o53CxFc22618; 
	Thu, 3 Jun 2010 14:59:15 +0200 (MEST)
Message-ID: <4C07A733.1040303@atmel.com>
Date: Thu, 03 Jun 2010 14:59:31 +0200
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF85@KCINPUNHJCMS01.kpit.com>	<AEB54AFF070EB34A921BC7E006B711BE11905D1147@SRV10.nortechonline.net>	<76E258664B189C4CBEF125491CA11ECC9445E0CF88@KCINPUNHJCMS01.kpit.com>,
	<AANLkTinJcbZ3ApaSpSvsrte40TWF8f5Rz3NIIXX8ZhCR@mail.gmail.com>
	<76E258664B189C4CBEF125491CA11ECC9445E0CF8C@KCINPUNHJCMS01.kpit.com>
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CF8C@KCINPUNHJCMS01.kpit.com>
X-SA-Exim-Connect-IP: 204.2.163.5
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: (No subject)
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
X-List-Received-Date: Thu, 03 Jun 2010 15:17:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Le 03/06/2010 14:13, Soumya R :
> Hi,
>     
> MACHINE = "at91sam9263ek"
> DISTRO = "angstrom-2008.1"
>     
>   I am new to this open embedded so you may seem may question is silly..
> I need to know wat i need to deploy to my target and where the final image is stored..
> Please help me out.. Thanks in advance :-)

I advice you to go on
http://www.linux4sam.org
and follow the documentation there. You will have an example of the
deployment of such a distribution.

In an OE build, here are the resulting images:
tmp/deploy/glibc/images/at91sam9263ek/

- Linux kernel (as a uImage suitable for u-boot):
  uImage-2.6.30-r1-at91sam9263ek.bin
- Angstrom rootfs:

Angstrom-x11-at91sam9-image-glibc-ipk-2009.X-stable-at91sam9263ek.rootfs.jffs2

For micro-image, you will find a different name but at the same location.

IPK packages are located here:
tmp/deploy/glibc/ipk/

Hope that it helps,
-- 
Nicolas Ferre




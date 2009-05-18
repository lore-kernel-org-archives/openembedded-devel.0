Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1M61rn-0004am-GF
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 14:22:51 +0200
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1M61o1-0006og-2e
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 14:18:57 +0200
Message-ID: <4A115165.9070300@kernelconcepts.de>
Date: Mon, 18 May 2009 14:15:33 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
In-Reply-To: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
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
X-List-Received-Date: Mon, 18 May 2009 12:22:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

GIT User account schrieb:
> +		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
> +		if kernel_ver is None:
> +			qemu = "qemu-%s  -s 1048576" % target_arch
> +		else:
> +			qemu = "qemu-%s  -s 1048576 -r %s" % (target_arch, kernel_ver)

are you sure this is a good idea?
OLDEST_KERNEL defaults to "2.4.0", so this change is likely to break locale
generation for every machine that doesn't have OLDEST_KERNEL set.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en



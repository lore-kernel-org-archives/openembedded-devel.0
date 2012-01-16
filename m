Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Rmvl4-00055I-9i
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jan 2012 00:14:34 +0100
Received: from [77.9.24.23] (helo=[192.168.1.184])
	by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1RmwBQ-0006cE-EA
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jan 2012 00:41:48 +0100
Message-ID: <4F14AD8D.5050609@kernelconcepts.de>
Date: Tue, 17 Jan 2012 00:06:53 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAHPA9DpV__ak869U+fDBh_eFnooTLZpxVKv3FOtG1aEKtHT-Hg@mail.gmail.com>
In-Reply-To: <CAHPA9DpV__ak869U+fDBh_eFnooTLZpxVKv3FOtG1aEKtHT-Hg@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Subject: Re: meta-toolchain-qte failing on gcc-cross-sdk_4.5.bb for mini6410
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
X-List-Received-Date: Mon, 16 Jan 2012 23:14:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Am 12.01.2012 20:14, schrieb Trevor Hickey:
> I have been trying to bitbake meta-toolchain-qte for the mini6410 and have
> been stuck on this linker problem.

> /home/balute/tmp/sysroots/i686-linux/usr/armv6/arm-angstrom-linux-gnueabi/bin/ld:
> error: emutls_s.o uses VFP register arguments, ./libgcc_s.so.1.tmp does not

that's an interesting one - I see the same problem here but have no found a
solution yet. It seems that only ARMv6 architectures are affected since all
other I build (ARMv4, ARMv5TE, ARMv7A, MIPSEL, SH4 and some PPC based ones do
not seem to suffer from this).

Greetings

Florian


-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en



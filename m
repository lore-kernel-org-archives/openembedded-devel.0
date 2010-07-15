Received: from mail.borenet.se ([213.134.106.117] helo=mail-storage.borenet.se)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xerxes@zafena.se>) id 1OZOic-00071C-6N
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 15:43:45 +0200
Received: from [192.168.1.106] (labb.zafena.se [213.134.106.61])
	by mail-storage.borenet.se (Postfix) with ESMTP id 820C130CF41;
	Thu, 15 Jul 2010 15:43:12 +0200 (CEST)
Message-ID: <4C3F10BD.8040603@zafena.se>
Date: Thu, 15 Jul 2010 15:44:29 +0200
From: =?UTF-8?B?WGVyeGVzIFLDpW5ieQ==?= <xerxes@zafena.se>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100527 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C3DF5BF.9040103@zafena.se>
	<201007142243.36837.marcin@juszkiewicz.com.pl>
In-Reply-To: <201007142243.36837.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 213.134.106.117
X-SA-Exim-Mail-From: xerxes@zafena.se
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenJDK-6 ARM Shark LLVM JIT testing
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
X-List-Received-Date: Thu, 15 Jul 2010 13:43:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2010-07-14 22:43, Marcin Juszkiewicz wrote:
> Dnia =C5=9Broda, 14 lipca 2010 o 19:37:03 Xerxes R=C3=A5nby napisa=C5=82=
(a):
>  =20
>> Hi all!
>>
>> I have committed some ARM Shark CPU features auto-detection code into
>> oe.dev.
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1ea15a=
2cd7317
>> 8c3fbab36b544a6601b1d1c32bf This patch will make OpenJDK use the best =
ARM
>> CPU features available when generating code using the Shark JIT.
>>    =20
>  =20
>> I need your help in order to find and catch the LLVM JIT bugs by testi=
ng
>> running Shark and report if
>> LLVM asserts during code generation.
>>    =20
> LLVM does not supports Thumb - thats hurt. Ubuntu had to disable Shark =
to get=20
> openjdk-6 built for armel.
>
> Regards,=20
>  =20

Hi!
My own testing indicates that it are possible to run a Shark build
compiled on a arm Ubuntu Jaunty system on a thumb2 system such as Ubuntu
Maverick or Lucid.

Have you tested to run the Debian squeeze llvm and openjdk-6-jre-zero
packages on Maverick? It might work.

If you want to build LLVM using the Maverick thumb toolchain then you
have to make sure to compile the LLVM libraries for -marm and possibly
compile the shark libjvm.so as -marm as well and double check that LLVM
actually uses the ARM JIT backend instead of the Thumb backend. LLVM
switches on the Thumb JIT backend by default (at compile time) if it
have autodetected the host system to be a Host: thumb-unknown-linux-gnuea=
bi.

Upstream Ubuntu bugreport:
https://bugs.launchpad.net/llvm/+bug/513735

Upstream LLVM bugreports to implement Thumb JIT support  are:
http://llvm.org/bugs/show_bug.cgi?id=3D6065  fix so that llvm can be
compiled with a thumb toolchain.
http://llvm.org/bugs/show_bug.cgi?id=3D6223  - ARM thumb target fails to
JIT tPUSH

A sidenote, LLVM currently supports generating thumb code during static
compilation using llc.

The LLVM Thumb JIT are on a good way to get finished, it currently nows
what instructions it needs to JIT but it dont know how the machinecodes
should look like in memory.
By implementing how the different thumb instructions look in memory
would makes it possible to complete the thumb JIT.

Cheers
Xerxes



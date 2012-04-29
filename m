Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOXsM-0002xE-4g
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2012 19:25:34 +0200
Received: by lbbgo4 with SMTP id go4so1432907lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 10:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=4tsoah2mmOCi42p94IBc/2MUF9mQXOkL6FQOWsGbaLc=;
	b=Q+wgR/2wMZ+NR8sk6GjUtqtqcwQC6wbw+ClWyE+DozGVF4EgswIbsC16KC65I8o8Hy
	aHvvoT2QRK1A8aeFX5Q0388YoS7PViteTfy5VzSRMmOvvX3VdFu4sqynnSZxJ24c8xoC
	EP/tlQi9OzP4Bh/yWDbd1L4mxZUVjPGjKnksqtvZbDZseabddFoqvQQgeVUsqg+764yt
	0okPeCS8opCmrMk99q28t1fq2gKMOT3aBiWBrQsNEN1T0zJv5mu8NyL3Gtvkhs6jhio6
	l+1xbrglXbQ99vogt1pnIr7Is4MjRub++1r6Z0W8ahEiitVBLOjbPnIqzsj9hgjz0zDA
	AdBg==
Received: by 10.112.32.72 with SMTP id g8mr2751391lbi.43.1335719753206; Sun,
	29 Apr 2012 10:15:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 29 Apr 2012 10:15:23 -0700 (PDT)
In-Reply-To: <92932941-A66D-45AF-8CDC-8F56D66C4E02@gmail.com>
References: <92932941-A66D-45AF-8CDC-8F56D66C4E02@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Apr 2012 10:15:23 -0700
Message-ID: <CAMKF1soQ+eShsN+r5ZPA60vSEmEKZmKCM-WTt0mhghVUAteOUg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc-4.4.1 assembler error: offset out of range
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
X-List-Received-Date: Sun, 29 Apr 2012 17:25:34 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 29, 2012 at 9:56 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> | /tmp/ccC0NmMi.s: Assembler messages:
> | /tmp/ccC0NmMi.s:36309: Error: offset out of range
> | /tmp/ccC0NmMi.s:36310: Error: offset out of range
> | /tmp/ccC0NmMi.s:36345: Error: offset out of range
> | /tmp/ccC0NmMi.s:36346: Error: offset out of range
> | /tmp/ccC0NmMi.s:36381: Error: offset out of range
> | /tmp/ccC0NmMi.s:36382: Error: offset out of range
> | /tmp/ccC0NmMi.s:36416: Error: offset out of range
> | /tmp/ccC0NmMi.s:36417: Error: offset out of range
> | make[2]: *** [insn-output.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/gcc'
> | make[1]: *** [all-gcc] Error 2

There could be that gcc is generating long branched which then
assembler catches. Usually these errors I remember dealing with was if
you compiled in thumb mode. But you seem to be not using thumb mode so
thats non issue here.

Another possibility is that the binutils/gas you have has bug in it.

You have to post the assembly output that assembler is rejecting here
for further details

Anyhow, when you are changing from 4.3.3 why to 4.4.1 and not 4.5 that
has been in OE for long and is default compiler for many OE based
distributions out there



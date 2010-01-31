Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbQQp-00034L-9W
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 04:25:06 +0100
Received: by pxi9 with SMTP id 9so2889890pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 19:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:cc:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=h9eEzI/EUflI4h9/W1lAWlfOxpIQ7ZiS6votNqeHzwk=;
	b=DobiQL/+YuAAWndsfPzmohKMp4fLsCpubkZhmPPSM0DlSNXzFm15YoMni8lsM75BNX
	R72m2UYR0PLw9g8Rnidx27bcB4a3QbgWCZxI477mxZFLAHdBzP/cFsoejL3dfPVFTEuq
	29FgIxN7j/eE0tLk3l6EofwSukg/y+x4Tu2Og=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:cc:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=Zb7odZmNHmTtiYTaG6gAkFmbOJCw1pdgOtd3VHhf3wqKVeB8dtZ3vTeIfstGS56JOA
	bVRPl2QBmDC573/sY9ckZQeYJGqpNo69DMROSkmGwvJ5hR6gLOJcRgWfM6ZWWti+X0uB
	kJRLQ9D5Z4iqlP83p8PEeEKJhcptYtvRaT6Js=
Received: by 10.141.91.19 with SMTP id t19mr1915497rvl.186.1264908157679;
	Sat, 30 Jan 2010 19:22:37 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 22sm3094512pzk.10.2010.01.30.19.22.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 19:22:37 -0800 (PST)
To: "Guo Hongruan" <camelguo@gmail.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
References: <op.u7dnj4v0mn1qzu@camelguo>
Date: Sun, 31 Jan 2010 11:22:27 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dnnpa6mn1qzu@camelguo>
In-Reply-To: <op.u7dnj4v0mn1qzu@camelguo>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: slapin@ossfans.org
Subject: Re: building u-boot - git failed
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
X-List-Received-Date: Sun, 31 Jan 2010 03:25:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

The same error when
MACHINE=3Dat91sam9g20ek DISTRO=3Dmicro LIBC=3Dglibc
see the following url for more information:
http://tinderbox.openembedded.net/packages/450941/


=E5=9C=A8 Sun, 31 Jan 2010 11:20:18 +0800=EF=BC=8CGuo Hongruan <camelguo=
@gmail.com> =E5=86=99=E9=81=93:

> Hi guys,
>    I tried to building openembedded with the following configuration:
> MACHINE=3Dafeb9260 DISTRO=3Dmicro LIBC=3Dglibc
> MACHINE=3Ddm355-evm DISTRO=3Dmicro LIBC=3Dglibc
> MACHINE=3Ddm365-evm DISTRO=3Dmicro LIBC=3Dglibc
> MACHINE=3Ddm6446-evm DISTRO=3Dmicro LIBC=3Dglibc
> MACHINE=3Ddm6467-evm DISTRO=3Dmicro LIBC=3Dglibc
>
> And it failed with the following information:
>
> rm-oe-linux-gnueabi-gcc -g  -Os   -fno-strict-aliasing  -fno-common  =

> -ffixed-r8 -msoft-float  -D__KERNEL__ -DTEXT_BASE=3D0x21f00000  =

> -I/media/work-disk/workdir/arm-926ejs-test/work/afeb9260-oe-linux-gnue=
abi/u-boot-git-r37/git/include  =

> -fno-builtin -ffreestanding -nostdinc -isystem  =

> /media/work-disk/workdir/arm-926ejs-test/cross/armv5te/lib/gcc/arm-oe-=
linux-gnueabi/4.4.2/include  =

> -pipe  -DCONFIG_ARM -D__ARM__ -march=3Darmv5te -mabi=3Dapcs-gnu  =

> -mno-thumb-interwork  -Wall -Wstrict-prototypes -fno-stack-protector -=
c  =

> -o board.o board.c
> board.c:126: error: inline function 'coloured_LED_init' cannot be  =

> declared weak
> board.c:128: error: inline function 'red_LED_on' cannot be declared we=
ak
> board.c:130: error: inline function 'red_LED_off' cannot be declared w=
eak
> board.c:132: error: inline function 'green_LED_on' cannot be declared =
 =

> weak
> board.c:134: error: inline function 'green_LED_off' cannot be declared=
  =

> weak
> board.c:136: error: inline function 'yellow_LED_on' cannot be declared=
  =

> weak
> board.c:138: error: inline function 'yellow_LED_off' cannot be declare=
d  =

> weak
>
> for more detailed information, please see the following urls:
> http://tinderbox.openembedded.net/packages/451342/
> http://tinderbox.openembedded.net/packages/451366/
> http://tinderbox.openembedded.net/packages/451383/
> http://tinderbox.openembedded.net/packages/451406/
> http://tinderbox.openembedded.net/packages/451420/
>
> anyone can give me some hints?
>
> Thanks a lot!
>


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com



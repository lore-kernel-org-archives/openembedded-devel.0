Received: from [66.249.82.226] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hvontres@gmail.com>) id 1HxlOl-0005af-GN
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2007 17:01:42 +0200
Received: by wx-out-0506.google.com with SMTP id h29so1524911wxd
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2007 07:58:48 -0700 (PDT)
Received: by 10.90.81.14 with SMTP id e14mr5231409agb.1181573927987;
	Mon, 11 Jun 2007 07:58:47 -0700 (PDT)
Received: by 10.90.68.14 with HTTP; Mon, 11 Jun 2007 07:58:47 -0700 (PDT)
Message-ID: <a7f8874a0706110758g123c10r660aae8be1b19653@mail.gmail.com>
Date: Mon, 11 Jun 2007 07:58:47 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46689C95.6010209@gmx.de>
MIME-Version: 1.0
References: <46689C95.6010209@gmx.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: arm kexec commandline support
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
X-List-Received-Date: Mon, 11 Jun 2007 15:01:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 6/7/07, Thomas Kunze <thommycheck@gmx.de> wrote:
>
> Hi all,
>
> I have written a quick hack to support custom commandlines for arm with
> kexec. You need:
>
>
> http://www2.informatik.hu-berlin.de/~tkunze/zaurus/patches/kexec_commandline-3.patch
>
> and:
>
>
> http://www2.informatik.hu-berlin.de/~tkunze/zaurus/patches/atag_support.patch
>
> (from lak)
>
>
> How to use:
> Use kexec as usual. To change the commandline do:
> echo "your commandline" > /sys/kernel/kexec_cmdline
>
> This sets up a ataglist in memory which is copied to 0xc0000100 when
> machine is rebooted.
> This address is given the new kernel as ataglist in r2.
>
> This works on collie, but should work on any arm machine. I didn't find
> out why I can't give an arbitrary address to the new kernel in r2 but it
> doesn't work (machine hangs.)
>
> Comments are welcome.
>
> Thomas


I  tested this  with linux-rp-2.6.20 on poodle. The kernel will boot and I
can kexec other kernels with built in cmdlines. If I try to set a new
cmdline however, it segfaults. Here is the crash dump:

<0>Starting new kernel
<1>Unable to handle kernel paging request at virtual address e0000100
<1>pgd = c1348000
<1>[e0000100] *pgd=00000000
<4>Internal error: Oops: 8f5 [#1]
<4>Modules linked in: pxaficp_ir ircomm_tty ircomm irda snd_soc_poodle
snd_soc_pxa2xx_i2s snd_soc_wm8731 snd_soc_pxa2xx snd_soc_core snd_pcm_oss
snd_
<4>CPU: 0
<4>PC is at memcpy+0x50/0x330
<4>LR is at 0x736e6f63
<4>pc : [<c00fcc30>]    lr : [<736e6f63>]    Not tainted
<4>sp : c15d5e5c  ip : 54410009  fp : c15d5e84
<4>r10: 00000000  r9 : c15d4000  r8 : 00000023
<4>r7 : 00000000  r6 : 00001000  r5 : 00000001  r4 : 54410001
<4>r3 : 00000005  r2 : 00000392  r1 : c1a1ba00  r0 : e0000100
<4>Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  Segment user
<4>Control: 397F
<4>Table: A1348000  DAC: 00000015
<4>Process kexec (pid: 1423, stack limit = 0xc15d4258)
<4>Stack: (0xc15d5e5c to 0xc15d6000)
<4>5e40:
a134c000
<4>5e60: 00000000 fee1dead c001cfa8 e0000100 c134c000 c0022f38 c15d5fa4
c15d5e88
<4>5e80: c004a810 c0022ec4 c006cdb8 c0100e5c c15d5ee4 c15d5ea0 c0025058
c006cd70
<4>5ea0: c15d5f14 c00091fc 00000100 00000000 00000000 c0013144 000000a4
000000a4
<4>5ec0: a1d8105f 00000000 00000000 c0013130 c150b650 00000000 c15d5f44
c15d5ee8
<4>5ee0: c007070c c0024f20 c0096c10 c0096b94 00000000 c1e8f758 00000000
00000000
<4>5f00: c1af43a0 c15d5f10 c1349000 0000031c c1430420 00000002 c15d5f54
ffffffff
<4>5f20: 00000002 c1af43d4 c15d5f44 c15d5f38 c0053a40 c0102660 c15d5f84
c15d5f48
<4>5f40: c002496c c0053a3c c15d5f64 c15d5f58 c00859b0 00000000 c15d5f84
ffffffff
<4>5f60: 00001000 000001e0 0000a90c 00000000 00000000 40123000 c15d5f9c
c15d5f88
<4>5f80: c0024a38 c0024758 4002e004 be943c44 be943c28 00000058 00000000
c15d5fa8
<4>5fa0: c001ce00 c004a678 4002e004 be943c44 fee1dead 28121969 45584543
00000000
<4>5fc0: 4002e004 be943c44 be943c28 00000058 00000000 00000000 40123000
be943c24
<4>5fe0: be943c10 be943c00 0000a82c 400c7570 60000010 fee1dead 20000008
00000000
<4>Backtrace:
<4>[<c0022eb8>] (machine_kexec+0x0/0xe4) from [<c004a810>]
(sys_reboot+0x1a4/0x214)
<4>[<c004a66c>] (sys_reboot+0x0/0x214) from [<c001ce00>]
(ret_fast_syscall+0x0/0x2c)
<4> r7 = 00000058  r6 = BE943C28  r5 = BE943C44  r4 = 4002E004
<4>Code: f5d1f05c f5d1f07c e8b151f8 e2522020 (e8a051f8)
<4>


I hope this helps,

Henry


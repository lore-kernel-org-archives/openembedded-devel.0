Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GQLB3-0000f7-2T for openembedded-devel@lists.openembedded.org;
	Thu, 21 Sep 2006 11:49:05 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id CF59C401B45; Thu, 21 Sep 2006 02:21:20 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060921092120.CF59C401B45@tinman.treke.net>
Date: Thu, 21 Sep 2006 02:21:20 -0700 (PDT)
Subject: [Bug 1429] New: Irda causes oops in OZ 3.5.4.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2006 09:49:05 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1429

           Summary: Irda causes oops in OZ 3.5.4.1
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: dp@xora.org.uk
         QAContact: tinderbox-oe@gmx.net


Trying to use Irda causes an oops

Easy to repeat, start gpe-beam, set to receive file, send a file, boom oops.

Do it a second time boom, hard lockup.


pxa_ir: irda startup
pxa_ir: irda driver opened
pxa_ir: sir receiving error
pxa_ir: sir receiving error
pxa_ir: sir receiving error
pxa_ir: sir receiving error
Internal error: Oops - undefined instruction: 0 [#1]
Modules linked in: uinput rfcomm pxaficp_ir ircomm_tty ircomm irda ipv6 hidp
l2cap bluetooth snd_soc_corgi snd_soc_pxa2xx_i2s snd_soc_wm8731 snd_soc_pxa2xx
snd_soc_core snd_pcm_oss snd_pcm snd_timer snd_page_alloc snd_mixer_oss snd
soundcore
CPU: 0
PC is at 0xc14ec324
LR is at __wake_up_common+0x50/0x78
pc : [<c14ec324>]    lr : [<c004fa9c>]    Not tainted
sp : c0dd9e90  ip : c0dd9ddc  fp : c0dd9eb8
r10: 00000001  r9 : 00000000  r8 : 00000000
r7 : c0dd9f78  r6 : c1430a58  r5 : c032b2a0  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 00000001  r0 : c0dd9ddc
Flags: Nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: 397F  Table: A1398000  DAC: 00000015
Process gpe-beam (pid: 3540, stack limit = 0xc0dd8198)
Stack: (0xc0dd9e90 to 0xc0dda000)
9e80:                                     c0dd8000 80000013 c1430a40 c0d86d54
9ea0: c032b620 c0dd8000 405bd12c c0dd9ed4 c0dd9ebc c004fb04 c004fa58 00000000
9ec0: c0dd8000 c124c800 c0dd9ee8 c0dd9ed8 c018151c c004fad0 c1430a64 c0dd9f04
9ee0: c0dd9eec bf0c4634 c01814e0 c1430a64 bf0d26a0 c1430a40 c0dd9f20 c0dd9f08
9f00: c017dfa4 bf0c45fc c1430a64 c14ec2a0 c1430a64 c0dd9f34 c0dd9f24 c017ee00
9f20: c017df88 00000008 c0dd9f58 c0dd9f38 c0097ca4 c017edd8 c14ec2a0 00000000
9f40: c0399040 c14ec2a0 c0038f44 c0dd9f68 c0dd9f5c c0097df8 c0097c08 c0dd9f84
9f60: c0dd9f6c c00961c4 c0097dd4 00000000 c0dd8000 c0399040 c0dd9fa4 c0dd9f88
9f80: c0096270 c0096158 000ec988 405bd9f0 000ec968 00000006 00000000 c0dd9fa8
9fa0: c0038da0 c00961dc 000ec988 405bd9f0 00000017 00000000 00000000 00000001
9fc0: 000ec988 405bd9f0 000ec968 00018584 0001858c 00000001 405bd12c 000e8878
9fe0: 00000000 be7ffad0 4062de18 4062de24 60000010 00000017 530e530e 530e530e
Backtrace:
[<c004fa4c>] (__wake_up_common+0x0/0x78) from [<c004fb04>]
(__wake_up+0x40/0x60)
[<c004fac4>] (__wake_up+0x0/0x60) from [<c018151c>] (sock_def_wakeup+0x48/0x64)
 r5 = C124C800  r4 = C0DD8000
[<c01814d4>] (sock_def_wakeup+0x0/0x64) from [<bf0c4634>]
(irda_release+0x44/0x138 [irda])
 r4 = C1430A64
[<bf0c45f0>] (irda_release+0x0/0x138 [irda]) from [<c017dfa4>]
(sock_release+0x28/0x108)
 r6 = C1430A40  r5 = BF0D26A0  r4 = C1430A64
[<c017df7c>] (sock_release+0x0/0x108) from [<c017ee00>] (sock_close+0x34/0x40)
 r6 = C1430A64  r5 = C14EC2A0  r4 = C1430A64
[<c017edcc>] (sock_close+0x0/0x40) from [<c0097ca4>] (__fput+0xa8/0x1cc)
 r4 = 00000008
[<c0097bfc>] (__fput+0x0/0x1cc) from [<c0097df8>] (fput+0x30/0x34)
 r8 = C0038F44  r7 = C14EC2A0  r6 = C0399040  r5 = 00000000
 r4 = C14EC2A0
[<c0097dc8>] (fput+0x0/0x34) from [<c00961c4>] (filp_close+0x78/0x84)
[<c009614c>] (filp_close+0x0/0x84) from [<c0096270>] (sys_close+0xa0/0xc4)
 r6 = C0399040  r5 = C0DD8000  r4 = 00000000
[<c00961d0>] (sys_close+0x0/0xc4) from [<c0038da0>] (ret_fast_syscall+0x0/0x2c)
 r7 = 00000006  r6 = 000EC968  r5 = 405BD9F0  r4 = 000EC988
Code: c1430a40 c14ec318 c14ec318 c1430b00 (be00f7be)
 <6>note: gpe-beam[3540] exited with preempt_count 2


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.



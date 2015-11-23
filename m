Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 07CF060621
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 07:04:18 +0000 (UTC)
Received: by qgcc31 with SMTP id c31so65271085qgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 23:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=lfeoGsR6zgP7WJU32pSnBFfAOgAlePMOaEa2veYCOqA=;
	b=mxvDNnZ6xghdDk0RXIlcai4JwvtRly7H7BmdUxZiya+UH9akd0OlQB0PRtKtX6kWvZ
	CsRkvacroUil1Wf7CpcBd4bydrkCQ+3LbZFHJAKH+68wakNRGNH/tBoiQg786A4Gx1Ap
	2do5u0eouU0MMONmk1/XhSh+29mtDMaQQCPmEKKSXbcfzCOrrsSlB8nrB7dxQWjU2aX6
	gPfv9ByciCAcFtin4p4z2kdh5+fh4/a0MG/p2e2Msdk+WqkFyYJQCAr7hmGBsU0a32q0
	BnRfSRvfDJFJJne4A0I9ocsxohdz/uEC7IqRWJ1JLCY82WMRuDDHdt3no0js3rJ5gkNv
	sLGg==
MIME-Version: 1.0
X-Received: by 10.140.41.210 with SMTP id z76mr25517916qgz.81.1448262258481;
	Sun, 22 Nov 2015 23:04:18 -0800 (PST)
Received: by 10.55.114.1 with HTTP; Sun, 22 Nov 2015 23:04:18 -0800 (PST)
Date: Mon, 23 Nov 2015 09:04:18 +0200
Message-ID: <CADnUhn0BZ7nf+SCick-Sh=ZxkWVO0xrzzD4e5_FqoZVOLgZAsA@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Apache hang
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Nov 2015 07:04:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi!

My set-up is as follows: am335x based board, Poky/fido, Apache from
meta-openembedded/meta-webserver/recipes-httpd/apache2 (fido).
I am accessing board with http calls once every second. I have found my
board booting every now and then - every couple of days...two weeks. Now I
had serial console connected for this little more than two weeks and got
following kernel listing. It looks to me that Apache gets locked. I don't
have more of these events recorded so far but I'll have that listing
attached below in case some one can find it useful. I'll keep the console
connected to make it sure that Apache is always the trouble maker.

Thanks,
Matti

[1381525.167549] BUG: soft lockup - CPU#0 stuck for 22s! [httpd:1567]
[1381525.174052] Modules linked in: ipv6 musb_dsps musb_hdrc spidev
ti_am335x_adc ti_am335x_tsc kfifo_buf musb_am335x
[1381525.184959]
[1381525.186712] CPU: 0 PID: 1567 Comm: httpd Not tainted 3.14.54 #1
[1381525.193092] task: c48e49c0 ti: c4852000 task.ti: c4852000
[1381525.198944] PC is at ktime_get_ts+0x164/0x1a0
[1381525.203690] LR is at 0xfffffffa
[1381525.207163] pc : [<c0074d88>]    lr : [<fffffffa>]    psr: a0080013
[1381525.207163] sp : c4853ee8  ip : 00000006  fp : ffffffff
[1381525.219539] r10: c4653600  r9 : 00000000  r8 : 3b9ac9ff
[1381525.225188] r7 : 00000001  r6 : c4853f70  r5 : ffffffe9  r4 : b12800fd
[1381525.232199] r3 : d106da23  r2 : f196f246  r1 : c9bf9d8f  r0 : 0015152c
[1381525.239212] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
Segment user
[1381525.246860] Control: 10c5387d  Table: 8489c019  DAC: 00000015
[1381525.253056] CPU: 0 PID: 1567 Comm: httpd Not tainted 3.14.54 #1
[1381525.259479] [<c0014ce0>] (unwind_backtrace) from [<c001219c>]
(show_stack+0x10/0x14)
[1381525.267785] [<c001219c>] (show_stack) from [<c008fa6c>]
(watchdog_timer_fn+0x118/0x140)
[1381525.276372] [<c008fa6c>] (watchdog_timer_fn) from [<c005609c>]
(__run_hrtimer.isra.34+0x44/0xf0)
[1381525.285760] [<c005609c>] (__run_hrtimer.isra.34) from [<c0056840>]
(hrtimer_interrupt+0xfc/0x2c0)
[1381525.295246] [<c0056840>] (hrtimer_interrupt) from [<c0023364>]
(omap2_gp_timer_interrupt+0x28/0x30)
[1381525.304911] [<c0023364>] (omap2_gp_timer_interrupt) from [<c006d874>]
(handle_irq_event_percpu+0xd0/0x198)
[1381525.315199] [<c006d874>] (handle_irq_event_percpu) from [<c006d978>]
(handle_irq_event+0x3c/0x5c)
[1381525.324675] [<c006d978>] (handle_irq_event) from [<c006fd40>]
(handle_level_irq+0x90/0xfc)
[1381525.333517] [<c006fd40>] (handle_level_irq) from [<c006cfe8>]
(generic_handle_irq+0x2c/0x3c)
[1381525.342536] [<c006cfe8>] (generic_handle_irq) from [<c000f8a8>]
(handle_IRQ+0x38/0x84)
[1381525.351012] [<c000f8a8>] (handle_IRQ) from [<c0008654>]
(omap3_intc_handle_irq+0x8c/0x9c)
[1381525.359774] [<c0008654>] (omap3_intc_handle_irq) from [<c0599e80>]
(__irq_svc+0x40/0x50)
[1381525.368420] Exception stack(0xc4853ea0 to 0xc4853ee8)
[1381525.373896] 3ea0: 0015152c c9bf9d8f f196f246 d106da23 b12800fd
ffffffe9 c4853f70 00000001
[1381525.382643] 3ec0: 3b9ac9ff 00000000 c4653600 ffffffff 00000006
c4853ee8 fffffffa c0074d88
[1381525.391379] 3ee0: a0080013 ffffffff
[1381525.395222] [<c0599e80>] (__irq_svc) from [<c0074d88>]
(ktime_get_ts+0x164/0x1a0)
[1381525.403264] [<c0074d88>] (ktime_get_ts) from [<c00ec264>]
(poll_select_set_timeout+0x60/0x8c)
[1381525.412380] [<c00ec264>] (poll_select_set_timeout) from [<c00ecd0c>]
(SyS_select+0xa8/0x118)
[1381525.421397] [<c00ecd0c>] (SyS_select) from [<c000efe0>]
(ret_fast_syscall+0x0/0x38)
[1381525.430220] Kernel panic - not syncing: softlockup: hung tasks
[1381525.436517] CPU: 0 PID: 1567 Comm: httpd Not tainted 3.14.54 #1
[1381525.442926] [<c0014ce0>] (unwind_backtrace) from [<c001219c>]
(show_stack+0x10/0x14)
[1381525.451220] [<c001219c>] (show_stack) from [<c0590728>]
(panic+0x9c/0x1f0)
[1381525.458604] [<c0590728>] (panic) from [<c008fa8c>]
(watchdog_timer_fn+0x138/0x140)
[1381525.466726] [<c008fa8c>] (watchdog_timer_fn) from [<c005609c>]
(__run_hrtimer.isra.34+0x44/0xf0)
[1381525.476108] [<c005609c>] (__run_hrtimer.isra.34) from [<c0056840>]
(hrtimer_interrupt+0xfc/0x2c0)
[1381525.485584] [<c0056840>] (hrtimer_interrupt) from [<c0023364>]
(omap2_gp_timer_interrupt+0x28/0x30)
[1381525.495245] [<c0023364>] (omap2_gp_timer_interrupt) from [<c006d874>]
(handle_irq_event_percpu+0xd0/0x198)
[1381525.505538] [<c006d874>] (handle_irq_event_percpu) from [<c006d978>]
(handle_irq_event+0x3c/0x5c)
[1381525.515012] [<c006d978>] (handle_irq_event) from [<c006fd40>]
(handle_level_irq+0x90/0xfc)
[1381525.523848] [<c006fd40>] (handle_level_irq) from [<c006cfe8>]
(generic_handle_irq+0x2c/0x3c)
[1381525.532868] [<c006cfe8>] (generic_handle_irq) from [<c000f8a8>]
(handle_IRQ+0x38/0x84)
[1381525.541338] [<c000f8a8>] (handle_IRQ) from [<c0008654>]
(omap3_intc_handle_irq+0x8c/0x9c)
[1381525.550092] [<c0008654>] (omap3_intc_handle_irq) from [<c0599e80>]
(__irq_svc+0x40/0x50)
[1381525.558734] Exception stack(0xc4853ea0 to 0xc4853ee8)
[1381525.564212] 3ea0: 0015152c c9bf9d8f f196f246 d106da23 b12800fd
ffffffe9 c4853f70 00000001
[1381525.572954] 3ec0: 3b9ac9ff 00000000 c4653600 ffffffff 00000006
c4853ee8 fffffffa c0074d88
[1381525.581690] 3ee0: a0080013 ffffffff
[1381525.585532] [<c0599e80>] (__irq_svc) from [<c0074d88>]
(ktime_get_ts+0x164/0x1a0)
[1381525.593559] [<c0074d88>] (ktime_get_ts) from [<c00ec264>]
(poll_select_set_timeout+0x60/0x8c)
[1381525.602671] [<c00ec264>] (poll_select_set_timeout) from [<c00ecd0c>]
(SyS_select+0xa8/0x118)
[1381525.611694] [<c00ecd0c>] (SyS_select) from [<c000efe0>]
(ret_fast_syscall+0x0/0x38)


Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11A49745A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2018 03:22:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9J3MBql017024
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Oct 2018 20:22:11 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 18 Oct 2018 20:22:10 -0700
To: Martin Jansa <martin.jansa@gmail.com>, <nick83ola@gmail.com>
References: <1539753685-18233-1-git-send-email-Qi.Chen@windriver.com>
	<CABPh3UO90oG9asuYcmbi6BsTg84Y1oSrfQFu+C16x-=rEuBfJA@mail.gmail.com>
	<CABPh3UOQCLzXK4CTGsQQw1YH_buPr=guuW+x6axW6nn_eCAw9A@mail.gmail.com>
	<CA+chaQfcYFFVBMSC4D5yAeHy8_wviYy40C9vT1QHDfEsPfKLbg@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a97b0111-87c5-0f71-e616-483fc672960b@windriver.com>
Date: Fri, 19 Oct 2018 11:28:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfcYFFVBMSC4D5yAeHy8_wviYy40C9vT1QHDfEsPfKLbg@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] systemd: upgrade to 239
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
X-List-Received-Date: Fri, 19 Oct 2018 03:22:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

In brief, I also agree with Martin and will send out patch to add back 
these alternatives for systemd.
Just one thing to confirm.
Martin, you have a customized busybox defconfig which enables init 
utilties by default, right?

Below are more details and history.

1) Why removing alternatives of init utilities from systemd?
I removed the alternatives for init utilities from systemd because I 
thought these init utilities are basically bound to init manager. In 
other words, there's no point to use reboot from busybox when init 
manager is systemd. Same logic applies to other utilities. So I removed 
these alternatives of the init utilties from systemd, and also moved 
related busybox configs to init.cfg.

2) Why reboot is moved out of busybox init.cfg and added back as an 
alternative for systemd?
The above logic misses one thing, the live image. In oe-core, the 
initramfs for the live image is implemented as a bunch of shell scripts. 
And they need the 'reboot' command. More particularly, they call 'reboot 
-f'. That means they only want kernel to do reboot directly, discarding 
PID 1.
There's a yocto bug for this. 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12914

3) The current situation and potential problems
For oe-core, currently we have:
root@qemux86-64:~# ls -l /sbin/reboot
lrwxrwxrwx 1 root root 20 Oct 18 10:50 /sbin/reboot -> /sbin/reboot.systemd
root@qemux86-64:~# ls -l /sbin/reboot.systemd
lrwxrwxrwx 1 root root 16 Oct 18 10:11 /sbin/reboot.systemd -> 
../bin/systemctl
So for oe-core's default configs, things work well.

BUT, I'm now somewhat worried about users who have customized busybox 
defconfig which enables init utilities by default. The current oe-core 
release will cause regression for them if they use systemd +  busybox.

4) What I will do.
I'll add back these init utilities for systemd to avoid regression.

Best Regards,
Chen Qi

On 10/18/2018 06:55 PM, Martin Jansa wrote:
> Using u-a for the systemd symlinks to systemctl seems like best 
> solution to me, I've already suggested it in:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156597.html
>
> On Thu, Oct 18, 2018 at 12:33 PM nick83ola <nick83ola@gmail.com 
> <mailto:nick83ola@gmail.com>> wrote:
>
>     Another thing:
>
>     previously
>     ALTERNATIVE_PRIORITY[reboot] = "100"
>     was
>     ALTERNATIVE_PRIORITY[reboot] = "300"
>
>     diff of the relevant part:
>
>     539,566c559
>     < # TODO:
>     < # u-a for runlevel and telinit
>     <
>     < ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel
>     resolv-conf"
>     <
>     < ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
>     < ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
>     < ALTERNATIVE_PRIORITY[init] ?= "300"
>     <
>     < ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
>     < ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
>     < ALTERNATIVE_PRIORITY[halt] ?= "300"
>     <
>     < ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
>     < ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
>     < ALTERNATIVE_PRIORITY[reboot] ?= "300"
>     <
>     < ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
>     < ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
>     < ALTERNATIVE_PRIORITY[shutdown] ?= "300"
>     <
>     < ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
>     < ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
>     < ALTERNATIVE_PRIORITY[poweroff] ?= "300"
>     <
>     < ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
>     < ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
>     < ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>     ---
>     > ALTERNATIVE_${PN} = "resolv-conf reboot"
>     570a564,566
>     >
>     > ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
>     > ALTERNATIVE_PRIORITY[reboot] = "100"
>
>     On Thu, 18 Oct 2018 at 11:29, nick83ola <nick83ola@gmail.com
>     <mailto:nick83ola@gmail.com>> wrote:
>
>     > Hi Chen,
>     >
>     > regarding this issue:
>     >
>     > >On 07/26/2018 07:05 AM, Ricardo Salveti wrote:
>     > >> On Mon, Jul 16, 2018 at 11:05 PM, Chen Qi <Qi.Chen at
>     windriver.com <http://windriver.com>> wrote:
>     > >>> Upgrade systemd to 239.
>     > >>>
>     > >>> 3. update-alternatives changes
>     > >>>    The utilities like shutdown, poweroff, etc. are now
>     created as symlinks
>     > >>>    at do_install. So there's no need to use
>     update-alternatives mechanism
>     > >>>    anymore to create the symlinks now. In addtion, I don't
>     think we now
>     > >>>    support multiple init systems at one running system, so
>     there's really
>     > >>>    no need to use update-alternatives mechanism here.
>     > >> I noticed that reboot stopped working locally as I had busybox
>     > >> installed together with systemd, and the busybox version ended up
>     > >> being used as it was provided via update-alternatives.
>     > >>
>     > >> Looking for possible similar broken links, I found that
>     > >> update-alternatives ended up pointing reboot, halt and
>     poweroff to the
>     > >> busybox binary instead of systemctl. Should we revert the
>     changes and
>     > >> bring back update-alternatives for them?
>     > >>
>     > >> Thanks,
>     > >
>     > >I think the correct direction to fix this problem is to make
>     busybox
>     > >only provide init utilities (reboot, halt, etc) when init
>     manager is set
>     > >to busybox.
>     > >
>     > >We current have in busybox recipe's SRC_URI:
>     > >            ${@["",
>     > >"file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') ==
>     > >'busybox')]} \
>     > >
>     > >I think the init utilities should be moved to init.cfg.
>     > >
>     > >Please check my logic to see if you can agree with it.
>     > >We have two facts here.
>     > >1. Init utilities (reboot, halt, etc.) are tightly bond to the
>     specific
>     > >implementation of PID 1.
>     > >2. We only allow one PID 1 in our image.
>     (VIRTUAL-RUNTIME_init_manager).
>     > >So we can conclude from the above two facts that it does not
>     make much
>     > >sense to have multiple providers of init utilities while we
>     only allow
>     > >one PID 1 provider on image.
>     > >
>     > >After all, we are using update-*alternatives*, things that this
>     > >mechanism manages are supposed to generally serve as
>     alternatives to
>     > >each other.
>     > >
>     > >Best Regards,
>     > >Chen Qi
>     >
>     > Can you elaborate more what we need to patch?
>     >
>     > because this update break all the systemd based systems...
>     >
>     > Also there's a following patch that add back an alternative for
>     busybox
>     >
>     > 8421aede4fdd5132eb953a59099670f9ab1f7f01  systemd: add
>     ALTERNATIVE for reboot
>     >
>     > What's the more correct way to do fix this?
>     >
>     > Best Regards
>     >
>     > Nicola Lunghi
>     >
>     >
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



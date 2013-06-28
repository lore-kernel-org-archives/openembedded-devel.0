Return-Path: <yanglei.fage@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6129E6AD5D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 03:39:35 +0000 (UTC)
Received: by mail-bk0-f48.google.com with SMTP id jf17so574850bkc.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 20:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ygbgy6st9WCYWXpV2yC/Cy3F7c/nVtnhmrjs6HjRi80=;
	b=eHPFVoVrP1ogPiGjUCCKIq2bCAK3zqWLpuw4+G0H7ryJNk9w4UDNpAvi8nRn4b1zNk
	Kcg2W+HmA15G4uo3Fq3Ox9PNjyVqnm8a9UTIC57IkK0XaoYt31W8PIG/KEvWKMvplHT0
	lwHZW795ZC8UKvwKS1WxkvO9DwDcGxTKk9yBhAOWIGx1Eg54qgCBGDtUTCouWobCXn09
	ujIApCRF/LZJbhHqnL9m97w6kArm9m3ojxFFW/yDUs0+mX7aYDm9G3TWLx4uhvr26B2s
	YcxS7qWCpoLnoUsIPCHxJTfSAROzbFrm+DKS89omN+fvY9JhfNDVsOtJ6QTXUt6K4f1T
	QiUg==
MIME-Version: 1.0
X-Received: by 10.205.114.138 with SMTP id fa10mr1516839bkc.30.1372390774744; 
	Thu, 27 Jun 2013 20:39:34 -0700 (PDT)
Received: by 10.205.34.139 with HTTP; Thu, 27 Jun 2013 20:39:34 -0700 (PDT)
In-Reply-To: <20130627123859.GA3812@windriver.com>
References: <1372326719-11068-1-git-send-email-lei.yang@windriver.com>
	<CANyK_8cc7LLLDJssgeWhRHkBy4AshZsGByvjUdwJUZPeBzprgw@mail.gmail.com>
	<20130627123859.GA3812@windriver.com>
Date: Fri, 28 Jun 2013 11:39:34 +0800
Message-ID: <CAHsH0E8fpqeSnFRoigJY=3oXR98RFXQ2tc5bKh75Z+o_CCp6CQ@mail.gmail.com>
From: lei yang <yanglei.fage@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH:V3] vlan: Add vlan recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jun 2013 03:39:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 27, 2013 at 8:38 PM, Joe MacDonald
<Joe.MacDonald@windriver.com>wrote:

> [Re: [oe] [meta-networking][PATCH:V3] vlan: Add vlan recipe] On 13.06.27
> (Thu 12:00) Paul Barker wrote:
>
> > On 27 June 2013 10:51,  <lei.yang@windriver.com> wrote:
> > > From: Lei Yang <lei.yang@windriver.com>
> > >
> > > A 802.1q vlan support program,which can be used by virt-test
> > >
> > > Signed-off-by: Lei Yang <lei.yang@windriver.com>
> >
> > Just took a quick look at this out of interest. What's using the
> > vconfig program once it's installed on the target?
> >
> > vlan-1.9 was released in 2005 and there hasn't been an update since.
> > The ArchWiki suggests that the modern 'ip' command can do what vconfig
> > used to do (https://wiki.archlinux.org/index.php/VLAN).
> >
> > If we can avoid a dependency on such legacy code that would probably
> > be good. Though I may be missing something as I haven't followed all
> > the discussion around this patch and I don't know your use case.
>
> That's a good point.  Seeing something like this hasn't changed since
> 2005 is a little concerning, but frankly I'm not completely shocked when
> I find out some piece of networking infrastructure has stabilized to the
> point where it isn't undergoing much development anymore.  Particularly
> if it's something not everyone uses (and sometimes even if it is:
> http://comments.gmane.org/gmane.linux.network/238858).
>
> That said, I remember vconfig coming up a bit when I was working with
> the CGL workgroup and at the time we'd thought that ip was able to do
> everything vconfig was doing, but we were looking at it in the more
> narrow context of the requirements definition.
>
> So I guess my question is the same, is there even a use-case for vlan
> now that cannot be addressed by existing, already integrated tools?
> Lei?  Your comment is specifically saying "can be used by virt-test",
> does that mean that virt-test (or something else in meta-virtualization)
> requires vconfig to do 802.1q testing or simply that it hasn't been
> ported to use other tools (like ip)?
>
>
Yes, it use vconfig not ip, I can post the log fragment in virt-test


/usr/bin/qemu-kvm -name 'vm2' -nodefaults -vga std -monitor
unix:'/tmp/monitor-humanmonitor1-20120315-015344-Damx',server,nowait
-serial unix:'/tmp/serial-20120315-015344-Damx',server,nowait -device
ich9-usb-uhci1,id=usb1 -drive
file='/root/test.img.qcow2',index=0,if=scsi,cache=none,snapshot=on -device
e1000,netdev=idxcDeLE,mac='9a:18:1b:f3:d1:c6',id='id6KMAxt' -netdev
tap,id=idxcDeLE,fd=22 -m 1024 -smp 2 -device
usb-tablet,id=usb-tablet1,bus=usb1.0 -kernel '/root/kernel.guest.nic'
-nographic  -append 'root=/dev/sda2 rw console=ttyS0,115200 ip=dhcp'
01:53:45 DEBUG| VM appears to be alive with PID 9021
01:53:45 DEBUG| (monitor humanmonitor1) Sending command 'info cpus'
01:53:45 DEBUG| (monitor humanmonitor1) Response to 'info cpus'
01:53:45 DEBUG| (monitor humanmonitor1)    * CPU #0: pc=0x00000000000ca1eb
thread_id=9024
01:53:45 DEBUG| (monitor humanmonitor1)      CPU #1: pc=0x00000000000f6404
(halted) thread_id=9025
01:53:45 DEBUG| Starting screendump thread
01:53:45 DEBUG| Attempting to log into 'vm1' (timeout 360s)
01:53:45 DEBUG| No DHCP lease for MAC 9a:18:1b:f3:76:58
01:54:04 DEBUG| (address cache) DHCP lease OK: 00:15:17:bb:5e:88 -->
128.224.165.205
01:54:21 DEBUG| (address cache) DHCP lease OK: 9a:18:1b:f3:76:58 -->
128.224.165.252
01:54:21 DEBUG| Login command: 'ssh -o UserKnownHostsFile=/dev/null -o
PreferredAuthentications=password -p 22 root@128.224.165.252'
01:54:23 INFO | Logged in
01:54:23 DEBUG| Sending command: ifconfig -a
01:54:23 DEBUG| Sending command: dd if=/dev/urandom of=file bs=1024k
count=10
01:54:24 DEBUG| Sending command: echo $?
01:54:25 DEBUG| Sending command: md5sum file
01:54:25 DEBUG| Sending command: echo $?
01:54:25 DEBUG| Sending command: /etc/init.d/iptables stop
01:54:25 DEBUG| Sending command: modprobe 8021q
01:54:25 DEBUG| Sending command: echo $?
01:54:25 DEBUG| Attempting to log into 'vm2' (timeout 360s)
01:54:25 DEBUG| No DHCP lease for MAC 9a:18:1b:f3:d1:c6
01:54:29 DEBUG| (address cache) DHCP lease OK: 9a:18:1b:f3:d1:c6 -->
128.224.165.247
01:54:29 DEBUG| Login command: 'ssh -o UserKnownHostsFile=/dev/null -o
PreferredAuthentications=password -p 22 root@128.224.165.247'
01:54:31 INFO | Logged in
01:54:31 DEBUG| Sending command: ifconfig -a
01:54:31 DEBUG| Sending command: dd if=/dev/urandom of=file bs=1024k
count=10
01:54:33 DEBUG| Sending command: echo $?
01:54:33 DEBUG| Sending command: md5sum file
01:54:33 DEBUG| Sending command: echo $?
01:54:33 DEBUG| Sending command: /etc/init.d/iptables stop
01:54:33 DEBUG| Sending command: modprobe 8021q
01:54:33 DEBUG| Sending command: echo $?
01:54:34 DEBUG| Sending command: vconfig add eth0 1
01:54:34 DEBUG| Sending command: echo $?
01:54:34 DEBUG| Sending command: ifconfig eth0.1 192.168.1.1
01:54:34 DEBUG| Sending command: echo $?
01:54:34 DEBUG| Sending command: vconfig add eth0 2
01:54:34 DEBUG| Sending command: echo $?
01:54:34 DEBUG| Sending command: ifconfig eth0.2 192.168.2.1
01:54:34 DEBUG| Sending command: echo $?
01:54:34 DEBUG| Sending command: vconfig add eth0 3



> --
> -Joe MacDonald.
> :wq
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


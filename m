Received: from [212.227.126.187] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>)
	id 1KsyXK-0001Vs-1N; Thu, 23 Oct 2008 13:39:30 +0200
Received: from [10.0.0.20] (1Cust206.tnt3.muc2.deu.da.uu.net [149.225.8.206])
	by mrelayeu.kundenserver.de (node=mrelayeu0) with ESMTP (Nemesis)
	id 0MKwh2-1KsyW03Sko-0003sZ; Thu, 23 Oct 2008 13:38:57 +0200
Message-ID: <49006224.40103@linuxdevelopment.de>
Date: Thu, 23 Oct 2008 13:38:12 +0200
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.17 (X11/20080922)
To: openembedded-devel@lists.openembedded.org
References: <48FF2411.1030605@miromico.ch>
In-Reply-To: <48FF2411.1030605@miromico.ch>
X-Provags-ID: V01U2FsdGVkX18VQZxtKL8Gx+VuFTT9N9Dukiguc6H+3z2eMQo
	0b6hQcXCp39h+dldvFGcGo58JqEL6A/BQkGou0KgT5KOUsG0Hp
	klHx0BxMeEGT/21P6T1XWFqxflN0Yl5tEdYoeUqOxo=
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@openembedded.org
Subject: Re: Openembedded for AVR32
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
X-List-Received-Date: Thu, 23 Oct 2008 11:39:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"

   I had similar issues once.
   To me it was the problem that my busybox was not compiled with a
   compatible toolchain then the kernel.
   I used to compile the kernel via atmels but my rootfs was done by oe.
   Atmel by then already used uclibc-0.9.29 where oe was still using
   0.9.28 ..
   Alex Raimondi schrieb:

Hi,

Does OE for AVR32 really work?

I had a working version about two month ago from the monotone repository.

For about three weeks we try to get it running from the latest monotone reposito
ry and after the
transition to git from the latest git.

Just as of this morning I grabbed a fresh new clone from the git repository.

OE does compile (minimal-image). But I can't boot the image.

This is what I found out.

** Kernel **
OE Kernel does boot. We included a newer version (2.6.25.10) into OE with our ow
n patches. This version does boot as well.
Tested on ATNGW100 and our own hardware.

** rootfs **
Rootfs is mounted via NFS. From the server logs I can see, that the filesystem a
ctually is mounted. See the last lines from my bootlog:

------
at32ap700x_rtc at32ap700x_rtc.0: setting system clock to 1970-01-01 00:00:00 UTC
 (0)
Sending DHCP requests ., OK
eth0: link up (10/Half)
IP-Config: Got DHCP answer from 192.168.1.1, my address is 192.168.1.151
IP-Config: Complete:
     device=eth0, addr=192.168.1.151, mask=255.255.255.0, gw=192.168.1.1,
     host=dhcppc1, domain=, nis-domain=(none),
     bootserver=192.168.1.1, rootserver=192.168.1.150, rootpath=
Looking up port of RPC 100003/2 on 192.168.1.150
Looking up port of RPC 100005/1 on 192.168.1.150
VFS: Mounted root (nfs filesystem).
Freeing init memory: 76K (90000000 - 90013000)
init[1]: segfault at 00000008 pc 2aaac620 sp 7f931f40 ecr 24
init has generated signal 11 but has no handler for it
Kernel panic - not syncing: Attempted to kill init!
-------

There is always a signal 11 in init (seg fault).

** init **
We tried different init.
 - OE default sysvinit => segfault
 - Busybox init => segfault
 - No init => kernel tries to load sh => segfault
 - Our own "hello world" app (compiled outside of OE) => segfault

Can anyone confirm that OE for AVR32 does work?
How can we debug and fix this problem?

Thanks

Alex



_______________________________________________
Openembedded-devel mailing list
[1]Openembedded-devel@lists.openembedded.org
[2]http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


   --

   Robert Woerle
   Linux Development
   phone:  +49 (0)821 4442253
   mobile: +49 179 4744527
   email:  [3]robert@linuxdevelopment.de
   web:    [4]http://www.linuxdevelopment.de
   UStNr.

   102/289/51264

   This e-mail message and any files transmitted with it are confidential
   property  and are intended only for the person(s) to whom this e-mail
   is addressed.  If you have received this e-mail message in error,
   please notify the sender immediately by telephone or e-mail and destroy
   the original message without making a copy. Thank you.

References

   1. mailto:Openembedded-devel@lists.openembedded.org
   2. http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
   3. mailto:robert@linuxdevelopment.de
   4. http://www.linuxdevelopment.de/


Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KsgEB-0001ss-Ih
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 18:06:31 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KsgDe-0003Dk-IT
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 16:05:58 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 22 Oct 2008 16:05:58 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Oct 2008 16:05:58 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Oct 2008 18:05:46 +0200
Message-ID: <gdnj0q$ei6$1@ger.gmane.org>
References: <48FF2411.1030605@miromico.ch>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081015 Shredder/3.0b1pre
In-Reply-To: <48FF2411.1030605@miromico.ch>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Wed, 22 Oct 2008 16:06:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-10-2008 15:01, Alex Raimondi wrote:
> Hi,
>
> Does OE for AVR32 really work?

It does work if you use DISTRO=angstrom-2008.1

regards,

Koen

>
> I had a working version about two month ago from the monotone repository.
>
> For about three weeks we try to get it running from the latest monotone repository and after the
> transition to git from the latest git.
>
> Just as of this morning I grabbed a fresh new clone from the git repository.
>
> OE does compile (minimal-image). But I can't boot the image.
>
> This is what I found out.
>
> ** Kernel **
> OE Kernel does boot. We included a newer version (2.6.25.10) into OE with our own patches. This version does boot as well.
> Tested on ATNGW100 and our own hardware.
>
> ** rootfs **
> Rootfs is mounted via NFS. From the server logs I can see, that the filesystem actually is mounted. See the last lines from my bootlog:
>
> ------
> at32ap700x_rtc at32ap700x_rtc.0: setting system clock to 1970-01-01 00:00:00 UTC
>   (0)
> Sending DHCP requests ., OK
> eth0: link up (10/Half)
> IP-Config: Got DHCP answer from 192.168.1.1, my address is 192.168.1.151
> IP-Config: Complete:
>       device=eth0, addr=192.168.1.151, mask=255.255.255.0, gw=192.168.1.1,
>       host=dhcppc1, domain=, nis-domain=(none),
>       bootserver=192.168.1.1, rootserver=192.168.1.150, rootpath=
> Looking up port of RPC 100003/2 on 192.168.1.150
> Looking up port of RPC 100005/1 on 192.168.1.150
> VFS: Mounted root (nfs filesystem).
> Freeing init memory: 76K (90000000 - 90013000)
> init[1]: segfault at 00000008 pc 2aaac620 sp 7f931f40 ecr 24
> init has generated signal 11 but has no handler for it
> Kernel panic - not syncing: Attempted to kill init!
> -------
>
> There is always a signal 11 in init (seg fault).
>
> ** init **
> We tried different init.
>   - OE default sysvinit =>  segfault
>   - Busybox init =>  segfault
>   - No init =>  kernel tries to load sh =>  segfault
>   - Our own "hello world" app (compiled outside of OE) =>  segfault
>
> Can anyone confirm that OE for AVR32 does work?
> How can we debug and fix this problem?
>
> Thanks
>
> Alex





Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LS9AP-0003lW-79
	for openembedded-devel@openembedded.org; Wed, 28 Jan 2009 13:05:13 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LS931-0007YV-IJ
	for openembedded-devel@openembedded.org; Wed, 28 Jan 2009 11:57:35 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 28 Jan 2009 11:57:35 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 28 Jan 2009 11:57:35 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 28 Jan 2009 12:57:23 +0100
Message-ID: <glph74$8js$1@ger.gmane.org>
References: <1233141914-25251-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090118 Shredder/3.0b2pre
In-Reply-To: <1233141914-25251-1-git-send-email-ynezz@true.cz>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] fix missing groups in udevd
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
X-List-Received-Date: Wed, 28 Jan 2009 12:05:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28-01-09 12:25, Petr Štetiar wrote:
> Fix for udevd warning messages when I plug in USB stick:
>
> 	Starting udevudevd[585]: lookup_group: specified group 'scanner' unknown
> 	udevd[585]: lookup_group: specified group 'nvram' unknown
> 	udevd[585]: lookup_user: specified user 'tss' unknown
> 	udevd[585]: lookup_group: specified group 'fuse' unknown
> 	udevd[585]: lookup_group: specified group 'kvm' unknown
> 	udevd[585]: lookup_group: specified group 'rdma' unknown
> 	udevd version 124 started
>
> Signed-off-by: Petr Štetiar<ynezz@true.cz>

Would it make sense to have udev install those groups? If not, your 
patch looks OK, but it's missing a PR bump for udev 124.

regards,

Koen



> ---
>   packages/udev/udev-124/permissions.rules |   20 ++++++++++----------
>   1 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/packages/udev/udev-124/permissions.rules b/packages/udev/udev-124/permissions.rules
> index 205b733..fbc9974 100644
> --- a/packages/udev/udev-124/permissions.rules
> +++ b/packages/udev/udev-124/permissions.rules
> @@ -32,12 +32,12 @@ KERNEL=="nht[0-9]*", 				GROUP="tape"
>   # SCSI devices
>   KERNEL=="sr[0-9]*", IMPORT{program}="cdrom_id --export $tempnode"
>   SUBSYSTEMS=="scsi", ATTRS{type}=="1",				GROUP="tape"
> -SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="HP",	GROUP="scanner"
> -SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="Epson",	GROUP="scanner"
> -SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="EPSON",	GROUP="scanner"
> +SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="HP",	GROUP="plugdev"
> +SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="Epson",	GROUP="plugdev"
> +SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="EPSON",	GROUP="plugdev"
>   SUBSYSTEMS=="scsi", ATTRS{type}=="4",				GROUP="cdrom"
>   SUBSYSTEMS=="scsi", ATTRS{type}=="5",				GROUP="cdrom"
> -SUBSYSTEMS=="scsi", ATTRS{type}=="6",				GROUP="scanner"
> +SUBSYSTEMS=="scsi", ATTRS{type}=="6",				GROUP="plugdev"
>   SUBSYSTEMS=="scsi", ATTRS{type}=="8",				GROUP="tape"
>
>   # USB devices
> @@ -86,10 +86,10 @@ KERNEL=="inotify",		MODE="0666"
>   KERNEL=="sgi_fetchop",		MODE="0666"
>   KERNEL=="sonypi",		MODE="0666"
>   KERNEL=="agpgart",				GROUP="video"
> -KERNEL=="nvram",				GROUP="nvram"
> +KERNEL=="nvram",				GROUP="staff"
>   KERNEL=="rtc|rtc[0-9]*",			GROUP="audio"
> -KERNEL=="tpm*",			MODE="0600",	OWNER="tss", GROUP="tss"
> -KERNEL=="fuse",					GROUP="fuse"
> +KERNEL=="tpm*",			MODE="0600",	OWNER="root", GROUP="staff"
> +KERNEL=="fuse",					GROUP="staff"
>   KERNEL=="kqemu",		MODE="0666"
>   KERNEL=="kvm",					GROUP="kvm"
>   KERNEL=="tun",			MODE="0666",
> @@ -98,9 +98,9 @@ KERNEL=="cdemu[0-9]*",				GROUP="cdrom"
>   KERNEL=="pktcdvd[0-9]*",			GROUP="cdrom"
>   KERNEL=="pktcdvd",		MODE="0644"
>
> -KERNEL=="uverbs*",				GROUP="rdma"
> -KERNEL=="ucm*",					GROUP="rdma"
> -KERNEL=="rdma_ucm",				GROUP="rdma"
> +KERNEL=="uverbs*",				GROUP="staff"
> +KERNEL=="ucm*",					GROUP="staff"
> +KERNEL=="rdma_ucm",				GROUP="staff"
>
>   # printers and parallel devices
>   SUBSYSTEM=="printer",				GROUP="lp"
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





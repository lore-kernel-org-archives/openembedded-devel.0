Return-Path: <tharvey@gateworks.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3561177DE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 15:06:31 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b84so301544538wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 08:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gateworks-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bW3BFq6bumtXyj8D3m6JPxMul8BQDbpmHXU1Oizm0hA=;
	b=ksBSzlBSIOuiUa4voRUb5hTOO626y1zF+A9NnTQAa4kLeKypLYb+x8X69rWhERadUK
	ITGAGMjwPJ495K2tzduxPAg24Wpg8pMPUXEEOhq8FUiSyhyVnklR1UT9VlHLfxGBlRrC
	RSwUXC1jZTlzmB4BazfBbVff2c03bBKwe4JRRQLVum6/BgmiIJF7+jOUByK3YfK6OzAI
	HTIQK5ftiFwxNt/B4szs3pzdIKaoOKJazeqCbAR49m46LAs3dchxpxLwRCUWeqA1JVi6
	AivJCQTd/I5+pFfwcJect4sWzSl7N56uwumt/ZS/9w8U1S8tJRAqasKShL93JWA3s3IG
	Brpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bW3BFq6bumtXyj8D3m6JPxMul8BQDbpmHXU1Oizm0hA=;
	b=H6StosXViWmCF2omzlOwyIbT950iPC3VNrSDwO1mO0XzBZHJP8ptXiJeoOOKTs4+aX
	5RAAEo8wcerW4k2Pav85qAJmkiax2nr/HoviWPXuNqXHCwc4NI+MbOZWqzHRRIFlQRwq
	LEC1+T2TCjnvnRLcQ63Kkq2YczALULh7UNMM0MoKSk+xhLTbOLM6ftpmS9K7VsJ8N4g0
	vxwkbbTKPMyNAb7MaVGhN4SP4Vb0U8/I4z48fprFD0B9iXED1clIr9gTgBnyck9rj+W3
	nzBtoX1zvAKh0KlU2iiq4hsr+zf3Ecw6ghE9fXp5FHIACe0jXao8OlFVn5+1BhMLWs4v
	8J3g==
X-Gm-Message-State: AODbwcBV5exN0iWxyWNBvqrQ6WFfdPcfbdgxucX8rFCQpk1EWW9+DE/8
	01ghzcz33ArCeviYM4Q7SgHyqi9ET4gy
X-Received: by 10.28.196.73 with SMTP id u70mr25158408wmf.73.1495465592160;
	Mon, 22 May 2017 08:06:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.142.206 with HTTP; Mon, 22 May 2017 08:06:31 -0700 (PDT)
In-Reply-To: <CAJ+vNU25j=OtN+vvzO1_kbFOKRYWaaJA-yfKB8pJ8cdxu5fw=g@mail.gmail.com>
References: <CAJ+vNU25j=OtN+vvzO1_kbFOKRYWaaJA-yfKB8pJ8cdxu5fw=g@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 22 May 2017 08:06:31 -0700
Message-ID: <CAJ+vNU3sb8WuKBkb=0qUXi5Uwsq32Qj=A4jPM6yZ=+gyBxvX+g@mail.gmail.com>
To: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>, 
	openembedded-devel@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: kernel modules failing to load because of missing symbols
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
X-List-Received-Date: Mon, 22 May 2017 15:06:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 15, 2017 at 11:00 AM, Tim Harvey <tharvey@gateworks.com> wrote:
> Greetings,
>
> I've got a kernel recipe that builds several kernel modules which get
> build and packaged as kernel-module-<modname>. I'm finding that while
> most of these modules appear to load properly into the kernel at
> runtime, several of them do not because of missing symbols:
>
> # modprobe bluetooth
> [  782.848396] bluetooth: no symbol version for sock_register
> [  782.854315] bluetooth: Unknown symbol sock_register (err -22)
> # modprobe ip_tables
> [  893.675147] ip_tables: no symbol version for ns_capable
> [  893.680385] ip_tables: Unknown symbol ns_capable (err -22)
> modprobe: ERROR: could not insert 'ip_tables': Invalid argument
>
> The symbols do appear to be in the kernel's System.map:
> # grep " ns_capable" /boot/System.map*
> 80033cfc T ns_capable
> # grep sock_register /boot/System.map*
> 805337a8 T sock_register
> 8084fb0c R __ksymtab_sock_register
> 8085ab64 r __kcrctab_sock_register
> 8087abaf r __kstrtab_sock_register
>
> I'm seeing this on Yocto master, Yocto pyro 2.3, Yocto morty 2.2 but
> surprisingly not on Yocto krogoth 2.1.

In case anyone else runs into this I found that the issue was
occurring for a 3.14 kernel built with a GCC 5.4+ toolchain (GCC 5.2
is ok, GCC 5.3 was untested) due to a failure to calculate the CRC for
various modules by the kernel build tool scripts/genksysms. The kernel
build in this case 'will' show warnings such as:

WARNING: "ns_capable" [net/ipv6/netfilter/ip6_tables.ko] has no CRC!
WARNING: "ns_capable" [net/ipv4/netfilter/ip_tables.ko] has no CRC!
WARNING: "sock_register" [net/bluetooth/bluetooth.ko] has no CRC!
WARNING: "inode_add_bytes" [fs/udf/udf.ko] has no CRC!
WARNING: "current_fs_time" [fs/udf/udf.ko] has no CRC!
WARNING: "do_sync_read" [fs/udf/udf.ko] has no CRC!
WARNING: "d_tmpfile" [fs/udf/udf.ko] has no CRC!
WARNING: "vfs_fsync_range" [fs/udf/udf.ko] has no CRC!
WARNING: "in_group_p" [fs/configfs/configfs.ko] has no CRC!
WARNING: "current_fs_time" [fs/binfmt_misc.ko] has no CRC!
WARNING: "sys_close" [fs/binfmt_misc.ko] has no CRC!

The resulting modules with the warnings above will fail to load due to
those missing symbols. The issue is resolved by kernel commit
dc53324060f32 [1] which appears in Linux 3.15 and patches genksyms.

Tim

[1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/genksyms?id=dc53324060f324e8af6867f57bf4891c13c6ef18


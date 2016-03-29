Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5F69A60118
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 14:22:22 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id h6so23754744oia.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 07:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=OFtM3hg9bTNhqDwCftt7QBrvcseuVPKcCvcJn2CCWKU=;
	b=TEz4sP/Bpk3Lmm3rVbxGQcuS6vtUdWMN0Ram26Qy8AMhkoPc3yYO40XiQqsOsG6XFR
	cxrf7kOXMALqbpRZaAet/Ynd8cmuon/fKumFJzjjbf/AvVE+wA3WJHnkhIKBn2qPuV+p
	gSKk/Ccv97XaUl9se1cHjwTkSIL2nsRb8lFp52h6F3KQZ/FzabqNNX/N6+2NoqZFiXES
	WhhabXIaRbGsU5F+LQcobFkFr3fYAb25TJNNiOF6BLBA9JJtn74TMZjSIGowayFWa7NH
	RjRGpSS6ImX0IO73mPlcVsKbZ3zzc8nwZi0t+ca4/jyhlCZPZiKyKUF1Sx57DS1W2aGp
	Hbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=OFtM3hg9bTNhqDwCftt7QBrvcseuVPKcCvcJn2CCWKU=;
	b=lzSWpIImF2FsI6ddIJC7inJqsYxzf0lmQBrvJNI4dc5q/WVb/Jv6QfRuEZvgkHVcnr
	TMCOscpbobvqPGTocKu6CXW1kimSiL+eoM7yseWpeP4T6E1y1CxD/LtDeKTRnHxEKfoa
	3/Am9ZYsBeSU2Y64RqZFU7tllq/mcR9WIsIcgicaQiZRNh3J5G6z1WxaSn68PZUpw7AN
	XjiFQXYBq93ysuHlvkIUenlYkXSOjG09q/GI6vytywqlzcd6WZ7q6aWDxJ+Ghs3P1249
	SDDBl3hscVxRhuT1mG7ZZicTqIHs2LwBwZs0b811VXztk1TG20XLJB1n17S6CLeEAekh
	FGoA==
X-Gm-Message-State: AD7BkJIjJdLFWBc4D9UScD+bjqSMkJ9aXur7x83sosCL3Kl0BucwepK+HOD+VBH/aII/yFLi5f3d1u3B39RhAg==
MIME-Version: 1.0
X-Received: by 10.202.90.3 with SMTP id o3mr1237006oib.96.1459261343428; Tue,
	29 Mar 2016 07:22:23 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 29 Mar 2016 07:22:23 -0700 (PDT)
In-Reply-To: <1459239776-3868-1-git-send-email-rongqing.li@windriver.com>
References: <1459239776-3868-1-git-send-email-rongqing.li@windriver.com>
Date: Tue, 29 Mar 2016 10:22:23 -0400
Message-ID: <CADkTA4PJWOcidD42V9vAHBQLu6QDb3fgKkT7LGiav9zRWeX6uA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-oe] virt-what: add the recipe
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
X-List-Received-Date: Tue, 29 Mar 2016 14:22:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 29, 2016 at 4:22 AM, <rongqing.li@windriver.com> wrote:

> From: Roy Li <rongqing.li@windriver.com>
>
> virt-what is a a shell script which can be used to detect if the program
> is running in a virtual machine.
>

Did you consider meta-virtualization for this ? not a big concern .. just
wondering.

Bruce


>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../recipes-extended/virt-what/virt-what_1.15.bb   | 36
> ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/virt-what/virt-what_1.15.bb
>
> diff --git a/meta-oe/recipes-extended/virt-what/virt-what_1.15.bb
> b/meta-oe/recipes-extended/virt-what/virt-what_1.15.bb
> new file mode 100644
> index 0000000..7509eee
> --- /dev/null
> +++ b/meta-oe/recipes-extended/virt-what/virt-what_1.15.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "Detect if we are running in a virtual machine"
> +DESCRIPTION =" virt-what is a shell script which can be used to detect if
> the program \
> +is running in a virtual machine. \
> +The program prints out a list of "facts" about the virtual machine, \
> +derived from heuristics.  One fact is printed per line. \
> +If nothing is printed and the script exits with code 0 (no error), \
> +then it can mean either that the program is running on bare-metal or \
> +the program is running inside a type of virtual machine which we don't \
> +know about or can't detect. \
> +Current types of virtualization detected: \
> + - hyperv       Microsoft Hyper-V \
> + - kvm          Linux Kernel Virtual Machine (KVM) \
> + - openvz       OpenVZ or Virtuozzo \
> + - powervm_lx86 IBM PowerVM Lx86 Linux/x86 emulator \
> + - qemu         QEMU (unaccelerated) \
> + - uml          User-Mode Linux (UML) \
> + - virtage      Hitachi Virtualization Manager (HVM) Virtage LPAR \
> + - virtualbox   VirtualBox \
> + - virtualpc    Microsoft VirtualPC \
> + - vmware       VMware \
> + - xen          Xen \
> + - xen-dom0     Xen dom0 (privileged domain) \
> + - xen-domU     Xen domU (paravirtualized guest domain) \
> + - xen-hvm      Xen guest fully virtualized (HVM) \
> +"
> +
> +SECTION = "base"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "
> http://people.redhat.com/~rjones/virt-what/files/${PN}-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +SRC_URI[md5sum] = "35d19ca3305e8ae88c1985fbd8388f53"
> +SRC_URI[sha256sum] =
> "7ab9220d4682eadf9139c6afe62d33ebd273fff69e49054279caba5514937c41"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"


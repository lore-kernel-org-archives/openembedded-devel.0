Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sbx6P-0008Lb-UU
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 18:59:30 +0200
Received: by werg55 with SMTP id g55so3736180wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2012 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=fmdy+zvOrRWpJ78uppc6WY+zRrMihbxzdEESx4+ZVkU=;
	b=tpqYG747y+ozrLVD3EvoxCZRGZ9iFHYxATQ/1yiT2PRPbbD/q7Sy9Cjb/oUKdmwLHt
	SpKliIquNfSbDXaF9UQRspxfcX52rgRlPapk75pjsSUtV/7HStNhwYIwyqW6S2FgMsIX
	A2Uh9qyMYC5pavPUGkC20UYwzPmKDmm9XmqNyrgfREmRSFf/HIWRvZNfmWo2QHErBTxS
	0lTairSUGi4TgOVV+zAHhJ6r9+XfNFa08nQBiY2uzg8iHrngJEr90qmDSaPslmsedzMN
	wbGqTHyXoBlp9EWN7gAD/1d57J4bMm/OHrpmOqtfzZ3+l/zz4+3vwc1evscDAWRhjZaB
	V6eA==
Received: by 10.216.215.154 with SMTP id e26mr15150966wep.224.1338914943892;
	Tue, 05 Jun 2012 09:49:03 -0700 (PDT)
Received: from [192.168.1.36] (1.Red-83-60-183.dynamicIP.rima-tde.net.
	[83.60.183.1])
	by mx.google.com with ESMTPS id d10sm7612274wiy.3.2012.06.05.09.49.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jun 2012 09:49:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1sqqHjVhmV-aNR4cba7oih6yyieZksM66HyLvC53KpY+oA@mail.gmail.com>
Date: Tue, 5 Jun 2012 18:49:01 +0200
Message-Id: <0C28CF37-3744-4138-963A-E9553890E21F@gmail.com>
References: <8AB41CD7-C6F0-4CD9-812F-1E804F64BCBB@gmail.com>
	<CAMKF1sqqHjVhmV-aNR4cba7oih6yyieZksM66HyLvC53KpY+oA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1278)
Subject: Re: How to generate vmlinux kernel image
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
X-List-Received-Date: Tue, 05 Jun 2012 16:59:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Jun 5, 2012, at 2:07 AM, Khem Raj wrote:

> On Mon, Jun 4, 2012 at 4:57 PM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:
>>=20
>> KERNEL_IMAGETYPE =3D "uImage vmlinux"
>=20
> remove vmlinux from there

The qemu-system-ppc emulator for Xilinx ML507 doesn't work with uImage. =
It only works with vmlinux at the moment.=20

Is there a way to modify yocto to generate a vmlinux image?=20

If I specify KERNEL_IMAGETYPE=3D"vmlinux" gives the following errors =
during compilation, also giving me a warning that I may need to install =
module-init-tools. Is this necessary to generate a vmlinux image, and if =
so where do I specify it's inclusion?

NOTE: Running task 850 of 856 (ID: 2, =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_install)
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16: =
task do_install: Started
ERROR: Function failed: do_install (see =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.37.1+g=
it1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16/temp/log.do_install.38107=
 for further information)
ERROR: Logfile of failure stored in: =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.37.1+g=
it1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16/temp/log.do_install.38107=

Log data follows:
| DEBUG: Executing shell function do_install
| ERROR: Function failed: do_install (see =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.37.1+g=
it1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16/temp/log.do_install.38107=
 for further information)
| NOTE: make -j 6 DEPMOD=3Decho =
INSTALL_MOD_PATH=3D/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linu=
x-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16/image =
modules_install
|   INSTALL drivers/char/hw_random/rng-core.ko
|   INSTALL fs/nls/nls_ascii.ko
|   INSTALL fs/nls/nls_iso8859-1.ko
|   INSTALL fs/nls/nls_utf8.ko
|   INSTALL net/ipv4/netfilter/ip_tables.ko
|   INSTALL net/ipv4/netfilter/iptable_filter.ko
|   INSTALL net/ipv4/netfilter/iptable_mangle.ko
|   INSTALL net/ipv4/tunnel4.ko
|   INSTALL net/ipv6/ipv6.ko
|   INSTALL net/ipv6/sit.ko
|   INSTALL net/ipv6/xfrm6_mode_beet.ko
|   INSTALL net/ipv6/xfrm6_mode_transport.ko
|   INSTALL net/ipv6/xfrm6_mode_tunnel.ko
|   INSTALL net/netfilter/x_tables.ko
|   INSTALL net/netfilter/xt_tcpudp.ko
|   DEPMOD  3.0.0-14.1-build3
| Warning: you may need to install module-init-tools
| See http://www.codemonkey.org.uk/docs/post-halloween-2.6.txt
| install: cannot stat `arch/powerpc/boot/vmlinux': No such file or =
directory
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16: =
task do_install: Failed
ERROR: Task 2 =
(/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 850 tasks of which 841 didn't need to be =
rerun and 1 failed.

Summary: 1 task failed:
  /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_install
Summary: There were 2 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit =
code.


Best regards,

Elvis Dowson




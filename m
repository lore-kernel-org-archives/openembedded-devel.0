Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SbhJZ-0007df-04
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 02:08:01 +0200
Received: by wibhm14 with SMTP id hm14so2980818wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 16:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=9YsfltVRLXi7ETwZuw7efOadayt7kZfGCahsBXisqQQ=;
	b=yXBcamQM5eyqf/ejLl17h3IgJzKoP4zkdcoRjmPsdIJ5zbB8/U6E/dyulntjKe/64q
	XEjevpuZChTjr4APf9ywSpyIVWjgAq3ZgG8R1JjSzcVukcmNIp7mjl6TeJTb0Rn6CgX+
	Hf5ZIn/BoUxqoLC4ZXzMU509USYLeJxN4W/FqE7hkHWOSJKDqP8MPj3u/lFh0vZLhuxq
	e2xf+xz3DNdCjWK1vwdeefO717IcG3+lFqzK7IHtM6IE2EOiJamlA8LnQ512p2mnHLQr
	Wrd51N6XUfXD259xCz4FsjGyil3/r3DeD89Ne8vhwpiEbAHrnPRIrrJJSW1xG+Byal00
	ropA==
Received: by 10.216.228.29 with SMTP id e29mr12734903weq.153.1338854255737;
	Mon, 04 Jun 2012 16:57:35 -0700 (PDT)
Received: from [192.168.1.36] (1.Red-83-60-183.dynamicIP.rima-tde.net.
	[83.60.183.1])
	by mx.google.com with ESMTPS id j4sm23356538wiz.1.2012.06.04.16.57.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 16:57:34 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Tue, 5 Jun 2012 01:57:32 +0200
Message-Id: <8AB41CD7-C6F0-4CD9-812F-1E804F64BCBB@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: How to generate vmlinux kernel image
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
X-List-Received-Date: Tue, 05 Jun 2012 00:08:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      I added the following two lines to meta-xilinx/conf/virtex5.conf =
to try and get it to build both a uImage an a vmlinux image. The vmlinux =
image is so that I can load the generated kernel into qemuppc emulator. =
I also want to generate the rootfs in ext3 format.

KERNEL_IMAGETYPE =3D "uImage vmlinux"
IMAGE_FSTYPES +=3D "ext3 tar.bz2"

However, when I run bitbake core-image-minimal, I get the following =
errors:

OTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16: =
task do_install: Started
ERROR: Function failed: do_install (see =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.37.1+g=
it1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16/temp/log.do_install.13012=
 for further information)
ERROR: Logfile of failure stored in: =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.37.1+g=
it1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16/temp/log.do_install.13012=

Log data follows:
| DEBUG: Executing shell function do_install
| ERROR: Function failed: do_install (see =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.37.1+g=
it1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16/temp/log.do_install.13012=
 for further information)
| NOTE: make -j 6 DEPMOD=3Decho =
INSTALL_MOD_PATH=3D/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linu=
x-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16/image =
modules_install
|   INSTALL drivers/char/hw_random/rng-core.ko
|   INSTALL fs/nls/nls_iso8859-1.ko
|   INSTALL fs/nls/nls_utf8.ko
|   INSTALL fs/nls/nls_ascii.ko
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
| install: target `vmlinux-3.0.0-14.1-build3' is not a directory
NOTE: package =
linux-xilinx-2.6.37.1+git1+86c81ccd7c8e895904bfff95bd4f87c9615f7fba-r16: =
task do_install: Failed
ERROR: Task 481 =
(/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2266 tasks of which 2260 didn't need to =
be rerun and 1 failed.

Summary: 1 task failed:
  /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_git.bb, =
do_install
Summary: There was 1 ERROR message shown, returning a non-zero exit =
code.


What should I do to get it to generate the vmlinux image and the rootfs =
in ext3 format?

Elvis Dowson=



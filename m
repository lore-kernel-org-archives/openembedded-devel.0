Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mf3Po-0004Dj-Qr
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Aug 2009 05:06:45 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 24D221B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2009 02:53:17 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Aug 2009 04:49:00 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A8FA9A8.5070106@linuxbj.com>
	<200908220913.35169.holger+oe@freyther.de>
	<4A902D29.2020100@linuxbj.com>
In-Reply-To: <4A902D29.2020100@linuxbj.com>
MIME-Version: 1.0
Message-Id: <200908230449.00888.holger+oe@freyther.de>
Subject: Re: [PATCH] added compcache-0.6
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
X-List-Received-Date: Sun, 23 Aug 2009 03:06:45 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 22 August 2009 19:38:49 Ming Chow =E5=91=A8=E6=98=8E wrote:
> 0001-compcache-Add-version-0.5-0.6pre3-and-version-0.6.patch
>   From b09195ba2faa7bbb6becc6314bd7a946187530f8 Mon Sep 17 00:00:00 2001
> From: Ming Zhou <chow.ming@linuxbj.com>
> Date: Sun, 23 Aug 2009 01:14:39 +0800
> Subject: [PATCH] compcache: Add version 0.5+0.6pre3 and version 0.6
>
> * compcache creates RAM based block device (named ramzswap) which acts as
> swap disk. Pages swapped to this disk are compressed and stored in memory
> itself. * Compressing pages and keeping them in RAM virtually increases i=
ts
> capacity. This allows more applications to fit in given amount of memory.=
 *
> added modules_install target in top Makefile to fit the automatically
> modules build process * added KERNELDIR variable to make 2.6 style KBUILD
> system work
> * modified the Makefile for rzscontrol tool to use cross toolchain instead
> of local gcc
>
> Signed-off-by: Ming Zhou <chow.ming@linuxbj.com>

Signed-off-by: Holger Freyther <zecke@selfish.org>

> ---
>  conf/checksums.ini                                 |    7 ++++
>  .../compcache/000-compcache-KERNELDIR.patch        |   34
> ++++++++++++++++++++ .../001-compcache-rzscontrol-cross-compile.patch   |=
 =20
>  9 +++++
>  .../compcache/002-compcache-modules-install.patch  |   13 +++++++
>  .../compcache/003-compcache-0.6-KERNELDIR.patch    |   31
> ++++++++++++++++++ recipes/compcache/compcache_0.5+0.6pre3.bb         | =
=20
> 29 +++++++++++++++++ recipes/compcache/compcache_0.6.bb                 |=
 =20
> 27 +++++++++++++++ 7 files changed, 150 insertions(+), 0 deletions(-)
>  create mode 100644
> recipes/compcache/compcache/000-compcache-KERNELDIR.patch create mode
> 100644
> recipes/compcache/compcache/001-compcache-rzscontrol-cross-compile.patch
> create mode 100644
> recipes/compcache/compcache/002-compcache-modules-install.patch create mo=
de
> 100644 recipes/compcache/compcache/003-compcache-0.6-KERNELDIR.patch crea=
te
> mode 100644 recipes/compcache/compcache_0.5+0.6pre3.bb
>  create mode 100644 recipes/compcache/compcache_0.6.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 85de9c2..3e9915e 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -28650,3 +28650,10 @@
> sha256=3Df57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
> md5=3D5f7b88ebb2bcd7e8044328482d079661
>  sha256=3Df57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
> =20
> +[http://compcache.googlecode.com/files/compcache-0.6pre3.tar.gz]
> +md5=3D532fbc4e6a8ae0670ec15a49484f313f
> +sha256=3D3e54f26665bd1b7ece4e4621a15f82da66a95bafd04286d447be5a596790a7db
> +
> +[http://compcache.googlecode.com/files/compcache-0.6.tar.gz]
> +md5=3D0a574643c0eb857b946adcd5d5a22eb0
> +sha256=3De5f697be6c1b7bfb9ac9ba5b8d836ff20f880c161f998c482caba83caf443c0c
> diff --git a/recipes/compcache/compcache/000-compcache-KERNELDIR.patch
> b/recipes/compcache/compcache/000-compcache-KERNELDIR.patch new file mode
> 100644
> index 0000000..e80f75b
> --- /dev/null
> +++ b/recipes/compcache/compcache/000-compcache-KERNELDIR.patch
> @@ -0,0 +1,34 @@
> +--- compcache-0.6pre3/Makefile.orig    2009-08-14 00:25:45.904934007 +08=
00
> ++++ compcache-0.6pre3/Makefile 2009-08-14 00:25:58.404938574 +0800
> +@@ -1,17 +1,17 @@
> + EXTRA_CFLAGS  :=3D      -DCONFIG_BLK_DEV_RAMZSWAP_STATS \
> +                       -g -Wall
> +
> +-ifndef $(KERNEL_BUILD_PATH)



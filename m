Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1SjhdM-0007jm-KE
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 04:05:32 +0200
Received: by yenl13 with SMTP id l13so532786yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2012 18:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=SryF5ZpfWDhWd8V1srwhx6VXuX0xd6PfXHKSJXF6dTk=;
	b=o6AZkpXG5qn5MUL5LKrhtp5CQ8yop5nA68/HLMl1puu0bYT2w1WgvRcPvVs0j7c7v7
	fcAugst477Iv/TFt9Z0wWwbJWGxHzOdgFqK2n5apOzdJO7l49z2Sdnc9MoDM5BQqWFnK
	FrC9bYkFUMYrv0KX6A/8pFH6IAnl0mBZh6DgXItR6DnfEdonXLV3S/xeZVMK5RqZsE63
	bODusUKf1dYthMwjD4W6u1eNRnhH10JrnBU+eOFfL+EJk7+q2Xe+xPZQCr+tdE+BsALL
	isBlneKmvjTObHxMAJuPu3BgqP9zKp3DNURe2Scqbt6qVuHOtDLEewD3845XImDO6GFg
	+wNg==
MIME-Version: 1.0
Received: by 10.50.168.1 with SMTP id zs1mr107814igb.45.1340762079184; Tue, 26
	Jun 2012 18:54:39 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Tue, 26 Jun 2012 18:54:39 -0700 (PDT)
In-Reply-To: <1340556594-46375-1-git-send-email-elvis.dowson@gmail.com>
References: <1340556594-46375-1-git-send-email-elvis.dowson@gmail.com>
Date: Tue, 26 Jun 2012 20:54:39 -0500
Message-ID: <CAAB-1ywY6+EPp6EK9m0j_cp4MzQ5db+hM3J19-qfP2owNBYUpA@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xilinx] linux-xilinx: Update xilinx linux kernel to v3.3.0.
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
X-List-Received-Date: Wed, 27 Jun 2012 02:05:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Applied.

On Sun, Jun 24, 2012 at 11:49 AM, Elvis Dowson <elvis.dowson@gmail.com> wro=
te:
> * Update xilinx linux kernel to v3.3.0.
> * Update recipe to use SRCREV_pn-${PN} to set the commit id.
> * Refactor recipe and move common definitions to linux-xilinx.inc
> * Bump PR.
>
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
> =A0recipes-kernel/linux/linux-xilinx.inc =A0 =A0| =A0 16 ++++++++++++++++
> =A0recipes-kernel/linux/linux-xilinx_git.bb | =A0 21 +++++++++++---------=
-
> =A02 files changed, 27 insertions(+), 10 deletions(-)
> =A0create mode 100644 recipes-kernel/linux/linux-xilinx.inc
>
> diff --git a/recipes-kernel/linux/linux-xilinx.inc b/recipes-kernel/linux=
/linux-xilinx.inc
> new file mode 100644
> index 0000000..0b92d0e
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-xilinx.inc
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Linux kernel for Xilinx platforms"
> +SECTION =3D "kernel"
> +LICENSE =3D "GPLv2"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
> +
> +PROVIDES +=3D "virtual/kernel"
> +
> +KBRANCH ?=3D "master"
> +
> +# Pick up shared functions
> +require recipes-kernel/linux/linux-dtb.inc
> +
> +S =3D "${WORKDIR}/git"
> +
> +# extra tasks
> diff --git a/recipes-kernel/linux/linux-xilinx_git.bb b/recipes-kernel/li=
nux/linux-xilinx_git.bb
> index 845a1b3..0f53de7 100644
> --- a/recipes-kernel/linux/linux-xilinx_git.bb
> +++ b/recipes-kernel/linux/linux-xilinx_git.bb
> @@ -1,20 +1,21 @@
> =A0inherit kernel xilinx-kernel xilinx-utils
> -require recipes-kernel/linux/linux-dtb.inc
> +require recipes-kernel/linux/linux-xilinx.inc
>
> -DESCRIPTION =3D "Linux kernel for Xilinx platforms"
> -COMPATIBLE_MACHINE =3D "(virtex4|virtex5|virtex5mb|spartan6-sp605|sparta=
n6-lx9mb)"
> +DEFAULT_PREFERENCE =3D "1"
> +
> +KBRANCH =3D "master"
>
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
> +LINUX_VERSION ?=3D "3.3.0"
> +SRCREV_pn-${PN} =3D "ed63a4d76efadcb68f5776e4244766ffea226cc4"
>
> -PR =3D "r16"
> -LINUX_VERSION =3D "2.6.37.1"
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> -SRC_URI =3D "git://git.xilinx.com/linux-xlnx.git;protocol=3Dgit \
> +PR =3D "r17"
> +PV =3D "${LINUX_VERSION}+git-${SRCREV}"
> +
> +SRC_URI =3D "git://git.xilinx.com/linux-xlnx.git;protocol=3Dgit;branch=
=3D${KBRANCH} \
> =A0 =A0 =A0 =A0 =A0 =A0file://defconfig"
>
> =A0XILINX_BOARD ?=3D "${@find_board(bb.data.getVar('XILINX_BSP_PATH', d, =
1), d)}"
> =A0KERNEL_DEVICETREE =3D "${@device_tree(bb.data.getVar('TARGET_ARCH', d,=
 1), d)}"
> =A0KERNEL_DEVICETREE_microblazeel =3D "${@device_tree(bb.data.getVar('TAR=
GET_CPU', d, 1), d)}"
>
> -S =3D "${WORKDIR}/git"
> +COMPATIBLE_MACHINE =3D "(virtex4|virtex5|virtex5mb|spartan6-sp605|sparta=
n6-lx9mb)"
> --
> 1.7.9.5
>



--=20
Saludos
Adrian Alonso
http://aalonso.wordpress.com



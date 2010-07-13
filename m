Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OYYlt-0008Cx-59
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 08:15:14 +0200
Received: by bwz10 with SMTP id 10so3464272bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 23:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=7WfB6N8YUNN+Rk09/mQip67r4yaqC/6q+jD4dJvzLII=;
	b=sQS9r3ePQ/ZiabYMyBiu8yxHAsr3XWMAfnMAgr+QK9EivH0tWcB7KRm1Ib/0ElJHjX
	wTPZX7ANIpuSMSNl3KEexLT9mvAmp2ZJdrh5eI1MKCEeiIKx625hNN7Yg+JkaQ2IOmZg
	xixaj/i9vTq83YtJ8AHmUAsPi2tzBs/eanej0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=e29p5afVQ+KrMalecJGqGbKJ6KzavhlW9VkR2CSPkhxyfXWw5ToKAXRAi0w2/PlcgB
	GAdaRMpeZ9egj9aJpXhC2zBDXrqW5TWqboEaf15JitavtvZlqe5Tma/0qIy/3qNRfTCk
	wqJnbkDwCQXJMjtKvIeZ5IsZVXca7Hn5XO38g=
MIME-Version: 1.0
Received: by 10.204.34.17 with SMTP id j17mr4617581bkd.204.1279001417019; Mon, 
	12 Jul 2010 23:10:17 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Mon, 12 Jul 2010 23:10:16 -0700 (PDT)
In-Reply-To: <1278963950-2587-4-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
	<1278963950-2587-4-git-send-email-aalonso00@gmail.com>
Date: Tue, 13 Jul 2010 08:10:16 +0200
Message-ID: <AANLkTimRc_twFK3AFawjfubj6MTNO0o5zDmO6r8wNUD1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 4/9] xilinx-linux: new kernel recipe
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
X-List-Received-Date: Tue, 13 Jul 2010 06:15:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

The name of the commit message should start with the name of the recipe, so
linux-xilinx, not the other way around as you do here

2010/7/12 Adrian Alonso <aalonso00@gmail.com>

> * Kernel recipe for generic xilinx platforms
> * Inherits xilinx-bsp.bbclass to pass device
>  tree for the final arch
>
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
>  recipes/linux/linux-xilinx_git.bb |   35
> ++++++++++++++++++++++++++++++++++++
>  1 files changed, 35 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/linux/linux-xilinx_git.bb
>
> diff --git a/recipes/linux/linux-xilinx_git.bb b/recipes/linux/
> linux-xilinx_git.bb
> new file mode 100644
> index 0000000..a637c35
> --- /dev/null
> +++ b/recipes/linux/linux-xilinx_git.bb
> @@ -0,0 +1,35 @@
> +require linux.inc
> +
> +DESCRIPTION = "Linux kernel for Xilinx platforms"
> +
> +COMPATIBLE_MACHINE = "xilinx-virtex4|xilinx-virtex5|xilinx-mb-gen"
> +DEFAULT_PREFERENCE = "-1"
> +DEFAULT_PREFERENCE_xilinx-virtex4 = "1"
> +DEFAULT_PREFERENCE_xilinx-virtex5 = "1"
> +DEFAULT_PREFERENCE_xilinx-mb-gen = "1"
> +
> +PV = "2.6.33+git"
> +PR = "r0"
> +
> +SRCREV = "17431547113100a3ae0a622b9f76ad17fb76eb56"
> +SRC_URI = "git://git.xilinx.com/linux-2.6-xlnx.git;protocol=git \
> +           file://xilinxfb.c-update-tft-comp.patch \
> +                  file://defconfig"
> +
> +PV_xilinx-mb-gen = "2.6.34+git"
> +SRCREV_xilinx-mb-gen = "382e23534109197daddbcbcdf5aae75c674638e7"
> +SRC_URI_xilinx-mb-gen = "git://
> developer.petalogix.com/linux-2.6-microblaze.git;protocol=git \
> +                       file://defconfig"
> +
> +inherit kernel xilinx-bsp
> +
> +TARGET_BOARD = "${@map_target(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
> +KERNEL_DEVICETREE_xilinx-virtex4 =
> "arch/${ARCH}/boot/dts/virtex${TARGET_BOARD}.dts"
> +KERNEL_DEVICETREE_xilinx-virtex5 =
> "arch/${ARCH}/boot/dts/virtex${TARGET_BOARD}.dts"
> +KERNEL_DEVICETREE_xilinx-mb-gen =
> "arch/${ARCH}/platform/generic/${TARGET_BOARD}.dts"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure_prepend() {
> +    install -m 0644 ${WORKDIR}/defconfig ${S}/.config
> +}
>
--
> 1.7.1.1
>
> If you change the commit message:

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


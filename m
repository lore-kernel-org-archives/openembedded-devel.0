Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1Sqyeo-0004Q6-9s
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 05:41:06 +0200
Received: by yhjj56 with SMTP id j56so2391518yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 20:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=L1yofHXxZF945/lEY5IZPlibk8O7EU7c/NaSM25z/0o=;
	b=usXq1XXB9I8gQaLXDlQIYBXa5uDlncFjTjjhFjQDngQZFSuTMRGks1KsOHqI2MoLAw
	YtYBNV3IupCIJbG/TqSgBmVVAPzW/ZstLrpSB14m4t9zSiuqsqBrQYex76jPb7dFTywl
	0bM+y+bI0OMEgGE66gSOcuhDVo8BtkAl068P1g/KR341wX9nlHUSiXXURBIknyCZjd51
	WQQ8XbQTDq8/ap9R+bgjyV+dciZF8w9uAeyHXJ+ncrEZz0HzKwdKBT9QzT23QQSfHJmk
	bvyrXagUmtY2EqCN81uPQfwPTBoZPZBffltbTci8u3OqafsE46HgnKadBni+mwCsQqaE
	lXzQ==
MIME-Version: 1.0
Received: by 10.50.149.167 with SMTP id ub7mr141868igb.24.1342495786692; Mon,
	16 Jul 2012 20:29:46 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Mon, 16 Jul 2012 20:29:46 -0700 (PDT)
In-Reply-To: <1342376212-20391-1-git-send-email-elvis.dowson@gmail.com>
References: <1342376212-20391-1-git-send-email-elvis.dowson@gmail.com>
Date: Mon, 16 Jul 2012 22:29:46 -0500
Message-ID: <CAAB-1yyZioxbguGQVfiTxwYTXKfdYH8sM4QZFwygEYHyg_J1+A@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xilinx] xilinx-kernel.bbclass: Fix support for binary device tree generation.
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
X-List-Received-Date: Tue, 17 Jul 2012 03:41:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Applied.

Thanks!

On Sun, Jul 15, 2012 at 1:16 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> This commit fixes support for binary device tree generation, which was
> broken as a result of commit 8c904eb643ad8ca1bc29cb2d870a80b355dcb341
> in oe-core:
>
> linux-dtb: add multi-dtb build support
>     including following enhancement:
>     * support multi-dtb build
>     * skip dtb build and install when KERNEL_DEVICETREE is empty
>     * print a warning message when specified dts file is not available
>
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
>  classes/xilinx-kernel.bbclass |   10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/classes/xilinx-kernel.bbclass b/classes/xilinx-kernel.bbclass
> index 14f4c7d..7c51b3d 100644
> --- a/classes/xilinx-kernel.bbclass
> +++ b/classes/xilinx-kernel.bbclass
> @@ -22,16 +22,14 @@ def device_tree(a, d):
>
>      board = bb.data.getVar('XILINX_BOARD', d, 1)
>      cpu = bb.data.getVar('TARGET_CPU', d, 1)
> -
>      if re.match('powerpc', a):
>          target = cpu + '-' + board
> -        dts = 'arch/' + a + '/boot/dts/virtex' + target + '.dts'
> +        dts = '${S}/arch/' + a + '/boot/dts/virtex' + target + '.dts'
>      else:
>          target = 'system'
> -        dts = 'arch/' + a + '/boot/dts/' + target + '.dts'
> +        dts = '${S}/arch/' + a + '/boot/dts/' + target + '.dts'
>
>      bb.data.setVar('KERNEL_TARGET', target, d)
> -
>      return dts
>
>
> @@ -44,10 +42,10 @@ if [ -n "${XILINX_BSP_PATH}" ]; then
>                 if [ -e "$dts" ]; then
>                         bbnote "Xilinx BSP device tree located in: ${dts}"
>                         if [ "${TARGET_ARCH}" = "powerpc" ]; then
> -                               bbnote "Replacing linux kernel powerpc device tree to match located hardware model"
> +                               bbnote "Replacing linux kernel powerpc device tree to match located hardware model: virtex${KERNEL_TARGET}.dts"
>                                 cp -pP ${dts} ${S}/arch/powerpc/boot/dts/virtex${KERNEL_TARGET}.dts
>                         else
> -                               bbnote "Replacing linux kernel microblaze device tree to match located hardware model"
> +                               bbnote "Replacing linux kernel microblaze device tree to match located hardware model: ${KERNEL_TARGET}.dts"
>                                 cp -pP ${dts} ${S}/arch/microblaze/platform/generic/${KERNEL_TARGET}.dts
>                         fi
>                 else
> --
> 1.7.9.5
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com



Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6259071E4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 22:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3CB6220A40;
	Wed,  1 Nov 2017 22:45:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ukVeMz6WLfVr; Wed,  1 Nov 2017 22:45:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1B920204D6;
	Wed,  1 Nov 2017 22:45:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 958AD162714; Wed,  1 Nov 2017 18:45:36 -0400 (EDT)
Date: Wed, 1 Nov 2017 18:45:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <20171101224536.GI9221@denix.org>
References: <1508957346-6324-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <1508957346-6324-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] whetstone_1.2.bb: Add whetstone benchmark
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
X-List-Received-Date: Wed, 01 Nov 2017 22:45:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 25, 2017 at 11:49:06AM -0700, Manjukumar Matha wrote:
> The Whetstone benchmark is a synthetic benchmark for evaluating the
> performance of computers.
> 
> https://en.wikipedia.org/wiki/Whetstone_(benchmark)
> 
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> 
> diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> new file mode 100644
> index 0000000..e9318eb
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "CPU benchmark to measure floating point performance"

SUMMARY ^^^


> +LICENSE = "PD"
> +LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/PD;md5=b3597d12946881e13cb3b548d1173851"
> +
> +SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
> +SRC_URI[md5sum] = "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
> +SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
> +
> +S = "${WORKDIR}"
> +
> +do_compile () {
> +	${CC} ${CFLAGS} ${LDFLAGS} -Ofast -o whetstone whetstone.c -lm
> +}
> +
> +do_install () {
> +	install -Dm 0755 whetstone ${D}${bindir}/whetstone
> +}
> +
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


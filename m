Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 127AA60069
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 20:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 61D1720AD5;
	Thu, 12 Oct 2017 20:53:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Fpf435AeVEZL; Thu, 12 Oct 2017 20:53:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 361F52006B;
	Thu, 12 Oct 2017 20:53:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C493C1626EC; Thu, 12 Oct 2017 16:53:56 -0400 (EDT)
Date: Thu, 12 Oct 2017 16:53:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: =?iso-8859-1?Q?An=EDbal_Lim=F3n?= <limon.anibal@gmail.com>
Message-ID: <20171012205356.GK9221@denix.org>
References: <20171012125625.3061-1-limon.anibal@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20171012125625.3061-1-limon.anibal@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: =?iso-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linaro.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv2] meta-oe/recipes-test: Add stress-ng recipe
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
X-List-Received-Date: Thu, 12 Oct 2017 20:53:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Oct 12, 2017 at 07:56:25AM -0500, Aníbal Limón wrote:
> From: Aníbal Limón <anibal.limon@linaro.org>
> 
> A tool to generate load and stress a system, currently this recipe
> is on a couple of layers [1] and is not updated, a good reason to
> have in meta-oe.
> 
> [1] https://layers.openembedded.org/layerindex/branch/master/recipes/?q=stress-ng
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>

Thanks for updating and upstreaming it! As the original author of the recipe [2],
you can add my SoB here as well:

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

[2] http://arago-project.org/git/?p=meta-arago.git;a=history;f=meta-arago-extras/recipes-devtools/stress-ng;hb=master


> ---
>  meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> 
> diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> new file mode 100644
> index 000000000..86f577006
> --- /dev/null
> +++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "A tool to load and stress a computer system"
> +HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS = "zlib libaio"
> +
> +SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] = "e0f6497a8c06f5d652bc2ad88d449c12"
> +SRC_URI[sha256sum] = "37cc73e42f5bdb0e0571ba88f6a69b8f05ee28e51afcafc2231c1058b1a5dd18"
> +
> +CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"'"
> +
> +do_install_append() {
> +    install -d ${D}${bindir}
> +    install -m 755 ${S}/stress-ng ${D}${bindir}/stress-ng
> +}
> -- 
> 2.11.0
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


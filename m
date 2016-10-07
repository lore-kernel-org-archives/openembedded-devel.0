Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 0115F719C4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 06:15:18 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1bsOQy-0005z5-5s for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2016 08:15:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 7 Oct 2016 08:10:56 +0200
Message-ID: <nt7e9d$9p0$2@blaine.gmane.org>
References: <1475733541-3401-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.3.0
In-Reply-To: <1475733541-3401-1-git-send-email-mike.looijmans@topic.nl>
Subject: Re: [meta-networking][PATCH v3] phytool: Add recipe
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
X-List-Received-Date: Fri, 07 Oct 2016 06:15:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 06-10-16 om 07:59 schreef Mike Looijmans:
> A nice tool to directly read, write and interpret ethernet PHY data.
> Very useful when debugging PHY or MDIO problems, which ethtool does
> not do.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> v3: Add SRCPV to PV
>     Indent using spaces instead of tab
> v2: Fix LICENSE filename and checksum
>     Honor LDFLAGS value (patch accepted upstream)
>  meta-networking/recipes-support/phytool/phytool.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-networking/recipes-support/phytool/phytool.bb
> 
> diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
> new file mode 100644
> index 0000000..e4391df
> --- /dev/null
> +++ b/meta-networking/recipes-support/phytool/phytool.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "PHY interface tool for Linux"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
> +
> +PV = "1.0.1+git${SRCPV}"
> +SRCREV = "3149bfdb4f513e2f0da0a7d0bc5d0873578696f2"
> +SRC_URI = "git://github.com/wkz/phytool.git"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +    install -d ${D}${prefix}/bin

${D}${bindir}

> +    oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
> +}
> 




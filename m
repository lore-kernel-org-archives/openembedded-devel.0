Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CE27D601F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 09:35:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44493894"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2014 17:31:42 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB49YdN5028099
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Dec 2014 17:34:39 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD01.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6; Thu, 4 Dec 2014
	17:35:09 +0800
Date: Thu, 4 Dec 2014 17:34:52 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: Qian Lei <qianl.fnst@cn.fujitsu.com>
Message-ID: <20141204173452.38275bc0@Fedora>
In-Reply-To: <1417683977-14938-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1417683977-14938-1-git-send-email-qianl.fnst@cn.fujitsu.com>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libjs: Add new recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Dec 2014 09:35:06 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Sorry please IGNORE this patch. I'll send a patch set later.

On Thu, 4 Dec 2014 17:06:17 +0800
Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:

> libjs-jquery:JavaScript library for dynamic web applications
> libjs-sizzle:Pure-JavaScript CSS selector engine
> 
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  .../recipes-support/libjs/libjs-jquery_1.7.1.bb    | 24
> ++++++++++++++++++++++ .../recipes-support/libjs/libjs-sizzle_1.9.3.bb    |
> 21 +++++++++++++++++++ 2 files changed, 45 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery_1.7.1.bb
>  create mode 100644 meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb
> 
> diff --git a/meta-oe/recipes-support/libjs/libjs-jquery_1.7.1.bb
> b/meta-oe/recipes-support/libjs/libjs-jquery_1.7.1.bb new file mode 100644
> index 0000000..ed4a50e
> --- /dev/null
> +++ b/meta-oe/recipes-support/libjs/libjs-jquery_1.7.1.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "javascript lib"
> +LICENSE = "GPLv2+ & MIT"
> +LIC_FILES_CHKSUM =
> "file://usr/share/doc/libjs-jquery/copyright;md5=2b490904c50a58472452b6e9e1c81203"
> + +SRC_URI =
> "http://kr.archive.ubuntu.com/ubuntu/pool/main/j/jquery/${BPN}_${PV}-1ubuntu1_all.deb;subdir=${BP}"
> +SRC_URI[md5sum] = "1ac8a9e4dfe18de22e65baec3dd53f8b" +SRC_URI[sha256sum] =
> "0551e20c88035d80c00b552707573d62ee89e8e5a204d8b427a6020b065e2542" +
> +JQUERYDIR = "${datadir}/javascript/jquery"
> +JQUERYDOCDIR = "${docdir}/libjs-jquery"
> +
> +do_install() {
> +    install -d -m 0755 ${D}${JQUERYDIR}
> +    install -m 0644 ${S}${JQUERYDIR}/jquery.js ${D}${JQUERYDIR}/
> +    install -m 0644 ${S}${JQUERYDIR}/jquery.min.js ${D}${JQUERYDIR}/
> +
> +    ln -sf jquery.min.js ${D}${JQUERYDIR}/jquery.lite.js
> +    ln -sf jquery.min.js ${D}${JQUERYDIR}/jquery.pack.js
> +
> +    install -d -m 0644 ${D}${JQUERYDOCDIR}
> +    install -m 0644 ${S}${JQUERYDOCDIR}/copyright ${D}${JQUERYDOCDIR}/
> +}
> +
> +FILES_${PN} = "/usr/share/javascript/jquery"
> diff --git a/meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb
> b/meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb new file mode 100644
> index 0000000..0c294a8
> --- /dev/null
> +++ b/meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "javascript lib"
> +LICENSE = "GPLv2+ & MIT & BSD-3-Clause"
> +LIC_FILES_CHKSUM =
> "file://usr/share/doc/libjs-sizzle/copyright;md5=9b35efb1635ff8f06d1984376b06ee5a"
> + +SRC_URI =
> "http://kr.archive.ubuntu.com/ubuntu/pool/universe/s/sizzle/${BPN}_${PV}-1_all.deb;subdir=${BP}"
> +SRC_URI[md5sum] = "d88d4ed02a2098e32ba057cc0c2724ba" +SRC_URI[sha256sum] =
> "604029bc97b6e84da7e9eba4cef8e822c80d9255cf3d9e1d0f7d53652b0986aa" +
> +SIZZLEDIR = "${datadir}/javascript/sizzle"
> +SIZZLEDOCDIR = "${docdir}/libjs-sizzle"
> +
> +do_install() {
> +    install -d -m 0755 ${D}${SIZZLEDIR}
> +    install -m 0644 ${S}${SIZZLEDIR}/sizzle.js ${D}${SIZZLEDIR}/
> +    install -m 0644 ${S}${SIZZLEDIR}/sizzle.min.js ${D}${SIZZLEDIR}/
> +
> +    install -d -m 0755 ${D}${SIZZLEDOCDIR}
> +    install -m 0644 ${S}${SIZZLEDOCDIR}/* ${D}${SIZZLEDOCDIR}/
> +}
> +
> +FILES_${PN} = "/usr/share/javascript/sizzle/"



-- 
Qian Lei


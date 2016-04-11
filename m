Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id E3D12607A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 08:59:27 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 1AAF068A019; Mon, 11 Apr 2016 09:59:25 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 9F13F68A019;
	Mon, 11 Apr 2016 09:59:23 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 46B976740102;
	Mon, 11 Apr 2016 10:59:23 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <20160127145110.GH2574@jama>
	<1460363642-2233-1-git-send-email-daicy.fnst@cn.fujitsu.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <570B676B.1080905@mlbassoc.com>
Date: Mon, 11 Apr 2016 10:59:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1460363642-2233-1-git-send-email-daicy.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH] hwdata: add new recipe
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
X-List-Received-Date: Mon, 11 Apr 2016 08:59:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-04-11 10:34, Dai Caiyun wrote:
> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> ---
>   meta-oe/recipes-support/hwdata/hwdata_0.284.bb | 67 ++++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
>   create mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.284.bb
>
> diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.284.bb b/meta-oe/recipes-support/hwdata/hwdata_0.284.bb
> new file mode 100644
> index 0000000..91013b6
> --- /dev/null
> +++ b/meta-oe/recipes-support/hwdata/hwdata_0.284.bb
> @@ -0,0 +1,67 @@
> +DESCRIPTION = "Hardware identification and configuration data"
> +HOMEPAGE = "http://git.fedorahosted.org/git/hwdata.git"
> +SECTION = "System/Base"
> +
> +LICENSE = "GPL-2.0+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
> +SRC_URI = "https://git.fedorahosted.org/cgit/hwdata.git/snapshot/${PN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "30ba61f058d2c2295fd6b3ab575eb5ce"
> +SRC_URI[sha256sum] = "bf08c8e6200467669ffc5919141f7a47cc70756c97b819427e60b6c1a0cdcfa6"
> +
> +inherit autotools-brokensep
> +
> +#PROVIDES by hwdata
> +#the PROVIDES rules is ignore "pciutils-ids"
> +
> +PROVIDES += "pciutils-ids"
> +
> +#PROVIDES by hwdata-ivi
> +PROVIDES += "hwdata-ivi"
> +
> +do_prep() {
> +    cd ${S}
> +    chmod -Rf a+rX,u+w,g-w,o-w ${S}

What's the point of changing permissions like this?

> +}
> +
> +do_patch_append() {
> +    bb.build.exec_func('do_prep',d)
> +}
> +
> +do_compile() {
> +    cd ${S}
> +    LANG=C
> +    export LANG
> +    unset DISPLAY
> +    LD_AS_NEEDED=1; export LD_AS_NEEDED ;
> +    autotools_do_configure

Why isn't this done in do_configure()?

> +}
> +
> +do_install() {
> +    export RPM_BUILD_ROOT=${D}

What's the point of setting RPM_BUILD_ROOT?  That seems like Fedora creep...

> +    cd ${S}
> +    LANG=C
> +    export LANG
> +    unset DISPLAY
> +    rm -rf ${D}
> +    mkdir -p ${D}
> +
> +    oe_runmake \
> +        DESTDIR=${D} \
> +        INSTALL_ROOT=${D} \
> +        BINDIR=${prefix}/bin \
> +        install

The lines below are incorrectly indented
> +        rm -f ${D}${infodir}/dir
> +        find ${D} -regex ".*\.la$" | xargs rm -f --
> +        find ${D} -regex ".*\.a$" | xargs rm -f --
> +        mkdir -p ${D}${sysconfdir}/modprobe.d
> +        mv ${D}${prefix}/lib/modprobe.d/dist-blacklist.conf \
> +        ${D}${sysconfdir}/modprobe.d/blacklist.conf
> +        rm -rf ${D}${prefix}/lib
> +        install -m644 blacklist.conf ${D}/${sysconfdir}/modprobe.d
... until here

> +}
> +
> +RDEPENDS_${PN}-ivi += "hwdata"
> +INSANE_SKIP_${PN}-ivi += "build-deps"
> +
> +PACKAGES = "${PN} ${PN}-dbg ${PN}-doc ${PN}-locale ${PN}-ivi"
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


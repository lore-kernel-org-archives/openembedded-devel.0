Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 316EE6067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 15:00:46 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 6E08E68A01C; Wed, 13 Jul 2016 16:00:47 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id BCEBA68A019;
	Wed, 13 Jul 2016 16:00:46 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 77C346740256;
	Wed, 13 Jul 2016 17:00:46 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1468421827-11561-1-git-send-email-cynthia.ms.chiu@gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5786579E.3080904@mlbassoc.com>
Date: Wed, 13 Jul 2016 17:00:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1468421827-11561-1-git-send-email-cynthia.ms.chiu@gmail.com>
Subject: Re: [meta-oe][PATCH] CANopenNode: recipe for building the CANopenSocket tools
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
X-List-Received-Date: Wed, 13 Jul 2016 15:00:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-13 16:57, cynthiachiu wrote:
> Initial check-in for the CANopenSocket tools recipe.
>
> Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
> ---
>   .../canopennode/canopensocket_git.bb               | 31 ++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/canopennode/canopensocket_git.bb
>
> diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> new file mode 100644
> index 0000000..4506698
> --- /dev/null
> +++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "Linux CANOpen tools"
> +DESCRIPTION = "Linux CANOpen Protocol Stack Tools"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://github.com/CANopenNode/CANopenSocket.git"
> +SRCREV = "${AUTOREV}"

Can't you pick a known, working ${REV}?  Using ${AUTOREV} makes it impossible
to use this recipe disconnected from the internet (yes, that's still a concern
in 2016!)

> +
> +S = "${WORKDIR}/git"
> +
> +do_compile_prepend() {
> +    cd ${S}
> +    git submodule init
> +    git submodule update
> +}
> +
> +do_compile() {
> +    cd ${S}/canopend
> +    make
> +    cd ${S}/canopencomm
> +    make
> +    cd ${S}/canopencgi
> +    make
> +}
> +
> +do_install(){
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/canopend/app/canopend ${D}${bindir}
> +    install -m 0755 ${S}/canopencomm/canopencomm ${D}${bindir}
> +    install -m 0755 ${S}/canopencgi/canopen.cgi ${D}${bindir}
> +}
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


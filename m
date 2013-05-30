Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8B460991
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2013 09:24:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 May 2013 02:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,769,1363158000"; d="scan'208";a="342439395"
Received: from unknown (HELO helios.localnet) ([10.252.121.217])
	by fmsmga001.fm.intel.com with ESMTP; 30 May 2013 02:24:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: lei.yang@windriver.com
Date: Thu, 30 May 2013 10:24:13 +0100
Message-ID: <3725130.cHFgpLoDH1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1369885328-3057-1-git-send-email-lei.yang@windriver.com>
References: <1369885328-3057-1-git-send-email-lei.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, Joe.MacDonald@windriver.com
Subject: Re: [meta-networking][PATCH] vlan: Add vlan recipe
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
X-List-Received-Date: Thu, 30 May 2013 09:24:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Lei,

Some style feedback below.

On Thursday 30 May 2013 11:42:08 lei.yang@windriver.com wrote:
> diff --git a/meta-networking/recipes-support/vlan/vlan_1.9.bb
> b/meta-networking/recipes-support/vlan/vlan_1.9.bb new file mode 100755
> index 0000000..464150c
> --- /dev/null
> +++ b/meta-networking/recipes-support/vlan/vlan_1.9.bb
> @@ -0,0 +1,38 @@
> +DESCRIPTION = "802.1q vlan support program"

Please set SUMMARY instead of DESCRIPTION if you're only setting a short 
description.

> +HOMEPAGE = "http://www.candelatech.com/~greear/"

By the looks of it this should be: 
http://www.candelatech.com/~greear/vlan.html

> +LICENSE         = "GPLv2"
> +SECTION = "console/network"
> +
> +S = "${WORKDIR}/vlan/"
> +
> +SRC_URI = " \
> +	http://www.candelatech.com/~greear/vlan/vlan.${PV}.tar.gz \
> +	file://ip \
> +	file://vlan-pre-up \
> +	file://vlan-post-down \
> +	"
> +
> +CCFLAGS = "-g -D_GNU_SOURCE -Wall -I${STAGING_INCDIR}"
> +LDLIBS = ""
> +
> +do_compile() {
> +	${CC} ${CCFLAGS} -c vconfig.c
> +	${CC} ${CCFLAGS} ${LDFLAGS} -o vconfig vconfig.o ${LDLIBS}
> +}
> +
> +do_install() {
> +	install -d "${D}${sbindir}"
> +	install -m 755 "${S}/vconfig" "${D}${sbindir}/vconfig"
> +	install -d ${D}/${sysconfdir}/network/if-pre-up.d
> +	install -d ${D}/${sysconfdir}/network/if-post-down.d
> +	install -d ${D}/${sysconfdir}/network/if-up.d
> +	install -m 0755 ${WORKDIR}/ip ${D}/${sysconfdir}/network/if-up.d/
> +	install -m 0755 ${WORKDIR}/vlan-pre-up
> ${D}/${sysconfdir}/network/if-pre-up.d/vlan +	install -m 0755
> ${WORKDIR}/vlan-post-down ${D}/${sysconfdir}/network/if-post-down.d/vlan 
> +}
> +
> +
> +SRC_URI[md5sum] = "5f0c6060b33956fb16e11a15467dd394"
> +SRC_URI[sha256sum] =
> "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb4868842b4cca"

Please move these just after SRC_URI.

> +LIC_FILES_CHKSUM =
> "file://macvlan_config.c;beginline=4;endline=62;md5=dc0660d77e4313e8ccdf256
> fbe436a63" +

Please move this towards the top (usually after the first block which includes 
LICENSE).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


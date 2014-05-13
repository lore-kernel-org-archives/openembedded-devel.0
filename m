Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 71C4660196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 14:27:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2014 07:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1044,1389772800"; d="scan'208";a="538288088"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by fmsmga002.fm.intel.com with ESMTP; 13 May 2014 07:27:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mihaela Sendrea <mihaela.sendrea@enea.com>
Date: Tue, 13 May 2014 15:27:52 +0100
Message-ID: <2001321.dggOjr5Niu@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.3-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1399986439-6925-2-git-send-email-mihaela.sendrea@enea.com>
References: <1399986439-6925-1-git-send-email-mihaela.sendrea@enea.com>
	<1399986439-6925-2-git-send-email-mihaela.sendrea@enea.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v4 1/2] lksctp-tools: add recipe (version 1.0.16)
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
X-List-Received-Date: Tue, 13 May 2014 14:28:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mihaela,

On Tuesday 13 May 2014 15:07:18 Mihaela Sendrea wrote:
> This recipe comes from arago-oe-dev:
> https://github.com/mrchapp/arago-oe-dev/tree/master/recipes/lksctp-tools
> 
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> ---
>  .../lksctp-tools/lksctp-tools_1.0.16.bb            | 57
> ++++++++++++++++++++++ 1 file changed, 57 insertions(+)
>  create mode 100644
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> 
> diff --git
> a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb new
> file mode 100644
> index 0000000..2c229c3
> --- /dev/null
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> @@ -0,0 +1,57 @@
> +DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol
> (lksctp) project" 

Could you make this SUMMARY since it's short?


> +SECTION = "libs"
> +LICENSE = "LGPLv2"
> +
> +LIC_FILES_CHKSUM = " \
> +    file://COPYING.lib;md5=0a1b79af951c42a9c8573533fbba9a92 \
> +    file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e \
> +"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] = "708bb0b5a6806ad6e8d13c55b067518e"
> +SRC_URI[sha256sum] =
> "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26" +
> +S = "${WORKDIR}/${BP}"
> +
> +BBCLASSEXTEND = "native"
> +
> +inherit autotools pkgconfig binconfig
> +
> +SOLIBVERSION="${PV}"
> +SOLIBMAJORVERSION="1"
> +
> +PACKAGES =+ "${PN}-withsctp ${PN}-utils"
> +
> +FILES_${PN} = " \
> +    ${libdir}/libsctp.so.${SOLIBVERSION} \
> +"
> +
> +FILES_${PN}-withsctp = " \
> +    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
> +"
> +
> +FILES_${PN}-dev += " \
> +    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
> +    ${libdir}/libsctp.so \
> +    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
> +    ${libdir}/lksctp-tools/libwithsctp.so \
> +    ${datadir}/lksctp-tools/checksctp.c \
> +    ${datadir}/lksctp-tools/sctp_socket.c \
> +    ${datadir}/lksctp-tools/sctp_status.c \
> +    ${datadir}/lksctp-tools/sctp_bind.c \
> +    ${datadir}/lksctp-tools/sctp_darn.c \
> +    ${datadir}/lksctp-tools/sctp_load_libs.c \
> +    ${datadir}/lksctp-tools/sctp_sockopt.c \
> +    ${datadir}/lksctp-tools/sctp_socket.h \
> +    ${datadir}/lksctp-tools/sctp_test.c \
> +    ${datadir}/lksctp-tools/sctp_darn.h \
> +"
> +
> +FILES_${PN}-utils = " \
> +    ${bindir}/sctp_test \
> +    ${bindir}/sctp_darn \
> +    ${bindir}/checksctp \
> +    ${bindir}/withsctp  \
> +    ${bindir}/sctp_status \
> +"

These FILES_ settings seem a little verbose and possibly unnecessary to me - 
are these all needed?

(I realise you've probably borrowed this mostly verbatim from arago-oe-dev but 
we probably ought to ensure it's as tidy as we can make it)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


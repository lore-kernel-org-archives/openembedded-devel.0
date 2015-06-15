Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8D82F6AC43
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 12:53:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2015 05:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,618,1427785200"; d="scan'208";a="508515433"
Received: from sosalmel-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.29.110])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2015 05:53:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Date: Mon, 15 Jun 2015 13:53:06 +0100
Message-ID: <5108170.4M7I4gz10Q@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <1434358336-34981-2-git-send-email-biannm@cn.fujitsu.com>
References: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
	<1434358336-34981-2-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/7] wafsamba: add class
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
X-List-Received-Date: Mon, 15 Jun 2015 12:53:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bian,

On Monday 15 June 2015 16:52:10 Bian Naimeng wrote:
> wafsamba is a build system used by samba related software
> 
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  meta-oe/classes/wafsamba.bbclass | 55
> ++++++++++++++++++++++++++++++++++++++++ 1 file changed, 55 insertions(+)
>  create mode 100644 meta-oe/classes/wafsamba.bbclass
> 
> diff --git a/meta-oe/classes/wafsamba.bbclass
> b/meta-oe/classes/wafsamba.bbclass new file mode 100644
> index 0000000..764b530
> --- /dev/null
> +++ b/meta-oe/classes/wafsamba.bbclass

This should really be named waf-samba.bbclass. I'm also wondering how this 
relates to waf.bbclass that we have in OE-Core - they do look quite different 
though.

> @@ -0,0 +1,55 @@
> +# waf is a build system which is used by samba related project.
> +# Obtain details from https://wiki.samba.org/index.php/Waf
> +#
> +inherit qemu pythonnative
> +
> +DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native
> python" 
> +
> +CONFIGUREOPTS = " --prefix=${prefix} \
> +                  --bindir=${bindir} \
> +                  --sbindir=${sbindir} \
> +                  --libexecdir=${libexecdir} \
> +                  --datadir=${datadir} \
> +                  --sysconfdir=${sysconfdir} \
> +                  --sharedstatedir=${sharedstatedir} \
> +                  --localstatedir=${localstatedir} \
> +                  --libdir=${libdir} \
> +                  --includedir=${includedir} \
> +                  --oldincludedir=${oldincludedir} \
> +                  --infodir=${infodir} \
> +                  --mandir=${mandir} \
> +                "
> +
> +do_configure() {
> +    qemu_binary="${@qemu_target_binary(d)}"
> +    if [ ${qemu_binary} == "qemu-allarch" ]; then
> +        qemu_binary="qemuwrapper"
> +    fi
> +
> +    libdir_qemu="${STAGING_DIR_HOST}/${libdir}"
> +    base_libdir_qemu="${STAGING_DIR_HOST}/${base_libdir}"
> +    oldest_kernel_qemu=${OLDEST_KERNEL}
> +
> +    CROSS_EXEC="${qemu_binary} \
> +                -r ${oldest_kernel_qemu} \
> +                -L ${STAGING_DIR_HOST} \
> +                -E LD_LIBRARY_PATH=${libdir_qemu}:${base_libdir_qemu}"
> +
> +    export BUILD_SYS=${BUILD_SYS}
> +    export HOST_SYS=${HOST_SYS}
> +    export BUILD_ARCH=${BUILD_ARCH}
> +    export HOST_ARCH=${HOST_ARCH}
> +    export STAGING_LIBDIR=${STAGING_LIBDIR}
> +    export STAGING_INCDIR=${STAGING_INCDIR}
> +    export PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
> +
> +    ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile
> --cross-execute="${CROSS_EXEC}" +}
> +
> +do_compile () {
> +    base_do_compile
> +}

Is this do_compile really needed? AFAICT this isn't doing anything because 
base_do_compile will already be being run by way of EXPORT_FUNCTIONS.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


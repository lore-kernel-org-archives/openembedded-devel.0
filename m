Return-Path: <amarnath.valluri@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6A18073116
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:54:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="1133380391"
Received: from irdmzpr05.ir.intel.com (HELO [163.33.54.155]) ([163.33.54.155])
	by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2017 06:54:16 -0800
To: openembedded-devel@lists.openembedded.org
References: <1486559865-23488-1-git-send-email-amarnath.valluri@intel.com>
From: Amarnath Valluri <amarnath.valluri@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <f278bc10-a22d-0db5-4f40-caf37f3ab9f8@intel.com>
Date: Wed, 22 Feb 2017 16:55:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486559865-23488-1-git-send-email-amarnath.valluri@intel.com>
Subject: Re: [meta-filesystem] aufs-utils: Replace install paths with appropriate bitbake environment
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
X-List-Received-Date: Wed, 22 Feb 2017 14:54:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ping - reminder request for feedback

On 08.02.2017 15:17, Amarnath Valluri wrote:
> autf-utils Makefile is using hardcoded /bin, /sbin paths, instead we should
> respect the bitbake environment. This change makes the recipe portable to
> environments where ${base_bindir} != /bin or ${base_sbindir} != /sbin.
>
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>   meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> index 8980980..3d59e50 100644
> --- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> +++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> @@ -18,6 +18,13 @@ PV = "3.14+git${SRCPV}"
>   
>   S = "${WORKDIR}/git"
>   
> +do_configure_prepend() {
> +   # Replace sbin,bin paths with bitbake environment
> +   sed -i -e 's;install_sbin: Tgt = ${DESTDIR}/sbin;install_sbin: Tgt = ${DESTDIR}/${base_sbindir};' \
> +          -e 's;install_ubin: Tgt = ${DESTDIR}/usr/sbin;install_sbin: Tgt = ${DESTDIR}/${bindir};' \
> +	  ${S}/Makefile
> +}
> +
>   do_configure_append () {
>       install -d ${S}/include/linux/
>       cp ${WORKDIR}/aufs_type.h ${S}/include/linux/



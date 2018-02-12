Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 627A871A9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Feb 2018 04:39:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Feb 2018 20:39:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,500,1511856000"; d="scan'208";a="30007490"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.157])
	([10.221.21.157])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2018 20:39:17 -0800
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1518435370-89543-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <57f565b2-d742-2d56-66f9-0af89a7cd76d@intel.com>
Date: Mon, 12 Feb 2018 12:39:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518435370-89543-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH] xrdp: enable cpliboard
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
X-List-Received-Date: Mon, 12 Feb 2018 04:39:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/12/2018 07:36 PM, zhengrq wrote:
> Add --enable-fuse option to enable cpliboard when copying from window OS to linux.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> index 86a8023..d848f1d 100644
> --- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> +++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> @@ -37,7 +37,7 @@ FILES_${PN}-dev += "${libdir}/xrdp/libcommon.so \
>                      ${libdir}/xrdp/libscp.so \
>                      ${libdir}/xrdp/libxrdpapi.so "
>  
> -EXTRA_OECONF = "--enable-pam-config=suse"
> +EXTRA_OECONF = "--enable-pam-config=suse --enable-fuse"

Shouldn't this be done using a PACKAGECONFIG so a DEPENDS is added on
fuse when enabled?

Thanks,
Anuj


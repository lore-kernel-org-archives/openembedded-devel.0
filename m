Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E46B979695
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Nov 2018 06:57:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA56vqLL021668
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Nov 2018 22:57:53 -0800 (PST)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 4 Nov 2018 22:57:52 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <20181105055915.148218-1-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <d6c0751d-d377-f964-0310-3856116bea88@windriver.com>
Date: Mon, 5 Nov 2018 14:56:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181105055915.148218-1-kai.kang@windriver.com>
Subject: Re: [meta-xfce][PATCH] libunique: fix installed-vs-shipped qa issue
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
X-List-Received-Date: Mon, 05 Nov 2018 06:57:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/11/5 下午1:59, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>


Oops. Forgot prefix [meta-xfce] in the title.

--Kai


>
> libunique shows installed-vs-shipped QA issue if configure option
> '--disable-introspection' is set by:
> 1) in gobject-introspection*.bbclass that the 'qemu-usermode' is not
>     supported by bsp and then not set in MACHINE_FEATURES
> or:
> 2) set in local.conf directly:
>     EXTRA_OECONF_append_pn-libunique = " --disable-introspection"
>
> Remove empty directory to fix the QA issue.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb b/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
> index 49ed07ad9..a6475cef6 100644
> --- a/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
> +++ b/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
> @@ -28,3 +28,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>   inherit autotools pkgconfig gobject-introspection distro_features_check gtk-doc
>   
>   REQUIRED_DISTRO_FEATURES = "x11"
> +
> +do_install_append () {
> +    rmdir --ignore-fail-on-non-empty ${D}${datadir}
> +}


-- 
Regards,
Neil | Kai Kang



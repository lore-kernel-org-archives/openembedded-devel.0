Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCE877D2F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 11:12:19 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id u75so22056365qka.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bleKRcvebD6wwh3oNN1iCpla6yJy0zqr9siZ0dhjmD8=;
	b=ah7dYHyZ8Vn2+O+HqSltWlRFbMmumO3SusZqpXj7o+OrY2zE8OZ3M5WL54IwveR0we
	ziEWO9yo7d2vRT0rNj3hX10QnLtxDCmsV5sZzylfS72H1S9SwO/Cx/Lm48ENPvSFmAB4
	5z+Hl1UwaL5Vwm33nuc3DRaOG7SgjzlI6deNrauT/zYYU4naOLdPi80Xu9VdlGDEJcvr
	gM+lLKeL8KQNYlWCsKiZsKrL9t8j5dZ5U0SloPKdzfWfy6ksdiyxokGw1K0y+hMJCOms
	K/pCJ1YAnQxW9wZO6iyxt5BxsjjE+PhktjKtvyUOaQFkEmVPIBEQ/U4ZTzCkBX/L1GE6
	Lt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bleKRcvebD6wwh3oNN1iCpla6yJy0zqr9siZ0dhjmD8=;
	b=QN8sD+mIoxG/ypUUL4Hm/2sySCJToPwy7cyggrerDmJLgMzchrkajcYneVFDZR6RMa
	7f2oqCd3YGa4uWggVCNSsO7HeZHjoUuDw6zQZZD3JxTKkWcfnPPP+eSNiwpeCQIZ+4Fe
	wNNliOWX9/rw8+VO9I1+UGRYajkdPcBLqWXStCXlKtdTwomjHdNRnQCoIBf3CgAyif8A
	1eyvj2fJ8kH3thI9C41jHE2zfmWZEj55Ph5EVgAmfQTKGJpLuywdcFlXtZn6mAlzpQvo
	ktNLLla1/ek+1sLr4KcB7Yhk/+xI7BfTU+l2Wd2AmE4Qih9JTjE1ZYcfgn+HMzp6qz4U
	RCJA==
X-Gm-Message-State: AODbwcBUpVcqy09BgyyWcDGmRskaSaFQPs168o+qG1Ru3AZ6QRSNnY+J
	cE+/4TjztvZ5Wh9zMgyszr5A/7Ydog==
X-Received: by 10.80.173.203 with SMTP id b11mr8525482edd.110.1494933141198;
	Tue, 16 May 2017 04:12:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Tue, 16 May 2017 04:12:20 -0700 (PDT)
In-Reply-To: <1494931796-11721-1-git-send-email-liu.ming50@gmail.com>
References: <1494931796-11721-1-git-send-email-liu.ming50@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 16 May 2017 13:12:20 +0200
Message-ID: <CA+chaQcV9VeDHj5TLFzibJyVNHDLOR7AdW4vM=KR_adAPTs1rw@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] xerces-c: fix a wrong PACKAGECONFIG option
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
X-List-Received-Date: Tue, 16 May 2017 11:12:22 -0000
Content-Type: text/plain; charset="UTF-8"

You should use ${prefix} if there isn't better variable instead of
hardcoding /usr

On Tue, May 16, 2017 at 12:49 PM, <liu.ming50@gmail.com> wrote:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> In xerces-c's configure, these options is being referred as follows:
> ......
>     curl_flags="-I$with_curl/include"
>     curl_libs="-L$with_curl/lib -lcurl"
>
>     icu_flags="-I$with_icu/include"
>     icu_libs="-L$with_icu/lib -licuuc -licudata"
> ......
>
> so they shouldn't be set to ${STAGING_DIR}, use
> ${STAGING_DIR_TARGET}/usr instead.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> index b848b06..3bcedd7 100644
> --- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> +++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> @@ -16,8 +16,8 @@ SRC_URI[sha256sum] = "9408f12c1628ecf80730bedbe8b2ca
> ad810edd01bb4c66f77b60c873e8
>  inherit autotools
>
>  PACKAGECONFIG ??= "curl icu"
> -PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR},--with-curl=no,curl"
> -PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR},--with-icu=no,icu"
> +PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR_
> TARGET}/usr,--with-curl=no,curl"
> +PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR_
> TARGET}/usr,--with-icu=no,icu"
>
>  do_install_prepend () {
>      sed -i -e 's:-L${STAGING_DIR}/lib:-L\$\{libdir\}:g' ${B}/xerces-c.pc
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


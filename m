Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id A94726FF80
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 03:20:55 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id q63so114103534pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 19:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=/TbRjU34e0pmp5Axtb9UeYcGoZl1ykURoNysyYPYHD4=;
	b=QGKDgTTYSgTbECxoH8rZ6OpiHJ2AQ0vZnELBsSFxzmQCIZW5oE+miF/X2j/NFhm0ev
	Jqp2YSyPUtFELcpsVdcKrtlso4yggnsc+zz7pUxCN8Nth7Rw1DYrIRsuTzptC7fdLUq3
	yOho503yVE2D+H3fAbCx3gx0tn+BcHztnx1iQnJnTfRVqeKNmfIVvGJI9xKvd1i3Ts/f
	yydCrTWrOTf8ADvwh0oo+Us+BkfUNxuSdd4BbLn1ZI8OVIBWb1IB0PARbEDxeUsF/fAb
	TAlt3lwVcJ6sezo6AJmCTxefHiNaKBxOF+qdZU/XT6kp6XaQyFGXxiDDvw2+6SJ+sJSt
	ZQ4g==
X-Received: by 10.98.87.69 with SMTP id l66mr17828569pfb.85.1451532056536;
	Wed, 30 Dec 2015 19:20:56 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:b944:f83b:4f68:658c?
	([2601:202:4000:1239:b944:f83b:4f68:658c])
	by smtp.googlemail.com with ESMTPSA id
	v16sm39071795pfa.49.2015.12.30.19.20.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 19:20:55 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1451491343-27865-1-git-send-email-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56849F15.4090003@gmail.com>
Date: Wed, 30 Dec 2015 19:20:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1451491343-27865-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][jethro[master]][meta-networking] netmap-modules: fix build with kernel < 3.17
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
X-List-Received-Date: Thu, 31 Dec 2015 03:20:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

will pull this shortly.

- armin

On 12/30/2015 08:02 AM, Martin Jansa wrote:
> * define NETMAP_LINUX_ALLOC_NETDEV_4ARGS only when MACHINE is using kernel
>   3.17 or newer
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> index 6e6f02c..31fedbb 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -61,7 +61,6 @@ do_configure_append () {
>  #define NETMAP_LINUX_HAVE_PHYS_ADDR_T
>  #define NETMAP_LINUX_HAVE_ACCESS_ONCE
>  #define NETMAP_LINUX_HAVE_NETDEV_OPS
> -#define NETMAP_LINUX_ALLOC_NETDEV_4ARGS
>  #define NETMAP_LINUX_HAVE_INIT_NET
>  #define NETMAP_LINUX_HAVE_LIVE_ADDR_CHANGE
>  #define NETMAP_LINUX_HAVE_TX_SKB_SHARING
> @@ -75,6 +74,13 @@ do_configure_append () {
>  #define NETMAP_LINUX_HAVE_E1000E_EXT_RXDESC
>  #define NETMAP_LINUX_HAVE_E1000E_DOWN2
>  EOF
> +
> +if ${@ 'true' if (bb.utils.vercmp_string(d.getVar('KERNEL_VERSION', True), '3.17') < 0) else 'false' } ; then
> +    echo OK
> +    cat >>  ${S}/LINUX/netmap_linux_config.h <<EOF
> +#define NETMAP_LINUX_ALLOC_NETDEV_4ARGS
> +EOF
> +fi
>  }
>  
>  do_compile () {
> 


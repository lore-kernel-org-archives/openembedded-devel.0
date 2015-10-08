Return-Path: <akuster808@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id EBF2360125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 08:33:24 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so14753492wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 01:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=S6jn68ZaLxNcQ6qH0rz9EyMvu9Z11uAJ+o+RBJ6mha8=;
	b=qN/9Pl17xgl1RX5y5+ipiU6Yy4eNXTZcCpMgQpyxfPnBVSG/98zonrpjjGpgTwbP2f
	n68ZXpM6MKmE3urOYGY+3X520HRdW7NzW+r6IHWLPpNpgm6gYGPlOetrcVlEd33EmdyE
	H6FTxwi1bQ0DMoMuUXvnBQEVV3PL2rE83z1IKpfg+49rtp06x9I1z7k2d7RcjEd+sW+g
	wJLjJiEe2JD7sLUggOUpDAa6aWPUrqE/VpHnoiJsawhh2hUHZQoZ5LUClPoB+J39LsGV
	H4936ZQhhw0ttVcRW2NN/Rn24nnohuRkq9kjKhFlzPEuXKjrWQCsAhqSg9t5I7Ie9+9A
	P72A==
X-Received: by 10.180.87.6 with SMTP id t6mr2358573wiz.20.1444293204584;
	Thu, 08 Oct 2015 01:33:24 -0700 (PDT)
Received: from [10.200.207.200] ([89.101.192.72])
	by smtp.googlemail.com with ESMTPSA id
	jt3sm41471836wjc.12.2015.10.08.01.33.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 01:33:23 -0700 (PDT)
Message-ID: <56162A4A.5090502@gmail.com>
Date: Thu, 08 Oct 2015 01:33:14 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Chen Qi <Qi.Chen@windriver.com>
References: <1444280569-4385-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1444280569-4385-1-git-send-email-Qi.Chen@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] netmap-modules: fix compilation failure
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
X-List-Received-Date: Thu, 08 Oct 2015 08:33:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Chen Qi,


On 10/07/2015 10:02 PM, Chen Qi wrote:
> If CONFIG_IXGBE is enabled in kernel. This package fails to build with
> error messages like below.
> 
> |  #error "unsupported ixgbe driver version"
> |   ^
> 
> .......
> 
> error: request for member 'count' in something not a structure or union
> |   na.num_rx_desc = NM_IXGBE_RX_RING(adapter, 0)->count;
> |                                                ^
> | cc1: some warnings being treated as errors
> 
> Fix this problem by disabling igxbe driver in netmap-modules.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> index f9ac9cc..c1c319d 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -15,6 +15,8 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
>                  --driver-suffix="-netmap" \
>                  "
>  
> +EXTRA_OECONF += "--no-drivers=ixgbe"
> +

Would the following also work?

+PACKAGECONFIG ?= ""
+PACKAGECONFIG[IXGBE] = "--drivers=ixgbe,--no-drivers=ixgbe"

Then we replicate that for the other kernel modules.

- armin

>  LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
>  LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
>  
> 


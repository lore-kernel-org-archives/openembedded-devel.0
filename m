Return-Path: <gary.robertson@linaro.org>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4AA7292F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 21:29:34 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so3079445wiv.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 13:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=3wOxjiCd5IAOBehE8BxlRVun0aMzBrTOw8ZXpbAhRUA=;
	b=CG/wDWPE6Xn/LFhoLJvMIQB3v8Tug59jiYtatpCJlGvjAmkrAaa8KSAi8pFaTifKRY
	QoPjSAUdMTTEedJgH6xZUUdQRvrjJVfP9Dn/oh1rIBmyzXa95LbbfgE3vCRO4g6pDdDb
	i7yjbZU4eSl1FiPvX41O+Z+bBfb+EuBGWfz+mN9duCdOu+4fgnzehQIh/Rb2pDCsnGDI
	z/WopUDlZQqT2G/nnTxjVYxLxF/zV2dXTe2OQHLJ0K6HcYhD2H/7PXwu6LUPpSeMHWbl
	CCy/Z+zzCAIr1SKUHCNgiJM43mQyBoN5X4eOFc+dZ4S6YLIvL84d865+X+N342FntPbE
	qPpg==
X-Gm-Message-State: ALoCoQln/CcsuA9Aik/wm82jihWNx++bPys1zeh6n/S/bUC/48juEPKJ2iypan/748W2lXwFlJl7
MIME-Version: 1.0
X-Received: by 10.180.108.235 with SMTP id hn11mr9355846wib.14.1419024574937; 
	Fri, 19 Dec 2014 13:29:34 -0800 (PST)
Received: by 10.27.39.5 with HTTP; Fri, 19 Dec 2014 13:29:34 -0800 (PST)
In-Reply-To: <1416869955-13519-2-git-send-email-gary.robertson@linaro.org>
References: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
	<1416869955-13519-2-git-send-email-gary.robertson@linaro.org>
Date: Fri, 19 Dec 2014 15:29:34 -0600
Message-ID: <CAF7YWnxoQ22W85xbTfwmyLkQpf=vjwSmpbCvpG1oT-PeGa2GZg@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 1/3] libhugetlbfs: Add ix86 to list of compatible host architectures
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
X-List-Received-Date: Fri, 19 Dec 2014 21:29:41 -0000
Content-Type: text/plain; charset=UTF-8

I am wondering if this patch was overlooked, as I have seen no commentary
regarding it, and the two other patches which accompanied it have been
merged into the meta-oe libhugetlbfs recipe already.
I added explicit arch designators for the typically-used 32-bit intel
architectures so the recipe could be built for those platforms and not just
for 64-bit intel platforms.

Thanks & have a happy holiday season!

Gary Robertson

On Mon, Nov 24, 2014 at 4:59 PM, Gary S. Robertson <
gary.robertson@linaro.org> wrote:
>
> From: "Gary S. Robertson" <gary.robertson@linaro.org>
>
> COMPATIBLE_HOST included support for x86_64 but not for
> 32-bit x86 architectures - added generic 32-bit x86 arch names
>
> Upstream Status - not applicable - recipe change only
>
> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>  .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index c2262ea..737acb9 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -23,7 +23,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
>
>  S = "${WORKDIR}/git"
>
> -COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> +COMPATIBLE_HOST =
> "(i386|i486|i586|i686|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
>
>  LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
>  LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
> --
> 1.7.9.5
>
>


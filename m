Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4DF77262
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Aug 2016 03:25:47 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 50DC568A019; Sat, 13 Aug 2016 04:25:47 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 9097168A019;
	Sat, 13 Aug 2016 04:25:46 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 27F7C67402E7;
	Sat, 13 Aug 2016 05:25:46 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1471006292-2509-1-git-send-email-ricardo.ribalda@gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <b97d7d6b-0353-e5c6-cfd4-9bc025872a45@mlbassoc.com>
Date: Sat, 13 Aug 2016 05:25:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1471006292-2509-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: Re: [meta-oe][PATCH] Graphviz: Add new PACKAGECONFIG for graphviz
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
X-List-Received-Date: Sat, 13 Aug 2016 03:25:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-12 14:51, Ricardo Ribalda Delgado wrote:
> Although it does not have an obvious name (gvc), Graphviz is an
> optional library configurable via configure.ac.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
> index a9f01344a9ff..1b558caf4f16 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
> @@ -24,6 +24,7 @@ EXTRA_OECONF = "--program-prefix= --program-suffix=.im6 --without-perl --disable
>
>  CACHED_CONFIGUREVARS = "ac_cv_sys_file_offset_bits=yes"
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG[graphviz] = "--with-gvc,--without-gvc,graphviz"
>  PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
>  PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
>  PACKAGECONFIG[openjpeg] = "--with-openjp2,--without-openjp2,openjpeg"
>

Your subject line is misleading as this patch is for imagemagick

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


Return-Path: <andrew@aj.id.au>
X-Greylist: delayed 401 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Aug 2018 00:21:16 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 11F8B78FB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 00:21:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2992921F0A;
	Mon, 27 Aug 2018 20:15:25 -0400 (EDT)
Received: from web2 ([10.202.2.212])
	by compute4.internal (MEProxy); Mon, 27 Aug 2018 20:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=I0kkq4D/O7tZLJdxLyIocHuVBDF+I
	RUuRr2z+LMmli0=; b=kwH0mYMCXFlwmMIU6MsVsGRmiRKWI44kJklPnIfSwQg06
	hzOozJgeDAUOgnavRKF+BKtfbQLBMKoGAFPKVFoevuizv4g/GLdWAq+WtAfzcqmG
	sJzO3D8nMTjQISAXBKCk5P7mTvnL55xYiZ3mE3sAtfJHZy+X6QuaXCzQtw5oTKgP
	OhpoJ5nyuVN5bIoyu83Upo5QaxJUTEs9i9I8hOI9ndIpVhxUtwRHeqdzsVGhrrUw
	yOtUiPzSIVbjMV7TlnLxgRZ4+jbIOc3HSVvmj2vU1D4MOE1sVCL8xpYinRoubYMQ
	n7sdEBPkDaNoh/JU9vUYn+rGSb3JwU1UriBMzftcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=I0kkq4
	D/O7tZLJdxLyIocHuVBDF+IRUuRr2z+LMmli0=; b=nNECxJnvjnluIK/N58pmoq
	24yYRZ6IJ3nCIx7CApQCpNXa7IZq1CVPQP08IxNourCJ0pVjJYpik0HXRJOh60N1
	zT/ho0Mw1U4hfsXPGgb0ksQuMDcqeXSl7jO3nbWamVLs46C77J4A6VUKKmpSJAbM
	nlZT4afLlogTGzXQ8H5t36jo1VABQJ9HjpXbnKZyOU4PQ9OIZytNhfo89mEOUAwa
	djyBca3EY2hAdSUq00C4CH/UFY5CSL5d71j6Mmr1LkDZ5ZztYE7VuT3yZ4Wi17WG
	W7qwe6kTgJ8vqp87+G0+pXSQMJqJ4/M4M/E7aLAZ1TsrgAZN9uN7ATJa4pVDz3mQ
	==
X-ME-Proxy: <xmx:HZSEWw2rvFMV0QsVoCgwunncXLB1Bl99Zya77-KPR_DP_AFZku6tJQ>
	<xmx:HZSEW8UD2LqsdQmI1ssjoiRQnDBUMcav-1geZjEAoUM17cZX9FwGig>
	<xmx:HZSEW-NTmD7DVUHBsTripLsydW6a8_QrcBFVZy0s-sESAIZ42Gz8hg>
	<xmx:HZSEW3w7toCCpamPXGeDIAmnYZ_gyqcGwnIMENj3sbNqRuMpnrJaMw>
	<xmx:HZSEWziIgLdiTmpnavxGqqMtyO7CV-gQ4dJ8qtYCF8PX0umH_quHAQ>
	<xmx:HZSEW3wqckemmvwFaXokLiSU85VLll0BF_CRU3tge83MevGvQmhYvg>
X-ME-Sender: <xms:HJSEWxKVuRmZ3SgERycsTsZtQ8MM4qwBWZ1MzOLlKVZA9gq9RW5ZRQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id E1A1862646; Mon, 27 Aug 2018 20:15:24 -0400 (EDT)
Message-Id: <1535415324.1026338.1488127832.527972EB@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-7b72137a
References: <20180824163456.10528-1-raj.khem@gmail.com>
	<20180824163456.10528-2-raj.khem@gmail.com>
In-Reply-To: <20180824163456.10528-2-raj.khem@gmail.com>
Date: Tue, 28 Aug 2018 09:45:24 +0930
Subject: Re: [meta-python][PATCH 2/2] python-pyflame: Use SHA instead of tag in SRC_URI
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
X-List-Received-Date: Tue, 28 Aug 2018 00:21:17 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

On Sat, 25 Aug 2018, at 02:04, Khem Raj wrote:
> tags are floating and bitbake will ping the remote host
> and this will fail in BB_NO_NETWORK cases
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

Thanks Khem!

> ---
>  meta-python/recipes-devtools/python/python-pyflame.inc      | 2 +-
>  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/
> meta-python/recipes-devtools/python/python-pyflame.inc
> index 2ee79f7b8a..71fe769765 100644
> --- a/meta-python/recipes-devtools/python/python-pyflame.inc
> +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
> @@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://${S}/
> LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>  DEPENDS = "python"
>  
> -SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;tag=v${PV}"
> +SRC_URI = "git://github.com/uber/pyflame.git;protocol=https"
>  S = "${WORKDIR}/git"
>  
>  inherit pkgconfig autotools
> diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb 
> b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> index abf3ed7fee..8dedb89286 100644
> --- a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> @@ -1,4 +1,6 @@
>  require python-pyflame.inc
>  
> +# v1.6.6
> +SRCREV = "8a9d8c2acc3b3bb027475b738134f1e6fff14e6c"
>  SRC_URI += 
> "file://0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch"
>  SRC_URI += 
> "file://0001-symbol-Account-for-prelinked-shared-objects.patch"
> -- 
> 2.18.0
> 


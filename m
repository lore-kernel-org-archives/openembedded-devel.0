Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C7E2065D34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 11:30:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jul 2014 04:30:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,763,1400050800"; d="scan'208";a="577636813"
Received: from cfitzsim-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.251])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2014 04:28:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jul 2014 12:28:42 +0100
Message-ID: <2463245.SkJkBSUsEE@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.6-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <364f9086ac0c992f408413d9b2eb78d53d35b19b.1402331046.git.paul.eggleton@linux.intel.com>
References: <cover.1402331046.git.paul.eggleton@linux.intel.com>
	<364f9086ac0c992f408413d9b2eb78d53d35b19b.1402331046.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Cc: Eric Benard <eric@eukrea.com>
Subject: Re: [meta-oe][dylan][PATCH 1/1] x264: fix SRCREV after upstream repository change
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
X-List-Received-Date: Wed, 30 Jul 2014 11:30:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 09 June 2014 17:24:30 Paul Eggleton wrote:
> The upstream x264 project has re-imported all of their old history,
> meaning that all of the hashes have changed. Update SRCREV based on the
> mapping list they have provided at:
> 
>   http://sprunge.us/dGOU
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-multimedia/x264/x264_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb
> b/meta-oe/recipes-multimedia/x264/x264_git.bb index c767ffd..4da24cc 100644
> --- a/meta-oe/recipes-multimedia/x264/x264_git.bb
> +++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
> @@ -11,7 +11,7 @@ DEPENDS = "yasm-native"
>  SRC_URI = "git://git.videolan.org/x264.git \
>      file://don-t-default-to-cortex-a9-with-neon.patch \
>  "
> -SRCREV = "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
> +SRCREV = "bfed708c5358a2b4ef65923fb0683cefa9184e6f"
> 
>  PV = "r2230+git"

ping

-- 

Paul Eggleton
Intel Open Source Technology Centre


Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BF48365D34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 08:58:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jun 2014 01:52:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,463,1400050800"; d="scan'208";a="556223232"
Received: from nithyasr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.63])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2014 01:58:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Eduardo Silva <eduardo@monkey.io>
Date: Thu, 12 Jun 2014 09:58:07 +0100
Message-ID: <3399687.KhPvC9uDaj@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.5-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1402528846-26715-1-git-send-email-eduardo@monkey.io>
References: <1402528846-26715-1-git-send-email-eduardo@monkey.io>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] monkey: fix broken separate build with workaround.
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
X-List-Received-Date: Thu, 12 Jun 2014 08:58:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 June 2014 17:20:46 Eduardo Silva wrote:
> This patch make use of autotools-brokensep on main
> recipe to avoid a broken build when using a different
> build directory.
> 
> monkey-yocto/f15c9e7cd9143ce8486ae5e78db9092238c3d0ec
> 
> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>  meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb index
> 07a202f..6fa1b77 100644
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> @@ -24,7 +24,7 @@ EXTRA_OECONF = " \
>               --malloc-libc \
>  "
> 
> -inherit autotools pkgconfig update-rc.d systemd
> +inherit autotools-brokensep pkgconfig update-rc.d systemd
> 
>  INITSCRIPT_NAME = "monkey"
>  INITSCRIPT_PARAMS = "defaults 70"

Merged, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


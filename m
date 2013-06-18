Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DCCBB6ABDD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 22:40:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jun 2013 15:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,892,1363158000"; d="scan'208";a="355795233"
Received: from unknown (HELO helios.localnet) ([10.252.122.67])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2013 15:40:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Date: Tue, 18 Jun 2013 23:40:41 +0100
Message-ID: <152401983.zdQx05lUsS@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <1371592553-6585-2-git-send-email-Randy.MacLeod@windriver.com>
References: <1371592553-6585-1-git-send-email-Randy.MacLeod@windriver.com>
	<1371592553-6585-2-git-send-email-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] nostromo: make SRC_URI work for multilib builds.
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
X-List-Received-Date: Tue, 18 Jun 2013 22:40:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 18 June 2013 17:55:53 Randy MacLeod wrote:
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
> b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb index
> e66676e..94c32d8 100644
> --- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
> +++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.nazgul.ch/dev_nostromo.html"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://src/nhttpd/main.c;beginline=2;endline=14;md5=e5ec3fa723b29b7d59d205
> afd8d36938"
> 
> -SRC_URI = "http://www.nazgul.ch/dev/${PN}-${PV}.tar.gz \
> +SRC_URI = "http://www.nazgul.ch/dev/${BPN}-${PV}.tar.gz \
>            
> file://0001-GNUmakefile-add-possibility-to-override-variables.patch \
> file://nhttpd.conf \
>             file://volatiles \

Merged, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


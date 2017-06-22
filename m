Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B38666010D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 19:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3B0D020900;
	Thu, 22 Jun 2017 19:18:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2wnkDFWaBwVH; Thu, 22 Jun 2017 19:18:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0876120156;
	Thu, 22 Jun 2017 19:18:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8023116250F; Thu, 22 Jun 2017 15:18:49 -0400 (EDT)
Date: Thu, 22 Jun 2017 15:18:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: liu.ming50@gmail.com
Message-ID: <20170622191849.GS28053@denix.org>
References: <1497932912-30016-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1497932912-30016-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] [PATCH] qttools: DEPENDS on icu
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
X-List-Received-Date: Thu, 22 Jun 2017 19:18:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 20, 2017 at 06:28:32AM +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> This fixes a following QA issue:
> | QA Issue: nativesdk-qtbase-tools rdepends on nativesdk-libicui18n, but it isn't a build dependency.
> | QA Issue: nativesdk-qtbase-tools rdepends on nativesdk-libicuuc, but it isn't a build dependency.
> | QA Issue: nativesdk-qtbase-tools rdepends on nativesdk-libicudata, but it isn't a build dependency.

It seems there's inconsistency here between errors above referring to 
nativesdk-qtbase-tools and the change below made to qttools instead of 
qtbase!

I wonder if this fix was not included by the author:

https://github.com/meta-qt5/meta-qt5/commit/ff073f04109900fc07bf81e2f1df63c626caf342

Just to double-check, I just built nativesdk-qttools using meta-qt5 w/o this 
patch and I don't see the above QA errors.

-- 
Denys


> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  recipes-qt/qt5/qttools_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
> index 5c0f51c..1108390 100644
> --- a/recipes-qt/qt5/qttools_git.bb
> +++ b/recipes-qt/qt5/qttools_git.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
>  
>  inherit ptest
>  
> -DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
> +DEPENDS += "qtbase qtdeclarative qtxmlpatterns icu"
>  
>  SRC_URI += " \
>      file://run-ptest \
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


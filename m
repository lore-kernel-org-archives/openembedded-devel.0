Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 13AE7734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 01:09:14 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTM00ATJ5UZM8V0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	24 Aug 2015 20:08:59 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=XYJHFtupD_QA:10 a=-9mUelKeXuEA:10
	a=kj9zAlcOel0A:10 a=uRRa74qj2VoA:10	a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
	a=0n-u41IBVO5YOREWsX0A:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 12110161BAC; Mon,
	24 Aug 2015 21:08:59 -0400 (EDT)
Date: Mon, 24 Aug 2015 21:08:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20150825010859.GM26375@denix.org>
References: <1440453460-12824-1-git-send-email-raj.khem@gmail.com>
	<1440453460-12824-2-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1440453460-12824-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH 2/2] qtbase: add libinput to depends when wayland is enabled in distro
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
X-List-Received-Date: Tue, 25 Aug 2015 01:09:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

There's a patch for that already, that adds PACKAGECONFIG for libinput...

On Mon, Aug 24, 2015 at 02:57:40PM -0700, Khem Raj wrote:
> Fixes warnings like
> 
> WARNING: QA Issue: qtbase-plugins rdepends on libinput, but it isn't a build dependency? [build-deps]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 7d2d5ec..4e419a9 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -28,6 +28,7 @@ SRC_URI += "\
>  "
>  
>  DEPENDS += "qtbase-native"
> +DEPENDS += "${@base_contains('DISTRO_FEATURES', 'wayland', 'libinput', '', d)}"
>  
>  # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
>  
> -- 
> 2.1.4
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


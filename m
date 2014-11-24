Return-Path: <denis@denix.org>
X-Greylist: delayed 3604 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Nov 2014 20:48:50 UTC
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id DDCB5721FB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 20:48:50 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NFK00IQ770XNBD0@vms173023.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	24 Nov 2014 13:48:34 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=IOK10brD c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=5y4faFyK3SkA:10	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8
	a=KNy8c37G8HSh7NA9ZDoA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6753D20142; Mon,
	24 Nov 2014 14:48:33 -0500 (EST)
Date: Mon, 24 Nov 2014 14:48:33 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20141124194833.GC25432@denix.org>
References: <1415923750-17942-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1415923750-17942-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH 2/2] nativesdk-qtbase_git: re-add OEQt5Toolchain to SRC_URI
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
X-List-Received-Date: Mon, 24 Nov 2014 20:48:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

ping

On Thu, Nov 13, 2014 at 07:09:10PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> The file is expected by do_install(), but _git version resets SRC_URI.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-qt/qt5/nativesdk-qtbase_git.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> index 96d86db..095bee7 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -25,13 +25,18 @@ SRC_URI += "\
>  # common for qtbase-native and nativesdk-qtbase
>  SRC_URI += " \
>      file://0011-Always-build-uic.patch \
> -"    
> +"
>  
>  # specific for nativesdk-qtbase
>  SRC_URI += " \
>      file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
>  "
>  
> +# CMake's toolchain configuration of nativesdk-qtbase
> +SRC_URI += " \
> +    file://OEQt5Toolchain.cmake \
> +"
> +
>  SRCREV = "06e706bdbb826b521389409b53079483fda5584a"
>  
>  LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
> -- 
> 2.1.2
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


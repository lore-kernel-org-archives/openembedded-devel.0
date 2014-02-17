Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 741826EFA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 20:36:45 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1500594QLAZCK0@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	17 Feb 2014 14:36:46 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 44CC8200BE; Mon,
	17 Feb 2014 15:36:46 -0500 (EST)
Date: Mon, 17 Feb 2014 15:36:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140217203646.GT22890@denix.org>
References: <1392667529-4881-1-git-send-email-otavio@ossystems.com.br>
	<1392667529-4881-2-git-send-email-otavio@ossystems.com.br>
MIME-version: 1.0
In-reply-to: <1392667529-4881-2-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH 2/2] nativesdk-qttools.inc: Fix installation and packaging
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
X-List-Received-Date: Mon, 17 Feb 2014 20:36:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 17, 2014 at 05:05:29PM -0300, Otavio Salvador wrote:
> We must to fix the installation paths as did in nativesdk-qtbase.inc
> and remove the files unused from the packages. This fixes the
> packaging errors and allows for a successful build for SDK.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-qt/qt5/nativesdk-qttools.inc |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/recipes-qt/qt5/nativesdk-qttools.inc b/recipes-qt/qt5/nativesdk-qttools.inc
> index e9b2949..494c7b8 100644
> --- a/recipes-qt/qt5/nativesdk-qttools.inc
> +++ b/recipes-qt/qt5/nativesdk-qttools.inc
> @@ -21,5 +21,11 @@ do_configure() {
>  }
>  
>  do_install() {
> +    # Fix install paths for all
> +    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
> +
>      oe_runmake install INSTALL_ROOT=${D}
> +
> +    # remove things unused in nativesdk
> +    rm -rf ${D}${libdir}
>  }
> -- 
> 1.7.10.4
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


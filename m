Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id A9CF96D14A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 17:38:29 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1500JZFIBOATI0@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	17 Feb 2014 11:38:12 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 46EF0200DD; Mon,
	17 Feb 2014 12:38:11 -0500 (EST)
Date: Mon, 17 Feb 2014 12:38:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140217173811.GQ22890@denix.org>
References: <1392411754-10608-1-git-send-email-otavio@ossystems.com.br>
MIME-version: 1.0
In-reply-to: <1392411754-10608-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH 1/2] nativesdk-qtbase: Fix install error in case install task is rerun
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
X-List-Received-Date: Mon, 17 Feb 2014 17:38:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 14, 2014 at 07:02:33PM -0200, Otavio Salvador wrote:
> In case changes are done in do_install and the sstate checksums
> change, the task would fail as the qmake binary has already been
> replaced. Avoid this error checking for the original filename.

BTW, I was working on a different change in this area, which would do the 
qmake swap in ${D} instead of ${B} - that way it would be safe to repeat 
do_install if it fails and it would fix the above issue. Would you rather want 
that change or keep yours?


> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes-qt/qt5/nativesdk-qtbase.inc |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
> index c4ef6e8..36bc334 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase.inc
> +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
> @@ -178,8 +178,10 @@ do_install() {
>      find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
>  
>      # switch back the proper qmake
> -    rm ${B}/bin/qmake
> -    mv ${B}/bin/qmake-real ${B}/bin/qmake
> +    if [ -e ${B}/bin/qmake-real ]; then
> +        rm ${B}/bin/qmake
> +        mv ${B}/bin/qmake-real ${B}/bin/qmake
> +    fi
>  
>      oe_runmake install INSTALL_ROOT=${D}
>  
> -- 
> 1.7.10.4
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


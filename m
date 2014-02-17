Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id C37836D14A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 17:36:48 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N15005VVI8KDJ60@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	17 Feb 2014 11:36:31 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BD2CE200DD; Mon,
	17 Feb 2014 12:36:20 -0500 (EST)
Date: Mon, 17 Feb 2014 12:36:20 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140217173620.GP22890@denix.org>
References: <1392411754-10608-1-git-send-email-otavio@ossystems.com.br>
	<1392411754-10608-2-git-send-email-otavio@ossystems.com.br>
MIME-version: 1.0
In-reply-to: <1392411754-10608-2-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH 2/2] nativesdk-qtbase.inc: Remove unused contents
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
X-List-Received-Date: Mon, 17 Feb 2014 17:36:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 14, 2014 at 07:02:34PM -0200, Otavio Salvador wrote:
> Fixes:
> 
> ERROR: QA Issue: nativesdk-qtbase: Files/directories were installed but not shipped
>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib
>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/include
>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/share
>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Test.so
>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Network.so
>   ...
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-qt/qt5/nativesdk-qtbase.inc |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
> index 36bc334..fe80c9b 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase.inc
> +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
> @@ -188,4 +188,8 @@ do_install() {
>      # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
>      # e.g. qt3d, qtwayland
>      ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
> +
> +    # remove things unused in nativesdk; things are statically link
> +    # and we just use the binaries so drop all unused files
> +    rm -rf ${D}${includedir} ${D}${libdir} ${D}${datadir}/doc
>  }
> -- 
> 1.7.10.4
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


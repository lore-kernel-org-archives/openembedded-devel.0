Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1D96EFA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 20:36:25 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1500GILQKPJZ50@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	17 Feb 2014 14:36:26 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AC0A3200BE; Mon,
	17 Feb 2014 15:36:25 -0500 (EST)
Date: Mon, 17 Feb 2014 15:36:25 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140217203625.GS22890@denix.org>
References: <1392667529-4881-1-git-send-email-otavio@ossystems.com.br>
MIME-version: 1.0
In-reply-to: <1392667529-4881-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH 1/2] qmake5_base.bbclass: Fix mkspec path when building nativesdk binaries
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
X-List-Received-Date: Mon, 17 Feb 2014 20:36:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 17, 2014 at 05:05:28PM -0300, Otavio Salvador wrote:
> When building nativesdk binaries we ought to rely in the native
> mkspecs.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  classes/qmake5_base.bbclass |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 2db0fa3..3861cd0 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -4,6 +4,7 @@ QMAKE_MKSPEC_PATH_TARGET = "${STAGING_LIBDIR}/${QT_DIR_NAME}"
>  
>  QMAKE_MKSPEC_PATH = "${QMAKE_MKSPEC_PATH_TARGET}"
>  QMAKE_MKSPEC_PATH_class-native = "${QMAKE_MKSPEC_PATH_NATIVE}"
> +QMAKE_MKSPEC_PATH_class-nativesdk = "${QMAKE_MKSPEC_PATH_NATIVE}"
>  
>  # hardcode linux, because that's what 0001-Add-linux-oe-g-platform.patch adds
>  OE_QMAKE_PLATFORM_NATIVE = "linux-oe-g++"
> -- 
> 1.7.10.4
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


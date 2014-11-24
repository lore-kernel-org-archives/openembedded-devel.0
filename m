Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id A3CCA721DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 19:48:39 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NFK00LFU70OFN30@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	24 Nov 2014 13:48:25 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=AKpDk7pY c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=5y4faFyK3SkA:10	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8
	a=rjmyWzBVj7d95bg6fFkA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1DD6220142; Mon,
	24 Nov 2014 14:48:23 -0500 (EST)
Date: Mon, 24 Nov 2014 14:48:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20141124194823.GB25432@denix.org>
References: <1415923119-4861-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1415923119-4861-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH 1/2] nativesdk-qtbase.inc: avoid removing directories, namely /usr/lib itself
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
X-List-Received-Date: Mon, 24 Nov 2014 19:48:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

ping

On Thu, Nov 13, 2014 at 06:58:38PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-qt/qt5/nativesdk-qtbase.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
> index 6f1f880..06fb049 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase.inc
> +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
> @@ -230,7 +230,7 @@ do_install() {
>             ${D}/${OE_QMAKE_PATH_PLUGINS} \
>             ${D}${libdir}/cmake \
>             ${D}${libdir}/pkgconfig
> -    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and \
> +    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and -not -type d \
>                                     -not -name 'libQt5Core.so*' -and \
>                                     ${QTLIBSPRESERVE} \
>                                     -not -name 'libQt5Bootstrap.a' \
> -- 
> 2.1.2
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


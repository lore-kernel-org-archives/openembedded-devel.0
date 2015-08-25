Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id E8D9F60043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 03:05:49 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTM005BPB9O4N91@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	24 Aug 2015 22:05:49 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=XYJHFtupD_QA:10 a=-9mUelKeXuEA:10
	a=kj9zAlcOel0A:10 a=uRRa74qj2VoA:10	a=pGLkceISAAAA:8 a=sozttTNsAAAA:8
	a=Q4-j1AaZAAAA:8 a=J4SYXeZqyihcYp17n6YA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C2195161BAC; Mon,
	24 Aug 2015 23:05:48 -0400 (EDT)
Date: Mon, 24 Aug 2015 23:05:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20150825030548.GN26375@denix.org>
References: <1440453460-12824-1-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1440453460-12824-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH 1/2] qtbase: Package the 3rd party libs if built
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
X-List-Received-Date: Tue, 25 Aug 2015 03:05:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 24, 2015 at 02:57:39PM -0700, Khem Raj wrote:
> Third-party libs e.g. libqtfreetype when built is not packaged and hence
> goes missing in sysroot, then rest of qt components like qtwayland gets
> its configuration from qtbase to enable it but then does not find the
> internal version of libqtfreetype.a which is what qtbase directs it to
> use and as a result it starts throwing linking errors e.g.
> 
> x86_64-angstrom-linux-ld.gold: error: cannot find -lqtfreetype
> 
> This patch installs the needed libs into dev packages
> 
> Remove a trailing whitespace as well while at it.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Tested-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-qt/qt5/qtbase_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 5603fb2..7d2d5ec 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -227,9 +227,9 @@ do_install_append() {
>          cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_LIBS}/fonts
>          chown -R root:root ${D}/${OE_QMAKE_PATH_LIBS}/fonts
>      fi
> -
> +    cp -a ${B}/lib/libqt* ${D}${libdir}
>      # Remove example.pro file as it is useless
> -    rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
> +    rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
>  
>      # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/macx-ios-clang/rename_main.sh:#!/bin/bash
>      # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> -- 
> 2.1.4
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


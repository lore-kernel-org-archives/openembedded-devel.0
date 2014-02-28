Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id ED09C6F490
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 21:27:59 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BE762F811E5; Fri, 28 Feb 2014 14:28:00 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 6B81FF811DF;
	Fri, 28 Feb 2014 14:27:57 -0700 (MST)
Message-ID: <5310FF64.4050804@mlbassoc.com>
Date: Fri, 28 Feb 2014 14:28:04 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1393618507-29414-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1393618507-29414-1-git-send-email-obi@opendreambox.org>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-qt5][PATCH 1/3] qtbase/qtwebkit: drop ICU variable
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
X-List-Received-Date: Fri, 28 Feb 2014 21:28:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2014-02-28 13:15, Andreas Oberritter wrote:
> Pango doesn't seem to be a drop-in replacement for ICU, so
> using it as a dependency for the -icu option won't work.
> 
> QtWebKit has a hard dependency on icu.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

So, does this make QT5 a no-go for PowerPC or any other BigEndian
platform?  Or is there another solution for ICU on PowerPC, etc?

> ---
>  recipes-qt/qt5/qt5.inc      | 4 ----
>  recipes-qt/qt5/qtbase.inc   | 2 +-
>  recipes-qt/qt5/qtwebkit.inc | 2 +-
>  3 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index e2a1662..dfc1c76 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -3,10 +3,6 @@
>  
>  inherit qmake5
>  
> -# Qt5 is dependent on icu for localization
> -ICU = "icu "
> -ICU_powerpc = "pango"
> -
>  PACKAGECONFIG_OPENSSL ?= "openssl"
>  
>  QT_MODULE ?= "${BPN}"
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 378f229..4fe6bd5 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -116,7 +116,7 @@ PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
>  PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
>  PACKAGECONFIG[kms] = "-kms,-no-kms,kms"
>  # needed for qtdeclarative (qtdeclarative.do_configure fails to find quick module without)
> -PACKAGECONFIG[icu] = "-icu,-no-icu,${ICU}"
> +PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
>  PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
>  # use -openssl-linked here to ensure that RDEPENDS for libcrypto and libssl are detected
>  PACKAGECONFIG[openssl] = "-openssl-linked,-no-openssl,openssl"
> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
> index aea9dad..c35504e 100644
> --- a/recipes-qt/qt5/qtwebkit.inc
> +++ b/recipes-qt/qt5/qtwebkit.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
>                      file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
>                      file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
>  
> -DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
> +DEPENDS += "qtdeclarative qtlocation qtsensors icu ruby-native sqlite3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
>  
>  # qtwebkit gets terribly big when linking with all debug info, disable by default
>  QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
> 

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


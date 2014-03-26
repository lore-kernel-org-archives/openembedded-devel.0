Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 768846E835
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id BD155314AC89
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:14:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id YZRd9QwA1Liv
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:14:56 +0100 (CET)
Received: from [172.22.22.61] (55d449bf.access.ecotel.net [85.212.73.191])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BBF69314AC88
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:14:56 +0100 (CET)
Message-ID: <5332E0E0.1070206@opendreambox.org>
Date: Wed, 26 Mar 2014 15:14:56 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1395841995-26907-1-git-send-email-net147@gmail.com>
In-Reply-To: <1395841995-26907-1-git-send-email-net147@gmail.com>
Subject: Re: [meta-qt5][PATCH] qtwebkit: add missing qtmultimedia DEPENDS
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
X-List-Received-Date: Wed, 26 Mar 2014 14:14:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Jonathan,

On 26.03.2014 14:53, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  recipes-qt/qt5/qtwebkit.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
> index 90bd981..536fade 100644
> --- a/recipes-qt/qt5/qtwebkit.inc
> +++ b/recipes-qt/qt5/qtwebkit.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
>                      file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
>                      file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
>  
> -DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
> +DEPENDS += "qtbase qtdeclarative qtmultimedia icu ruby-native sqlite3 glib-2.0 libxslt"
>  
>  PACKAGECONFIG ??= "gstreamer qtlocation qtsensors"
>  PACKAGECONFIG[gstreamer] = ",,gstreamer1.0 gstreamer1.0-plugins-base"

qtwebkit builds fine without qtmultimedia. If it gets autodetected,
please make it optional.

Regards,
Andreas


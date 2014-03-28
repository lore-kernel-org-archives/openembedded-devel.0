Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 439986E951
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 06:15:59 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id lx4so4584028iec.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 23:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=BU+Yw1pf/L7V8E4xFvEzBQDvWQghwmzCXc0HI82yyVs=;
	b=HursEeEhMvc6czk9b1Pcysbk9gTe8n/MPHw/YQ5dK9ktIHdYh6dzjMzQJ7jiCw0nS4
	/ZEjeTd66INyI7nd0g6OrETAWBc6uYMq88qMFZMnyn6szV+C1vU0Quw0Bvf1fhpDV4Z3
	uPi8DaRu36L+yIu9hFF1yqNPveSH8DUxYHX+Nle10pwWs1kIHuRiOVFA0fHvb87n7sXX
	8M6yq4+Nsi+AIDnVDTFzhJc+1Sr5aNG+rqTGJZqft0XdZvk7Cpt2mt/nQDK64F6arsX4
	BiPAvgOuplNZVqjFK4MmiM9q6EBN/llfqmjz4Nxk4hqhVaa2NiU8eeNqC4F2KvLrIpv6
	Kzfw==
MIME-Version: 1.0
X-Received: by 10.42.82.148 with SMTP id d20mr106488icl.50.1395987360175; Thu,
	27 Mar 2014 23:16:00 -0700 (PDT)
Received: by 10.65.15.73 with HTTP; Thu, 27 Mar 2014 23:16:00 -0700 (PDT)
In-Reply-To: <1393618507-29414-3-git-send-email-obi@opendreambox.org>
References: <1393618507-29414-1-git-send-email-obi@opendreambox.org>
	<1393618507-29414-3-git-send-email-obi@opendreambox.org>
Date: Thu, 27 Mar 2014 23:16:00 -0700
Message-ID: <CAJ86T=VCOWmE-eyYvpKLjfYhgyFSn0URjo_9yu7V9OGoUUD8aA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH 3/3] qtwebkit: add packageconfig for gstreamer, qtlocation and qtsensors
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
X-List-Received-Date: Fri, 28 Mar 2014 06:16:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 28, 2014 at 12:15 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> Use gstreamer for 1.x, gstreamer010 for 0.10.x.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  recipes-qt/qt5/qtwebkit.inc | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
> index c35504e..90bd981 100644
> --- a/recipes-qt/qt5/qtwebkit.inc
> +++ b/recipes-qt/qt5/qtwebkit.inc
> @@ -5,7 +5,29 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
>                      file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
>                      file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
>
> -DEPENDS += "qtdeclarative qtlocation qtsensors icu ruby-native sqlite3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
> +DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
> +
> +PACKAGECONFIG ??= "gstreamer qtlocation qtsensors"
> +PACKAGECONFIG[gstreamer] = ",,gstreamer1.0 gstreamer1.0-plugins-base"
> +PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
> +PACKAGECONFIG[qtlocation] = ",,qtlocation"
> +PACKAGECONFIG[qtsensors] = ",,qtsensors"
> +
> +do_configure_prepend() {
> +    # disable gstreamer-1.0 test if it isn't enabled by PACKAGECONFIG
> +    sed -e 's/\s\(packagesExist(".*\<gstreamer-1.0\>.*")\)/ OE_GSTREAMER_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
> +    # disable gstreamer-0.10 test if it isn't enabled by PACKAGECONFIG
> +    sed -e 's/\s\(packagesExist(".*\<gstreamer-0.10\>.*")\)/ OE_GSTREAMER010_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
> +    # disable qtlocation test if it isn't enabled by PACKAGECONFIG
> +    sed -e 's/\s\(qtHaveModule(positioning)\)/ OE_QTLOCATION_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
> +    # disable qtsensors test if it isn't enabled by PACKAGECONFIG
> +    sed -e 's/\s\(qtHaveModule(sensors)\)/ OE_QTSENSORS_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
> +}
> +
> +EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer', 'CONFIG+=OE_GSTREAMER_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFIG+=OE_GSTREAMER010_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtlocation', 'CONFIG+=OE_QTLOCATION_ENABLED', '', d)}"
> +EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtsensors', 'CONFIG+=OE_QTSENSORS_ENABLED', '', d)}"
>
>  # qtwebkit gets terribly big when linking with all debug info, disable by default
>  QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
> --
> 1.8.3.2
>

Hi,

With this change I'm seeing that the CONFIG+= options from the qmake
command line are being added to CONFIG after features.prf has already
been evaluated. Therefore OE_GSTREAMER_ENABLED etc evaluates as false
and qtwebkit is always configured without video support.

From the configure log:

> ! Missing GStreamer or QtMultimedia, disabling HTML5 media element support

From the qmake debug log:

> DEBUG 1: ... features.prf:106: condition "OE_GSTREAMER_ENABLED" is false (around line 5480 of the log)
> ...
> DEBUG 1: (command line):65535: CONFIG := ... OE_GSTREAMER_ENABLED (around line 5802 of the log, just prior to starting on WebKit.pro).

I'm testing with dora + master branch of meta-qt5.

Andre
--


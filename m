Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 79EB960D68
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 10:22:47 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id k1so452159oag.35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2014 02:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=QtylrwZdQMU5b8iiSKKUgQ43vsZ2RMCnIW0wzCIry5A=;
	b=QKwfaXfPNw1ZnNBK9Cq1ZA8iMGCcLDbv6MmlpcVYavvvwaj/SNXhr6XkjtjFJT1N1r
	COlXDNuyX7fk8lUoaPl5NQhzI3fKtSLePw7ZoyYx0euyiGtyr+0rC7DdbRQVhRGSZG9g
	Pc4fCLp+ci4BuNHdIjO+fqpeVcT35jmD/gxdW7GBMMpGDX1lbkPaIUO9xR90MdcQLYzt
	OxegTg0iZEGPD2LCJaoctqfiz7DZrbfLldsA0V00/3k+slhdiE1GOuqux+8yTcbFVFWY
	A6y1w6UTCJwk2T9LQdAeNRdmW31lYOOKKJtxCCRZLbijl5oXOGVw2L26CXlO4MGSR0M+
	vrOg==
X-Gm-Message-State: ALoCoQnMwp+fqqXTx0CzytYYx0sqjsR+x+H/8yadbEFrPGegYGWxGkmjoCdnS50c8Juet7zk2Bn9
X-Received: by 10.182.204.41 with SMTP id kv9mr144315obc.78.1389003768017;
	Mon, 06 Jan 2014 02:22:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.89.143 with HTTP; Mon, 6 Jan 2014 02:22:27 -0800 (PST)
In-Reply-To: <1388489871-14502-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388489871-14502-1-git-send-email-Martin.Jansa@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 6 Jan 2014 11:22:27 +0100
Message-ID: <CAP71Wjwq17ZZ9K_tWPBEq3A3rOPe4HmCfhOEKHfgy_0pVzmpUg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] qtwebkit: Depend on gstreamer-1.0 instead of 0.10
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
X-List-Received-Date: Mon, 06 Jan 2014 10:22:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 31, 2013 at 12:37 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> * since this commit:
>   commit e0debe138cb59c140ebbc69755d36028d2b89459
>   Author: Allan Sandfeld Jensen <allan.jensen@digia.com>
>   Date:   Thu Feb 28 13:42:27 2013 +0100
>   Subject: Switch QtWebKit to GStreamer 1.0.
>
>   qtwebkit supports 1.0 and will use that by default when found
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-qt/qt5/qtwebkit.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
> index c0e0648..9b334ae 100644
> --- a/recipes-qt/qt5/qtwebkit.inc
> +++ b/recipes-qt/qt5/qtwebkit.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =
> "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
>
>  file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351
> \
>
>  file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=b57c8a2952a8d0e655988fa0ecb2bf7f"
>
> -DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3
> glib-2.0 gstreamer gst-plugins-base libxslt"
> +DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3
> glib-2.0 gstreamer-1.0 gst-plugins-base-1.0 libxslt"
>
>  # qtwebkit gets terribly big when linking with all debug info, disable by
> default
>  QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
>

hmm. that's a bit rough... GST1.0 for ARM SoC is (sadly) still not the
norm.. I haven't checked upstream, but does it still support 0.10 or 1.0 or
only 1.0? If both are supported could (should?) we use PACKAGECONFIG to
offer both in our recipe?

right now i am using the dora branch and qt5.1.1 which hasn't been updated
for a while, which is fine.

thanks


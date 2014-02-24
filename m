Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5496B6FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:19:06 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id e16so5830186lan.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=aJEYV2bYMmq5rvOChK59YhtZTi+HT4nA+k5353uyEjg=;
	b=R8NMeWG4dMptPEetrHNgXTyA8KJb+MyEr2shUffVQR0ihInEHMNXoo4WtUlJUpw5y1
	bm+qNLwdZbVZ26Y94rbJZoNDPJZVdEcND0mVX3suaapLyAE6pQ2jATUXKGIEcPrTO4XI
	Q/y2r6BgWE6BvXEiXpHgFUCk2arUAvvdd5P/eZ+fWDn2+XcFIYM/VDBTIkLQEIr77ZSZ
	eMwXu6YfV3GC8eDWrGrT6Wf89hL1noN3VSe92mUj1K6XyDg9Bv+ZEzdbmllSBVzM3GQe
	x8a+umtEaNw0F6s2v+I0feiiXlfKj6iquWVo3ljnD08TfQNbgW9cJrLzXD3ECCoS7LJf
	deIg==
MIME-Version: 1.0
X-Received: by 10.112.142.40 with SMTP id rt8mr11957692lbb.52.1393255147185;
	Mon, 24 Feb 2014 07:19:07 -0800 (PST)
Received: by 10.112.53.35 with HTTP; Mon, 24 Feb 2014 07:19:07 -0800 (PST)
In-Reply-To: <1393021765-4399-1-git-send-email-jacob.kroon@mikrodidakt.se>
References: <1393021765-4399-1-git-send-email-jacob.kroon@mikrodidakt.se>
Date: Mon, 24 Feb 2014 16:19:07 +0100
Message-ID: <CAPbeDCmoikCwWd36zZ_8xNPECdkJm=kuVgY=7pd9shByfg_VcQ@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] Disable Debian-style package renaming for nativesdk-qtbase-tools
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
X-List-Received-Date: Mon, 24 Feb 2014 15:19:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 21, 2014 at 11:29 PM, Jacob Kroon <jacob.kroon@mikrodidakt.se>wrote:

> Since commit 8da5017712a7ddcb8488e095b9aa03b0273f23e9, libQt5*.so files
> are included in the nativesdk-qtbase-tools package. However this
> seems to enable Debian-style renaming, causing the resulting ipk package
> to be created as "nativesdk-libqt5core5".
>
> Explicitly disable renaming for nativesdk-qtbase-tools package.
>
> Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
> ---
>  recipes-qt/qt5/nativesdk-qtbase.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc
> b/recipes-qt/qt5/nativesdk-qtbase.inc
> index 3cb9b0e..e87624b 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase.inc
> +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
> @@ -60,6 +60,8 @@ FILES_${PN}-tools = " \
>      ${OE_QMAKE_PATH_BINS}/* \
>  "
>
> +DEBIAN_NOAUTONAME_${PN}-tools = "1"
> +
>  QT_CONFIG_FLAGS += " \
>      -reduce-relocations \
>      -shared \
> --
> 1.8.5.3
>
>
Now that I think of it, would it be a better idea to somehow handle this in
debian.bbclass ? Or would that break too many existing package names..

  -- Jacob


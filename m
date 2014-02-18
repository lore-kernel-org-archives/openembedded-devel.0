Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 51D336EE37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 14:59:23 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id t59so15425298yho.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 06:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=5y0LCIta/0FehWVhWxhml15HfFMqEcE9vAV5t+QuMnU=;
	b=MLrXo6q3u0LKFu62bgSTk4WQSyHIaQo84vH+SuSCGdNMKl/D++an0Ssv3m8rAMHXz3
	KjHuGJM6oRoJZA5kVpmLwiAenAbh86d4UzHTnNZudbuDohLIsDGBrmvtj79tdHD3nQnT
	8LlS0Gx0nMRmi2ydQ9JFz2GwM4qerswqMYrde1bMZImZcs4SkUCeEBQqL/CWcWDJ88T8
	rpgon1yZpY9ZgbKOL6ALeDYp6ais5OX4qrACsfooW6uMKxMXbMUSq6+uW/DCDfxP5twK
	6KkjUehwkM2Yda4ewXTARqKwdWWyifXfF3GyArCnOKFaDzep5LhF+eRz5BfHtWZHV+Ob
	vu3Q==
MIME-Version: 1.0
X-Received: by 10.236.134.48 with SMTP id r36mr4075339yhi.133.1392735564303;
	Tue, 18 Feb 2014 06:59:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Tue, 18 Feb 2014 06:59:24 -0800 (PST)
In-Reply-To: <1392719185-11585-1-git-send-email-Martin.Jansa@gmail.com>
References: <1392719185-11585-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 18 Feb 2014 11:59:24 -0300
X-Google-Sender-Auth: NmgQ00s9h5xbsjXv2IjqmlCGtIw
Message-ID: <CAP9ODKrXhs5pORm0Qn-GBP_5_yMoct67KkgMsC9q-gaV+QdWFQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: add PACKAGECONFIG for mtdev
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
X-List-Received-Date: Tue, 18 Feb 2014 14:59:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 18, 2014 at 7:26 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

> ---
>  recipes-qt/qt5/qtbase.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 4c1c6dd..116c86f 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -101,6 +101,7 @@ PACKAGECONFIG[openvg] = "-openvg,-no-openvg"
>  PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
>  PACKAGECONFIG[xkb] = "-xkb,-no-xkb,libxkbcommon"
>  PACKAGECONFIG[evdev] = "-evdev,-no-evdev"
> +PACKAGECONFIG[mtdev] = "-mtdev,-no-mtdev,mtdev"
>  # depends on glib
>  PACKAGECONFIG[fontconfig] = "-fontconfig,-no-fontconfig,fontconfig"
>  PACKAGECONFIG[gtkstyle] = "-gtkstyle,-no-gtkstyle,gtk+"
> --
> 1.8.5.3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


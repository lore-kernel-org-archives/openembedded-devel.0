Return-Path: <net147@gmail.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3525C6E8DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 02:16:40 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id m5so11282261qaj.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 18:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4I7cKzLKbtpAdOd2bFqdB2aK6VBEGXo8zpqH653DC2I=;
	b=mvn85a2X+b2UYs+vq5JKxbdCOkp0ctNEdPTfT7q5rznuoMA1jiwZBdfbhnukfX8nj7
	na2XKtn7MZ7+EvGBHdD6d11jvJM3w0NBmwPTnL+2owkKjaQmIg+Z+EPl/Iu8xBfSQWuN
	pIAFee7M8yyxJ7YjSTCrF8UE2eh0LouCx+TA8SLTzReTNXoxLNkBRN7nW6VU6W7WxYSX
	MEqR5sEDS1RMxqSg57shjhT2HfCOXt7ulDcQXQs/Qd0W/s0jp7Kf3rBRSOd8kP+kagCD
	5jMt/LJtSAxGoYhUeJQj+YMcW3C/9mpUuQnk9VRfBKaCdd8RtVw3TXTTt3d0DvY8EEEN
	d/rg==
MIME-Version: 1.0
X-Received: by 10.224.19.199 with SMTP id c7mr124502qab.78.1392776200870; Tue,
	18 Feb 2014 18:16:40 -0800 (PST)
Received: by 10.96.78.193 with HTTP; Tue, 18 Feb 2014 18:16:40 -0800 (PST)
In-Reply-To: <1392719185-11585-1-git-send-email-Martin.Jansa@gmail.com>
References: <1392719185-11585-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 19 Feb 2014 13:16:40 +1100
Message-ID: <CANwerB2dthfKuGn8ypVTpZcp=xJHi-xonSx2R06fGgKKXOa1Ew@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
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
X-List-Received-Date: Wed, 19 Feb 2014 02:16:41 -0000
Content-Type: text/plain; charset=UTF-8

On 18 February 2014 21:26, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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

Note that the -mtdev and -no-mtdev options were introduced in Qt 5.2.1
so it should go to the 5.2.1 branch.
Qt 5.2.0 doesn't have those configure options.

Regards,
Jonathan


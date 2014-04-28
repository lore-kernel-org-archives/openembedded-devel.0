Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 30D3D65E93
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 15:14:15 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 19so5777365ykq.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=YmILacrTx6dfKq3Wkv+DZhEPqLQ6S4iIYffU6rRa0Uk=;
	b=ZNIv9i0E4Wde6t0Z0VTr00MG6CwbudpbNgxxmoK3lXvOJ5ywlgkcTV8H+fi6WI62vD
	mq6Y+caZShcgfBS3q2PrwSWyjvtOU8rK15zO3M2AlAlj7W8lz8jqd5Zvy/nL/DkpUQWM
	5BZI8nek/XvlC+CF9mnkjKlkOwatKGKJKP/X8j2mfmAnNtVRQpDT6Isw0f6jN1tK6bXQ
	uWmr4fpvh5sJSuBMrRrMyJO9aqvQNFZZKkMY3VSLDpdD5N9UnLJuRhtForgoFEXbkxUU
	gU/zsX4g2dskgP4y+SwYp0GNvMd/0mwH0ToKL9DTtYI3ZyzVJ8P2U4B8yxNcd59Nqvmt
	qJpQ==
MIME-Version: 1.0
X-Received: by 10.236.43.98 with SMTP id k62mr38200527yhb.33.1398698056124;
	Mon, 28 Apr 2014 08:14:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 28 Apr 2014 08:14:16 -0700 (PDT)
In-Reply-To: <1398597711-17825-4-git-send-email-dv@pseudoterminal.org>
References: <1398597711-17825-1-git-send-email-dv@pseudoterminal.org>
	<1398597711-17825-4-git-send-email-dv@pseudoterminal.org>
Date: Mon, 28 Apr 2014 12:14:16 -0300
X-Google-Sender-Auth: deOoYVXFGbacYPKgFz0TBpwnJoQ
Message-ID: <CAP9ODKr2W4gi=uytRghv6rQYtSMjqbKcy9+yqAEt=OWoiWJzCg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 3/4] Add use-egl PACKAGECONFIG to let chromium use EGL automatically
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
X-List-Received-Date: Mon, 28 Apr 2014 15:14:17 -0000
Content-Type: text/plain; charset=UTF-8

Hello Carlos,

On Sun, Apr 27, 2014 at 8:21 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> By default, Chromium will try to use GLX and regular OpenGL. On embedded
> platforms, these are often not present, or unaccelerated, and using EGL
> and OpenGL ES instead makes more sense. To produce builds that use EGL and
> OpenGL ES by default instead, this PACKAGECONFIG option can be used.
>
> An EGL/OpenGLES-enabled build produces a chromium version that renders
> 2D and WebGL with GPU acceleration (if present).
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  recipes-browser/chromium/chromium_35.0.1883.0.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
> index 080282b..d0495d8 100644
> --- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
> +++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
...
> +python __anonymous() {
> +    pkgconfig = d.getVar('PACKAGECONFIG', True)
> +    if 'use-egl' in pkgconfig.split():
> +        d.appendVar("DEPENDS", " virtual/egl virtual/libgles2")
> +}

This is not need. You can add it in the PACKAGECONFIG third param so
it includes this dependencies for build.



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


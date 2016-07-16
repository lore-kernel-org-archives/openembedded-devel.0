Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id C38327317F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 00:04:52 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q62so7613907qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 17:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=CuZI/MsLFstUvsvZzAioLKMOhrtv4xK1RRsgjs47NOk=;
	b=PtNvdk7E3ZWsLOIA9ZCM2RbDTO2riFgrQOPcEb18SGMHF2bodZjSnQcMk1iNc5F/Tn
	1oVmc7vVgnU5soOO1glxh18Zsl0/6uiwNei1vCbsQVv7TD2q5tfbWZaKF8a0HAXgnD+S
	5VdAjIaJDIpkoV/CToarlPrhu/fXDWbo2k7Xu8rI8A52dTJDHqp7li89vgUZekptR+KU
	UBlCxYaddmFnc67fQTFJJhOvD9uveng2dbIRTzXuuGw8zspvnf52y8vXRZv6yImIR/TY
	e4QADxEm3bjApDsUpmAFxrMRn9v5uJexwMiadqCybpEOoEilUXO618nAk+/9n2pnzkT5
	MU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=CuZI/MsLFstUvsvZzAioLKMOhrtv4xK1RRsgjs47NOk=;
	b=LbTGwVM3eCEbWHc/tTz1HCBc+a1CZNdOUuW2aXk9cGH1kK3v4pmA0cE5iuW9mZC8MZ
	YePzRGe0GnTXH60LHtM2sST0+uCzi2EwGExzNrY/aaZIrO4PUrtEFrb9q2oKHFjDEWV8
	jXiIL8g9RwjoO6AK6HwR4jEm/P+HlCmtTfMa2fShYehDNYKUuI8WNcAU2C2UnocyFn+z
	Ot1kZwfG3AR6ZxGtTPp18yTIo8bz67mjgTwiyvLhJKskcJ3XDg+4kK4RXMoM0XvCAtcp
	Jx3o5H4TDVTeyoq69HD5iw00Jg7nTs03vzQ/Q9J5F93Uj80ttZIF1bvefBgC/thLKYWL
	wpLw==
X-Gm-Message-State: ALyK8tJ4G+HmeSg1ejBmmnoB+P5mG+z7VkQBYZYYW7nwE/mCwDTsaqyobiQFNzQ+DC5lZxTiUtJbdoZHoVk3sQ==
X-Received: by 10.55.187.4 with SMTP id l4mr29506633qkf.152.1468627493097;
	Fri, 15 Jul 2016 17:04:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 15 Jul 2016 17:04:23 -0700 (PDT)
In-Reply-To: <1468602774-12745-1-git-send-email-clopez@igalia.com>
References: <1468602774-12745-1-git-send-email-clopez@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jul 2016 17:04:23 -0700
Message-ID: <CAMKF1srJSb=ZJRo+pRSrZL4e179NhVa47JYBdBY-QQknZMsFZA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: install all pak files plus resources and blob.bin files.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Jul 2016 00:04:54 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 15, 2016 at 10:12 AM, Carlos Alberto Lopez Perez
<clopez@igalia.com> wrote:
>  * This files contain localized strings and other resources that are
>    needed for support of internationalization and localization.
>
>  * Files under the resources directory are needed for the web inspector.
>
> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>

this is ok

> ---
>  recipes-browser/chromium/chromium.inc | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
> index e5deac1..0e7250e 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -52,20 +52,32 @@ do_install() {
>         if [ -f "${WORKDIR}/google-chrome.desktop" ]; then
>                 install -Dm 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/google-chrome.desktop
>         fi
> -       #Chromium plugins libs
> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/product_logo_48.png" ]; then
> +               install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/product_logo_48.png ${D}${bindir}/${BPN}/product_logo_48.png
> +       fi
> +
> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/natives_blob.bin" ]; then
> +               install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/natives_blob.bin ${D}${bindir}/${BPN}/natives_blob.bin
> +       fi
> +       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/snapshot_blob.bin" ]; then
> +               install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/snapshot_blob.bin ${D}${bindir}/${BPN}/snapshot_blob.bin
> +       fi
> +
> +       # Chromium plugins libs
>         for f in libpdf.so libosmesa.so libffmpegsumo.so; do
>                 if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
>                         install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${libdir}/${BPN}/$f
>                 fi
>         done
>
> -       # Chromium *.pak files and CEF pak files (prefixed with cef_)
> -       for f in content_resources.pak keyboard_resources.pak chrome_100_percent.pak product_logo_48.png resources.pak \
> -                cef_100_percent.pak cef_200_percent.pak cef_resources.pak cef.pak \
> -                locales/en-US.pak; do
> -               if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
> -                       install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${bindir}/${BPN}/$f
> -               fi
> +       # Chromium *.pak files and CEF pak files ( prefixed with cef_ )
> +       for f in $(cd ${B}/out/${CHROMIUM_BUILD_TYPE}/ && find . -type f -name \*.pak); do
> +                       install -Dm 0644 "${B}/out/${CHROMIUM_BUILD_TYPE}/${f}" "${D}${bindir}/${BPN}/${f}"
> +       done
> +
> +       # Chromium resource files (for the inspector).
> +       for f in $(cd ${B}/out/${CHROMIUM_BUILD_TYPE}/ && test -d resources && find resources -type f); do
> +                       install -Dm 0644 "${B}/out/${CHROMIUM_BUILD_TYPE}/${f}" "${D}${bindir}/${BPN}/${f}"
>         done
>
>  }
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


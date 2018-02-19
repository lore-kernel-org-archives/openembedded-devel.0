Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BF00A78055
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2018 12:07:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q83so5369418wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2018 04:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+uiPiiN3pwIhIG+afR8GV3vdbgVNOPTnYqSSCnL9qL8=;
	b=EDo+Rid6dHYNxruhIBXBtwPXml/b9Y8EZRYX2vJpk8Li64AAg3zqDRML11YikkwPRL
	M908Y2Y6myQiGidBtuOgXLso8Rtl78FB1MLZfQ4ieK8gFcy3zZ/juvNh/0Fmc50xCLqM
	w9gsrFSDamxkiW0DFsuNStaI6TblmbfODRh9kVnc2i8YD3oCSISEqOJ8sdpS3g4Odi5+
	sh0lud7M+ztn3xcXDRUeUZeK3Fq4JQTylFroVajbeB4w6jG16bi0Ur8MBjgBdP0C//0K
	JOF56eAU1UhftOpNhxnhzL+qk+pZDlSQ3xOce43q92PghUOOo6cCc7Jv2HFF4eClRLDM
	w/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+uiPiiN3pwIhIG+afR8GV3vdbgVNOPTnYqSSCnL9qL8=;
	b=IXnBgclQod4cldo6MZFQvFRCi+DuqzUirqTQ/25mpgrGgeNaN2SoNOVmzxv5qUGiTA
	3x4FcNxjACQ2QFHG1E+vwZIP+7h/raP+1JZdFJ1B8NFOQ4BXMydg8Zn9wGrgF0StRmZZ
	1nBWxa0nkDCw1BKFAuHmG1X1FbSYfKNvKLCD+dB+fOdMwL1OpneoSuVzuadCSgLCnXGs
	DT+ZGBEqS9r9gM3bVlZZIkiBQHTRm1xbLNuWGG9DGll9FHO4xqYdHqBab3w6UF91CBoJ
	lr0V/0aHvFtPybAbUNrKcIJllXJ93xFxljbWfjM93etNPT1qELnbWrp51YT63Ok695Kj
	6Dgw==
X-Gm-Message-State: APf1xPDdftgarxw/SpsLtYO1aY9BZHsxtShqY0d1pSKW562w3wUMeWaN
	/CyPMUb7t+V3sQB8wdzCj1M5eWm17v42LfBFhaz1JQ==
X-Google-Smtp-Source: AH8x225rqmY6A5LZ4xIi8OxrB5WZgJjH38FxHGYnizQ2j7MJT67+bLK4A/ylyzkZ6lBH0Z/VLEEZlfxzk/2NqxQCqBY=
X-Received: by 10.28.87.1 with SMTP id l1mr10224203wmb.32.1519042065288; Mon,
	19 Feb 2018 04:07:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Mon, 19 Feb 2018 04:07:44 -0800 (PST)
In-Reply-To: <1519030401-9299-1-git-send-email-kwangsub.kim@qt.io>
References: <1519030401-9299-1-git-send-email-kwangsub.kim@qt.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 19 Feb 2018 13:07:44 +0100
Message-ID: <CA+chaQfbgo2cG1zJ+UmBRWGaKu6vUy4Kod7SSOZk7=ZhjzF5SQ@mail.gmail.com>
To: Kwangsub Kim <kwangsub.kim@qt.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2] qtbase: add a config option to optimize for size
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
X-List-Received-Date: Mon, 19 Feb 2018 12:07:45 -0000
Content-Type: text/plain; charset="UTF-8"

This doesn't make sense.

Leave PACKAGECONFIG[optimize-size] as it was in v2 and add
${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Os', 'optimize-size', '',
d)} to default PACKAGECONFIG value.


On Mon, Feb 19, 2018 at 9:53 AM, Kwangsub Kim <kwangsub.kim@qt.io> wrote:

> The '-optimize-size' option would enable the compiler to optimize
> for size instead of speed. If the global compiler option already
> included '-Os', this option would be enabled by default.
>
> It would affect the whole Qt libraries and Qt applications as well.
> This feature is available in Qt 5.9+.
>
> Signed-off-by: Kwangsub Kim <kwangsub.kim@qt.io>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 4f3ade2..208a755 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -147,6 +147,9 @@ PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
>  PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
>  PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
>  PACKAGECONFIG[journald] = "-journald,-no-journald,systemd"
> +PACKAGECONFIG[optimize-size] = "-optimize-size,${QT_DEFAULT_
> OPTIMIZATION_FOR_SIZE}"
> +
> +QT_DEFAULT_OPTIMIZATION_FOR_SIZE = "${@bb.utils.contains('SELECTED_OPTIMIZATION',
> '-Os', '-optimize-size', '', d)}"
>
>  QT_CONFIG_FLAGS_GOLD = "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', '-use-gold-linker', '-no-use-gold-linker', d)}"
>  QT_CONFIG_FLAGS += " \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


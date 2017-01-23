Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id AD026760AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:07:15 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id y9so115088886uae.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 09:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=noythChd5eJXzYl7CQ0ZWTS/1usGFgyyT7DVIq2BSPA=;
	b=p/wAloEMdyoCCxqLJSN/FjllxHXEzGF/I6UW55M77nH92cBKryLg0j/CrJmoFYKLxi
	to5O4o0NDfkdjOfNrMfe53gggnuEm+RHqL7GyMGk0f7ms3QmiQAQHHdLt26oSzwl6yiu
	sRtz/54jlS8oK0FYPe1jAtUDfMiNKGc1AtflgQxeqmXNM6RwNjk+tf1KIYGn9Fl/teMr
	lV2REV8tsPvFRQBYjamFnk9OmQnm/JYMfYiHdnhuqnuvoEvoODtAQK5WILC2+8+PnVmb
	HkZB14mPCxUWHG2ApJR1OY9MOScfqBtTk0F/bS3tYL67ipugjjiCEAEFXC9R4pjJ8SOF
	f4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=noythChd5eJXzYl7CQ0ZWTS/1usGFgyyT7DVIq2BSPA=;
	b=ZkVKlvioH5pCHFev7pUuHCjgJKKb0rO1rawTyo3PeRbiy/nxFga+UlyiJ9ef7GBA3x
	RQeY+zmVj0A1slBZdTkieSccrFLYDtm/36148SQLW/eODFg1WOV3oVkTtftdcPhIAyUB
	1wOtcsMetLA7fxxo/zOMVWo2v6R4rK+MLITrhCB7ItKmCd5rbFKhH2/cFapi33Wa5Vxa
	72oQrOAaxc4yVTXWbJFeRM54w26zsHXbPMr2NgcSciq/cxjty+Enc0LFJYDRSpe3Czdd
	M5eulJ8yAyx49Rifo3G1zn2x8jdDZjh6bVR1aw0SbGtWh+u5XEPEKHUkqqXy+esbNWEo
	9V9A==
X-Gm-Message-State: AIkVDXIoho9K/MX+Grm0TTszT3xtY3NT6jyU0Xu/9X1rf4aWC+OLNNESCgIdQ77+RVUJ7fVAntXU8TaTAZc73g==
X-Received: by 10.176.64.168 with SMTP id i37mr15315758uad.60.1485191235174;
	Mon, 23 Jan 2017 09:07:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 23 Jan 2017 09:06:44 -0800 (PST)
In-Reply-To: <1485188858-12081-1-git-send-email-derek@asterius.io>
References: <1485188858-12081-1-git-send-email-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jan 2017 09:06:44 -0800
Message-ID: <CAMKF1sru-NCscOLHy-qSNJEhj9kV8p8awEhsmOK2N5sMWxnGQA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-flask-bootstrap: update to version 3.3.7.1
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
X-List-Received-Date: Mon, 23 Jan 2017 17:07:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 23, 2017 at 8:27 AM, Derek Straka <derek@asterius.io> wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  ...ask-bootstrap_3.3.6.0.bb => python-flask-bootstrap_3.3.7.1.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-flask-bootstrap_3.3.6.0.bb => python-flask-bootstrap_3.3.7.1.bb} (51%)
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
> similarity index 51%
> rename from meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb
> rename to meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
> index a115f23..05a02c6 100644
> --- a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
> @@ -1,15 +1,15 @@
>  DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3452e378337a5cc2092d32a140178d5a"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
>
> -SRC_URI[md5sum] = "b8aedbe51f2bf511af955f2bc288cd8c"
> -SRC_URI[sha256sum] = "3a7b71e22596a6d559965e059958960e0bb671adc131537a79edb491a8f31714"
> +SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
> +SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
>
>  PYPI_PACKAGE = "Flask-Bootstrap"
>
>  inherit pypi setuptools
>
> -RDEPENDS_${PN} += "\
> +RDEPENDS_${PN}_class-target += "\

why is this change needed ?
if its needed so that its only done for target recipes then use
_append instead of +=

>      ${PYTHON_PN}-dominate \
>      ${PYTHON_PN}-flask \
>      ${PYTHON_PN}-visitor \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


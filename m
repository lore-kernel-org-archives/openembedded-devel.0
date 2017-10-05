Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id E24D9719C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Oct 2017 19:48:14 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id y44so6325665wrd.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Oct 2017 12:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tr0cZFzuPgCng98hBd5ZfBIhl8WBWoDmJMs7IrtncEU=;
	b=jRtx3emXpDlc3uig2xkUN/IPGFNneRIlquEMZdicLUYLTzPW+RdiaaKn/DAM4nPU+a
	gVmCCanE16FgIEWIK+FwUsZ+uX8nq8Eg/RTTCv6tObnqPFJSGfQZHiF03s7MMStNEsED
	aPT79h68gtUqllItELgQmMwB8ulP5mQVqZ0nFIky732jZKx2I3O2qoEyTf7AfWrC6Xz2
	3QbKbwAEdiaMY4deA9jDvItjviThZnpV1ql7zD0yMKz8+5yHvN8y8UEUc54ZTSuBIvpt
	5mDkT+un9Wk7aIp/fzsYhx3hwJqx2H68auEo7ApBVDgDQrc+vV6ERzlvc1Rk+D6P5liM
	XgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tr0cZFzuPgCng98hBd5ZfBIhl8WBWoDmJMs7IrtncEU=;
	b=qWbNdjdIPREZaOQ9WClnlp72Md4bBObYaW5oewFhPzROM8bA7TnqKWQRdpvAhW/iZE
	fnDSYIPTRGcRo6x2Jou5cnD3CPkxIKsvN45uU9jVpXC5OWxQZxJ9cRVSLXamk/fWGY5y
	K29BnS3Kf7EyMhmFYln5R6+xhHoKNrNjR1kA1yJFQfPz7dT7rHG9w+GGZGBWx+f7pW9C
	AStkTppBD3IMkKHcFn/ceqUW/MPSjaGzUgyQkHS76bbuCbj0b8vjtBtCRYbJ/ihQtBkl
	l0Izmwfv9B4bTUnDXWDsAjwMT+M3xXbSdRGuSUxSKd/qBmWfZHlg1bT5aGm+3C7VDHbK
	arsw==
X-Gm-Message-State: AHPjjUiqBl3Eva2hHL2RndgWCyKFiq41t/0UEYED007A74WGwWT8Wo9R
	5y3yPQR2rSmRCluWOlmLWmhielLphWEzFwk7x3E=
X-Google-Smtp-Source: AOwi7QBe4tzkrR15+28I7atW9B/OIfzwQAlgKuvrTZnQ9q3Wy6Zj+oYGR1kci4g93guGuwkFIDc36xSzi0fMCtocwcU=
X-Received: by 10.223.146.197 with SMTP id 63mr22931305wrn.180.1507232895565; 
	Thu, 05 Oct 2017 12:48:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Thu, 5 Oct 2017 12:48:15 -0700 (PDT)
In-Reply-To: <1507196827-16528-1-git-send-email-shantanu@senic.com>
References: <1507196827-16528-1-git-send-email-shantanu@senic.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 5 Oct 2017 12:48:15 -0700
Message-ID: <CAJ86T=U015JM5AgHLh3hJeorDVoV6S0KkpNvgH1aukqjyn98jg@mail.gmail.com>
To: baali <shantanu@senic.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Recipe for Nghttp2: HTTP/2 C Library.
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
X-List-Received-Date: Thu, 05 Oct 2017 19:48:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 5, 2017 at 2:47 AM, baali <shantanu@senic.com> wrote:
> It is also needed for Curl to support HTTP2 protocol.
>
> Signed-off-by: baali <shantanu@senic.com>
> ---
>  meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb
>
> diff --git a/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb b/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb
> new file mode 100644
> index 0000000..3e6b10a
> --- /dev/null
> +++ b/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "HTTP/2 C Library and tools"
> +HOMEPAGE = "https://nghttp2.org/"
> +SECTION = "libs"
> +
> +DEPENDS = "pkgconfig cunit zlib openssl libxml2 jansson c-ares"

Adding pkgconfig to DEPENDS looks odd. Maybe the recipe should be
inheriting the pkgconfig class instead?

> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

Try to find a license text within the nghttp2 sources to use here.

> +SRC_URI = "https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "926f07ad3b50f38f7d8935ced04716cf"
> +SRC_URI[sha256sum] = "0df4229f4123b5aa96e834ebcfdffe954e93d986f0252fd10123d50c6f010983"
> +
> +inherit cmake pythonnative python-dir
> +
> +EXTRA_OECMAKE = ""

This is redundant and can be dropped.

> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


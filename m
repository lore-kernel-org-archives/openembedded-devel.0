Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D64FA7F225
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 10:29:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y11so28929910wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 02:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=opD1bmKU7VbcGck8ra88a/i19nueM3DQg78xvByLpsw=;
	b=oN3/+Jov0mEXqN4FFc0op51a3SxP7hMrNLFDIRvYAf2TZadLxM3f+I0QW7QRj02Bvg
	BGS0eJcOwS28mTQ0m4py7RNUtdcwkYjwtv3lP+kPrPEqcOIqpaHJDRSl5vWt1GRWMtKo
	fQJZyyicsamBY6eL0s+aYRmwPOPatTKTqQ+j0hOSKqUzcqqahR8HkgUfuRi/1jp+Qti2
	KbIQiKaNxNXR5WwW+yf23lGjwD4g2e1mwIr1parkOniIPV8qIjmLmXOjb9SkQJ5ka8d2
	OFteoG6oSYf04WaO+SjT6tVy6kUW/fI9o4YJMOr8ybRYxwl3HjA2Na+7X/FuN2JgXEwk
	E9kw==
X-Gm-Message-State: APjAAAVbb7MiB7mRvqeX/tOhD9F8cC4psZkCsTlJmhOadqQgFB/cx+Ol
	4C6GRg+gcBjHKfaCQqgDJhii0J6a
X-Google-Smtp-Source: APXvYqwgliIMaZaacUh+MTCbNFLPDJoK8humhG6Pwil+v6PyO/HZkWtUbeZXquCIhZBIn4qoQVa9Tg==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr17396198wrv.368.1579516170464; 
	Mon, 20 Jan 2020 02:29:30 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d8sm46003275wrx.71.2020.01.20.02.29.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 02:29:30 -0800 (PST)
Message-ID: <2c54d8cc9d1e1763e0f4d17b72c55a3bc995ed6a.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 10:29:29 +0000
In-Reply-To: <20200119232403.12871-1-ticotimo@gmail.com>
References: <20200119232403.12871-1-ticotimo@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-python2][PATCH] python-beautifulsoup4: fix target RDEPENDS
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
X-List-Received-Date: Mon, 20 Jan 2020 10:29:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-01-19 at 15:24 -0800, Tim Orling wrote:
> * target has run-time dependencies on:
>   - python-html
>   - python-logging

Any reason -native doesn't depend on those?

> Unexpectedly, class-target += override is wiping out
> RDEPENDS_${PN}, so explicitly add the rest of the
> run-time dependencies (python-html5lib, python-lxml,
> python-soupsieve).

This is expected, you should instead do:

RDEPENDS_${PN}_append_class-target = "\
    ${PYTHON_PN}-html \
    ${PYTHON_PN}-logging"

So as to avoid duplication and having to maintain two distinct lists.

Cheers,
Andre'


> 
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>  recipes-devtools/python/python-beautifulsoup4_4.8.1.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb b/recipes-devtools/python/python-
> beautifulsoup4_4.8.1.bb
> index 86482714..8ac9c8c5 100644
> --- a/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb
> +++ b/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb
> @@ -19,4 +19,14 @@ RDEPENDS_${PN} = "\
>      ${PYTHON_PN}-soupsieve \
>  
> +# class override, which is not
> +# inheriting from above (FIXME?)
> +RDEPENDS_${PN}_class-target += "\
> +    ${PYTHON_PN}-html \
> +    ${PYTHON_PN}-html5lib \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-lxml \
> +    ${PYTHON_PN}-soupsieve \
> +"
> +
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.25.0
> 



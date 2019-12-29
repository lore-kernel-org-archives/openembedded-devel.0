Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id B4BE27F7BC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:32:03 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id q20so28356452qtp.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9q30BVHbrXMrx3WeI7aveIiOwZiqAMdwCML5gvo2Dcs=;
	b=CRpE0loVOw9YNhundbO9Kx23z5UxggheECPFKQokMUGSOObTLFMsNwqEB7e3RBIZ8J
	kLIWWcARgYM+8a7g1eHWUIFK3IAV6uOga3Rbyvg6CPuyCQAMhsBYrYcLY1w20rcf+HIM
	0WrNthguDqVgCQS+wEWaM7ihIWcCw8ejYUeixuxSyGyL9NtAzVXHW15ybPv1ZyPG565g
	hDbLXBjqA1V2P2IsmIrP4V7NCT5m7KmRT6AIzPOJTYQa6PX1rFtjEwX4OQIWxQuwg08y
	9KX5oZLY8j94jSUz6Xl8uO/lcDg9SdR5y+fr5iDq+1VOZBo2pdxJpa8brFkpYRH/6tcp
	HI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9q30BVHbrXMrx3WeI7aveIiOwZiqAMdwCML5gvo2Dcs=;
	b=PluGBvWJjcjz5ZQ5wW6C0aM9b8d3JPZy6+qvSsLIjESk//6uGlM8PI5BrR8QkvS3lm
	paP1jGyZR+DXamt6PDt81i1dF1fYV4jPE+lUkeJdIODvju2n26fXIUApkM2Ms3tRvxKa
	3WN+BhEEIMECQgpJ0ygxkngJjk0+5h4lnyApx2IeL7P3ReZn+2n5gzUuPsvH9+bW6VQl
	HerJiyj3gqhB3mS5ZnHqP3QPIVcZDcEY4prh2q0qe4DYGz/OoQ9sONzuX9G4XLzlHh3k
	saeO/3fdO4zpQFpMT+UlRAlAGseIhAwt2Y6UMSgYX3UUQlTAruSN9a6g9fiXF/ZSnVZD
	qtBw==
X-Gm-Message-State: APjAAAVEeGPqD2c73bOIRu/fI7B0KwZ3+lOFJJw3ce2hFTRzzDwIIOzM
	SZ2CpYRu76nx4bCE4io0VaISX1q2d6WNHz8tNmA=
X-Google-Smtp-Source: APXvYqy4Gfi/ZnNl+EFi+yxR4FEpDxkdkm9EXuttaFnyQz05XaWNcFWkozyK02aAJ3LM8CdaoVEqaw7baIYyBttVzzY=
X-Received: by 2002:aed:2c03:: with SMTP id f3mr30524653qtd.80.1577644323839; 
	Sun, 29 Dec 2019 10:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20191229161124.19759-1-peter.kolbus@garmin.com>
In-Reply-To: <20191229161124.19759-1-peter.kolbus@garmin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Dec 2019 10:31:37 -0800
Message-ID: <CAMKF1sont0h5JJ_w6_-muiBMUjwo4KAZrkXqKyvdfdAjaUsZJw@mail.gmail.com>
To: Peter Kolbus <peter.kolbus@garmin.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python3-html2text: add recipe
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
X-List-Received-Date: Sun, 29 Dec 2019 18:32:04 -0000
Content-Type: text/plain; charset="UTF-8"

rdep on booleanpy is dropped in this version, is that intentional?

On Sun, Dec 29, 2019 at 8:13 AM Peter Kolbus <peter.kolbus@garmin.com> wrote:
>
> python3-html2text converts HTML to Markdown-formatted text.
>
> Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
> ---
>  .../recipes-devtools/python/python-html2text.inc     | 12 ++++++++++++
>  .../python/python3-html2text_2019.8.11.bb            |  2 ++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-html2text.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-html2text.inc b/meta-python/recipes-devtools/python/python-html2text.inc
> new file mode 100644
> index 000000000..678dcef3f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-html2text.inc
> @@ -0,0 +1,12 @@
> +SUMMARY = "Convert HTML to Markdown-formatted text"
> +HOMEPAGE = "https://github.com/Alir3z4/html2text"
> +
> +LICENSE = "GPL-3.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI[md5sum] = "21aad7ec95b70606024b783c8253899c"
> +SRC_URI[sha256sum] = "f516b9c10284174e2a974d86f91cab02b3cf983a17752075da751af0e895ef5e"
> +
> +inherit pypi
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb b/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
> new file mode 100644
> index 000000000..9cb5b01eb
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-html2text.inc
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 152466E667
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 14:10:30 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id l89so5597084lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 07:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+KMiL9BkNYXNtMcnmw2GnIQAYbRM//lW+ofq6lqi4+0=;
	b=VGGQvkPpldj/9mysdxBBlLAQaPKLJ7bJaqw4vvFVf0iXKf6x4zCU/r0nMJ+E02K243
	dG+LFUjvjJ5F6+zLNkFZOGdamQXOZ9hJBjWEBo/OeD9lE3LhH/TILuGg7TvE+MgVofod
	5K43UhZvsQiKQtwVUdJQK17hkqdXTQWqJ1CKL8ESh9O5Jdj300MM3Vc8eH9+UGR67FmG
	7mwsFctIwK0Coyg+44oeBVC4RWaK8XbBgW48P1wkBJ97iyqL3M4GXRDfX7KDtdzEX3Zi
	svSU/4yy1dDsvEO1sxWVjFaF2GmRgazVRnoiuW0GMnvUkrrtEDTsYRYQvesRj6+MaZCa
	Ewjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+KMiL9BkNYXNtMcnmw2GnIQAYbRM//lW+ofq6lqi4+0=;
	b=NfLaA5D+s1SxXddntSQvkpr/fq1EvxWg52ExlQEgcHsGDWqgyO7X3JyNE3Pngzm7iz
	H/7MJeiWPOhVbFkyKYLVkYF9HGsn80NEp7q+pokwX8T2Cy3x/CWkVsX6bpu2+5npGbSr
	otrjTsm6gXPWQu+GzM3Ql8BvKTnpZoy4DwsXVmPCPzJq4ot8x8xDvXZlA/iIYk4r4pTc
	Vb9qSyK0QEyeWnuXjn8Z6Yx6WZuj+SWPRDkuik/UqkdcgyudvRm0fwoyQAutHblpE0Cr
	nXSTNSjSlfVja08/ldK515SuHmpEVSc3UMO381SpU/yKP9WybvZaYgQfBhvozuJpjiCJ
	Vyuw==
X-Gm-Message-State: ALyK8tI2nzVAnMVIJ5rwVWDposlWDYdzPaINT8XyPZe1SsFNmRgQk1zyG4lvA8rdq4QuW2my59ljyeAT1O6fUg==
X-Received: by 10.46.33.217 with SMTP id h86mr9765439lji.39.1469110230227;
	Thu, 21 Jul 2016 07:10:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.7.8 with HTTP; Thu, 21 Jul 2016 07:10:00 -0700 (PDT)
X-Originating-IP: [177.100.227.79]
In-Reply-To: <1469106587-2338-1-git-send-email-sven.ebenfeld@vaillant-group.com>
References: <1469106587-2338-1-git-send-email-sven.ebenfeld@vaillant-group.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 21 Jul 2016 11:10:00 -0300
Message-ID: <CAAPZna0M_SFGPnV_VqCdUayyjouk4LpC+utLC-0C0b6OS5zFJw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
Subject: Re: [meta-java][PATCH v2] openjdk-8: ignore wrong GCCVERSION-flag
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
X-List-Received-Date: Thu, 21 Jul 2016 14:10:31 -0000
Content-Type: text/plain; charset=UTF-8

It works for me.
I tested using host gcc 4.9.x and oe-core krogoth.

Without this patch bitbake fail with ExpansionError during parsing.

On Thu, Jul 21, 2016 at 10:09 AM, Sven Ebenfeld <
sven.ebenfeld@vaillant-group.com> wrote:

> During my recipe parsing, GCCVERSION in the cross case seems to
> be 'l' this leads to a ValueError during recipe parsing. Therefore
> check type before trying to parse the version flag.
>
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc
> b/recipes-core/openjdk/openjdk-8-common.inc
> index 089f907..33b7909 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -271,10 +271,12 @@ def version_specific_cflags(d):
>          # doesn't work anyway.
>          version = d.getVar('GCCVERSION', expand=True)[0]
>
> -    if int(version) >= 4:
> +    if version.isdigit() and int(version) >= 4:
>          extraflags = d.getVar('FLAGS_GCC%d' % int(version), True)
>
> -    return ''.join(extraflags)
> +    if extraflags:
> +        return ''.join(extraflags)
> +    return ''
>
>  CFLAGS_append = " ${@version_specific_cflags(d)}"
>  CXXFLAGS_append = " ${@version_specific_cflags(d)}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


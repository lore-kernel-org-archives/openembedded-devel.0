Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 50BCE71C5F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 19:17:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d140so1204554wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b96Y6YQ54yhFV5s82Rl4UXPwBthmLbF3/CMTqWMgsb0=;
	b=hisEJgv+INSbQPI58xtnCLvtt5qUXYFvp43WB45jN/kZcYhTE/VOnZSa2QPm0XqVqb
	jayLyOW6lpdYY/63Y5qIpOS+T6jFEWwgSBpI0eAMEvydIuAKc7O0pboLvY8r2K4SJ9Q5
	HIGgKWr5OEPQ5PqLtoJxADm+KGstl9TG5gz6QNcdo672JUgjnWYeLfw0pYtURy4hKv53
	0C0D1/BefZO4Rz/GFHB4lCrb0P7B85uJiXMNqJmECHHW0zwtbZ6JzurEqM6+RqABpxLP
	0MPB1LquRAK/b8gkLabApcGubxgw3F1Oxs5g4NHtz1BOAkJY7YWj77q9YEyvksLiG24G
	Pl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b96Y6YQ54yhFV5s82Rl4UXPwBthmLbF3/CMTqWMgsb0=;
	b=G0jfzLAg1Uv4rRj19DGChYGVIux5iNAobguhF8WHSu7g4HsRXrvNMV+5CZumqSJ8cH
	Yx3YIdq7Zcm9dMmAU6XO8o6xTpItDjbmNHr+rCvz97CSHH84uLIEOdhd+ypx0Zkx2GW7
	7QCRN13vIyezDcbn2iNMmMNZIYaxfYfEBWnhlZPWfMO5WJsooLNMuEHilArQG2iii7bZ
	3rS5H+MuJ2YXqSv/gOr88w1yzz/kekxAjsSR8vwD18bYJRBOzplQ6bF1LQNNuB14N/WJ
	dfLqQYp69GjjWjwIyRBuESOPPKeJsUZC2WPqN7ECZu7taHlqTqzttMGFWKWUlD6N32au
	enng==
X-Gm-Message-State: AIkVDXJWZx/RgQCJm2qKi00JfTsAQZyfo8k/TjRTfALuh0A3k0A7WXFmr3OTWuHIvs2Qa/yAtHKFgGqKP4p8yA==
X-Received: by 10.28.184.133 with SMTP id i127mr121148wmf.49.1484853476772;
	Thu, 19 Jan 2017 11:17:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Thu, 19 Jan 2017 11:17:56 -0800 (PST)
In-Reply-To: <20170119152109.15745-1-marex@denx.de>
References: <20170119152109.15745-1-marex@denx.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 19 Jan 2017 20:17:56 +0100
Message-ID: <CA+chaQcwB3_CY9AbyMM9DAYguBHC_C8JW72USFdG4Qfetsqs+w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] picocom: Fix build
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
X-List-Received-Date: Thu, 19 Jan 2017 19:17:57 -0000
Content-Type: text/plain; charset=UTF-8

Why not use EXTRA_OEMAKE to set these variables?

On Thu, Jan 19, 2017 at 4:21 PM, Marek Vasut <marex@denx.de> wrote:

> The picocom complains about missing GNU_HASH from the binary during
> QA stage, this is because the picocom Makefile overrides CPPFLAGS,
> CFLAGS and LDFLAGS. Fix this by passing those as an argument to make.
> Moreover, since picocom 1.7 now accepts VERSION variable and the
> UUCP_LOCK_DIR is set to /var/lock by default, drop the CPPFLAGS
> override altogether and replace it simply with passing VERSION
> argument to make to precisely retain the original intention.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  meta-oe/recipes-support/picocom/picocom_1.7.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/picocom/picocom_1.7.bb
> b/meta-oe/recipes-support/picocom/picocom_1.7.bb
> index dbee65609..0f85b3ec8 100644
> --- a/meta-oe/recipes-support/picocom/picocom_1.7.bb
> +++ b/meta-oe/recipes-support/picocom/picocom_1.7.bb
> @@ -9,7 +9,10 @@ SRC_URI = "http://picocom.googlecode.
> com/files/picocom-${PV}.tar.gz"
>  SRC_URI[md5sum] = "8eaba1d31407e8408674d6e57af447ef"
>  SRC_URI[sha256sum] = "d0f31c8f7a215a76922d30c81a52b9
> a2348c89e02a84935517002b3bc2c1129e"
>
> -CPPFLAGS_append = '-DVERSION_STR=\\"${PV}\\"
> -DUUCP_LOCK_DIR=\\"/var/lock\\" -DHIGH_BAUD'
> +do_compile () {
> +    oe_runmake 'CC=${CC}' 'LD=${LD}' 'VERSION=${PV}' \
> +               'CFLAGS=${CFLAGS}' 'LDFLAGS=${LDFLAGS}'
> +}
>
>  do_install () {
>      install -d ${D}${bindir}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


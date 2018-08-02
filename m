Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 837CE60248
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 09:05:36 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id c192-v6so1001650qkg.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Aug 2018 02:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r84Q+x337LY6SlA4DVu4SA+W4mK4Fxqq8S+jyFBWRbM=;
	b=WAUr9EiOFbUOdXDQLZL52/HN9sK8H/fpfq1qrxUdsQ0+aSUD6aXwpEInJopIfu2QZr
	DncvtG2C5pz3BU2KJ2Dr/oYtdaXC9BmgEtoMTeGB2ldO9GDs0m+1vmyem4iDSBUVIbz6
	KCrqU75fhq6X5+Cm7rMS8mMYfuG7qvP8mjSO/ZuKL5gn6qatjBqbjW/9Ea3Kxx2bs7hC
	ZfJQPmo6wROdNIJfOT8/rySjJGEYWDUZrUni4VQ0FKL+pcwGR51e0GgYFZxknXQst3jT
	9TcTGAI3seamm3wDQ2kjHBfBB39h8EqV1aKAZaLzl3wy9RZfFjpJJkbZwmV6krJwViBb
	a2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r84Q+x337LY6SlA4DVu4SA+W4mK4Fxqq8S+jyFBWRbM=;
	b=Eq5uwGS4qr4s/E4a6idK3BzPATd3IZlj2yd8tO610wEXRehYAqnjm0oPI4+EE1KMMs
	W5YYutFjTgYvPeQSis9YNM6Nm6g/noaoMe2QbEJLBjmWybHFLqoWeZzRcOPjJkooKcjW
	ro1lC7DcXGqeIq3h7GEi4bs7g1LpfjqnQ1ht78hGe2xqZH8R7+4PmuXTjxenkvg8yQEs
	VhqCR3cQ6bhwDdHek4Z8oLfyWT4wMKskIpu2uZWxctRWkdkm7p1j2jSCUIxipliPVO6b
	9UDqr5ugS8Ss1Av54Cx0V/eDCypf80+5q96L/wOeDbV6VnzvaTlxIxf0vIHpqI9zOpdW
	dipw==
X-Gm-Message-State: AOUpUlH55zv0vsqtY/8eX/sWCM14WAscx7NCHEOWbhOKnfTJ1WzC7iEu
	AwSuTlIOtab4BTT0VTTzxSQssDAtHR976xdndgU=
X-Google-Smtp-Source: AAOMgpeUZ6N2CKKGZsCmmn6SUIMk5Va32kp3es1I4NGkdxQPhX/AUKCEGdNy0ZcPu7j0ihNU7z3UQp4EznObEjpXNM8=
X-Received: by 2002:ae9:c00d:: with SMTP id
	u13-v6mr1575900qkk.290.1533200737158; 
	Thu, 02 Aug 2018 02:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20180802082018.116688-1-dmitriyz@waymo.com>
In-Reply-To: <20180802082018.116688-1-dmitriyz@waymo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 02:05:10 -0700
Message-ID: <CAMKF1sqe-mfHGwxi8A0yxnFVOeFG4mQxLyHNOLECn5G8gTHG4Q@mail.gmail.com>
To: dmitriyz@waymo.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] meta-python: make python-chardet coexist for both python2 and python3
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
X-List-Received-Date: Thu, 02 Aug 2018 09:05:36 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Dima
On Thu, Aug 2, 2018 at 1:20 AM Dima Zavin <dmitriyz@waymo.com> wrote:
>
> Signed-off-by: Dima Zavin <dmitriyz@waymo.com>
> ---
>  meta-python/recipes-devtools/python/python-chardet.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-chardet.inc b/meta-python/recipes-devtools/python/python-chardet.inc
> index 246a65aa6..1a85e7410 100644
> --- a/meta-python/recipes-devtools/python/python-chardet.inc
> +++ b/meta-python/recipes-devtools/python/python-chardet.inc
> @@ -22,3 +22,10 @@ RDEPENDS_${PN}_class-target += " \
>      ${PYTHON_PN}-argparse \
>      ${PYTHON_PN}-logging \
>  "
> +
> +do_install_append () {
> +    maj_ver=$(echo ${PYTHON_BASEVERSION} | cut -d . -f 1)
> +    if [ "$maj_ver" == "3" ] ; then
> +        mv ${D}${bindir}/chardetect ${D}${bindir}/chardetect3
> +    fi
> +}

Its better to do the renaming in recipe for python3 version of this
module for help see how its
done for cython

> --
> 2.18.0.597.ga71716f1ad-goog
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
	[209.85.219.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8CE605BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 21:27:41 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id f125so1201564ybc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 13:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P2XUkC7YDiCvBqcsnoRPaa/9ND1NZ4yBHmq4/+tHWO0=;
	b=EIXpDJuwDZV3YQxEBQHSUq654DcXR+scW0Hg8e+iykV4CzAwcbn+pzN8aJl+XfNR/q
	yE0JwjHVWsHMtrAM9HKYBo2KEkvOdqsuQUt2G8iTY7R4UBurfzXcteKwsp6T4JRKR5PI
	1rXeM4aHNmzR8rYeULo5Bt5NPBwAfQ2/RHVjLgxJF5A7nOATeQptjmNF2W5gtqpSGkcZ
	qhnsuALJQj2/m4h6TAtBisnoRyESYhghiUxrpYzShMxZQah/zVx9WGySdv4KiadL0qPl
	raq+zUiCZ/YZfRFuGZx4balYGILMayihPtQ1BukCcUD7AjGqNewOqBtWChGpNPVogDhI
	FSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P2XUkC7YDiCvBqcsnoRPaa/9ND1NZ4yBHmq4/+tHWO0=;
	b=Svo2QreE2vwn/tIo+Dwtc1/uzHWYGj1ld1YRzlV9TB39/6KzwnlqHlF7LItyfy3bzt
	eEOYuiyptdGtTRlu5m7aSiXQS/jLjlwJ7Gxzr1Vg8MHUV8vP2CV+/fxM77BGQH/RyhRG
	H3BbHiZEOTrWeTrLZ0iChfXiA8w58ftR6ozXjl2mkF+wPzgyz56p+Nk0smvobgmekk7Z
	54kZKU6pLouJJoHVWLqvnh4oXQ/6zXS9aP3N20Q40elyjf2ZzclH2gYAPmF+xR353z3G
	jwh6D5ahU/aItwLWWLnNGUBKWSIv6QxnR5BmbsY5Qa2CZkTOELsqrob+TTqql32bCepi
	awEw==
X-Gm-Message-State: AA+aEWZ+4fs1lqPhvTWPlrEa+9W6AVKh6qWry1MtlgFGVsoWeGhrnw/y
	dWZ4pv0BWq8oMbmFnFlsDOrrHE1Axhltlqaohjs=
X-Google-Smtp-Source: AFSGD/VDj0eWqRU46J+vpuE03Pz7SI+UJqE4OkH67qzt+miwsUXywqB6Khge7GYyJIATuSuLSsOF0GRr0ZQ8YkTle9U=
X-Received: by 2002:a25:5a46:: with SMTP id o67mr9319560ybb.215.1543872462088; 
	Mon, 03 Dec 2018 13:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20181203201250.23144-1-raj.khem@gmail.com>
	<20181203201250.23144-2-raj.khem@gmail.com>
In-Reply-To: <20181203201250.23144-2-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 3 Dec 2018 22:27:28 +0100
Message-ID: <CALbNGRSDw8uUhu49OgeSMrqyjW+69-M888zKr55rr4mHTsjmKA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] a2jmidid: Define own do_configure
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
X-List-Received-Date: Mon, 03 Dec 2018 21:27:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 3, 2018 at 9:13 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> waf script here does not support -o switch so define own which can
> be run in B
>
> Secondly, ensure to use python2
1. Why?
2. There is no python2 in sysroot Maybe it was doing it before but now
I think it makes recipe use host's python2.

Andreas
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-multimedia/jack/a2jmidid_8.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
> index 59b73f8e8b..7dcaaf6828 100644
> --- a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
> +++ b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
> @@ -23,4 +23,9 @@ LDFLAGS_append_libc-musl = " -lexecinfo"
>
>  export LINKFLAGS="${LDFLAGS}"
>
> +do_configure() {
> +    sed -i 's|/usr/bin/.*python$|/usr/bin/env python2|' ${S}/a2j_control ${S}/waf ${S}/wscript
> +    (cd ${B} && ${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
> +}
> +
>  FILES_${PN} += "${datadir}/dbus-1/services"
> --
> 2.19.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


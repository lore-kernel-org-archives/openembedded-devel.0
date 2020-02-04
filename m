Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 15A3361117
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 02:46:34 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id i11so19139820ioi.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Feb 2020 18:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GFULH7czgeAlAOU/KsQJy9zmofiOLljc0Q2D2bOkcyk=;
	b=iAHlW8yRls9Qt1g9d2uWBLzw0uruS6Xz56Th1Vj6SZK3LawgaHTPQatKv4Wwh48dQU
	hC3oAUApsBnwrbSNDqV2jmdFmeB3Ek2dNmtppNaH6Q7PPwR64y6LmGFfjxISwrNbxVdK
	nthVX91rmkAJH7wrdZs2dSHGRD824plWyHknATgrFHhij3Wemixkyh2pXweYraZ3NzYj
	UO+tco0qwb+eSRbAjdk0KMn1BAjAaahmZ78yULyX22+jw1j8KFRutexiw1vzB5Ko0k6K
	qeZCzx3/rV6UQzY7ahrT4EnprUL5pYUAK7aPSIGjVXn+SyS0o7Q/+30EV2JrvbBaFXg1
	8e/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GFULH7czgeAlAOU/KsQJy9zmofiOLljc0Q2D2bOkcyk=;
	b=okZYhoSTUsStHgCc/54OJ+XyKbDnLC3C86n1eFc3EtbC/U3fDdG/WKdP4NYxOzRyOh
	yeQbBuqViguuF5bnLlqWm5CQAIq00W3U0AlW002aKJnIzZd+qh2FjlPBHBhyum/aSDjf
	j5CPd4cK3/tBiO1CE4a+pqML1lSMzyWUflEDWuuOY3g1N0JPgj7/7r+GeXYDm9q1onXv
	DaS5bChuxIfsKVbjyC53rCBZ/xM+3zCZm3IG+bpGTD9GZqjuCN2VK+5YNsXYbNYgbxWN
	t+garwGYiWjifbwwthjlc5KX5P7uphcTISrWK/n1CO4mVM9OpQHYidxku4pHoz/oNfPc
	x8LA==
X-Gm-Message-State: APjAAAXuzGdx2nOkZr8d+6tbIo25w6/JyQ5y31BGT2QehArnLyUT7sW9
	0NATpeAgVUO9Dbt2KSOlk/6P1/a2YGg1nzmyAmY=
X-Google-Smtp-Source: APXvYqyWbamZfo73tfqWYgxRAfDCLbPTDKUX3BvEMjxhoKnMpEs6SUhbe7JKHumbuCjV04vf9QycEr8+CBL6VkG3j4w=
X-Received: by 2002:a05:6602:210a:: with SMTP id
	x10mr21483175iox.151.1580784395623; 
	Mon, 03 Feb 2020 18:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
In-Reply-To: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 3 Feb 2020 18:46:24 -0800
Message-ID: <CANx9H-BN5ZOwOzguYGG5sNH7DciEa=DUXAh1oj40iEYA2R03EA@mail.gmail.com>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][zeus][PATCH v2 1/2] python-twisted: add required RDEPENDS for twistd
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
X-List-Received-Date: Tue, 04 Feb 2020 02:46:35 -0000
Content-Type: text/plain; charset="UTF-8"

Thank you for sorting :)

I was looking at applying this to meta-python2 zeus and my checks (import
every twisted and twisted.* module) didn't see any missing dependencies
before this patch. Can you describe the need or give me a hint of a
reproducer? I'm sure I'm missing something.

On Fri, Jan 31, 2020 at 1:29 AM Trevor Gamblin <Trevor.Gamblin@windriver.com>
wrote:

> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> python-twisted is currently missing some packages for its /usr/bin/twistd
> executable to function. Add these to the RDEPENDS list, and also clean up
> formatting since the list is getting long.
>
> Note that a similar patch has already been submitted for master branch,
> but the python2 version of twisted needs more explicit RDEPENDS than the
> python3 version submitted to master in order for /usr/bin/twistd to work
> properly.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../recipes-devtools/python/python-twisted.inc | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-twisted.inc
> b/meta-python/recipes-devtools/python/python-twisted.inc
> index d70104dc2..024a9fa7c 100644
> --- a/meta-python/recipes-devtools/python/python-twisted.inc
> +++ b/meta-python/recipes-devtools/python/python-twisted.inc
> @@ -56,7 +56,23 @@ RDEPENDS_${PN} = "\
>      ${PN}-zsh \
>  "
>
> -RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface
> ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink
> ${PYTHON_PN}-automat"
> +RDEPENDS_${PN}-core = "${PYTHON_PN}-automat \
> +                       ${PYTHON_PN}-constantly \
> +                       ${PYTHON_PN}-core \
> +                      ${PYTHON_PN}-debugger \
> +                       ${PYTHON_PN}-hyperlink \
> +                       ${PYTHON_PN}-incremental \
> +                       ${PYTHON_PN}-misc \
> +                       ${PYTHON_PN}-pkg-resources \
> +                       ${PYTHON_PN}-pkgutil \
> +                       ${PYTHON_PN}-plistlib \
> +                       ${PYTHON_PN}-pyhamcrest \
> +                       ${PYTHON_PN}-pyserial \
> +                       ${PYTHON_PN}-setuptools \
> +                       ${PYTHON_PN}-unixadmin \
> +                       ${PYTHON_PN}-zopeinterface \
> +"
> +
>  RDEPENDS_${PN}-test = "${PN}"
>  RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
>  RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
> --
> 2.24.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


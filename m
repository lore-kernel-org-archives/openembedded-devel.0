Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id C0213600A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:29:03 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id f5so2894777ilq.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 04:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yj94y2p+u1vLcRMbtNjujr5Z6i6XB5aKX/aEUagyXt8=;
	b=TiS032jVQxrtezO0dD/iSjOJAFvSg1qfqprd2JOkMAkShdoOuYBT6hx9z7FqdLyecn
	/xIJnC1JVL6oO9NZETbxxmOrlFDrNmraNc5eDYTaZt7eawecydvSHbxFRUrpic/Grhmb
	74TkWNyTl0tWVBO8h5s+D+Q5hyeTGGF53onfekouZzGxXHoN/h1ZsqsVm+zcQW/OJVfi
	VxVTECBS1rW+yr7sxPXD0I6l4loZRk89l+8ehCMdNz2EQFtB34k4soN4RTgu2ZxdKCCW
	rWKjbIrm7IMLi1rkbHgGiETR3RZVJmf6GMGJkAdp+X34h3SBg5zDfiH4T/hRfEvU0Fa0
	3esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yj94y2p+u1vLcRMbtNjujr5Z6i6XB5aKX/aEUagyXt8=;
	b=S7ChlkedxrX5T4GkOUHyCI3Ajw0x4C1kj5ew3KukISUoOlWlHP2vWvR1A0mTc/AqoX
	6YTP3FOhswL8LQREfLdsnIll3FBbasHOH7cMVUWxMkm/eItLASSA2ER2LIOuvfKgqfhS
	ZxAG8i/imXON3IpNAvOF5U/chXUcCT1fGd9i8Z4R8GwDq5Vq2zc1ilnsLzPOTg+CBbu1
	k15h8THh08rjYrmFqoK7STcO5SvJyrQe27YKqZbin7BRipdvb0qVqvG5iT9Sox5eEv1F
	tfbVhu/9/1oQXH5ZvPbYmnHQl7RJbLEqXMdFOs/6PVrQ5g5J/YeMf1I7lpoCENGLVO+C
	dW4Q==
X-Gm-Message-State: APjAAAXu1SBBf0twr7dMUhF3mcOjA3AD47AKep3WvWMonwBq3vGxSoK2
	L7JNbP6EWS1RC8711Uh+YynE57k1bm/Dml4mAgEorJYZ
X-Google-Smtp-Source: APXvYqyz0rSIHoBGiau/TdxsMVXXjBwt+i0Fj9FcoSggwqOXXwrsKHn+/qrgvQ8pwCI/xqsN8nvSKN1dLQLVODXb4pw=
X-Received: by 2002:a92:911b:: with SMTP id t27mr2924569ild.142.1580364064033; 
	Wed, 29 Jan 2020 22:01:04 -0800 (PST)
MIME-Version: 1.0
References: <20200127204322.143707-1-trevor.gamblin@windriver.com>
In-Reply-To: <20200127204322.143707-1-trevor.gamblin@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 29 Jan 2020 22:00:52 -0800
Message-ID: <CANx9H-CZe5bCG-tv2YVkEiQy=PVPYPHhw6n9AcghP+dZ1yBogg@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][zeus][PATCH 1/2] python-twisted: add required RDEPENDS for twistd
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
X-List-Received-Date: Thu, 30 Jan 2020 12:29:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 12:44 PM Trevor Gamblin <
trevor.gamblin@windriver.com> wrote:

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
> index d70104dc2..f55bbb033 100644
> --- a/meta-python/recipes-devtools/python/python-twisted.inc
> +++ b/meta-python/recipes-devtools/python/python-twisted.inc
> @@ -56,7 +56,23 @@ RDEPENDS_${PN} = "\
>      ${PN}-zsh \
>  "
>
> -RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface
> ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink
> ${PYTHON_PN}-automat"
> +RDEPENDS_${PN}-core = "${PYTHON_PN}-core \
> +                       ${PYTHON_PN}-zopeinterface \
> +                       ${PYTHON_PN}-incremental \
> +                       ${PYTHON_PN}-constantly \
> +                       ${PYTHON_PN}-hyperlink \
> +                       ${PYTHON_PN}-automat \
> +                       ${PYTHON_PN}-pyserial \
> +                       ${PYTHON_PN}-pyhamcrest \
> +                       ${PYTHON_PN}-debugger \
> +                       ${PYTHON_PN}-unixadmin \
> +                       ${PYTHON_PN}-pkg-resources \
> +                       ${PYTHON_PN}-misc \
> +                       ${PYTHON_PN}-pkgutil \
> +                       ${PYTHON_PN}-plistlib \
> +                       ${PYTHON_PN}-setuptools \
> +"
>

Please sort this alphabetically. It is MUCH easier to see what is present
or missing that way.

+
>  RDEPENDS_${PN}-test = "${PN}"
>  RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
>  RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 87CCE7C1A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2019 00:37:57 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id y20so5185727qtm.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C2FP+DcB13cXzDPGQmta3RKfa03iBz1/39b3z23YMOU=;
	b=kG21K/rMa1DMhtgqrZ54zZCgX1oLNJ5fGkaEIIKScAuwTazTcwi8qJDB3Uw28zA21J
	0GveBYc6aAICZOB0Ac9P2wc6xaIYqM/Wh6Tu/PVSAWzJmQmJweTb0eu+WKkONcQbpGe6
	oGSurR6aOjo+UtI1QAukMGtFgugfeOZhXPx9gGv9o9PDMAQW8xNq2mRwvm5zR3fnpew+
	y4B24VQz2k/Q0tUl5ATPqA/gGKm+xHdNiomH6PCiT+kNJfjehc2zdv1EOBidZY5Wwpji
	3voZ+ildtMcieiAkmtOlWi9uAR3x9UbT6WbWIauQxjJKOMJ33bPf719RWwJ+GxivYa/M
	AbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C2FP+DcB13cXzDPGQmta3RKfa03iBz1/39b3z23YMOU=;
	b=HNmFUlGcMYioAvWSXeW/AOKOzN1ZL+f/Kv8+ChSBU/4heu7N66LZwAumegzBRUj9OD
	aZhHOFNJX9Y4Ywz7dL7PWlgzGEYZu4gqxElVQVqJKUO88qbCxK9Vu372yV9Mos1W7Rg5
	F+yn1DDKJ/ik3QhraKe+c7zgE3WBGOB5UVkt8v3jvUnIOfZehDEnrbWmI5M7szAC7Zso
	ZSgREOqgQmacWlSrLaW5y9tYY6URQtsc7NSWAEqYyyNpEAeZyTVEiDNWS1Jovcld8IHp
	q5oxNHBex3DN0Qde2Ruc+0RuSU1DQV86CrxjYBsBp+5pGbeu1yjl506mTT3FzXk3IpAO
	1PkA==
X-Gm-Message-State: AJcUukdOL7bwRWp8IYDRxUStbfNqNj/WiYyU2C48FJr1qCj4SQj8+qY0
	wJ0d6y/aHQrF/g9obzo/as7t7qWHH/jNmmknW9E=
X-Google-Smtp-Source: ALg8bN5t+KW9WakWh88loU8r9YHhnVUZo9XR4daHh8/JpV9CeJIoiWJP0qbf3st/3m7kyUmwup8FKqK1upDID1t0W48=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr4973653qtn.254.1547599078086; 
	Tue, 15 Jan 2019 16:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20181003055751.174763-1-wak@google.com>
	<20190115235626.10181-1-wak@google.com>
In-Reply-To: <20190115235626.10181-1-wak@google.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Jan 2019 16:37:31 -0800
Message-ID: <CAMKF1souNThopyJDaR_OMxC+jH5340yL8ux2xiSFU5GqYYf_Hw@mail.gmail.com>
To: "William A. Kennington III" <wak@google.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] cli11: Add recipe
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
X-List-Received-Date: Wed, 16 Jan 2019 00:37:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 15, 2019 at 3:57 PM William A. Kennington III via
Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
>
> cli11 is a c++ command line parser library that provides a simple
> user interface with modern c++ semantics.
>
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  meta-oe/recipes-support/cli11/cli11_1.6.2.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/cli11/cli11_1.6.2.bb
>
> diff --git a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb b/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
> new file mode 100644
> index 000000000..507824def
> --- /dev/null
> +++ b/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "C++11 command line parser"
> +DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
> +HOMEPAGE = "https://github.com/CLIUtils/CLI11"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c271fee3ae28e11b24b97284d9f82887"
> +SRCREV = "bd4dc911847d0cde7a6b41dfa626a85aab213baf"
> +PV = "1.6.2"

We don't need to set PV in recipe, since recipe name itself is
communicating it already.
maybe adding

PV .= "+git${SRCPV}" would be nicer since it would ensure that there
is a dep on SRCREV

> +
> +SRC_URI += "gitsm://github.com/CLIUtils/CLI11"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +inherit ptest
> +
> +DEPENDS += "boost"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


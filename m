Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5D861173
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 04:30:43 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id e10so18424096edv.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Feb 2020 20:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=51GGKjV9lA5IAuXOpfK1rMQpqzqwNgsRWy3m0KaxqBk=;
	b=Y4hwKBzK5sa8p9DXDiaNxYQVIUU9NxGaiNzviUfzaPbJ2gB7StgopLMb9BV3aSYPeQ
	bS7Xya4PZF7Qi+n19nl4Y8hUGPZ7mJYhaJNiAfog3todbESUhFEZjF0mMfZGgWRLzzvh
	IVRsEs2it4chfxrCn/7brrBNsDthv3IFgpdz13zAIhFnTmkgxUtcKmPkL5pTT8ytf6Su
	ChFX/xVzstD6ufFFF66c8yMduegcvBh9aSPkReDl6gPVh7zH/iM2O69y5Wcok/x4Fwt+
	61aM/gPbUGB2dwNPtTNtbOGwl/TP8vRjxugYYKV2oe6UQnSxA2VU5GrWXxP3N0QeAQnz
	RpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=51GGKjV9lA5IAuXOpfK1rMQpqzqwNgsRWy3m0KaxqBk=;
	b=Si/TFWuyCJ3fsRGb9IdaQfTL2Dlhyt9rxp3Pdydp4OEbu9Fq3+qe92vApe6YDMbtXy
	fEf5DZtET1yB81LbsYirdiSw9rQhk7HOTRgGrMv5sLDhK3+A6vpBe6HXyAGNmbdB+fsW
	YlzYMB8Tk87jzn2zXP/rll7IX+qXDg1tKskW/lzJ+MuUQM4vxgTq8CsR+YeONI6Nnojc
	GQRIWHW3xmbsfdFQzQvLj4ORAAEPKa6hhpaD7o5FbiK4kssV38ddnTOSnEalZyU9qiu+
	qmJhUaeBe/l0iK2SrmZBL3+jRDUa3MJ3/PrxQd4YCWgZ/vsLeC0s6OG3PcSOtBQjF7Ez
	Rcfw==
X-Gm-Message-State: APjAAAXr1J1tK6F6l99srZ1WCaCHZpw9taKeuNug7+MUP02kYZDj+Wrz
	0t5LqArm5INQdH2IbZCJS3bVZztIeoEpxlnrosuIffsm
X-Google-Smtp-Source: APXvYqxudqxKXOZtOUuSRJHH3R3W/HAZJz3RaLbU7HLrrWN8pLvRxo20VtqWh3MSMz4XjFfNbM0m860aprWmw2XqS7c=
X-Received: by 2002:a17:906:b301:: with SMTP id
	n1mr24228497ejz.285.1580790643854; 
	Mon, 03 Feb 2020 20:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
In-Reply-To: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Feb 2020 05:30:33 +0100
Message-ID: <CA+chaQdLL1BnAD7Yg3=MJxjxUEOGcZoUvBodTgYCkjTAHTspXQ@mail.gmail.com>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 04 Feb 2020 04:30:43 -0000
Content-Type: text/plain; charset="UTF-8"

Please send this fix to normal meta-python in meta-oe/zeus:
http://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-twisted.inc?h=zeus

BTW: Why are you using meta-python2 with zeus branch? It imho doesn't have
anything which would be missing in oe-core+meta-oe zeus branch and fixes
like this should be resolved also for people using zeus branch without
overlaying them by meta-python2.

On Fri, Jan 31, 2020 at 10:29 AM Trevor Gamblin <
Trevor.Gamblin@windriver.com> wrote:

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


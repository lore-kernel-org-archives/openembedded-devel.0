Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id CD6657D651
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 20:34:14 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id t28so8959502qte.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 13:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g4jh9yqPZuiz+G2lL3O3Gik+cDbVkkRCmPJSqJvwWVY=;
	b=tBReDD7gHKdQVUbTbksRNcnUQ3M2TdzV1DFd+saQyrQSbwBdibxStZM5TQTVA+Cf6j
	KOKgvWQ6dguPCMfZM1qGTOfgSpVFHjv2dEmWKKNz+pdtiCJfJQvr6nLzjt/cSycM4rfX
	ZZw3SgZwmb/l06zTmB+BgQR8nenKd6qrxjOxhug7y9KX6Myu2y02iAhOe4BmzqBGsKYY
	+cCZOibvMO5ep1lFJp76NbdM1wIrpxw2hdzSwchNGfBWuJOKOjfvSOsIAAciL9xl3E+0
	UDMy2eyN2PfCrAuG0o+RMYCQw0pr6HLVsf73CuhxyFKs7ikJAzqT4N0CwbSX463/P0CQ
	2jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g4jh9yqPZuiz+G2lL3O3Gik+cDbVkkRCmPJSqJvwWVY=;
	b=aGodpphcXk6zOQY2VXY6b2W6+lktOEcRQ+EcjHDDUUxmDgcsaNltBTQBEIirx+BLi6
	3kkmiqPeiq2o57fAPb/g5sc3gTUun3KGHNSnt7I7jvhlnuPpq/Z2zgrfdsR/vnrdCBCR
	oTQdIMaJLlfC4lzzpCAk6LXfEZbCkbpRnjGmXi32hgIFMss7V3z94Y/u2Y9Qw4j+K3qg
	ncIwEijEmHcLD7mtLuuzUlqnB8aGA0PyJTJP604WmXPE8CANpG9O2oCfzEG5aTX2xdKp
	Yvuid5xIiui5iyUDnFHVFbK02ddUgyvhRJw6qmBztQiKb2Gl1afsk/cHojHxFiXcnwU5
	/sIA==
X-Gm-Message-State: APjAAAXiPSc5fYH1FgcmFRrgljUArSQpd5xQb0WNc0LzvmjlG8WJPErL
	CNBvvqLDmg25ef6+WKnEUVKsBSDsZPmycO4kNWM=
X-Google-Smtp-Source: APXvYqxZZdcdI8L2qhINu31jR8P2wohbW3uBjyAO/257zK+H+C/QPrHfUqHyarGpVNycG6WJo3qYXRFcP3LMUXUBVkU=
X-Received: by 2002:a0c:81a9:: with SMTP id 38mr11894508qvd.208.1554496455415; 
	Fri, 05 Apr 2019 13:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <1554487209-29330-1-git-send-email-cdgarren@indesign-llc.com>
In-Reply-To: <1554487209-29330-1-git-send-email-cdgarren@indesign-llc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2019 13:33:49 -0700
Message-ID: <CAMKF1spZ+BGWr3oPCCmdcHo-8Tr7bSbvMdW8LDpat7bgz5SdFg@mail.gmail.com>
To: chris.d.garren@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-cryptography: Add -pthread to link flags
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
X-List-Received-Date: Fri, 05 Apr 2019 20:34:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 5, 2019 at 11:00 AM <chris.d.garren@gmail.com> wrote:
>
> From: Chris Garren <cdgarren@indesign-llc.com>
>
> This builds openssl which needs pthread_atfork(),
> but it's not linked which results in runtime errors.
>
> Signed-off-by: Chris Garren <cdgarren@indesign-llc.com>
> ---
>  meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb | 2 ++

We are on 2.4.1 on master, so please rebase it, secondly do we need it
for python3
recipe as well if so then move the fix to python-cryptography.inc

>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
> index 9c2f884..ce7b5ab 100644
> --- a/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
> +++ b/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
> @@ -1,6 +1,8 @@
>  inherit pypi setuptools
>  require python-cryptography.inc
>
> +LDSHARED += "-pthread"
> +
>  SRC_URI += " \
>      file://run-ptest \
>  "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


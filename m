Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id D3DAF605B3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Dec 2017 13:51:40 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b199so22192199wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Dec 2017 05:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aso5CqF8k7lo0FTrM+qfvvqPJ3xmjeQeDu2XJl4bNp8=;
	b=X/cjF0YpxUL2zK1Qw4S8noAdrf1yH+xvWfJMzRHNEADnPnk+8IQv0c4RIS7m7uNQlI
	oXDwUTQKlLeb2y4iaEqbgCha6g3x8lvQuS/LP/wqnR4LRNJRsy2cUoUBzyLafqercWoq
	Tmtp8KDdK7OZ4Qh+C+9GRNcRt/yJvPVuxOPuDN9Q5100TAdvXEDZlM7cks7F7npjmWsO
	kG8vAZPryMwHBNuu8WJMmXoMauU8GvHzVCCFq7lRsMjs8YY7fBroQlZkPL9RjhHPDH6K
	oegYAfTNiGrFdP250bv4LW1+1sfL6f8xZWgmDW/vY+qofswC/baWzFPUI8+r8HSCqosz
	rYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aso5CqF8k7lo0FTrM+qfvvqPJ3xmjeQeDu2XJl4bNp8=;
	b=AtBrVCy/Eq/IgybaZ/zSQB+avUBSM/5Cteh42D4vz5EuteTtoxHo56QBGz8HjrM8k6
	o7Ux3BKHN16XCxss7YRk8/DHT5ApYpCart6HW6dOJ+Jhg8Ytnvt2RKjuK0QT7TCcDQh6
	8rUOu0rbt9nDKIvyg0jA2lOuSzzDvUXFvo5cievNwpPoa4vATb/twBdxCxujPm8Br5xG
	eWMxYWAvW9LoD5a0oSAoJBzHdTSqr0iF6n6d0jLBkGIuhoPQOkMys2zRCb8lyPPAk9zj
	PxCBXfXH5o0dg6N22/Owubzu2itWQwiGT11FBeqBaUk5QTpNtkfSnbeFv8cpV8IjU4ls
	o7Mw==
X-Gm-Message-State: AKGB3mKJER1DnqhXIMKWbTnsnnmGepyIdeXa+eCwUdOj+SIHCyAXUXYP
	Uy+Le9Bu0mfF69ahtU/jhsuebRhA6ZV11H2aOhg=
X-Google-Smtp-Source: ACJfBotHTs3sl07UCaKbR0mDZiaQxbe5r0GaCuJ2rifu/Lxl2ARC2Y3S4hVRNpevqOBOb2TpIUBEot+ITaFSDkVtaHQ=
X-Received: by 10.28.27.206 with SMTP id b197mr8191176wmb.96.1513432301505;
	Sat, 16 Dec 2017 05:51:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Sat, 16 Dec 2017 05:51:40 -0800 (PST)
In-Reply-To: <20171216104544.23324-1-dariusz.pelowski@gmail.com>
References: <20171216104544.23324-1-dariusz.pelowski@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 16 Dec 2017 14:51:40 +0100
Message-ID: <CA+chaQc4TeOyEnpWhYJi6m_6FNk47JYb3Z6eZ3oz=oFK23TW6w@mail.gmail.com>
To: Dariusz Pelowski <dariusz.pelowski@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] meta-networking: virtual/db dependency corrected to db
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
X-List-Received-Date: Sat, 16 Dec 2017 13:51:41 -0000
Content-Type: text/plain; charset="UTF-8"

There are already pending changes for this.

On Sat, Dec 16, 2017 at 11:45 AM, Dariusz Pelowski <
dariusz.pelowski@gmail.com> wrote:

> db doesn't provides virtual/db anymore
>
> Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> ---
>  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 2 +-
>  meta-networking/recipes-daemons/postfix/postfix.inc             | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_
> 2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_
> 2.1.26.bb
> index eaa453d91..64d1a76d6 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Generic client/server library for SASL authentication"
>  SECTION = "libs"
>  HOMEPAGE = "http://asg.web.cmu.edu/sasl/"
> -DEPENDS = "openssl virtual/db"
> +DEPENDS = "openssl db"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
>
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc
> b/meta-networking/recipes-daemons/postfix/postfix.inc
> index a588bd347..75cf13795 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -6,11 +6,11 @@ has a definite Sendmail-ish flavor, but the inside is
> completely different."
>
>  HOMEPAGE= "http://www.postfix.org"
>  SECTION = "mail"
> -DEPENDS = "virtual/db icu libpcre openssl postfix-native \
> +DEPENDS = "db icu libpcre openssl postfix-native \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '',
> d)} \
>  "
> -DEPENDS_class-native = "virtual/db-native icu-native openssl-native
> libpcre-native"
> +DEPENDS_class-native = "db-native icu-native openssl-native
> libpcre-native"
>
>  LICENSE = "IPL-1.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


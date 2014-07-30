Return-Path: <raj.khem@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7CFA96AC95
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 06:49:50 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wp18so243816obc.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=M2rNrZFVw/29dGeOY5lIWK6WMk6HlEB6T3grEZGRjoE=;
	b=UyfnL3shfV+aFuV0PhzZHuM/siM8Sj95xpBK5Wtb+V+u37WpBKPbw42LmMyETpwqzT
	t4vWfPbrF4eYXJxz4d0Od8nOv5GmT7NNZVLQr6iPnMt8TnAys0rf67c22cTg6EQzSOLW
	zUZMnYu5sJPKtMTVf4CXZYfFDB9KVqnpau8st15sk/TTeJLo0yTVtnMO/6/PUXgWi5T3
	XVDzHLJxGwZ3FFcSh5xF+2xqvQMeUmhXPJr1QRFUXDkX5xxU0MpiYpF//YgrvoDy4zJ4
	8KzC4k7v4Ezj7c1j7ISUY2yqBZbwc9IGKG0/2exDXrbWrEy/yUTbS5QdYzLHfyVaLDGU
	v7iw==
X-Received: by 10.60.43.196 with SMTP id y4mr2806733oel.60.1406702991144; Tue,
	29 Jul 2014 23:49:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.85.77 with HTTP; Tue, 29 Jul 2014 23:49:20 -0700 (PDT)
In-Reply-To: <1406700643-5816-1-git-send-email-rongqing.li@windriver.com>
References: <1406700643-5816-1-git-send-email-rongqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jul 2014 23:49:20 -0700
Message-ID: <CAMKF1sppmXVJj8tkDv4=JJN1jkirMZuJ5pimJDoifcZyikaJRA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-python] python-slip-dbus: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jul 2014 06:49:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 11:10 PM,  <rongqing.li@windriver.com> wrote:
> +SECTION = "devel/python"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
> +SRCNAME = "python-slip"
> +
> +SRC_URI = "https://fedorahosted.org/released/python-slip/python-slip-${PV}.tar.bz2"

You could use SRCNAME in SRC_URI as well instead of hardcoding python-slip

> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +SRC_URI[md5sum] = "fb3299d75af1a67ca6679d96ce839da6"
> +SRC_URI[sha256sum] = "f47361ec52b608309b83c71905e692b6b363eaf3b8a7afdeff866cd94463ad5c"
> +
> +do_compile_prepend() {
> +    sed -e 's/@VERSION@/0.6.0/g' setup.py.in > setup.py

could this somehow use PV and not 0.6.0 hardcoded ?

> +}

may be also run the recipe thru contrib/oe-stylize.py for formatting
and structure.


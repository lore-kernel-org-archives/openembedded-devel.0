Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id AC8C578C3B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 19:52:24 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id q12-v6so2814447qtp.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 12:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oICP285ryvIaYoZoOGELPaa8U+hzZOs3gjEyRrXkq4c=;
	b=XzlwdRL0oyLOfF72uxANr+RYXBMCsi1Id5UvVrRxHglgrx+J4gTGZF19LbD4VbbX2a
	S+cKulCqpZjXQ52rzWeUiw16OZsrz2yFPmzDmPvJera6z6LZc+ryJvJo242kftP3f8yJ
	9QN0mzkagpJVrvS2zVE32cUXviteInHx7DSJ7RHp+KxzA585pplGpQ9g/YCniwBM5tap
	TVl6V4stTOacdFmca5m93rY0rkfj34uHTWFLqQ7PGhwdLoEIXPCpTLq8u8pAOYETkzvs
	yV1sZtq3MIlcrG3naO+wu3XtoUT3UTyE2wzq4jWn8ep43qxS8yOpqTkMNHgMH5APP2KT
	xSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oICP285ryvIaYoZoOGELPaa8U+hzZOs3gjEyRrXkq4c=;
	b=IsFTRyXSHdiXsH8CyYOuOt/DwFcOFBHCRl04N51e2sxjtnHCA/uf1vasSNy/2s/Csd
	bDnWvIWn+RiQ8vZfFhvZJLhOsmI5O8T6x19FK1wnBT34KhfdMyTxn/afJubafv7aMKvv
	wYhqLvjTR9x00koSMHkMf7/94F4hLOYNvpJSSdJ65V+LAU2TwTpCyoN4cvkmtojLIspV
	UVRsp3yFBE5apYjJ4WMCtvjH7YhjKKrk/zSH4tlbKZddhhg8uiYWYYA00++YkB0xasbk
	8TQocsCjW8nMvKp0HDFIY+lld2Hxw+RuwbYXyGZE7ZzPwrhhzmrkHv6XYrhyXx3llE1t
	AJdQ==
X-Gm-Message-State: AOUpUlHwomiSOWu5+otOHKvG4J/wLtooY2T3J4ayAN8J5xCWHP+TXim7
	HyhcS71Ko0xDMcp/gSF2ZgjhJVyoUw+FwsI21sw=
X-Google-Smtp-Source: AAOMgpd6tDC+CK0HK7TS6NqoJiCYmx8QCt5gil5akE6LsOZSZzzcA5KUWoP+rOtLjFHgKBCvRRi82Ihb5ddQUTPPxNI=
X-Received: by 2002:a0c:983d:: with SMTP id
	c58-v6mr3016687qvd.221.1532634745169; 
	Thu, 26 Jul 2018 12:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20180726183413.17793-1-lukaszgardon555@gmail.com>
In-Reply-To: <20180726183413.17793-1-lukaszgardon555@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jul 2018 12:51:59 -0700
Message-ID: <CAMKF1sowd+zMuuEZuH1hzmpQTjQ5u4Ta=+MnUFbWoY-dAv=KbA@mail.gmail.com>
To: =?UTF-8?B?xYF1a2FzeiBHYXJkb8WE?= <lukaszgardon555@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv4] python-tornado: upgrade to version 5.1.0, added setting PV in recipe to support fetching from pypi.
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
X-List-Received-Date: Thu, 26 Jul 2018 19:52:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2018 at 11:34 AM lukaszgard <lukaszgardon555@gmail.com> wro=
te:
>
> From: =C5=81ukasz Gardo=C5=84 <lukaszgardon555@gmail.com>
>
> License-Update: Change license file from setup.py to
> LICENSE, based on the same the same license policy Apache 2.0.
>
> Signed-off-by: =C5=81ukasz Gardo=C5=84 <lukaszgardon555@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python-tornado.inc    | 8 +++++---
>  .../{python-tornado_4.5.3.bb =3D> python-tornado_5.1.0.bb}  | 0
>  ...{python3-tornado_4.5.3.bb =3D> python3-tornado_5.1.0.bb} | 0
>  3 files changed, 5 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb =3D>=
 python-tornado_5.1.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb =3D=
> python3-tornado_5.1.0.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/met=
a-python/recipes-devtools/python/python-tornado.inc
> index 29d10da6b..a6a082dec 100644
> --- a/meta-python/recipes-devtools/python/python-tornado.inc
> +++ b/meta-python/recipes-devtools/python/python-tornado.inc
> @@ -4,10 +4,12 @@ By using non-blocking network I/O, Tornado can scale to=
 tens of thousands of ope
>  polling, WebSockets, and other applications that require a long-lived co=
nnection to each user."
>  HOMEPAGE =3D "http://www.tornadoweb.org/en/stable/"
>  LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endline=3D15;md5=3D8=
d463fc66ff8f275354ffe88d1896e12"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>
> -SRC_URI[md5sum] =3D "a5fc7fd4aea94867609a491ce65786f1"
> -SRC_URI[sha256sum] =3D "6d14e47eab0e15799cf3cdcc86b0b98279da68522caace2b=
d7ce644287685f0a"
> +SRC_URI[md5sum] =3D "bd264851c409f926d1dae1ad5055d28d"
> +SRC_URI[sha256sum] =3D "4f66a2172cb947387193ca4c2c3e19131f1c70fa8be470dd=
bbd9317fd0801582"
> +
> +PV =3D "5.1"

why should this be 5.1 ?

>
>  RDEPENDS_${PN} +=3D "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYT=
HON_PN}-email \
>                     ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-j=
son ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
> diff --git a/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb =
b/meta-python/recipes-devtools/python/python-tornado_5.1.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
> rename to meta-python/recipes-devtools/python/python-tornado_5.1.0.bb
> diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb=
 b/meta-python/recipes-devtools/python/python3-tornado_5.1.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb
> rename to meta-python/recipes-devtools/python/python3-tornado_5.1.0.bb
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


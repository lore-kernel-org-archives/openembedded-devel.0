Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 69D337893C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 19:28:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1532460493; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=lX9E5O06VRIIAgQDeAlgA7edPj2BprXFxrQw+dcLY1w=;
	b=tji/9rGT48zw+ug/+qrlNmJ55iRqCNT85F5xXnKh9ievqsy/ICIgaeVqnFc6mKLPt6oDSRvT
	hc7X3lHGrmlt/m3gn1kCo2EQUbcTa81ot0MnjKrm3Aw8OgLccXWMQVe+Q0XvS8j4CR9I7Upg
	3pssNL3JP9vPRWPKxOa44Vgc+BY=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mxa.mailgun.org with ESMTP id 5b577dcb.7efc3c408130-smtp-out-n02;
	Tue, 24 Jul 2018 19:28:11 -0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id k16-v6so4367124iom.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 12:28:11 -0700 (PDT)
X-Gm-Message-State: AOUpUlFttr1t1MBP0sO2p9DrNYMmvQFa2Zmxg5mictBbkmqRlitYcq7/
	bkwu5v/mMgKQhcYqG4IaRpXHu8vHuUisKuqlEZc=
X-Google-Smtp-Source: AAOMgpfakrLVBEnBVm1OiN7N0CxcCG4CEw+2q0ZHN8vf+3rTeRc/uap8CFJZXp6wKtR06qpjjC8w5CBg5X/lpmAY37s=
X-Received: by 2002:a6b:e403:: with SMTP id
	u3-v6mr5260945iog.131.1532460491082; 
	Tue, 24 Jul 2018 12:28:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:8c4e:0:0:0:0:0 with HTTP; Tue, 24 Jul 2018 12:28:10
	-0700 (PDT)
In-Reply-To: <20180724183302.21403-1-lukaszgardon555@gmail.com>
References: <20180724183302.21403-1-lukaszgardon555@gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 24 Jul 2018 15:28:10 -0400
X-Gmail-Original-Message-ID: <CADNbA1rJUAt5GMHeYA-H1dz9_Xb2j41d8+d8Uw+UjofRXBiwpA@mail.gmail.com>
Message-ID: <CADNbA1rJUAt5GMHeYA-H1dz9_Xb2j41d8+d8Uw+UjofRXBiwpA@mail.gmail.com>
To: lukaszgard <lukaszgardon555@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-tornado: upgrade to version 5.1
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
X-List-Received-Date: Tue, 24 Jul 2018 19:28:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the recipe update.  Could you provide a quick explanation of
what caused the LIC_FILES_CHKSUM to be updated? See
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Describin=
g_license_changes
for more details.

On Tue, Jul 24, 2018 at 2:33 PM, lukaszgard <lukaszgardon555@gmail.com>
wrote:

> Signed-off-by: =C5=81ukasz Gardo=C5=84 <lukaszgardon555@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python-tornado.inc      | 6 +++---
>  .../{python-tornado_4.5.3.bb =3D> python-tornado_5.1.bb}      | 0
>  .../{python3-tornado_4.5.3.bb =3D> python3-tornado_5.1.bb}    | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb =3D>
> python-tornado_5.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb =3D=
>
> python3-tornado_5.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-tornado.inc
> b/meta-python/recipes-devtools/python/python-tornado.inc
> index 29d10da6b..b40d0912f 100644
> --- a/meta-python/recipes-devtools/python/python-tornado.inc
> +++ b/meta-python/recipes-devtools/python/python-tornado.inc
> @@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can scale to
> tens of thousands of ope
>  polling, WebSockets, and other applications that require a long-lived
> connection to each user."
>  HOMEPAGE =3D "http://www.tornadoweb.org/en/stable/"
>  LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endline=3D15;md5=3D
> 8d463fc66ff8f275354ffe88d1896e12"
> +LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endline=3D15;md5=3D
> aff6d41a5e0da5827d1494624bbd683d"
>
> -SRC_URI[md5sum] =3D "a5fc7fd4aea94867609a491ce65786f1"
> -SRC_URI[sha256sum] =3D "6d14e47eab0e15799cf3cdcc86b0b9
> 8279da68522caace2bd7ce644287685f0a"
> +SRC_URI[md5sum] =3D "bd264851c409f926d1dae1ad5055d28d"
> +SRC_URI[sha256sum] =3D "4f66a2172cb947387193ca4c2c3e19
> 131f1c70fa8be470ddbbd9317fd0801582"
>
>  RDEPENDS_${PN} +=3D "${PYTHON_PN}-compression ${PYTHON_PN}-numbers
> ${PYTHON_PN}-email \
>                     ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html
> ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
> diff --git a/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
> b/meta-python/recipes-devtools/python/python-tornado_5.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
> rename to meta-python/recipes-devtools/python/python-tornado_5.1.bb
> diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb
> b/meta-python/recipes-devtools/python/python3-tornado_5.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb
> rename to meta-python/recipes-devtools/python/python3-tornado_5.1.bb
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


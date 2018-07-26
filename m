Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id B4C3378C5A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 20:02:01 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id f18-v6so2850807qtp.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mwohaDcVB3oqI5hG7bH9mJVjiuN4SOV/eu94mP+AVqg=;
	b=gmlaVm0uo3qbm8qRyDnQsLC2vqn5Scme6ViA4gD/PQOfS6kV4TlVdtKSpSiM4Q1hhI
	ZpypckVW/v/qadaIZOF5A1f3bh+1BKIHqNoHhWqh9rV7kNuW80jlxCymirN4Hl8rC8eo
	HiObBA9B7ySRI8YS/qhg27f5mAp9kbnI3bZ5TtKQPcHnJmvnKaKq3g0WxXMUtIcUE8UH
	IfPi+YHeapDs9pgTlZ/rLVjE71D1FSCNwtRFUUdeBptk1ZXHANIpU1n5XmS8oedpLZyD
	VCNP6ewcJO0E/5XXjsO8u8mUONnEqWxbyRv5TM8AgL9mrk15Hd/mxWDKbX207lEY5Cr4
	MHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mwohaDcVB3oqI5hG7bH9mJVjiuN4SOV/eu94mP+AVqg=;
	b=L9aTRYhp41n0Nc0DHcQOMz5Skcw3Ho8iRzbjmOi/Mz1iKvhjPJXvH6EMTrzrs+r+ZG
	RcazRoivIdfoS+JIW2EeP5MuNXSSIVsNZkO2idD7ViCGYVJuPQjKezvW1SFFPpzlFFhK
	6oWUAFuEMgzYJAK4rHiB2pZAn0a8yhmQkxK0/pz8NiBl7aoZLYJ2o5cnON2VAdrE0MBz
	E9IFd6buoqR+xopvyHpjFrGGNFcCmRtTB61ZG86JjNfOX2ve9cQYR/AZZ7LsKfnihtxc
	whxCUMYrufGIiFcHpv7lbCNuO1H40HkcUz4cXZVJ1a2d8DyzFUKHsqngYQ74Ut0pNB6T
	Mz6A==
X-Gm-Message-State: AOUpUlH84Q3tmzdKELtxDvNRGPAICBqHtVvxeyvSKzIwEcGNT17kXPfF
	CwSki70jSmk6W9+v6Zahnd+oldlm4AnUthSI02I=
X-Google-Smtp-Source: AAOMgpcfo3EuII4GKF9Rf/1HMNbhnPSIi8pY7SblJrTgs9mIOW1EaQCP0SY+jcqBtbCpNhY1ycWBQVNkGUkxKzz5EY4=
X-Received: by 2002:a0c:d2f3:: with SMTP id
	x48-v6mr3093648qvh.214.1532635322507; 
	Thu, 26 Jul 2018 13:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20180726183413.17793-1-lukaszgardon555@gmail.com>
	<CAMKF1sowd+zMuuEZuH1hzmpQTjQ5u4Ta=+MnUFbWoY-dAv=KbA@mail.gmail.com>
	<CADNbA1qQnzQ_Mgm-rOJLu4qJk3ybEj9mPn_CHXDTy6_s8j03YQ@mail.gmail.com>
In-Reply-To: <CADNbA1qQnzQ_Mgm-rOJLu4qJk3ybEj9mPn_CHXDTy6_s8j03YQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jul 2018 13:01:36 -0700
Message-ID: <CAMKF1so3wtYgy_i6-SXVRwz18kD+s_MYyc=QW5ev9yaxCnsZAw@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
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
X-List-Received-Date: Thu, 26 Jul 2018 20:02:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2018 at 1:00 PM Derek Straka <derek@asterius.io> wrote:
>
> Pypi has the version as 5.1 (https://pypi.org/project/tornado/#history). =
 Upstream is inconsistent in 5.1 vs 5.1.0
>

then does it make sense to call the recipe 5.1.0 ?

> On Thu, Jul 26, 2018 at 3:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Thu, Jul 26, 2018 at 11:34 AM lukaszgard <lukaszgardon555@gmail.com> =
wrote:
>> >
>> > From: =C5=81ukasz Gardo=C5=84 <lukaszgardon555@gmail.com>
>> >
>> > License-Update: Change license file from setup.py to
>> > LICENSE, based on the same the same license policy Apache 2.0.
>> >
>> > Signed-off-by: =C5=81ukasz Gardo=C5=84 <lukaszgardon555@gmail.com>
>> > ---
>> >  meta-python/recipes-devtools/python/python-tornado.inc    | 8 +++++--=
-
>> >  .../{python-tornado_4.5.3.bb =3D> python-tornado_5.1.0.bb}  | 0
>> >  ...{python3-tornado_4.5.3.bb =3D> python3-tornado_5.1.0.bb} | 0
>> >  3 files changed, 5 insertions(+), 3 deletions(-)
>> >  rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb =
=3D> python-tornado_5.1.0.bb} (100%)
>> >  rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb =
=3D> python3-tornado_5.1.0.bb} (100%)
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/=
meta-python/recipes-devtools/python/python-tornado.inc
>> > index 29d10da6b..a6a082dec 100644
>> > --- a/meta-python/recipes-devtools/python/python-tornado.inc
>> > +++ b/meta-python/recipes-devtools/python/python-tornado.inc
>> > @@ -4,10 +4,12 @@ By using non-blocking network I/O, Tornado can scale=
 to tens of thousands of ope
>> >  polling, WebSockets, and other applications that require a long-lived=
 connection to each user."
>> >  HOMEPAGE =3D "http://www.tornadoweb.org/en/stable/"
>> >  LICENSE =3D "Apache-2.0"
>> > -LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endline=3D15;md5=
=3D8d463fc66ff8f275354ffe88d1896e12"
>> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57"
>> >
>> > -SRC_URI[md5sum] =3D "a5fc7fd4aea94867609a491ce65786f1"
>> > -SRC_URI[sha256sum] =3D "6d14e47eab0e15799cf3cdcc86b0b98279da68522caac=
e2bd7ce644287685f0a"
>> > +SRC_URI[md5sum] =3D "bd264851c409f926d1dae1ad5055d28d"
>> > +SRC_URI[sha256sum] =3D "4f66a2172cb947387193ca4c2c3e19131f1c70fa8be47=
0ddbbd9317fd0801582"
>> > +
>> > +PV =3D "5.1"
>>
>> why should this be 5.1 ?
>>
>> >
>> >  RDEPENDS_${PN} +=3D "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${=
PYTHON_PN}-email \
>> >                     ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN=
}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
>> > diff --git a/meta-python/recipes-devtools/python/python-tornado_4.5.3.=
bb b/meta-python/recipes-devtools/python/python-tornado_5.1.0.bb
>> > similarity index 100%
>> > rename from meta-python/recipes-devtools/python/python-tornado_4.5.3.b=
b
>> > rename to meta-python/recipes-devtools/python/python-tornado_5.1.0.bb
>> > diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.5.3=
.bb b/meta-python/recipes-devtools/python/python3-tornado_5.1.0.bb
>> > similarity index 100%
>> > rename from meta-python/recipes-devtools/python/python3-tornado_4.5.3.=
bb
>> > rename to meta-python/recipes-devtools/python/python3-tornado_5.1.0.bb
>> > --
>> > 2.17.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


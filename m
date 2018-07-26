Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5839C745FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 20:00:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1532635203; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=6BiKJ5fMfb52jphfLSDwfZGIsyzWo7gO0pXrGqfoIBY=;
	b=JD1TPslySiBa02vcyM6JwbJOizNnz3npg93ngi1VlubfIxiNpNd3HX0D/VMh6ke2bC+0VscD
	XTLTjm4b/A3PRYLHBX4Ml+su9zGx7QqOhrFTffreXpe3Jmtoroxin/kSBoZDp3Y9z32jua83
	7sD3PeaYQIIZKzML4bv+o8u4ufE=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mxa.mailgun.org with ESMTP id 5b5a2842.7ff844c34ab0-smtp-out-n01;
	Thu, 26 Jul 2018 20:00:02 -0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id v71-v6so4361459itb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 13:00:02 -0700 (PDT)
X-Gm-Message-State: AOUpUlFfBF6GC4TP2X4Y/VfC2sekQOhjxewxycNjVAkmAl7E6JC6CrZs
	b5tHJp/NpcEqZKvbavUaZ9Wq2NwRtDEVHZ6Fprg=
X-Google-Smtp-Source: AAOMgpdJXWmRFmZLAZMmWAmuDJv0D2YHkSFCcUojpKEU+y/I22pfRtNUaDa4/mvDqE+C3Dg640WWSsVBKtKQFO9fzqk=
X-Received: by 2002:a02:b804:: with SMTP id o4-v6mr3063151jam.12.1532635201917;
	Thu, 26 Jul 2018 13:00:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:8c4e:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 13:00:01
	-0700 (PDT)
In-Reply-To: <CAMKF1sowd+zMuuEZuH1hzmpQTjQ5u4Ta=+MnUFbWoY-dAv=KbA@mail.gmail.com>
References: <20180726183413.17793-1-lukaszgardon555@gmail.com>
	<CAMKF1sowd+zMuuEZuH1hzmpQTjQ5u4Ta=+MnUFbWoY-dAv=KbA@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Thu, 26 Jul 2018 16:00:01 -0400
X-Gmail-Original-Message-ID: <CADNbA1qQnzQ_Mgm-rOJLu4qJk3ybEj9mPn_CHXDTy6_s8j03YQ@mail.gmail.com>
Message-ID: <CADNbA1qQnzQ_Mgm-rOJLu4qJk3ybEj9mPn_CHXDTy6_s8j03YQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 26 Jul 2018 20:00:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pypi has the version as 5.1 (https://pypi.org/project/tornado/#history).
Upstream is inconsistent in 5.1 vs 5.1.0

On Thu, Jul 26, 2018 at 3:51 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jul 26, 2018 at 11:34 AM lukaszgard <lukaszgardon555@gmail.com>
> wrote:
> >
> > From: =C5=81ukasz Gardo=C5=84 <lukaszgardon555@gmail.com>
> >
> > License-Update: Change license file from setup.py to
> > LICENSE, based on the same the same license policy Apache 2.0.
> >
> > Signed-off-by: =C5=81ukasz Gardo=C5=84 <lukaszgardon555@gmail.com>
> > ---
> >  meta-python/recipes-devtools/python/python-tornado.inc    | 8 +++++---
> >  .../{python-tornado_4.5.3.bb =3D> python-tornado_5.1.0.bb}  | 0
> >  ...{python3-tornado_4.5.3.bb =3D> python3-tornado_5.1.0.bb} | 0
> >  3 files changed, 5 insertions(+), 3 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb =
=3D>
> python-tornado_5.1.0.bb} (100%)
> >  rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb
> =3D> python3-tornado_5.1.0.bb} (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-tornado.inc
> b/meta-python/recipes-devtools/python/python-tornado.inc
> > index 29d10da6b..a6a082dec 100644
> > --- a/meta-python/recipes-devtools/python/python-tornado.inc
> > +++ b/meta-python/recipes-devtools/python/python-tornado.inc
> > @@ -4,10 +4,12 @@ By using non-blocking network I/O, Tornado can scale
> to tens of thousands of ope
> >  polling, WebSockets, and other applications that require a long-lived
> connection to each user."
> >  HOMEPAGE =3D "http://www.tornadoweb.org/en/stable/"
> >  LICENSE =3D "Apache-2.0"
> > -LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endline=3D15;md5=
=3D
> 8d463fc66ff8f275354ffe88d1896e12"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd
> 57"
> >
> > -SRC_URI[md5sum] =3D "a5fc7fd4aea94867609a491ce65786f1"
> > -SRC_URI[sha256sum] =3D "6d14e47eab0e15799cf3cdcc86b0b9
> 8279da68522caace2bd7ce644287685f0a"
> > +SRC_URI[md5sum] =3D "bd264851c409f926d1dae1ad5055d28d"
> > +SRC_URI[sha256sum] =3D "4f66a2172cb947387193ca4c2c3e19
> 131f1c70fa8be470ddbbd9317fd0801582"
> > +
> > +PV =3D "5.1"
>
> why should this be 5.1 ?
>
> >
> >  RDEPENDS_${PN} +=3D "${PYTHON_PN}-compression ${PYTHON_PN}-numbers
> ${PYTHON_PN}-email \
> >                     ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html
> ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
> > diff --git a/meta-python/recipes-devtools/python/python-tornado_4.5.3.b=
b
> b/meta-python/recipes-devtools/python/python-tornado_5.1.0.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
> > rename to meta-python/recipes-devtools/python/python-tornado_5.1.0.bb
> > diff --git a/meta-python/recipes-devtools/python/python3-
> tornado_4.5.3.bb b/meta-python/recipes-devtools/python/python3-
> tornado_5.1.0.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python3-tornado_4.5.3.b=
b
> > rename to meta-python/recipes-devtools/python/python3-tornado_5.1.0.bb
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


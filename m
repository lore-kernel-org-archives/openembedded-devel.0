Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id CAA5A6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 12:05:40 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id b199so59055930lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2016 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uKYPE30bSFh9+4eMWTsXCpygnhxbQ+m+lHm3oR1kR3g=;
	b=uIg5Ur9/X1suR1bT11VpXeCvXl7isSAkYpWgxHh7/iRUZtSoIHmYg3Y4djNM87L/5y
	YuczJsvqBsT95Oj+WBqxJWLPT7oTv0y1gemGh0B4xJ4DcEuhUnSaeGFMvCKXVkt5zmPr
	uwpdPHPCK40LR1kE6TgeXqnZFLTyHweNuaGyNq9feObDMefwGm59bd3HlaiCECj9qYdX
	X16ZU8ebLq1vxKYMV5iv0/gGzfBWb1tk3fHRA20gd4mEkkroz9VUpRcDomFfF5wsGMQI
	mcAK3tTkRq6MpF7unRsx9YPzAnO0S8+giygsK7AZy0yi6EXo4WshEFOTU52HzQGKQgW+
	1u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uKYPE30bSFh9+4eMWTsXCpygnhxbQ+m+lHm3oR1kR3g=;
	b=ibr8llcFJxUu8OgG+R7laxF4MXCClhQ/qgbWjpuf6ptGfCm+9uq+duDFRLmSThavMu
	1AdsM0qO26gXraxZLMLgpsgfG3eDBCw4ZwH3A7V7fWsownJURbkl8y2ktNax1Zfwk6vL
	yFWOf/Piwjbka7/rqi5n+h8ipVOWuKVE9lQ1+iI9x5SrT4t1FOFOIxlUZn1oTWqU2JSQ
	29UJcK/UVEP5+liRheykJowy5wH2vOq6YPocecq2IokBBu6GdHErLvYdgo/3bHxlB04f
	6EPR6CsHvJDok8U7LIgLzZY/COlFZidOy5X42pDRy7oaI+yV0HaVXkj/yL8EK/OEg11o
	ltPw==
X-Gm-Message-State: AE9vXwMcfZ5dQb2wGIAdb8FgADVrLsKr3Pp2dphKkGB08RRbnLhBh74fIFb+MhtgaAnl64n7GaNzcYJ9h4zHbA==
X-Received: by 10.25.139.214 with SMTP id n205mr4216394lfd.84.1472731540543;
	Thu, 01 Sep 2016 05:05:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.7.8 with HTTP; Thu, 1 Sep 2016 05:05:09 -0700 (PDT)
X-Originating-IP: [179.105.254.222]
In-Reply-To: <20160831181000.xdrlcpn4xw5zsll2@jama>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
	<1471892491-6177-13-git-send-email-fabio.berton@ossystems.com.br>
	<20160831181000.xdrlcpn4xw5zsll2@jama>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 1 Sep 2016 09:05:09 -0300
Message-ID: <CAAPZna3dJFY5VTFKKezF4jKj0MYfLsRvCNnxpDLjVyJ-BnP=EQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH 13/17] python-requests, python3-requests: Update to version 2.11.1
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
X-List-Received-Date: Thu, 01 Sep 2016 12:05:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

I see that you rebase and sent this recipe to master-next, thanks.

I sent python-pysocks on the same patchset that I sent python-requests,
https://patchwork.openembedded.org/patch/129907/


Fabio

On Wed, Aug 31, 2016 at 3:10 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Mon, Aug 22, 2016 at 04:01:27PM -0300, Fabio Berton wrote:
> > This commit also change RDEPENDS code style and add python-urllib3
> > as runtime dependence.
> >
> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > ---
> >  meta-python/recipes-devtools/python/python-requests.inc | 17
> ++++++++++++++---
> >  ...hon-requests_2.10.0.bb => python-requests_2.11.1.bb} |  0
> >  ...n3-requests_2.10.0.bb => python3-requests_2.11.1.bb} |  0
> >  3 files changed, 14 insertions(+), 3 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-requests_2.10.0.bb
> => python-requests_2.11.1.bb} (100%)
> >  rename meta-python/recipes-devtools/python/{python3-requests_2.10.0.bb
> => python3-requests_2.11.1.bb} (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-requests.inc
> b/meta-python/recipes-devtools/python/python-requests.inc
> > index e00b257..287078a 100644
> > --- a/meta-python/recipes-devtools/python/python-requests.inc
> > +++ b/meta-python/recipes-devtools/python/python-requests.inc
> > @@ -3,7 +3,18 @@ HOMEPAGE = "http://python-requests.org"
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=d9bb3515869c0f426cb8441c899ae7
> f5"
> >
> > -SRC_URI[md5sum] = "a36f7a64600f1bfec4d55ae021d232ae"
> > -SRC_URI[sha256sum] = "63f1815788157130cee16a933b2ee1
> 84038e975f0017306d723ac326b5525b54"
> > +SRC_URI[md5sum] = "ad5f9c47b5c5dfdb28363ad7546b0763"
> > +SRC_URI[sha256sum] = "5acf980358283faba0b897c73959ce
> cf8b841205bb4b2ad3ef545f46eae1a133"
> >
> > -RDEPENDS_${PN} = "${PYTHON_PN}-email ${PYTHON_PN}-json
> ${PYTHON_PN}-netserver"
> > +RDEPENDS_${PN} += " \
> > +    ${PYTHON_PN}-email \
> > +    ${PYTHON_PN}-json \
> > +    ${PYTHON_PN}-ndg-httpsclient \
> > +    ${PYTHON_PN}-netserver \
> > +    ${PYTHON_PN}-pyasn1 \
> > +    ${PYTHON_PN}-pyopenssl \
> > +    ${PYTHON_PN}-pysocks \
> > +    ${PYTHON_PN}-urllib3 \
> > +"
>
> There is already 2.11.0 version in master-next and this RDEPENDS
> additions break python3 version:
>
> ERROR: Nothing RPROVIDES 'python3-pysocks' (but /home/jenkins/oe/world/shr-
> core/meta-openembedded/meta-python/recipes-devtools/python/
> python3-requests_2.11.1.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-pysocks' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-pysocks']
> NOTE: Runtime target 'python3-requests' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-requests',
> 'python3-pysocks']
> NOTE: Runtime target 'python3-pymisp' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-pymisp',
> 'python3-requests', 'python3-pysocks']
> NOTE: Runtime target 'python3-pymisp-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-pymisp-dev',
> 'python3-requests', 'python3-pysocks']
>
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python-
> requests_2.10.0.bb b/meta-python/recipes-devtools/python/python-
> requests_2.11.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python-requests_2.10.0.
> bb
> > rename to meta-python/recipes-devtools/python/python-requests_2.11.1.bb
> > diff --git a/meta-python/recipes-devtools/python/python3-
> requests_2.10.0.bb b/meta-python/recipes-devtools/python/python3-
> requests_2.11.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python3-requests_2.10.
> 0.bb
> > rename to meta-python/recipes-devtools/python/python3-requests_2.11.1.bb
> > --
> > 2.1.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


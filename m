Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 168CD6AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 13:12:35 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id c7so76227061itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 05:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=/DAIXVWXoa77PxUv4819OvbJ2rkRTf/Eoc1oDKXu7SQ=;
	b=qt47bEJPZE/TPz/tZCmh4mhxMkbmy7S4gHCVX8LBj8w731+IS0yjXXmEbPIlrh3pbG
	ZkIgaXTnoS78LS3gagjts2uhML4fpxSfTc6Cyk5BIVKCmmYkm7kv2uPz1XKPxjRYvmO7
	MmLk6w4FgIeY87f4tiZ72yG86zZh/pzn54lu7d0+k6mQsvRK/pp1V2Qao/7XglcfOBkS
	+M3nx67nXDwXE429TNGXZIFs2vgJ/iBZczXpKYQ92mJk7GYv/U44q0fNNjHxeyy29Yd9
	8iqku4kZZUR1bxkL+YvxadA4nUdJWs1NljXvSaw7ZUZZgQCUO1K+3nZR7O9OLSMgA7j/
	VqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=/DAIXVWXoa77PxUv4819OvbJ2rkRTf/Eoc1oDKXu7SQ=;
	b=g6QaYOCey4rJb4WXW0ikWa7ST8ryBWXy1emL11c8zzzEk6HFDXR8YeKzMf9VcnfAbD
	MW4kqlYh+kqPNeNvlZo6OFKU4m8/OLssqRAPimTFQmVSU4xQEFp0c+HGq7+JJF4mhXgk
	BcO9ukvLiUYfUrcVC/55dtyWponIpQchS4Jo4FgSt55J4LbExO4Fl7EeU+F+u720M0iN
	tLKfWKUFYAdjDt+/Xf/R4J/kF7XMHWt7RtHo6U+l7waOgJs8Rck9qw65PDJHzxR5wblC
	194lmpqlq1hD/aHQV/1JTy7B1sva+2DqJ07VJa/aMO34KPPmfOu6itDq9OsuF/eTYZym
	DCpQ==
X-Gm-Message-State: AIkVDXLQ5TFUP9DWTXSssQooN0W52QZ5itXY7/E6uFk7BQZqMvK0R6uJCqwDaRm4gJKJ+OkouvlIGvuU+/IeiARW
X-Received: by 10.36.66.4 with SMTP id i4mr11183740itb.67.1486473155553; Tue,
	07 Feb 2017 05:12:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.144.99 with HTTP; Tue, 7 Feb 2017 05:12:15 -0800 (PST)
In-Reply-To: <20170207125411.GQ31993@axis.com>
References: <1484904671-9257-1-git-send-email-olofjn@axis.com>
	<20170207125411.GQ31993@axis.com>
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Date: Tue, 7 Feb 2017 14:12:15 +0100
Message-ID: <CAKuJqM_-UAdCfLYHqwe7Y23mZBiSEB7U7j9ekQ4TShgco3P1vQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][krogoth][PATCH] apache2: always use the archive.apache.org to ensure older releases are always available
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
X-List-Received-Date: Tue, 07 Feb 2017 13:12:37 -0000
Content-Type: text/plain; charset=UTF-8

Olof -

This change is already in 'master'.

On 7 February 2017 at 13:54, Olof Johansson <olof.johansson@axis.com> wrote:

> Ping
>
> On 17-01-20 10:31 +0100, Olof Johansson wrote:
> > From: Derek Straka <derek@asterius.io>
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > Signed-off-by: Olof Johansson <olofjn@axis.com>
> > ---
> >  meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb | 2 +-
> >  meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb        | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_
> 2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
> > index b227f19..aa26cc7 100644
> > --- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
> > +++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
> > @@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
> >
> >  inherit autotools pkgconfig native
> >
> > -SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
> > +SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
> >             file://0001-configure-use-pkg-config-for-PCRE-detection.patch
> \
> >            "
> >
> > diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
> > index 5bea876..9459766 100644
> > --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
> > +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
> > @@ -6,7 +6,7 @@ DEPENDS = "libtool-native apache2-native openssl expat
> pcre apr apr-util"
> >  SECTION = "net"
> >  LICENSE = "Apache-2.0"
> >
> > -SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
> > +SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
> >             file://server-makefile.patch \
> >             file://httpd-2.4.1-corelimit.patch \
> >             file://httpd-2.4.4-export.patch \
> > --
> > 2.1.4
> >
>
> --
> olofjn
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Yes, this is my signature


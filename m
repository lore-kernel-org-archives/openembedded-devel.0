Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id F21C86AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 14:37:24 +0000 (UTC)
Received: by wgso17 with SMTP id o17so20658661wgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=8aY3ZfXGfOwFGguI10X4nXIbcQ1ZX8JdbpjLtf7iiFc=;
	b=PXE+BiIUjF8QuAPwloreodaJCtOrnK3h/NnJDBjgIgJZrbrGv6H/Fq4szkQEeQY1FZ
	qvgg1R8A3c+Qjxf22RazlAIEYU0y1qZeprYilzS20xRzo6zWf8BxnE70ggHZbNSNAWJf
	+OXkOfcFPx0ax41cvT8PTxZ7IcMtneto2enc825zw4QBW4jGbngfHP7QXwrEZo38Lmml
	xQtIdMZxigEGqr4qI9+SB8xV+L423bQVuoTRHOKZDo/83LqY8gWVl2Kk0Xx7lT+PpRrT
	aHQ84KRsh6Gn/+Z/Dt9FogBYq0NZzFL6alV+NxU9NrcbF2YsMahHcsZp7Lt+GkclZ11n
	XaWg==
X-Received: by 10.180.82.166 with SMTP id j6mr6510297wiy.43.1429799845059;
	Thu, 23 Apr 2015 07:37:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ln8sm12419920wjc.18.2015.04.23.07.37.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Apr 2015 07:37:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Apr 2015 16:37:37 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150423143737.GA2336@jama>
References: <1429791892-30865-1-git-send-email-ruisebastiao@gmail.com>
	<CALbNGRRaX7RQLm__tDFv4=Ms1GEg4BVwdKAiJp7qMwb+CQ84EQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRaX7RQLm__tDFv4=Ms1GEg4BVwdKAiJp7qMwb+CQ84EQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH]] qtwebchannel md5 error
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
X-List-Received-Date: Thu, 23 Apr 2015 14:37:25 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2015 at 04:03:49PM +0200, Andreas M=FCller wrote:
> On Thu, Apr 23, 2015 at 2:24 PM, Rui Sebastiao <ruisebastiao@gmail.com> w=
rote:
> > ---
> >  recipes-qt/qt5/qtwebchannel.inc | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-qt/qt5/qtwebchannel.inc b/recipes-qt/qt5/qtwebchan=
nel.inc
> > index 3cd22cf..3ed5808 100644
> > --- a/recipes-qt/qt5/qtwebchannel.inc
> > +++ b/recipes-qt/qt5/qtwebchannel.inc
> > @@ -4,4 +4,7 @@ DEPENDS +=3D "qtdeclarative qtwebsockets"
> >
> >  # There are no LGPLv3-only licensed files in this component.
> >  # There are no GPLv2 licensed files in this component.
> > -LIC_FILES_CHKSUM +=3D "file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59=
c330f12cc8ed"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.GPLv2;md5=3De782f55badfa137e5e59c=
330f12cc8ed \
> > +                    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10ae2=
c17a64252e7 \
> > +                    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371=
bc8120425f \
> > +                   "
> > --
> > 1.9.1
> >
> > --
> * Missing signed off
> * subject contains ']]'

Did you test this with 5.4.1 as well as git recipe? I wonder if it
should be only in 5.4.1.bb.

Right now I'm testing it with newer git revision (for 5.4.2) and I'm
sorry for introducing this issue last week, thanks for the patch.

>=20
> Andreas
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


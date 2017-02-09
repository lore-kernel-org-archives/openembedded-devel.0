Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5776A6FFA1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 18:13:28 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id v186so7329892lfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 10:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=PXoOVA7FxOQ/atP2ypP5of/klDkybB5Voz3JxHzzL/o=;
	b=UfdGDjgiuaQOnZfRUnKtjOE9rIlHcgnlhcsTlp62KM1xaKUB+PhnM9Y83jaXMW14EZ
	Aut9h6PdUUElEc+d1CrWiBYUCV0VBfyXrETZlXr4FlUobsPrRFalr6KRm1D5Nj81GrUA
	YZzz+DEopvEEsep33efc9YDKjFjH9WLK12Cze5uTPTGvu1XrdEf0hsWng3P9Uva9DXxG
	a3/o8VokD2FNo7lnI7J8rRmGRDaUK6LvaCikiYX0TxbtsufEQOFTBoD0CQe7lo23cs5s
	tXqiDjU11HNCZxnaIxmIf4+7b9g3JWkn++khxt+3mPjR9F/8qkIOpYqrxUcEdlE4fRMX
	ZOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=PXoOVA7FxOQ/atP2ypP5of/klDkybB5Voz3JxHzzL/o=;
	b=HFJTsc/nUgO2RCg5nByo6LLI6Ob6HM1fN4CRqkeySUu+yaTr1NXrXADd1gGHwsIz4n
	eKdD87q+hr1v9pdvx0I+wM+LdlTKOqtTCturuVhxwq2Q+JYCqrEBFBGO9pmtS7PDanTC
	O44KOA7vu90Q7BdjWJBlJin0jEXrnzPxGvqKXDXLMABbmKfZsn7ed4i0PI12tubFFXcK
	6hwnOIvLfDtrD3GYBV69K5H/14sdWabKbFcqNcu5jL2Vu4+LE3BowQaSUUNSAmjFrZoQ
	CqePhzLP0f+YlbfEu8TCGMWbuynVa/peTtK8UOtimwg5PhWBttW2YFppwbXfrIgS6+jm
	AtbQ==
X-Gm-Message-State: AMke39k992K3xKHUVLjhkPu/a2mFqJgPME3kHE1PkaypHqGkQUSIvAtgmalZBkFNesA9j2UgrwrDxTNu+WHhJA==
X-Received: by 10.25.206.145 with SMTP id e139mr1721461lfg.168.1486664008325; 
	Thu, 09 Feb 2017 10:13:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.163.200 with HTTP; Thu, 9 Feb 2017 10:13:07 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <CAJ86T=XRqVLSk7U3hTcUC-pRkoyZAhF0wng7eWQtcSxwCEin+A@mail.gmail.com>
References: <20170208181320.21119-1-fabio.berton@ossystems.com.br>
	<20170208181320.21119-3-fabio.berton@ossystems.com.br>
	<CAJ86T=XRqVLSk7U3hTcUC-pRkoyZAhF0wng7eWQtcSxwCEin+A@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 9 Feb 2017 16:13:07 -0200
Message-ID: <CAAPZna0NvDTLxcic7rNxPWRxrEdhW2A2djHowJCP1P=LKpRt-A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2 3/3] libwebsockets: Add recipe for version 2.1.0
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
X-List-Received-Date: Thu, 09 Feb 2017 18:13:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Wed, Feb 8, 2017 at 6:16 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, Feb 8, 2017 at 10:13 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > ---
> >  .../libwebsockets/libwebsockets_2.1.0.bb           | 32
> ++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 meta-oe/recipes-connectivity/libwebsockets/
> libwebsockets_2.1.0.bb
> >
> > diff --git a/meta-oe/recipes-connectivity/libwebsockets/lib
> websockets_2.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/lib
> websockets_2.1.0.bb
> > new file mode 100644
> > index 000000000..316b38d3b
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
> > @@ -0,0 +1,32 @@
> > +SUMMARY =3D "Canonical libwebsockets.org websocket library"
> > +HOMEPAGE =3D "https://libwebsockets.org/"
> > +LICENSE =3D "LGPL-2.1"
> > +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D
> 801f80980d171dd6425610833a22dbe6"
>
> GPL-2.0 looks wrong given that LICENSE is LGPL and not GPL?
>
> Define LIC_FILES_CHKSUM in terms of a file from within the
> libwebsockets source tree instead.
>
> =E2=80=8BOk, I missed this part.=E2=80=8B


> > +
> > +DEPENDS =3D "zlib"
> > +
> > +SRC_URI =3D "https://github.com/warmcat/libwebsockets/archive/v${PV}.
> tar.gz"
> > +
> > +SRC_URI[md5sum] =3D "4df3be57dee43aeebd54a3ed56568f50"
> > +SRC_URI[sha256sum] =3D "bcc96aaa609daae4d3f7ab1ee48012
> 6709ef4f6a8bf9c85de40aae48e38cce66"
> > +
> > +S =3D "${WORKDIR}/${PN}-${PV}"
>
> That's the default, so doesn't need to be specified.
>
> > +inherit cmake pkgconfig
> > +
> > +PACKAGECONFIG ?=3D "libuv client server http2 ssl"
> > +PACKAGECONFIG[libev] =3D "-DLWS_WITH_LIBEV=3DON,-DLWS_WITH_LIBEV=3DOFF=
,libev"
> > +PACKAGECONFIG[libuv] =3D "-DLWS_WITH_LIBUV=3DON,-DLWS_WITH_LIBUV=3DOFF=
,libuv"
> > +PACKAGECONFIG[client] =3D "-DLWS_WITHOUT_CLIENT=3DOFF,-
> DLWS_WITHOUT_CLIENT=3DON,"
> > +PACKAGECONFIG[server] =3D "-DLWS_WITHOUT_SERVER=3DOFF,-
> DLWS_WITHOUT_SERVER=3DON,"
> > +PACKAGECONFIG[http2] =3D "-DLWS_WITH_HTTP2=3DON,-DLWS_WITH_HTTP2=3DOFF=
,"
> > +PACKAGECONFIG[ipv6] =3D "-DLWS_IPV6=3DON,-DLWS_IPV6=3DOFF,"
> > +PACKAGECONFIG[ssl] =3D "-DLWS_WITH_SSL=3DON,-DLWS_WITH_SSL=3DOFF,opens=
sl"
> > +PACKAGECONFIG[testapps] =3D "-DLWS_WITHOUT_TESTAPPS=3DOFF,-
> DLWS_WITHOUT_TESTAPPS=3DON,"
>
> Maybe sort this list of PACKAGECONFIG options (unless the current
> order has some special significance?).
>
> > +
> > +PACKAGES =3D+ "${PN}-testapps"
> > +
> > +FILES_${PN}-dev +=3D "${libdir}/cmake/libwebsockets/*.cmake"
>
> The "convention" in various other recipes seems to be simply:
>
>   FILES_${PN}-dev +=3D "${libdir}/cmake"
>
> > +FILES_${PN}-testapps +=3D "${datadir}/libwebsockets-test-server/*"
> > +
> > +RDEPENDS_${PN} +=3D "zlib"
>
> Explicitly defining a runtime dependency on a library isn't normally
> required since it will be detected automatically. If it is required in
> this case then please explain why in the commit message.
>
> =E2=80=8BYou rigth, I don't need to explicitly define =E2=80=8B

=E2=80=8BRDEPENDS=E2=80=8B.

> > 2.11.0
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


Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id D6765793ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 13:54:06 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e22-v6so2860305qto.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2018 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Vn07wXZD2uerxKM79udV10Y1i829h0HIDwDw/cbRysU=;
	b=KBONGAdy7r9/bMqnDo1mzJBbLqW7Bv8G4dvpKYPAbMxc7oGizEwaTFEzQXFTqC5pfF
	car1TQtmpCdVNnlEeSHKa/IE2lpUxnwP6vO4WYEGSQOQf9k5goRmkBPRUk5ellcwyIq5
	yzzLPJlWNurC8Us7ekVRDsmMW52GFxJSZtwUazWIKVa5Ru8QTnnCcqLjwRV/chbK0JMf
	o4JbS7CRO1QD2zecvGerFXS5uvDIUntf9wL4eDpOT9bXJAsw5vIMPB+C7eYlDJ8OX2Hr
	tLMJ0r+rgm8Eoo9W2+5Z96NgPHfGs2AMcvCRDoDy8bRDAxggzxPBjNNSIxNTslAKV4U3
	21JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Vn07wXZD2uerxKM79udV10Y1i829h0HIDwDw/cbRysU=;
	b=sQVt6ndV9thHDa6FL+P7EfTFkO5McpCPFXyhWU2TvGdJQZSdqIdMW0HPl2F2s0DY+X
	NjzH20zDbOJbxNOE1qRVj1L4VNaOediWn/djq1MRL+zLZXunG44DOmbxMMwpnU42QT+j
	s6kSLyGv32Lr+tyyp0WoBYhZMODgWp5OVPm3twLKAM+4JZmEtWsRJUzSDn/b0oKTEq49
	Ku0LcsRePMFGG3/kio1Y/vip5fLf7mTtLyR6QhHFRJQHU6YDAuQhnbfwldXc09qIw2C5
	Ej6hjYYAOavSpjB/M3AJPLI52Tr8TPXStpbAQgRBOLJZtVWNknjJ7mIOjf/uFYXGNL7Z
	E3ew==
X-Gm-Message-State: ABuFfohKfTRI3Bv5SEZzZirlyuxWlqQDVKdeX3oohbq8CE1BWFBbn0Wi
	SekB6dttz78tjZKF+yDWJ9sMsAPeLBP87vldGkM=
X-Google-Smtp-Source: ACcGV60dvuQ6ZOeb4UFDwWSKBHtm1rlLJI7PJLaVw1c7IsoOcydayhG6EU4P5BoxDJlS8hRCg1Y0uWarnB9i11xHiYw=
X-Received: by 2002:ac8:435b:: with SMTP id
	a27-v6mr5193205qtn.295.1538661247333; 
	Thu, 04 Oct 2018 06:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
	<CAMKF1sotCFH3POn6S11GOdkuH2A886iKN=PGdPA_81c59TzwhA@mail.gmail.com>
	<CALbNGRR0v4Nm1O7J2RQC0-MqRVLZNpDHn1jDYVRedpttr3AY9w@mail.gmail.com>
	<ee935578-3dba-ac85-d207-9636e8916a6a@gmail.com>
	<CALbNGRS8m0j834nTdrsGrKJmWH-b8dxv4FmKQXJQdSsb_q2+9Q@mail.gmail.com>
In-Reply-To: <CALbNGRS8m0j834nTdrsGrKJmWH-b8dxv4FmKQXJQdSsb_q2+9Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Oct 2018 06:53:39 -0700
Message-ID: <CAMKF1sqygr=Ou2LccLDemy-3GNhzkmKkQ1uS0ZeW22aWo_VNRw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/8] libsdl-gfx: initial add 2.0.25
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
X-List-Received-Date: Thu, 04 Oct 2018 13:54:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks.
On Thu, Oct 4, 2018 at 12:06 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Thu, Oct 4, 2018 at 8:37 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >>> +EXTRA_OECONF +=3D " \
> > >>> +    SDL_CONFIG=3D${STAGING_BINDIR_CROSS}/pkg-config sdl \
> > >>
> > >> is the intention to have SDL_CONFIG point to pkg-config here
> > >>
> > > I was under the impression it replaces sdl-config (sdl-config support=
s
> > > for basic stuff as cflags and libs same arguments as pkg-config). Now
> > > that you ask I checked and grepping did not show my why I should set
> > > it (it is mentioned in the doc but...).
> > > So I tested and it builds fine without setting SDL_CONFIG. So V2 is
> > > near - thanks for the pointer.
> >
> > I was thinking it should be
> >
> > SDL_CONFIG=3D"${STAGING_BINDIR_CROSS}/pkg-config sdl"
> >
> Sent V2: No need to set SDL_CONFIG - have tested that with master and
> I grepped through the code and get the impression it is a leftover not
> changing anything.
>
> Andreas


Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id A22157FA33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:51:51 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id s5so6927288iln.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oXOVAlB8OF4EpDogWjmVdYhNeiUQ+/1UBtrcA64XPcI=;
	b=era1rL059FZ/2VVvE9Q26KSIKez2FQnI0kceSzkvglTQ1Kdssdsv6CUCAnjj622mdw
	VTaXU58Qm1Jr0knpbcD6LniojnS22kTSi+PS4rAaPMW7WPMScjBPTcpc5TC53pUrayg0
	893RKUwJ5QfFt4UOLnQ8bQkKD7OWMrA8gDNfg9GC+NQZajYEc/bXgceWLP++lvr7dxHk
	/ww7jCwmO9Lv7z4puteu9gpGar4uLjmMGs4UNCv6gndD1zy5x9rV5u4+xFXRKj6C4b9/
	joqfmjjoWffvmxfNXTb9xSY3QfiKb5v+SIjM/N6i9JT064Hl95GKUFGls1IS3Wlm4Iqn
	cbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oXOVAlB8OF4EpDogWjmVdYhNeiUQ+/1UBtrcA64XPcI=;
	b=LbZ6LiuQ2O4SMzHRiutU3NGR6fSUuBGHai02EpPhTEp2GX+Gsomn3nfPav2Qa4dnne
	2MJbEjyZSh9r8BawZPmpb1o22suTJdodpLMs5orNuzf+6wC3FSkNuweCGim/oNO/e/V+
	1Tonqn+USOVPkZ7K6Iv+ugMBSeFzm07IPQgSHTZGejQSpeVTwIGEPf/bZC8o8gXrJQtG
	aSD8VM4gy9DGdhiPoFRjVIwzRM/2R7mj4g47Djm18O+jMS/zaZEzqN6sV14QBWONZkjM
	wKp5zFxCd+yEJW58sTc24ZvvcSj/zGp5DsOhvPehZA6ygkp/Ftq70fJjHr8aW6tBYJUX
	cbPw==
X-Gm-Message-State: APjAAAVe2Tegi8QAlIQHlDxv4q2/FAxGLw8ygmh+AvwngGlZqlGIGjp+
	3x3fKZWQjVHj2r0LUo7ATcd62uiSoov1kCSyFyrBRQ==
X-Google-Smtp-Source: APXvYqyj1dOZ0E3ZEM4+pzAR1KeGhOdvnEJDiUP0E8Z2v5N76pKRbSlnQ2Oe4rk0W/uEy/Oleq7JXIAnpsqUq6WMw7Q=
X-Received: by 2002:a92:8983:: with SMTP id w3mr13690785ilk.108.1573771912748; 
	Thu, 14 Nov 2019 14:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-14-schnitzeltony@gmail.com>
	<CAMKF1sru3JvSpMvHHzrL1+D1Qkm4Orec8r0FcwrrKn=38gm5sg@mail.gmail.com>
In-Reply-To: <CAMKF1sru3JvSpMvHHzrL1+D1Qkm4Orec8r0FcwrrKn=38gm5sg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 14 Nov 2019 23:51:40 +0100
Message-ID: <CALbNGRQZE0ScPCq973vQsWttB4-rPxU7_ZKCvtvSpnAYUffnPg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 13/16] geocode-glib: initial add 3.26.1
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
X-List-Received-Date: Thu, 14 Nov 2019 22:51:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 11:13 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Nov 14, 2019 at 11:51 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >
> > It is a dependency for upcoming gnome-settings-daemon
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../geocode-glib/geocode-glib_3.26.1.bb       | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta-gnome/recipes-gnome/geocode-glib/geocode-glib_=
3.26.1.bb
> >
> > diff --git a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.=
bb b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
> > new file mode 100644
> > index 000000000..dc218f3a3
> > --- /dev/null
> > +++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "A convenience library for the geocoding"
> > +
> > +LICENSE =3D "LGPLv2"
>
> still at 2.0 and not 2.1 interesting.

will check

Andreas


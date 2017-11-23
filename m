Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f171.google.com (mail-yb0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id DD8F57858D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 15:19:50 +0000 (UTC)
Received: by mail-yb0-f171.google.com with SMTP id e83so7318883yba.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 07:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sbIDYKKr24mZjDv5zSIa8uYaMwn8UdTh05vtfQbkoVo=;
	b=Pwk8CaGEktc+A6wvQMLuespwVbWQ1swaCNp32eInHkqq28h6SMh0KpSX3DY7oDuqtH
	tI1t8rWvf9Zy5EpoUIIvI0toAwqdXlwVIehgHbJpCWdVyDFWAMWsj+0pB+h0PSicorVv
	5gNKKKdWuI7m4W75BYJC6nJnKysvfDVcLIeT2ZVaw5+FzwvG8/9rgut9tpBJm/7eS9OB
	qeGG8FSbmpnN2nvGqTC99O5n2bMwK49t1j7VXyA74ii7ZsP+bc2Ke3m5AtNJ2x+x1w4L
	/BjYWmfNCdHM3q0NRnZ5vDbMuyWGgmKe+RTLOF81ZEV9os2ebNlBJDtwBssvR27j+cSl
	O05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sbIDYKKr24mZjDv5zSIa8uYaMwn8UdTh05vtfQbkoVo=;
	b=U7pRbPZvhyWNnWqi1jSjMM7v4EqflXQ/w5B0sA7fy76qUngcFGB+/QTZ+zj8DnqGsb
	xFHln2buwoATUBxzAXXutoLlmKNJm2Fx7exmCZBVwPsGQ1AsEdUJo3ipzNyMrq50IZW5
	t6HQ6bcIjkeImtDmNr+c4QhcMIwkaly1p0fJurMcApRAfNqXNEINbnz8rYngVrWYY95x
	JVb5Sv1uMY+aZumKX8w83V7dnL5Q+FYOc+od0TqZ7yJoE/WS0fS5+NsT8pSjc8QT5713
	TOQA4vxkOH8VGvWO1+AxAUZDDJWOBVQraIvChbtuWnti3RXGly3ghDimvJWVeYbDKY1q
	FyNQ==
X-Gm-Message-State: AJaThX4vMbwOVpv0dOk1AecVQelVzeHOd3XsdYg57IIfCf7OX67A0oTT
	Oo5irTQscqRsCUCA90MOE8cYX9yfvLhK0jqTJZsOLg==
X-Google-Smtp-Source: AGs4zMbQA86FQMiWy9pWJDH8xIj3ygplBgMGIv6zCu5yn0YM13izueFx5OdmLGkEVZUwuyzv3GGQb8ZYiKTR8aWCxu0=
X-Received: by 10.37.219.18 with SMTP id g18mr15279992ybf.450.1511450391821;
	Thu, 23 Nov 2017 07:19:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.98.21 with HTTP; Thu, 23 Nov 2017 07:19:51 -0800 (PST)
In-Reply-To: <ov6mkj$3kb$1@blaine.gmane.org>
References: <1511443538-32104-1-git-send-email-vladan.jovanovic@gmail.com>
	<ov6mkj$3kb$1@blaine.gmane.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 23 Nov 2017 16:19:51 +0100
Message-ID: <CALbNGRRnnMh=ZPwPstRni4_C55=j9qZyhzhBkDhVD8PhgnFfRA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Fix PACKAGES assignment for fftw
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
X-List-Received-Date: Thu, 23 Nov 2017 15:19:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 23, 2017 at 3:40 PM, Koen Kooi <koen@dominion.thruhere.net>
wrote:

> Op 23-11-17 om 14:25 schreef Vladan Jovanovic:
> > fftw recipe using wrong operator for modifying PACKAGES variable.
>
> Please explain what's wrong with it and show a buildhistory-diff between
> the 2 builds.
>
>
> > ---
> >  meta-oe/recipes-support/fftw/fftw_3.3.6.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
> b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
> > index ed14e16..e13684c 100644
> > --- a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
> > +++ b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
> > @@ -65,12 +65,12 @@ do_install() {
> >  }
> >
> >
> > -PACKAGES =+ "libfftw libfftwl libfftwf"
> > +PACKAGES += "libfftw libfftwl libfftwf"
> >  FILES_libfftw = "${libdir}/libfftw3.so.* ${libdir}/libfftw3_*.so.*"
> >  FILES_libfftwl = "${libdir}/libfftw3l.so.* ${libdir}/libfftw3l_*.so.*"
> >  FILES_libfftwf = "${libdir}/libfftw3f.so.* ${libdir}/libfftw3f_*.so.*"
> >
> > -PACKAGES =+ "fftw-wisdom fftwl-wisdom fftwf-wisdom fftw-wisdom-to-conf"
> > +PACKAGES += "fftw-wisdom fftwl-wisdom fftwf-wisdom fftw-wisdom-to-conf"
> >  FILES_fftw-wisdom = "${bindir}/fftw-wisdom"
> >  FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
> >  FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
> >
>
>
> NAK: This breaks packaging: All libdir binaries go to fftw package. Split
was intended.

Andreas


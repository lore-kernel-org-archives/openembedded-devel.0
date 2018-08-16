Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id D6A3079234
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:31:40 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id b15-v6so9732763oib.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Km0KyYOfW5xVerKD8aq4oG4s1MyVjwnjXM9/TSYL5EY=;
	b=if58oQZYugzw+W0+2pjk+8LE+XSeJGVZ/Yo16JIKhLcmPkH54E5bGB/FWoB+d2DX1o
	hhKHs2exedHoOESMcBUCOn3mcJz1/ikGcCnxsT9z+KLW6wBTlyR1BV/uX+pJc7zn9Vun
	+CgkOE/l+chul0waoKtPAVD+WpGyZSXvguRIKEunsPjIJWwHuT5k7qXNtAf/Bm5Pzm/j
	1QBF9hlqDPh8KAtZGU3hwR0m2gHoOEwBPhR/JaE0CE8V+Z6wrB6zdWfufS67Vj2M5kvG
	/i/eKhttbmY2xN/j8z89sVQvImwaqMBpB58UFdcco9V1eXhb55/dxgOlOE3UdsR+8/zP
	U+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=Km0KyYOfW5xVerKD8aq4oG4s1MyVjwnjXM9/TSYL5EY=;
	b=WVfvu4vzqBreypavfH7mK8rDrWbfTgcYd2QaAddzkwNQxwQ/t7bmvdBWTWB19u56+0
	SiU6otrHNNfED1M9VZljXR1BT8VFqgQbCYk9WRxPpRRrtIXNhvxOCKJlp9JzjH3fDOzv
	I5j/h/RZUbZUvz0EJY8BGQ4m4TwPrUc8kYq3dS4lRY/5xDaCAcILBsSPnKIyZua8Y77w
	+aWXNE9Eiu4YiiuziMoSWdUitKF3cnMU1z5vTaiRlCpS+luSrFH1AeROBs8AeJ8Twg4S
	LqnJk0XDnSy1P10L+r0o1cEJD4rTN1U8H1iC8e59+yYzVKORdQwVqfMnTdtCPCjTl2Vn
	fE0A==
X-Gm-Message-State: AOUpUlENMIwGHNsW5tqLHOn7VQNqawSELmc1oFfU40Bqd6CCGCQAsKjL
	vYyB3kJrZ/Yu9N1w0YBNDtvEnuVOH0zt0sqxxjApv+d0
X-Google-Smtp-Source: AA+uWPz/jAGj2C0cGng08p+yDQ2eiQwm2tyld4YOKW/lmMS0BsGpHt4KoJnmAfMAyFK8VyDpnZfFhXABMeFeNjybBvA=
X-Received: by 2002:aca:c351:: with SMTP id
	t78-v6mr30556620oif.338.1534444301473; 
	Thu, 16 Aug 2018 11:31:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:590c:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 11:31:40
	-0700 (PDT)
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 16 Aug 2018 20:31:40 +0200
Message-ID: <CALbNGRRY6iMw+1rw5DkirSvYcxZySbqLvTVnnF3=73ejFa-TnA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/16] updates & minor cleanups
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
X-List-Received-Date: Thu, 16 Aug 2018 18:31:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2018 at 8:27 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> Some of them I carry along for a while. Patches were tested with glibc 2.=
28. In
> case of trouble I'll take care.
>
> Andreas M=C3=BCller (16):
>   gvfs: upgrade 1.36.0 -> 1.36.2
>   gtksourceview3: upgrade 3.24.6 -> 3.24.8
>   libxpresent: initial add 1.0.0
>   xfce4-whiskermenu-plugin: upgrade 2.2.0 -> 2.2.1
>   poppler: upgrade 0.66.0 -> 0.67.0
>   fftw: upgrade 3.3.7 -> 3.3.8
>   fftw: enable neon for single precision on aarch64 by default
>   xfwm4: upgrade 4.12.5 -> 4.13.1
>   dconf: prettify
>   dconf-editor: re-add 3.28.0
>   xfce4-session: upgrade 4.13.0 -> 4.13.1
>   xfce4-screenshooter: upgrade 1.9.2 -> 1.9.3
>   libsdl-net: initial add 1.2.8
>   libsdl2-net: initial add 2.0.1
>   move all libsdl recipes in one folder and follow oe-core's folder for
>     libsdl
>   libsdl2-image: upgrade 2.0.1 -> 2.0.3
>
Forgot to mention

They are at https://github.com/schnitzeltony/meta-openembedded.git
branch patches

Andreas


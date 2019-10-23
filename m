Return-Path: <misla011@fiu.edu>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id F314A7F8BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 22:39:27 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id c17so31668500qtn.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n/vsoJQDl4a7z03uED5+fxyGRtuwZQo3QTaGBWPH338=;
	b=IMYPVORzJOLFDjpKiJB8t2GtIy4byLOhVWJz5pEnBUdC17I6Z8gtOax2m0MTriAp+C
	VnjKyUjDsC+HNx5zg3N+oC5QmIJgZEpxK2MxKUGji7dreMptU7H8+m8A1Lt3RiBpfOH8
	eBfjrOrwnGSg5YZFIoKnor+IIH84kDbMzxdimgLR3h6OR8BFUxTj6fUxWLY8cHOdtZjG
	MjjjO0N0QFO5FKhyDHTRJ0uaEhZXRkQnQaUX2RKiBrLXoVo7nrHMhBeSQu9EO3axS+YR
	tx07rRafYMFdVy/YhG3GbXFMZ64D7syRjS3t6TnYd6izrQQ7CCIsdDwhxZTIbosa+cik
	NqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n/vsoJQDl4a7z03uED5+fxyGRtuwZQo3QTaGBWPH338=;
	b=qD1LxeCNRCtUbLGejxHG00x5Ouv00mZyH3C3Mg+6yTjb5hFYyx0NuYTT0J++/ApzDS
	6BjSo2w2yhxBndTWMb+FemfcEn7d00nb/9y4aSnMuowQT4lA94EhqCtJWOyxLZY3BqaB
	Nf+9enj++hPqDLnkRlMDUHNsTyad6v4qwYVPJXIFWwaqbp+7+4dxwphlXjNBAalNUHOS
	d8HHuKI2SxjKP0RPRZn3CfWLeKgs9uYN//GdxmHa64lPeGcQDBgr9X2Q7QbTlHX4mblS
	MNE9IkyjOuHd6lRoMPDhdVcinXaEYRzzmA5wtbnHpAp7tmqlHl0/sWaugHnI+zUC/kGC
	GK3g==
X-Gm-Message-State: APjAAAUedJ9vhgM9WHhY1qbVJYgiuUDOG1K+M6uMy4EPcjWENy0uZUsq
	fA2zyDHYbze9qAStLzrFIVsSpM1LnqLZ6GlkbM6+XQ==
X-Google-Smtp-Source: APXvYqxiKnSJsp33XFZ+6+Tdrppm2pDSuuRTKoHhn31dzLftoiSQ98eOQgkXHED0HgwCfZVv/n5lN8WPC9XyvfA1iBU=
X-Received: by 2002:ac8:5150:: with SMTP id h16mr102663qtn.39.1571870368602;
	Wed, 23 Oct 2019 15:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAK=B8ybAAncCAZ_EAGiH6+u5-cYYKPAwfJhxTi0Gj6Q8JfeZrA@mail.gmail.com>
	<74cfcc6194868f8afbf5c6e82b17283f4e9340ce.camel@linuxfoundation.org>
In-Reply-To: <74cfcc6194868f8afbf5c6e82b17283f4e9340ce.camel@linuxfoundation.org>
From: Muminul Russell <misla011@fiu.edu>
Date: Wed, 23 Oct 2019 15:39:17 -0700
Message-ID: <CAK=B8yYDsHFSF32xJVO_7sSWcyi_quxVt84Nd979OYW5-TOh9w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Build info in the spec file
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
X-List-Received-Date: Wed, 23 Oct 2019 22:39:28 -0000
Content-Type: text/plain; charset="UTF-8"

Ok, thanks for the clarification.

On Wed, Oct 23, 2019 at 3:38 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-10-23 at 14:00 -0700, Muminul Russell wrote:
> > Hello Developers,
> >
> > Yocto can generate spec file for rpm packaging. But that spec file
> > does not have %build and %install macro. Is there any work done
> > already to include those 2 macros? Or could you give me hints how can
> > I do that?
>
> OE uses its own cross building process. You can't encode that cross
> building process into those macros. rpmbuild assumes native compiling.
> People have tried and concluded its really not practical.
>
> Think about the fact that even if you did have something there, the
> original process used to run the build would be different. That means
> two different code paths, one of which will probably end up with
> different results and hence be broken.
>
> So yes, I understand the desire but it really doesn't make sense.
>
> Cheers,
>
> Richard
>


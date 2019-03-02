Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4CDE57C83A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Mar 2019 15:57:49 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id y140so537779qkb.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Mar 2019 07:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8bTibfQacJ3sUibNNX/MkQCECjGPmyin5Ia9LBdIdD8=;
	b=kNNdDBemHGOpzVx60vlelfDiiirdtE5twhVTl0ghzBxkNd9RE8So2XRtiBn36Z6vdO
	GDBpWU2sMC56vZ07wP3pHkQAc5ksznqMP5MTQfs4mkuCljq6AOJIPxfBGBHU1XshtWXW
	tJOEPinoHuOiercOI0Ku+aR814pes+HcejtJnPmdBunNxkW2iR50WbSd0q9/hndNgfzz
	GI1EOi0H4jj3zBSbNWCgi2+lU36e0iTKs3rm3GxLxlws3OabqpAP7rk5qlW0CIq3reZx
	boAljoiCLbarIjBAg6l0o6aYYB15Ao0Hy3DEeCw8OLWWYqPQ9qF2/iikqUqe6aEK3gGK
	lOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8bTibfQacJ3sUibNNX/MkQCECjGPmyin5Ia9LBdIdD8=;
	b=cU6hx2QTsuSkXdL75oZLpkfs0hJ7PWACQA1rBLZ5IhjowYTJO8n1Pj2tYrLk3/Cz7r
	s7DPLD5+KLJKKEZCMEL4sjaVha2Zrm40HcVpr7hUeftgP8GMZkL07uBgMMdOKoxw45p8
	NQntHaV1TXKmUu/kEBF/1yM4at51fj2YN4fw7I87UxVjkjqkwy9ePs286Y+b6dI+sUtn
	S7P9/uvrCQu7R7bHrjajz7ThRxEHP51m7LJBdTKPBjg8PjbaveXPE2aKHbIYrNbeqrY6
	tggtGvOEqr2zf3rl+Yfie9wongqrt/K1b1Q9gTK1EbUdTWJVOoAX5nNgdygA7+sR930i
	fg9Q==
X-Gm-Message-State: APjAAAV/PoQUnp7X8InJD5FbxYrU/ROvWPzUQgfI1pLaPmtdmb5YOuce
	nbrtDPvTBk5qqvHz2vxbInYxlYeaksFgzPd4rig=
X-Google-Smtp-Source: APXvYqwPR/HVsnozNnS3yF4kIajEUkzYgGKxhmWoxrS9f7F99D2olEwPdH08d5JeaaI3WeGQ1J6e1PmM9Vjo9xVHgWE=
X-Received: by 2002:a37:e10c:: with SMTP id c12mr7935566qkm.315.1551542269860; 
	Sat, 02 Mar 2019 07:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20190302025034.10954-1-raj.khem@gmail.com>
	<CALbNGRTf6TvxoQmC=fxGyVo31xn8w5p2sdJ3+aHmpPVn=EAEEA@mail.gmail.com>
	<CAMKF1sp9AYu_skZBkVXw8ezFpVF2mS4w41EFFvQDdTEuXBHs8Q@mail.gmail.com>
	<CALbNGRTtHwWWDGK7ebDgqw3Q03fzMaTfG14S-gWq0_MEjTUT7g@mail.gmail.com>
In-Reply-To: <CALbNGRTtHwWWDGK7ebDgqw3Q03fzMaTfG14S-gWq0_MEjTUT7g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Mar 2019 07:57:24 -0800
Message-ID: <CAMKF1sq5MzbwSp-Rtqw8AuaS11TrdXa_hRxgJR-o2CX=JCjjdw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] glm: Upgrade to 0.9.9.3
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
X-List-Received-Date: Sat, 02 Mar 2019 15:57:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 2, 2019 at 7:20 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Sat, Mar 2, 2019 at 2:50 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > Dropping the patch breaks several packages for me.
> > >
> >
> > can you forward port and submit upstream as well
> No I can't. Would you accept a simple upgrade patch removing all musl pat=
ches?

I am asking for help since I don't understand these patches, and they are
largish and the code around those area have changed a bit. It wont be
good to hold a upgrade for these, since this will mean it will break
building with gcc 9.x which is what prompted me to upgrade this in
first place.

>
> Andreas


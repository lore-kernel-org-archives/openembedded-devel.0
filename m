Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 854FD7FD24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 07:34:32 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h8so1823324iob.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 23:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uHuqF3bvPuWwGT9lGeWWiJHz8w5xPsBSJ82cH+Ms6M8=;
	b=j40KjKbLbRG5e27ulcxjqqGYfRFcMil7H+ruHNhjrhU/y1VEQeOKWk3gm/GGHvZGI9
	/TYNv/r0E5JrR1rlkApRqJN1zkOQa4KNSr2so8mMCQY2QMWY4g7RMHQMpKpED9ZYc0WL
	Y73ZW7Ngz3zAOZfXyZnlbb+QM9oYZX8Ltlr7dQGtf1eA3z/vKz2Vma3WQMxsrP6zia5a
	o12Jk9uzJPwTDhO0T43/giwTBUSmYZpJUvYe7mANZ5yWDpBdEdS79TOumy0/k/hSP95C
	faHvhYxmPbTBRAwi01fIGu94hqIomvB52eKD52SyNEs087UFT2haMKDGpJq17Ud5SAfd
	KIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uHuqF3bvPuWwGT9lGeWWiJHz8w5xPsBSJ82cH+Ms6M8=;
	b=C2YlN6VhmcSfkQfJLzjnMNhXnRtysEvx09bZHQZiYLGrV+UXKaomrVDgNVolAU6O7Q
	524E6KFMHZ6eif2R/v8mxij+9NCZDIfxff0bt0ZuHAjnbWEN5QL0ER6/VBLEshvRryn6
	TTOHv8Pt4IB6IyI0F3df7FXp1mPl9UvSR6bbFciiJ5JldbW+hzX2iUATufDN3IOhfkpA
	w3JRvQIAm1bTWlhBeBvo847YRkmdq17VOmSFFDjE3h7cV8d8ZxwAJivQ99+FSj7IZqhd
	zJKrKOjriGscCghu6aRiDs3Z+uRO2FzQ5AKtYT3hKJZClmgHeMmPv2d/+RJvStfonIY7
	mCmQ==
X-Gm-Message-State: APjAAAVhluY2NRKZFeH9FYbPxVdTvcQwPHeFNv+miLqc0Dmd3gNQ4CkA
	m1U4towh/pK/DNK1hJEvyxJvtjS54akERcN4Lpo=
X-Google-Smtp-Source: APXvYqwOlxoAAf2wFPlVn6o3ajVGVyJZAIlQ5z8Rt6BK6DVZpIvThDjyR8UtaNmNG6v+f834rPFBypCr+cL1xwGZLtY=
X-Received: by 2002:a6b:b9c6:: with SMTP id j189mr2011232iof.147.1579592073359;
	Mon, 20 Jan 2020 23:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20200121012416.544541-1-raj.khem@gmail.com>
	<CALbNGRTgzwTink2p8Ffxr4pnGJfVfpRsyrbbrV1QO68noVVi2g@mail.gmail.com>
In-Reply-To: <CALbNGRTgzwTink2p8Ffxr4pnGJfVfpRsyrbbrV1QO68noVVi2g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 21 Jan 2020 08:34:22 +0100
Message-ID: <CALbNGRTpRzagOxVx4XjEwGaJQmGXPEY3BPUaUT8kb+3nLKV1TA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mozjs: Upgrade to 60.9.0
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
X-List-Received-Date: Tue, 21 Jan 2020 07:34:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 8:13 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Tue, Jan 21, 2020 at 2:24 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Use firefox ESR src_uri instead of gentoo pre-generated image
> > Pre-generate old configure script
> > Ask for python 2.7 specifically during build
> ^This is what configure.py already does
^ 's:configure.py:configure:'
>
> Although I wanted to finish python3 first (yes there is progress) I
> sent  out similar with autoconf-2.13 and some clean-up. Are you
> working on this either?  If yes I can do something else.
>
> Andreas


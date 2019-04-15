Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 333DD7D7A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:39:14 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u12so14090634iop.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m9EgUBRecBztUDoKzSN3j2ZL/Of0Ly2IxyOmnI9TAQo=;
	b=V1Q0QjyeKGAeVW0GfMZPLsFmoX912x/Pnh95zcZpCXai017B8gED20h7n3gMnuLonM
	WOlKJ3eVVab8qbXXTNCJ19+E9zKHN61upriYo/yqJ42jml4s8CJuGUi1VN84kDu+/WNZ
	hCf0T8qLQ++AlLowPOqUnNSgRcJQUSOZnVb4ODaxJdC3HIqqqaubu+xq9czpCACHXF+9
	LJ4OO3FSNZJHTw/nahQmyqKwuu8zJjGGA6pnVYWbd33VmxDme2oxzFvR9p/pWJI5QgEJ
	w4lRQMZHDr4C9akujhs2Ogb2xRUAGvLeVyHF4eA0SyhwsdxHD5LyDz7w5+CG234GBq6N
	9ALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m9EgUBRecBztUDoKzSN3j2ZL/Of0Ly2IxyOmnI9TAQo=;
	b=o7nkcDvisT9MvDQAdBB19GSeZt/KTO2mW+hhofF7NAP2sLRszaFr9fGW1QvjpNSYuy
	LHoplfQE0njefi6DOehTdvEUWxGUZA53cJHhBNs6R18wsKRdSRDAGzT0wsZgywV4WcDI
	auSWkx9AOmywhhGij3GMk524f7cIvBaxQxDwyoNRvUYyTVl3izwiMSwzKwG5CbeAsZD+
	2LvY1C5vRXuHnLkGcVtxw5uki/MVvsn0Za2tAajptXIjkE7HApWuKRGMbuRMBh1TNWwQ
	tTumidB92XlW9Ax1IA0nCHuRQFEhe5o83M2P+8KDpe0Cf29oUiliIA6zpSAdXPxPecAG
	zz0g==
X-Gm-Message-State: APjAAAWdOPpIXEGrU4ppxvpVB1EgG0Sx7NXBu1J7jdU3ljI3pGdAcXHQ
	zEoWMMvThmlTSbuRm5s+2auVZEQrAuuAYuNMqN8=
X-Google-Smtp-Source: APXvYqw6KOiJRRzDmXU4PhzSEoykKTgggEvtAT2qf2EXRYlfP7M4/otxfN0pBWVr7g7fF1G91sQnCVmFeAnrqAMc2ck=
X-Received: by 2002:a6b:e50d:: with SMTP id y13mr6332538ioc.142.1555324755138; 
	Mon, 15 Apr 2019 03:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190415063233.119684-1-kai.kang@windriver.com>
In-Reply-To: <20190415063233.119684-1-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 15 Apr 2019 12:39:03 +0200
Message-ID: <CALbNGRQTJQcCkmOLcvxFryEbEZ+eGhOEubgDcQmFC8ZeFghA9g@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] gvfs: fix typo libexec
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
X-List-Received-Date: Mon, 15 Apr 2019 10:39:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 15, 2019 at 8:32 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> I believe ${libexec} is a typo here which should be ${libexecdir}.
> Otherwise, the execute bit of ${datadir}/polkit-1/rules.d will be set
> and previous workaround which chmod ${datadir}/polkit-1/rules.d does not
> work.
>
Thanks - for fixing and I think it explains the other issue: Systemd
service adjustment can go now - it was caused by the typo either

Andreas


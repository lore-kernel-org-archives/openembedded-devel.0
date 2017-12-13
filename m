Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0457838B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Dec 2017 10:20:09 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id v190so637958ywg.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Dec 2017 02:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ejPRqtWnQYrwxON925eP0VlHZfRowU590OpMN9rIvGE=;
	b=NWYuAWA9b6HKRaTyrYbw5Pk8Aq+JqFZFLvbB4p3qiAEKtzZPiopi7dfz67KekRFoMm
	Q4ln5N6lKRugf73r7PSa3FZsQFalUylz51oCAkrbdwl7MvhDRJtQk3JrRHcv8etG+eoQ
	akNYXoThcLXWJmgSp/8QYkt1bHw9siJum9gZIL79SK8ub9O8YE/ERUcojdppfU1GQ9Gv
	/+Kehi41pc4wB4I58T3n+5s6H5lOB1VwcCXJxFk3R7BP/hxAwc9Ooz2kKYmPVh4RcCGg
	dAwfhoo+DsCIrTyM1yz8Q9v5npKRYgb+1iT0ZkymKP6I4fyVSV1iY9W1QeUQhlGC4bOY
	ZtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ejPRqtWnQYrwxON925eP0VlHZfRowU590OpMN9rIvGE=;
	b=og8/aHf0gf1/1II3WLcMW1Cqon0cQp/hdXkgWw/f+J25yxKkFM0r/j25aTRxnBbMEU
	jEPiEc+9KXtZpKYi4fi4EYeXagg0RtkF4Adhx1YyJeR4EG0cEHt2hXxYRBz2D/ht+MC+
	PeTqCTl2m3wTEPly90qp1COJLQyWAc90WR+hW2jYisk0MTds+v8fEYUTvrpBgbh34XYz
	8LsoY/HvQt6yTbmxwTJ68XiQABnrgvBC2UDF1ccGH1KPnn3mkcXsEbMkJU3znxMP/IZq
	dzgcgKcTNKa/903pwggUnZQY15pwSkWNinhviURfq5HwQHsHL0rGNgJ3Eg5+Hubx0tMx
	Qmig==
X-Gm-Message-State: AKGB3mLjmlMLKUHKZrhMoMzVtcxuGfYgtTerC5G8b3VslFUmjiuzZZ01
	/IU3SFQAoIiQiY4iLh+QiOxuJosrFC4uM8fhznY=
X-Google-Smtp-Source: ACJfBovgNKu7eJO6wqbKUXihYGW6gj7bcmGqzWBiS6BsHzi8wUIdxSqDRatNDt3Sgaknv0MS3mlwtYDeyjEqYopwkkA=
X-Received: by 10.129.4.204 with SMTP id 195mr1225542ywe.45.1513160411247;
	Wed, 13 Dec 2017 02:20:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.97.6 with HTTP; Wed, 13 Dec 2017 02:20:10 -0800 (PST)
In-Reply-To: <20171123062011.6040-1-daniel@zonque.org>
References: <20171123062011.6040-1-daniel@zonque.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 13 Dec 2017 11:20:10 +0100
Message-ID: <CALbNGRQ1nOYfm+kfnkM3_DK+rA3eaz=s8_CmBPMAuCTca_Zthg@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Bump to Qt 5.9.3
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
X-List-Received-Date: Wed, 13 Dec 2017 10:20:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 23, 2017 at 7:20 AM, Daniel Mack <daniel@zonque.org> wrote:

> Drop one qwebengine patch that went upstream.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
>
What's the status on this patch?

Andreas


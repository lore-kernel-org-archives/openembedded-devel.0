Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 12A376C4F2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 22:49:29 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id a67-v6so6705694ybg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 14:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wFGf1pv+Q4cGI2Kana8CBxrHntDZClrXXDxu7OWUdiU=;
	b=c6Zdg+pQrF0kdWaLmO6G88gI7zh51A4m/U5hHnkSTLFiGtsN5632eDBxFkxw70p6/d
	xiZdTdTTj6EfXKmrbNGA5e+JsRp2xYcBSWx9pnqKd+d/QHPZ5pgAJtnuOaVdt1ZIfBxG
	EDn5+TJ4vCu6YVvNHPtczbe8sunFF6f5fAoDAHIKgGn1Pm/3QU8o3UnzI+NrqE7P8EgV
	soxCQ9J4czgmRkI75TBOtXJ6TAyBNXK0V+rxB/w5Zq+bnfuVG0mNbcKEMTjwazcbWIhv
	AjEMxi7jhcdGptjXOHCq4V7a1RCPkKtNnlZEdKdQcr61yjgktM1GhBaVQE3kfYVqawES
	gu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wFGf1pv+Q4cGI2Kana8CBxrHntDZClrXXDxu7OWUdiU=;
	b=gePqMyXhZp/kqQbd8Q2ctcfjZf/zirJ31E4JOFxlfgx0micHPVZYXZnIvBQPA/Xbqo
	3Sh6OQ9+EzNLWz+RTOr6pnUxJ6gYxwlWJMH4mUU+udjFBPcv6QPy4/5i/ZF8ehiurmnu
	IPpnqqnyALthk1mxQiCmDKUOHN4klL5CsXp0KB64nSYaMSWtw5MovPE0mazB3rg3QeJ5
	o2pbNle+xojiuu+lOGM5VAg+7y3O1UDVOa8zrc7zJajdG/v+1ByVdQiVzjH4T5v3o95Y
	HrPeER9evKebp7l3+mhzxFr0xBBuIIuWLQYNu5JT/lh4VO+QIFIkflbBf95hjoHGsGxm
	zAnw==
X-Gm-Message-State: AGRZ1gJCUtMi7+4WUF0cuybMO6LqPVGlzMWqIFHEslWHvXUegOBBRK3N
	ljkcgQzVSBJQnSZLmarkQdvwEuWVUhozE5Ola7c=
X-Google-Smtp-Source: AFSGD/UiApP1JMlrhY/0GiTnyP7cXropmnROfUDa3JUu6ELlMsDCpeJgXgu89cxcOlXRPC6tc4tpsVT1aRG/THMehPE=
X-Received: by 2002:a25:ad4a:: with SMTP id
	l10-v6mr30528858ybe.10.1543272570791; 
	Mon, 26 Nov 2018 14:49:30 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<CALbNGRR8iKjx6PW52HjmPVi-DeyOG2L41==Tnj3AjZaFFrxR5g@mail.gmail.com>
	<CAMRc=MdVJYYBcB0NkQpE2O3qQ=c+mnj6+ktsxRMdjBpPALOgZw@mail.gmail.com>
	<CALbNGRRqeSVDzM8tn36t01YiAS0DJE_ExSXNRupp6esOEF7oKA@mail.gmail.com>
	<CAMRc=MeRzY9U89thd5CV4GZFdq2TzCFP609vOuvcnQkJhxeTnw@mail.gmail.com>
In-Reply-To: <CAMRc=MeRzY9U89thd5CV4GZFdq2TzCFP609vOuvcnQkJhxeTnw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 26 Nov 2018 23:49:18 +0100
Message-ID: <CALbNGRS2L1knaB0OuTizL5+YGGjik1nKVZGAgPdes9HGL1GQEQ@mail.gmail.com>
To: brgl@bgdev.pl
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/6] sigrok: set of new packages
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
X-List-Received-Date: Mon, 26 Nov 2018 22:49:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 26, 2018 at 5:26 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> This[1] recipe is enough to build pulseview, but I'm not sure how to
> go about requiring libsigrok to have cxx set in PACKAGECONFIG. Should
> I add a bbappend for libsigrok that would do PACKAGECONFIG_append = "
> cxx"?
Have no background but why not enable it by default? Both dependencies
are in meta-oe so layer trouble is not to be expected.

Since your patch is already in master-next: I am fine with an append
in meta-qt5-extra.

I suggest once this series is in master please send me a pull request
- will test and create thud for meta-qt5-extra (don't expect this
series to land in meta-oe thud..)

Andreas
>
> Bart
>
> [1] https://github.com/brgl/meta-qt5-extra/commit/06852587c29de7039098f9dfce52b6b4ba13b766


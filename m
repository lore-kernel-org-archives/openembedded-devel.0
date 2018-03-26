Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f179.google.com (mail-yb0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id BE7E4785A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 22:27:26 +0000 (UTC)
Received: by mail-yb0-f179.google.com with SMTP id o3-v6so4433329ybm.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 15:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SS6q9TvIiljYYx6eiToyfvVw1q+QdI55wv1YykiO8jQ=;
	b=mXT2Lvr5FL0Q5Ut2VhymsDaBSx5iDnw7WLUxsghcXyCH5eFTdnXpTGKoJvGNRlVq7U
	RifxQ/REQGYXGoisHhgvnm2jsWaY+2puZ1DHE1CKxkgtMUiwYbfvQM8EhEuxIlRiDNOz
	xT9uyIBINMn93lH/3/OLKgbCYm4XNnpnaFc0nJcnEoAxKGZBFpZwf88FnrINrlLKVGKn
	ktd6gvi6E1H3zwazpFmCGIwUmQeX5jt8h3OCW6Skykr19msw9aq2DDi8RGJPxs/4c6xk
	uTsBirqRer4s46CRe3Cg1x2q0GB98kZG01qC0gxqo4OK6cJHLkw5vBnSnegYArI0e+mi
	XzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SS6q9TvIiljYYx6eiToyfvVw1q+QdI55wv1YykiO8jQ=;
	b=ic/3yX36GnviU4WXgBRisUBD17IixYExCFl0T1sAnUvk0cMA0W6ZObHeFV0G2VfTj/
	wGJcvvQcgNup0dx/m4iQF+RxDX4czUNzGa5i0ErsX3lTCr60mhWVCFWKLSbXAzM4KOY6
	oE4Q+sKDpGMYkASENajE/8WQ8ZuVtL/6VN1mc3WPVO5wSzwatjuwp1MQitDzyEFEFHtS
	Rw5TXzgQj2LkWj9pvtWPfHAHHD5WQtOygwIjrAH6jRttBrFY6GNcEAPWT/6Gf3LpR8sk
	8rYEH5x9lmRMLN6uqS5RQRMiEFrWvJb15tUa57seNyxaskF46N39U90mnrsdRLceryKd
	YSoQ==
X-Gm-Message-State: AElRT7FrkpOTrb9PWLvLXHX39D+CXalo3bJNBTX6THW7SiLid3MqMNFw
	ALHWs/6Jg6mCvNEDoRFoXMIvISfa4cCu7RBEWHM=
X-Google-Smtp-Source: AIpwx485lYBmnbEYX0X1VQAiXXv+9z1+q9HFMTvDUwp35JzG5n5HtDdnf7hYpQzmQ9wpBU2zE5f5oXavIZp40GFZ8pU=
X-Received: by 2002:a5b:885:: with SMTP id e5-v6mr1967647ybq.180.1522103247462;
	Mon, 26 Mar 2018 15:27:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 15:27:27
	-0700 (PDT)
In-Reply-To: <CA+chaQdxLj2hAqfvK1YKKKAsg0e3PxGor_K0nfamN+NWAw7hcw@mail.gmail.com>
References: <CA+chaQdLz1OuDFa2BMTRz-D=xwFk4PFbASJOsxR=578_jQuP4w@mail.gmail.com>
	<20180326214334.26378-1-Martin.Jansa@gmail.com>
	<CALbNGRTNSvJT-PO1GMSaaVxpdGjuJKxZTotkXj9dFXLJVV7e-w@mail.gmail.com>
	<CA+chaQdxLj2hAqfvK1YKKKAsg0e3PxGor_K0nfamN+NWAw7hcw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 27 Mar 2018 00:27:27 +0200
Message-ID: <CALbNGRTyS5H=BK4sZ+YeJnT3=4DeyCGtUw6pGJ5zQAWJQfWQVg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv3] mozjs: refresh patches
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
X-List-Received-Date: Mon, 26 Mar 2018 22:27:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 27, 2018 at 12:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Mostly because I find the proper patch headers useful.
>
> When doing the refresh now, I find it useful to also add original author and
> patch headers even to patches which currently apply cleanly, so that next
> time I can just use "git am foo/*" (or use git as a PATCHTOOL) and get
> usable results.
>
> I understand that it adds unnecessary changes (not needed to fix the
> WARNING), but IMHO better in separate "refresh patches" commit, than next
> time someone uses devtool for actual mozjs upgrade which might refresh the
> patches even more to make them applicable on new base version.
>
> Regards,
>
Understood - but by moving the patches devtool has created to the
original location (often they are already there) and use git add -p
you can decide for each Hunk if that is necessary or not - but it's
not that important to start a longer thread for this :)

Cheers

Andreas


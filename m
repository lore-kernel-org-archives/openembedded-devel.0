Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 53719782A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 00:03:23 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id w1so923819ybe.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Dec 2017 16:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=AcsqhD3IP+ZBp5sJy3DPbpq/z08AVQx0TlZXzPasV1U=;
	b=BTByH/0xo6vppsCJI//PfhnE1Ami6g0KaqqNWk6yWVk5S84Q7LJSOeYcAH7IjFMSSe
	AwFeQB5JvwbZmyplTRRE3CDcpI0Rr+0XM/ojZPFJ0FvBP+pbtYzD2VWUZH6nrVgI9xoO
	xhMEJA3uEp0rbryvmBdPE+RY82/YO/W68l1tvEZsMls3v9nwn60ERTbCmZnrnzHgIEhS
	tX24HoSurvIxJWREW3jJWjJzUUilEjkNR8Nw/Xyqg62b1cZqhP6YbFf9t/MFlsvAyEd6
	6IbbJSckuEqv4hcdiPrdBdf5DGCS8CJa0C4AWyXU/FUlupz0dZ5fNmJ6SbrZ2UC1+pzb
	yYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=AcsqhD3IP+ZBp5sJy3DPbpq/z08AVQx0TlZXzPasV1U=;
	b=bym78yz4qagykCl2viEDdMbwyl5aYghF9llIVMgkuzkcTRTFBPqeE1b17/2CYN1g3M
	J/qFyPRO7Fm5y6TZOkU9qK1ZUI8TzsiDgqCNxB9xdkwd42ubqJEoSThuzmw1dm6KJZXA
	g1DeZxjvU7dqxtL3t5wJBAApvfSr19Bmhu8xPjCyi2QA2V0/H9DDk563EMMk0j2LCcnV
	zeb+esaWgiQ2+JX/pb8NXLl7OcSfcPaqoFBCdI4bS3e6aXQKT5jTrxpBQclVHIR8KNg9
	WwQY5JubWebKDS2HA5WLWS7aLlwuh2GAatkxRjiq0Q7iBIgZ/ZwDnYe2z/CfGQ87ORsQ
	s1kg==
X-Gm-Message-State: AKGB3mJCct7H0fFmcMr+HsdAGRu46FUHc4iLTTViYzvcIFZhfOxQAQwr
	QKy6Kephc+hb5Gx37pGPpNqoPjc1tte77AZ9/2g=
X-Google-Smtp-Source: ACJfBovooeugJgMeNyjYIb+SaKTQ4X0tYO52GKK6Fob1Qf5SZUZl8QkhBs1VMFnIgy10xNNQqYVBWbM8hqamowEaonc=
X-Received: by 10.129.85.132 with SMTP id j126mr9929351ywb.295.1513469005080; 
	Sat, 16 Dec 2017 16:03:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.97.6 with HTTP; Sat, 16 Dec 2017 16:03:24 -0800 (PST)
In-Reply-To: <20171130081026.25414-1-schnitzeltony@gmail.com>
References: <20171130081026.25414-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 17 Dec 2017 01:03:24 +0100
Message-ID: <CALbNGRRptpj43Qxej6UrmJ3yBynjR9AjuUaOJwy=RZW7j6mEEw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] qwt-qt5: rewrite completely
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
X-List-Received-Date: Sun, 17 Dec 2017 00:03:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 9:10 AM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> * install pkgconfig
> * fix examples
> * DESCRIPTION -> SUMMARY
> * overall cleanup
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  recipes-qt/qwt/qwt-qt5.inc                         | 48 ---------------
>  ...h-from-binaries-they-point-to-buuild-area.patch | 69
> ++++++++++++++++++++++
>  recipes-qt/qwt/qwt-qt5/remove_rpath.patch          | 17 ------
>  recipes-qt/qwt/qwt-qt5_6.1.3.bb                    | 45 +++++++++++++-
>  4 files changed, 112 insertions(+), 67 deletions(-)
>  delete mode 100644 recipes-qt/qwt/qwt-qt5.inc
>  create mode 100644 recipes-qt/qwt/qwt-qt5/0001-
> Remove-rpath-from-binaries-they-point-to-buuild-area.patch
>  delete mode 100644 recipes-qt/qwt/qwt-qt5/remove_rpath.patch
>
> ping?


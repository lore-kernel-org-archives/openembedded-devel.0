Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 03D9A7F896
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 07:16:58 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id u184so5944900qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 00:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0YUJcL/G4j37KoXTkc6Xr03i717DopwbmgUNL/vCJlE=;
	b=SflLUhNwToLY4YMX5CLG1dnMkqTSHf+5TAXp+wBUHBC6uVdxBOhDkVa05S5Umc3h0i
	eg985RqxePrmejyAmZHIN1ma/Nvg0Gd5/xjY3aEaCJaoDvkMGHvs1h6U3YIQt9CCM2Jm
	UUHL03RxZLV5/P06BgJvsPERietPppakGaQwfgvRdGEfnpQw6d90xj+xXzTTti1xtKgE
	B/S+1X8F78leaTucX8Qnwj8d9kLm6/NJS6x3GT9a0qTebh0MBHUas1XN4UlpykUEHyte
	aQ5Dji+yqWcD6eOQpJYgxH+NPXF/mh4zDeafV7DIlMKABSaWUiYZNC+FYLrSEHEO7wYV
	GAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0YUJcL/G4j37KoXTkc6Xr03i717DopwbmgUNL/vCJlE=;
	b=RaIoWMY/wy2o2yEaNidk/y8Zl7z+8NCoOyS9YkpH2GLfeXeSfmvlJqOYTT9h6WZmPB
	CK1nMHYMdrZGBFrs2ZSlcQkYO4OuUAyBf3iI0VnbtjzsqTT8IgOv9QeOx9cXtDr7Sg/8
	N7keHZbseAR9oBnhphFibpTrU7oD4Xa2HK41Jd34H/CdYziEs+K7fiQSnuekDz0I7a5q
	oMC+WzTwFKDqHujqAAJ/ouKtz7lE6yqu4i8ngZYdonIEYXbbw+H8/fyXY/8XOQhgSQ2R
	vcss8o/N1hCQbpjuGWgUwYiK5wIqp7yI4TGB/QlI+TuZD98l1uY/cYDs8V3LGbfqxaWp
	9UNw==
X-Gm-Message-State: APjAAAVM9R8h6ww/BCQfwaonmbnpqm1daF32bDCBy41XwpLlD4Ewp6GR
	ojWmh9fp/z1x6UZZFyYEMO4ZdEtBF4sYWYoGJdQ=
X-Google-Smtp-Source: APXvYqzftEDE0BhJfkqF8aH+e0hpX4g1ceNVbKAy3nu+u3eSObvUHRM87xcbfQzEtW93oLsmacWGf8eTTyaCN7lCVms=
X-Received: by 2002:a05:620a:20d2:: with SMTP id
	f18mr4111067qka.474.1572506219232; 
	Thu, 31 Oct 2019 00:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <1572261789-121779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<9eeabeb7-0884-eab9-55a4-18a219615bd7@windriver.com>
	<CAMKF1sp5SCXPWHSd4PsGBwOZsxnteyhQNpLuSY65NgOGOWettQ@mail.gmail.com>
	<6f5adbf0-44a3-ea21-8bc0-63b6ed195a19@windriver.com>
In-Reply-To: <6f5adbf0-44a3-ea21-8bc0-63b6ed195a19@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Oct 2019 08:16:48 +0100
Message-ID: <CAMKF1spM+W-vKm1UO=N6vdsEuRVKV5uCsoizncp4vrQKoedv6w@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] daq: upgrade 2.0.6 -> 2.2.2
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
X-List-Received-Date: Thu, 31 Oct 2019 07:16:59 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks I think I will rely on you to monitor it and update both recipes
together when 3.0 is out

On Wed, Oct 30, 2019 at 8:51 AM Yi Zhao <yi.zhao@windriver.com> wrote:

>
> On 10/28/19 1:56 PM, Khem Raj wrote:
> > On Mon, Oct 28, 2019 at 6:15 AM Yi Zhao <yi.zhao@windriver.com> wrote:
> >> Hi Ruoqin,
> >>
> >>
> >> Please don't update this recipe because the day 2.0.x is needed by snort
> >> 2.x.
> >>
> >>
> > is there any way forward for snort.
>
> Snort 3.0 which depends on daq 2.2.2 is still beta version:
> https://snort.org/downloads
>
>
> //Yi
>
>
> >
> >> //Yi
> >>
> >>
> >> On 10/28/19 7:23 PM, Zheng Ruoqin wrote:
> >>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> >>> ---
> >>>    .../recipes-connectivity/daq/{daq_2.0.6.bb => daq_2.2.2.bb}
>    | 4 ++--
> >>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>    rename meta-networking/recipes-connectivity/daq/{daq_2.0.6.bb =>
> daq_2.2.2.bb} (88%)
> >>>
> >>> diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
> b/meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> >>> similarity index 88%
> >>> rename from meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
> >>> rename to meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> >>> index 42ffb17..29ac5c7 100644
> >>> --- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
> >>> +++ b/meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> >>> @@ -25,8 +25,8 @@ EXTRA_OECONF = "--disable-nfq-module
> --disable-ipq-module --includedir=${include
> >>>    PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6',
> d)}"
> >>>    PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> >>>
> >>> -SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
> >>> -SRC_URI[sha256sum] =
> "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
> >>> +SRC_URI[md5sum] = "c61f60674a5f951f0c50faf33a611fee"
> >>> +SRC_URI[sha256sum] =
> "7cd818cabb1ad35360e83076e54775f07165ee71407dc672d147e27d3cd37f7b"
> >>>
> >>>    inherit autotools
> >>>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


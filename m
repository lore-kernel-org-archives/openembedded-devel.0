Return-Path: <ian@boundarydevices.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 87E5A786BC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 21:51:17 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id 136so10836407qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 13:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J61OJ7YM5t8SlS9M9SZ9ZWRHJ0NKbkumVc7OxK/B8Oc=;
	b=SjnAnhEYvR4MumTXiiwa7f/si66lceP7ecjHoX74Er4obfoGtvrF//T7h71leCOe++
	W5QJ9klQn2V0extIiud+QxLxy9AfEeGYnC9f2Y90DIHJDpKJX1sAA89DMRGnSHReI72P
	3Hz8fqCcKH8eAgXewNrbT9g6kpzXabVXRtkz2YLLuM1HS39kRa/TWQIAV24WHf9S2BPI
	2aInXzSs5NnZheiPoCDG68ZBL1+yfQ3FqEMgRz0zgHXGh6QAwJpbIWMf8aZxyIEJT+l3
	MjUO2NIctW7xeZJcgTTCDRsnVmAnjPcn8XfjHbKCYtXMK/negcnn+TFcEoGz/RXtxero
	HGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J61OJ7YM5t8SlS9M9SZ9ZWRHJ0NKbkumVc7OxK/B8Oc=;
	b=TGTctZw5qPs6Ph12Rw+L/9L+AwBAOgGXVagjKFtWhW5vjOBSQCjHnKk0bUKM4KkpHs
	C8hi/i1kxWrJuw+pAG73/xlai1oXzzPlAV2lKkMinroK4Uv9bj1HP7SbMWiSgL7FgAnN
	0XQGneT3m1/LdP7Rj7gZSQbpuoB81VuyrZfrzgp5/hTwQhLhIm5rFlt/zX5EKcvGMO65
	1DEcd8j07Ka5Up5bNjRFT15XPPKvcGO7t4r3Vt2VUlD0lVfON6FXORAf/SbI1hX0QlIf
	LlpqYMCWcxe3pBTZ7gwccTVUsASx06+/cgoV+d4X4oXtIqq/uiTTT3t7/+Hv9goghnw8
	6SqQ==
X-Gm-Message-State: AJaThX6Z4u5ZLkHaJglf7GUOtsfMWXHRUtofWqZAq/WuLU0rTDNRxvqC
	x/oJLV4vK8zDD71Q527YZfcLCBhBbLoR6DUKC3AAXw==
X-Google-Smtp-Source: AGs4zMZHJi7TwB6UwyE2I6eZ3BkfMsicfFmjNdS0y/O6DQzolroITu7CS2x1S0U68e5cCERWtmXLg53xEWbVviCwa1o=
X-Received: by 10.55.156.74 with SMTP id f71mr16260335qke.27.1510609878325;
	Mon, 13 Nov 2017 13:51:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.37.203 with HTTP; Mon, 13 Nov 2017 13:51:17 -0800 (PST)
In-Reply-To: <CAP9ODKqhY9miP9wf0rv_mhtyn9_dV6-Cm3=J6yOhmx-Y6qpGiw@mail.gmail.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapRKjZZ=yCYpfrm3CDVZez0JbLeaKHaZg2J3WhjBvRR6jg@mail.gmail.com>
	<CADseiP=dhrkCrqBnO+g-HZQZaGgf1ywZwFcd-0bpE9K-qhALPQ@mail.gmail.com>
	<CAP9ODKqhY9miP9wf0rv_mhtyn9_dV6-Cm3=J6yOhmx-Y6qpGiw@mail.gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
Date: Mon, 13 Nov 2017 13:51:17 -0800
Message-ID: <CADseiPnGDYTz-Ht=kTxGt+UpfeNx-Q6dGY-jOa=11JgvOEcuGQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Mon, 13 Nov 2017 21:51:17 -0000
Content-Type: text/plain; charset="UTF-8"

Where is this commit? I don't see 568227133be3f9f015679df3525f6c4f86304fd0
in meta-browser?

On Sat, Nov 11, 2017 at 9:25 AM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Fri, Nov 10, 2017 at 10:10 PM, Ian Coolidge <ian@boundarydevices.com>
> wrote:
> ...
> > Are there any obvious flags or compile options I'm missing here? I
> haven't
> > tied debugging into this yet, which is my next step here. Just wanted to
> > know if I was missing something obvious.
>
> Maybe this fixes it?
>
> commit 568227133be3f9f015679df3525f6c4f86304fd0
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Tue Nov 7 15:26:52 2017 -0800
>
>     gcc7/gcc6: Fix unaligned STRD issue on ARM
>
>     Backport
>     https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82445
>
>     Fixes [YOCTO 12297]
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Please check if it helps you, otherwise please open a github issue so
> we can keep track of it.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>


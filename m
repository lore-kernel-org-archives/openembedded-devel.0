Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 471EB71A8C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 22:45:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1511995560; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=jkN4S5Kwt2VukiImkCCWuO3eH09X9dvBlroNIo5oWWQ=;
	b=Kp7EhnfS+hv8B8UNq4qEK8IwwJeJCyOQQRIaM9adju7BQIVxmLddOLOzQoZn2qqQutH3patd
	X64vLutttUSc7vWJYY+FNX0fv5mJAQIgXbUKsimI0mZZuLeF/OmndiksfkDIFTKCrj1wV+1I
	VEo1JYyi+jev7UMS6P8poSENTXg=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mxa.mailgun.org with ESMTP id 5a1f38a8.7fe914738630-smtp-out-n03;
	Wed, 29 Nov 2017 22:46:00 -0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id i40so6513914qti.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 14:46:00 -0800 (PST)
X-Gm-Message-State: AKGB3mJyCuq0W3eeQhacq58ztRHPzhuVCFcLGwCRiJpV0AwnJpEg9Ypb
	w4bHhvgfndgo9ylFt3q5NiMKVkak7Akx/WnlG8M=
X-Google-Smtp-Source: AGs4zMbJPkz8QB8R71bzIOg/OlIuxICBLMu0i+Bamr0ErAoiLbmk4KCJhz7B6UzyN0KhBvl47PZnLLa5cZTjxAmZyPM=
X-Received: by 10.200.15.155 with SMTP id b27mr729768qtk.151.1511995559802;
	Wed, 29 Nov 2017 14:45:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Wed, 29 Nov 2017 14:45:59 -0800 (PST)
In-Reply-To: <1511994851-25043-1-git-send-email-derek@asterius.io>
References: <1511994851-25043-1-git-send-email-derek@asterius.io>
From: Derek Straka <derek@asterius.io>
Date: Wed, 29 Nov 2017 17:45:59 -0500
X-Gmail-Original-Message-ID: <CADNbA1r4BZnQh5qnFVPvzC-4_Xo_VKL2y8tqo-3eKOTqhVbq-w@mail.gmail.com>
Message-ID: <CADNbA1r4BZnQh5qnFVPvzC-4_Xo_VKL2y8tqo-3eKOTqhVbq-w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-bcrypt: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 22:46:00 -0000
Content-Type: text/plain; charset="UTF-8"

We can drop this one since python-cffi should have these as RDEPENDS
directly instead.

On Wed, Nov 29, 2017 at 5:34 PM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-bcrypt.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-bcrypt.inc
> b/meta-python/recipes-devtools/python/python-bcrypt.inc
> index 1ea62a3..3e6fa7a 100644
> --- a/meta-python/recipes-devtools/python/python-bcrypt.inc
> +++ b/meta-python/recipes-devtools/python/python-bcrypt.inc
> @@ -11,5 +11,8 @@ inherit pypi
>
>  RDEPENDS_${PN}_class-target += "\
>      ${PYTHON_PN}-cffi \
> +    ${PYTHON_PN}-ctypes \
> +    ${PYTHON_PN}-shell \
>      ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-subprocess \
>  "
> --
> 2.7.4
>
>


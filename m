Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 365F86E650
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 19:46:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1522439214; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=VthzTtrwHGQxmY1BO/cokFEn/X5kaGxfS+XI5p8z3xY=;
	b=gJCA8lg+xEF0m1lxxoL/LNcL1ijvXEeD54SV0M7iN5QaxsGhJPAwIl5DEt1/pQNLNXzalKnK
	ft9xgaCTQmXXNZMxBsN3Xr9aECLKjzDJ+93RWHYJDQL64w/5x3FSpESZ4n8JAN1r9/4XmBtx
	VxCkt0216z7+ambupO7gsH3GXrQ=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mxa.mailgun.org with ESMTP id 5abe942e.7f2ba00cc470-smtp-out-n02;
	Fri, 30 Mar 2018 19:46:54 -0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id h143-v6so12772729ita.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 12:46:54 -0700 (PDT)
X-Gm-Message-State: AElRT7E4cbqZSofhT+3VKMKuR8Yeh00a6V+V+E4HbovtHUYGGvL9Ax2Q
	i0McVNY9LCHwF5lnZ2E8RGm0kREmx7ERn3LE7t8=
X-Google-Smtp-Source: AIpwx48arkpDqWfLt0LZ6JHhdlouYQKMCqMm9PiyhP8u+dpPrbKdH2t/mBnl5bgHvyBHsxgt1dI5kBBZFR9oE9h6wPc=
X-Received: by 2002:a24:4286:: with SMTP id
	i128-v6mr4387587itb.73.1522439214059; 
	Fri, 30 Mar 2018 12:46:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.6 with HTTP; Fri, 30 Mar 2018 12:46:53 -0700 (PDT)
In-Reply-To: <CAPGMVzHX1O+POjqc03E+C7Vu60qXv2e_d0KJkLvqOH2innWBUQ@mail.gmail.com>
References: <CAPGMVzHX1O+POjqc03E+C7Vu60qXv2e_d0KJkLvqOH2innWBUQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 30 Mar 2018 15:46:53 -0400
X-Gmail-Original-Message-ID: <CADNbA1qxa_FQz5HbGssBLF_n7FHR+cfhNAj6FMT39+RnbqhVww@mail.gmail.com>
Message-ID: <CADNbA1qxa_FQz5HbGssBLF_n7FHR+cfhNAj6FMT39+RnbqhVww@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: koen@dominion.thruhere.net
Subject: Re: DEVELOPER QUERY
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
X-List-Received-Date: Fri, 30 Mar 2018 19:46:54 -0000
Content-Type: text/plain; charset="UTF-8"

A bit of feedback regarding requests like these:

    1) Please do not email general requests for help directly to
maintainers without including the mailing list.  When you email people
directly, the community cannot provide input or benefit from the
resolution.  Also, it usually ends up in the trash at least for me.
    2) The request did not provide any meaningful context on your setup
(meta layers, MACHINE, etc).  Without any context, the probability of
getting a meaningful response quickly is low
    3) The request didn't provide any of the debugging you've already tried
to fix the issue.
    4) Pictures don't really provide much if any value especially when they
are blurry.  A text based log is preferred

Using core-image-minimal with pip added to the image (openembedded-core and
meta-openembedded on master - MACHINE=qemux86-64), I am able to pip install
wheel just fine:

root@qemux86-64:~# pip install wheel
Collecting wheel
  Downloading wheel-0.30.0-py2.py3-none-any.whl (49kB)
    100% |################################| 51kB 256kB/s
Installing collected packages: wheel
Successfully installed wheel-0.30.0

That said, how is your network configured?  My best guess based on the
sparse information provided is that you don't have a valid DNS server setup.

-Derek

On Fri, Mar 30, 2018 at 3:00 AM, Rajath C S <rajathcs.1996@gmail.com> wrote:

> Hi,
>
> Can you please help me with what the error in the attachment is about. If
> I can solve this error and fetch packages using pip then lot of my work can
> see great progress.
>
> Thank You,
> Rajath C S
>
>


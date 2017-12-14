Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f173.google.com (mail-yb0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7C2FD77E44
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 21:42:20 +0000 (UTC)
Received: by mail-yb0-f173.google.com with SMTP id h28so4631828ybj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 13:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H3wgaqiBidVa3MLVVHOtIL0ZhUglxHTucl8g3i7UNnQ=;
	b=BbjM5WoGBOZXaYfHU6mRSkQZsdsQGMJGNY948TFfBBJUYPRCgVA5m7JiowUGbeGvfJ
	YmlL4APYcek9vbxbNVwaL+TtvcWh/ikP11BQQUG1PJeRvtIvZwMFDWl3WvJ08AYUgCt2
	TRbQXliqTRprUYWKBsaq1FfVEFEvyak5HllxouT90zJ4P8XshBcBkUxsOpZV7AbBLrz/
	7622ssatYVl7Xq46/U5/iykHLMebj6fGs1kaPn8dzzfkjsamel1dOvMbATzkzG7klk/2
	tnn0Kd0oS7oKrY/ie8ZU5mfp6XAyLQ4JpoB1oW90OV4XsIWRJFxER4uR/sjPmSyYaXac
	fmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H3wgaqiBidVa3MLVVHOtIL0ZhUglxHTucl8g3i7UNnQ=;
	b=O4FvMyeux3xW6/UTKs/B7tU3Uhe3E09Rvh/R7+yPn6VvWiwOwhdKJZOiyyB2GBf45M
	aqc3rJWuR/WogGnZalUKFV9wzmnPp5TdidgKT4m4s+Hh2v09hR2kPOSKONcdCK1rMDzD
	7Fn2Lw1RiZdl07VGE14hmEBE9jZ7gsNVjCO0gn+U7QWSlj5oTXmEQXSwfh28mbpXfi0l
	HkHFnR8DW8KiRzCI6bEb9v4jgqFzf/tOhVSrINanJ1Jro8XNo2l74OiD0wAVT5QAE4rk
	tMC4Qsol7F9ZmmqEt98Lud+LRI5uSfx4owY2j5337Zj/AokrtOfLaqPKzO3RfsB6YfNf
	BWlw==
X-Gm-Message-State: AKGB3mJ6xwdH9zKglE5dcTbiplCOem81roDTUY31NeJ5bbEvLhOUU4QY
	FfUF+5Fnz98m6NjbZMQKnvI2AN5gYEDsi38nqBA=
X-Google-Smtp-Source: ACJfBotN9UYo4ymNMjgQujQp712k+QGZWiHKppFCyyxu/8tbK96FpdUnGtIHjZdX6PrYJh1dWnZPjIzkFB3zgfjzthM=
X-Received: by 10.37.124.193 with SMTP id x184mr5469452ybc.219.1513287741291; 
	Thu, 14 Dec 2017 13:42:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.97.6 with HTTP; Thu, 14 Dec 2017 13:42:20 -0800 (PST)
In-Reply-To: <CAJ86T=V-2063Upvq+YU+Md4b5GiwN1O2S9eeiKDG2Hrh+y2SXA@mail.gmail.com>
References: <20171214100929.11094-1-schnitzeltony@gmail.com>
	<20171214100929.11094-2-schnitzeltony@gmail.com>
	<CAJ86T=V-2063Upvq+YU+Md4b5GiwN1O2S9eeiKDG2Hrh+y2SXA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 14 Dec 2017 22:42:20 +0100
Message-ID: <CALbNGRSxXRsgx9U=BwwD6h0PgfAhxKUS+L3+gGnU8VV1Jk-kRw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/5] fltk: add -fPIC to compile flags
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
X-List-Received-Date: Thu, 14 Dec 2017 21:42:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 10:31 PM, Andre McCurdy <armccurdy@gmail.com> wrote=
:

> On Thu, Dec 14, 2017 at 2:09 AM, Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
> wrote:
> > Building yoshimi failes otherwise with many errors as:
> > | error: <sysroot>/usr/lib/libfltk.a(Fl_File_Browser.cxx.o): requires
> unsupported dynamic reloc R_ARM_THM_MOVW_ABS_NC; recompile with -fPIC
>
> From that error it looks more like a bug in whatever is trying to link
> a static library (libfltk.a) into something which expects to be
> linking with a shared library.
>
> If so, then forcing the fltk static libs to be PIC is just a
> workaround rather than a real fix.
>
> OK forget this patch. I will find another way to get yoshimi building.

Andreas


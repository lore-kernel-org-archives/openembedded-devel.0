Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 02CC174A25;
	Mon,  9 Apr 2018 23:08:38 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id u86so6650420pfd.2;
	Mon, 09 Apr 2018 16:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0DVsYZqWFXwIxPYP5g8PdCb7KCThiuGJcPLPP/wFLmk=;
	b=vT7F7GSvzoQNKQA/y2m+jUWt73XQjUN01R/gmW3B6tEXlTho98ySS3Z6sEQG4PSynm
	RUkpO7xivqRsoWZ7KnwNIq7LnH2aMvYxrefXS+9WNUhRETxv+eIDqSH9kKCn1BR7Jmqz
	xZ51YRHx3aw9H5QkMWy98JfouvMuIHT8KZNc6/FiMvWZRxaZNIkmzc+bEfnHH9ujvr8Z
	NDNkEkFpxW5z/kdSBS1kzTe+EuPXpmUT79zsMHFgtX8kM+vwRVUMep0qkGtByGqzs/rk
	D39qErmEr71ZWmuiB1nCCkh9TuJvheJVGVR+fsOJHQaSMVLMLHcM9en59bc6WN0sBf4K
	Ft2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0DVsYZqWFXwIxPYP5g8PdCb7KCThiuGJcPLPP/wFLmk=;
	b=TBPGS9/VqYitmgQSBoYejObu0B6AWBl4sZebr5arER6AYRMNPLeABTOnFCtTnEAY7d
	aqi5wQM1xC0TEfZ+o2BC4cI5Uan45yUYHbmxPp+1jSybVFYqmaXyc5SChoB1O2+TntT+
	J+ecLlMQ0KuDy6x+Go/TrgYWU3Wq7kl6jFZLdTt72R9P2H0iWbyUl9Y/JVt77LqoSdAC
	bD/JIHXeaZ44QY32Iv10kZ4ZP5x8Q99gSSK62qxfYfXjNWdfMz5eGziiJZ9u0x2VZOQ/
	We5GUxlrX+j6MPxTmHljcpNN7infa2xuIT6qaXup7+zklQ9LRGz7h0kgqLf9s5nPgNiF
	RsaA==
X-Gm-Message-State: AElRT7FvSK32hVOh0Qb78z0U0cPmfrKppUY5RAWeCfXPH6MKA6/sLaQw
	DMc0R4RFmEKYvIsU9F9p77RthWQ+2egxhbilzF4=
X-Google-Smtp-Source: AIpwx49SBCU7T7sBALOv7AGBQciOuHVqcGFyzEg5gnfaA5yYV7YY5w4K99ct8GObhAnAcEyE2HZIODRTnqFU8ACNiH8=
X-Received: by 10.99.96.147 with SMTP id u141mr26683104pgb.227.1523315318915; 
	Mon, 09 Apr 2018 16:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <152313690992.11940.6799878390820377002@git.openembedded.org>
	<20180407213510.474412329D5@git.openembedded.org>
	<CA+chaQeNd3F9oXBYFsj4YaxfJ+k3uvXDcdcHy-AP32MWaHT8aQ@mail.gmail.com>
	<CAMKF1sqJx2er+dqsuESsw_ooxh59pvx5547JyFseBdK0Fjycvw@mail.gmail.com>
	<CAJ86T=U4f6OXG88uHqwg4URov+icap8B0ZFWOw_2uWoAx6oHqQ@mail.gmail.com>
	<f36e699e-2d1e-821d-5641-4d9552c66d7e@gmail.com>
	<CAJ86T=UOqT=F5OJr_GXVpkTdeVCjZiG6NjzA8b0D-2hc9QbsTQ@mail.gmail.com>
In-Reply-To: <CAJ86T=UOqT=F5OJr_GXVpkTdeVCjZiG6NjzA8b0D-2hc9QbsTQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 09 Apr 2018 23:08:28 +0000
Message-ID: <CAMKF1srFNCyuRDpSxqtvoU4DUQ+uHmyyVMuG1NAcLTTJADuabg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 02/02: nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead
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
X-List-Received-Date: Mon, 09 Apr 2018 23:08:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 9, 2018 at 3:45 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Apr 9, 2018 at 3:31 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On 4/9/18 3:23 PM, Andre McCurdy wrote:
> >> On Sun, Apr 8, 2018 at 5:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> On Sun, Apr 8, 2018 at 10:00 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >>>
> >>>> On Ubuntu 14.04 this fails with:
> >>>>
> >>>> ../git/gen-des-tables.c: In function =E2=80=98write_table_u8=E2=80=
=99:
> >>>> ../git/gen-des-tables.c:307:3: error: =E2=80=98for=E2=80=99 loop ini=
tial declarations
> are
> >>>> only allowed in C99 mode
> >>>>    for (size_t i =3D 0; i < m; i++)
> >>>>    ^
> >>>
> >>> You can patch this to move declaration just above loop if that helps =
we
> >>> should apply such a patch for compatibility sake but I wonder if ther=
e
> are
> >>> more c99 assumptions at work here
> >>
> >> It looks like the upstream intention is to be buildable with c99 + GNU
> >> extensions, so explicitly setting -std=3Dgnu99 seems reasonable.
> >
> > see this statement worries me from same document you quote below.
> >
> > A few C2011 features are used; the intention is not to use any of them
> > without a fallback, but we do not currently test this.
>
> If you don't trust the untested fallbacks, then how about explicitly
> setting -std=3Dgnu11 ?


That=E2=80=99s probably better

>
>


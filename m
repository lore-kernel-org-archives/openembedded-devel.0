Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 571446B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 13:22:15 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id vf5so116539278igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=LYgMCnYxuKePi0EKxJ7GnBIdhgupRpbD6vrGPFU9puA=;
	b=TSsJvo6vA36zaAN2H8+1Q5+QeQpRcW7zYG3FlB2dw1yRCydtU1B+9yiKO2PqU86jJ8
	CaYHreBlvjgaRSBcPyil/xq6LmWy/TnvbIWPa84I2fHVbU9jm08alQ2im5Aw7tAnI9aS
	kOPT2Qo2ImG+uhe01z52EuxfcIHMAYg7S6op5aNPABsTd5D7rKfsMUU4KNQnCVosxu1O
	UZs1Pe3Ufu9uIlhxHtYIp8yytvFEj6EUUHmhKjZ8FMVgXlGH1i7lPpld+aOvG9P//VR1
	lYrVSKDymXf4sW3Sk9QpxWsm/4hbrKymiOQOGka+8d86BMk9vCsvaeSbnT1+XmyyJ1sH
	0lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=LYgMCnYxuKePi0EKxJ7GnBIdhgupRpbD6vrGPFU9puA=;
	b=fXOpqtv7V1J5DtlyZPnRcMvaVtjcPddlnvsqJd+mdIZa7AITfQfb04QnP6iakFMwWt
	5Ugoom8FVYzAc2zyz1u1GVrHiZfMgImw6+xACYjbt9HMQWhw8CLGnns8hY8Q/lXmiTZF
	qRLW0Q3RYGPE0v8iJm5FDqlYs86nBqgsT29rurPhwmI0pTWSKrmhVeiQ/lj2CPOyYMtI
	f0vc4i787jDdvvOCqSmomh+G/iKGqB5WXvlTOfojxCsYK3WjKNRDo8kabAe1g6o+KHDB
	xPYdoi6fR305uxkh2r7px0u7N4f4VwouS8MXFdNMIrJg0MVeUQ3X+kn6yK1fkTuFeA83
	tnRw==
X-Gm-Message-State: AD7BkJLS75XxTBYdflyKCYC6vDEOyMNMpDzx7TIFQ1yktDrtsi9ioVJVaKqIyMZrBRjxhBLLC0kK01w7RJ0Auta3
X-Received: by 10.50.88.38 with SMTP id bd6mr1641192igb.52.1458134536258; Wed,
	16 Mar 2016 06:22:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 16 Mar 2016 06:21:56 -0700 (PDT)
In-Reply-To: <CALbNGRQ+Yw-Gw7OZLQyjPUtCUKaanhu4-Zs_ympD8SVu=K7FXg@mail.gmail.com>
References: <CALbNGRQ+Yw-Gw7OZLQyjPUtCUKaanhu4-Zs_ympD8SVu=K7FXg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Mar 2016 13:21:56 +0000
Message-ID: <CAJTo0LapY7+J+8KpA3rZkwg=2wvQj5=PgnVokgfBT=Ja6rRndA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Strange and annoying bug with gstreamer: 0.10
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
X-List-Received-Date: Wed, 16 Mar 2016 13:22:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15 March 2016 at 22:52, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
wrote:

> arm-angstrom-linux-gnueabi-gcc -march=3Darmv7ve -mthumb -mfpu=3Dneon-vfpv=
4
> -mfloat-abi=3Dhard -mcpu=3Dcortex-a7
> --sysroot=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
> -DHAVE_CONFIG_H -I. -I../../../gstreamer-0.10.36/gst/parse -I../..
> -I../../../gstreamer-0.10.36 -I../.. -pthread line
>

Never seen this, so I'd start by looking at the makefile that is failing
and seeing where "line" is coming from.

Ross


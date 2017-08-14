Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id DF77D783FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 07:05:19 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m88so35920480iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 00:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lrqCHh6yD9+6xNISWXFRH3mAZc+LgS7JoxUI2LVSv0Q=;
	b=H0edFbDqd9X2aEC3uWCP70k4x0KqOcwFfuETMTZxQW6vPBzNnQNh0DxyTnFS/aKqTq
	jgY0hB2LzCPgqjaGH2sPCYOW142XIbUhNYa2AgN+aZu8DPH3r87IwinBxEglZmvOg2GQ
	5fEaKfiFMQ7xnEYRGsabvF6wAeNq2eRXMEiuLt4Y+/696JKPA+IZV4/qBRFhAbpPSA/+
	RTKECSE2mMxRhDFt3iYWHhRl63gAMpzGkyv1mtc+8Gua0wBVX5UsGYf0Y20EyM5Z68aS
	QmG3Tb/r67m/LwiJLAkwHqH36KfvyALMMLghLOzkjPo5DPyYKpGXUkB5HB0vM0iiYepx
	ggjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lrqCHh6yD9+6xNISWXFRH3mAZc+LgS7JoxUI2LVSv0Q=;
	b=XIVzdbY53W8i9aXwJwCx2sm6t5WQg9cd8YCyxg2wvyHgiThgZHFiKa55gh6aBOlmxT
	tzMzndVkmyDKcw2YyFQ9Ro+rTmjwDSlo+HmL4PLTZe6pxFgLkt0/HZc0tbL9fUK18j7l
	OsOlBrqQa8ZPJc9RE7yS4Epxm78oMgvUXU/AmEUE+CnuIC805JmQ8kvb4MC4gg/gLVbx
	dAPmv0gYi/8LwSgfftmg5fQCshQ4o1OlRZVuXpci46rNBA4rvf1/pDf7SHgiw98viUmc
	4VGIK4HNZJ1bAn8HxsaRxqP5ZzOmtMQkC+41OaAg+W3FpGD3+PK+UaTfads9tS0BtMkX
	by0Q==
X-Gm-Message-State: AHYfb5ghG3+AGEO0/HZJ7MkNocpIMovsvOtj19l6Vm1OlkBjwrs9ABUG
	0x+8Pg2gCC9qdKF7yCMH9/keT7K7cce9
X-Received: by 10.107.25.137 with SMTP id 131mr18041634ioz.153.1502694320852; 
	Mon, 14 Aug 2017 00:05:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.19 with HTTP; Mon, 14 Aug 2017 00:04:50 -0700 (PDT)
In-Reply-To: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 14 Aug 2017 10:04:50 +0300
Message-ID: <CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Mon, 14 Aug 2017 07:05:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 13 August 2017 at 02:10, Andreas M=C3=BCller <schnitzeltony@googlemail.c=
om>
wrote:

> Hi,
>
> in current OE environment 'file' says:
>
> <...>image/usr/bin/chromium/chrome: ELF 32-bit LSB shared object, ARM,
> EABI5 version 1 (SYSV), dynamically linked, interpreter
> /lib/ld-linux-armhf.so.3, stripped
>
> This file is 4.3G of size and this does not fir into most of my sdcards!
>
> One note: I have an elder environment: meta-browser
> c79cf6c7811afd2cd167e8967e3c29b1e797371e. There chrome binary is
> detected as not stripped and properly stripped on do_package.
>
> Any idea why it is detected as stripped?
>

I have a vague recollection that 'file' and other tools can get very
confused when given 32 bit executables that are larger than 4 GB. It may
make sense to build a non-debug version to begin with to get around this.

Jussi


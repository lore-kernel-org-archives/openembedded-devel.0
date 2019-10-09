Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id F25AA7D5C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 09:10:52 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c6so3247331ioo.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2019 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AEHX8+TuV/dF/dZ4Le5BXAlNqYSHKtMs+ytsIZ0DiF0=;
	b=g+GywmFS6MCr3rA2Y0GkrOPRFeBijTRZppUXeFQKaf7nZxj0Zez1rQsfqJtzb/vuTN
	88jRAms6tCBmf9TAMYyhIWDGIo6lc7u4slgLNBekvOLuWBxWXzhu1/lajsljrDkYEuQj
	SFi4if7hyj6ne0I1bludXs+Eb6NjR9cugjrT7VSX5HmcudkB4x2OdzOjpAYhd2fM1eCQ
	nB+UwxTs6POvN9hp2y9F+kYTIQ6Wn2xfxNfEx5Aw2UKy8JRKjetMHQ57d6hOU1gM19vg
	6HTqIXcIKfBz5R3rnekuOMcf3kUjlm3Yj4I2jeNs5CyolpDRgMvrsTTcPkzBV6x28Zq+
	H/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AEHX8+TuV/dF/dZ4Le5BXAlNqYSHKtMs+ytsIZ0DiF0=;
	b=hdih8NXt4Z1Wto6VuIXEVSBuWC4qdDPZLd4nXA1neOjPBm/4Vxq+rX0cj12ZiOquDj
	HWcb2ZoA9IB+ZxqrCo8tFVvnL8HlqCwTVr0XBDdK48Jl6eJjXIE3eormf+mxtMBGCoUy
	yYfDZBCoyK6tzHvV2HkRCGw7dCn5GFoonQ63uWJdrTjiyARNHzsY17eiY8O+mj9+Qf+8
	VlAUD8omxgS/lIlcB/aypfNMQoYRcir/39VCQJQyXGSs7RSe0Ot7LF1dndEk/1SAIsej
	BUj4FTuFs9fStefgotQA/mSDwfZ+72bPOUkykBqRrWc9Zl6kLpRTpW8KcAollPF4XqmO
	03cA==
X-Gm-Message-State: APjAAAVw/ufKITXPL6U/2auwC7A+WzavlpcNh8zrUsMzwdkrD2Nl5Fnw
	7IO5bLqswDSpmKW+g2piyqypDq9iJG1u3vSdOFs=
X-Google-Smtp-Source: APXvYqza6aAOTWTiy1J76VHMIVA0j+HuFPlcpwMTRrZQu0rJ1d51Fdn4snIHeq5uDoyQHSJRIpQ2sYukkdc6FLFKbeU=
X-Received: by 2002:a92:9a54:: with SMTP id t81mr2155356ili.147.1570612253928; 
	Wed, 09 Oct 2019 02:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190926223206.26850-1-schnitzeltony@gmail.com>
	<20190926223206.26850-2-schnitzeltony@gmail.com>
	<CALbNGRTwfXEP0skCASQRq86R78ugkZw5NJGMFTgKhtL_Ohu0hw@mail.gmail.com>
	<CAMKF1sqYP5bee9=mcwLpiRU8rcbMWEdGz21y8iENkBtJm+a6nQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqYP5bee9=mcwLpiRU8rcbMWEdGz21y8iENkBtJm+a6nQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 9 Oct 2019 11:10:42 +0200
Message-ID: <CALbNGRRUSkp0scHNSewoXh2WTBcy4wNZK+nhY2AhLekMPRDHoQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH v2 2/2] xfce4-panel: upgrade 4.14.0 -> 4.14.1
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
X-List-Received-Date: Wed, 09 Oct 2019 09:10:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2019 at 10:35 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On Fri, Oct 4, 2019 at 1:31 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>>
>> On Fri, Sep 27, 2019 at 12:32 AM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
>> >
>> > * important bugfix release: systray draws icons properly when composit=
ing is
>> >   disabled
>> > * while at it renumber patches
>> >
>> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> If xfce-patches require review these days: Kai can you take a look?
>> If not: Ping
>
> Since they have been pending for a while
> I still wanted to give them a go for a build and see if all is okay. Stil=
l waiting on Kai to review them
>>
>>
Sorry to come back to this - did not find it in master(-next) anymore:
It contains a bugfix annoying me for very very long time [1]

Or did I miss something

[1] https://bugzilla.xfce.org/show_bug.cgi?id=3D14577

Andreas


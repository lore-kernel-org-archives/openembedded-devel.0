Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id B9F997FC1B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 21:53:11 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id g12so17573852ild.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 13:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=O+0ZHByn8idODxUA2wUjUd1WRv6UWkmPpvXIhlxLbXg=;
	b=unCwhURVNwaB5V3YS8BSb/uK6P6zwP9IW5EdjxxAAFWTpsEILHHtpWAKoMDBCj4mrK
	IQfBBSTP6AE3Xw9+o7h07Lfw7ZLy08zvDvWihr6bfw7HOem/9HoE/hGNEXVXROTYChQm
	+USQDOJ7yAplEj+gTuiBjmGpgIphFo4Y4QzuHZuEVOy0WfnHtsmvF+c6jQdYFnBR03oa
	tKUzrf2lCMfZ8EElMCNuE0K1okaZEk3DntRF5i066PBuJwmAUvacnf1APpxoq5uw1BTK
	JDKpzD3t6dW+wcEVmAXZz9idn+L70DlBUAe5Bd+bi6UNjjfVKKyCRHiHiLXhe2GYY+BX
	gSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=O+0ZHByn8idODxUA2wUjUd1WRv6UWkmPpvXIhlxLbXg=;
	b=JpExIJHB6iCXeUCVrMuQJjJ3Hgrt/u2uS1gteJ1h7m7gU3TXj98zsmjTswSSx2Eoa1
	4aUXBVYfJi78l+4bOW8ie/AfOKdseGID3FdALzlYb5awzKUNbzQSHpcKYiC5GZChEH6j
	wZFZwud3T0yCoYH6VN38l/R9BLsLYSSDp4IqBd01PfvkICm/NwVQ5y1FMA1Xjduy89cN
	RqUtM4RinIAUOB4XImvVKXLi1dAoSCSMj7VKMC2kmOj1bPzPNdRTF0YFr/trLCdnZ4m/
	y3FEMjvJl26dwHScD54TjA5D3eBqdUWBXl/AOAMMsf4WQZdY/ZFNOJ5Z+TyuGgFokxOH
	+YwA==
X-Gm-Message-State: APjAAAW1EuDtL1jEWxsUqWMueKtqRf3kyzNvjRdMa7YPRqPFu4yR1+M1
	uxy1RpkNHex6tFLUlBRdRq8+wk0DzMwA6nbdy+0=
X-Google-Smtp-Source: APXvYqyABtfqKF29htTmBl17ygj469FFpqusL6f8hALLaiL9ZC+UXcQX6Eg9gzcztdG3Ns/LTgDWB3BunsD1tKj/V3s=
X-Received: by 2002:a92:1d53:: with SMTP id d80mr37660095ild.224.1576014792688;
	Tue, 10 Dec 2019 13:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
	<20191209083612.23922-6-schnitzeltony@gmail.com>
	<CAMKF1spG5KPsiw7PkDG0JwPVGwJudMFduieEcmf73trCUMSG-g@mail.gmail.com>
In-Reply-To: <CAMKF1spG5KPsiw7PkDG0JwPVGwJudMFduieEcmf73trCUMSG-g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 10 Dec 2019 22:53:01 +0100
Message-ID: <CALbNGRRdspaYTVH_0Zmbrs-fUJBtJOjpVSiy24kBN_bHmR1yXA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][v3 05/20] accountsservice: initial add 0.6.55
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
X-List-Received-Date: Tue, 10 Dec 2019 21:53:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 8:57 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Dec 9, 2019 at 12:37 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > It is a dependency for upcoming gnome-control-center
> >
>
> This seems to have hard dependency on systemd ? or can it be
> configured without systemd as well see
>
> https://errors.yoctoproject.org/Errors/Details/296904/
>
> in case it can not, then we need to exclude it from parsing when
> systemd is not in DISTRO_FEATURES
For systemd not in PACKAGECONFIG it needs
-Dsystemd_system_unit_dir=3D'no' to avoid this error.

Test would take some hours so my question: oe-core's master has
already removed python2 from hosttools and to be honest I expect huge
fallout all over. So my question: How much time do I still have for
tests?

Andreas


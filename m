Return-Path: <gstroz@uber.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 865307C3EB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2019 01:48:04 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id x28so6792281vsh.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 17:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uber.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yGUeq8tu0qdEi57uWhcVhwAypoYQCrH8aELkHyeHChQ=;
	b=42dAGbT47SdRRd7wA6O1Ddq0jnWCC+x8ENEnjybQq+eI+38LlsK0bRMbx9PKmj4t4J
	llA/m3C7YRCfdpoFB+Dfe2B62jFwB9zICa/TjuG1iEF/zhz7/ppSmTE8XQIZBkcAprEX
	FdC90OFvwXPTPDSKLWvSXnVGD+ruTCuk5x2kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yGUeq8tu0qdEi57uWhcVhwAypoYQCrH8aELkHyeHChQ=;
	b=Kf4q+ZWuRy5mjfDHIWSICtPxoB3JoxkQ3i2AN3Ql9OmydxGw7we2A6zwXJbfYTHusw
	2/IL7AiyckA5paDejfh50v6MrNAEICkHNlqRAeVPCKO8dALi0jhSsxIQ2IWvDqZrJx1B
	CYJHwrGfjzz6OS46wK/NB0cK0Y+yTv6b/t+QodA2yEYp1f4897LQfnXF3L5A2QSoh3wL
	NY8cU+8w3LYYJ1L564EMsSS73tqxtfsFgC6XVOL/jqJ2xKXhZt/b5oAyV8IZUmSfCCmd
	dLXcbLbMaxcUO0EdjWmThRBUct7H33hjqm2HeBW5EpNij5IAiNqOkDywol3ldzdvfSd9
	36Qw==
X-Gm-Message-State: AJcUukf+4X2tnWOIbc3Bwmr0ZY4BQvcvKJ9lpYhsAb3K7Dp/jmQPePuV
	rHbV8xIp+qdScwYWmxLgA76Q9SZXIrEDXfrYKpNPvgUi
X-Google-Smtp-Source: ALg8bN7DbE+7OvbHgvXA/6vz8j/KK3wuIPFO5ePbNsPcSBBygfcXiZA1qdf5Cx9lZ6rHbbCc/k5knY0E17P8+7UdNq8=
X-Received: by 2002:a67:edd8:: with SMTP id e24mr5889546vsp.169.1548467285329; 
	Fri, 25 Jan 2019 17:48:05 -0800 (PST)
MIME-Version: 1.0
References: <CAGvkhOKTk5jicBPL66GY--+g=ZcJ-MO_PY_8iwrXC=Nyc7WaJQ@mail.gmail.com>
	<CAMKF1sqjg5MX0TFBmSJF_F3atvvBeQRSbfLP_MHA0SKyoNrO9w@mail.gmail.com>
In-Reply-To: <CAMKF1sqjg5MX0TFBmSJF_F3atvvBeQRSbfLP_MHA0SKyoNrO9w@mail.gmail.com>
From: Glenn Stroz <gstroz@uber.com>
Date: Fri, 25 Jan 2019 20:47:54 -0500
Message-ID: <CAGvkhO+zSyKxvyT4=9Qi5nNx6bLr0K45j=g5GbLL73fQ7A2WZA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] libqmi: Update to 1.22.0
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
X-List-Received-Date: Sat, 26 Jan 2019 01:48:04 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks. Submitted the separate patch to upgrade libmbim which is a
prerequisite for this. We don't use it internally so I missed it.


On Fri, Jan 25, 2019 at 7:48 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails configure on mips/musl see
> http://errors.yoctoproject.org/Errors/Details/218672/
>
> On Thu, Jan 24, 2019 at 10:39 PM Glenn Stroz <gstroz@uber.com> wrote:
> >
> > Giving up on inline patches for now.
> >


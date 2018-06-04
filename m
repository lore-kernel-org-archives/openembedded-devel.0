Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id CAF0774D2F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 08:07:37 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id g22-v6so8820947iob.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2018 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NAgqpg1wWn3h5jgQj2yHs3WjlfHOh0ml41Eizg7BDuw=;
	b=Re8oUE9tZ/pxsK5PY0+6hojNE9zfoyqxIXjuMF0+XkCc4XfT1TasUTjfXQXlO75SsF
	ic2n0E3hUMr+7k92TgxYhw08O1rQ6WhBDoD7U+F4im3OmBmxXclF9Ymx3zAui2l/EaQa
	i/N4830T/yOjzx4BBIFaIJDsvmTufgFu+cN5XRS5sBjEc5g+s75QdJMQNNOFg4QF6IcK
	s4vfuWy91l/MK8knkPnWct7PS13VTm/eu0kLvOzxQV6xp21eRUBSKry1tbhU9xxg8Pst
	+OkIIH9aoLlNwLV9uGZb/2orV/tROO44W+WPQVcorkMSMU5uTc/4jo4e41R+a42Mzuld
	Q4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NAgqpg1wWn3h5jgQj2yHs3WjlfHOh0ml41Eizg7BDuw=;
	b=AFaSRxMRuoQ67rBS3nKXFOKxFvgmFEJZcIsuNvsruFTz+aHZiUJkDOKTxqGZvs8/69
	hxS88IjhV6CfQ/pEKI7XRAzXzOP8PMB0EjVxOEawrHuyFlozhSN8CkNOPE03PASZRIiW
	xtDn+o1fVZYD5WOwcBXXJak/ggChbZNjzoRR02an0d+Y7nl1H7BHt9c3Uy5LX7IygxJy
	Ecnd41aflHRcYVCWArmDOboXWXbez4M4SkQqkfchK1Iror5c06rOVfX+TUc2U/FlMbZX
	gSZJwtBwMY4W4VstXn6h4smCmIvafS7yDstGqV3hjll2/PX8ND27/kRv92A7t7AVrdnv
	qNTQ==
X-Gm-Message-State: ALKqPwdxPVgiaJeDlww6t9DzNYtNpQUIRNYujVpt63EaRHweXm74nriL
	qH4lxP3z2+KiAndC0syTFI1LeANuai41k6j2Fbbk5A==
X-Google-Smtp-Source: ADUXVKJy+bDGaKi1abzj9Z+F/oG4OeigyJ5dh7uy5AiUW2Y42k23XqXPV3bbFFNk2hHKjolak3vlPsdbZpIFhNypgp4=
X-Received: by 2002:a6b:2401:: with SMTP id
	k1-v6mr15819608iok.270.1528099658846; 
	Mon, 04 Jun 2018 01:07:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:f614:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 01:07:18 -0700 (PDT)
In-Reply-To: <ce457d1a5cd7cc0bbebc6db4afa18011df24e6e7.camel@andred.net>
References: <CALbNGRTZOo_EaPNuQWB0iV-OVUy-uwKgt-PGwBz3O=ROqMZBxQ@mail.gmail.com>
	<ce457d1a5cd7cc0bbebc6db4afa18011df24e6e7.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jun 2018 09:07:18 +0100
Message-ID: <CAJTo0LahkP_3YULXEdZyU0287rEgMDxnvFDJKVFxxZJM=tozww@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Avoid version going backwards for beta versions
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
X-List-Received-Date: Mon, 04 Jun 2018 08:07:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 31 May 2018 at 11:28, Andr=C3=A9 Draszik <git@andred.net> wrote:
> In debian based distros, the tilde will always cause sorting to be lower
> than the version specified before the tilde, so e.g.
>
> fluidsynth-2.0.0~beta.1
>
> works as expected, and I *think* this latter approach works in OE, too.

Yes, RPM4/dpkg/opkg all support this syntax, so this does work in OE.

Ross


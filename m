Return-Path: <twoerner@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id B987D77FC9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 18:07:53 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id 139so18020712wmn.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q65rqqNHADm42u2A+4xC1impFyXTc6sD6HEm9mCL1CU=;
	b=fBg5db97S7rR28OVZwE08Rb0QNc8gPnetUrpuZDvSgMhYECdUh4Nyj2VgHA+tLKgsF
	Tzi1D9w0zZZxK3QwiUG4qyRuBh+RqY20RUTifTSBqgXU+IvUO7UwWz3cNRFzLNOSl1k3
	5fs3yHEKLYl+vqOX1qCyJuRd5sOWZk5LAjqgWu7n/VANMxH4Vo2c64SWN15fnEEyqkLP
	XvDxrgRq4S9KpoWM51jys18AMerCFLNwWvon8kXJmkJIsjNt0mMGihf95Hcwo9vB+Kmu
	ob/lzrht9J4+GRa6netDeMYJNbNGwWUEktMH6rYTZ1z6e92jWzPJzO/fguUit2VJPy9G
	vqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q65rqqNHADm42u2A+4xC1impFyXTc6sD6HEm9mCL1CU=;
	b=b6tjrxbPwLM205/+S5aeJO7CWS1CY+o0i2gDAv0YQhOdjdhn7GevjAHbeiEHTgilVo
	IXW6RMp6HxxU3lQ5+WrNjQYRPU91e0QJLNyTHFBR6wQrX4LhLD0TwiDEQCW8LA5ut5/w
	IVq3ND+28MP8Fzhy4bVPZza9jkp73oqbY2KQwkW13IxuCf0x5ZGAgwBSrYUh+Dfn1RLg
	wDg/ZF+UyQ0DLIAPBpkQK0Ax4/DAHf3Jmj+XDGjhlNxWrVga3YDXBGq7JhXAQBVE3kwJ
	AkfP49OprpgAChnyA89o839g9jJgC8qPuy3nBuLczsG8DEeyZklYHHGXay/USycuAYyr
	i9/A==
X-Gm-Message-State: AElRT7GkwXbCF3VhWrY0PI2BJpkxPnPy4gK3SpNphbgygS+1tnJmcchd
	cGs6l+AWjmRxn8Tk3EoLUdqea7NSUNd56xtf0JE=
X-Google-Smtp-Source: AG47ELs2i1e/3WiHwjcuU/uk3MUAYwr325j8w9QM5C+hf0pD2qnqkjX5Btym2unL+FsiTK9ElbyAS5fxfcSOZ/dQ7JQ=
X-Received: by 10.28.172.196 with SMTP id v187mr4370892wme.69.1520878074444;
	Mon, 12 Mar 2018 11:07:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.38.4 with HTTP; Mon, 12 Mar 2018 11:07:53 -0700 (PDT)
In-Reply-To: <CALbNGRSZrac1fEjm-=T19_wUHNcAp=n80KY8hcAWfwgV3QDv4g@mail.gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
	<CALbNGRSZrac1fEjm-=T19_wUHNcAp=n80KY8hcAWfwgV3QDv4g@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 12 Mar 2018 14:07:53 -0400
Message-ID: <CAHUNapT5Cr7LVZsT9c70mtEvGg4tTQeNpqyWyeuDrmxxLL49Qw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/12] meta-xfce updates + fix
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
X-List-Received-Date: Mon, 12 Mar 2018 18:07:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Andreas,

On Mon, Mar 12, 2018 at 1:19 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:
> ping?

You can monitor patchwork to see the status of your patches:
https://patchwork.openembedded.org/project/oe/patches/
In this case your xfce patchset is listed as "Master Under Test" which
means it's making the rounds in the various "state of the world" builds. If
it passes those builds, it likely gets in.
"State of the world" builds usually take a couple weeks.


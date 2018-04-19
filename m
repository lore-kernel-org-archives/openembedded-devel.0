Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9572D745B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 17:12:58 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id l83-v6so6853208ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BG+GcftuAkYe+eo5VmBLIf50zz7aovH1pgXawAgDhxA=;
	b=htvQHV0sY5iFccaliPh8NJluQcI7cHI4TPu4Gw8hao/FKyoRm5ARj4bhsQ+IPS+dZM
	nehPUI6vA+vIUVCqU/HLbD6haulK+76GUVWgemfdvj2OSeqrWjJKDHCYVR7lcymp/FL9
	Uw74UVgImCKNNINRiunBpsOwXLBRDMVirJABo7nPqAJREmey1DS5qp8rL7bb+08nRELU
	xNw4SYlmncxh+vxG0u4HIhNu1RcV934o6hl0HknSK6Lxn05fynER5bAk1feZtdgaO47N
	S4jaQOLi3GSxpvrxogo9ALO0K91fZF+1qB517FHgr9IsIGI01ZGcXiUIWrIX+y9Er2WK
	w1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BG+GcftuAkYe+eo5VmBLIf50zz7aovH1pgXawAgDhxA=;
	b=CspzTugSpRAHb4ltRsDg290RyhxqCrNSHwaozNoGzaSlnNJs1K4tgCjJ3TA2udK9ly
	KqfVLP17uBNtCc1mK/4giPn3qr2muLX5DsAsu5B1SDZDGi4v45ZG6ByQkLFc7hW83r+4
	ymHFq9Gwh0LogeAREdTEyS0Wa+7tCqTUEpWCREGVHZ9VcVHpNOc1hVmZ44SgUkFWMVm/
	d6avSNqGz4V/NIDZR08n+vio86OVHXRlUyc0Aio4Jv6xlFR61WGZub+ZU1K8D6c+B7Gy
	ve9GTv2u6VNzaDjekFEEJYxuWjDX+G0kMyNEEyp4L+7ux3wnl1EGzHjREGdEd9tk95J8
	jvsQ==
X-Gm-Message-State: ALQs6tCUGNc1F1V2SK4L4AmHUkNhXc1U7luinLDvX0Uh2uM93HnP3Acv
	b02gnY0llOol26tsJt8nd9S+wheVrCDyMJ9PdcY=
X-Google-Smtp-Source: AB8JxZrc/k4dvYHt4YEOi5DvQmTc0WmchwQmSP+YwsdvUJ5BLWloXaBzG7FaNiBPvsEDoluD1fMA0uR1EVlqVNRUnAc=
X-Received: by 2002:a24:3284:: with SMTP id
	j126-v6mr8013672ita.117.1524157979249; 
	Thu, 19 Apr 2018 10:12:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:894:0:0:0:0:0 with HTTP;
	Thu, 19 Apr 2018 10:12:38 -0700 (PDT)
In-Reply-To: <CALbNGRTnEb=D9X+Fc8i4m5AC6xW-uKEQD1Q6aDLY8X_4PfAMQA@mail.gmail.com>
References: <20180419141737.21053-1-costamagnagianfranco@yahoo.it>
	<20180419141737.21053-2-costamagnagianfranco@yahoo.it>
	<CALbNGRT17R_aw7NGTGo7_n6dY5ULsppkoE=OKfTJxC+vDESweg@mail.gmail.com>
	<CAATN8PXQ5ftKQCF8ZmWxdb92sst0AAZ3QMK7HMS4WRtqP9gv8w@mail.gmail.com>
	<CALbNGRTnEb=D9X+Fc8i4m5AC6xW-uKEQD1Q6aDLY8X_4PfAMQA@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Thu, 19 Apr 2018 19:12:38 +0200
Message-ID: <CAATN8PUROu_sOi3xBENkLGQ5J1GxLsuNLouq2aMVKywirhqjhA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] cpprest: add new recipe based on Debian packaging
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
X-List-Received-Date: Thu, 19 Apr 2018 17:12:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, I also addeed the "Forwarded:" tag, that is used in Debian
(so I can keep patches identical as possible to both systems)

G.

2018-04-19 18:45 GMT+02:00 Andreas M=C3=BCller <schnitzeltony@gmail.com>:

> On Thu, Apr 19, 2018 at 5:44 PM, Gianfranco Costamagna
> <costamagna.gianfranco@gmail.com> wrote:
> > Hello,
> >
> > I prefer whenever possible to fix upstream defaults instead of downstre=
am
> > patching.
> > My goal is to drop this patch on next upstream release, rather than
> > hardcoding a path in the bb file.
> >
> > https://github.com/Microsoft/cpprestsdk/pull/737
> Agreed - did not know that. The best place for this would be in
> Upstream-Status - that is missing.
>
> Andreas
>


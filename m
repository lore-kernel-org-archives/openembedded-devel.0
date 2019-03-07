Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9BC7C64B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 20:54:05 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id o6so18819548qtk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 12:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Toz7MoGfJzhbNKSveOSAsP8kXM0W/RtxODMI0+jB7to=;
	b=M9KKUtfXqupMVQyw7wPnBwBOkoByWWN94WaoRMZvLA/LykgtkNPm72eOy7Lan3h/HC
	ZUXXmU+yfUODDhzs0pgpKtOYz0hS7oWhZL7DzyNZV1euTjEIH2iAYGXyjWIyAEuvOA0E
	ctpy22o0aCwcJvyTlv7lGjY3dKAgE/mpC/qprhIIz/ZqukQPPsvXCTXGnKA7cbrXr+db
	RgjT7ewqVV7xM1vKH2ZqHKNQ0qMQAKB6IHahJY5JYN2IpjQQ0iJWH0IEtR1t+4mqfep9
	UJX3Y5oDK+IG47Vwi2/iMiaNhXW689qZYen6FQNeHIoiJ1+xc8CGrvSIGZ6gvUMQHWJm
	hl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Toz7MoGfJzhbNKSveOSAsP8kXM0W/RtxODMI0+jB7to=;
	b=KC9IAv5ihhtPHymFOcKUAW9mcvg7M1yqnBn9A7vWLSdVt+0RMiAyGR2Kp9Orysmw1u
	IJORGbP2sjYky9KuFCrdgZreuSLchP+Qzu+/0YaCWSJ/t660ds0N16OurqGZV3/0ffaB
	zN6fSLw4EbQE+39vQzjWtA1Qj4LckKIkkP41m8Lk41wKRdwHh67SO7Vvb1MDobKUNhyk
	fp57uCaX9TEivqeNmbMy777MoJ3pf4hHHW09yBKTg+bPbBhY/MeRdP/ZKAQ2WrMZj4Qa
	H96vbs/dLHP7+3bZeahSTRghRbWrjZQWBZuaKA/N836TikYS5sZApEoIAbiKWx16ZPMa
	wb5A==
X-Gm-Message-State: APjAAAXcvo7iozMRPCdEiMCbMFdgrYEdYNAq0n/AtJIBFje0xp6dV2WI
	BWI0ckC9xmWETVBELn7mh8w901w7n6kqtoI4je8=
X-Google-Smtp-Source: APXvYqydKzYyAVOx5P0AOrPaXXvbdgEYgHM5RDLxrMEKJsBoXOY4yC6n6KTyiKHWV9MU6s/6dT+xBO58oN55m3hkZA8=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr12100951qtn.253.1551992046269; 
	Thu, 07 Mar 2019 12:54:06 -0800 (PST)
MIME-Version: 1.0
References: <20190306054548.16430-1-raj.khem@gmail.com>
	<20190306054548.16430-6-raj.khem@gmail.com>
	<20190307172333.GA1278@localhost>
	<CAMKF1sp-k21Pmw_soord9-Sbwj1B4QO=yhvJELtbSsT-PBhSZQ@mail.gmail.com>
	<20190307204834.GX5026@bill-the-cat>
In-Reply-To: <20190307204834.GX5026@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Mar 2019 12:53:40 -0800
Message-ID: <CAMKF1sqqa3JziLChCLXt_5FmiRRmpgD=8PB7Ab=NGcn5pbCNLw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][PATCH 06/12] inetutils: Fix build on RISC-V
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
X-List-Received-Date: Thu, 07 Mar 2019 20:54:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 7, 2019 at 12:48 PM Tom Rini <trini@konsulko.com> wrote:
>
> On Thu, Mar 07, 2019 at 09:25:33AM -0800, Khem Raj wrote:
> > On Thu, Mar 7, 2019 at 9:23 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Tue, Mar 05, 2019 at 09:45:42PM -0800, Khem Raj wrote:
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  .../recipes-connectivity/inetutils/inetutils_1.9.4.bb           | 2 ++
> > > >...
> > >
> > > This recipe moved to OE-core.
> > >
> >
> > thansk of reminder, yeah it was in transition. I hoping Tom will send a
> > patch to delete these recipes from meta-oe repo.
>
> Yes, I sent one last week :)  Do you need me to rebase them?
>

its not in my inbox, maybe I missed it, please point me to it. In
anycase I have pushed a patch into master-next

https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=26e11bd62d066dfdb7034c981f6fca04411c95f2

> --
> Tom


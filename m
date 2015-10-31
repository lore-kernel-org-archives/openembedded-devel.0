Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id DC75073695
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Oct 2015 16:23:25 +0000 (UTC)
Received: by igpw7 with SMTP id w7so27421698igp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Oct 2015 09:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=+96GYAS8cmzSC+G0DcqclhmodZiBfmRovF7Uf1CU6fY=;
	b=wlFdio5/lE5GcelfoCgmoDhxDGInGFxFmIECFa9EmyL6LsWIgL5dl1u9GoHaEorLpM
	rDfvyecDsQCOgk64agMvMM2AJnZAQ5eTqIS93ibAT+ETNivixvWxhLnasgbOjNyHvWo3
	hFjn45vJRh0ssGRh4GlxBrBWuYfALW7F1C36V7l6RBHe+7qjOIy2N2ndHUm/Zo8z4j2L
	YRgH4ebdcLpYSBrawACZF5WMhCexLTT3wqUVF6h7oSOPXntRzktJ6yAjcLiZqwHxf+mw
	C1LnF/khs+V1LvP0PIGuuhU+d4zefrjCfF+3qXGPrOTaQd8Zs7xe1Kh90hLMRMW9Cprp
	p5Ag==
MIME-Version: 1.0
X-Received: by 10.50.64.179 with SMTP id p19mr3704087igs.64.1446308605821;
	Sat, 31 Oct 2015 09:23:25 -0700 (PDT)
Received: by 10.36.31.131 with HTTP; Sat, 31 Oct 2015 09:23:25 -0700 (PDT)
In-Reply-To: <CALbNGRSuJKWXkJXgYORYqs9jNLS0_s5h9gtS8NFxXt_gSehFgw@mail.gmail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
	<1446207225-15386-14-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1spmiD9ohoORXi7wnLBFNOFKeG0vgdpJ_n+-5b8-gp_F3A@mail.gmail.com>
	<CALbNGRTL5Q-enOj1dp4kZvu1=122ebseTizbhh+ondfH31ieHw@mail.gmail.com>
	<CAMKF1sqRg-WzvMpN=WwXj08zf7vS5kgC1Zr8-QRUt-eNsXhr7w@mail.gmail.com>
	<CALbNGRSuJKWXkJXgYORYqs9jNLS0_s5h9gtS8NFxXt_gSehFgw@mail.gmail.com>
Date: Sat, 31 Oct 2015 17:23:25 +0100
Message-ID: <CALbNGRT_kpwbZs8=Lg94XGrFnb8Qgmb=uQzmeJaLrF9GqmOUFQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 13/13] fontforge: avoid cloning uthash during do_compile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Oct 2015 16:23:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 11:17 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Oct 30, 2015 at 11:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> whereever they are used in sources use #include <foo.h>
>> and make sure that it respects -I$(STAGING_INCDIR) that should do it.
>>
> I know for sure - but because of this is done by patches this might
> cause additional maintenance when updating to next version of
> fontforge. But let's stop this here - Seems important to you to fix an
> error which nobody has detected before in a very clean way so I will
> look into that and probably send V2.
>
I checked - it is even more simple: just avoiding git clone in
Makefile by creating a fake directory - that's it. V2 will be send
next week.

Andreas


Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6AAC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 23:30:59 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.3587.1647559858199131577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 16:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout05.t-online.de (Postfix) with SMTP id 8A4741030F;
	Fri, 18 Mar 2022 00:30:55 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.192]) by fwd75.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUza2-4TIipt0; Fri, 18 Mar 2022 00:30:55 +0100
Message-ID: <2029191d-9920-31ce-e5bb-6bdd0c68417d@t-online.de>
Date: Fri, 18 Mar 2022 00:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][PATCHv2] perfetto: initial add commit
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20220317165929.527418-1-f_l_k@t-online.de>
 <CAAnfSTvFTEDAnHETjQX99vPNRq6fxcZdyB_93kcdpjbEeXzZhg@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CAAnfSTvFTEDAnHETjQX99vPNRq6fxcZdyB_93kcdpjbEeXzZhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1647559855-000184BD-9C849677/0/0 CLEAN NORMAL
X-TOI-MSGID: 2f3f3acd-c489-47e0-ab57-806503b0d8a7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 23:30:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96049


>> +From f70ed62ce4a42525c9738455966bec2ed9647568 Mon Sep 17 00:00:00 200=
1
>> +From: Markus Volk <f_l_k@t-online.de>
>> +Date: Thu, 17 Mar 2022 15:44:23 +0100
>> +Subject: [PATCH] meson.build: add pc file; build shared
> No Upstream-Status or Signed-off-by.
>  =20

These recipes are pretty ugly. I sent them to the mailing list, mostly=20
in case someone wants to play around with them.

If that's really the plan to add them i'll update the status and fix the=20
other little problems

>> +do_install:append() {
>> +       install -d ${D}${includedir}
>> +       install -m 0664 ${S}/sdk/perfetto.h ${D}${includedir}
>> +}
> As you're editing the meson why not just get it to install these too?
I was just too lazy after I found out that this header was needed for=20
Mesa but was not installed.
>
>> +FILES:${PN} =3D "${includedir} ${libdir}"
>> +FILES:${PN}-dev =3D ""
> No.  Always split into the usual packaging.

My issue was, that there is only a .so without version number and=20
symlink. All files got installed into dev.

Needed to add dev-elf to INSANE_SKIP=C2=A0 and mesa complained about RDEP=
END=20
on libperfetto

> YUCK.  What is this installing and why can't that be done via DEPENDS
> and SRC_URI?  This breaks offline builds and source archiving.
>
> Ross

This is ugly, i know. Other google projects like highway allow fetching=20
stuff as submodules

but to me it looks like only zlib and protobuf can be configured as=20
use_system here. But this is my first

approach on building with gn. I'm quite unfamiliar with it. Good chances=20
that i'm just not knowing enough

to to it better.

https://github.com/google/perfetto/blob/master/tools/install-build-deps

When I have more time, I'll take a closer look, but right now it's not a=20
high priority for me.=C2=A0 As it is at the moment,

this is definitely in need of improvement





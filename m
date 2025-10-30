Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BB8CCF9F6
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 06:25:44 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.21331.1761805538594808701
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 23:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Y2hMpU1W;
 spf=pass (domain: mvista.com, ip: 209.85.208.45, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63c1413dbeeso942413a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 23:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1761805537; x=1762410337; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=po3iwBFW6yCmUgNQBezRGQd2oSklihNC4n1APt4HiOI=;
        b=Y2hMpU1WdO6unqYSVESYWtzbTR/M+h5iP4bIHmD04Esf6n19x66n6oDDJ2ZWSzbglV
         KkPKaqGZM/uraeFMS6wvD++jpm47IRSfvMzjdaxZYhHequgyweX5mcG8nWdlnp41SNkA
         SlUFx2FBUYAfRwM7f0U4+z7IRb2oa/7OdhX+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761805537; x=1762410337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po3iwBFW6yCmUgNQBezRGQd2oSklihNC4n1APt4HiOI=;
        b=eUW8CbEjpI9FrKVxHAQJtt2sNn1DviPFl0pwGmSqd4I0BRXUwT8l3CW27nRVmJJLVm
         ZIOhBRYz8Mmx5+RIi3lz34mIN6Rgd7HdvCR2vm0ZrrqqogiavwEu6qtv4VCFlEwBm7bv
         j504XO/X7CV3BmcV5EBF9g9dxkxtnayerfRd5hYxh9eKi3+c7gqMohvPexoQMa2g2Jj5
         iBSz+omNzwNbylaBJ/YPdeAxDDjtWsZRDO2VZZRhTDxt9ZnIAW3J4q6cxb6k1QEDZL/H
         qSooXHayUSeCpbikr2p+NlSmq2Sa1NGsyYAMNQMbgcP1Lr1C8RZwViJ97i4I6KkgtZEG
         KBhA==
X-Gm-Message-State: AOJu0Yz7Wk89F2F+BRhEGYKBUI5y+CZ02x9Kjfu+AyvBHvN5V6gT55b3
	McVUOYddEhxq0p2DvFOfyvBCLFGzI+fvkzkgdAZtzorx8+Wz3Y5PbP5bTic3bAhSuSS16C+Bvof
	DJbIkltQAxPVpuqp0KXEI9BClUOU2WbYzux7PjmHr+w==
X-Gm-Gg: ASbGncuHpEc0HScBjJyphBjoQaNfxZ8CdHbUvHKzCrFACrEf1UeC2TP0FB3wqrtGcDy
	+YukkPWAc9vDfa7rrg1k5U/r92GPZauojddHSk7AxCGp1lPGttsDcqfYyZsfFizicqS7AMswlTH
	te4u1IbmfnXKCn3LeSsTuOVGXQZb1EnxPNoMEMff4Q0PKum2ekyVhFOXwUGf0dAAD6XqtFrmb11
	yGTcEqvW+okliYHOF1sFmRT+ApIpwERQfM6mNoCVMbXgetwUo4ZcupWXZ0YuWfniu+HD/MixjcP
	+fEMvEw7mNRiwbeI0dQ=
X-Google-Smtp-Source: AGHT+IF9u81FdRtk0VIEP27TyXDoXMRByAqdCyL/FaZXRUvKmo4iVgqoh3m7LIGD7AdC+eJPsgQQiPOH9UlVWNEIH74=
X-Received: by 2002:a05:6402:440a:b0:636:21b3:25a4 with SMTP id
 4fb4d7f45d1cf-640441c6a02mr4354301a12.10.1761805536957; Wed, 29 Oct 2025
 23:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251009132543.1680755-1-vanusuri@mvista.com> <d62b15e94667438900736a89a8220db30705a040.camel@intel.com>
In-Reply-To: <d62b15e94667438900736a89a8220db30705a040.camel@intel.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 30 Oct 2025 11:55:25 +0530
X-Gm-Features: AWmQ_bk3Ky3BG9PCsZQFZQiWiufJthHk4vv7LCqMD7irhbkADteeHu4P6ktNZ8Y
Message-ID: <CANQUz193KeDJuX8_WO9roc0T1-tOov2c2fdoMv+SAat+tX1-uA@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH] libssh: Fix CVE-2025-8277
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000031a46b06425a51c0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 06:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121192

--00000000000031a46b06425a51c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

The relevant changes in `ecdh_crypto.c` are located within the function
`static ssh_string ssh_ecdh_generate`. This function, however, is not
present in the `libssh-0.10.6` version. It was introduced in `libssh`
version 0.11 by the commit  `
https://git.libssh.org/projects/libssh.git/commit/src/ecdh_crypto.c?h=3Dsta=
ble-0.11&id=3D1eb3df5254a4348eae6edbc8a2bf08fef4015897`
.

Consequently, these changes cannot be directly applied to the
`libssh-0.10.6` version. This aligns with the approach taken by other
distributions, as Suse also did not backport the `ecdh_crypto.c` file
changes in their `libssh-0.10.6-3.1.src.rpm` package, which is available at
`
https://cdimage.debian.org/mirror/opensuse.org/distribution/leap-micro/6.0/=
product/repo/openSUSE-Leap-Micro-6.0-x86_64-Media3/src/libssh-0.10.6-3.1.sr=
c.rpm`
.

Thanks & Regards,
Vijay

On Thu, Oct 30, 2025 at 9:25=E2=80=AFAM Mittal, Anuj <anuj.mittal@intel.com=
> wrote:

> On Thu, 2025-10-09 at 18:55 +0530, Vijay Anusuri via
> lists.openembedded.org wrote:
> > +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
> > @@ -0,0 +1,89 @@
> > +From 266174a6d36687b65cf90174f06af90b8b27c65f Mon Sep 17 00:00:00
> > 2001
> > +From: Francesco Rollo <eferollo@gmail.com>
> > +Date: Thu, 24 Jul 2025 16:30:07 +0300
> > +Subject: [PATCH] CVE-2025-8277: Fix memory leak of unused ephemeral
> > key pair
> > + after client's wrong KEX guess
> > +
> > +Signed-off-by: Francesco Rollo <eferollo@gmail.com>
> > +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
> > +(cherry picked from commit ccff22d3787c1355b3f0dcd09fe54d90acc55bf1)
> > +
> > +Upstream-Status: Backport
> > [https://git.libssh.org/projects/libssh.git/commit/?h=3Dstable-0.11&id=
=3D
> > 266174a6d36687b65cf90174f06af90b8b27c65f]
> > +CVE: CVE-2025-8277
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + src/dh_crypto.c       | 5 +++++
> > + src/dh_key.c          | 5 +++++
> > + src/ecdh_gcrypt.c     | 6 ++++++
> > + src/ecdh_mbedcrypto.c | 6 ++++++
>
> This does not look like a simple backport of
>
> https://git.libssh.org/projects/libssh.git/commit/?h=3Dstable-0.11&id=3D2=
66174a6d36687b65cf90174f06af90b8b27c65f
>
> Was the change in ecdh_crypto.c not required?
>

--00000000000031a46b06425a51c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Anuj,<div><br></div><div>The relevant changes in `ecdh_=
crypto.c` are located within the function `static ssh_string ssh_ecdh_gener=
ate`. This function, however, is not present in the `libssh-0.10.6` version=
. It was introduced in `libssh` version 0.11 by the commit=C2=A0 `<a href=
=3D"https://git.libssh.org/projects/libssh.git/commit/src/ecdh_crypto.c?h=
=3Dstable-0.11&amp;id=3D1eb3df5254a4348eae6edbc8a2bf08fef4015897`">https://=
git.libssh.org/projects/libssh.git/commit/src/ecdh_crypto.c?h=3Dstable-0.11=
&amp;id=3D1eb3df5254a4348eae6edbc8a2bf08fef4015897`</a>.</div><div><br></di=
v><div>Consequently, these changes cannot be directly applied to the `libss=
h-0.10.6` version. This aligns with the approach taken by other distributio=
ns, as Suse also did not backport the `ecdh_crypto.c` file changes in their=
 `libssh-0.10.6-3.1.src.rpm` package, which is available at `<a href=3D"htt=
ps://cdimage.debian.org/mirror/opensuse.org/distribution/leap-micro/6.0/pro=
duct/repo/openSUSE-Leap-Micro-6.0-x86_64-Media3/src/libssh-0.10.6-3.1.src.r=
pm`">https://cdimage.debian.org/mirror/opensuse.org/distribution/leap-micro=
/6.0/product/repo/openSUSE-Leap-Micro-6.0-x86_64-Media3/src/libssh-0.10.6-3=
.1.src.rpm`</a>.</div><div><br></div><div>Thanks &amp; Regards,</div><div>V=
ijay</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 30, 2025 at 9:25=E2=80=AFAM Mit=
tal, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Thu, 2025-10-09 at 18:55 +0530, Vijay Anusuri via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch<br>
&gt; @@ -0,0 +1,89 @@<br>
&gt; +From 266174a6d36687b65cf90174f06af90b8b27c65f Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Francesco Rollo &lt;<a href=3D"mailto:eferollo@gmail.com" targe=
t=3D"_blank">eferollo@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 24 Jul 2025 16:30:07 +0300<br>
&gt; +Subject: [PATCH] CVE-2025-8277: Fix memory leak of unused ephemeral<b=
r>
&gt; key pair<br>
&gt; + after client&#39;s wrong KEX guess<br>
&gt; +<br>
&gt; +Signed-off-by: Francesco Rollo &lt;<a href=3D"mailto:eferollo@gmail.c=
om" target=3D"_blank">eferollo@gmail.com</a>&gt;<br>
&gt; +Reviewed-by: Andreas Schneider &lt;<a href=3D"mailto:asn@cryptomilk.o=
rg" target=3D"_blank">asn@cryptomilk.org</a>&gt;<br>
&gt; +(cherry picked from commit ccff22d3787c1355b3f0dcd09fe54d90acc55bf1)<=
br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D"https://git.libssh.org/projects/libssh.git/commit/?h=3Dsta=
ble-0.11&amp;id=3D" rel=3D"noreferrer" target=3D"_blank">https://git.libssh=
.org/projects/libssh.git/commit/?h=3Dstable-0.11&amp;id=3D</a><br>
&gt; 266174a6d36687b65cf90174f06af90b8b27c65f]<br>
&gt; +CVE: CVE-2025-8277<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/dh_crypto.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++++<br>
&gt; + src/dh_key.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 5 +++++<br>
&gt; + src/ecdh_gcrypt.c=C2=A0=C2=A0=C2=A0=C2=A0 | 6 ++++++<br>
&gt; + src/ecdh_mbedcrypto.c | 6 ++++++<br>
<br>
This does not look like a simple backport of<br>
<a href=3D"https://git.libssh.org/projects/libssh.git/commit/?h=3Dstable-0.=
11&amp;id=3D266174a6d36687b65cf90174f06af90b8b27c65f" rel=3D"noreferrer" ta=
rget=3D"_blank">https://git.libssh.org/projects/libssh.git/commit/?h=3Dstab=
le-0.11&amp;id=3D266174a6d36687b65cf90174f06af90b8b27c65f</a><br>
<br>
Was the change in ecdh_crypto.c not required?<br>
</blockquote></div>

--00000000000031a46b06425a51c0--


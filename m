Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7A8CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 02:46:54 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.6318.1761878803972596852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 19:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XHhJ81Bj;
 spf=pass (domain: mvista.com, ip: 209.85.208.51, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so2960740a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 19:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1761878802; x=1762483602; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f8qRhWZ+BJa8EpH5mYbPgIdZgMKHowWi17ijaS14OSU=;
        b=XHhJ81Bjdnj6ClLSh5mgOU3OH5eWMyViy+AaKuo17a20Z5X0c2crJoqURQ7/eDbaa/
         8Zu36e/QIJTyCxe1ljyB9KUnSbOckxVPFkuQc8H7oNttfjfYKFwP/yq+UWw2tAoxjp11
         fNBvV1+Z0NigAkrk0y8SRKWa1Y0vdtDMdR6QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761878802; x=1762483602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8qRhWZ+BJa8EpH5mYbPgIdZgMKHowWi17ijaS14OSU=;
        b=qU5YLKkBEWbMuAoeZbshm9Xm3EM8teBJPfkbqdmyp/s7IS7izfJIoaIg/t2y728AV+
         zDNUAaiMyR4USqLJ6qrEnh2ujciz3hvZz9ac91d04B/goQjRignlBjCuDXcyCjLFCUHd
         5d+GHc72GO5sY1Z/T4+vCtRJuOc/cfEIQgq6nXeFaF5JZxjLuPfsLaiNps6845fRiUQZ
         WidIOAPgWz9P3ayuxATtV2X001rCvAAUA/q0FlqWELXucIogYuLwFSj/V09qNHYq51/w
         XHWnWeqnD2F0ebKn6eBnoHr7ByR5ZI1frAg1EI4t/NwdN8hl82TiZHCjIjagISm7g97n
         BeMQ==
X-Gm-Message-State: AOJu0YzkucSI664RHeaH4eBkmMAq73ncp3TT6Bb/oqGklV1PBMdA+IU/
	+u6z5oMq9XoVBdYRhBMtE+ev8cX9uV0Ivpuxz6M0TSk9S227DLAV/HBKFTB9+XqNVySalMxUuRs
	axxNjPJe0Bdi7V4Ert5IUi5IZU7lkVdTSeOiLCwlUww==
X-Gm-Gg: ASbGncveKx5k77kNamSMLjEOGI2TeReFULnln+wulObK14scfWQNWRBSZodoC3mHAm2
	uupVx12/vwORaUEF5Jmxz7NohAJFu5+syUVdizFWOXpIvMsxpPrvBaOkqvPKHGoBUsoc/Bh6b/I
	GwnFOzOYGN6rgoG2cjGMMG4cZNPN5PRPEKXmGJBIXwYvdDHj8ZX1Yt2jUk92NJrsy9HSoLI9WGw
	eWQyPxJLd8KIBHaEj+wW2LyFLIVBb4IAmoUujCCDg4vMFGsnczD12WMkNY+VnBK0hTelDGW8XGb
	HuAm112sQxs7FrdQ2w==
X-Google-Smtp-Source: AGHT+IEp8/cf9XrwwIMn4K3GI+kZxc2s2f5mIH6VGjY4lI0WmIv5jSt6xaZ3ZvkYAAvFvy+gpz3XlkS080utaYm+HF0=
X-Received: by 2002:a05:6402:510e:b0:639:f54d:9274 with SMTP id
 4fb4d7f45d1cf-64076f67014mr1456860a12.2.1761878801879; Thu, 30 Oct 2025
 19:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251009132543.1680755-1-vanusuri@mvista.com> <d62b15e94667438900736a89a8220db30705a040.camel@intel.com>
 <CANQUz193KeDJuX8_WO9roc0T1-tOov2c2fdoMv+SAat+tX1-uA@mail.gmail.com> <23fae9ba42d32a600456b5593be9f7262161648f.camel@intel.com>
In-Reply-To: <23fae9ba42d32a600456b5593be9f7262161648f.camel@intel.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 31 Oct 2025 08:16:29 +0530
X-Gm-Features: AWmQ_bkPKjyuCuH-k9PEcFZViCLgTb_aYR1N58q2B7VW-s8c-7bUZWqrY92Cnxk
Message-ID: <CANQUz1-7k-SxrkNEqoixdwWKqYFn8nFBVfuyo-F2BQxt2oqDYQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH] libssh: Fix CVE-2025-8277
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001fa44406426b60db"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 02:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121218

--0000000000001fa44406426b60db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

I have sent a V2 patch
https://lists.openembedded.org/g/openembedded-devel/message/121197

Thanks & Regards,
Vijay


On Thu, Oct 30, 2025 at 12:02=E2=80=AFPM Mittal, Anuj <anuj.mittal@intel.co=
m> wrote:

> On Thu, 2025-10-30 at 11:55 +0530, Vijay Anusuri wrote:
> > Hi Anuj,
> >
> > The relevant changes in `ecdh_crypto.c` are located within the
> > function `static ssh_string ssh_ecdh_generate`. This function,
> > however, is not present in the `libssh-0.10.6` version. It was
> > introduced in `libssh` version 0.11 by the commit
> > `https://git.libssh.org/projects/libssh.git/commit/src/ecdh_crypto.c?
> > h=3Dstable-0.11&id=3D1eb3df5254a4348eae6edbc8a2bf08fef4015897`.
> >
> > Consequently, these changes cannot be directly applied to the
> > `libssh-0.10.6` version. This aligns with the approach taken by other
> > distributions, as Suse also did not backport the `ecdh_crypto.c` file
> > changes in their `libssh-0.10.6-3.1.src.rpm` package, which is
> > available at
> > `https://cdimage.debian.org/mirror/opensuse.org/distribution/leap-mic
> > ro/6.0/product/repo/openSUSE-Leap-Micro-6.0-x86_64-Media3/src/libssh-
> > 0.10.6-3.1.src.rpm`.
>
> Thank you for the details. These should be present in the commit
> message saying what was changed while cherry-picking.
>
> Can you please send a v2?
>
> >
> > Thanks & Regards,
> > Vijay
> >
> > On Thu, Oct 30, 2025 at 9:25=E2=80=AFAM Mittal, Anuj <anuj.mittal@intel=
.com>
> > wrote:
> > > On Thu, 2025-10-09 at 18:55 +0530, Vijay Anusuri via
> > > lists.openembedded.org wrote:
> > > > +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
> > > > @@ -0,0 +1,89 @@
> > > > +From 266174a6d36687b65cf90174f06af90b8b27c65f Mon Sep 17
> > > > 00:00:00
> > > > 2001
> > > > +From: Francesco Rollo <eferollo@gmail.com>
> > > > +Date: Thu, 24 Jul 2025 16:30:07 +0300
> > > > +Subject: [PATCH] CVE-2025-8277: Fix memory leak of unused
> > > > ephemeral
> > > > key pair
> > > > + after client's wrong KEX guess
> > > > +
> > > > +Signed-off-by: Francesco Rollo <eferollo@gmail.com>
> > > > +Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
> > > > +(cherry picked from commit
> > > > ccff22d3787c1355b3f0dcd09fe54d90acc55bf1)
> > > > +
> > > > +Upstream-Status: Backport
> > > > [
> > > > https://git.libssh.org/projects/libssh.git/commit/?h=3Dstable-0.11&=
i
> > > > d=3D
> > > > 266174a6d36687b65cf90174f06af90b8b27c65f]
> > > > +CVE: CVE-2025-8277
> > > > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > > > +---
> > > > + src/dh_crypto.c       | 5 +++++
> > > > + src/dh_key.c          | 5 +++++
> > > > + src/ecdh_gcrypt.c     | 6 ++++++
> > > > + src/ecdh_mbedcrypto.c | 6 ++++++
> > >
> > > This does not look like a simple backport of
> > >
> https://git.libssh.org/projects/libssh.git/commit/?h=3Dstable-0.11&id=3D2=
66174a6d36687b65cf90174f06af90b8b27c65f
> > >
> > > Was the change in ecdh_crypto.c not required?
>

--0000000000001fa44406426b60db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Anuj,</div><div><br></div><div>I have sent a V2 pa=
tch</div><div><a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/message/121197">https://lists.openembedded.org/g/openembedded-devel/messa=
ge/121197</a></div><div><br></div><div>Thanks &amp; Regards,</div><div>Vija=
y</div><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 30, 2025 at 12:02=E2=80=AFPM M=
ittal, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Thu, 2025-10-30 at 11:55 +0530, Vijay Anusuri wrote:<br>
&gt; Hi Anuj,<br>
&gt; <br>
&gt; The relevant changes in `ecdh_crypto.c` are located within the<br>
&gt; function `static ssh_string ssh_ecdh_generate`. This function,<br>
&gt; however, is not present in the `libssh-0.10.6` version. It was<br>
&gt; introduced in `libssh` version 0.11 by the commit=C2=A0<br>
&gt; `<a href=3D"https://git.libssh.org/projects/libssh.git/commit/src/ecdh=
_crypto.c" rel=3D"noreferrer" target=3D"_blank">https://git.libssh.org/proj=
ects/libssh.git/commit/src/ecdh_crypto.c</a>?<br>
&gt; h=3Dstable-0.11&amp;id=3D1eb3df5254a4348eae6edbc8a2bf08fef4015897`.<br=
>
&gt; <br>
&gt; Consequently, these changes cannot be directly applied to the<br>
&gt; `libssh-0.10.6` version. This aligns with the approach taken by other<=
br>
&gt; distributions, as Suse also did not backport the `ecdh_crypto.c` file<=
br>
&gt; changes in their `libssh-0.10.6-3.1.src.rpm` package, which is<br>
&gt; available at<br>
&gt; `<a href=3D"https://cdimage.debian.org/mirror/opensuse.org/distributio=
n/leap-mic" rel=3D"noreferrer" target=3D"_blank">https://cdimage.debian.org=
/mirror/opensuse.org/distribution/leap-mic</a><br>
&gt; ro/6.0/product/repo/openSUSE-Leap-Micro-6.0-x86_64-Media3/src/libssh-<=
br>
&gt; 0.10.6-3.1.src.rpm`.<br>
<br>
Thank you for the details. These should be present in the commit<br>
message saying what was changed while cherry-picking. <br>
<br>
Can you please send a v2?<br>
<br>
&gt; <br>
&gt; Thanks &amp; Regards,<br>
&gt; Vijay<br>
&gt; <br>
&gt; On Thu, Oct 30, 2025 at 9:25=E2=80=AFAM Mittal, Anuj &lt;<a href=3D"ma=
ilto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;=
<br>
&gt; wrote:<br>
&gt; &gt; On Thu, 2025-10-09 at 18:55 +0530, Vijay Anusuri via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.=
patch<br>
&gt; &gt; &gt; @@ -0,0 +1,89 @@<br>
&gt; &gt; &gt; +From 266174a6d36687b65cf90174f06af90b8b27c65f Mon Sep 17<br=
>
&gt; &gt; &gt; 00:00:00<br>
&gt; &gt; &gt; 2001<br>
&gt; &gt; &gt; +From: Francesco Rollo &lt;<a href=3D"mailto:eferollo@gmail.=
com" target=3D"_blank">eferollo@gmail.com</a>&gt;<br>
&gt; &gt; &gt; +Date: Thu, 24 Jul 2025 16:30:07 +0300<br>
&gt; &gt; &gt; +Subject: [PATCH] CVE-2025-8277: Fix memory leak of unused<b=
r>
&gt; &gt; &gt; ephemeral<br>
&gt; &gt; &gt; key pair<br>
&gt; &gt; &gt; + after client&#39;s wrong KEX guess<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Signed-off-by: Francesco Rollo &lt;<a href=3D"mailto:eferol=
lo@gmail.com" target=3D"_blank">eferollo@gmail.com</a>&gt;<br>
&gt; &gt; &gt; +Reviewed-by: Andreas Schneider &lt;<a href=3D"mailto:asn@cr=
yptomilk.org" target=3D"_blank">asn@cryptomilk.org</a>&gt;<br>
&gt; &gt; &gt; +(cherry picked from commit<br>
&gt; &gt; &gt; ccff22d3787c1355b3f0dcd09fe54d90acc55bf1)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Upstream-Status: Backport<br>
&gt; &gt; &gt; [<br>
&gt; &gt; &gt; <a href=3D"https://git.libssh.org/projects/libssh.git/commit=
/?h=3Dstable-0.11&amp;i" rel=3D"noreferrer" target=3D"_blank">https://git.l=
ibssh.org/projects/libssh.git/commit/?h=3Dstable-0.11&amp;i</a><br>
&gt; &gt; &gt; d=3D<br>
&gt; &gt; &gt; 266174a6d36687b65cf90174f06af90b8b27c65f]<br>
&gt; &gt; &gt; +CVE: CVE-2025-8277<br>
&gt; &gt; &gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri=
@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; + src/dh_crypto.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 ++=
+++<br>
&gt; &gt; &gt; + src/dh_key.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 5 +++++<br>
&gt; &gt; &gt; + src/ecdh_gcrypt.c=C2=A0=C2=A0=C2=A0=C2=A0 | 6 ++++++<br>
&gt; &gt; &gt; + src/ecdh_mbedcrypto.c | 6 ++++++<br>
&gt; &gt; <br>
&gt; &gt; This does not look like a simple backport of<br>
&gt; &gt; <a href=3D"https://git.libssh.org/projects/libssh.git/commit/?h=
=3Dstable-0.11&amp;id=3D266174a6d36687b65cf90174f06af90b8b27c65f" rel=3D"no=
referrer" target=3D"_blank">https://git.libssh.org/projects/libssh.git/comm=
it/?h=3Dstable-0.11&amp;id=3D266174a6d36687b65cf90174f06af90b8b27c65f</a><b=
r>
&gt; &gt; <br>
&gt; &gt; Was the change in ecdh_crypto.c not required?<br>
</blockquote></div>

--0000000000001fa44406426b60db--


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE790C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 00:03:18 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.6855.1633996997495456796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 17:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sr8509og;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id v10so3034668qvb.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 17:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jHJz/gKQmCvhuQY9T+nr8HTAOUNddFB+M1cO+iscThg=;
        b=Sr8509oghXEsstGxvIBrqaK4svunWISlWvGMi0yyzxAKVIQCpyZqn5k2e5SWt8e30P
         pj95s69zHGOAPUutmJi12a2QoGg54+JVUntfqg7VlIKdrdeC+KPHlAQWaRSxDfySGCuh
         7K7nxrU67f/GSyZY2knoJCaHtKhCWojorLpR63D0CITv/KB3tExbedtvgqzRIwim4B3i
         S0wgLq765OtIvDbDhKugR4gwzIppF6+SPMY4MCs/bsR9j2yTTgWEQ2iwDp0CaSNoKQ52
         47vJsLumrPrbdME6QQVGqQ39UGcoxrHRUhoRRUA672v76d8iKKS/KQ5IcbI9TK7lvC3F
         OBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jHJz/gKQmCvhuQY9T+nr8HTAOUNddFB+M1cO+iscThg=;
        b=tGx3gQ5wOr7bCF1eU6s2awHeFizGIRSbhkmvpuO6mp42sYw5ZKEZ31K1Iz1veeHoQQ
         Z51Rr/m2b6M/k5aGPASMNa/Cj8QrPGan5qPS8nm41aR1+2azJM53GtCSYK3UJaPmg594
         3yJGLj1OQ6taBgmZelKbdu3tYLVPiQRPVLyU08sNmqPZgPfGbqQV1mbv+TU38eIn7UH+
         89wYbfbtT/XRqF1Csy7J1D+5LwQT3cpOcPhrK6qHW8mzgnYp4FUWBs1w735dEGqbS9rw
         sTkIC9X5LANOtTNouQjOuvqFkCRd44ld25XeUPYcBVBepyu17pSOQYyXnvmPMtJpXKa2
         pRCQ==
X-Gm-Message-State: AOAM530tZ8MMma2bqEeByaFWi1u31Y7504H+LDUrYMyVtOLplwyBDQf6
	sINYY7tXrewgxeigmOqFQTQyJ5ohl71lh1N0uus=
X-Google-Smtp-Source: 
 ABdhPJwBOoi15tz6b5+1/7lQPvA5Z/spqYHTAg2RiZ2LKdwGoKr9FxvRHzSU7K1xoeB3T/WcINFQmjkWHaUnUcQAtD8=
X-Received: by 2002:ad4:5303:: with SMTP id y3mr18557753qvr.62.1633996996457;
 Mon, 11 Oct 2021 17:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-8-alex@linutronix.de>
 <7c6e8695-6be2-c6d7-4f5f-beceda56cdd9@gmail.com>
 <CANNYZj9sFQQW7C+PVPBaXrDek-aEkpz-neKYHvw1+eEcQT2c-Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9sFQQW7C+PVPBaXrDek-aEkpz-neKYHvw1+eEcQT2c-Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Oct 2021 17:03:05 -0700
Message-ID: 
 <CAMKF1soK1hTruTp1rPS5ZAuXoKzPnJtrNOiN5x-gGpG=GL0z0w@mail.gmail.com>
Subject: Re: [oe] [PATCH 08/24] netplan: do not use -Werror
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000089b9af05ce1c926f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 00:03:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93245

--00000000000089b9af05ce1c926f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 3:00 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Sorry - it was due to the same openssl 3.x deprecation warnings turning
> into errors. Generally I think we should want -Werror anywhere, it's
> something only upstream should use, not distro integrators.
> M
>

That=E2=80=99s fine if the project provides a convenient way to do so via c=
onfig
arguments or some such but if we need to maintain patches to achieve this
then it=E2=80=99s something we have to be mindful of Since this will requir=
e
maintenance however for this patch please add this to commit msg as to why
we are disabling it and then perhaps drop it when it=E2=80=99s fixed in fut=
ure

Alex
>
> On Mon, 11 Oct 2021 at 22:32, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>>
>> On 10/11/21 11:41 AM, Alexander Kanavin wrote:
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >   .../0001-Makefile-do-not-use-Werror.patch     | 23 +++++++++++++++++=
++
>> >   ...-t-fail-if-GLOB_BRACE-is-not-defined.patch |  7 ++++--
>> >   .../netplan/netplan_0.103.bb                  |  4 +++-
>> >   3 files changed, 31 insertions(+), 3 deletions(-)
>> >   create mode 100644
>> meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-no=
t-use-Werror.patch
>> >
>> > diff --git
>> a/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-=
not-use-Werror.patch
>> b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-=
not-use-Werror.patch
>> > new file mode 100644
>> > index 000000000..ddc44c3ca
>> > --- /dev/null
>> > +++
>> b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-=
not-use-Werror.patch
>> > @@ -0,0 +1,23 @@
>> > +From a06c77557ed951249d5b344441ad6ec57410e63f Mon Sep 17 00:00:00 200=
1
>> > +From: Alexander Kanavin <alex@linutronix.de>
>> > +Date: Sun, 3 Oct 2021 21:52:16 +0200
>> > +Subject: [PATCH] Makefile: do not use -Werror
>> > +
>> > +Upstream-Status: Inappropriate [oe-core specific]
>> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > +---
>> > + Makefile | 1 -
>> > + 1 file changed, 1 deletion(-)
>> > +
>> > +diff --git a/Makefile b/Makefile
>> > +index 8645aee..50fc0da 100644
>> > +--- a/Makefile
>> > ++++ b/Makefile
>> > +@@ -7,7 +7,6 @@ BUILDFLAGS =3D \
>> > +     -D_XOPEN_SOURCE=3D500 \
>> > +     -DSBINDIR=3D\"$(SBINDIR)\" \
>> > +     -Wall \
>> > +-    -Werror \
>>
>> Why is this change needed? Can you describe the scenario a bit, perhaps
>> better if its in the patch header itself.
>>
>> > +     $(NULL)
>> > +
>> > + SYSTEMD_GENERATOR_DIR=3D$(shell pkg-config
>> --variable=3Dsystemdsystemgeneratordir systemd)
>> > diff --git
>> a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-i=
f-GLOB_BRACE-is-not-defined.patch
>> b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-i=
f-GLOB_BRACE-is-not-defined.patch
>> > index 0fa6ba48a..c7d371dfa 100644
>> > ---
>> a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-i=
f-GLOB_BRACE-is-not-defined.patch
>> > +++
>> b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-i=
f-GLOB_BRACE-is-not-defined.patch
>> > @@ -1,16 +1,19 @@
>> > -From ceb4111af317ecc54d97bb21878dcccbfdb2983e Mon Sep 17 00:00:00 200=
1
>> > +From e0df1f07d1707d5daf0358cc60b30f06121f7e60 Mon Sep 17 00:00:00 200=
1
>> >   From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>> >   Date: Fri, 25 Dec 2020 11:41:43 +0900
>> >   Subject: [PATCH] don't fail if GLOB_BRACE is not defined
>> >
>> >   Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>> > +
>> >   ---
>> >    src/util.c | 6 ++++++
>> >    1 file changed, 6 insertions(+)
>> >
>> > +diff --git a/src/util.c b/src/util.c
>> > +index a4c0dba..fd4542d 100644
>> >   --- a/src/util.c
>> >   +++ b/src/util.c
>> > -@@ -24,6 +24,12 @@
>> > +@@ -25,6 +25,12 @@
>> >    #include "util.h"
>> >    #include "netplan.h"
>> >
>> > diff --git a/meta-networking/recipes-connectivity/netplan/
>> netplan_0.103.bb b/meta-networking/recipes-connectivity/netplan/
>> netplan_0.103.bb
>> > index 682a6b611..3527bceeb 100644
>> > --- a/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
>> > +++ b/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
>> > @@ -15,7 +15,9 @@ SRCREV =3D "51c872d856db80281ea810ebc02e05c09d5310fa=
"
>> >   PV =3D "0.103"
>> >
>> >   SRC_URI =3D "git://github.com/CanonicalLtd/netplan.git;branch=3Dmain=
 \
>> > -           file://0001-parse-nm-fix-32bit-format-string.patch"
>> > +           file://0001-parse-nm-fix-32bit-format-string.patch \
>> > +           file://0001-Makefile-do-not-use-Werror.patch \
>> > +           "
>> >
>> >   SRC_URI:append:libc-musl =3D "
>> file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
>> >
>> >
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#93221):
>> https://lists.openembedded.org/g/openembedded-devel/message/93221
>> > Mute This Topic: https://lists.openembedded.org/mt/86244755/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>> [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>

--00000000000089b9af05ce1c926f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 11, 2021 at 3:00 PM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Sorry - it wa=
s due to the same openssl 3.x deprecation warnings turning into errors. Gen=
erally I think we should want -Werror anywhere, it&#39;s something only ups=
tream should use, not distro integrators.</div><div dir=3D"auto">M</div></d=
iv></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That=E2=80=99=
s fine if the project provides a convenient way to do so via config argumen=
ts or some such but if we need to maintain patches to achieve this then it=
=E2=80=99s something we have to be mindful of Since this will require maint=
enance however for this patch please add this to commit msg as to why we ar=
e disabling it and then perhaps drop it when it=E2=80=99s fixed in future=
=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"auto"></div><div>Alex<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 Oct 2021=
 at 22:32, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><br>
<br>
On 10/11/21 11:41 AM, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../0001-Makefile-do-not-use-Werror.patch=C2=A0 =C2=A0 =C2=
=A0| 23 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0...-t-fail-if-GLOB_BRACE-is-not-defined.patch |=C2=A0 7 ++=
++--<br>
&gt;=C2=A0 =C2=A0.../netplan/<a href=3D"http://netplan_0.103.bb" rel=3D"nor=
eferrer" target=3D"_blank">netplan_0.103.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
&gt;=C2=A0 =C2=A03 files changed, 31 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-networking/recipes-connectivity/ne=
tplan/netplan/0001-Makefile-do-not-use-Werror.patch<br>
&gt; <br>
&gt; diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001=
-Makefile-do-not-use-Werror.patch b/meta-networking/recipes-connectivity/ne=
tplan/netplan/0001-Makefile-do-not-use-Werror.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..ddc44c3ca<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefi=
le-do-not-use-Werror.patch<br>
&gt; @@ -0,0 +1,23 @@<br>
&gt; +From a06c77557ed951249d5b344441ad6ec57410e63f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +Date: Sun, 3 Oct 2021 21:52:16 +0200<br>
&gt; +Subject: [PATCH] Makefile: do not use -Werror<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +---<br>
&gt; + Makefile | 1 -<br>
&gt; + 1 file changed, 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/Makefile b/Makefile<br>
&gt; +index 8645aee..50fc0da 100644<br>
&gt; +--- a/Makefile<br>
&gt; ++++ b/Makefile<br>
&gt; +@@ -7,7 +7,6 @@ BUILDFLAGS =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-D_XOPEN_SOURCE=3D500 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DSBINDIR=3D\&quot;$(SBINDIR)\&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-Wall \<br>
&gt; +-=C2=A0 =C2=A0 -Werror \<br>
<br>
Why is this change needed? Can you describe the scenario a bit, perhaps <br=
>
better if its in the patch header itself.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(NULL)<br>
&gt; +<br>
&gt; + SYSTEMD_GENERATOR_DIR=3D$(shell pkg-config --variable=3Dsystemdsyste=
mgeneratordir systemd)<br>
&gt; diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001=
-don-t-fail-if-GLOB_BRACE-is-not-defined.patch b/meta-networking/recipes-co=
nnectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.pat=
ch<br>
&gt; index 0fa6ba48a..c7d371dfa 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-=
fail-if-GLOB_BRACE-is-not-defined.patch<br>
&gt; +++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-=
fail-if-GLOB_BRACE-is-not-defined.patch<br>
&gt; @@ -1,16 +1,19 @@<br>
&gt; -From ceb4111af317ecc54d97bb21878dcccbfdb2983e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From e0df1f07d1707d5daf0358cc60b30f06121f7e60 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fu=
jitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Fri, 25 Dec 2020 11:41:43 +0900<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] don&#39;t fail if GLOB_BRACE is not defin=
ed<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.f=
nst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br=
>
&gt; +<br>
&gt;=C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 src/util.c | 6 ++++++<br>
&gt;=C2=A0 =C2=A0 1 file changed, 6 insertions(+)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +diff --git a/src/util.c b/src/util.c<br>
&gt; +index a4c0dba..fd4542d 100644<br>
&gt;=C2=A0 =C2=A0--- a/src/util.c<br>
&gt;=C2=A0 =C2=A0+++ b/src/util.c<br>
&gt; -@@ -24,6 +24,12 @@<br>
&gt; +@@ -25,6 +25,12 @@<br>
&gt;=C2=A0 =C2=A0 #include &quot;util.h&quot;<br>
&gt;=C2=A0 =C2=A0 #include &quot;netplan.h&quot;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; diff --git a/meta-networking/recipes-connectivity/netplan/<a href=3D"h=
ttp://netplan_0.103.bb" rel=3D"noreferrer" target=3D"_blank">netplan_0.103.=
bb</a> b/meta-networking/recipes-connectivity/netplan/<a href=3D"http://net=
plan_0.103.bb" rel=3D"noreferrer" target=3D"_blank">netplan_0.103.bb</a><br=
>
&gt; index 682a6b611..3527bceeb 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/netplan/<a href=3D"http://n=
etplan_0.103.bb" rel=3D"noreferrer" target=3D"_blank">netplan_0.103.bb</a><=
br>
&gt; +++ b/meta-networking/recipes-connectivity/netplan/<a href=3D"http://n=
etplan_0.103.bb" rel=3D"noreferrer" target=3D"_blank">netplan_0.103.bb</a><=
br>
&gt; @@ -15,7 +15,9 @@ SRCREV =3D &quot;51c872d856db80281ea810ebc02e05c09d5=
310fa&quot;<br>
&gt;=C2=A0 =C2=A0PV =3D &quot;0.103&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/Canon=
icalLtd/netplan.git;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/CanonicalLtd/netplan.git;branch=3Dmain</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-parse-nm-fix-32b=
it-format-string.patch&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-parse-nm-fix-32b=
it-format-string.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile-do-not-=
use-Werror.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRC_URI:append:libc-musl =3D &quot; file://0001-don-t-fail=
-if-GLOB_BRACE-is-not-defined.patch&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#93221): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/93221" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/93221</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86244755=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86244755/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div>
</blockquote></div></div>

--00000000000089b9af05ce1c926f--


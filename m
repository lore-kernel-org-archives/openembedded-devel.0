Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76371C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 22:02:49 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web11.5376.1633989768256836086
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 15:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PuSOWIlB;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id m199so8104932vka.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 15:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ClEof9MoT4hqCUl3V61UjNZ4KCmHTTVEeJgqNrIUTiI=;
        b=PuSOWIlBSJ3A0ggdAjYc7LFrMZiUiQY5T6uuNc+LuUKANCjLShCFt6ymXzgUhewX0t
         qP6QsgCKZGvPxZ3Yy9Onjl/H33K2MJbpv0WjhsGHiZ5J0zuWH3GEFyAPEQrPKerFaI83
         ARC5hy6duPKsP+vMyx3fnAdZ2yywpXjcEltb7MZ7NmzQ+z789PIF0p6aleVZlHBfbo7s
         D7bZu4phliMVZugKU4VxTdHPc2e0OVlJZOWoAaxCpg0wiQ9nrnuYCpn42Nv2t6J5ak94
         l6xForoSqCr52DvMgzvJZXLCpTn4iIG9CmxVy8qdtIWERlNZf70bVTjH7w9bUXaCUTDX
         tn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ClEof9MoT4hqCUl3V61UjNZ4KCmHTTVEeJgqNrIUTiI=;
        b=JCgvKrc/65qwgEqaSrHmdl5mj5fL/Pc7jvwWnLIDAajOHsTrQOayI+7IG2LnMBwyMP
         rDLHVr2dVeRd7oFSVnuo5hVFiTdSdrf9It/v+qdLxp/PKJhMloWun7erMUQZuZaIOQNr
         WUs9Cfmy5tzK8jH6RBrni4zoTiWyFkrX95f8XLXBVG9dIHtmY4OawtTRIhhjGOy8jF3o
         eHa3rKSNcGiAb7p5FxPCOGs7bKYYJoeKImX4NweWXg3J8aJbVS5RA+9oMMb2WfXhNKOK
         rmuMUXc5l8xQu2E4XjadWV4d808eAq1MUEzyFoQaUI4fgJnMU2qT1z/gtb38XWcIRJua
         sFzQ==
X-Gm-Message-State: AOAM532d543x7B4SaA0ncbqjDMO3pfoMN7s3RDMbnDiGJDdP0Y9wqCOy
	OhC9bZzFt0u8ELDEyzrsqgdckegvVuTKD84m/IPaCU4HYQE=
X-Google-Smtp-Source: 
 ABdhPJwNs/6lRfZl7IUQiyJM2cTn95zVQ0pAAdtLVrpCqlYY88tH3ZzcF2GGFZjA0w+yQcqJ+HPm0YhNrx4gu5EoA6A=
X-Received: by 2002:a05:6122:2203:: with SMTP id
 bb3mr3144066vkb.12.1633989766827;
 Mon, 11 Oct 2021 15:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-8-alex@linutronix.de>
 <7c6e8695-6be2-c6d7-4f5f-beceda56cdd9@gmail.com>
 <16AD18E7A1A76060.20343@lists.openembedded.org>
In-Reply-To: <16AD18E7A1A76060.20343@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Oct 2021 00:02:35 +0200
Message-ID: 
 <CANNYZj9kSFhZe2ZxrVKoUBVJOMjCK_6PW9vsX7uKFnUfF-wOXw@mail.gmail.com>
Subject: Re: [oe] [PATCH 08/24] netplan: do not use -Werror
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000009e55cd05ce1ae319"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 22:02:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93244

--0000000000009e55cd05ce1ae319
Content-Type: text/plain; charset="UTF-8"

(should not :)

On Tue, 12 Oct 2021 at 00:00, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> Sorry - it was due to the same openssl 3.x deprecation warnings turning
> into errors. Generally I think we should want -Werror anywhere, it's
> something only upstream should use, not distro integrators.
>
> Alex
>
> On Mon, 11 Oct 2021 at 22:32, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>>
>> On 10/11/21 11:41 AM, Alexander Kanavin wrote:
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >   .../0001-Makefile-do-not-use-Werror.patch     | 23 +++++++++++++++++++
>> >   ...-t-fail-if-GLOB_BRACE-is-not-defined.patch |  7 ++++--
>> >   .../netplan/netplan_0.103.bb                  |  4 +++-
>> >   3 files changed, 31 insertions(+), 3 deletions(-)
>> >   create mode 100644
>> meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
>> >
>> > diff --git
>> a/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
>> b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
>> > new file mode 100644
>> > index 000000000..ddc44c3ca
>> > --- /dev/null
>> > +++
>> b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
>> > @@ -0,0 +1,23 @@
>> > +From a06c77557ed951249d5b344441ad6ec57410e63f Mon Sep 17 00:00:00 2001
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
>> > +@@ -7,7 +7,6 @@ BUILDFLAGS = \
>> > +     -D_XOPEN_SOURCE=500 \
>> > +     -DSBINDIR=\"$(SBINDIR)\" \
>> > +     -Wall \
>> > +-    -Werror \
>>
>> Why is this change needed? Can you describe the scenario a bit, perhaps
>> better if its in the patch header itself.
>>
>> > +     $(NULL)
>> > +
>> > + SYSTEMD_GENERATOR_DIR=$(shell pkg-config
>> --variable=systemdsystemgeneratordir systemd)
>> > diff --git
>> a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
>> b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
>> > index 0fa6ba48a..c7d371dfa 100644
>> > ---
>> a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
>> > +++
>> b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
>> > @@ -1,16 +1,19 @@
>> > -From ceb4111af317ecc54d97bb21878dcccbfdb2983e Mon Sep 17 00:00:00 2001
>> > +From e0df1f07d1707d5daf0358cc60b30f06121f7e60 Mon Sep 17 00:00:00 2001
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
>> > @@ -15,7 +15,9 @@ SRCREV = "51c872d856db80281ea810ebc02e05c09d5310fa"
>> >   PV = "0.103"
>> >
>> >   SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main \
>> > -           file://0001-parse-nm-fix-32bit-format-string.patch"
>> > +           file://0001-parse-nm-fix-32bit-format-string.patch \
>> > +           file://0001-Makefile-do-not-use-Werror.patch \
>> > +           "
>> >
>> >   SRC_URI:append:libc-musl = "
>> file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
>> >
>> >
>> >
>> >
>> >
>> >
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93243):
> https://lists.openembedded.org/g/openembedded-devel/message/93243
> Mute This Topic: https://lists.openembedded.org/mt/86244755/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009e55cd05ce1ae319
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">(should not :)<br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, 12 Oct 2021 at 00:00, Alexander =
Kanavin via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Sorry - it was due =
to the same openssl 3.x deprecation warnings turning into errors. Generally=
 I think we should want -Werror anywhere, it&#39;s something only upstream =
should use, not distro integrators.</div><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, 11 Oct 2021 at 22:32, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><br>
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
&gt; <br>
&gt; <br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93243): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93243" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93243</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86244755/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86244755/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009e55cd05ce1ae319--


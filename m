Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13098.1793717537228335198
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TMs3ycS7;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0db268bd8so27657677b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 06:52:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717536; cv=none;
        d=google.com; s=arc-20260327;
        b=F6zOcTd51kISP9USOPZJuM/b46Rhw91KjIOaRcrLBqT5TFuYDsAsF+0cNeSAFpZk18
         oQuY4TbQRqaCziB8omqT+MS5bWE9cKCI0tYRateRZitzyQGkFsIBBbouRrQ2vnZoCbBM
         gqihtnb/xLU+HJXjjUHr4BVFGhD1cfdzo5UPSYQfMNQRXpudwsHgHaN7I7jeS4yNJfgT
         cgrVMDQ5yJ/2ooTt4dHa6faHDt2RkL2Bn6rqTF7KAsnuz0dYxmJX/XmRLqCn4B9e+gRT
         zjRIz0mg6+I16p1lWKpurcoueVcYzZm08FgEtxnKijwXENRfzpScT2hTtIYYORmv/EGP
         qQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9tYBgnrhAp5EiynTtB2Anjrjoy1IVl8AMtZhpPl8rVs=;
        fh=3gNmh+G7U8VRR2Luhp6b+laC5vWoIq0nVkCmdnHWMps=;
        b=P7drpXqEFYHKISxjYhcyTsrXQh3xFsThQVHBMVGiq1KEZJd/IavVIG50gnj8ret6hi
         hnnUgS/oqyTx0f3hKidCdKvlhMrgjclBQHCtN8sFZQxHSwyKU2D4awe0uN7TtBN1zZ7r
         qLxoZwlabv1nIT4SxZECkVjiNHCMJ5laxNaTbybn9FxyzZ/YseBgM5HD+z9JC5R1hcMN
         GWZwEQHn9LyeeHH1uvXyGDzSsjucFO/yMJagvFkTATV5E5h3/R43FCUqQz0opO/vtEoh
         tbUXOSmj1Q1AGcPgl24J92nf7haLt2wQ7W8AxdgI90knE/QhXx95bAJLBDto+hTYw83T
         CLkA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717536; x=1794322336; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tYBgnrhAp5EiynTtB2Anjrjoy1IVl8AMtZhpPl8rVs=;
        b=TMs3ycS7+vVvapvYc1R3hr4jn2uldghW+mLjv6CR41MJvfYuXe5xuWOa9mc2TZ2VuB
         RWxyEnb68/EN/wKE69iJUBP5RI1ryOt4wyLp65+g1tXjAYcGtYjGLykfnX+NgKAaXf9y
         6KnAprMpjwwPLgn6CTpV/bA92PPOoCLo3+5STyfT18Bna9HqhXz8pJkS8egXSXZkru74
         HTdFotuQoYIarZSlcIFqEhKYaZCFjtrUAkBqkq3chfZfcOPEMet0iS4PqAodc4Izp73J
         i/fL8fm/NmIe0diIUhsPHR80yZyfKfleF7MhdwyU+dfDX/mVmCRaAVOvJbNNh6LT8Sdt
         N/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717536; x=1794322336;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9tYBgnrhAp5EiynTtB2Anjrjoy1IVl8AMtZhpPl8rVs=;
        b=J/ylAUUEAMPMGBTKL8sdWuT6Z7XbYdiBU9C/k9smFDUG/68GJjF7yGxS6U3G71Y+4F
         GQ9QcSPOmOXrSUB9PZJcaOzNbAZC0U+TIG2otbkeQdpLHAwHIorEmwI6nTh2t8LazTzv
         W6xOurWs5yti6PznA+TJBIFNAGcl56aKpVvvYmYscEixSOzdfAcljCuUkhKm29r2erxe
         ZETJAKHq9xqFq4H2UFt7c/bqUtXH+UuyN0xq418nJffkWVeoLeUr4RThIQjmq+n/5orW
         kbFJEagRJyn9U7ys8D7bo51jEV0aREKjGtgW9vsoE8WjssUmpOQ5FSh4HBXRjF+MHAlx
         H2Jg==
X-Gm-Message-State: APuU4Z9C+LfsJREx2v2xXl6DjqISfg9L9eVNLdDaD39HEPwx7HVwv0Es
	lgDCl3C7qP9WNKso5QQBKi2i24nY14gxB5rhuUN8Nqu3qoVwTCzy6iRPKehtpawV0RIhaoFsvNa
	SLi6JUPf0i/6hwQD1OZVqHMAv5TkYOLc=
X-Gm-Gg: AYBFou04PJhD3pDG/1HTA/YihBX24HmD2gV/aLa4imYgXlQJx7Q10BIgT1LcBgWayxn
	Uznv8tBFPmJWX7Roe0IUAFQ9lhBKc04B7QhS3FX+X7mXfpELkcOQUD9ebV4zrMllQyrzDq2NuKV
	8uGfZUtGF5TkabBiScjb+RjzUeqqCp14l/dj7rT0UxtcNxyqYwyFOm85I7zFWG1f1G8UEgqH5uA
	R3C9Wfg0h/Bxz1W43owWuCq90Gjy4+9MBJATEDzgi0fEf10gwHWQLxJpN1cLGZC8F8luzvBu7YJ
	3V/kvIRjUoz+g39cpVBV041kfXA2NgndcdwtkGta8jH9X4VdI3Js0SR1oJa9o9dhivphM7m6ASZ
	iueodcKe6EY+kGf/quf9lfgNs1tNk3yd4ExKTt1HvYI7GE4QCwA+2GuHzuGRwDn9pt9h2LApcZ4
	r8ePiISVG8elgYY375yRLhhP7ZAMo+kgA4TC+FgS2xSoj1HLAmZYhjBV7vclAOClxTTXBz7zhEw
	acOD8gYFDJe3lEdCtN0GC2Iw9joT7fMNjWVsjMnzhTU+6Hqkr3EckD9gDVhdDjqDgvaaeeFZGnz
	iEzCAJt3183mc4d6r++owSd1iVQTObjJTPZUR2zNtpq65A7t8FHf/wXz8JSNYHa7FLGuOblT37K
	8uZtJKe59wbB/lsBRelka/w==
X-Received: by 2002:a05:690c:e297:10b0:8ae:1acc:ad33 with SMTP id
 00721157ae682-8b2b6781e81mr58033857b3.58.1793717535479; Tue, 03 Nov 2026
 06:52:15 -0800 (PST)
MIME-Version: 1.0
References: <20261022142449.2372030-1-ecordonnier@snap.com> <CAHUKmYZ6AJ_WSb9xP1QCMyG=m0bvfzMATUBHPzjR440wJox-RA@mail.gmail.com>
In-Reply-To: <CAHUKmYZ6AJ_WSb9xP1QCMyG=m0bvfzMATUBHPzjR440wJox-RA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Nov 2026 06:51:48 -0800
X-Gm-Features: AclHuK9Dh0dF1H-OkIg9JVFX_vpwafBJ-bI30NsEL9HDomDqvTJrn-idZL_1sLU
Message-ID: <CAMKF1sq2z0gty7Uya3q1wOnuCNqJ47ESy8HRncdKdCf8DcSqfw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] android-tools: drop GPL-2.0-only from LICENSE
To: ecordonnier@snap.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000879d5e065f606839"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 14:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131790

--000000000000879d5e065f606839
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, it fell through cracks. I have taken it

On Sun, Nov 1, 2026 at 3:20=E2=80=AFPM Etienne Cordonnier via openembedded-=
devel
<ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:

> Hi,
> what is the status of this patch? It still applies on master-next.
> I double-checked again and Arch/nmeum list GPL/LGPL only because they als=
o
> ship e2fsprogs/f2fs-tools and link libsepol into fastboot, none of which
> are in the Debian sources or selectable via TOOLS_TO_BUILD in meta-oe
> bitbake recipe.
>
> =C3=89tienne
>
> On Thu, Oct 22, 2026 at 4:24=E2=80=AFPM <ecordonnier@snap.com> wrote:
>
>> From: Etienne Cordonnier <ecordonnier@snap.com>
>>
>> The GPL-2.0 entry dates back to the first recipe (AOSP android-5.1.1_r37=
,
>> 2016) and was carried over unchanged to the Debian android-platform-tool=
s
>> based 35.0.2 recipe.
>>
>> In the android-5.1.1_r37 repos the recipe fetched, the only GPLv2 mentio=
ns
>> are headers which are dual licensed "Apache 2.0 OR GPLv2"
>> (system/core include/cutils/ashmem.h, include/utils/ashmem.h,
>> include/log/logger.h), kernel headers in libion which are not built, and
>> documentation templates. Apache-2.0 can be chosen for all of them.
>>
>> The 35.0.2 sources come from Debian's android-platform-tools, whose
>> debian/copyright lists no GPL license: the files are Apache-2.0, BSD,
>> Expat, Khronos, PSF and public-domain, and a scan of the unpacked tarbal=
l
>> finds no GPL licensed source files.
>>
>> Remove GPL-2.0-only from LICENSE and LIC_FILES_CHKSUM so that the recipe
>> is
>> not wrongly treated as GPL by license based tooling (e.g. copyleft sourc=
e
>> archiving).
>>
>> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> ---
>>  meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/android-tools/
>> android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/
>> android-tools_35.0.2.bb
>> index 65529c1b53..b7cb062410 100644
>> --- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
>> +++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
>> @@ -1,9 +1,8 @@
>>  DESCRIPTION =3D "Various utilities from Android"
>>  SECTION =3D "console/utils"
>> -LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND GPL-2.0-o=
nly"
>> +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
>>  LIC_FILES_CHKSUM =3D " \
>>
>>  file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a=
0096b10
>> \
>> -
>> file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561083=
3a22dbe6
>> \
>>
>>  file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1=
bc15da69f
>> \
>>
>>  file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919=
e203a55f9
>> \
>>  "
>> --
>> 2.43.0
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131733):
> https://lists.openembedded.org/g/openembedded-devel/message/131733
> Mute This Topic: https://lists.openembedded.org/mt/121884442/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000879d5e065f606839
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, it fell through cracks. I have taken it</div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sun, Nov 1, 2026 at 3:20=E2=80=AFPM Etienne Cordonnier via op=
enembedded-devel &lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openemb=
edded.org">snap.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<br>what is t=
he status of this patch? It still applies on master-next.<br>I double-check=
ed again and=C2=A0Arch/nmeum list GPL/LGPL only because they also ship e2fs=
progs/f2fs-tools and link libsepol into fastboot, none of which are in the =
Debian sources or selectable via TOOLS_TO_BUILD in meta-oe bitbake recipe.<=
br><br>=C3=89tienne</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Oct 22, 2026 at 4:24=E2=80=AFPM &lt;<a href=3D"m=
ailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Eti=
enne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blan=
k">ecordonnier@snap.com</a>&gt;<br>
<br>
The GPL-2.0 entry dates back to the first recipe (AOSP android-5.1.1_r37,<b=
r>
2016) and was carried over unchanged to the Debian android-platform-tools<b=
r>
based 35.0.2 recipe.<br>
<br>
In the android-5.1.1_r37 repos the recipe fetched, the only GPLv2 mentions<=
br>
are headers which are dual licensed &quot;Apache 2.0 OR GPLv2&quot;<br>
(system/core include/cutils/ashmem.h, include/utils/ashmem.h,<br>
include/log/logger.h), kernel headers in libion which are not built, and<br=
>
documentation templates. Apache-2.0 can be chosen for all of them.<br>
<br>
The 35.0.2 sources come from Debian&#39;s android-platform-tools, whose<br>
debian/copyright lists no GPL license: the files are Apache-2.0, BSD,<br>
Expat, Khronos, PSF and public-domain, and a scan of the unpacked tarball<b=
r>
finds no GPL licensed source files.<br>
<br>
Remove GPL-2.0-only from LICENSE and LIC_FILES_CHKSUM so that the recipe is=
<br>
not wrongly treated as GPL by license based tooling (e.g. copyleft source<b=
r>
archiving).<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/android-tools/<a href=3D"http://android-tool=
s_35.0.2.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_35.0.2.bb</=
a> | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/android-tools/<a href=3D"http://andro=
id-tools_35.0.2.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_35.0=
.2.bb</a> b/meta-oe/recipes-devtools/android-tools/<a href=3D"http://androi=
d-tools_35.0.2.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_35.0.=
2.bb</a><br>
index 65529c1b53..b7cb062410 100644<br>
--- a/meta-oe/recipes-devtools/android-tools/<a href=3D"http://android-tool=
s_35.0.2.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_35.0.2.bb</=
a><br>
+++ b/meta-oe/recipes-devtools/android-tools/<a href=3D"http://android-tool=
s_35.0.2.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_35.0.2.bb</=
a><br>
@@ -1,9 +1,8 @@<br>
=C2=A0DESCRIPTION =3D &quot;Various utilities from Android&quot;<br>
=C2=A0SECTION =3D &quot;console/utils&quot;<br>
-LICENSE =3D &quot;Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND GPL-2.0=
-only&quot;<br>
+LICENSE =3D &quot;Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17=
d99a7cacdbeed46a0096b10 \<br>
-=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d17=
1dd6425610833a22dbe6 \<br>
=C2=A0 =C2=A0 =C2=A0file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc=
04cda31daea161b1bc15da69f \<br>
=C2=A0 =C2=A0 =C2=A0file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D5507944=
65ba0ec5312d6919e203a55f9 \<br>
=C2=A0&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131733): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131733" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131733</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121884442/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121884442/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000879d5e065f606839--

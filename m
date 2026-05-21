Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A47CD4F5E
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 11:58:49 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34621.1779364726026840181
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 04:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hbwxb/Zp;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso13034730a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 04:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779364724; cv=none;
        d=google.com; s=arc-20240605;
        b=h951FGgW+4M61GKVW+guxIQQ2BGICp5Zv2IGMTpYDiU9rTEqpTxMFfSj38J4QKgg8G
         iwMS4VHfXncrnQS+Bo+9iy7zmvXOambSyUqv3y6tBEaejC49q/vT1YRmMkUBpuFUtIbi
         g2HjqEc6yCBdObU0Wl2FHk57+Gey3vFpyNvpl5zBE/yGtU7sm+km02Ub20AYMKZW2iCh
         G7SzA5/DVTlCsbFDZJMmgM1/hCijhIn0LGCQ7+CNragYgeahfUth8QoJ+Be5/2+eTtou
         pOcuP9z/uvKVBdwoGgqsKS6zWPLtH/MkaMeKqpa5GSlBxM6fzaDi8zS9Q/x5YeHlGIv9
         Eu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/Wwm3D2KM3/QNA9A6dVV14sI8nT3duvIq9+uhPp3teI=;
        fh=Y6UFSDAR62YPuZNp43wKNQZRD4VTsxb6kKVZEPDgXZw=;
        b=CKfCjyI9KW4aFNLFR9BH5v5pnUa9+gWwY3NIB8rB61YiDwIei5dSCc7tQIIchlQ4Ud
         Unw4CssNf+y1kpM4yc/Q6cyIINIZqiZZnzTCTWLxxmlsQNE9gPLcdBQTq2D9NWXJzbNi
         QJyAR5+dNpff4BB1X3ueRWRQtnSSrzjxxKsD42BKfjRxufR6N98S5iW3rAzR8yb9Grwd
         3X3yK7DIZkH5KhtuZ5Mr1C+i2hxbc7TLwVZaRB8YYkuvt+4sgL6nJf9MjvT5sfJjH0p5
         IrJdt2lbjhwnEfGyKXzQlNH2flg/L+72PIUES5oRxaZrw+Pfp04iOfVmMB1kn2iHavmA
         k16w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779364724; x=1779969524; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Wwm3D2KM3/QNA9A6dVV14sI8nT3duvIq9+uhPp3teI=;
        b=hbwxb/ZpNi7PI7K74FT7b2e3UYGt6ScBummrMQjzt50PgnMzJKGt1uAVjl64bE6l5m
         9UJyZYXajkYrU/j46df3GgEnXmImP6p9R1RrePwZqOxy0+MKssgsF8ebfgvM+mPkKDHP
         19HAFfQL/O+pYEfFCvT6MJoqs29E9aq/TVsO0xyjFA37zVDjKojSbkntSS+bsRdnF0Dq
         Vlr3XzT5w3nQXsMhzOvvzDPqBenK8duClhMR9jnKeSd7CYmZ1hnB+lUixVbDilbnuWcu
         84yR6mg/pK1xYIeYncf94LHFyh80eAZ96O96Z1l/OCZz9pTBmLi+75BNw23TOy2qeZHc
         p9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364724; x=1779969524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Wwm3D2KM3/QNA9A6dVV14sI8nT3duvIq9+uhPp3teI=;
        b=sfr8uMiLCSRTagRhlNyCJe1EUmw4x23WDm8DV+PGr2jw67eAExn9Jh5+MyTZ45ASRc
         WasHrSp7meH6EXFp7FiZXBOZijpOqbhgzugRkQpQbztRscOEcUOb3JBDzb6fQddnkxLf
         33SbTvkVuCalsrZZxADCaoi3vbIJJFXgTvEJdye5D7XIFrH03xFIxcYacCIy0uStavjb
         1cwvJK55uCRspq+MtOXjyrqka81WRRscln29xF1otJlZVEHc1i1U8f1Ac7xxqYqhiqXp
         luoNp5i4BSd4gj1bYYVkQrTq/MttviNxP7mrxRI5uCZ1OoaSATCl7jxABK/NunKv5ieM
         uhOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8U7GneFEWUTXtdDtBHFCuKakryabd3oQjrjdavoAexBtI38FETVJu5/PijAikxj77XU98xr9uY2cG+iR10mtxSa3Q=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuxDxY1e1Ku3+t/iLxP6+j4nabxKwMEDtwzs4SGRhctZ3fLEo0
	cna8J1qG/pzJ28UPt4OT7i9XrRoOSwYxkof4NIz1JxkidHDgc8vs8J9TaRaOJNb0uZbjvYWUOSp
	7z2AyTGskeZM7MrTvhZjrGYSuZNi2k44=
X-Gm-Gg: Acq92OHPVLU/oWqmEvrZldPAwgsV9zgVhdwcb+KyVhiD23kVooyeJ+j+hWLDHDOiqGP
	9F9JN80RhvbHMOKP4Z19gtWDbCmphQ75x5vX/w0+IrA3PyzENMze3LS9ScPGrG39wE7+d86AVzt
	1lt8Kp4NhpG1pyZuQvt+YsFFoiubTuO8NAKWj9n6uejzqBAmDJCU0fq/rqfejZN/VT0xBWt+2Ox
	ohDkRjgR8SuVShdMOfm7hVNjvDiatTcUTKJb9su6MiE4q1LAtX2kg0a3sUfTc63x60ZAFT0LmCP
	SjsPo8ok1uQSgCnqZgEYVsvFodGG7GYHFL7U8JZGOpsS0XFCV77VBUivu8Oi58wcjnAzso4=
X-Received: by 2002:a17:906:846b:b0:bd5:2c56:71a2 with SMTP id
 a640c23a62f3a-bdc14f5e721mr124516866b.36.1779364723944; Thu, 21 May 2026
 04:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260520113418.2523208-1-dmitry.baryshkov@oss.qualcomm.com> <CAMKF1srwcEvDqZRy8CVSx9sFbtUViXE8BJ=nPRD5z7yNqf1c=g@mail.gmail.com>
In-Reply-To: <CAMKF1srwcEvDqZRy8CVSx9sFbtUViXE8BJ=nPRD5z7yNqf1c=g@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 21 May 2026 12:58:31 +0100
X-Gm-Features: AVHnY4LTXi7VrO2sPtFZauDdm6Ra0n8VX2muFehgnTbZTlT2loAXkoiAN3D0BDI
Message-ID: <CANPvuRny4=qXjsZBf_XHjd9UBPDdtJY27Y3z_uxWo7pR=MiRKQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: fix building for the ARMv8.3-A and
 later systems
To: raj.khem@gmail.com
Cc: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004bf878065252a223"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 11:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127134

--0000000000004bf878065252a223
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj via lists.openembedded.org <raj.khem=3D
gmail.com@lists.openembedded.org> escreveu (quinta, 21/05/2026 =C3=A0(s) 05=
:10):

>
>
> On Wed, May 20, 2026 at 4:34=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org <dmitry.baryshkov=3D
> oss.qualcomm.com@lists.openembedded.org> wrote:
>
>> Building mariadb for ARMv8.3-A and later, fails with:
>>
>> Assembler messages:
>> {standard input}:169: Error: selected processor does not support `retaa'
>> {standard input}:271: Error: selected processor does not support `retaa'
>>
>> It happens because the pmem_cvap() funciton manually inserts the `.arch
>> armv8-2.a` clause, making GAS believe that retaa instruction (inserted
>> by GCC) is invalid. Bump the manually inserted clause to armv8.3-a, to
>> prevent GAS from choking on the retaa instructions.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
>>  ...-sync-cache.cc-bump-ARMv8-arch-to-AR.patch | 35 +++++++++++++++++++
>>  2 files changed, 36 insertions(+)
>>  create mode 100644
>> meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-bu=
mp-ARMv8-arch-to-AR.patch
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> index 9470184d3d43..456c1e1354e8 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -25,6 +25,7 @@ SRC_URI =3D "
>> https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>             file://riscv32.patch \
>>             file://0001-support-reproducible-builds.patch \
>>
>> file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
>> +
>>  file://0001-storage-innobase-sync-cache.cc-bump-ARMv8-arch-to-AR.patch =
\
>>            "
>>  SRC_URI[sha256sum] =3D
>> "14783ddc5edd966ff05aa0efd5ed6d3d369ed5b9e4080a448f00f87a9f0a4a6b"
>>
>> diff --git
>> a/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-=
bump-ARMv8-arch-to-AR.patch
>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-=
bump-ARMv8-arch-to-AR.patch
>> new file mode 100644
>> index 000000000000..dfb6c7795407
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-=
bump-ARMv8-arch-to-AR.patch
>> @@ -0,0 +1,35 @@
>> +From ac6553ff3a21eb048f623081b7b7e31e43d38d77 Mon Sep 17 00:00:00 2001
>> +From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> +Date: Wed, 20 May 2026 14:14:02 +0300
>> +Subject: [PATCH] storage/innobase/sync/cache.cc: bump ARMv8 arch to
>> ARMv8.3
>> +
>> +Building for ARMv8.3-A and later, fails with:
>> +
>> +Assembler messages:
>> +{standard input}:169: Error: selected processor does not support `retaa=
'
>> +{standard input}:271: Error: selected processor does not support `retaa=
'
>> +
>> +It happens because the pmem_cvap() funciton manually inserts the `.arch
>> +armv8-2.a` clause, making GAS believe that retaa instruction (inserted
>> +by GCC) is invalid. Bump the manually inserted clause to armv8.3-a, to
>> +prevent GAS from choking on the retaa instructions.
>> +
>> +Upstream-Status: Inappropriate [upstream ticket
>> https://github.com/MariaDB/server/pull/3677#issuecomment-4497763227]
>>
>
> I think you can say 'Submitted [
> https://github.com/MariaDB/server/pull/5105]' now.
>

It is merged so 'Backport'


>
>
>> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> +---
>> + storage/innobase/sync/cache.cc | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/storage/innobase/sync/cache.cc
>> b/storage/innobase/sync/cache.cc
>> +index c5e67709e22b..104a45cee9ee 100644
>> +--- a/storage/innobase/sync/cache.cc
>> ++++ b/storage/innobase/sync/cache.cc
>> +@@ -85,7 +85,7 @@ static void pmem_cvap(const void* buf, size_t size)
>> + #if defined __ARM_ARCH && __ARM_ARCH =3D=3D 9
>> +     __asm__ __volatile__(".arch armv9.4-a\n dc cvap, %0" :: "r"(u) :
>> "memory");
>> + #else
>> +-    __asm__ __volatile__(".arch armv8.2-a\n dc cvap, %0" :: "r"(u) :
>> "memory");
>> ++    __asm__ __volatile__(".arch armv8.3-a\n dc cvap, %0" :: "r"(u) :
>> "memory");
>> + #endif
>> +
>> +   __asm__ __volatile__("dmb ishst" ::: "memory");
>> --
>> 2.47.3
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127127):
> https://lists.openembedded.org/g/openembedded-devel/message/127127
> Mute This Topic: https://lists.openembedded.org/mt/119406181/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004bf878065252a223
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;raj.=
khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; escreveu (quinta, 21/05/2026 =C3=A0(s) 05:10):<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, May 20, 2026 at 4:34=E2=80=AFAM Dmitry Baryshkov=
 via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.open=
embedded.org</a> &lt;dmitry.baryshkov=3D<a href=3D"mailto:oss.qualcomm.com@=
lists.openembedded.org" target=3D"_blank">oss.qualcomm.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Building mariadb for ARMv8.3-A and later, fails with:<br>
<br>
Assembler messages:<br>
{standard input}:169: Error: selected processor does not support `retaa&#39=
;<br>
{standard input}:271: Error: selected processor does not support `retaa&#39=
;<br>
<br>
It happens because the pmem_cvap() funciton manually inserts the `.arch<br>
armv8-2.a` clause, making GAS believe that retaa instruction (inserted<br>
by GCC) is invalid. Bump the manually inserted clause to armv8.3-a, to<br>
prevent GAS from choking on the retaa instructions.<br>
<br>
Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.=
qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<b=
r>
---<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
=C2=A0...-sync-cache.cc-bump-ARMv8-arch-to-AR.patch | 35 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 36 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-storage-inn=
obase-sync-cache.cc-bump-ARMv8-arch-to-AR.patch<br>
<br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/my=
sql/mariadb.inc<br>
index 9470184d3d43..456c1e1354e8 100644<br>
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
@@ -25,6 +25,7 @@ SRC_URI =3D &quot;<a href=3D"https://archive.mariadb.org/=
$%7BBP%7D/source/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">htt=
ps://archive.mariadb.org/${BP}/source/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://riscv32.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-support-reproducible-=
builds.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-storage-mroonga-CMake=
Lists.txt-fix-reproducible-buil.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-storage-innobase-sync=
-cache.cc-bump-ARMv8-arch-to-AR.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;14783ddc5edd966ff05aa0efd5ed6d3d369ed5b9=
e4080a448f00f87a9f0a4a6b&quot;<br>
<br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-c=
ache.cc-bump-ARMv8-arch-to-AR.patch b/meta-oe/recipes-dbs/mysql/mariadb/000=
1-storage-innobase-sync-cache.cc-bump-ARMv8-arch-to-AR.patch<br>
new file mode 100644<br>
index 000000000000..dfb6c7795407<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc=
-bump-ARMv8-arch-to-AR.patch<br>
@@ -0,0 +1,35 @@<br>
+From ac6553ff3a21eb048f623081b7b7e31e43d38d77 Mon Sep 17 00:00:00 2001<br>
+From: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm=
.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<br>
+Date: Wed, 20 May 2026 14:14:02 +0300<br>
+Subject: [PATCH] storage/innobase/sync/cache.cc: bump ARMv8 arch to ARMv8.=
3<br>
+<br>
+Building for ARMv8.3-A and later, fails with:<br>
+<br>
+Assembler messages:<br>
+{standard input}:169: Error: selected processor does not support `retaa&#3=
9;<br>
+{standard input}:271: Error: selected processor does not support `retaa&#3=
9;<br>
+<br>
+It happens because the pmem_cvap() funciton manually inserts the `.arch<br=
>
+armv8-2.a` clause, making GAS believe that retaa instruction (inserted<br>
+by GCC) is invalid. Bump the manually inserted clause to armv8.3-a, to<br>
+prevent GAS from choking on the retaa instructions.<br>
+<br>
+Upstream-Status: Inappropriate [upstream ticket <a href=3D"https://github.=
com/MariaDB/server/pull/3677#issuecomment-4497763227" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/MariaDB/server/pull/3677#issuecomment-44=
97763227</a>]<br></blockquote><div><br></div><div>I think you can say &#39;=
Submitted [<a href=3D"https://github.com/MariaDB/server/pull/5105" target=
=3D"_blank">https://github.com/MariaDB/server/pull/5105</a>]&#39; now.</div=
></div></div></blockquote><div><br></div><div>It is merged so &#39;Backport=
&#39;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss=
.qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<=
br>
+---<br>
+ storage/innobase/sync/cache.cc | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cache.=
cc<br>
+index c5e67709e22b..104a45cee9ee 100644<br>
+--- a/storage/innobase/sync/cache.cc<br>
++++ b/storage/innobase/sync/cache.cc<br>
+@@ -85,7 +85,7 @@ static void pmem_cvap(const void* buf, size_t size)<br>
+ #if defined __ARM_ARCH &amp;&amp; __ARM_ARCH =3D=3D 9<br>
+=C2=A0 =C2=A0 =C2=A0__asm__ __volatile__(&quot;.arch armv9.4-a\n dc cvap, =
%0&quot; :: &quot;r&quot;(u) : &quot;memory&quot;);<br>
+ #else<br>
+-=C2=A0 =C2=A0 __asm__ __volatile__(&quot;.arch armv8.2-a\n dc cvap, %0&qu=
ot; :: &quot;r&quot;(u) : &quot;memory&quot;);<br>
++=C2=A0 =C2=A0 __asm__ __volatile__(&quot;.arch armv8.3-a\n dc cvap, %0&qu=
ot; :: &quot;r&quot;(u) : &quot;memory&quot;);<br>
+ #endif<br>
+ <br>
+=C2=A0 =C2=A0__asm__ __volatile__(&quot;dmb ishst&quot; ::: &quot;memory&q=
uot;);<br>
-- <br>
2.47.3<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127127): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127127" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127127</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119406181/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119406181/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000004bf878065252a223--


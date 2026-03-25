Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7470D109E52F
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 23:45:04 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37064.1774482290873939192
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 16:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aip/avZT;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64c9a6d6b70so387665d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 16:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774482290; cv=none;
        d=google.com; s=arc-20240605;
        b=W9e0si367TFwVJXJ22AdDrKlnNEIJQoDKUWbC3pPPK1y5cTfxV3F+/boyV0/luAhWM
         i198ItZ0gv1KA92a3ahTqCsJoujbAQTEpl5L0i2kO969EREb4igQgtsnshQzKDuEJjyN
         mh+aYblqUvyANc2SGgy+SBgkJIGxXf1lpx0n1sGj9M2lLsYfy8HS5dS7WzPegzP44Wxa
         8gTsRNu05hcFaGD75Zk5ko9Csd1XKXcnNI/diWFs5H1CY0FqqyGg5Jvv93unShHEQi0p
         I6FGgU6hGVNIy7KtD4cnK4iPh3NS3YNRc8Gwp+FnB/e2Z2dTyc+oETnymCTHVlwqmqmt
         QXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3nqBkCzlGBsAd5ZEHo33KFzkJPS06HroshkICQAeXDc=;
        fh=nmERMpUSwJGvg1QtZWfuLpwaUOl0yU5cMet9fuSfsfY=;
        b=AlQ15DVvdOlTfrUoRfvzeTZKe56CjlRCLARsnT1ORqm1wecy+Stj81Mq+dLN3ZIKMn
         23MfqaCAHRIxPI/F96t4Wv0B9QzPsH4YEs1W/ysuvSTuJHV6YnscuR4k3Qpsc0+NywHx
         VfBEaDOttuOnq6ceQHZpPqRy974euG9Fe64HHEbnyLqYqzt04amU8N+/QIN1qaUbJ0T/
         fJpBqQnjY9Gl48W67Dc+znebr3JKXeb5Yg1d8Ax5Edoh+1l8FxAjU27eJ3mUaMKX0Un2
         JUmj/8tk7b6JgkaE1GnHHtnpXNajvej2omhSEgQjUxUbFiLBDarfIda3XUgNQ+EzD9WG
         HPtw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774482290; x=1775087090; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3nqBkCzlGBsAd5ZEHo33KFzkJPS06HroshkICQAeXDc=;
        b=aip/avZTDa5jsnAIW+j0d3D8R69bjIGxTu1Hb+YNjt3DQ7auBGJAlDKouYouvrzNvR
         dM4hYGOuVY3FEw9QpdQoAq3R6LvABVoUy/YfJYrM8/9hYblqZSleX6ibVDN1BkzYPgQk
         VtNIfYQo7JT/zgBqs9x6Nuy6RndW3vjz1T7nNvgic3Fx6VkzUJiGeuH8PygzbvmMzhYp
         5MHF6zy9iOCxzFJDabpcKeGQ5dQNzV5fu6qaiSiUVR0hUkbJ2R4prpJdaKF1gJhkEQmy
         NmG+Y+LHhHAO2hIsnF03rADbz1YKbvggKf/FHEBKZIAAt9OwqRGschpzMPVpTCq0uHam
         eFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774482290; x=1775087090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nqBkCzlGBsAd5ZEHo33KFzkJPS06HroshkICQAeXDc=;
        b=o3eiA+oEaePr7w+1y9Eissfykp19dcklkfD2omIMJh2ujEYqZGjgQ44RWFTFzu/k8c
         nCgKBWKAtz3nKNfEd9LeOS+0WTiOCXv1gSQCYMfxVA13sptjJ26FuUqU7PwDPib0mcuF
         +HCkYodHM1nW2zF2mVoaPKohrpRYgIEhYYImaAcbFydxMHxiJ88kEjgQ8WMlFCA5Hjvt
         riAsGgyKSbVw1SpTCXuhEY9llHxqwiIdGdruHYw5V7RBAvWjHijv+2l4hfDIxzEXn7NG
         akf4QmIC+En1+M38inZ/295MlV+Xf2cu5MjeZq7fhh8vB5XtUX9h5R7bXenJp6Np1GxF
         unrw==
X-Gm-Message-State: AOJu0YxVayrkCVH4+UwecuJdxh4kqdj68vnKsuegKG6yQpHdYXIFkT2k
	f1i8mk5c26H/RTxzWLpt1TsdjGZVmP1bimdLo72WawW8O7JShzw0xDo04V89Qa5WoBo5IoMPOPp
	0glW0HqvMYyZ1BjryryVhGXwby9TR0x0=
X-Gm-Gg: ATEYQzwapGI+WrwFpYSOqoo/yxOxL52uXrrmMxhWRDDJ1mkm7Ovyn2KFSL5qjHhDG1F
	jZqjTxdYq16lJ0loaXDbhmOfwvX7cTvSKdgIlMfNcZrWsn1P9ITVjKKEdC1D7MIxPNGvBnBdrIN
	O8R6am9mPsCY/VlrnzeewucrOAXRGNsmJOsm4EY2rf9ztSUtAt0nY2xfntq6vlzBJp5MYvXu8Yo
	G6Dm5n+uYPmF0aKFlxMkO4uHQhwY0wsR8C7BXis558vDh2oIiY8bFfBn92yU8cwnxYPIn+d0bSO
	8zVCdqYlxzkAflMykCrQ/rjhPrfiQ8xXXV0AmnTWjnlTcTj3g5ZpLY1xrUXQKG0V4vHkc+gWQOa
	ZVu0fRIc2TYrVZcwEuIpsFr4n
X-Received: by 2002:a53:ac99:0:b0:64e:f106:60f5 with SMTP id
 956f58d0204a3-64ef1066954mr3063672d50.44.1774482289911; Wed, 25 Mar 2026
 16:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260306215535.6619-1-gitbeam@proton.me> <CAEOi+Lt2wC78-QA9ykoNY4sW8jG=Kzun47sD6o3Em6D5nyOKUg@mail.gmail.com>
In-Reply-To: <CAEOi+Lt2wC78-QA9ykoNY4sW8jG=Kzun47sD6o3Em6D5nyOKUg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Mar 2026 16:44:23 -0700
X-Gm-Features: AQROBzAQK2E0o5V6Hw5L3PuOlrvR_4uKUyu5OVSoOVbBciW6a1LUeNbQBtvd6T8
Message-ID: <CAMKF1sqnxmz2vcR_0r955co7EYHHAwgLOAEv4_eX+J5mR+tykg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ntpsec: upgrade 1.2.2a -> 1.2.4
To: gitbeam@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008cebee064de1da36"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 23:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125630

--0000000000008cebee064de1da36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I do not reply to patches individually unless there is a problem with it. I
could tool the system to send applied email but it floods the mailing list.
Always check the latest master or master-next ( staging area ) for the
patch status.

On Wed, Mar 25, 2026 at 3:17=E2=80=AFPM git beam via lists.openembedded.org
<gitbeam=3Dgmail.com@lists.openembedded.org> wrote:

> Gentle ping =E2=80=93 any feedback on this patch would be appreciated.
>
> On Fri, 6 Mar 2026 at 22:56, G B <gitbeam@gmail.com> wrote:
>
>> Upgrade to latest upstream release 1.2.4.
>>
>> Release notes: https://blog.ntpsec.org/2025/04/18/version-1.2.4.html
>>
>> Signed-off-by: G B <gitbeam@proton.me>
>> ---
>>  .../{ntpsec_1.2.2a.bb =3D> ntpsec_1.2.4.bb}     | 20 +++++++++++-------=
-
>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>  rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb =3D>
>> ntpsec_1.2.4.bb} (86%)
>>
>> diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
>> b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
>> similarity index 86%
>> rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
>> rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
>> index 872d1ce4f7..9704e2d15e 100644
>> --- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
>> +++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
>> @@ -2,12 +2,12 @@ SUMMARY =3D "The Network Time Protocol suite, refactor=
ed"
>>  HOMEPAGE =3D "https://www.ntpsec.org/"
>>
>>  LICENSE =3D "CC-BY-4.0 & BSD-2-Clause & NTP & BSD-3-Clause & MIT"
>> -LIC_FILES_CHKSUM =3D
>> "file://LICENSES/BSD-2;md5=3D653830da7b770a32f6f50f6107e0b186 \
>> -
>> file://LICENSES/BSD-3;md5=3D55e9dcf6a625a2dcfcda4ef6a647fbfd \
>> -
>> file://LICENSES/CC-BY-4.0;md5=3D2ab724713fdaf49e4523c4503bfd068d \
>> -
>> file://LICENSES/MIT;md5=3D5a9dfc801af3eb49df2055c9b07918b2 \
>> -
>> file://LICENSES/NTP;md5=3Dcb56b7747f86157c78ca81f224806694"
>> -
>> +LIC_FILES_CHKSUM =3D
>> "file://LICENSES/BSD-2-Clause.txt;md5=3D653830da7b770a32f6f50f6107e0b186=
 \
>> +
>> file://LICENSES/BSD-3-Clause.txt;md5=3D55e9dcf6a625a2dcfcda4ef6a647fbfd =
\
>> +
>> file://LICENSES/CC-BY-4.0.txt;md5=3D2ab724713fdaf49e4523c4503bfd068d \
>> +
>> file://LICENSES/MIT.txt;md5=3D5a9dfc801af3eb49df2055c9b07918b2 \
>> +
>> file://LICENSES/NTP.txt;md5=3Dcb56b7747f86157c78ca81f224806694"
>> +
>>  DEPENDS +=3D "bison-native \
>>              openssl \
>>              python3"
>> @@ -17,7 +17,7 @@ SRC_URI =3D "
>> https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
>>             file://0001-wscript-Add-BISONFLAGS-support.patch \
>>             "
>>
>> -SRC_URI[sha256sum] =3D
>> "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea118a62f0a3226950e"
>> +SRC_URI[sha256sum] =3D
>> "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c81e0834f87eebc7d"
>>
>>  UPSTREAM_CHECK_URI =3D "ftp://ftp.ntpsec.org/pub/releases/"
>>
>> @@ -63,7 +63,6 @@ EXTRA_OECONF =3D "--cross-compiler=3D'${CC}' \
>>                  --pyshebang=3D${bindir}/python3 \
>>                  --pythondir=3D${PYTHON_SITEPACKAGES_DIR} \
>>                  --pythonarchdir=3D${PYTHON_SITEPACKAGES_DIR} \
>> -                --enable-debug-gdb \
>>                  --enable-early-droproot"
>>
>>  EXTRA_OEWAF_BUILD ?=3D "-v"
>> @@ -89,6 +88,11 @@ do_install:append() {
>>         else
>>                 install -D -m 0644 ${T}/volatiles.ntpsec
>> ${D}${sysconfdir}/default/volatiles/99_${BPN}
>>         fi
>> +
>> +    if [ -d ${D}/usr/lib64 ]; then
>> +        mv ${D}/usr/lib64/* ${D}${libdir}/
>> +        rmdir ${D}/usr/lib64
>> +    fi
>>  }
>>
>>  PACKAGE_BEFORE_PN =3D "${PN}-python ${PN}-utils ${PN}-viz"
>> --
>> 2.47.3
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125628):
> https://lists.openembedded.org/g/openembedded-devel/message/125628
> Mute This Topic: https://lists.openembedded.org/mt/118129522/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008cebee064de1da36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I do not reply to patches individually unless there is a p=
roblem with it. I could tool the system to send applied email but it floods=
 the mailing list.=C2=A0<div>Always check the latest master=C2=A0or master-=
next ( staging area ) for the patch status.</div></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, Mar 25, 2026 at 3:17=E2=80=AFPM git beam via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;gitbeam=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr">Gentle ping =E2=80=93 any feedback on this patch =
would be appreciated.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 6 Mar 2026 at 22:56, G B &lt;<a href=3D"mailto=
:gitbeam@gmail.com" target=3D"_blank">gitbeam@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade to latest up=
stream release 1.2.4.<br>
<br>
Release notes: <a href=3D"https://blog.ntpsec.org/2025/04/18/version-1.2.4.=
html" rel=3D"noreferrer" target=3D"_blank">https://blog.ntpsec.org/2025/04/=
18/version-1.2.4.html</a><br>
<br>
Signed-off-by: G B &lt;<a href=3D"mailto:gitbeam@proton.me" target=3D"_blan=
k">gitbeam@proton.me</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://ntpsec_1.2.2a.bb" rel=3D"noreferrer" target=3D=
"_blank">ntpsec_1.2.2a.bb</a> =3D&gt; <a href=3D"http://ntpsec_1.2.4.bb" re=
l=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a>}=C2=A0 =C2=A0 =C2=A0=
| 20 +++++++++++--------<br>
=C2=A01 file changed, 12 insertions(+), 8 deletions(-)<br>
=C2=A0rename meta-networking/recipes-support/ntpsec/{<a href=3D"http://ntps=
ec_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a> =3D=
&gt; <a href=3D"http://ntpsec_1.2.4.bb" rel=3D"noreferrer" target=3D"_blank=
">ntpsec_1.2.4.bb</a>} (86%)<br>
<br>
diff --git a/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpse=
c_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a> b/me=
ta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
similarity index 86%<br>
rename from meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec=
_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a><br>
rename to meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1=
.2.4.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
index 872d1ce4f7..9704e2d15e 100644<br>
--- a/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.2=
a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a><br>
+++ b/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.4=
.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
@@ -2,12 +2,12 @@ SUMMARY =3D &quot;The Network Time Protocol suite, refact=
ored&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://www.ntpsec.org/" rel=3D"norefer=
rer" target=3D"_blank">https://www.ntpsec.org/</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;CC-BY-4.0 &amp; BSD-2-Clause &amp; NTP &amp; BSD-3-=
Clause &amp; MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSES/BSD-2;md5=3D653830da7b770a32f6f=
50f6107e0b186 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/BSD-3;md5=3D55e9dcf6a625a2dcfcda4ef6a647fbfd \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/CC-BY-4.0;md5=3D2ab724713fdaf49e4523c4503bfd068d \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/MIT;md5=3D5a9dfc801af3eb49df2055c9b07918b2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/NTP;md5=3Dcb56b7747f86157c78ca81f224806694&quot;<br>
-<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSES/BSD-2-Clause.txt;md5=3D653830da=
7b770a32f6f50f6107e0b186 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/BSD-3-Clause.txt;md5=3D55e9dcf6a625a2dcfcda4ef6a647fbfd \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/CC-BY-4.0.txt;md5=3D2ab724713fdaf49e4523c4503bfd068d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/MIT.txt;md5=3D5a9dfc801af3eb49df2055c9b07918b2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/NTP.txt;md5=3Dcb56b7747f86157c78ca81f224806694&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
=C2=A0DEPENDS +=3D &quot;bison-native \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0openssl \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3&quot;<br>
@@ -17,7 +17,7 @@ SRC_URI =3D &quot;<a href=3D"https://ftp.ntpsec.org/pub/r=
eleases/ntpsec-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https=
://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-wscript-Add-BISONFLAG=
S-support.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2a=
ea118a62f0a3226950e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;443e54a6149d1b0bf08677d17b18fced9028b101fc2ff=
d2c81e0834f87eebc7d&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"ftp://ftp.ntpsec.org/pub/rele=
ases/" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.ntpsec.org/pub/releas=
es/</a>&quot;<br>
<br>
@@ -63,7 +63,6 @@ EXTRA_OECONF =3D &quot;--cross-compiler=3D&#39;${CC}&#39;=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pyshebang=
=3D${bindir}/python3 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pythondir=
=3D${PYTHON_SITEPACKAGES_DIR} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pythonarchd=
ir=3D${PYTHON_SITEPACKAGES_DIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-debug-gdb=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-earl=
y-droproot&quot;<br>
<br>
=C2=A0EXTRA_OEWAF_BUILD ?=3D &quot;-v&quot;<br>
@@ -89,6 +88,11 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 0644 =
${T}/volatiles.ntpsec ${D}${sysconfdir}/default/volatiles/99_${BPN}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 if [ -d ${D}/usr/lib64 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}/usr/lib64/* ${D}${libdir}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rmdir ${D}/usr/lib64<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGE_BEFORE_PN =3D &quot;${PN}-python ${PN}-utils ${PN}-viz&quot;<=
br>
-- <br>
2.47.3<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125628): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125628" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125628</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118129522/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118129522/1997914</a><br>
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

--0000000000008cebee064de1da36--


Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6FCC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 15:13:56 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.55957.1699024433526020488
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 08:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nhzds9Mh;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso1087414f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699024432; x=1699629232; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DuqftquzB3kMqYy0wRmNwb2UYBoOn6b3fXUIUYmJS60=;
        b=Nhzds9Mh8Dm86FWBs0i5s9R4D6INC4hUUT9NJUcXFvE2Q7jq1lVLMu8jLe4s8NqQJk
         ZBChKEOm5HvqCVe6fjBkb9d/8v0hfLndxv0E563kw+OTYWdyAPNUG9AGb9AlFUuzZR/p
         ypOTVKI08v3dLeF99AJzgD34dydTzk3ygqeg/m3fwiQf7mHK4KQ0WIgKeQ/ez5pfvhPD
         BAoZt+kjiDTbqi4bRIGgtjQ8kgfmeqgDCA9eVQG9WwNt0QtJ8m4wcs5b/FNJaSOnaTnU
         x3f28PlhI0tIvw4uCtvDjbZtN/gm9i7jwqTS4Ppst32JChdg8WWnAzPryTC60TE5o1fC
         Hw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699024432; x=1699629232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuqftquzB3kMqYy0wRmNwb2UYBoOn6b3fXUIUYmJS60=;
        b=GvMmsf8cnxKccgQ1I13dvK8vPr/z1fOxXNc1Dhx0bKJH0nvO7EuoGZLyylxWF4KWLz
         gN+hpv2kVAbkQupuOr3O39Od3TzuESvFOLQsAHRawWbAqRRtVM/yN8c3BVKLiEb5bOnp
         G2PzgxnNF2WXufW/XUJMF6s1b/qpvtd6tsxbvQo/jSfXLusEN38C9I0suipSvXcZe3PF
         ZcGmW3FoZsY73nYOAnb7nzpH0TSKYEYsoSogL4EtyShWW8rEBb8DcXoiqGkGmKRDujBX
         ywyQDBn68sRh9IKIdmX7O8Ymvpwd6WUHXhM8Rn/to7IUWrzF77nzqygG3wvdUXtHuB0r
         LnEQ==
X-Gm-Message-State: AOJu0YyotKMfe3UuKDDikX8njF3ajE1Qu9HjjJjId7PJawuRZdrud0Zc
	pkVqaelO7YZgWKNUpPLKwTFeZbE6SHQVMH9SPTk=
X-Google-Smtp-Source: AGHT+IGvJkKvvcgm9wJCdopjmMSNfJh+Er3KNzyFMlRrzGul9/GcdaSOtHlKpKd9tRpf7KRO4EvwnBNAub2Qi1R5lbM=
X-Received: by 2002:a05:6000:2c4:b0:32f:8c9a:67 with SMTP id
 o4-20020a05600002c400b0032f8c9a0067mr1777787wry.0.1699024431611; Fri, 03 Nov
 2023 08:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <d2651b9b-d360-4aeb-947e-4f1a8a09d348@gmail.com> <179424EFA34EF667.30622@lists.openembedded.org>
In-Reply-To: <179424EFA34EF667.30622@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 Nov 2023 16:13:38 +0100
Message-ID: <CA+chaQcvgmbniLW9ttPhEu3OczCiELeBn9KQDjdCAgjmZLHRzQ@mail.gmail.com>
Subject: Re: [oe] kirkstone merge request: Nov 3rd
To: martin.jansa@gmail.com
Cc: Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b60554060940f3c3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 15:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105867

--000000000000b60554060940f3c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Or maybe you just forgot to push stable/kirkstone-nut into kirkstone-next
before generating this PR?

As everything from this PR seems to be already in kirkstone branch,
while stable/kirkstone-nut has 7 new backports (including the projucer one
I've pinged).

On Fri, Nov 3, 2023 at 3:59=E2=80=AFPM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> Can you please include:
>
> https://patchwork.yoctoproject.org/project/oe/patch/20230929112628.383920=
3-1-martin.jansa@gmail.com/
>
> this is 3rd kirkstone pull where it was missed.
>
> On Fri, Nov 3, 2023 at 3:47=E2=80=AFPM Armin Kuster <akuster808@gmail.com=
> wrote:
>
>> The following changes since commit
>> 9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff:
>>
>>    python3-django: upgrade 4.2.3 -> 4.2.5 (2023-09-27 10:23:28 -0400)
>>
>> are available in the Git repository at:
>>
>>    https://git.openembedded.org/meta-openembedded kirkstone-next
>>
>> for you to fetch changes up to 79a6f60dabad9e5b0e041efa91379447ef030482:
>>
>>    mbedtls: upgrade 2.28.2 -> 2.28.5 (2023-10-17 09:07:38 -0400)
>>
>> ----------------------------------------------------------------
>> Denys Dmytriyenko (1):
>>        mbedtls: set up /usr/bin/hello as alternative
>>
>> Gianfranco Costamagna (3):
>>        mosquitto: do not automatically depend on dlt-daemon, it's a
>> non-mandatory logging system
>>        mosquitto: upgrade 2.0.15 -> 2.0.17
>>        mosquitto: upgrade 2.0.17 -> 2.0.18
>>
>> Joe Slater (1):
>>        nginx: add configure option
>>
>> Martin Jansa (1):
>>        mosquitto: add missing Upstream-Status
>>
>> Meenali Gupta (1):
>>        open-vm-tools: fix CVE-2023-20867
>>
>> Narpat Mali (1):
>>        python3-gevent: fix CVE-2023-41419
>>
>> Polampalli, Archana (4):
>>        samba: fix CVE-2023-34966
>>        samba: fix CVE-2022-2127
>>        samba:fix CVE-2023-34967
>>        samba: fix CVE-2023-34968
>>
>> Wang Mingyu (1):
>>        mosquitto: upgrade 2.0.14 -> 2.0.15
>>
>> Yi Zhao (1):
>>        mbedtls: upgrade 2.28.2 -> 2.28.5
>>
>>   .../mbedtls/{mbedtls_2.28.2.bb =3D> mbedtls_2.28.5.bb} |   7 +-
>>   meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 25 +=
+
>>   meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 27 +=
+
>>   .../recipes-connectivity/mosquitto/files/mosquitto.init         | 20 +=
-
>>   .../mosquitto/{mosquitto_2.0.14.bb =3D> mosquitto_2.0.18.bb} |   6 +-
>>   .../recipes-connectivity/samba/samba/CVE-2022-2127.patch        | 44 +=
+
>>   .../recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch  | 78
>> ++++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch  | 140
>> ++++++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch  | 178
>> ++++++++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch  | 125
>> ++++++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0001.patch  | 104
>> +++++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0002.patch  | 39 +=
+
>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0003.patch  | 65 +=
++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0004.patch  | 85
>> ++++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0005.patch  | 83
>> ++++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0006.patch  | 57 +=
++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0007.patch  | 49 +=
+
>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0008.patch  | 62 +=
++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0009.patch  | 465
>> +++++++++++++++++++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0010.patch  | 484
>> ++++++++++++++++++++
>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0011.patch  | 295
>> ++++++++++++
>>   meta-networking/recipes-connectivity/samba/samba_4.14.14.bb     | 16 +
>>   .../open-vm-tools/open-vm-tools/CVE-2023-20867.patch            | 158
>> +++++++
>>   .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 1 +
>>   .../recipes-devtools/python/python3-gevent/CVE-2023-41419.patch | 673
>> ++++++++++++++++++++++++++++
>>   meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb   | 2 +
>>   .../recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch | 39 +=
+
>>   meta-webserver/recipes-httpd/nginx/nginx.inc                    | 3 +
>>   28 files changed, 3316 insertions(+), 14 deletions(-)
>>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.2.bb
>> =3D> mbedtls_2.28.5.bb} (91%)
>>   create mode 100644
>> meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>>   create mode 100644
>> meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>>   rename
>> meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.14.bb =3D>
>> mosquitto_2.0.18.bb} (94%)
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0001.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0002.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0003.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0004.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0005.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0006.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0007.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0008.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0009.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0010.pat=
ch
>>   create mode 100644
>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0011.pat=
ch
>>   create mode 100644
>>
>> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-208=
67.patch
>>   create mode 100644
>> meta-python/recipes-devtools/python/python3-gevent/CVE-2023-41419.patch
>>   create mode 100644
>> meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.pat=
ch
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105866):
> https://lists.openembedded.org/g/openembedded-devel/message/105866
> Mute This Topic: https://lists.openembedded.org/mt/102365349/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b60554060940f3c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Or maybe you just forgot to push=C2=A0stable/kirkstone-nut=
 into kirkstone-next before generating this PR?<div><br></div><div>As every=
thing from this PR seems to be already in kirkstone branch, while=C2=A0stab=
le/kirkstone-nut has 7 new backports (including the projucer one I&#39;ve p=
inged).</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, Nov 3, 2023 at 3:59=E2=80=AFPM Martin Jansa via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;martin.j=
ansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr">Can you please include:<div><a href=3D"htt=
ps://patchwork.yoctoproject.org/project/oe/patch/20230929112628.3839203-1-m=
artin.jansa@gmail.com/" target=3D"_blank">https://patchwork.yoctoproject.or=
g/project/oe/patch/20230929112628.3839203-1-martin.jansa@gmail.com/</a><br>=
</div><div><br></div><div>this is 3rd kirkstone pull where it was missed.</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Nov 3, 2023 at 3:47=E2=80=AFPM Armin Kuster &lt;<a href=3D"mail=
to:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The followin=
g changes since commit 9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff:<br>
<br>
=C2=A0=C2=A0 python3-django: upgrade 4.2.3 -&gt; 4.2.5 (2023-09-27 10:23:28=
 -0400)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openemb=
edded</a> kirkstone-next<br>
<br>
for you to fetch changes up to 79a6f60dabad9e5b0e041efa91379447ef030482:<br=
>
<br>
=C2=A0=C2=A0 mbedtls: upgrade 2.28.2 -&gt; 2.28.5 (2023-10-17 09:07:38 -040=
0)<br>
<br>
----------------------------------------------------------------<br>
Denys Dmytriyenko (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mbedtls: set up /usr/bin/hello as alte=
rnative<br>
<br>
Gianfranco Costamagna (3):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: do not automatically depend=
 on dlt-daemon, it&#39;s a <br>
non-mandatory logging system<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: upgrade 2.0.15 -&gt; 2.0.17=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: upgrade 2.0.17 -&gt; 2.0.18=
<br>
<br>
Joe Slater (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nginx: add configure option<br>
<br>
Martin Jansa (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: add missing Upstream-Status=
<br>
<br>
Meenali Gupta (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 open-vm-tools: fix CVE-2023-20867<br>
<br>
Narpat Mali (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-gevent: fix CVE-2023-41419<br>
<br>
Polampalli, Archana (4):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samba: fix CVE-2023-34966<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samba: fix CVE-2022-2127<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samba:fix CVE-2023-34967<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samba: fix CVE-2023-34968<br>
<br>
Wang Mingyu (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: upgrade 2.0.14 -&gt; 2.0.15=
<br>
<br>
Yi Zhao (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mbedtls: upgrade 2.28.2 -&gt; 2.28.5<b=
r>
<br>
=C2=A0=C2=A0.../mbedtls/{<a href=3D"http://mbedtls_2.28.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">mbedtls_2.28.2.bb</a> =3D&gt; <a href=3D"http://mbe=
dtls_2.28.5.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.28.5.bb</a>}=
 |=C2=A0=C2=A0 7 +-<br>
=C2=A0=C2=A0meta-networking/recipes-connectivity/mosquitto/files/2894.patch=
 | 25 ++<br>
=C2=A0=C2=A0meta-networking/recipes-connectivity/mosquitto/files/2895.patch=
 | 27 ++<br>
=C2=A0=C2=A0.../recipes-connectivity/mosquitto/files/mosquitto.init=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 +-<br>
=C2=A0=C2=A0.../mosquitto/{<a href=3D"http://mosquitto_2.0.14.bb" rel=3D"no=
referrer" target=3D"_blank">mosquitto_2.0.14.bb</a> =3D&gt; <a href=3D"http=
://mosquitto_2.0.18.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0.=
18.bb</a>} |=C2=A0=C2=A0 6 +-<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2022-2127.patch=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 44 ++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch=
=C2=A0 | 78 ++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch=
=C2=A0 | 140 <br>
++++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch=
=C2=A0 | 178 <br>
++++++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch=
=C2=A0 | 125 <br>
++++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0001.patch=
=C2=A0 | 104 <br>
+++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0002.patch=
=C2=A0 | 39 ++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0003.patch=
=C2=A0 | 65 +++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0004.patch=
=C2=A0 | 85 ++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0005.patch=
=C2=A0 | 83 ++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0006.patch=
=C2=A0 | 57 +++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0007.patch=
=C2=A0 | 49 ++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0008.patch=
=C2=A0 | 62 +++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0009.patch=
=C2=A0 | 465 <br>
+++++++++++++++++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0010.patch=
=C2=A0 | 484 <br>
++++++++++++++++++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0011.patch=
=C2=A0 | 295 <br>
++++++++++++<br>
=C2=A0=C2=A0meta-networking/recipes-connectivity/samba/<a href=3D"http://sa=
mba_4.14.14.bb" rel=3D"noreferrer" target=3D"_blank">samba_4.14.14.bb</a>=
=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +<br>
=C2=A0=C2=A0.../open-vm-tools/open-vm-tools/CVE-2023-20867.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 158 <br>
+++++++<br>
=C2=A0=C2=A0.../recipes-support/open-vm-tools/<a href=3D"http://open-vm-too=
ls_11.3.5.bb" rel=3D"noreferrer" target=3D"_blank">open-vm-tools_11.3.5.bb<=
/a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +<br>
=C2=A0=C2=A0.../recipes-devtools/python/python3-gevent/CVE-2023-41419.patch=
 | 673 <br>
++++++++++++++++++++++++++++<br>
=C2=A0=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-g=
event_21.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gevent_21.12=
.0.bb</a>=C2=A0=C2=A0 | 2 +<br>
=C2=A0=C2=A0.../recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch=
 | 39 ++<br>
=C2=A0=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 3 +<br>
=C2=A0=C2=A028 files changed, 3316 insertions(+), 14 deletions(-)<br>
=C2=A0=C2=A0rename meta-networking/recipes-connectivity/mbedtls/{<a href=3D=
"http://mbedtls_2.28.2.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.2=
8.2.bb</a> <br>
=3D&gt; <a href=3D"http://mbedtls_2.28.5.bb" rel=3D"noreferrer" target=3D"_=
blank">mbedtls_2.28.5.bb</a>} (91%)<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/mosquitto/files/2894.patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/mosquitto/files/2895.patch<br>
=C2=A0=C2=A0rename <br>
meta-networking/recipes-connectivity/mosquitto/{<a href=3D"http://mosquitto=
_2.0.14.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0.14.bb</a> =
=3D&gt; <br>
<a href=3D"http://mosquitto_2.0.18.bb" rel=3D"noreferrer" target=3D"_blank"=
>mosquitto_2.0.18.bb</a>} (94%)<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0001.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0002.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0003.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0004.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0005.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0006.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0007.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0008.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0009.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0010.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0011.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.=
patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-python/recipes-devtools/python/python3-gevent/CVE-2023-41419.patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch<=
br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105866): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105866" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105866</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102365349/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102365349/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b60554060940f3c3--


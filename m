Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8750.1794238936250584922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 07:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=U3MrR8dT;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be6030c9fso786618d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 07:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794238935; cv=none;
        d=google.com; s=arc-20260327;
        b=KsYROEPmigMWdZ/7JIyhXV4wGaqlV3SoB6VpzvkCwx1/IzgU6QeaQkcvB4dzXUiCZh
         nG4MXfOH5B2B+xTM44sSPnajiuJj1eSva2NpdX3oUH/YpEs9TnPr7ZIOfrG6RDQY+NqD
         qMv2VAoWcAifDt2aH7XJb9hL77SUV2Jp9lwdqv1Gix4R+0JhgdUBNYzpk3V9dtsjYFt8
         Z/N2m8oQp4GNpPrFuRYiycn4AmZdjS6m5lfl5UtdrxJpy9GJPu8/MAQUkp9b5WlC+pqi
         k4CSH9fo2B0IVM4pgIzi+m3H+3U+cHbNy/JS8s5aU6PpwXlpwqbDtNpo3pgQ+0kcTt8L
         XG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HsFoPBhQSdisXV0xwT2Tsyxudfx0mrpxWsgLlSuN/MU=;
        fh=VD2Xf9JlQuLMcCcvtuDQCLVYdA4ERSFPUZnFrsdABUE=;
        b=P5/oSsl70bcmM4cqZ/9YJzdkZm/Fx02Xj7dEGr7xcC/f182lZSJ+BQ8/4ej5O0dn9r
         2dHdRzbZr3MZfshnvZfDhWTkRw4v2RkJEHNsQEU4W6ubXL3eVd0lNvwGODnQdMGVNo63
         h5mIC2qN7dC1hsJpzdgBNMgNe2QQWQZNmO2J+ntCaRUbAFV0KyWmIKJFnoSHWQjky3IM
         NaWeqj8WDGMLmrq3UdNibFNpGjlbhLVdl53b5tJ81W2XW179M4QV1KVAMXhmtaD6wtjT
         HqFttOQv0K1gWC0ci7Capnko2FA/mAu1wgQKBgfnkqwDQVdCqv620VzRF59UJbI890a2
         2fJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238935; x=1794843735; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsFoPBhQSdisXV0xwT2Tsyxudfx0mrpxWsgLlSuN/MU=;
        b=U3MrR8dT4Xl+hEYy2HTtPBds67L/hYxqWkXjW9q6fiV72rtCeaDrAMtFwF5dI8JGFG
         ccA2DuRIekulq49IG1lhkh3fcK9g3jYDrFJc+RUF3/lMj3w1sNSVVVu3C/tKzZdhlZNG
         /hIBkMmhUrQcqunYnYTprWaJu0penuf56D3QkmuzgBgn0PeyJTlGTxEmwxYU2y0PMKrs
         PY/VNoW/NnQa8SpBlpzhzoU316ZdGbs9aDFssOJczdgybpQezVVAiI9WlMyRnCoXGvxK
         KgF5E9sJDVVtT5eAuS0/c1vavTtmNB8VutKgCCmX0HZCEgdPc1whS30f080ed7rxFwFU
         ZPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238935; x=1794843735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HsFoPBhQSdisXV0xwT2Tsyxudfx0mrpxWsgLlSuN/MU=;
        b=GsQoMwMSZPnwTV9s4KB8A55MuHlMdTlXhKrvt9Xy97mmWoFNsp1za7ED7ZbkOKZhdD
         ALnqflisV9WPSNdpIcYy958foL4oExXk9dkveYseMHxbNWbnobWc7qBXDanWsdKRrjWE
         1jykujtrN88FpMUklhDVFPzb2hQ86hI5QSt4lG4lKNR3X9MC9nf7vgE0WEKYuv2vSjaK
         1j19QlUWbnKuHUO6CRueIhBREFKcYyfb+G5vWDhy4pL1NgYtD0xeaLx4KiyTpY6R7SmF
         Rm87eJ+wPuUCIVZ44A6p1qyR3iM9gO3HVGi294sT535n3rGzPubIuzmbcaOcLfEuKnQX
         NwVA==
X-Gm-Message-State: APuU4Z/5l50OlPmL/+YDEbA3frvGTZZ0gD3LXehdNVualx96kntBoK1Q
	hxlwgS+UVPtqc8oMzsKtRmh3esvR+uBMdb0uAZ7uJT+fPdrelaqRNUMpRfY01VmDYnupZLAT8Kk
	WE9ZfqrzdyshhT8I6oyWDliqY6JMrttJ/vlEJ
X-Gm-Gg: AYBFou3zA8T4av6NdXdJdQO7Ls+sBjs4UFM0rgvp4lXsMHiFTj0SmRjqdJ1jw9cmc0q
	ohHLCnEp6fBisvfdMNzYdsMtmcjUjDfXlo9IsioNn0k/qcsTSrMreoM0CU1uCKwCylWQyVqcL7D
	EaWwbjyKCwZ+URhgK6M7Yq5vQ5NweiOilSRNjs7Ydz+86YKQYaypllnm35uyvww3HMZOJ66ExP9
	wgRPorr1r9ctnm/+LCKwkKJW2+2vOQdeh5IopMV2bNx51M62FPJz2fEJTHUWETA9kXG5T0dBLg4
	YbKhj9rjFLQW5evZobfye92ksHzHrMRs8n19ubZhoeDO0WGEWviU12mGLBQUnBU1fw8s/yuXsdJ
	Km8KP0WhfvHR5B461/meoKrcE/XLEdHREhlHzUyzaKh7MU6lYt9QavXGhe9kwEdN2NyQlD6Zuby
	8Zbt38xZ9hgrAVoIa9UucLbSNTc9Ot/4mkmk20bPdVwZQGTi9m7y5HAl8dfiZFg5QtSlPdAEq5Y
	BblJZdPYJL5ercf1LgkgjgYywscWIagboUj3REAwaZ2tX2ADSr8zT98ip3awri6A+VYrBGX9hJP
	T60e6m70lD1VByY4zYaKxUuedmkWe0+6GCMMPb11X9pFrT4ZPY2Iram2Kv1JsUnpyLkc5o8e/0y
	PGXZ8uQJ2iLiFkLGEGCSTWg==
X-Received: by 2002:a53:ee10:0:b0:67b:fc94:86dd with SMTP id
 956f58d0204a3-67c3dabe576mr1810383d50.106.1794238934942; Mon, 09 Nov 2026
 07:42:14 -0800 (PST)
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.60c45970-bf59-4753-942e-e3561e9c5a75@emailsignatures365.codetwo.com>
 <20261109081800.69803-1-mike.looijmans@topic.nl>
In-Reply-To: <20261109081800.69803-1-mike.looijmans@topic.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Nov 2026 07:41:38 -0800
X-Gm-Features: AclHuK9tN3IBIvmCJRtMLiZQnQN6w2L2gGcX47Mn6Di94gtJTqYtZXNk7PU1D40
Message-ID: <CAMKF1soWj4FYR=Kq-mMRXjMnUzMkztdO9Epss9D61RWPE5nS0g@mail.gmail.com>
Subject: Re: [oe] [PATCH 0/4] Apply the mongodb patches from the scarthgap
 branch, which is ahead
To: mike.looijmans@topic.nl
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005c0c93065fd9ce78"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 15:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132064

--0000000000005c0c93065fd9ce78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails to build -
https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1947/ste=
ps/18/logs/stdio

| scons: Reading SConscript files ...
| ModuleNotFoundError: No module named 'pkg_resources':

On Mon, Nov 9, 2026 at 12:18=E2=80=AFAM Mike Looijmans via openembedded-dev=
el
<mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:

> of the current state and was apparently lost in master.
>
> As wrynose introduces new build issues, this still won't build yet.
>
>
> Awais Belal (2):
>   mongodb: fix build with python 3.12
>   mongodb: update to 4.4.29
>
> Gyorgy Sarvari (2):
>   mongodb: upgrade 4.4.29 -> 4.4.30
>   mongodb: ignore CVE-2025-14911
>
>  ...001-free_mon-Include-missing-cstdint.patch | 28 ---------
>  ...econfig.py-python-3.12-compatibility.patch | 57 +++++++++++++++++++
>  .../recipes-dbs/mongodb/mongodb_git.bb        | 11 ++--
>  3 files changed, 62 insertions(+), 34 deletions(-)
>  delete mode 100644
> meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_=
mon-Include-missing-cstdint.patch
>  create mode 100644
> meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-modul=
econfig.py-python-3.12-compatibility.patch
>
> ---
> base-commit: c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e
> branch: wrynose-mongodb
>
> --
> 2.43.0
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ
> <https://www.google.com/maps/search/Materiaalweg+4,+5681+RJ?entry=3Dgmail=
&source=3Dg>
> Best
> The Netherlands
>
> T: +31 (0) 499 33 69 69 <+31%20499%20336%20969>
> E: mike.looijmans@topic.nl
> W: www.topic.nl
>
> Please consider the environment before printing this e-mail
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132053):
> https://lists.openembedded.org/g/openembedded-devel/message/132053
> Mute This Topic: https://lists.openembedded.org/mt/122170765/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005c0c93065fd9ce78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails to build=C2=A0-=C2=A0<a href=3D"https://autobuilder.=
yoctoproject.org/valkyrie/#/builders/81/builds/1947/steps/18/logs/stdio">ht=
tps://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1947/steps=
/18/logs/stdio</a><div><br><div>| scons: Reading SConscript files ...<br>| =
ModuleNotFoundError: No module named &#39;pkg_resources&#39;:</div></div></=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, Nov 9, 2026 at 12:18=E2=80=AFAM Mike Looijmans =
via openembedded-devel &lt;mike.looijmans=3D<a href=3D"mailto:topic.nl@list=
s.openembedded.org">topic.nl@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">of the current state and=
 was apparently lost in master.<br>
<br>
As wrynose introduces new build issues, this still won&#39;t build yet.<br>
<br>
<br>
Awais Belal (2):<br>
=C2=A0 mongodb: fix build with python 3.12<br>
=C2=A0 mongodb: update to 4.4.29<br>
<br>
Gyorgy Sarvari (2):<br>
=C2=A0 mongodb: upgrade 4.4.29 -&gt; 4.4.30<br>
=C2=A0 mongodb: ignore CVE-2025-14911<br>
<br>
=C2=A0...001-free_mon-Include-missing-cstdint.patch | 28 ---------<br>
=C2=A0...econfig.py-python-3.12-compatibility.patch | 57 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-dbs/mongodb/<a href=3D"http://mongodb_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">mongodb_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
1 ++--<br>
=C2=A03 files changed, 62 insertions(+), 34 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mon=
godb/mongodb/0001-free_mon-Include-missing-cstdint.patch<br>
=C2=A0create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mon=
godb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch<br>
<br>
---<br>
base-commit: c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e<br>
branch: wrynose-mongodb<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
Met vriendelijke groet / kind regards,<br>
<br>
Mike Looijmans<br>
System Expert<br>
<br>
<br>
TOPIC Embedded Products B.V.<br>
<a href=3D"https://www.google.com/maps/search/Materiaalweg+4,+5681+RJ?entry=
=3Dgmail&amp;source=3Dg">Materiaalweg 4, 5681 RJ</a> Best<br>
The Netherlands<br>
<br>
T: <a href=3D"tel:+31%20499%20336%20969" value=3D"+31499336969" target=3D"_=
blank">+31 (0) 499 33 69 69</a><br>
E: <a href=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijm=
ans@topic.nl</a><br>
W: <a href=3D"http://www.topic.nl" rel=3D"noreferrer" target=3D"_blank">www=
.topic.nl</a><br>
<br>
Please consider the environment before printing this e-mail<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132053): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132053" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132053</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122170765/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122170765/1997914</a><br>
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

--0000000000005c0c93065fd9ce78--

Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467CDCD8C92
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 01:23:43 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44653.1780881816619970667
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2026 18:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=goqe3tgc;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-660e9ea26b9so3445460d50.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 18:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780881816; cv=none;
        d=google.com; s=arc-20240605;
        b=EeN7k69cUbkD3WdsDpWWaMXL1i2PNW5ewe+bHrNzNYByZztt3XESdoYJMd0ZS1tzxY
         PlnFlz1WYU+FBnnAmnYBLTzrEAiQ8PUbRzSzmSslA+B2/89xIxH6RUV8zmPAWJSt9eGH
         h4+0u+C3ltA/kLoKRCJKtlsSbgBGZ1AzYnY7TMjyo8xpkTmdtB2FyY+HGw5uPjt7woa9
         J1ZWiHawBiGljOxdoNmQYxW/NO6KgYykE78TIj6IsBfz6HnBmfD+xwlZWmQhgQKiFtkW
         rjmAvacMlXw69uS8eiynS29a6hB1cZ2AEQQiRtTr9ZpACAn1ndgLQ1izF6tqpVW5RmHy
         DdSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o7DASDOxhZOD09w88sEQuFXg2555o40U7tQtvev7VQk=;
        fh=t00iliNe9pL0QaiZgATkfZzbJzbg/gzT7cLy1S2kUZs=;
        b=KL2i6i0FNK676PZV1mOG66JF1laKbh53M/AwZdfhwiPb9cT20SaHDxMEXXQUWePU0R
         H/gFma73n7soYojDOHECMlnbxaAZ29R/sCVDZfWCmyqGIvC786NQF3nAmz5y1iXmIzOe
         XrV0Kq3zeEMbi+SxO11/5d8TyDHUCiUqzieKhtT69Gf80A95vYPtdufjtfjOIvWpJcwq
         b9gptXpdRy4yVR1PM1eiw5ixISVuthUNdR7yJK1fbCcMs3pcpqJnx+gAzVi0oihvkxg9
         jcbfmOtNSlmbUPmEpl47SYXrKWDU0cmgMoZY5GuDlGUjxsHlNAS70VB680M8GIuw3jku
         19fA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780881816; x=1781486616; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o7DASDOxhZOD09w88sEQuFXg2555o40U7tQtvev7VQk=;
        b=goqe3tgcpbdVDW5N/rtNdUcfUm0rI7DQr2n0adRnBYIRxk5hwcHEqhmaObB805KOQA
         0QxkfDBOT5ajLcPOspDGrFb/RWyCfBhiB0SHwx6MNhckawIE0nXH0/flq4HfSIuy6X8V
         I1VqOPrlj0nTjRrdOkmST+XGQmlyS2XlpFrctEQ8E4JPYGD2RVx4KCyXrTQo9Wara+ii
         720+SUEkcD3x4taynn8GYoacWOSbbwu2hjI2cJUSTmP9DVYEhmVqZ1+sLwX3UM6n/T6l
         vS+XUl1P46P83LRWHdUDeSNWCVMgxdI1ZNAUXVbKPKNnx0PA/RaBqrrnB4tshyw0+FwQ
         fuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780881816; x=1781486616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7DASDOxhZOD09w88sEQuFXg2555o40U7tQtvev7VQk=;
        b=NvYNmbZihwaweYt+bQcHbxY94C03rBy6c/H6MmZzxBO8iaWB6W3dbK2Wxzl3T5I8iB
         63NjKBypWt0Tz8T1qL71bEebHhW7h/mFHAX6EncNOGbKBEUWYmPltBE02gbVquV8WKQJ
         mGZYg3Pxs25P3JgPLWInVjpmV0ZRDo4TJRz3Tbqi5Qzz2Pvv+wmh8dNQ9WvS9kYNo72g
         I934k8dKBedsVB8F7UaIuheVG3DiixWtMiWS9513MkxiCvtAllqkKrR1jny5BxFN2HzM
         h08AmCPZMx5Bvc1maZy9JHq92K7zcLsmk9v4Qi0PT06Ig1d7JwjAJnMYfW6MvEBQsjj9
         nbTA==
X-Gm-Message-State: AOJu0YzQSPY/Znr41EdfMnSVredd6q6qvfvOVNHbEdTW8Yl6ZKXb+bkB
	+98scwLGrnvy0QNW+O2aqIYblnFutWQQbVvfLmDIptZrWS8Wpw/Z+SYEn2/X41x+2UJEOLn+V2G
	HWFJqI/WTHGZ22XnpimPZt2knnw7pGC1iJ5ot
X-Gm-Gg: Acq92OGKfMxtTMQCY107VIVPonYKTnjz4M3KnCrBg64BcPdSUoTUJWfJZzHQ+yHiTnF
	uJMRbtpRuDCfB+kkCgUHWpJJu91o/DwAVSxsthP5OdGqYhJ6oLg/odxpiCNtvZRxMj4s9wrperZ
	0vgoiJoX9TloV/q5RCNxKJLrXh7RspXPGHLT7q7vus/A5YsozU4GDanwPjVDxOr/FxhWCKY8EPZ
	Est3tY7TQCLs+VC+0MHZh/lyptQtOBMV8skEDvswtI6nF8+0wQzATyBXUsvBjsrv5lzwUYr6xXm
	YeScSYZYsZoX7ksTTGbSO5+WfQM+JQOBBMmzPxsAh9hyFCcvEXtv82eKOPX2vH6rIxwaVFgAAaL
	mB+0r2iHC0kET8X1teL/RhUDTVEFHeP2ARSEL2XyssAOw3Ikz+9zJ2yjEwt6xOGLt+Ic6+/0/vw
	dlBJg1gkXqlVlZCwo=
X-Received: by 2002:a05:690e:11c8:b0:65c:5bfd:b20f with SMTP id
 956f58d0204a3-66106fb0091mr11344991d50.61.1780881815627; Sun, 07 Jun 2026
 18:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0FfPTgtq69dE4VpCQomg9=ws+EoX07h+rhFmffuyGS+5g@mail.gmail.com>
 <20260529085309.3596033-1-filipe.pires@konsulko.com>
In-Reply-To: <20260529085309.3596033-1-filipe.pires@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Jun 2026 18:23:08 -0700
X-Gm-Features: AVVi8CcmKiCgSe0tj_LP4i27E0hiZmfoX9IPNfbAs4zb_eEXTVaQZ3xC83OtWZY
Message-ID: <CAMKF1soBRvKyYydVgB76ajLYcELGU=Dp6yZs9EK0xsRzWmZ4jQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v3] radvd: upgrade 2.20 -> 2.21
To: filipe.pires@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000001ec970653b3dc42"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 01:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127418

--00000000000001ec970653b3dc42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails to build

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7081084/raw_inlin=
e

On Fri, May 29, 2026 at 1:53=E2=80=AFAM fpires96 via lists.openembedded.org
<filipe.pires=3Dkonsulko.com@lists.openembedded.org> wrote:

> From: Filipe Pires <filipe.pires@konsulko.com>
>
> The litech.org distribution URL is no longer available for this release,
> so switch to fetching directly from the upstream git repository. This
> also fixes the src-uri-bad QA warning for using GitHub archive URLs.
>
> radvd 2.21 hardens radvdump against malformed input (CVE-2026-48715).
> ---
>  .../radvd/{radvd_2.20.bb =3D> radvd_2.21.bb}                | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-daemons/radvd/{radvd_2.20.bb =3D>
> radvd_2.21.bb} (93%)
>
> diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
> b/meta-networking/recipes-daemons/radvd/radvd_2.21.bb
> similarity index 93%
> rename from meta-networking/recipes-daemons/radvd/radvd_2.20.bb
> rename to meta-networking/recipes-daemons/radvd/radvd_2.21.bb
> index d02433c5ec..7f4cb41431 100644
> --- a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
> +++ b/meta-networking/recipes-daemons/radvd/radvd_2.21.bb
> @@ -6,7 +6,7 @@ Discovery for IP Version 6 (IPv6). With these \
>  advertisements hosts can automatically configure their \
>  addresses and some other parameters. They also can \
>  choose a default router based on these advertisements."
> -HOMEPAGE =3D "http://www.litech.org/radvd/"
> +HOMEPAGE =3D "https://github.com/radvd-project/radvd"
>  SECTION =3D "net"
>  DEPENDS =3D "flex-native bison-native libdaemon libbsd"
>
> @@ -14,14 +14,16 @@ DEPENDS =3D "flex-native bison-native libdaemon libbs=
d"
>  LICENSE =3D "radvd"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D73ebbf7182ae996e65e8fadc9a8=
c45db"
>
> -SRC_URI =3D "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
> +SRCREV =3D "a8500f4035b52028c90b0a938dfe8cd65e38fb50"
> +SRC_URI =3D "git://
> github.com/radvd-project/radvd.git;branch=3Dmaster;tag=3Dv${PV};protocol=
=3Dhttps
> <http://github.com/radvd-project/radvd.git;branch=3Dmaster;tag=3Dv$%7BPV%=
7D;protocol=3Dhttps>
> \
>             file://radvd.init \
>             file://radvd.service \
>             file://volatiles.03_radvd \
>             file://radvd.default \
>             file://radvd.conf \
>             "
> -SRC_URI[sha256sum] =3D
> "af37c5a81d59f3bdc00d83056606ffa1810d4550beed6caa4f81181246494220"
> +
> +S =3D "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/radvd-project/radvd/releases"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127284):
> https://lists.openembedded.org/g/openembedded-devel/message/127284
> Mute This Topic: https://lists.openembedded.org/mt/119544056/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000001ec970653b3dc42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails to build=C2=A0<div><br></div><div><a href=3D"https:/=
/autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7081084/raw_inline">http=
s://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7081084/raw_inline</a=
></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, May 29, 2026 at 1:53=E2=80=AFAM fpire=
s96 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;filipe.pires=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org"=
>konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Filipe Pires &lt;<a href=3D"mailt=
o:filipe.pires@konsulko.com" target=3D"_blank">filipe.pires@konsulko.com</a=
>&gt;<br>
<br>
The <a href=3D"http://litech.org" rel=3D"noreferrer" target=3D"_blank">lite=
ch.org</a> distribution URL is no longer available for this release,<br>
so switch to fetching directly from the upstream git repository. This<br>
also fixes the src-uri-bad QA warning for using GitHub archive URLs.<br>
<br>
radvd 2.21 hardens radvdump against malformed input (CVE-2026-48715).<br>
---<br>
=C2=A0.../radvd/{<a href=3D"http://radvd_2.20.bb" rel=3D"noreferrer" target=
=3D"_blank">radvd_2.20.bb</a> =3D&gt; <a href=3D"http://radvd_2.21.bb" rel=
=3D"noreferrer" target=3D"_blank">radvd_2.21.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 +++++---<br>
=C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-networking/recipes-daemons/radvd/{<a href=3D"http://radvd=
_2.20.bb" rel=3D"noreferrer" target=3D"_blank">radvd_2.20.bb</a> =3D&gt; <a=
 href=3D"http://radvd_2.21.bb" rel=3D"noreferrer" target=3D"_blank">radvd_2=
.21.bb</a>} (93%)<br>
<br>
diff --git a/meta-networking/recipes-daemons/radvd/<a href=3D"http://radvd_=
2.20.bb" rel=3D"noreferrer" target=3D"_blank">radvd_2.20.bb</a> b/meta-netw=
orking/recipes-daemons/radvd/<a href=3D"http://radvd_2.21.bb" rel=3D"norefe=
rrer" target=3D"_blank">radvd_2.21.bb</a><br>
similarity index 93%<br>
rename from meta-networking/recipes-daemons/radvd/<a href=3D"http://radvd_2=
.20.bb" rel=3D"noreferrer" target=3D"_blank">radvd_2.20.bb</a><br>
rename to meta-networking/recipes-daemons/radvd/<a href=3D"http://radvd_2.2=
1.bb" rel=3D"noreferrer" target=3D"_blank">radvd_2.21.bb</a><br>
index d02433c5ec..7f4cb41431 100644<br>
--- a/meta-networking/recipes-daemons/radvd/<a href=3D"http://radvd_2.20.bb=
" rel=3D"noreferrer" target=3D"_blank">radvd_2.20.bb</a><br>
+++ b/meta-networking/recipes-daemons/radvd/<a href=3D"http://radvd_2.21.bb=
" rel=3D"noreferrer" target=3D"_blank">radvd_2.21.bb</a><br>
@@ -6,7 +6,7 @@ Discovery for IP Version 6 (IPv6). With these \<br>
=C2=A0advertisements hosts can automatically configure their \<br>
=C2=A0addresses and some other parameters. They also can \<br>
=C2=A0choose a default router based on these advertisements.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://www.litech.org/radvd/" rel=3D"norefer=
rer" target=3D"_blank">http://www.litech.org/radvd/</a>&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/radvd-project/radvd" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/radvd-project/radvd</a=
>&quot;<br>
=C2=A0SECTION =3D &quot;net&quot;<br>
=C2=A0DEPENDS =3D &quot;flex-native bison-native libdaemon libbsd&quot;<br>
<br>
@@ -14,14 +14,16 @@ DEPENDS =3D &quot;flex-native bison-native libdaemon li=
bbsd&quot;<br>
=C2=A0LICENSE =3D &quot;radvd&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D73ebbf7182ae996e65e=
8fadc9a8c45db&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://v6web.litech.org/radvd/dist/radvd-$%7B=
PV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://v6web.litech.org/=
radvd/dist/radvd-${PV}.tar.gz</a> \<br>
+SRCREV =3D &quot;a8500f4035b52028c90b0a938dfe8cd65e38fb50&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/radvd-project/radvd.g=
it;branch=3Dmaster;tag=3Dv$%7BPV%7D;protocol=3Dhttps" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/radvd-project/radvd.git;branch=3Dmaster;tag=3Dv$=
{PV};protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://radvd.init \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://radvd.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://volatiles.03_radvd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://radvd.default \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://radvd.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;af37c5a81d59f3bdc00d83056606ffa1810d4550beed6=
caa4f81181246494220&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/radvd-proj=
ect/radvd/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/radvd-project/radvd/releases</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/v(?P&lt;pver&gt;\d+(\.\d+=
)+)&quot;<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127284): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127284" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127284</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119544056/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119544056/1997914</a><br>
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

--00000000000001ec970653b3dc42--


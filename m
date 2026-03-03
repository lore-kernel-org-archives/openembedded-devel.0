Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD63E67A9E
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 14:58:49 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20382.1772549922936091244
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 06:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ghFT6Q6+;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fc4425b6bso56031067b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 06:58:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772549922; cv=none;
        d=google.com; s=arc-20240605;
        b=UNz+AXMaXHWbTdjWabvShAqX9beeABlHifUwyCzBhQ29g4qfsog1mx+S/EkbRROxoI
         CXXefeNNb6AWISACGacYXE5+RXirEeUJ9hvlVg8C13uvdfWC/cBQnONwDiAcC3FgAd72
         JzVowt9cgbVcVJ/AXNqVjZO6NlkxR/LgWOKIy0BqD3JflDY9pvZCFNAaZr63b1mseWKx
         B3TFS4a1TARYQBWsvsgwsWJi6+Tb/eBTp7i5+HIZT7rE6qLMy8bqzCGIiywjry3C+bC5
         cR6Da/4vzyYTuQqSAWp2XWkMWZ5OHIw3r9af8CG8gnlCbEUYR0S5+gkGfnz9SNs4VJg1
         +QnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H6NBaMdTXBKOU/If+d9YMb8WjZ9WjMo3SAmrNXSKCuA=;
        fh=HR8aXN3wR7wK6RJSuPpBJGM9YVEyZEFvY+/DN5tj4yo=;
        b=bAT2irzlSoQzXOyZnVC8Hqt0EFOUzk/TG+EGPaheoXmN3fIoH3nXPybqSVEiokea5O
         UOvPkXI4gXp3oNKx6uhDLGQfzYdi0gxbyHSE756wh5QJxVP5gqWhjRqJX9DDXo6Dtkck
         gv5bkgqcvxxKmyXGhnjeI/MJS1XSmvyraJC6qShi9w04dD0FbcuD8B4gq4YdNOdWBax1
         5aHSQ+mLMlVbWQ9ZhlFFqYmjYeb9dE4ZYCG4G+KwAOi554yCWy6r+kYmm1SwJRi011SV
         C0E80ig0OMhaG4ELAHFVErYIvCQvSI0mOmRzcNNjJLni9wY+7XX8bB/dnU3RVqqhLsLl
         iO8g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772549922; x=1773154722; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H6NBaMdTXBKOU/If+d9YMb8WjZ9WjMo3SAmrNXSKCuA=;
        b=ghFT6Q6+4St94R3UFe6s/SHq1cBE2gdE6Fc5g55Fi1C688uAV4q61Qz0qHJ5P5m41R
         BZHYdRbc9PlJrTKjpdz0WpYUzovyNvVukQA6pHwjMu4Krd0jHYDAbfGUYY+eqI5otJXQ
         DXesgKYkie5jyb3+rwGaNgLdWPTF8/WFUbh5te+jjRNJ8j/uM5Q7Cj0t4MOTFaGD1DT6
         XEJjJkFNcIVj4YxM7v96m18ZSpQHco8eKkFBBk1LyLKHRqTvOrGTDspwuA+OzhNH+bbD
         /KTdkfUV2UAmKbI9eWxjErwbJJ2FbFFsyl6mpieobMR3C6VDyQH8kTBG4RUQwcR7B2yw
         HcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772549922; x=1773154722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6NBaMdTXBKOU/If+d9YMb8WjZ9WjMo3SAmrNXSKCuA=;
        b=KpqqyOnyOjMxNe2WOoKp53RXr5eN+S0xi8ZaQ5Z88l/z3qQTq4j1APjWCF9Omh7a8x
         /T6qLkNvjHC7bbc1Qff5QdOaT1YGbCuHZys2bgD4D7T/UbzP61fCUHqu9ODPLLwXZrYw
         oAbnE4OG++n9/DT24YaPInFk5RFJ+EEx4CfosoHh1fEyhE5aF3xZPL2rzT05T3nPZ1vD
         B8oiNC8RAwKcg95in75x1HhYBuVB2Xqz3buU0hCtp71u771PtUJejF2/U/AiME10NUXU
         4JkcmdVtJlRoc2un3oiIZHm8Y6scAVLocSY0ujtBlVyS+yVcedfrl4Z5n62WNDe/npKQ
         AmWQ==
X-Gm-Message-State: AOJu0Ywt8iX/WpiB5j3+1mJL4B1wiCfjVftu/H7OXE3enGGQozt+kwnJ
	zCzlQknPWDLk7dRbwieWZRwwypjKQTu26yCQD21TNtXQu2BCMVYQgltXBUJ37obCkqGmIXwtlyB
	LOYQOkwuLkv3D5nqmYq2te2dr8evx1b4=
X-Gm-Gg: ATEYQzwxeqUB5ss6WbbJOkcwdMliDVxfxk6PPcQP8Q7y07L748Ffz4/S1YPBtObGRUn
	LKPJKWSgOl2j0JAYwLctQn9RfdJuA8PqF0ltqzSSJZ5weDkrHv2a5LNEkCtaT85zCXTMsepRZJ/
	SiiaaYJ1RQqQvgW1lxjVvNGuQ/myQzaE0YGrc18Q9DOCtxpnG79VnIWD1YDnwMvUY09GH8Pmu8r
	HRLk5UtrdmqBGOjyNPr7XCk1P0n5IjU115a30sOuW2EPAes61n4C8mDp6AT3AGqK5q7no8E8fOZ
	qMhBzTBSJadGbUd9A5VjBoQaiCWCLGE8VpOq38p/SHwNT4tXIpJwdFQDH3rhC0ai6eRLXabTIt1
	UsFG1rWXk+eQO6Otqj92d+haa
X-Received: by 2002:a53:df50:0:b0:649:ae70:a19 with SMTP id
 956f58d0204a3-64cc2225a7emr10940016d50.55.1772549921865; Tue, 03 Mar 2026
 06:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20260225093727.1284-1-wangmy@fujitsu.com> <20260225093727.1284-21-wangmy@fujitsu.com>
In-Reply-To: <20260225093727.1284-21-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Mar 2026 06:58:14 -0800
X-Gm-Features: AaiRm53vYVwkfTqPd1MSQEvsUVNJWU9uMCCdKGbR98omj3VHCelJIQd-Pv1Izvo
Message-ID: <CAMKF1sqyBvg=6Pf0EPLzR8b=N27Nbry6jduL1t-tHdqAygwp8A@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 21/33] minizip: upgrade 1.3.1 -> 1.3.2
To: wangmy@fujitsu.com, Samuli Piippo <samuli.piippo@qt.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000708404064c1ff0dd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 14:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124833

--000000000000708404064c1ff0dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

qtwebengine fails to build with this version of minizip, I do see meta-qt6
locks its own version but I think it will be good to reconcile the versions
into a single recipe and see if meta-qt6 version can be removed.

On Wed, Feb 25, 2026 at 1:38=E2=80=AFAM wangmy via lists.openembedded.org <=
wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update: "Version 1.1, February 14h, 2010" removed
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../minizip/{minizip_1.3.1.bb =3D> minizip_1.3.2.bb}            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-core/minizip/{minizip_1.3.1.bb =3D> minizip_1.3.2=
.bb}
> (77%)
>
> diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
> b/meta-oe/recipes-core/minizip/minizip_1.3.2.bb
> similarity index 77%
> rename from meta-oe/recipes-core/minizip/minizip_1.3.1.bb
> rename to meta-oe/recipes-core/minizip/minizip_1.3.2.bb
> index 51a74d039b..49e4a4b561 100644
> --- a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
> +++ b/meta-oe/recipes-core/minizip/minizip_1.3.2.bb
> @@ -4,7 +4,7 @@ library which is used by many different programs."
>  HOMEPAGE =3D "http://www.winimage.com/zLibDll/minizip.html"
>  SECTION =3D "libs"
>  LICENSE =3D "Zlib"
> -LIC_FILES_CHKSUM =3D
> "file://zip.h;beginline=3D14;endline=3D30;md5=3D8eaa8535a3a1a2296b303f40f=
75385e7"
> +LIC_FILES_CHKSUM =3D
> "file://zip.h;beginline=3D14;endline=3D30;md5=3Db7d2930a7332b2bc68fc1a7fd=
c5ba775"
>
>  GITHUB_BASE_URI ?=3D "https://github.com/madler/zlib/releases/"
>
> @@ -12,7 +12,7 @@ SRC_URI =3D
> "${GITHUB_BASE_URI}/download/v${PV}/zlib-${PV}.tar.xz"
>
>  S =3D "${UNPACKDIR}/zlib-${PV}/contrib/minizip"
>
> -SRC_URI[sha256sum] =3D
> "38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32"
> +SRC_URI[sha256sum] =3D
> "d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3"
>
>  PACKAGECONFIG ??=3D "demos"
>  PACKAGECONFIG[demos] =3D "--enable-demos=3Dyes,,,"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124633):
> https://lists.openembedded.org/g/openembedded-devel/message/124633
> Mute This Topic: https://lists.openembedded.org/mt/117991965/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000708404064c1ff0dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">qtwebengine fails to build with this version of minizip, I=
 do see meta-qt6 locks its own version but I think it will be good to recon=
cile the versions into a single recipe and see if meta-qt6 version can be r=
emoved.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Feb 25, 2026 at 1:38=E2=80=AFAM wangm=
y via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> =
&lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.=
com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fu=
jitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
License-Update: &quot;Version 1.1, February 14h, 2010&quot; removed<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../minizip/{<a href=3D"http://minizip_1.3.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">minizip_1.3.1.bb</a> =3D&gt; <a href=3D"http://minizip_1.3=
.2.bb" rel=3D"noreferrer" target=3D"_blank">minizip_1.3.2.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-core/minizip/{<a href=3D"http://minizip_1.3.1.=
bb" rel=3D"noreferrer" target=3D"_blank">minizip_1.3.1.bb</a> =3D&gt; <a hr=
ef=3D"http://minizip_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">minizip=
_1.3.2.bb</a>} (77%)<br>
<br>
diff --git a/meta-oe/recipes-core/minizip/<a href=3D"http://minizip_1.3.1.b=
b" rel=3D"noreferrer" target=3D"_blank">minizip_1.3.1.bb</a> b/meta-oe/reci=
pes-core/minizip/<a href=3D"http://minizip_1.3.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">minizip_1.3.2.bb</a><br>
similarity index 77%<br>
rename from meta-oe/recipes-core/minizip/<a href=3D"http://minizip_1.3.1.bb=
" rel=3D"noreferrer" target=3D"_blank">minizip_1.3.1.bb</a><br>
rename to meta-oe/recipes-core/minizip/<a href=3D"http://minizip_1.3.2.bb" =
rel=3D"noreferrer" target=3D"_blank">minizip_1.3.2.bb</a><br>
index 51a74d039b..49e4a4b561 100644<br>
--- a/meta-oe/recipes-core/minizip/<a href=3D"http://minizip_1.3.1.bb" rel=
=3D"noreferrer" target=3D"_blank">minizip_1.3.1.bb</a><br>
+++ b/meta-oe/recipes-core/minizip/<a href=3D"http://minizip_1.3.2.bb" rel=
=3D"noreferrer" target=3D"_blank">minizip_1.3.2.bb</a><br>
@@ -4,7 +4,7 @@ library which is used by many different programs.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.winimage.com/zLibDll/minizip=
.html" rel=3D"noreferrer" target=3D"_blank">http://www.winimage.com/zLibDll=
/minizip.html</a>&quot;<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;Zlib&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://zip.h;beginline=3D14;endline=3D30;md5=3D=
8eaa8535a3a1a2296b303f40f75385e7&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://zip.h;beginline=3D14;endline=3D30;md5=3D=
b7d2930a7332b2bc68fc1a7fdc5ba775&quot;<br>
<br>
=C2=A0GITHUB_BASE_URI ?=3D &quot;<a href=3D"https://github.com/madler/zlib/=
releases/" rel=3D"noreferrer" target=3D"_blank">https://github.com/madler/z=
lib/releases/</a>&quot;<br>
<br>
@@ -12,7 +12,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}/zlib=
-${PV}.tar.xz&quot;<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/zlib-${PV}/contrib/minizip&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;38ef96b8dfe510d42707d9c781877914792541133e187=
0841463bfa73f883e32&quot;<br>
+SRC_URI[sha256sum] =3D &quot;d7a0654783a4da529d1bb793b7ad9c3318020af77667b=
cae35f95d0e42a792f3&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;demos&quot;<br>
=C2=A0PACKAGECONFIG[demos] =3D &quot;--enable-demos=3Dyes,,,&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124633): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124633" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124633</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117991965/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117991965/1997914</a><br>
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

--000000000000708404064c1ff0dd--


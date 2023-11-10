Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BB4C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 13:22:35 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.26855.1699622548599241267
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 05:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TMMHOrY6;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-32f7bd27c2aso1325875f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 05:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699622547; x=1700227347; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ogqw053zMSRyCf5E2XEL41RjayjU9ldcDaM4/f8QZ+4=;
        b=TMMHOrY6OFsQ53jaTtDChfqYKexfqhUICFhopNdaTOu96CRc3k8WTVd+UAVCXXCf4E
         003NHxaHyBYr5cGB0eoWRAMHMcZHc25kwMj/1zF/A0ToCVB1HS3aOPTIShfYv7psn4z3
         iSlkx0CkFG0cYkKOrX2mFWsE6RftpAuv6DiojC+d0HKXxwJg/DXuEkEzuQEhS9mS+ZRC
         CBvcX6JSe0JWrgxOmwBlWe2Rvht33twQz9AORGEQhXSdE9OPmGYH9BWCGa4v/pDmuilv
         58CeGj71F0dW7CLp2LdEpO2f3AcadDTWE5i5FoagUAHAUqdeNNsMRaCdqeygyf0yGtVc
         Hskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699622547; x=1700227347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogqw053zMSRyCf5E2XEL41RjayjU9ldcDaM4/f8QZ+4=;
        b=locnRheN+hKusxBFAVIQFM15Uy1QUwB/QWj06SxQpOpJUbU3DIodB123AyHitiZWnG
         fga7ocufJ/8lC2PSePkw1/TgjEEoXWjbW6XRNAc+j5d9m/jajr6JOBNn2N5yrB9cC/gL
         /OuDjv4DDz79HA1afoZ70dfSOnzqy6AQMXiLotLR+61ESQ2dCLBtD+/ImZUDdb0CN6Jm
         PDpbFDvm3sKau2ZFxsJfZjO6BinwRUxXQDZy+zXZvjoEYCBNv5dGg5SYFslSm7INrLD6
         KNuMehguwpOfzao0g+Lrei2kToWtoXzpvlsj8guRw1DWlEH1tHlDWegy7kpM+e5XmZOm
         Kthg==
X-Gm-Message-State: AOJu0YyIhNYfTSJ4BHbipjMVrWLhWGT5/xK+LiNRaMWTA0/BiE/1gOe5
	QdGnxjShXo23RY8MQeqgTKoy7PTLP92lWhbdfTg=
X-Google-Smtp-Source: AGHT+IEp/gm4yui5Gh6H2ltddyCFs/Og/1zoSvirw9ebqR++TUgKo0lUodbavCT5COIOQtlAgfNFbFFIi8I//Ag17hk=
X-Received: by 2002:a5d:5451:0:b0:32f:8430:3baa with SMTP id
 w17-20020a5d5451000000b0032f84303baamr5944013wrv.28.1699622546612; Fri, 10
 Nov 2023 05:22:26 -0800 (PST)
MIME-Version: 1.0
References: <9B6z.1699621499757734697.wXhd@lists.openembedded.org>
In-Reply-To: <9B6z.1699621499757734697.wXhd@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Nov 2023 14:22:14 +0100
Message-ID: <CA+chaQdP_-pf+TEhZyeabdV4-Q6Qd2t4+aYyL25ZTxvS7h=qNQ@mail.gmail.com>
Subject: Re: [oe] [master][PATCH] SRC_URI master branch is deprecated and main
 is the new master branch
To: ashwin.naik@sasken.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000024a65b0609cc3606"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 13:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106547

--00000000000024a65b0609cc3606
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This surely isn't for master where it was fixed 2 years ago:
https://git.openembedded.org/meta-openembedded/commit/?id=3Deab5e822a91ad95=
cf0e7d2406ba3ab5304748713

If you need this fix in some other branch, then send the cherry-pick of
this with correct e-mail subject indicating the branch.

On Fri, Nov 10, 2023 at 2:05=E2=80=AFPM ashwin.naik via lists.openembedded.=
org
<ashwin.naik=3Dsasken.com@lists.openembedded.org> wrote:

> From 23c3517e62158e390617686abd1a5525d27fa223 Mon Sep 17 00:00:00 2001
> From: "ashwin.naik" <ashwin.naik@sasken.com>
> Date: Fri, 3 Nov 2023 15:24:24 +0530
> Subject: [PATCH] SRC_URI master branch is deprecated and main is the new
>  master branch
>
> Below failure log is observed while using master branch to fetch.
>
> ERROR: googletest-1.10.0-r0 do_fetch: Fetcher failure:
> Unable to find revision 703bd9caab50b139428cea1aaff9974ebee5742e
> in branch master even from upstream
> ERROR: googletest-1.10.0-r0 do_fetch: Bitbake Fetcher Error:
> FetchError('Unable to fetch URL from any source.',
> 'git://github.com/google/googletest.git;branch=3Dmaster;protocol=3Dhttps'=
)
>
> Signed-off-by: ashwin.naik <ashwin.naik@sasken.com>
> ---
>  meta-oe/recipes-test/googletest/googletest_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb
> b/meta-oe/recipes-test/googletest/googletest_git.bb
> index 898f23faf..35fe1bed0 100644
> --- a/meta-oe/recipes-test/googletest/googletest_git.bb
> +++ b/meta-oe/recipes-test/googletest/googletest_git.bb
> @@ -11,7 +11,7 @@ PROVIDES +=3D "gmock gtest"
>
>  S =3D "${WORKDIR}/git"
>  SRCREV =3D "703bd9caab50b139428cea1aaff9974ebee5742e"
> -SRC_URI =3D "git://
> github.com/google/googletest.git;branch=3Dmaster;protocol=3Dhttps"
> +SRC_URI =3D "git://
> github.com/google/googletest.git;branch=3Dmain;protocol=3Dhttps"
>
>  inherit cmake
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106546):
> https://lists.openembedded.org/g/openembedded-devel/message/106546
> Mute This Topic: https://lists.openembedded.org/mt/102505851/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000024a65b0609cc3606
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This surely isn&#39;t for master where it was fixed 2 year=
s ago:<div><a href=3D"https://git.openembedded.org/meta-openembedded/commit=
/?id=3Deab5e822a91ad95cf0e7d2406ba3ab5304748713">https://git.openembedded.o=
rg/meta-openembedded/commit/?id=3Deab5e822a91ad95cf0e7d2406ba3ab5304748713<=
/a><br></div><div><br></div><div>If you need this fix in some other branch,=
 then send the cherry-pick of this with correct e-mail subject indicating t=
he branch.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 10, 2023 at 2:05=E2=80=AFPM ashwin.naik via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ashwi=
n.naik=3D<a href=3D"mailto:sasken.com@lists.openembedded.org">sasken.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div>From 23c3517e62158e390617686abd1a5525d27fa223 Mon =
Sep 17 00:00:00 2001</div>
<div>From: &quot;ashwin.naik&quot; &lt;<a href=3D"mailto:ashwin.naik@sasken=
.com" target=3D"_blank">ashwin.naik@sasken.com</a>&gt;</div>
<div>Date: Fri, 3 Nov 2023 15:24:24 +0530</div>
<div>Subject: [PATCH] SRC_URI master branch is deprecated and main is the n=
ew</div>
<div>=C2=A0master branch</div>
<div>=C2=A0</div>
<div>Below failure log is observed while using master branch to fetch.</div=
>
<div>=C2=A0</div>
<div>ERROR: googletest-1.10.0-r0 do_fetch: Fetcher failure:</div>
<div>Unable to find revision 703bd9caab50b139428cea1aaff9974ebee5742e</div>
<div>in branch master even from upstream</div>
<div>ERROR: googletest-1.10.0-r0 do_fetch: Bitbake Fetcher Error:</div>
<div>FetchError(&#39;Unable to fetch URL from any source.&#39;,</div>
<div>&#39;git://<a href=3D"http://github.com/google/googletest.git;branch=
=3Dmaster;protocol=3Dhttps" target=3D"_blank">github.com/google/googletest.=
git;branch=3Dmaster;protocol=3Dhttps</a>&#39;)</div>
<div>=C2=A0</div>
<div>Signed-off-by: ashwin.naik &lt;<a href=3D"mailto:ashwin.naik@sasken.co=
m" target=3D"_blank">ashwin.naik@sasken.com</a>&gt;</div>
<div>---</div>
<div>=C2=A0meta-oe/recipes-test/googletest/<a href=3D"http://googletest_git=
.bb" target=3D"_blank">googletest_git.bb</a> | 2 +-</div>
<div>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)</div>
<div>=C2=A0</div>
<div>diff --git a/meta-oe/recipes-test/googletest/<a href=3D"http://googlet=
est_git.bb" target=3D"_blank">googletest_git.bb</a> b/meta-oe/recipes-test/=
googletest/<a href=3D"http://googletest_git.bb" target=3D"_blank">googletes=
t_git.bb</a></div>
<div>index 898f23faf..35fe1bed0 100644</div>
<div>--- a/meta-oe/recipes-test/googletest/<a href=3D"http://googletest_git=
.bb" target=3D"_blank">googletest_git.bb</a></div>
<div>+++ b/meta-oe/recipes-test/googletest/<a href=3D"http://googletest_git=
.bb" target=3D"_blank">googletest_git.bb</a></div>
<div>@@ -11,7 +11,7 @@ PROVIDES +=3D &quot;gmock gtest&quot;</div>
<div>=C2=A0</div>
<div>=C2=A0S =3D &quot;${WORKDIR}/git&quot;</div>
<div>=C2=A0SRCREV =3D &quot;703bd9caab50b139428cea1aaff9974ebee5742e&quot;<=
/div>
<div>-SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/googletes=
t.git;branch=3Dmaster;protocol=3Dhttps" target=3D"_blank">github.com/google=
/googletest.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;</div>
<div>+SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/googletes=
t.git;branch=3Dmain;protocol=3Dhttps" target=3D"_blank">github.com/google/g=
oogletest.git;branch=3Dmain;protocol=3Dhttps</a>&quot;</div>
<div>=C2=A0</div>
<div>=C2=A0inherit cmake</div>
<div>=C2=A0</div>
<div>--=C2=A0</div>
<div>2.25.1</div>
<div>=C2=A0</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#106546): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/106546" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/106546</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102505851/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102505851/3617156</a><br>
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

--00000000000024a65b0609cc3606--


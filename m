Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4EEC433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 10:44:33 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.36855.1640688271923766106
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 02:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L1WvcUvF;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id jw3so15601455pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 02:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QpnyMqlI6fdSfSq23fagbb1LDJdo5q74PVWOaqYwYyc=;
        b=L1WvcUvFhqG7rpO/T9URSEjtQ5REmXj+pqyUVAcbqK9uJeX5mpD3uaIhUMyr5h6Lrc
         ng7i/BHnKb1T/cuhSy0NSQLez7ZwYDQZA5H7/KSECHUyb7Cs6OAcCXQJoMUmoxnDU463
         rvjPpFvtPWBOu8sBqrP1GUg1/NZ2mVjP+7RTXob49vFaI/+TPDHZHgKlXIwX83em/bIa
         6l+oxOGTzZjBjCB+qF7Z+HZRtCN0zFRpqXobGS27aSe2z7s5Nk0eyt+jovy2h8EjqvCC
         oHrrGM2o8wNrURNsWjZHGvOg6/BssoHmqPKjcHEpNi+4D5ekFAVAv6PCWStc2L44l/nd
         rBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QpnyMqlI6fdSfSq23fagbb1LDJdo5q74PVWOaqYwYyc=;
        b=qL1Tj+EPC5BgkFj7GbjaPEhl+/SGjEFy2RyRCQ9BP5abMLwyl9AMqNffR+F2trPUU3
         MmViD3suI0783YdFVMUxvLPnkiEH2zhVzNuJv/3Jof/vW6tnnK7IFzKG7CEKHmHmuOsd
         FSj2JOe3EvOLVZ15jo5djsvxTwhNSEXYz4+34MNyRsVkCgSpTinfunePu8km35DFJ5nK
         ZZ+dpjG+psq4MHzIwZdkhaq0TAeCm4u7VUwJ+GBKf6x9JOGE+KHNrbMbDGWIAQZtvk/u
         PDgXGwwImlFwC0b3r640Ww6UHHpzKAROBd9geOxC7gesnDp/3/hGmU28N6q9KkLW9Zo1
         3t9Q==
X-Gm-Message-State: AOAM5314JV5i1zKuzPkFMwhb0GP6uJZI07lFKVzcSFMVAvtlKAAkkRpE
	b87DciuAwYWpQ7SwwRWao039FzVTiNg1qcUABF0=
X-Google-Smtp-Source: 
 ABdhPJwLEa9oTyfeqmuZqfqdLRVTDcW6R5B/ZOKU7sY6tW0dVnu7wVO8+BIHEWN1WQinG57rb2HP8aybU588eYRtqg0=
X-Received: by 2002:a17:902:aa46:b0:149:6c44:ffae with SMTP id
 c6-20020a170902aa4600b001496c44ffaemr14108018plr.163.1640688271047; Tue, 28
 Dec 2021 02:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20211221170500.1151067-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211221170500.1151067-1-open.source@oleksandr-kravchuk.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Dec 2021 11:44:20 +0100
Message-ID: 
 <CA+chaQeFvHEtqYtSUPrB51viCswNHLTsiqKCmLd0O9_Fn=Fm7w@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] simple-mtpfs: update to 0.4.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000953e9f05d43281fe"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 10:44:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94555

--000000000000953e9f05d43281fe
Content-Type: text/plain; charset="UTF-8"

This version fails to build here with:
| ../git/configure: line 3778: syntax error near unexpected token `noext'
| ../git/configure: line 3778: `AX_CXX_COMPILE_STDCXX_17(noext)'

switching back to older version builds fine.

AX_CXX_COMPILE_STDCXX_17 was introduced in
https://github.com/phatina/simple-mtpfs/commit/19e7bb9b608b0c0dce2ee6f56fac75901bc69529#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810

Adding autoconf-archive into the DEPENDS fixes the issue, but still it's
strange that you haven't seen this build failure locally. Can you please
check where AX_CXX_COMPILE_STDCXX_17 macro was defined in your local build?
I'll send the DEPENDS fix.

Regards,

On Tue, Dec 21, 2021 at 6:05 PM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../{simple-mtpfs_git.bb => simple-mtpfs_0.4.0.bb}            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-filesystems/recipes-filesystems/simple-mtpfs/{
> simple-mtpfs_git.bb => simple-mtpfs_0.4.0.bb} (78%)
>
> diff --git a/meta-filesystems/recipes-filesystems/simple-mtpfs/
> simple-mtpfs_git.bb b/meta-filesystems/recipes-filesystems/simple-mtpfs/
> simple-mtpfs_0.4.0.bb
> similarity index 78%
> rename from meta-filesystems/recipes-filesystems/simple-mtpfs/
> simple-mtpfs_git.bb
> rename to meta-filesystems/recipes-filesystems/simple-mtpfs/
> simple-mtpfs_0.4.0.bb
> index 595b34900..dfb748559 100644
> --- a/meta-filesystems/recipes-filesystems/simple-mtpfs/
> simple-mtpfs_git.bb
> +++ b/meta-filesystems/recipes-filesystems/simple-mtpfs/
> simple-mtpfs_0.4.0.bb
> @@ -1,5 +1,6 @@
>  DESCRIPTION = "SIMPLE-MTPFS is a FUSE based filsystem for MTP devices
> connected via USB"
>  HOMEPAGE = "https://github.com/phatina/simple-mtpfs"
> +BUGTRACKER = "19e7bb9b608b0c0dce2ee6f56fac75901bc69529"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
>
> @@ -7,8 +8,7 @@ DEPENDS = "fuse libmtp"
>
>  inherit autotools pkgconfig
>
> -# 0.3.0
>  SRC_URI = "git://
> github.com/phatina/simple-mtpfs.git;protocol=https;branch=master"
> -SRCREV = "c9a691fc52fafaa55d26ac629856153c0514015a"
> +SRCREV = "19e7bb9b608b0c0dce2ee6f56fac75901bc69529"
>
>  S = "${WORKDIR}/git"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94467):
> https://lists.openembedded.org/g/openembedded-devel/message/94467
> Mute This Topic: https://lists.openembedded.org/mt/87881528/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000953e9f05d43281fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This version fails to build here with:</div>| ../git/=
configure: line 3778: syntax error near unexpected token `noext&#39;<br>| .=
./git/configure: line 3778: `AX_CXX_COMPILE_STDCXX_17(noext)&#39;<br><div><=
br></div><div>switching back to older version builds fine.</div><div><br></=
div><div>AX_CXX_COMPILE_STDCXX_17 was introduced in=C2=A0<a href=3D"https:/=
/github.com/phatina/simple-mtpfs/commit/19e7bb9b608b0c0dce2ee6f56fac75901bc=
69529#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810=
">https://github.com/phatina/simple-mtpfs/commit/19e7bb9b608b0c0dce2ee6f56f=
ac75901bc69529#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f=
1d5daa810</a></div><div><br></div><div>Adding autoconf-archive into the DEP=
ENDS fixes the issue, but still it&#39;s strange that you haven&#39;t seen =
this build failure locally. Can you please check where AX_CXX_COMPILE_STDCX=
X_17 macro was defined in your local build? I&#39;ll send the DEPENDS fix.<=
/div><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 21, 2021 at 6:05 PM Olek=
sandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" ta=
rget=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Oleksandr =
Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=
=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://simple-mtpfs_git.bb" rel=3D"noreferrer" target=
=3D"_blank">simple-mtpfs_git.bb</a> =3D&gt; <a href=3D"http://simple-mtpfs_=
0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">simple-mtpfs_0.4.0.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-filesystems/recipes-filesystems/simple-mtpfs/{<a href=3D"=
http://simple-mtpfs_git.bb" rel=3D"noreferrer" target=3D"_blank">simple-mtp=
fs_git.bb</a> =3D&gt; <a href=3D"http://simple-mtpfs_0.4.0.bb" rel=3D"noref=
errer" target=3D"_blank">simple-mtpfs_0.4.0.bb</a>} (78%)<br>
<br>
diff --git a/meta-filesystems/recipes-filesystems/simple-mtpfs/<a href=3D"h=
ttp://simple-mtpfs_git.bb" rel=3D"noreferrer" target=3D"_blank">simple-mtpf=
s_git.bb</a> b/meta-filesystems/recipes-filesystems/simple-mtpfs/<a href=3D=
"http://simple-mtpfs_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">simple-=
mtpfs_0.4.0.bb</a><br>
similarity index 78%<br>
rename from meta-filesystems/recipes-filesystems/simple-mtpfs/<a href=3D"ht=
tp://simple-mtpfs_git.bb" rel=3D"noreferrer" target=3D"_blank">simple-mtpfs=
_git.bb</a><br>
rename to meta-filesystems/recipes-filesystems/simple-mtpfs/<a href=3D"http=
://simple-mtpfs_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">simple-mtpfs=
_0.4.0.bb</a><br>
index 595b34900..dfb748559 100644<br>
--- a/meta-filesystems/recipes-filesystems/simple-mtpfs/<a href=3D"http://s=
imple-mtpfs_git.bb" rel=3D"noreferrer" target=3D"_blank">simple-mtpfs_git.b=
b</a><br>
+++ b/meta-filesystems/recipes-filesystems/simple-mtpfs/<a href=3D"http://s=
imple-mtpfs_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">simple-mtpfs_0.4=
.0.bb</a><br>
@@ -1,5 +1,6 @@<br>
=C2=A0DESCRIPTION =3D &quot;SIMPLE-MTPFS is a FUSE based filsystem for MTP =
devices connected via USB&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/phatina/simple-mtpfs=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/phatina/simple-mt=
pfs</a>&quot;<br>
+BUGTRACKER =3D &quot;19e7bb9b608b0c0dce2ee6f56fac75901bc69529&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D75859989545e37968a99b=
631ef42722e&quot;<br>
<br>
@@ -7,8 +8,7 @@ DEPENDS =3D &quot;fuse libmtp&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
-# 0.3.0<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/phatina/simple-m=
tpfs.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/phatina/simple-mtpfs.git;protocol=3Dhttps;branch=3Dmaster</=
a>&quot;<br>
-SRCREV =3D &quot;c9a691fc52fafaa55d26ac629856153c0514015a&quot;<br>
+SRCREV =3D &quot;19e7bb9b608b0c0dce2ee6f56fac75901bc69529&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#94467): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/94467" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/94467</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87881528/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87881528/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000953e9f05d43281fe--


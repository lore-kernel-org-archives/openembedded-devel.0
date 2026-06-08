Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF35CD8C90
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 01:22:43 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44813.1780881753291322367
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2026 18:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oZBC01xg;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7dc67a5e102so38691817b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 18:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780881752; cv=none;
        d=google.com; s=arc-20240605;
        b=UUieviFbHr197aEyG3xwb81+BMy6AlhyUCOShUKD3w1bLWEoCh7nPiGRzdlUCmPR4N
         +T17NlF/jveaNCyBDNNou+dJm7fjDG0h6cKPKQAyqyw7cHInGJwMwr2bjku9085C1rNj
         WBu/Y8IdmqAHrAh/4o4IdkQU1dSTo8rTPogdwcZeMEK2MMAefva31TrLSQmUiOdYRmNF
         5emeaYQbbfgXt0Ck5MFVqRqELjeeeC8xDUT2fpVB4T4MPoDfQvqhv+/EjOE/lDmNXQ2Z
         4npsZfAsgCGg7pPLpGekvWnuiA2p+A5+wCr8tjw40+R2kcpBeBX2Bo+Bpxasj3TPz7ia
         3AiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MudHzrmh5yvLLD3eq8sdKMWa6wOMCW39BATLp01lryI=;
        fh=t00iliNe9pL0QaiZgATkfZzbJzbg/gzT7cLy1S2kUZs=;
        b=RK+nW1vG8PJHrb9vZPROjhkYnvLiu34R3pPSteLwwFw/F/bhMDx+aGstQOeepC6YW6
         3gDCf1z++15M198nDk5ZFvqx67oSW5JdQS3ebiycBvNX/lWzP1iiljzNEGntJMCMGLKe
         00su47IoarFNIly8BTKhvEl3NpPGFgFpxlqPc3YFYjY9qzpuQAh/4IWzY4t8gAUx3KKx
         rKqGAVp5G3OPr9p7bPG6+K7iy7X7j8LiTy7LCU568Z9aTn+evPwdlfB7ICx+vS+Bf/Uu
         8GU82zL5msRffL/UuDXezL0C1e7QYD9ByxXc8bzrdfuqtCY4d4iLs0cN67OmtQ6b+GWW
         MX5w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780881752; x=1781486552; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MudHzrmh5yvLLD3eq8sdKMWa6wOMCW39BATLp01lryI=;
        b=oZBC01xg//y/eP/9MKfKzUg5FnwcZHa/6G603VkU+YFVAVrCHbSDpU/Lj0p8B0xQR9
         X/Cprw0oaPP1v10RK5UkWSktm1TSYq+T3ye6WDGJISRYZzlEwpeVJbh/pQ+pVzU3IMss
         fJbYZ5VS+bb2rf7V/ecZ8Ut04gWuNU2vZRB6A7IqT2Y8vHa5dEULGFtDAuYLI5MEQ4E/
         N8ku014ATqsRlkE9UB8zLtXGPSKCO24A4Jgv/sye6tzacNv9XLUN13a5rxcm9lW8E119
         rbdHt8rbvJlNwWbni8YIBVYthXcynZAHRsXgyUnpmH+/E0IP0IGCnSvutIEdVC7uVzyd
         fsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780881752; x=1781486552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MudHzrmh5yvLLD3eq8sdKMWa6wOMCW39BATLp01lryI=;
        b=qP81RmxoAcYNB9byYUWYvfMs3cBLUamv59Z1IvXSAIRWRjZWrUgT69oDilMZGpfrCW
         EgJDSwmH7HFR6ntlnzkFHaePsbouQcQj4KqMGnzig6ggqla4+Qubkr4jxpXPjV7j2Rzd
         v+dVHBQdsga9r6w/rNVYXni+NeR8Jn5NPl8nHwIfROeEAOn0Mso3Q9CbCUQdr92IOv5Y
         mScA7rKWQJ7wiX5E+YjAVxUSfVOWsaxa64HE0ah072buDQXgUOYNwcC6YOWnoyYOY7ie
         HlFnIgCalnFpxcKDEtQpbc8erQ9KixMUBDHICG37g4+Cek9hrkqDg08zAiLG8eynrU3m
         OdAw==
X-Gm-Message-State: AOJu0YxgzvWXpvabk9uPZyOoQEx0L7ou6eFXnIjqFZbyZq+C9NTUKcHw
	6TdosF/G+0hl0yHjys/5bHJ4EMCK3RH7FKZgZRtjIZCx+/qCPOABT0rC2W3lRhk1OdPNm/Wpmqq
	gy7MKkEGl/uyyng6omWy3xeQCZLQTWRyvMFsb
X-Gm-Gg: Acq92OFs4Vd+aZ528/3x7Y+vlB4bK6RlCT+MhW2ykB/Hq3zjKSoaLPr6dE8bsc8v2pc
	sB2nyHK4Me/pL+ms0a5kQqVcwX4/tOv3w7Awjxehl7ZjISqf80fa++k/uOPe42xzmaXfjf78t8B
	HAmoDCHcfWP16MFQ1rQljwVHZ9K62D4an1HN6vLonLOiqKoUeAGYTUiLH6bOvsB+F3vxCYsG9NO
	SUARHGvE7043pbE1f/6+YYF8b46pEjAJk6r9a/b3/JkgE6IFHwxc4uTM3XpWQqNF8aNu//oDl5h
	1M2/0PQq2eqUnSOG94BUgKGz5dfxm1TKidrwS/G94jvXDoq/yLLVxDm+ELJlJl1zOuBGK0oZQf2
	vrQsILmfO1rhvTwPNbhjBU09Tp/nmD33+9OmIS8UeeJlawNboIRIMRLke9ZakvOIekNd5UWYsXT
	XP/FOI68jUcvKTU8KQ+56rRjdTnQ==
X-Received: by 2002:a05:690e:4144:b0:660:62e5:9303 with SMTP id
 956f58d0204a3-661070cbcd8mr11486396d50.63.1780881751926; Sun, 07 Jun 2026
 18:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260530115358.3937038-1-filipe.pires@konsulko.com>
In-Reply-To: <20260530115358.3937038-1-filipe.pires@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Jun 2026 18:22:05 -0700
X-Gm-Features: AVVi8Cf-DMgXTfVSZox5SRtHgp6nBNCCWGkLEFmSCTU7saJqSFV6qWvNjd9M9oA
Message-ID: <CAMKF1sodcK=YEiDcC4HoN8HpBBRar=mbMkL_MGzHbgrFjgq_HA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] lftp: upgrade 4.9.2 -> 4.9.3
To: filipe.pires@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000035eacd0653b3d859"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 01:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127416

--00000000000035eacd0653b3d859
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am seeing build failures

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7081084/raw_inlin=
e

On Sat, May 30, 2026 at 4:54=E2=80=AFAM fpires96 via lists.openembedded.org
<filipe.pires=3Dkonsulko.com@lists.openembedded.org> wrote:

> From: Filipe Pires <filipe.pires@konsulko.com>
>
> ---
>  .../recipes-connectivity/lftp/{lftp_4.9.2.bb =3D> lftp_4.9.3.bb} | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/lftp/{lftp_4.9.2.bb =3D>
> lftp_4.9.3.bb} (89%)
>
> diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
> b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
> similarity index 89%
> rename from meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
> rename to meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
> index 927916f985..0b1ce1a376 100644
> --- a/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
> +++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
> @@ -7,8 +7,7 @@ LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>
>  SRC_URI =3D "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "42ec1793c386702bc2734ffbc8a5cff1"
> -SRC_URI[sha256sum] =3D
> "8a07cbf4df09b107fe3fc41d133ee2f6cea6ef4c33ccf06c8448ad058cd96b7e"
> +SRC_URI[sha256sum] =3D
> "adceaef1bd21a38d07c973233fab603813c431f0a8dcbd23239fa9a41ae17b6e"
>
>  inherit autotools gettext pkgconfig
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127297):
> https://lists.openembedded.org/g/openembedded-devel/message/127297
> Mute This Topic: https://lists.openembedded.org/mt/119560865/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000035eacd0653b3d859
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am seeing build failures<div><br></div><div><a href=3D"h=
ttps://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7081084/raw_inline=
">https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7081084/raw_inl=
ine</a></div></div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Sat, May 30, 2026 at 4:54=E2=80=AFAM =
fpires96 via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;filipe.pires=3D<a href=3D"mailto:konsulko.com@lists.openembedded=
.org">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">From: Filipe Pires &lt;<a href=3D"=
mailto:filipe.pires@konsulko.com" target=3D"_blank">filipe.pires@konsulko.c=
om</a>&gt;<br>
<br>
---<br>
=C2=A0.../recipes-connectivity/lftp/{<a href=3D"http://lftp_4.9.2.bb" rel=
=3D"noreferrer" target=3D"_blank">lftp_4.9.2.bb</a> =3D&gt; <a href=3D"http=
://lftp_4.9.3.bb" rel=3D"noreferrer" target=3D"_blank">lftp_4.9.3.bb</a>} |=
 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
=C2=A0rename meta-networking/recipes-connectivity/lftp/{<a href=3D"http://l=
ftp_4.9.2.bb" rel=3D"noreferrer" target=3D"_blank">lftp_4.9.2.bb</a> =3D&gt=
; <a href=3D"http://lftp_4.9.3.bb" rel=3D"noreferrer" target=3D"_blank">lft=
p_4.9.3.bb</a>} (89%)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/lftp/<a href=3D"http://lf=
tp_4.9.2.bb" rel=3D"noreferrer" target=3D"_blank">lftp_4.9.2.bb</a> b/meta-=
networking/recipes-connectivity/lftp/<a href=3D"http://lftp_4.9.3.bb" rel=
=3D"noreferrer" target=3D"_blank">lftp_4.9.3.bb</a><br>
similarity index 89%<br>
rename from meta-networking/recipes-connectivity/lftp/<a href=3D"http://lft=
p_4.9.2.bb" rel=3D"noreferrer" target=3D"_blank">lftp_4.9.2.bb</a><br>
rename to meta-networking/recipes-connectivity/lftp/<a href=3D"http://lftp_=
4.9.3.bb" rel=3D"noreferrer" target=3D"_blank">lftp_4.9.3.bb</a><br>
index 927916f985..0b1ce1a376 100644<br>
--- a/meta-networking/recipes-connectivity/lftp/<a href=3D"http://lftp_4.9.=
2.bb" rel=3D"noreferrer" target=3D"_blank">lftp_4.9.2.bb</a><br>
+++ b/meta-networking/recipes-connectivity/lftp/<a href=3D"http://lftp_4.9.=
3.bb" rel=3D"noreferrer" target=3D"_blank">lftp_4.9.3.bb</a><br>
@@ -7,8 +7,7 @@ LICENSE =3D &quot;GPL-3.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e=
80d47fae504&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://lftp.yar.ru/ftp/lftp-$%7BPV%7D.ta=
r.bz2" rel=3D"noreferrer" target=3D"_blank">http://lftp.yar.ru/ftp/lftp-${P=
V}.tar.bz2</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;42ec1793c386702bc2734ffbc8a5cff1&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8a07cbf4df09b107fe3fc41d133ee2f6cea6ef4c33ccf=
06c8448ad058cd96b7e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;adceaef1bd21a38d07c973233fab603813c431f0a8dcb=
d23239fa9a41ae17b6e&quot;<br>
<br>
=C2=A0inherit autotools gettext pkgconfig<br>
<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127297): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127297" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127297</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119560865/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119560865/1997914</a><br>
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

--00000000000035eacd0653b3d859--


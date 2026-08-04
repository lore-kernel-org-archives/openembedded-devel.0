Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCAAC55182
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 00:34:21 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6939.1785803652932193561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 17:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xp4g84bv;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6611669cd16so5505795d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 17:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785803652; cv=none;
        d=google.com; s=arc-20260327;
        b=ef+THd8h4DBehMXY1+OhIDzXJ6AXALzK9OlB+9bfsPf0r/PBAZKwTqmZl5gab9kdC1
         B4FtuN99dG5K/84dUsv7VswBaurt2cS8xPfs9rlDNr1RtpLMFKniSnz5auGGlJ2lC3xr
         YTBm9Ynr7xC8FRt8+ygAtchiq1LF95oNED3vPWCIqogNvgJOuziKkPLSbPUlPHAIk/Qg
         G/FfW0S1cUSGZAAqkukMddW4uBOZWnoH6aNxkHlBhqguMNYkLzrvnLnptGXqpZp8BYAI
         /RwQtaDVsoB5TJUqCfJGMB5n0ra8xLpQvp8I+bo6KFMa3MJeVUxc3FV0qeIyLPxATISK
         5lYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FQTDI/nzSloXRVGZSR24vD16AnDEHXOXWwKjWMAYd8w=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=Tktb5cnT+Yoc5+V3GE11NSif0DtpjRltbR/EA7rOwXVHRAgkf4dssY5/oWeeDJIxCM
         IZYHCQSv0bsl8QIG5yrz7vOwe/3nHK0MrvZnxNdRJnz3v5NLTiiMX07BT/+rhXgeJl0A
         4YYA2iOwFPwXaIwV4Gzn+6MVike61c73n6QK2VPCaS6gST7RX9TpnlNNXvvTYHRRnRez
         JWaxxo7uMNzhiBOnVBClNIY2ghwrpcmfrc6gFkxpSOdbN2Jbh7lk/ufMiaLqCyqrT5yq
         iKEJzD4TF/gDULwfqQJwy4p/xcz1L+0z0+ztQmqCUIez/kTDJZ7QaewPcPK3bEUiusyE
         u9Ew==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785803652; x=1786408452; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQTDI/nzSloXRVGZSR24vD16AnDEHXOXWwKjWMAYd8w=;
        b=Xp4g84bvGM69L56yjETnEwHkl7S64wi7TevcNU/y6aXAXpkgDI5AaW3qU39I5B8hWR
         fYs2BdaDhN536enGGo6Ls4HFpCCtz2og1OKMo+kuczA/eOhNBDXwizVei4CCVnqwEKDV
         gytYLyAy8bk2PDbzj9NunTL+2RLQ7l3/fQmBn7uEYWwBH5pFGZXw3IREs4/W+Zt4yANT
         4NMCGl+SYgCdKdVAvKGsFi1+JDhPPiqycmpJV39sLKYpgML2K1z/HIGNi/De+9Z3vKTd
         cGOSSdJit/gqueT1qSh7kG+LKeScei9/S2nCDcmXhFvoojPYym5yVJug1416I9G9Y7vu
         rISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785803652; x=1786408452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FQTDI/nzSloXRVGZSR24vD16AnDEHXOXWwKjWMAYd8w=;
        b=AgaC1ny0EklXH1s5tZYA34KKYx0RMqQAkMtiGS0FUcwwmgSBdiPpD7+hBJVCfvS7OW
         vNe8h9FpKYGetLaTyrkgDV+sNDrmfgOfgDZmsbOIhGi1Q42sGFzjPBq54PoaHOLwSwac
         ZJs0dU/hfjYvv3iUz2INH/qCIinwfX8yfITb5YfFWS60HQxV0M66/HwczjT0skjzH0MX
         EsHmaqnMyNHTTP6wdLrOVCu9hEHcQHoxUtMaaTzBCIvfxovLJXPJ1SplcGXkMDkT9Nnr
         ssXNSZ1r7kynLllqCAaK3qbWCPaj+VcLwGKhAaGCwHO6MsMt32ttT2BYhKuOcJnhUgXP
         DwHQ==
X-Gm-Message-State: AOJu0YxoerPosiltbcXe4DoFeH2OIRWo65IIdEvL8DPwSaPUzjrvvrYL
	3wUzRDUOvShopmrziUKrgCXaMF4AlLGoGMMKIG6SwaYSi/ShFW1W76gLSjWoacPmXIBoIvAPVwH
	rwHLc3ZXW/iWuLQdU2/YT28yhxE8zr9ZjSSo3
X-Gm-Gg: AR+sD107ZkRCGpic6lvzDspD9rPFDwfmbMX6PMEOY5QxtknNWzedCMNg+xFNt0HgAWm
	KKrSAIxCbDGC3WCJMLXG4fqXgihoPCIZboUAHA5JA/6pNyvBosjfUqiFAutXE4vbUALY0gtQkrZ
	9XknPSuvCJLNUGD2ZcNkj8iGI65iWrX3E9lHRD3bOYn1RJTp2sZGKgWB3U1udnqXQ47a1Z3kkTT
	/oQclQqB7ucZyV5bSPWykcZaVI57aqpf7EJEQjKetHiA7bNWMbvNJQz9/gkh8L8NZCBhZYb/Q86
	9Z44nLcoUkhNkpqXWG/eOg+BCMtXC6G4SjqgAzsUn9loiuzqgpS7y4eu7ZsbJ8iX+gp+mpsr8Ku
	m2FkTzdF6EZ2+/34OrbFuHteEslKIrDS4k9SzCLTy5siOo0g6WaXAIZdXaepy/Hed6OMVz350iN
	0KlJyOASamEr+37DP0gJVOGKiKelLSukIv2LpjMP3uSE2F
X-Received: by 2002:a53:db0b:0:b0:668:568e:8618 with SMTP id
 956f58d0204a3-6694efde7fdmr11313662d50.1.1785803651929; Mon, 03 Aug 2026
 17:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260804002727.586577-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260804002727.586577-1-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Aug 2026 17:33:45 -0700
X-Gm-Features: AUfX_mynRWEHo2m4mMSD15Q7oILR4O74TtE5DHA8-rI3Q2a_El36fd_9GCBNOGU
Message-ID: <CAMKF1spENpUegEZePkKD75zuvgRrS1VQiNdxeWZwXimjvQZuPA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v2 1/1] gtkwave: upgrade 3.3.127 -> 3.3.128
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004fd8fb06582dd079"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 00:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128702

--0000000000004fd8fb06582dd079
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

please rebase on top of master. I applied v1

On Mon, Aug 3, 2026 at 5:27=E2=80=AFPM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> License-Update: update md5sum as address was replaced with FSF url
>
> Changelog:
> - Hurd compile fix.
> - Update lz4 to 1.10.0.
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../gtkwave/{gtkwave_3.3.127.bb =3D> gtkwave_3.3.128.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.127.bb =3D>
> gtkwave_3.3.128.bb} (89%)
>
> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
> b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
> similarity index 89%
> rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
> rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
> index 774a30e1a4..62ffafe08d 100644
> --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
> @@ -3,10 +3,10 @@ DESCRIPTION =3D "gtkwave is a viewer for VCD (Value Cha=
nge
> Dump) files which are u
>  HOMEPAGE =3D "http://gtkwave.sourceforge.net/"
>
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef427=
22e"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc5b1819073ecce49dec65a690b638=
c48"
>
>  SRC_URI =3D "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
> -SRC_URI[sha256sum] =3D
> "f19da2db43b27bbcc669725843451945a68c3a4ce232562e341d6f63b80b55e4"
> +SRC_URI[sha256sum] =3D
> "817e197fc1808f8aac3543c2c2f9683cb01368c91192b8eae5af58070ef1d1f8"
>  S =3D "${UNPACKDIR}/${BPN}-gtk3-${PV}"
>
>  DEPENDS =3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128701):
> https://lists.openembedded.org/g/openembedded-devel/message/128701
> Mute This Topic: https://lists.openembedded.org/mt/120587319/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004fd8fb06582dd079
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">please rebase on top of master. I applied v1</div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Mon, Aug 3, 2026 at 5:27=E2=80=AFPM Ankur Tyagi via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;ankur.tyagi85=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com=
" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
License-Update: update md5sum as address was replaced with FSF url<br>
<br>
Changelog:<br>
- Hurd compile fix.<br>
- Update lz4 to 1.10.0.<br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../gtkwave/{<a href=3D"http://gtkwave_3.3.127.bb" rel=3D"noreferrer"=
 target=3D"_blank">gtkwave_3.3.127.bb</a> =3D&gt; <a href=3D"http://gtkwave=
_3.3.128.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.128.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-graphics/gtkwave/{<a href=3D"http://gtkwave_3.=
3.127.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb</a> =3D&g=
t; <a href=3D"http://gtkwave_3.3.128.bb" rel=3D"noreferrer" target=3D"_blan=
k">gtkwave_3.3.128.bb</a>} (89%)<br>
<br>
diff --git a/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3=
.127.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb</a> b/meta=
-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.128.bb" rel=3D"n=
oreferrer" target=3D"_blank">gtkwave_3.3.128.bb</a><br>
similarity index 89%<br>
rename from meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.=
127.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb</a><br>
rename to meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.12=
8.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.128.bb</a><br>
index 774a30e1a4..62ffafe08d 100644<br>
--- a/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.127.bb=
" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb</a><br>
+++ b/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.128.bb=
" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.128.bb</a><br>
@@ -3,10 +3,10 @@ DESCRIPTION =3D &quot;gtkwave is a viewer for VCD (Value =
Change Dump) files which are u<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://gtkwave.sourceforge.net/" rel=3D=
"noreferrer" target=3D"_blank">http://gtkwave.sourceforge.net/</a>&quot;<br=
>
<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D75859989545e37968a99b631ef=
42722e&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc5b1819073ecce49dec65a690b=
638c48&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://gtkwave.sourceforge.net/gtkwave-g=
tk3-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://gtkwave.s=
ourceforge.net/gtkwave-gtk3-${PV}.tar.gz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;f19da2db43b27bbcc669725843451945a68c3a4ce2325=
62e341d6f63b80b55e4&quot;<br>
+SRC_URI[sha256sum] =3D &quot;817e197fc1808f8aac3543c2c2f9683cb01368c91192b=
8eae5af58070ef1d1f8&quot;<br>
=C2=A0S =3D &quot;${UNPACKDIR}/${BPN}-gtk3-${PV}&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot; \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128701): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128701" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128701</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120587319/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120587319/1997914</a><br>
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

--0000000000004fd8fb06582dd079--


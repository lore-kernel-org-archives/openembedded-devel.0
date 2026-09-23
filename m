Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDF5C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 03:11:28 +0000 (UTC)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3624.1790133080779342592
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 20:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gY6g3OWZ;
 spf=pass (domain: gmail.com, ip: 74.125.229.204, mailfrom: ticotimo@gmail.com)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso556016e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 20:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790133079; cv=none;
        d=google.com; s=arc-20260327;
        b=gDasI9gPKd7zW4j2eb2PbLqcNxlQC8ueA1dYAiOXn1f8TPN8zwXh5B6/b8XNKipttw
         C6oE5+IM+l+owrg8T2VrYD7/iIwoAx1L5iydQ0oIwFPKwpqosQP3fS1e19AG75qn4HkI
         LIX0r/VDI1Rfe4P2LDyydBm5tGXRdeot+HqccwkiOQp7DRBdEVNqrQsPU4B8fp6DLDSZ
         tmeUuTjSlCezyE4FhPsVZE/rSyGVwRLTUND6dAHeFaGUuVbXb9z+LrGnk2jrZIOaqT+A
         u0Y2PSv7VZNUgrEGOEzFbypI6stTlkAlw6JdD0QgTLWq6Y9rl3wc5lc/YR7D4FWBiWTu
         X/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EjL60SaObStJmcjZly+2ffrJFSGEojxVEUewIZiETzg=;
        fh=oNMxaqRmTMT50+RSmSWZvZdZ+7icpgzxn+z29CbRI/Y=;
        b=lzvtbUE8jHSCITuI+iC+2mgW55Xr2BYty5fsUwsKlqzoJeFtPaXBrwP1idO/TF+EBB
         dBOYwpXULenvdcnZlgECm10Xems88Gbn2P5RRFxj1wgOK3Pezu4jo9O08EoaV/Frmvjz
         yQPeh1b+SxkLwqOdLW2Q4VgSKYStYIr5DEoFiyFoewxQKsyNgHCaXDZA9sstvtj5AxfS
         4YeDcw1X6fQa45apVv6IbpTTYF9FHRi7FpEtYm6to05S3FwxE8P6MTX5JGILtg8rg4kj
         yhSgNd/xf7mcPx2VAYajSZqFmUq9skL06K/WrUtvgIjoumlCp0HbQMMovxg35Okfneba
         P5XA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790133079; x=1790737879; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjL60SaObStJmcjZly+2ffrJFSGEojxVEUewIZiETzg=;
        b=gY6g3OWZNxT0HuOPepFx0/18qcElzwTAOaFfeyrss3mgzKNZT6nmcOLUDZN5Cgpacv
         wYF7nvq2ARzYt2kWRaczYjfI4sHc69ilHSpWV/dCH6G45aYjMrBst/u7W0JDQZZbjWKb
         A+LEXXFM0SlERVmC40VX58UMlmvW5d7QsTQGUxQXj93D2O1KNiNkCtKE79Jw80Y+OLgb
         5bpPURbqmmABr5SNu25pqVeQJaVViaHTwjx6FubHxQeC4ZnuJNlxTz9RDigaZOZZO8S7
         ei1/561/6XOEVxypiJN2KZrWGPj3bhrP7CXdxX68MLwZdTWhPmzhGNF/3FtZTCTM8gDd
         TV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790133079; x=1790737879;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EjL60SaObStJmcjZly+2ffrJFSGEojxVEUewIZiETzg=;
        b=HhJveFBiSRZ1h6wTkGnPCf468+6NBVzSEZQ3yJWlIK8t0R/aE5f8tA9+dTnEKU5cQu
         AfmeytucCmfPQHUpZGstHXKLzyDqf3ehADlY27W8DewemelBPSB3vbGua110ukRxMbQY
         KEUCg44pr4hdDSx9JALGptIHfEPLC7zx1fhFcp1A7oIq4IN8MgejmvRBGFgDsxGyIFYB
         TJE7iYiZ4gtafjQGei64nrcBebseShCphWVbyBTzsqOSPomWUAZNnwMPMYo2XhZFiqbb
         RBoiE23clzxhcZYLtnafz7G4iOEtNH6QQDUD0CJxDhsbP8kMac86WjL8m1DOmzMbv09s
         0NNA==
X-Gm-Message-State: AFuF++nymIry0Hf5FqUbmPid0CEP1S7iYzt2EgGeBtDW5pE/CzxlIsVD
	uMbUoVWg/N7zIdmSNeUnl9qz1o3MEWdpFlRTEixhDSZZcGPXGjiA20v7vnhZdNWzuDuHuGAnZfd
	iIbZeayb7nLrbdLgUqXzfBVt6XDXJwxQ=
X-Gm-Gg: AYBFou2Jq4/00Pw8sZwpybGr45fs7/pcgQfelNzGFY91xe0a0+QhRrEcUUfGg9rGPDE
	MbPlEk4dkbrV+RAClPvUCUN5Z62saXckTxTPDs+Ovy9tw7hcIAvgwCQaSo2jb1Na+j8FcMFhobC
	ssNRrszJJEIdToCKko3IXeSBwZ+y8HGfb5qxL52NdIJ+T21qRZRHOU7Gx8Y1/JuJZKeGAxLw+oT
	qIJ6vCo1Wl8CqdQooxZej+9SioXUPDA0ySdQxrlZFRJQhOaDhJH+inDXbOcqC5iwe8FLenszUoD
	QXYz5Kpqa353iRvlBaKaTijWDbBtb0CR7ZmkjRQaJsNxcY+MUKhC9kv4SDsUll/VLRQQR6wXa+q
	MWN4uZhreebUB
X-Received: by 2002:a05:6512:3b21:b0:5b7:6686:45a9 with SMTP id
 2adb3069b0e04-5b8d89b69fbmr326152e87.37.1790133078174; Tue, 22 Sep 2026
 20:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260923012442.3830864-1-csiltala@atcorp.com>
In-Reply-To: <20260923012442.3830864-1-csiltala@atcorp.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 22 Sep 2026 20:11:05 -0700
X-Gm-Features: AclHuK82DW4bVO398d4BV5vjqhr7r8KWqzrGVNoWv2t0vSz1WZSDnhBgy9EXu10
Message-ID: <CANx9H-DpC+P=Dn+z7dfTpYzerZGbgjZnF-4SuywLt-SzHGtRbw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] bmon: upgrade 4.0 -> 5.0
To: csiltala@atcorp.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000039b11e065c1dd6e4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130178

--00000000000039b11e065c1dd6e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 7:58=E2=80=AFPM Corey Siltala via lists.openembedde=
d.org
<csiltala=3Datcorp.com@lists.openembedded.org> wrote:

> Fixes:
> - out_curses: use xcalloc instead of a fixed buffer
> - Avoid trying to include <values.h> on Android
> - Fix typographical errors
> - curses: Fix seperator lines
> - Fix build in FreeBSD/DragonflyBSD
> - fix segfault on element removal
> - fix: Fix memory leaks in module_set()
> - fix: Convert usage of strdup/free to xstrdup/xfree
> - Fix compile issue in OpenBSD
> - Fix spelling and grammar in docs and comments
>
> Features:
> - Allow numeric colors in bmonrc
> - curses: Add CTRL-N/CTRL-P for next/previous element
> - feat: Add IPv4/IPv6 addresses to additional info
> - feat: Add configure option to disable IPv6 in netlink module
> - feat: Add ability to toggle TC elements
> - curses: render graphs with Braille cells
> - display filters for TC ingress and egress
> - Add support for JSON output
> - Remove the 'Really quit' dialog and just exit cleanly
>
> Misc:
> - Update to autoconf of the common era
>
> See full release notes at
> https://github.com/Jafaral/bmon/releases/tag/v5.0
>

It would nice to explain why the git repo changed. There is no mention
anywhere that I can find.

>
> Signed-off-by: Corey Siltala <csiltala@atcorp.com>
> ---
>  .../recipes-support/bmon/{bmon_4.0.bb =3D> bmon_5.0.bb}        | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-support/bmon/{bmon_4.0.bb =3D> bmon_5.0.b=
b}
> (56%)
>
> diff --git a/meta-networking/recipes-support/bmon/bmon_4.0.bb
> b/meta-networking/recipes-support/bmon/bmon_5.0.bb
> similarity index 56%
> rename from meta-networking/recipes-support/bmon/bmon_4.0.bb
> rename to meta-networking/recipes-support/bmon/bmon_5.0.bb
> index f47069471a..0ceff05984 100644
> --- a/meta-networking/recipes-support/bmon/bmon_4.0.bb
> +++ b/meta-networking/recipes-support/bmon/bmon_5.0.bb
> @@ -1,11 +1,10 @@
>  DESCRIPTION =3D "Portable Bandwidth Monitor and rate estimator"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"
> -# only works with libnl-0.5.0
>  DEPENDS =3D "libnl libconfuse ncurses"
>
> -SRCREV =3D "1b3f11bde315e221474f7d066ce4efb4ff4d39e3"
> -SRC_URI =3D "git://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=3D=
https"
> +SRC_URI =3D "
> https://github.com/Jafaral/${BPN}/releases/download/v${PV}/${BPN}-${PV}.t=
ar.gz
> "
> +SRC_URI[sha256sum] =3D
> "6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8a555459ad73c0"
>
>  inherit autotools pkgconfig
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130177):
> https://lists.openembedded.org/g/openembedded-devel/message/130177
> Mute This Topic: https://lists.openembedded.org/mt/121387285/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000039b11e065c1dd6e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 22, 2026 at 7:58=E2=80=AFPM=
 Corey Siltala via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;csiltala=3D<a href=3D"mailto:atcorp.com@lists.openembedded=
.org">atcorp.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Fixes:<br>
- out_curses: use xcalloc instead of a fixed buffer<br>
- Avoid trying to include &lt;values.h&gt; on Android<br>
- Fix typographical errors<br>
- curses: Fix seperator lines<br>
- Fix build in FreeBSD/DragonflyBSD<br>
- fix segfault on element removal<br>
- fix: Fix memory leaks in module_set()<br>
- fix: Convert usage of strdup/free to xstrdup/xfree<br>
- Fix compile issue in OpenBSD<br>
- Fix spelling and grammar in docs and comments<br>
<br>
Features:<br>
- Allow numeric colors in bmonrc<br>
- curses: Add CTRL-N/CTRL-P for next/previous element<br>
- feat: Add IPv4/IPv6 addresses to additional info<br>
- feat: Add configure option to disable IPv6 in netlink module<br>
- feat: Add ability to toggle TC elements<br>
- curses: render graphs with Braille cells<br>
- display filters for TC ingress and egress<br>
- Add support for JSON output<br>
- Remove the &#39;Really quit&#39; dialog and just exit cleanly<br>
<br>
Misc:<br>
- Update to autoconf of the common era<br>
<br>
See full release notes at <a href=3D"https://github.com/Jafaral/bmon/releas=
es/tag/v5.0" rel=3D"noreferrer" target=3D"_blank">https://github.com/Jafara=
l/bmon/releases/tag/v5.0</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It would nice to=
 explain why the git repo changed. There is no mention anywhere that I can =
find.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Signed-off-by: Corey Siltala &lt;<a href=3D"mailto:csiltala@atcorp.com" tar=
get=3D"_blank">csiltala@atcorp.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/bmon/{<a href=3D"http://bmon_4.0.bb" rel=3D"noref=
errer" target=3D"_blank">bmon_4.0.bb</a> =3D&gt; <a href=3D"http://bmon_5.0=
.bb" rel=3D"noreferrer" target=3D"_blank">bmon_5.0.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-networking/recipes-support/bmon/{<a href=3D"http://bmon_4=
.0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a> =3D&gt; <a href=
=3D"http://bmon_5.0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_5.0.bb</a=
>} (56%)<br>
<br>
diff --git a/meta-networking/recipes-support/bmon/<a href=3D"http://bmon_4.=
0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a> b/meta-networkin=
g/recipes-support/bmon/<a href=3D"http://bmon_5.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">bmon_5.0.bb</a><br>
similarity index 56%<br>
rename from meta-networking/recipes-support/bmon/<a href=3D"http://bmon_4.0=
.bb" rel=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a><br>
rename to meta-networking/recipes-support/bmon/<a href=3D"http://bmon_5.0.b=
b" rel=3D"noreferrer" target=3D"_blank">bmon_5.0.bb</a><br>
index f47069471a..0ceff05984 100644<br>
--- a/meta-networking/recipes-support/bmon/<a href=3D"http://bmon_4.0.bb" r=
el=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a><br>
+++ b/meta-networking/recipes-support/bmon/<a href=3D"http://bmon_5.0.bb" r=
el=3D"noreferrer" target=3D"_blank">bmon_5.0.bb</a><br>
@@ -1,11 +1,10 @@<br>
=C2=A0DESCRIPTION =3D &quot;Portable Bandwidth Monitor and rate estimator&q=
uot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/MIT;md5=3D083=
5ade698e0bcf8506ecda2f7b4f302&quot;<br>
-# only works with libnl-0.5.0<br>
=C2=A0DEPENDS =3D &quot;libnl libconfuse ncurses&quot;<br>
<br>
-SRCREV =3D &quot;1b3f11bde315e221474f7d066ce4efb4ff4d39e3&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/tgraf/bmon.git;branch=
=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com=
/tgraf/bmon.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/Jafaral/$%7BBPN%7D/release=
s/download/v$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/Jafaral/${BPN}/releases/download/v${PV}/${B=
PN}-${PV}.tar.gz</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6016e41fdda9166b86b09a0ac601a0c453c3b35acdf90=
4c97a8a555459ad73c0&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130177): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130177" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130177</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121387285/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/121387285/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000039b11e065c1dd6e4--


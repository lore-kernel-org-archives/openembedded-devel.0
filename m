Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9C8C05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 22:37:17 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.1246.1676673427341103060
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 14:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pkwp8/cT;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id n3so2221870wri.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 14:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hKHcLalqLBLjSz616gMgl7O1U0lM1TxX6zcVsUTt6tM=;
        b=Pkwp8/cTklHY2QtK2yqkFn6Lc+vdtwAKWlXBTbDgMLfIsJDbB7MLgyBeUABEw9Jio4
         LLE8Md9obsw1SjRhZYpvsrXSaHpK7iSshTsrzuILguqY6HoyB321ms9GalNWlk5/FXIu
         nyY1qAZfpNuED1mc/EJv5FwaqWkEdDMNXPqUvMUufJ8526xxJVyjNNSxg8B2fL5D0Dqp
         XGoxbuF1ksLI+AVPvyuPzi3eipay4UlP0CF8KWdU18AhcbzfjtctiJIxYAySpV4ejCzI
         O1PdFarlF/UTnYHLJd3iNdk9ikXQ/rIoJySSUg2lDwIhJMWRqFUnmOcIC5K0NwTASHF6
         QzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKHcLalqLBLjSz616gMgl7O1U0lM1TxX6zcVsUTt6tM=;
        b=kssOrVYBpZ/lAI2NBSCnQafK1xK0JgquODxM7t9+S9MqooWYxWAFMEJ5XUAup2OEaA
         yPbtfxIj+Htbsdyk44mF6TnbWUDkTw8ekiwWNy+OoSg+9W6LFjbc2ao0gC0lS6WHifUB
         GTU73uG9f2ZaogCfUt6cnKa/lZXtV/pfzskieVZKbN9IRkc4GjJbgY50Bg5Rjzj0ClSq
         waN+p16906WZY2MhiIqO3gha//cS7h5aKlHPCrSMlG2hOYcwMHTVQeTJible5LFa8kjR
         hUPfyCZyOm4IzBxFTNKHmUMExP7Tx4iqM8D1Gptex7zgDWtolBZYh9W1Kv6RfMf1K62D
         wvPQ==
X-Gm-Message-State: AO0yUKX9oIsdITWDgsa3JqVqqxaDYu/7y+tY56rJl0aU3g5pufn9sTTh
	xiuV1dcZcJ+EpCttZ1OtTnDI4UAAho8v+mvp682lakGc
X-Google-Smtp-Source: AK7set/WhLEfrWl9hickibHus0Pz+oJ7ZNI4B2UHhqskgcAB4faW98R56trlGAI/Oy+JZm8NYTb42kvOx+WN9bSYm2Q=
X-Received: by 2002:adf:ef87:0:b0:2c3:ebf5:97df with SMTP id
 d7-20020adfef87000000b002c3ebf597dfmr73553wro.72.1676673425452; Fri, 17 Feb
 2023 14:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20230217223112.550946-1-joe.slater@windriver.com>
In-Reply-To: <20230217223112.550946-1-joe.slater@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 Feb 2023 23:36:50 +0100
Message-ID: <CA+chaQc=HmZ9H1Gq=qao518H+8VB0udS9mssFG6e_9JP6QfArA@mail.gmail.com>
Subject: Re: [oe] [oe-core][PATCH 1/2] Revert "tar: Fix CVE-2022-48303"
To: Joe Slater <joe.slater@windriver.com>
Cc: openembedded-devel@lists.openembedded.org, randy.macleod@windriver.com, 
	rodolfo.zumbado@windriver.com
Content-Type: multipart/alternative; boundary="000000000000edb3c605f4ecf349"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 22:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101126

--000000000000edb3c605f4ecf349
Content-Type: text/plain; charset="UTF-8"

Why did you send it as revert and re-apply instead of just updating the
.patch file? It would be much easier to review and to see what really
changed.

On Fri, Feb 17, 2023 at 11:31 PM Joe Slater <joe.slater@windriver.com>
wrote:

> This reverts commit 4573a584397f197fbc9170abec3c590ea36667f7.
>
> A fix is available from gnu.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../tar/files/CVE-2022-48303.patch            | 36 -------------------
>  meta/recipes-extended/tar/tar_1.34.bb         |  4 +--
>  2 files changed, 1 insertion(+), 39 deletions(-)
>  delete mode 100644 meta/recipes-extended/tar/files/CVE-2022-48303.patch
>
> diff --git a/meta/recipes-extended/tar/files/CVE-2022-48303.patch
> b/meta/recipes-extended/tar/files/CVE-2022-48303.patch
> deleted file mode 100644
> index a8e9f4ac7d..0000000000
> --- a/meta/recipes-extended/tar/files/CVE-2022-48303.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 1d530107a24d71e798727d7f0afa0833473d1074 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Matej=20Mu=C5=BEila?= <mmuzila@gmail.com>
> -Date: Wed, 11 Jan 2023 08:55:58 +0100
> -Subject: [PATCH] Fix savannah bug #62387
> -
> -* src/list.c (from_header): Check for the end of field after leading byte
> -  (0x80 or 0xff) of base-256 encoded header value
> -
> -Upstream-Status: Backport
> -[https://savannah.gnu.org/patch/download.php?file_id=54212]
> -CVE: CVE-2022-48303
> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ----
> - src/list.c | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/src/list.c b/src/list.c
> -index 9fafc425..bf41b581 100644
> ---- a/src/list.c
> -+++ b/src/list.c
> -@@ -895,6 +895,12 @@ from_header (char const *where0, size_t digs, char
> const *type,
> -                          << (CHAR_BIT * sizeof (uintmax_t)
> -                              - LG_256 - (LG_256 - 2)));
> -       value = (*where++ & ((1 << (LG_256 - 2)) - 1)) - signbit;
> -+      if (where == lim)
> -+        {
> -+          if (type && !silent)
> -+            ERROR ((0, 0, _("Archive base-256 value is invalid")));
> -+          return -1;
> -+        }
> -       for (;;)
> -       {
> -         value = (value << LG_256) + (unsigned char) *where++;
> ---
> -2.38.1
> -
> diff --git a/meta/recipes-extended/tar/tar_1.34.bb
> b/meta/recipes-extended/tar/tar_1.34.bb
> index 22c04ba70a..7307cd57a2 100644
> --- a/meta/recipes-extended/tar/tar_1.34.bb
> +++ b/meta/recipes-extended/tar/tar_1.34.bb
> @@ -6,9 +6,7 @@ SECTION = "base"
>  LICENSE = "GPL-3.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
> -           file://CVE-2022-48303.patch \
> -           "
> +SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
>
>  SRC_URI[sha256sum] =
> "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101124):
> https://lists.openembedded.org/g/openembedded-devel/message/101124
> Mute This Topic: https://lists.openembedded.org/mt/97039915/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000edb3c605f4ecf349
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why did you send it as revert and re-apply instead of just=
 updating the .patch file? It would be much easier to review and to see wha=
t really changed.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Feb 17, 2023 at 11:31 PM Joe Slater &lt;<a href=3D=
"mailto:joe.slater@windriver.com">joe.slater@windriver.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">This reverts comm=
it 4573a584397f197fbc9170abec3c590ea36667f7.<br>
<br>
A fix is available from gnu.<br>
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" t=
arget=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../tar/files/CVE-2022-48303.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 36 -------------------<br>
=C2=A0meta/recipes-extended/tar/<a href=3D"http://tar_1.34.bb" rel=3D"noref=
errer" target=3D"_blank">tar_1.34.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 +--<br>
=C2=A02 files changed, 1 insertion(+), 39 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/tar/files/CVE-2022-48303.pat=
ch<br>
<br>
diff --git a/meta/recipes-extended/tar/files/CVE-2022-48303.patch b/meta/re=
cipes-extended/tar/files/CVE-2022-48303.patch<br>
deleted file mode 100644<br>
index a8e9f4ac7d..0000000000<br>
--- a/meta/recipes-extended/tar/files/CVE-2022-48303.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 1d530107a24d71e798727d7f0afa0833473d1074 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Matej=3D20Mu=3DC5=3DBEila?=3D &lt;<a href=3D"mailto:mmuz=
ila@gmail.com" target=3D"_blank">mmuzila@gmail.com</a>&gt;<br>
-Date: Wed, 11 Jan 2023 08:55:58 +0100<br>
-Subject: [PATCH] Fix savannah bug #62387<br>
-<br>
-* src/list.c (from_header): Check for the end of field after leading byte<=
br>
-=C2=A0 (0x80 or 0xff) of base-256 encoded header value<br>
-<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://savannah.gnu.org/patch/download.php?file_id=3D54212" r=
el=3D"noreferrer" target=3D"_blank">https://savannah.gnu.org/patch/download=
.php?file_id=3D54212</a>]<br>
-CVE: CVE-2022-48303<br>
-Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@intel.com=
" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
----<br>
- src/list.c | 6 ++++++<br>
- 1 file changed, 6 insertions(+)<br>
-<br>
-diff --git a/src/list.c b/src/list.c<br>
-index 9fafc425..bf41b581 100644<br>
---- a/src/list.c<br>
-+++ b/src/list.c<br>
-@@ -895,6 +895,12 @@ from_header (char const *where0, size_t digs, char co=
nst *type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &lt;&lt; (CHAR_BIT * sizeof (uintmax_t)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - LG_256 - (LG_256 - 2)));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D (*where++ &amp; ((1 &lt;&lt; (LG_256 =
- 2)) - 1)) - signbit;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (where =3D=3D lim)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (type &amp;&amp; !silent)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR ((0, 0, _(&quot;Archive b=
ase-256 value is invalid&quot;)));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (;;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D (value &lt;&lt; LG_256) + (uns=
igned char) *where++;<br>
--- <br>
-2.38.1<br>
-<br>
diff --git a/meta/recipes-extended/tar/<a href=3D"http://tar_1.34.bb" rel=
=3D"noreferrer" target=3D"_blank">tar_1.34.bb</a> b/meta/recipes-extended/t=
ar/<a href=3D"http://tar_1.34.bb" rel=3D"noreferrer" target=3D"_blank">tar_=
1.34.bb</a><br>
index 22c04ba70a..7307cd57a2 100644<br>
--- a/meta/recipes-extended/tar/<a href=3D"http://tar_1.34.bb" rel=3D"noref=
errer" target=3D"_blank">tar_1.34.bb</a><br>
+++ b/meta/recipes-extended/tar/<a href=3D"http://tar_1.34.bb" rel=3D"noref=
errer" target=3D"_blank">tar_1.34.bb</a><br>
@@ -6,9 +6,7 @@ SECTION =3D &quot;base&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-3.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e=
80d47fae504&quot;<br>
<br>
-SRC_URI =3D &quot;${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-48303.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRC_URI =3D &quot;${GNU_MIRROR}/tar/tar-${PV}.tar.bz2&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b44cc67f8a1f6b0250b7c860e952b37e8ed932a9=
0bd9b1862a511079255646ff&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101124): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101124" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101124</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97039915/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97039915/3617156</a><br>
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

--000000000000edb3c605f4ecf349--


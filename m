Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A366DC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 22:39:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.1315.1676673571651827810
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 14:39:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Al0+rHWn;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 4-20020a05600c22c400b003dc4fd6e61dso2079147wmg.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 14:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BtQ2CZ2uM+dIAMYRyYTSqKg6W2FjFcy4HACSDZNv8As=;
        b=Al0+rHWn5sU03twk2csn+eCoOcJ7F6PoRa7f8V5XsXhyr4U0IsPgZMUeDlfTuZy22y
         5UMk4L2xHljNS6I3I7+E8GVD6rFx1TqShmoPLn4weHWMMU9xDOWrVeqIKn/H7p7cr830
         wQV2SVk7Jq5ZrJxfWrYdwX4R3Ol7O4DKZ4QwPSKTOhkYht2WwNcDPiavJiN25+SZ1YKY
         OI45ud4kZCpk1jgSOHL+Vqkr9+cpfO0k2TMl6q3/CalgHTfkaYLhtrZ0jNySzS6s33PQ
         XWx9h0FiZ74XKuXbXjVU9aYgowKjDWhSoN4P3OTYiPx0YWMgB/jrkRqETmqSVxnwuEpT
         myXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtQ2CZ2uM+dIAMYRyYTSqKg6W2FjFcy4HACSDZNv8As=;
        b=Cyt1OEbP8aqBL3s1AJicfEMLyqkAOs0L0xCm8rFvRai51aYUOJ7l8c+jQbNTRx35sB
         vLiWn2WerqJjiTEM0nsTLxuoR2qYY3jxyGFsVxUfV8obeKiOnj+6KCEVaUJAkHmx0A8L
         kb8jANu4+bgfK0vP92EOpFxoeKUAAtihphUqJEhCWWL+y1Fg9HxHIENGMR17q41IOhMa
         T72a8h6glN18NdweaYePK5AUidIA0Ow5B1N9pgRp4Ol6KZYoS/KkbjAYEjmAYSDGzVAE
         LKWdBL0NZ4QjKZiMyr20PTVBXt2cfCue2+4m/IF8oFcZCASHO7kzrvE/9D6b/XFVVb6r
         rnjA==
X-Gm-Message-State: AO0yUKVuFD7yK8AIIhsrh1qifN6+yiJLpIY4MfR0YwqiXZMNVTpywiGJ
	Fdrn2toui7NReajN/KcD1cCj47qWcBJJfPYAp9E=
X-Google-Smtp-Source: AK7set++OYMlf7lordxUrYtZ79I6z+1pudoFYC4VDJE466Nq67CTSdxx7NthRDhdvRcz4zlURmBiaTD3xLIanOKMvTc=
X-Received: by 2002:a05:600c:4f81:b0:3df:e60d:c374 with SMTP id
 n1-20020a05600c4f8100b003dfe60dc374mr610965wmq.52.1676673569986; Fri, 17 Feb
 2023 14:39:29 -0800 (PST)
MIME-Version: 1.0
References: <20230217223112.550946-1-joe.slater@windriver.com> <1744BD99605165B0.28389@lists.openembedded.org>
In-Reply-To: <1744BD99605165B0.28389@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 Feb 2023 23:39:15 +0100
Message-ID: <CA+chaQf6vTSN1d8UKLUrhkoat9U9fCprzBac0VSS_AucPx=MuA@mail.gmail.com>
Subject: Re: [oe] [oe-core][PATCH 1/2] Revert "tar: Fix CVE-2022-48303"
To: Martin.Jansa@gmail.com
Cc: Joe Slater <joe.slater@windriver.com>, openembedded-devel@lists.openembedded.org, 
	randy.macleod@windriver.com, rodolfo.zumbado@windriver.com
Content-Type: multipart/alternative; boundary="0000000000008b1cac05f4ecfca3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 22:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101127

--0000000000008b1cac05f4ecfca3
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 17, 2023 at 11:37 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> Why did you send it as revert and re-apply instead of just updating the
> .patch file? It would be much easier to review and to see what really
> changed.
>

And it's also no wrong ML, so you can try again with oe-core ML.

Hint:
openembedded-core $ git config sendemail.to
openembedded-core@lists.openembedded.org

meta-openembedded $ git config sendemail.to
openembedded-devel@lists.openembedded.org


On Fri, Feb 17, 2023 at 11:31 PM Joe Slater <joe.slater@windriver.com>
> wrote:
>
>> This reverts commit 4573a584397f197fbc9170abec3c590ea36667f7.
>>
>> A fix is available from gnu.
>>
>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> ---
>>  .../tar/files/CVE-2022-48303.patch            | 36 -------------------
>>  meta/recipes-extended/tar/tar_1.34.bb         |  4 +--
>>  2 files changed, 1 insertion(+), 39 deletions(-)
>>  delete mode 100644 meta/recipes-extended/tar/files/CVE-2022-48303.patch
>>
>> diff --git a/meta/recipes-extended/tar/files/CVE-2022-48303.patch
>> b/meta/recipes-extended/tar/files/CVE-2022-48303.patch
>> deleted file mode 100644
>> index a8e9f4ac7d..0000000000
>> --- a/meta/recipes-extended/tar/files/CVE-2022-48303.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -From 1d530107a24d71e798727d7f0afa0833473d1074 Mon Sep 17 00:00:00 2001
>> -From: =?UTF-8?q?Matej=20Mu=C5=BEila?= <mmuzila@gmail.com>
>> -Date: Wed, 11 Jan 2023 08:55:58 +0100
>> -Subject: [PATCH] Fix savannah bug #62387
>> -
>> -* src/list.c (from_header): Check for the end of field after leading byte
>> -  (0x80 or 0xff) of base-256 encoded header value
>> -
>> -Upstream-Status: Backport
>> -[https://savannah.gnu.org/patch/download.php?file_id=54212]
>> -CVE: CVE-2022-48303
>> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
>> ----
>> - src/list.c | 6 ++++++
>> - 1 file changed, 6 insertions(+)
>> -
>> -diff --git a/src/list.c b/src/list.c
>> -index 9fafc425..bf41b581 100644
>> ---- a/src/list.c
>> -+++ b/src/list.c
>> -@@ -895,6 +895,12 @@ from_header (char const *where0, size_t digs, char
>> const *type,
>> -                          << (CHAR_BIT * sizeof (uintmax_t)
>> -                              - LG_256 - (LG_256 - 2)));
>> -       value = (*where++ & ((1 << (LG_256 - 2)) - 1)) - signbit;
>> -+      if (where == lim)
>> -+        {
>> -+          if (type && !silent)
>> -+            ERROR ((0, 0, _("Archive base-256 value is invalid")));
>> -+          return -1;
>> -+        }
>> -       for (;;)
>> -       {
>> -         value = (value << LG_256) + (unsigned char) *where++;
>> ---
>> -2.38.1
>> -
>> diff --git a/meta/recipes-extended/tar/tar_1.34.bb
>> b/meta/recipes-extended/tar/tar_1.34.bb
>> index 22c04ba70a..7307cd57a2 100644
>> --- a/meta/recipes-extended/tar/tar_1.34.bb
>> +++ b/meta/recipes-extended/tar/tar_1.34.bb
>> @@ -6,9 +6,7 @@ SECTION = "base"
>>  LICENSE = "GPL-3.0-only"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>
>> -SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
>> -           file://CVE-2022-48303.patch \
>> -           "
>> +SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
>>
>>  SRC_URI[sha256sum] =
>> "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
>>
>> --
>> 2.25.1
>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101126):
> https://lists.openembedded.org/g/openembedded-devel/message/101126
> Mute This Topic: https://lists.openembedded.org/mt/97039915/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008b1cac05f4ecfca3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Feb 17, 2023 at 11:37 PM Martin J=
ansa via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">g=
mail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
Why did you send it as revert and re-apply instead of just updating the .pa=
tch file? It would be much easier to review and to see what really changed.=
</div></blockquote><div><br></div><div>And it&#39;s also no wrong ML, so yo=
u can try again with oe-core ML.</div><div><br></div><div>Hint:</div><div>o=
penembedded-core $ git config <a href=3D"http://sendemail.to">sendemail.to<=
/a></div><a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.openembedded.org</a><br><br>meta-openembedded $ git confi=
g <a href=3D"http://sendemail.to">sendemail.to</a><br><a href=3D"mailto:ope=
nembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedd=
ed.org</a></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_qu=
ote"><br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Feb 17, 2023 at 11:31 PM Joe Slater &lt;<a href=3D"mailto:jo=
e.slater@windriver.com" target=3D"_blank">joe.slater@windriver.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This reve=
rts commit 4573a584397f197fbc9170abec3c590ea36667f7.<br>
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
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101126): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101126" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101126</a><br>
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
</blockquote></div></div>

--0000000000008b1cac05f4ecfca3--


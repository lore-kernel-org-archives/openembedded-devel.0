Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29674C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 09:37:06 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.4275.1722850619086150643
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Aug 2024 02:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I+6SIBx1;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-49291b02e20so2766905137.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722850618; x=1723455418; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S8zz83uV1XeJbKLjwAzOiujttVjZyVKRYep/v88YKkY=;
        b=I+6SIBx1dHmvcPDpA8NgjRliim79qqjxSskEwfw9OgD3Of3JS1hShkY31Q9qfgXgeA
         uWT29HeoR6J0vyOw4YRGEhXe9EutKnV49KFEIpFGAIwL8AIA5QrrPZnPJ+3Io+V7Ie4Q
         kknMCDaQiVa9RJm9XYaz2895HTrmoRbjr+1kF7zkshjruOm0o+CUXEHKrVFNOtLanUs/
         JxHeH1Vf1nDeL0KERfe9/xCI/ubM6hWL8VJ0+V8vrR+9KlsZp2J/Rf9RI8zha/AEayo9
         OG35+9LpN8WQ9MfH8rYXDb3t1aFICCq4J+wPM6qWutwx/yLioCtDNVVJn0idxyeqPEd0
         6a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722850618; x=1723455418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8zz83uV1XeJbKLjwAzOiujttVjZyVKRYep/v88YKkY=;
        b=i7eI8L4pSTsuQdg7sQDOCZyGAGbS4EwXpQ3wSkinZ1ke9iPpDvvWj90/3/7O+cubqP
         rXf3IZtESwFYGb3MPxLdVZp8QlkEwSQ8P2eUBvNj9HFxopxIKRKCCFqpQEk07DaGdDHj
         PPefH1LaOY/g2sbkiHfnPeU4vFpXxwgIuNoNAlr7NS2y5zbZ44H1F2VAxRFgN/41NyLg
         t2p/w380VC/ZrnPsSy2fxy92nm9XG2O89bEJNV8iTHxDgF5RwgaCfY1bMhAVQdQm/utq
         dxENTxIc+zNKseusxAv/Jq8NpK4uxerg0N6G1QT4cWdJdJBLtYNq5HHxZ+UcwvXlYamB
         ooKA==
X-Gm-Message-State: AOJu0Yz2j0l+g4EiHb5tGtJ4DN6WYfPPYai8Kltmyc05hB45Sj5LkhBm
	TMZoAcqp3ofKAGwV/HsNBi9mvn8mdUhcEk5O3yxdDqvQMWt0nHEZUsv2UI+/dh3mbWXjv/CP7QQ
	bI12buYZhJa/GDpfQgP9sGNx3/Ws=
X-Google-Smtp-Source: AGHT+IExmRFXoQv3zbyW4rs2e6XxMfndKRIiKGHcTVzDQcaFMUAyHAHZsDeia8+291/voBh9avpsekWqnv3vKB4KIjU=
X-Received: by 2002:a05:6102:c13:b0:48f:df86:dba with SMTP id
 ada2fe7eead31-4945bdc47f7mr15213086137.5.1722850617949; Mon, 05 Aug 2024
 02:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240729170910.2670446-1-jose.quaresma@foundries.io>
 <20240729170910.2670446-2-jose.quaresma@foundries.io> <9cee10e7-5443-4a9f-b491-71209ae168e5@gmail.com>
In-Reply-To: <9cee10e7-5443-4a9f-b491-71209ae168e5@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 5 Aug 2024 10:36:47 +0100
Message-ID: <CANPvuRn=1yu1Wngx8SZWABRRTUGq=4DxqDePqZk6UDzT3-T3+g@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 2/7] composefs: move from
 meta-filesystems to meta-oe layer
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001588eb061eec6b72"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 09:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111510

--0000000000001588eb061eec6b72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

akuster808 <akuster808@gmail.com> escreveu (s=C3=A1bado, 3/08/2024 =C3=A0(s=
) 17:19):

>
>
> On 7/29/24 1:09 PM, Jose Quaresma via lists.openembedded.org wrote:
> > From: Jose Quaresma <quaresma.jose@gmail.com>
> >
> > We can make this more widely available as we don't
> > depend anymore on fuse3.
>
> Moving recipes between layers is outside the scope of a stable release.
>

I understand.
Thanks

Jose


>
> - armin
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit dfae2972b4905bd9a423642641d4921334f844fb)
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >   .../recipes-support/composefs/composefs_1.0.3.bb                  | 0
> >   ...001-musl-basename-use-portable-implementation-for-basena.patch | 0
> >   2 files changed, 0 insertions(+), 0 deletions(-)
> >   rename {meta-filesystems =3D> meta-oe}/recipes-support/composefs/
> composefs_1.0.3.bb (100%)
> >   rename {meta-filesystems =3D>
> meta-oe}/recipes-support/composefs/files/0001-musl-basename-use-portable-=
implementation-for-basena.patch
> (100%)
> >
> > diff --git a/meta-filesystems/recipes-support/composefs/
> composefs_1.0.3.bb b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
> > similarity index 100%
> > rename from meta-filesystems/recipes-support/composefs/
> composefs_1.0.3.bb
> > rename to meta-oe/recipes-support/composefs/composefs_1.0.3.bb
> > diff --git
> a/meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use=
-portable-implementation-for-basena.patch
> b/meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable=
-implementation-for-basena.patch
> > similarity index 100%
> > rename from
> meta-filesystems/recipes-support/composefs/files/0001-musl-basename-use-p=
ortable-implementation-for-basena.patch
> > rename to
> meta-oe/recipes-support/composefs/files/0001-musl-basename-use-portable-i=
mplementation-for-basena.patch
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111466):
> https://lists.openembedded.org/g/openembedded-devel/message/111466
> > Mute This Topic: https://lists.openembedded.org/mt/107612971/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> akuster808@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001588eb061eec6b72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">akuster808 &lt;<a href=3D"mailto:akus=
ter808@gmail.com">akuster808@gmail.com</a>&gt; escreveu (s=C3=A1bado, 3/08/=
2024 =C3=A0(s) 17:19):<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><br>
<br>
On 7/29/24 1:09 PM, Jose Quaresma via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:=
<br>
&gt; From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" tar=
get=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt;<br>
&gt; We can make this more widely available as we don&#39;t<br>
&gt; depend anymore on fuse3.<br>
<br>
Moving recipes between layers is outside the scope of a stable release.<br>=
</blockquote><div><br>I understand.<br>Thanks</div><div><br></div><div>Jose=
<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- armin<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; (cherry picked from commit dfae2972b4905bd9a423642641d4921334f844fb)<b=
r>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../recipes-support/composefs/<a href=3D"http://composefs_=
1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">composefs_1.0.3.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
&gt;=C2=A0 =C2=A0...001-musl-basename-use-portable-implementation-for-basen=
a.patch | 0<br>
&gt;=C2=A0 =C2=A02 files changed, 0 insertions(+), 0 deletions(-)<br>
&gt;=C2=A0 =C2=A0rename {meta-filesystems =3D&gt; meta-oe}/recipes-support/=
composefs/<a href=3D"http://composefs_1.0.3.bb" rel=3D"noreferrer" target=
=3D"_blank">composefs_1.0.3.bb</a> (100%)<br>
&gt;=C2=A0 =C2=A0rename {meta-filesystems =3D&gt; meta-oe}/recipes-support/=
composefs/files/0001-musl-basename-use-portable-implementation-for-basena.p=
atch (100%)<br>
&gt;<br>
&gt; diff --git a/meta-filesystems/recipes-support/composefs/<a href=3D"htt=
p://composefs_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">composefs_1.0.=
3.bb</a> b/meta-oe/recipes-support/composefs/<a href=3D"http://composefs_1.=
0.3.bb" rel=3D"noreferrer" target=3D"_blank">composefs_1.0.3.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta-filesystems/recipes-support/composefs/<a href=3D"http=
://composefs_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">composefs_1.0.3=
.bb</a><br>
&gt; rename to meta-oe/recipes-support/composefs/<a href=3D"http://composef=
s_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">composefs_1.0.3.bb</a><br>
&gt; diff --git a/meta-filesystems/recipes-support/composefs/files/0001-mus=
l-basename-use-portable-implementation-for-basena.patch b/meta-oe/recipes-s=
upport/composefs/files/0001-musl-basename-use-portable-implementation-for-b=
asena.patch<br>
&gt; similarity index 100%<br>
&gt; rename from meta-filesystems/recipes-support/composefs/files/0001-musl=
-basename-use-portable-implementation-for-basena.patch<br>
&gt; rename to meta-oe/recipes-support/composefs/files/0001-musl-basename-u=
se-portable-implementation-for-basena.patch<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#111466): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/111466" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/111466</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10761297=
1/3616698" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107612971/3616698</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:akuster808@gmail.co=
m" target=3D"_blank">akuster808@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000001588eb061eec6b72--


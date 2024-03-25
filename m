Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C69C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 15:22:33 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.55145.1711380147375656145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 08:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QjEpXlSY;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60a068e26d8so50747857b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711380146; x=1711984946; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/a1DtPcNzO26H6nXxsQAsp4Inz/dJeETzwdA3bY67EE=;
        b=QjEpXlSYyzp+zSLWF+yo9pOElSobVec/YsbKiQTgs6X2OPT8Cq+jRmnRGyHg3YfnHp
         3tMPbzOK1xxyezB3kMm7DFGlVrdDtNZP2C2qM2soiFNXRmDDRmFGa+TaUHi5W6jJ0k6c
         Fl2UVRsoPcQp9IlzaIY3EOy8COXK6o1byhBH+y/bKBkpPbOnxaHhd6Ox4kVzZiPfg21R
         +k2j3Ar4IfAdN/yhI7420YMlO3rSOOG6TVdXbWZ12D0Fy+subXIbyHVxv0GDJy/+rK0m
         Y8z61gAMBo60IMld8LOuNgdYkEB3MKdQypmni/NnulcvhUFTwbr2F/uzjGL9lU0GAzsf
         5tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711380146; x=1711984946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/a1DtPcNzO26H6nXxsQAsp4Inz/dJeETzwdA3bY67EE=;
        b=RCo053mmoSZePJJkj7ugeYzkMoqLZIoWdNrdc8OUWflnIGg2JiNvoeuSPTgJkX1fD0
         xe5PoJEWJ1tz9TOdb54722mCaOMHsG0Ywqm0bK7R8gNhsm52B8iIHMRzuTl5CP1kblWB
         1ICnfteUHbvrPpW5J7ezG9LWZxnrflGlZbs25FjbbVZUF/C7nOhVOONzONjRPMO0tCe/
         gTLkrHOuiojGf+HIvravV+y7Hk/mMx17vpmoaY8bz2pSGcndH8KtDhQnCxoDymfuW0q9
         10qq6Fw0KVNODPoN/d8hH4VINz0jbdo40QkqZhaNc9i7oZleP4XiZp/g23u8ZcTEUman
         fB6A==
X-Forwarded-Encrypted: i=1; AJvYcCVho03I9LzHynD4hZRNz0puGcg0CxXFFiM+J+iiemsE8Mt0Ks6IovPy99ccwn49mQAihY0WQ57/BVuFTPeIoDL1FVmusAo5xeWXjrpgkr3Jqk4j1Pbn8i9gZA==
X-Gm-Message-State: AOJu0YxVXyWZfKDRn1Z4XFpw97Zfq84JAEiP/8gaVYtCUPMYGCJKfDqQ
	UEpnSTxVBR0CrG1hH8Amq/QWMzzdA+ygW1CAXO+tXA2y6gE7hzv2H71soGHCfMIVmLPSb9tEyPH
	8WZx3Ap+qafpkBEjSwzN/m4kQGlM=
X-Google-Smtp-Source: AGHT+IHwdnzTqZSWpUQ4jPnLjPpAu76+DTSmmi63t+KSW7Y2zu+/x8mDkPCT4d1O85SDcTPKKmqeBw86mHoEmVKU1dw=
X-Received: by 2002:a0d:d48a:0:b0:60a:16b8:1042 with SMTP id
 w132-20020a0dd48a000000b0060a16b81042mr5752836ywd.16.1711380146422; Mon, 25
 Mar 2024 08:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240325132603.2477-1-jermain.horsman@nedap.com>
 <20240325132603.2477-2-jermain.horsman@nedap.com> <17C009E70F37F98C.21233@lists.openembedded.org>
In-Reply-To: <17C009E70F37F98C.21233@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 25 Mar 2024 08:22:15 -0700
Message-ID: <CANx9H-DO7uWu1sp7jx4b6rwTqcMK--2MMFQnazmkEZ6tFLbpKg@mail.gmail.com>
Subject: Re: [oe] [meta-java][PATCH 2/7] icedtea: Update URL for source downloads
To: ticotimo@gmail.com
Cc: jermain.horsman@nedap.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b40d2006147dbdf7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 15:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109591

--000000000000b40d2006147dbdf7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 7:59=E2=80=AFAM Tim Orling via lists.openembedded.o=
rg
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Mon, Mar 25, 2024 at 6:27=E2=80=AFAM Jermain Horsman <jermain.horsman@=
nedap.com>
> wrote:
>
>> From: Jermain Horsman <jermain.horsman@nedap.com>
>>
>> The old icedtea.classpath.org URL does not work anymore,
>> update this to the icedtea.wildebeest.org URL used for other
>> download sources.
>>
>
> icedtea.wildebeest.org has some older sources, but not the newest.
>
> https://icedtea.classpath.org/download/source/ has some newer sources,
> but perhaps the
> path has changed?
>
> https://icedtea.classpath.org/download/source/icedtea-2.1.3.tar.gz
>
> I'll take this under review anyway, as is, since the old 2.1.3 version of
> iceatea7-native we
> are building still works from icedtea.wildebeest.org
>
>
>
>> Also update both to use https.
>>
>> Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
>> ---
>>  recipes-core/icedtea/openjdk-7-release-03b147.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc
>> b/recipes-core/icedtea/openjdk-7-release-03b147.inc
>> index 16bf592..379fd9e 100644
>> --- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
>> +++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
>> @@ -7,10 +7,10 @@ FILESPATH =3D. "${FILE_DIRNAME}/openjdk-7-03b147:"
>>  # Force arm mode for now
>>  ARM_INSTRUCTION_SET:armv4t =3D "ARM"
>>
>> -ICEDTEA_URI =3D "
>> http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=3Di=
ced
>> "
>> +ICEDTEA_URI =3D "
>> https://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=3D=
iced
>> "
>>
>
This one should be able to be
https://icedtea.classpath.org/download/source/icedtea-2.1.3.tar.gz


>
>>  ICEDTEA_PREFIX =3D "icedtea7-forest-2.1"
>> -ICEDTEA_HG_URL =3D "
>> http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
>> +ICEDTEA_HG_URL =3D "
>> https://icedtea.wildebeest.org/hg/release/${ICEDTEA_PREFIX}"
>>
>
I think this is the problem-child URL. I don't see "forest" in the revived
https://icedtea.classpath.org/ site.
We probably need to reach out to the site/organization to remind them of
the oversight.


>>  OPENJDK_CHANGESET =3D "22cc03983e20"
>>  OPENJDK_FILE_UPSTREAM =3D "${OPENJDK_CHANGESET}.tar.bz2"
>> --
>> 2.43.0.windows.1
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109589):
> https://lists.openembedded.org/g/openembedded-devel/message/109589
> Mute This Topic: https://lists.openembedded.org/mt/105137637/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b40d2006147dbdf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 25, 2024 at 7:59=E2=80=AF=
AM Tim Orling via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Mar 25, 2024 at 6:27=E2=80=AFAM Jermain Horsman &lt;<a href=3D"mailt=
o:jermain.horsman@nedap.com" target=3D"_blank">jermain.horsman@nedap.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Jermain Horsman &lt;<a href=3D"mailto:jermain.horsman@nedap.com" target=
=3D"_blank">jermain.horsman@nedap.com</a>&gt;<br>
<br>
The old <a href=3D"http://icedtea.classpath.org" rel=3D"noreferrer" target=
=3D"_blank">icedtea.classpath.org</a> URL does not work anymore,<br>
update this to the <a href=3D"http://icedtea.wildebeest.org" rel=3D"norefer=
rer" target=3D"_blank">icedtea.wildebeest.org</a> URL used for other<br>
download sources.<br></blockquote><div><br></div><div><a href=3D"http://ice=
dtea.wildebeest.org" target=3D"_blank">icedtea.wildebeest.org</a> has some =
older sources, but not the newest.</div><div><br></div><div><a href=3D"http=
s://icedtea.classpath.org/download/source/" target=3D"_blank">https://icedt=
ea.classpath.org/download/source/</a> has some newer sources, but perhaps t=
he<br></div><div>path has changed?</div><div><br></div><div><a href=3D"http=
s://icedtea.classpath.org/download/source/icedtea-2.1.3.tar.gz" target=3D"_=
blank">https://icedtea.classpath.org/download/source/icedtea-2.1.3.tar.gz</=
a><br></div><div><br></div><div>I&#39;ll take this under review anyway, as =
is, since the old 2.1.3 version of iceatea7-native we</div><div>are buildin=
g still works from <a href=3D"http://icedtea.wildebeest.org" target=3D"_bla=
nk">icedtea.wildebeest.org</a></div><div><br></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Also update both to use https.<br>
<br>
Signed-off-by: Jermain Horsman &lt;<a href=3D"mailto:jermain.horsman@nedap.=
com" target=3D"_blank">jermain.horsman@nedap.com</a>&gt;<br>
---<br>
=C2=A0recipes-core/icedtea/openjdk-7-release-03b147.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-co=
re/icedtea/openjdk-7-release-03b147.inc<br>
index 16bf592..379fd9e 100644<br>
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc<br>
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc<br>
@@ -7,10 +7,10 @@ FILESPATH =3D. &quot;${FILE_DIRNAME}/openjdk-7-03b147:&qu=
ot;<br>
=C2=A0# Force arm mode for now<br>
=C2=A0ARM_INSTRUCTION_SET:armv4t =3D &quot;ARM&quot;<br>
<br>
-ICEDTEA_URI =3D &quot;<a href=3D"http://icedtea.wildebeest.org/download/so=
urce/$%7BICEDTEA%7D.tar.gz;name=3Diced" rel=3D"noreferrer" target=3D"_blank=
">http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=3Dic=
ed</a>&quot;<br>
+ICEDTEA_URI =3D &quot;<a href=3D"https://icedtea.wildebeest.org/download/s=
ource/$%7BICEDTEA%7D.tar.gz;name=3Diced" rel=3D"noreferrer" target=3D"_blan=
k">https://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=3D=
iced</a>&quot;<br></blockquote></div></div></blockquote><div><br></div><div=
>This one should be able to be=C2=A0<a href=3D"https://icedtea.classpath.or=
g/download/source/icedtea-2.1.3.tar.gz" target=3D"_blank">https://icedtea.c=
lasspath.org/download/source/icedtea-2.1.3.tar.gz</a></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0ICEDTEA_PREFIX =3D &quot;icedtea7-forest-2.1&quot;<br>
-ICEDTEA_HG_URL =3D &quot;<a href=3D"http://icedtea.classpath.org/hg/releas=
e/$%7BICEDTEA_PREFIX%7D" rel=3D"noreferrer" target=3D"_blank">http://icedte=
a.classpath.org/hg/release/${ICEDTEA_PREFIX}</a>&quot;<br>
+ICEDTEA_HG_URL =3D &quot;<a href=3D"https://icedtea.wildebeest.org/hg/rele=
ase/$%7BICEDTEA_PREFIX%7D" rel=3D"noreferrer" target=3D"_blank">https://ice=
dtea.wildebeest.org/hg/release/${ICEDTEA_PREFIX}</a>&quot;<br></blockquote>=
</div></div></blockquote><div>=C2=A0</div><div>I think this is the problem-=
child URL. I don&#39;t see &quot;forest&quot; in the revived <a href=3D"htt=
ps://icedtea.classpath.org/">https://icedtea.classpath.org/</a> site.</div>=
<div>We probably need to reach out to the site/organization to remind them =
of the oversight.</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
=C2=A0OPENJDK_CHANGESET =3D &quot;22cc03983e20&quot;<br>
=C2=A0OPENJDK_FILE_UPSTREAM =3D &quot;${OPENJDK_CHANGESET}.tar.bz2&quot;<br=
>
-- <br>
2.43.0.windows.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109589): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109589" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109589</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105137637/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105137637/924729</a><br>
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

--000000000000b40d2006147dbdf7--


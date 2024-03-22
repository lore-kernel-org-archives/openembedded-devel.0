Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A9AC47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 03:09:57 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.4772.1711076992269377706
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Mar 2024 20:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V8TvOGTb;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-60a434ea806so17868247b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 20:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711076991; x=1711681791; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AdExtu8h7ua5ejpeBUANwRBPqKsUbEPV8tsX3R+b46I=;
        b=V8TvOGTbwVA6/BE+hll+6+e2hrCkJKWioplW6wpK+EC5CapqMxZ8/X5QJ/6/yJZUak
         VXxg72eouP4FZOi0jYd7JHjs/n6g2iMJkSSudCGtAVBiEOkXxyTTkA3z4YTHqbgXJ074
         f+rZh78TlaLwEek8sYx7NCKXaNyNVLHoM+qp2PyACtjMeZGwDDKv+rxNOwGW6NN66JPB
         r68YmSrwqzgEcTUPJAEdZwzvAMv6uf3uzJFAGkREqXcIm1q5F/qHKVm9MHmRHDiRm13M
         LfNwsLkigrK/0f0paeVvPgd5sHMNjJ5IIWqbq2SAozG8qnJQi2Y5qBBaKcbs6e8avUj3
         NBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711076991; x=1711681791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdExtu8h7ua5ejpeBUANwRBPqKsUbEPV8tsX3R+b46I=;
        b=l14meK597JBDUZGBlPwEidvxtaDLY2gbmfaHAhdSsi0nztH+CAyLqoUaAMncvk9yrn
         8FearGmbc4eJc0uPjfXK7pzemS8jRYeXzb2m0L6JIz+iSxRzf/EazUoyEKQ6gCk87WWs
         WiUUQAPZXgWuJGQ6A2OLVGU0uVPaKWmAdO7RdxXiWktka2KcYi4L+pTq7fSLEJzkKkY4
         2/lfeOXakakpki+56G6q5d9ToZoL/oZZFaigoFrLKBjIDDj92ozDsGL0nWDphfkypvWE
         4GwputfNoYWZwvcoQwcKHaocZ7+xYdtaVjvTeqdjw7LbA6+D1eD1LWmKxzCa+yfPl/q9
         t8AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvRm3cqC4h++T6NCUiYUHM96Bk59kBSxMUaBvWXyCtQmG2Z95mNudGjUMyNotLPN+FGGR/Z+vFuiexDiOvyjaGaYA6FSUx+qPX8cSaQojVjtY1x6oconc5eA==
X-Gm-Message-State: AOJu0YwjM1nMzNsV7DMR173i+CeCgTulF+mB3XKmF3fTLsvzAZGEiMYg
	vNzDfIwBNe44kZ+kX+Bl8y4BrfgrSFJEhdQE4cd0YYyDqfUEQIYih63CFBMTI90D863uxc07zE1
	ku/0vcYzJTho2ci46GktmkjCMhp4=
X-Google-Smtp-Source: AGHT+IE3Iha1kkSdBj7v5LTdIjv7P54DqDo0z/i9ulMuw4LF+jcOkBGw6+Ywf41SBY7PvNcTj9PO/ChH4TYA+YTKxvg=
X-Received: by 2002:a5b:b06:0:b0:dc7:49a0:7f87 with SMTP id
 z6-20020a5b0b06000000b00dc749a07f87mr980919ybp.63.1711076991376; Thu, 21 Mar
 2024 20:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240130103458.819774-1-martin.jansa@gmail.com>
 <0b85cf93-421b-4c5c-ae46-515ebdb5cc38@gmail.com> <CA+chaQcHdgbVOORRdeErRXT2FM+7QcOidaHEanskrqrocFN7xg@mail.gmail.com>
 <32b9a223-6f69-4ddc-98b3-e5a94d70080b@windriver.com>
In-Reply-To: <32b9a223-6f69-4ddc-98b3-e5a94d70080b@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 21 Mar 2024 20:09:40 -0700
Message-ID: <CANx9H-DM=KNWB3ShKzpq0QXShsakicn_LOENo1FeWeUTqAaDdQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] redis: restore Upstream-Status ->
 LICENSE change for 7.4 and later !
To: randy.macleod@windriver.com
Cc: martin.jansa@gmail.com, Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
Content-Type: multipart/alternative; boundary="00000000000041253d0614372827"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 03:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109509

--00000000000041253d0614372827
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 5:55=E2=80=AFPM Randy MacLeod via lists.openembedde=
d.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:

> Would the new license scheme described here:
>
> https://redis.com/blog/redis-adopts-dual-source-available-licensing/
>
> prevent us from accepting the 7.4 release? I suspect it should but I need
> more time to
> read the new terms.
>

Fedora has a rather long thread about this already:
https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org=
/thread/XVFFKU2NYB2Q3BQUYNANSDNE4VCJQ6KF/


>
> ../Randy
>
>
> On 2024-01-30 1:23 p.m., Martin Jansa via lists.openembedded.org wrote:
>
> On Tue, Jan 30, 2024 at 6:28=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>
>> On 1/30/24 2:34 AM, Martin Jansa wrote:
>> > * accidentally dropped in:
>> >
>> https://git.openembedded.org/meta-openembedded/commit/?id=3De91fa668ed1d=
d4a3f6b06bcb099f70dbdd2a50b4
>> > ---
>> >   .../lua-update-Makefile-to-use-environment-build-setting.patch  | 2 =
++
>> >   1 file changed, 2 insertions(+)
>> >
>> > diff --git
>> a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-=
environment-build-setting.patch
>> b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-=
environment-build-setting.patch
>> > index b562e2522c..48a8bb5b4b 100644
>> > ---
>> a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-=
environment-build-setting.patch
>> > +++
>> b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-=
environment-build-setting.patch
>> > @@ -16,6 +16,8 @@ updated to work wtih 6.2.1
>> >   Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>> >
>> >   ---
>> > +Upstream-Status: Pending
>>
>> I think it might be better to move it above the scissor to avoid getting
>> lost in next devtool based upgrade.
>>
>
> As you wish, resent all 3 as v2 with it moved.
>
> FWIW: in
> https://github.com/webosose/meta-webosose/commit/2c78e37ad9ceb9e236c03b44=
cca5b38e9d9eb2fc
> I've moved all Upstream-Statuses in LGE layers bellow, because too often
> developers applied them with Upstream-Status into the component source gi=
t
> repo where it doesn't belong and then it was already too late to remove i=
t
> there (while with Upstream-Status lost in rebase/devtool there is still
> time to get warning from QA check and once this check is enabled by defau=
lt
> in all the builds it will prevent people overlooking this by accident).
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109507):
> https://lists.openembedded.org/g/openembedded-devel/message/109507
> Mute This Topic: https://lists.openembedded.org/mt/105077570/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000041253d0614372827
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 21, 2024 at 5:55=E2=80=AF=
PM Randy MacLeod via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;randy.macleod=3D<a href=3D"mailto:windriver.com@lists.op=
enembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <div>Would the new license scheme described
      here:<br>
      <br>
    </div>
    <div><a href=3D"https://redis.com/blog/redis-adopts-dual-source-availab=
le-licensing/" target=3D"_blank">https://redis.com/blog/redis-adopts-dual-s=
ource-available-licensing/</a></div>
    <div><br>
    </div>
    <div>prevent us from accepting the 7.4
      release? I suspect it should but I need more time to <br>
      read the new terms.<br></div></div></blockquote><div><br></div><div>F=
edora has a rather long thread about this already:</div><div><a href=3D"htt=
ps://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/th=
read/XVFFKU2NYB2Q3BQUYNANSDNE4VCJQ6KF/">https://lists.fedoraproject.org/arc=
hives/list/devel@lists.fedoraproject.org/thread/XVFFKU2NYB2Q3BQUYNANSDNE4VC=
JQ6KF/</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div><div>
    </div>
    <div><br>
    </div>
    <div>../Randy</div>
    <div><br>
    </div>
    <div><br>
    </div>
    <div>On 2024-01-30 1:23 p.m., Martin Jansa
      via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists=
.openembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">On Tue, Jan 30, 2024 at 6:28=E2=80=AFPM Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt;
          wrote:<br>
        </div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
            1/30/24 2:34 AM, Martin Jansa wrote:<br>
            &gt; * accidentally dropped in:<br>
            &gt;=C2=A0 =C2=A0 <a href=3D"https://git.openembedded.org/meta-=
openembedded/commit/?id=3De91fa668ed1dd4a3f6b06bcb099f70dbdd2a50b4" rel=3D"=
noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openembedde=
d/commit/?id=3De91fa668ed1dd4a3f6b06bcb099f70dbdd2a50b4</a><br>
            &gt; ---<br>
            &gt;=C2=A0
            =C2=A0.../lua-update-Makefile-to-use-environment-build-setting.=
patch=C2=A0
            | 2 ++<br>
            &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
            &gt; <br>
            &gt; diff --git
a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-env=
ironment-build-setting.patch
b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-env=
ironment-build-setting.patch<br>
            &gt; index b562e2522c..48a8bb5b4b 100644<br>
            &gt; ---
a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-env=
ironment-build-setting.patch<br>
            &gt; +++
b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-env=
ironment-build-setting.patch<br>
            &gt; @@ -16,6 +16,8 @@ updated to work wtih 6.2.1<br>
            &gt;=C2=A0 =C2=A0Signed-off-by: Yi Fan Yu &lt;<a href=3D"mailto=
:yifan.yu@windriver.com" target=3D"_blank">yifan.yu@windriver.com</a>&gt;<b=
r>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0---<br>
            &gt; +Upstream-Status: Pending<br>
            <br>
            I think it might be better to move it above the scissor to
            avoid getting <br>
            lost in next devtool based upgrade.<br>
          </blockquote>
          <div><br>
          </div>
          <div>As you wish, resent all 3 as v2 with it moved.</div>
          <div><br>
          </div>
          <div>FWIW: in=C2=A0<a href=3D"https://github.com/webosose/meta-we=
bosose/commit/2c78e37ad9ceb9e236c03b44cca5b38e9d9eb2fc" target=3D"_blank">h=
ttps://github.com/webosose/meta-webosose/commit/2c78e37ad9ceb9e236c03b44cca=
5b38e9d9eb2fc</a>
            I&#39;ve moved all Upstream-Statuses in LGE layers bellow,
            because too often developers applied them with
            Upstream-Status into the component source git repo where it
            doesn&#39;t belong and then it was already too late to remove i=
t
            there (while with Upstream-Status lost in rebase/devtool
            there is still time to get warning from QA check and once
            this check is enabled by default in all the builds it will
            prevent people overlooking this by accident).</div>
        </div>
      </div>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109507): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109507" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109507</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105077570/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105077570/924729</a><br>
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

--00000000000041253d0614372827--


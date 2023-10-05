Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098F0E9271A
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 17:13:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.21444.1696525988407005864
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 10:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jF2qjvCG;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-327be5fe4beso1177978f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 10:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696525987; x=1697130787; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J+LWYRZT+T926LR4EnJoOVoFfDt6BW9LCaaMRVxwZmU=;
        b=jF2qjvCGyw2c3icVvw2bmSNeBfiy9AyYAA826O32jsFUA67WEEV/Z+or1k378Y2UUm
         4dlNijS+ly8bYbxXvuPKOLQvkH9wC8/yKPpmzo2LGEYc9OWOMKjJlp+rlA7ynURu4Ofq
         UBkFZdhhrB0mtqUKi1XM/hrqFU/bgyYKjWW4XMLslS3B+Nw3bHuXpAJB3xHK7Re9Ndfv
         aWzauMmsbQSkf2ndKe0rvMeMqEOl1Xq720R2V3iFsZP6XnZ9hb4T7oFHFOGMfTvWLLAY
         7cqoRRJ/HIHp7jKRNXyP8CTMNjRr/HYR/+/C9kNqoG24r9L5liGC63vwGCFme5BeGSt+
         aBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696525987; x=1697130787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+LWYRZT+T926LR4EnJoOVoFfDt6BW9LCaaMRVxwZmU=;
        b=tw/Je+6fS2L4qj5rAFSP1Nz8FadGroK2izqZ2BIZyQVQUWyZPWGma4e54mAhCJQrHy
         YAMAMfjqWdcaahdUmuaHiflH8Pg95RVb3sNOtdhe9NJhafvz8Hv1NXgNOGXyfPcYXX/M
         GF6wDsPaeDii+4cDEtIrMev8EUkKgMVAjj1UOjm141gLwvGGqe1kkY9q3rMSPMbEcjVw
         CqHtay1SHpTGjiU1rKTjugfc5yvw7UsTSBaMRSnzWXFlUsItHxQ1y6o9c1JnV10c4PDk
         243Y2UWwVn7jqkngRMfmqFv/EIztE28vEcwjCJSdOt1xKTHxiPqjoqiRhvjlE7Wm0Y+w
         gSbw==
X-Gm-Message-State: AOJu0YxdcEgv2z5iYxBd11AjcIvihJCtpMznmIkKL6XI7+VOCus6Fhz2
	JVliF4D5FRG9B5EtZ1oBiyO8xv8qUvitjMZtFQY=
X-Google-Smtp-Source: AGHT+IFp9PvXn/iiieCZRVTBkvHVuUeAiku4EfhzN7wp5K+jrdbMj+/wOkmwkDOhkG5+YzdGJp+eKOuGzNplg0IEOYg=
X-Received: by 2002:adf:e6ce:0:b0:31f:b7b2:d4e1 with SMTP id
 y14-20020adfe6ce000000b0031fb7b2d4e1mr5345520wrm.20.1696525986375; Thu, 05
 Oct 2023 10:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <DB5PR02MB10213DB493B73CBCA0E2D8D55EFCAA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CAMKF1sqf=x+1Ar+D58hgcNFQw-Pofz7H-o=vEuBkf_nSCBj8pg@mail.gmail.com>
In-Reply-To: <CAMKF1sqf=x+1Ar+D58hgcNFQw-Pofz7H-o=vEuBkf_nSCBj8pg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Oct 2023 19:12:52 +0200
Message-ID: <CA+chaQewr47Z52vU=8Qz5ov32COwTp1bbKcfMqwdfiriBnPAgw@mail.gmail.com>
Subject: Re: [oe] What are the plans for the nanbield branch?
To: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"OE Development (openembedded-devel@lists.openembedded.org)" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c52e210606fb3c59"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 17:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105360

--000000000000c52e210606fb3c59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: I prefer oe-core keeping master and nanbield in sync (even using the
same SHAs) until they really need to be different

Now there is the Maintainer change in READMEs already applied in nanbield,
so the commits from master won't be idential SHAs. Next time it would be
IMHO better to delay merging README update until the branches need to
diverge.

Regards,

On Thu, Oct 5, 2023 at 7:01=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> Hi Peter,
>
> We have created the branch since there were some patches moving
> python3 recipes to core which were not sure if they will make into
> this release
> or not. Plan was to keep it in sync with master as far as possible.
> Good part is that those python recipe move has made into core in
> nanbield so we
> are unblocked. Armin
> has plans to sync nanbield to master
>
> Thanks
> -Khem
>
> On Thu, Oct 5, 2023 at 7:03=E2=80=AFAM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > Khem and Armin,
> >
> > what are the plans for the nanbield branch, given that is was
> > branched off long before the actual Nanbield release? Do you plan
> > on merging master into it once Nanbield is released, or will it
> > stay as it is and relevant parts will have to be backported?
> >
> > The reason I ask is because I am currently working on preparing
> > our layers for the upgrade to Nanbield and currently there is
> > quite a big difference between the nanbield branch and the master
> > branch in meta-openembedded. Thus it would help to know if should
> > continue to track the master branch for meta-openembedded, or if
> > I should revert to the nanbield branch.
> >
> > //Peter
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105359):
> https://lists.openembedded.org/g/openembedded-devel/message/105359
> Mute This Topic: https://lists.openembedded.org/mt/101777064/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c52e210606fb3c59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I prefer oe-core keeping master and nanbield in sync=
 (even using the same SHAs) until they really need to be different<div><br>=
</div><div>Now there is the Maintainer change in READMEs already applied in=
 nanbield, so the commits from master won&#39;t be idential SHAs. Next time=
 it would be IMHO better to delay merging README update until the branches =
need to diverge.</div><div><br></div><div>Regards,</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 5, 2023=
 at 7:01=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.=
khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Peter,<br>
<br>
We have created the branch since there were some patches moving<br>
python3 recipes to core which were not sure if they will make into<br>
this release<br>
or not. Plan was to keep it in sync with master as far as possible.<br>
Good part is that those python recipe move has made into core in<br>
nanbield so we<br>
are unblocked. Armin<br>
has plans to sync nanbield to master<br>
<br>
Thanks<br>
-Khem<br>
<br>
On Thu, Oct 5, 2023 at 7:03=E2=80=AFAM Peter Kjellerstedt<br>
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Khem and Armin,<br>
&gt;<br>
&gt; what are the plans for the nanbield branch, given that is was<br>
&gt; branched off long before the actual Nanbield release? Do you plan<br>
&gt; on merging master into it once Nanbield is released, or will it<br>
&gt; stay as it is and relevant parts will have to be backported?<br>
&gt;<br>
&gt; The reason I ask is because I am currently working on preparing<br>
&gt; our layers for the upgrade to Nanbield and currently there is<br>
&gt; quite a big difference between the nanbield branch and the master<br>
&gt; branch in meta-openembedded. Thus it would help to know if should<br>
&gt; continue to track the master branch for meta-openembedded, or if<br>
&gt; I should revert to the nanbield branch.<br>
&gt;<br>
&gt; //Peter<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105359): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105359" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105359</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101777064/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101777064/3617156</a><br>
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

--000000000000c52e210606fb3c59--


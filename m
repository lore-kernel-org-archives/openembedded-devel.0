Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E4DC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 13:59:23 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.13636.1713362354207887022
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Apr 2024 06:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J1kmsNHU;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-617ddc988f5so64775487b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 06:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713362353; x=1713967153; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+gpisYHwPsQ8HhIZj/Qc9Yv16txu4k10uX8Cnzjnxoc=;
        b=J1kmsNHULrd3KKhPOxe9eQl2NcoEL7ov2Ieep+knX71hSnsCOPfGGSCUO667MwAJi+
         xDgOT1Qx+/VK9z7f7a98iJwraGbM6ksJ+HA/Ho0ljzSJTc6TIHBlMvAYTiUCAMpnUZxr
         ILJzy+vnu5+gW3F2zbn3LdALDUpHmG0+ck9WYMAlYPImsQJ9FIoejvXUQsKz1A/+kGXy
         Gl9C+L+phPXGz58j5Uou4ADQsEoq1Js/bx1AysRTfeTe4Jl6KOUgACFRZP0mqFr8FnNg
         WQbivosarfHJhzwfFKq0y9ES97592UFwAJQrrnzMRZCN72s9JHCNZiuTwkU71PrAyK0D
         /QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713362353; x=1713967153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gpisYHwPsQ8HhIZj/Qc9Yv16txu4k10uX8Cnzjnxoc=;
        b=Cb79tlplvD6sjHPo4VgCxqidu2peZHUy19AML4KFwFrFDYBScAbVH9w+fVlMppI0Lp
         FdJY8oAMcaioEQAgFDke7vLejPK2o7zXCZ1yqa8Ne+GflyBNqINHeXCBY/2tekimQ0TG
         Na6J4ulcQCMKoAwyaLPTNuPJiGyaWTDvJ5ePsq+8ZAD5XEY7NPF9x9zcFvWajQv9EEMj
         /fFTO8YS2NKNfTqwJYivWqhp9W3hQhFqVB+UQrmFCAzFXEhv7IcZMTGMOnf5+6egZt1c
         coblWJk9WMKgn3uKu9Vuqz0+0XGP/7rIlry1eoRpIw7WDouMEGlj+wiEkycorcI73upk
         TW7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgqeEZfJwSOwsHsFwUDABWGLW1jr3iHRVd1TqRWGD8RB4dspr/K/fWFGVslxqlcHvqx32wnQCBZMIbYRBIfywIPkWUI/B1UQcEEonlo1KOSe3q8wkfN5OWnA==
X-Gm-Message-State: AOJu0Yyqybxxbs9VNMv60YuZ1r30oYz/K7qH7TjtYfmtWfAsvL8/dGgS
	3cDmYehwi4O8q2ew1vgOG3YZ1cL+LnxX3jvF+4gp0clTSkt5J7rM+yZ8p20SCayIyggNN/+ZGMy
	uvjTX24tpbA/l7m6M/GjXwn6JXQk=
X-Google-Smtp-Source: AGHT+IHrIeiAHLn4YufkRcwvNZ0g0v63dTgopeUKhrvc6kwxJSmjYpsSMY455j1Q6pt8uwdi+vAYsG6l7Fqe58TCas4=
X-Received: by 2002:a81:8349:0:b0:615:1f78:465a with SMTP id
 t70-20020a818349000000b006151f78465amr14579222ywf.20.1713362351857; Wed, 17
 Apr 2024 06:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240415131443.7295-1-marex@denx.de> <CA+chaQcJXRzwTd4Hh=2gYZ7aQQDw3DAFSFq7=KH67-dhgODz1A@mail.gmail.com>
 <743657ad-53aa-4fad-b4e7-ae4ee204984a@denx.de> <AS1PR10MB56979F3C20FEAA7E4EA855CEFD082@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj-idDTJMihKSJYZCf3R16d1qYajfBC6AscGigR91UeqLQ@mail.gmail.com>
 <CA+chaQd60TVDT6iz+KMDPub4HwF5VZOj=akyYSZCSo4SbN5VwQ@mail.gmail.com> <CANNYZj-AXRhPc+ak1TjfF01B06217T9gQ_1Bn5JCVrxZF44MnA@mail.gmail.com>
In-Reply-To: <CANNYZj-AXRhPc+ak1TjfF01B06217T9gQ_1Bn5JCVrxZF44MnA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 17 Apr 2024 06:59:00 -0700
Message-ID: <CANx9H-CXeVm5Hq=uuANL_vsSAvKfUzjMZU_q74Dx3xQ=DrRxjA@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 for scarthgap
To: alex.kanavin@gmail.com
Cc: Martin Jansa <martin.jansa@gmail.com>, peter.marko@siemens.com, 
	"marex@denx.de" <marex@denx.de>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005aa82206164b4274"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 13:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110042

--0000000000005aa82206164b4274
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 2:00=E2=80=AFAM Alexander Kanavin via lists.openemb=
edded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> On Tue, 16 Apr 2024 at 17:03, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> > As there is strong opinion against declaring scarthgap compatibility
> > in official meta-python2 from Timo, Alex and Jose, I don't plan to
> > merge Marek's change (nor my version with additional fixes for
> > Upstream-Status etc).
>
> There's more to it. It's a protest against people focusing on obsolete
> retro computing stuff because of their poor product planning, while
> offering no help to keep things current. It took me two months to
> update python to 3.12 while ensuring nothing breaks in core or
> meta-oe. Something you Marek perhaps don't need right now, but will
> certainly need in the future. Did you help?
>

To echo what Alex is saying here (I have spent months of my life,
uncompensated for the effort, to bring the pyproject.toml and
other new PEP-517 build backend classes into oe-core, with a lot of very
hard effort from RP and Ross).

In addition, with my OpenEmbedded Board member hat on and my OpenEmbedded
TSC member hat on, I take this
stance:

We as an organization in no way whatsoever want anyone to think it is ok to
continue to use python2. You have had well over a
decade of warning and foreshadowing. The licensing probably means we do not
have any actual legal liability exposure, but in
our modern litigious society, this is no guarantee. You have had two years
of kirkstone support and still have two more years before
kirkstone is EOL. This is the end of the line. This is where this stops.
Plan your way out of this situation and move on.

Tim

We cannot control what users and companies want to bring into their own
layers. They are welcome to at their

>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110039):
> https://lists.openembedded.org/g/openembedded-devel/message/110039
> Mute This Topic: https://lists.openembedded.org/mt/105535514/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005aa82206164b4274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 17, 2024 at 2:00=E2=80=AF=
AM Alexander Kanavin via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.ope=
nembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 16 Apr 2024 at 17:03=
, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_bla=
nk">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; As there is strong opinion against declaring scarthgap compatibility<b=
r>
&gt; in official meta-python2 from Timo, Alex and Jose, I don&#39;t plan to=
<br>
&gt; merge Marek&#39;s change (nor my version with additional fixes for<br>
&gt; Upstream-Status etc).<br>
<br>
There&#39;s more to it. It&#39;s a protest against people focusing on obsol=
ete<br>
retro computing stuff because of their poor product planning, while<br>
offering no help to keep things current. It took me two months to<br>
update python to 3.12 while ensuring nothing breaks in core or<br>
meta-oe. Something you Marek perhaps don&#39;t need right now, but will<br>
certainly need in the future. Did you help?<br></blockquote><div><br></div>=
<div>To echo what Alex is saying here (I have spent months of my life, unco=
mpensated for the effort, to bring the pyproject.toml and</div><div>other n=
ew PEP-517 build backend classes into oe-core, with a lot of very hard effo=
rt from RP and Ross).</div><div><br></div><div>In addition, with my OpenEmb=
edded Board member hat on and my OpenEmbedded TSC member hat on, I take thi=
s</div><div>stance:</div><div><br></div><div>We as an organization in no wa=
y whatsoever=C2=A0want anyone to think it is ok to continue to use python2.=
 You have had well over a</div><div>decade of warning and foreshadowing. Th=
e licensing probably means we do not have any actual legal liability exposu=
re, but in</div><div>our modern litigious society, this is no guarantee. Yo=
u have had two years of kirkstone support and still have two more years bef=
ore</div><div>kirkstone is EOL. This is the end of the line. This is where =
this stops. Plan your way out of this situation and move on.</div><div><br>=
</div><div>Tim</div><div><br></div><div>We cannot control what users and co=
mpanies want to bring into their own layers. They are welcome to at their</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110039): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110039" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110039</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105535514/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105535514/924729</a><br>
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

--0000000000005aa82206164b4274--


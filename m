Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADA9C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 04:08:40 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.3617.1699330119474245691
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 20:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QS2AI439;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1f06931e4f7so2590113fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 20:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699330118; x=1699934918; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uHb4uxOTXkySIsdv5vkyKiEHaXmiHE3abXKMCc6IrbY=;
        b=QS2AI439QYMU2ZzW6Z9pDsQS4UTLJZEhj/P2gcn4aHLVeKGaXFa7wpszB2H/3EH49F
         Mx2hN7o+zJqZiN+yHrdXYrzsW9i4pH+7nruKteSTjTz3EMkR8YPlazksuZrwNR1GSuoM
         Axu0IVHUULbWeb75g29n2S5roNyPrAUDSWL11yU0JUYLpBO4HKFDcUYoDuor1vnVwUn9
         ZSQJoKAlgG1+rzftR4lFplEoyzgsEX8vOymnpgGih5NXnlMb88dhPEVm6D/FecLr4KCW
         NnfPB6xfEWRr/XI3t9/XP0MuYds6LG/APj9CIYoKikZnOGnuX6zEZN2sHgVGi0oJqneu
         6IZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699330118; x=1699934918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHb4uxOTXkySIsdv5vkyKiEHaXmiHE3abXKMCc6IrbY=;
        b=I4VsNkfzawM0VJFaPdPjQwi1rE1l+je6hl3GDTCWs2+lDGBWVxJPk4H0VGW8r8Xr3q
         FRCr7GM3gW3X4V11/+mnM1x/ONjg3pe3kV24AotDFZ/zQ29KTc5AzTgchqRDFLHx/5r6
         LDB7y+YHEt+NUIq4L1Aa1jEOP0yL0/aO+uRUn9G6PFUNH7FtDknYsnR3E4Q4tv5rehgz
         GlRut9X4XkODFLfTWAyjNfWqmNenY5NGjGaP63mztLRorADMMLw/B81u4EByeL7k24Uu
         GiAG6RXRPugoBur+oujjHVNhDPELQvLiVYrOp5gYypV2yLLpRrNQQym5yQ2LNuaN4zgK
         DEpQ==
X-Gm-Message-State: AOJu0YyIb4CffsXDHNApLrSfj9Desx2gqdfXFheRFNIhpQpbtrEyQu8D
	8i33NoFUlhtrRSTiHlpA7z60T7ky03mEMnkw807AYuUrHZg=
X-Google-Smtp-Source: AGHT+IGlyZH+16LmzMlaoO1/u2+A09EMxa5X2MHzSekfkvXnCV2P2o9jRgKUUKkqWD/hgUDtpzyujd5SczpCCVtTM7M=
X-Received: by 2002:a05:6871:67c2:b0:1ea:131f:5fb1 with SMTP id
 yb2-20020a05687167c200b001ea131f5fb1mr1892099oab.34.1699330118473; Mon, 06
 Nov 2023 20:08:38 -0800 (PST)
MIME-Version: 1.0
References: <0101018b96bed4bc-d43306c3-deb1-4fad-8737-e15d03ce0f3c-000000@us-west-2.amazonses.com>
 <CAFMvBt09Z7EUh1kRUggWdQ9_HJfMzZdP1qynNrN+Mg3ESseNRA@mail.gmail.com>
In-Reply-To: <CAFMvBt09Z7EUh1kRUggWdQ9_HJfMzZdP1qynNrN+Mg3ESseNRA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Nov 2023 20:08:27 -0800
Message-ID: <CAMKF1so-CM2VWTEU65rt7ZYifjLVwW5Stw=b11VwAO1mY_wUqw@mail.gmail.com>
Subject: Re: [oe] [AUH] modemmanager: upgrading to 1.23.1 SUCCEEDED
To: "Theodore A. Roth" <troth@openavr.org>
Cc: Auto Upgrade Helper <auh@yoctoproject.org>, Forced@yoctoproject.org, for@yoctoproject.org, 
	maintainer@yoctoproject.org, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000115a600609882078"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 04:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106419

--000000000000115a600609882078
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2023 at 7:58=E2=80=AFPM Theodore A. Roth <troth@openavr.org>=
 wrote:

> On Fri, Nov 3, 2023 at 1:53=E2=80=AFPM Auto Upgrade Helper <auh@yoctoproj=
ect.org>
> wrote:
> >
> > Hello,
> >
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe *modemmanager* to
> *1.23.1* has Succeeded.
> >
> > Next steps:
> >     - apply the patch: git am
> 0001-modemmanager-upgrade-1.22.0-1.23.1.patch
> >     - check the changes to upstream patches and summarize them in the
> commit message,
> >     - compile an image that contains the package
> >     - perform some basic sanity tests
> >     - amend the patch and sign it off: git commit -s --reset-author
> --amend
> >     - send it to the appropriate mailing list
> >
> > Alternatively, if you believe the recipe should not be upgraded at this
> time,
> > you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> > automatic upgrades would no longer be attempted.
> >
> > Please review the attached files for further information and
> build/update failures.
> > Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
> >
> > Regards,
> > The Upgrade Helper
> >
> > -- >8 --
> > From ad32b52fe87e6edc3885802cbb85b8524e4c156a Mon Sep 17 00:00:00 2001
> > From: Upgrade Helper <auh@yoctoproject.org>
> > Date: Fri, 3 Nov 2023 16:08:56 +0000
> > Subject: [PATCH] modemmanager: upgrade 1.22.0 -> 1.23.1
>
> Why is modemmanager getting updated to 1.23.1? That is not an official
> release, but is a
> development release as far as I can tell. The tag in git is '1.23.1-dev'.
>
> The latest release is 1.22.0 (announced on Oct 11 on the ModemManager
> mailing list).


Hmm I think we need to fix the trigger then to only consider even releases

>
>
> Ted Roth
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106418):
> https://lists.openembedded.org/g/openembedded-devel/message/106418
> Mute This Topic: https://lists.openembedded.org/mt/102372092/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000115a600609882078
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 6, 2023 at 7:58=E2=80=AFPM Theodore A. Roth &lt=
;<a href=3D"mailto:troth@openavr.org">troth@openavr.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)">On Fri, Nov 3, 2023 at 1:53=E2=80=AFPM Auto Upgrade H=
elper &lt;<a href=3D"mailto:auh@yoctoproject.org" target=3D"_blank">auh@yoc=
toproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; this email is a notification from the Auto Upgrade Helper<br>
&gt; that the automatic attempt to upgrade the recipe *modemmanager* to *1.=
23.1* has Succeeded.<br>
&gt;<br>
&gt; Next steps:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- apply the patch: git am 0001-modemmanager-upgrade=
-1.22.0-1.23.1.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0- check the changes to upstream patches and summari=
ze them in the commit message,<br>
&gt;=C2=A0 =C2=A0 =C2=A0- compile an image that contains the package<br>
&gt;=C2=A0 =C2=A0 =C2=A0- perform some basic sanity tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0- amend the patch and sign it off: git commit -s --=
reset-author --amend<br>
&gt;=C2=A0 =C2=A0 =C2=A0- send it to the appropriate mailing list<br>
&gt;<br>
&gt; Alternatively, if you believe the recipe should not be upgraded at thi=
s time,<br>
&gt; you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that=
<br>
&gt; automatic upgrades would no longer be attempted.<br>
&gt;<br>
&gt; Please review the attached files for further information and build/upd=
ate failures.<br>
&gt; Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproj=
ect.org/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"norefe=
rrer" target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?pro=
duct=3DAutomated%20Update%20Handler</a><br>
&gt;<br>
&gt; Regards,<br>
&gt; The Upgrade Helper<br>
&gt;<br>
&gt; -- &gt;8 --<br>
&gt; From ad32b52fe87e6edc3885802cbb85b8524e4c156a Mon Sep 17 00:00:00 2001=
<br>
&gt; From: Upgrade Helper &lt;<a href=3D"mailto:auh@yoctoproject.org" targe=
t=3D"_blank">auh@yoctoproject.org</a>&gt;<br>
&gt; Date: Fri, 3 Nov 2023 16:08:56 +0000<br>
&gt; Subject: [PATCH] modemmanager: upgrade 1.22.0 -&gt; 1.23.1<br>
<br>
Why is modemmanager getting updated to 1.23.1? That is not an official<br>
release, but is a<br>
development release as far as I can tell. The tag in git is &#39;1.23.1-dev=
&#39;.<br>
<br>
The latest release is 1.22.0 (announced on Oct 11 on the ModemManager<br>
mailing list).</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Hm=
m I think we need to fix the trigger then to only consider even releases</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Ted Roth<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#106418): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/106418" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/106418</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102372092/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102372092/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000115a600609882078--


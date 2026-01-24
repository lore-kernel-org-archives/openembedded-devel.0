Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8D6D715FD
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 22:27:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28713.1769293667303268919
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 14:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Zpw89dtt;
 spf=pass (domain: snapchat.com, ip: 209.85.221.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fbc305552so2895708f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 14:27:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769293666; cv=none;
        d=google.com; s=arc-20240605;
        b=Kv9da/FxhiauFTSKHm/6Ejg7i9fSAMOLtjmLTDWeLjrXcyGAnPrc0VeeF+hgD1g+aI
         OxF96eCdXvM9atb1EjzvhIW0DrEV5lOBng7+rkSWTM5C/FcyZGJYW3p2MTJKKIV4kDdy
         2F4MxY05onLUw7WK0jMv1z5TeOZBSwuWH78A/k7hj+ePzBnjGyeF3mbv3qI2uSxHGF0l
         1WLhqSjMQtQSTIv20Y/q4H6I8I4MfkdIlvfqWc4d+FbozEvR1zSy4diEFs9Df9HLE40m
         ctT9KvWDBDwlYI9WZ2z6YuMTMEJa6SEwG2VAeJpnjk+yX76m3rpLi8yb3oOC7gHldlaG
         w2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8nbKjiv3rQNQofVcxpPAGxZOoXQzykLa/lTfsCyM1Fo=;
        fh=WVn0PzdmREqkP/CsqUccdqBe2Uoak/MCv8wqBv7yLow=;
        b=NDyKM9N8pvFHPRm5vRraKgswsMjSvwGAPLq+ED6BYTgMEConbThbxklvIYJRo+Pmk/
         JgoLESocvrNSeyIzXSfP9rVTHJlGweE7BK1jr2ZIb696CdMxJpkzNepXvO3drngnRcaE
         7lqgSYodMhgvPcwo5LAx0nlvCEZVjnp3RzcTz4KPQvSLJchvnb/4QkSRYny7QOIOA7nP
         PbJ7lFEnKU+XDBwvIjvMflQC1RBZll1l9mYL6VpKyFVYiLEdtkTl8OvKIJ9yLrHMbzFs
         fsUe1bEmNaTfkdAnX3yMvVAMYdgiphbwG+ZSi2TP33fybeUFUQg4/jNfeLp+/0DEbHTo
         gDYw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1769293666; x=1769898466; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8nbKjiv3rQNQofVcxpPAGxZOoXQzykLa/lTfsCyM1Fo=;
        b=Zpw89dtt3urNY1z8cu+ZRvUVqv+s0C8o+8etd6OARg6f3SsU9dntMT6kcij8p93htN
         SDO0IWZ/MsLpTbJew0pEgYMpZDpjo3MG4HWWZe0pwXQ6wtJ+20CBAEZKa9TrkZz2Psz1
         yjTWXYzIz/OpTd62Q5hqzdV+8tJTTKsquO1yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769293666; x=1769898466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nbKjiv3rQNQofVcxpPAGxZOoXQzykLa/lTfsCyM1Fo=;
        b=kwuh6rBgIiS/hCetcubW36TnpDS0jJXwJXn6xbQAz2cuXkQ/Lk+xsoO9facnF3RhiE
         fz7viuAWYX/o7p1VAo4a2QG3y5V7eCdJn0W/nEAWOFkeXBiXkgjkMXSmtHSUeveTn+yi
         j+NE/CGdCxV0bLSHKb6dHsD2b5kn9/Hf6vn7NQbSp8qn2IZd4meRgtnsMEl7puNBWu9F
         QfhdyiV9y/wQc/8YhSck2fpmoo2XGWS7Wn2lyekfZKNxbGljNQy0hV8hfa0ngYTkh6zN
         E/65JOPwtSnYWGdWU6qNOvY8H4hYV9S4e+9LtUK42kMyNZZCN5Sn4HOlhjgh6/T5when
         eqJw==
X-Forwarded-Encrypted: i=1; AJvYcCXXGNxe2NOC8nyMJK1FGZDlWux+isRn31IPCw8EkOtuK44FrSmKynrz/bs59fj2jdo27SqhYynWRTJM+whqWlyKplc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzM608kO/C8MrIQqMp9DMQ20NRzP1Chc/ZgcEoxX/HXxakU1Jt/
	hI9jsvERzn/p00MgmfPFNJ7XkpEDpgASOTnW5f9zwHUCRb+AISiDROJFjZtOo3uRstqo4PdMW32
	GYRwzkSrOyD01SR0ba9EK1jNpdkKuP4vzwLqlZj2Osw==
X-Gm-Gg: AZuq6aIHT0spxjlYl685pbsZgk5vBErND4bDuSinEVBjMsYgKM0xCfTbETk+bkTG3M9
	UF6lEzstBXgt/eeHEPQ/l6oA2rtv60XC/VJsOpQAGl6z+HFuKNuUm5Ngwr4CHc1EwMFO59rlhHX
	fcenl1+soroTpvduDW/rYtSdVn3Xdiian6HWfCNXtW6JWtQPacZh4aEy8WS1HgOA37rgOimyTR3
	+zte12ybQTCgiwA3VKu8pTfqdkc5tXan9b9J3ngpiMZRBbtwQCYVm5ses4agjBQcJouUaRLbUqh
	qSz/irEQAXkqqt63IsLLhsM+Bzw=
X-Received: by 2002:a5d:588b:0:b0:432:aa5a:3916 with SMTP id
 ffacd0b85a97d-435b1604f67mr12647042f8f.40.1769293665600; Sat, 24 Jan 2026
 14:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20260123094603.2835-2-shoudil@qti.qualcomm.com>
 <CA+s=J=zwcMjHif2txhR6kjh6MDmkd+i=NuxcmrddXvTgv43Rzg@mail.gmail.com>
 <qztpe3w7w72bonmpa56l22izj4vvz5jzj6z7f7i25hoe3wcym2@vstodpeiuamv> <CAHUKmYZ+cS6ELKZcYC24YOsKCK4d4Y2L3LrezuD6rW6+TMekUQ@mail.gmail.com>
In-Reply-To: <CAHUKmYZ+cS6ELKZcYC24YOsKCK4d4Y2L3LrezuD6rW6+TMekUQ@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Sat, 24 Jan 2026 23:27:34 +0100
X-Gm-Features: AZwV_Qj9c6oiRBQCowiQLUtcKhLc5gr_qbYbUOhfZJvn1WE4aPGNMpNjihyvduo
Message-ID: <CAHUKmYZrNnN-z7BYQQPK_UsfFDS4zcsWah2wSUjVXag7Fi_eQw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle multiple
 UDC controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>, quaresma.jose@gmail.com, 
	openembedded-devel@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>, Shoudi Li <shoudil@qti.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000007128c2064929c8a3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 22:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123826

--0000000000007128c2064929c8a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I misread the order of the git history: I was the one adding a
second version of android-tools-conf. However since this recipe doesn't
need meta-selinux, it should simply be removed. Only android-tools which
has DEPENDS =3D "... libselinux" needs to be duplicated.

On Sat, Jan 24, 2026 at 11:22=E2=80=AFPM Etienne Cordonnier <ecordonnier@sn=
ap.com>
wrote:

> Hi Dmitry,
> the reason I added a second version of android-tools is explained in the
> pull-request which added android-tools version 10:
> https://github.com/openembedded/meta-openembedded/pull/664#issuecomment-1=
468861667
> (one version depends on meta-selinux and the other does not).
>
> However I was not the one adding a second version of android-tools-conf. =
I
> don't see a good reason to have two copies of the recipe
> android-tools-conf, since this recipe doesn't depend on meta-selinux. Thi=
s
> was probably just a mistake.
>
> On Sat, Jan 24, 2026 at 9:08=E2=80=AFPM Dmitry Baryshkov <
> dmitry.baryshkov@oss.qualcomm.com> wrote:
>
>> On Sat, Jan 24, 2026 at 05:40:59PM +0800, Anuj Mittal wrote:
>> > On Fri, Jan 23, 2026 at 5:46=E2=80=AFPM Jose Quaresma via
>> > lists.openembedded.org
>> > <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>> > >
>> > > From: Shoudi Li <shoudil@qti.qualcomm.com>
>> > >
>> > > For the boards with multiple UDC ports, adb funtion will be impacted
>> due
>> > > to below error.
>> > >
>> > > ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
>> > > ls: write error: Device or resource busy
>> > >
>> > > Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
>> > > ---
>> > >  .../android-tools-conf-configfs/android-gadget-start        | 6
>> ++++--
>> > >  1 file changed, 4 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git
>> a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-t=
ools-conf-configfs/android-gadget-start
>> b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-t=
ools-conf-configfs/android-gadget-start
>> > > index ca6c3df275..76b5e29624 100644
>> > > ---
>> a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-t=
ools-conf-configfs/android-gadget-start
>> > > +++
>> b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-t=
ools-conf-configfs/android-gadget-start
>> >
>> > For some reason, there are two *android-tools-conf-configfs* recipes
>> > which seem identical except for this and a few other minor changes. I
>> > think this one in dynamic-layers/selinux should be removed instead of
>> > aligning it with the other recipe.
>>
>> Looks like it. Commit d3f4e6851243 ("android-tools 10: import version
>> from meta-clang"), which added the second copy, isn't clear, why the
>> second copy was necessary.
>>
>> --
>> With best wishes
>> Dmitry
>>
>

--0000000000007128c2064929c8a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, I misread the order of the git history: I was the o=
ne adding a second version of android-tools-conf. However since this recipe=
 doesn&#39;t need meta-selinux, it should simply be removed. Only android-t=
ools which has DEPENDS =3D &quot;... libselinux&quot; needs to be duplicate=
d.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Jan 24, 2026 at 11:22=E2=80=AFPM Etienne Co=
rdonnier &lt;<a href=3D"mailto:ecordonnier@snap.com">ecordonnier@snap.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr">Hi Dmitry,<br>the reason I added a second version of android=
-tools is explained in the pull-request which added android-tools version 1=
0:=C2=A0<a href=3D"https://github.com/openembedded/meta-openembedded/pull/6=
64#issuecomment-1468861667" target=3D"_blank">https://github.com/openembedd=
ed/meta-openembedded/pull/664#issuecomment-1468861667</a> (one version depe=
nds on meta-selinux and the other does not).<br><br>However I was not the o=
ne adding a second version of android-tools-conf. I don&#39;t see a good re=
ason to have two copies of the recipe android-tools-conf, since this recipe=
 doesn&#39;t depend on meta-selinux. This was probably just a mistake.<br><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sat, Jan 24, 2026 at 9:08=E2=80=AFPM Dmitry Baryshkov &lt;<a href=3D"mail=
to:dmitry.baryshkov@oss.qualcomm.com" target=3D"_blank">dmitry.baryshkov@os=
s.qualcomm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Sat, Jan 24, 2026 at 05:40:59PM +0800, Anuj Mittal wrote:<=
br>
&gt; On Fri, Jan 23, 2026 at 5:46=E2=80=AFPM Jose Quaresma via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Shoudi Li &lt;<a href=3D"mailto:shoudil@qti.qualcomm.com" t=
arget=3D"_blank">shoudil@qti.qualcomm.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; For the boards with multiple UDC ports, adb funtion will be impac=
ted due<br>
&gt; &gt; to below error.<br>
&gt; &gt;<br>
&gt; &gt; ls /sys/class/udc/ &gt; /sys/kernel/config/usb_gadget/adb/UDC<br>
&gt; &gt; ls: write error: Device or resource busy<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Shoudi Li &lt;<a href=3D"mailto:shoudil@qti.qualco=
mm.com" target=3D"_blank">shoudil@qti.qualcomm.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../android-tools-conf-configfs/android-gadget-start=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 6 ++++--<br>
&gt; &gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/andro=
id-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/dynamic=
-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/a=
ndroid-gadget-start<br>
&gt; &gt; index ca6c3df275..76b5e29624 100644<br>
&gt; &gt; --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tool=
s/android-tools-conf-configfs/android-gadget-start<br>
&gt; &gt; +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tool=
s/android-tools-conf-configfs/android-gadget-start<br>
&gt; <br>
&gt; For some reason, there are two *android-tools-conf-configfs* recipes<b=
r>
&gt; which seem identical except for this and a few other minor changes. I<=
br>
&gt; think this one in dynamic-layers/selinux should be removed instead of<=
br>
&gt; aligning it with the other recipe.<br>
<br>
Looks like it. Commit d3f4e6851243 (&quot;android-tools 10: import version<=
br>
from meta-clang&quot;), which added the second copy, isn&#39;t clear, why t=
he<br>
second copy was necessary.<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div>
</blockquote></div>

--0000000000007128c2064929c8a3--


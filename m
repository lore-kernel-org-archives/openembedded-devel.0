Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F40AD715FD
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 22:22:38 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28619.1769293350903980662
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 14:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=A+Dl0W2+;
 spf=pass (domain: snapchat.com, ip: 209.85.128.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801bbbdb4aso29761215e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 14:22:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769293349; cv=none;
        d=google.com; s=arc-20240605;
        b=CUMsJvuaz5YUw8aPImx9Hkf8ZKjcvr2FcGMAJgR70ZOMmTM4WhhB94e4b8Dp0Yc/qJ
         Z5AXsUWOcQfsvhn4/awMfhde6+gkofi1RbTmuxBiDwORYegRD3eJ81HbCCN0uJPldIVk
         y/goqpLcLWhFzBUmqtIfXUr9jJFj01QWS/6gnwkcWolzbeqDk6R+sQfxoTJ2I+4CupoD
         RUTVcf+Y5c+VyveiOHWp81DQ17uAJUesoVFSI8Ij4SnkE2ZUROqia3bz4RZd6g50WFoe
         o0a5Zg5yj6v3futbO8VI7Yv1/PqyAvXMOy1+CYEh6CyZZ9kGdd082jVYPFdEJq5htLVk
         v7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LwaiiQ2epmcC1nWNPp8Cln+CjS86VSG9rOsGgYD5idI=;
        fh=/JA5J4CrQl8wA7DMERTpQqHVf1khgtjLDtDIjel9enc=;
        b=gQHP72IrrxUaGwrNySN0jprvmJeY78EOlPyksFri2+b2elrlZVL9jait1AZWV70UG8
         zqmlPPJEjbuG+WeSx9tLW+a6buPLlFfWK26Jki6CRPYqZntAawx71geJ+2ThknEml+Hs
         roflKOvBxqWn49X9pHfk631i0uuVdydLD7OSpaDyVs33V9hyehtOeWtLCCbgg6UP3TUn
         p+GLUNZulkxaSkMK+ClExCK8PFl+9GMee5/OC2kv32zImUdhXRCN3YzLXaM8sI+dTBaX
         OzO7R+mE8HbifHN992sbi8+Jr9QnNGO/Q9qUFYw0sQNcJgbYxyVkB9rUWWrVbzA53pKp
         fjgg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1769293349; x=1769898149; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LwaiiQ2epmcC1nWNPp8Cln+CjS86VSG9rOsGgYD5idI=;
        b=A+Dl0W2+dBaalQ5bCuJbKHnqYyhxl+2oNbyTTD2Kr5H4aYWLGglX6W3wYELL8et96m
         rCsUJ7E1/QSMullPfGBWi3wQi/rHiHYhpVnoxJf3Nda8j4U3Ie4rdVs/apxHBPoBVFCM
         mtD6mFocUtdPv+B9PyIitzus9keFSKS0kib5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769293349; x=1769898149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwaiiQ2epmcC1nWNPp8Cln+CjS86VSG9rOsGgYD5idI=;
        b=sGwzZTPRFlUhLdeB28hEYl6lQBGqqQhvnjruHIQ+h3vi8Da0TUT9rhr4AJibXNgd5d
         GXMhPuYiiH7vmS29j8IM3yMNVRvqNAk065kqGwqDxSzd5l8SM9I0AJemcVeOKv1kgiXH
         4UpZRdoqXzDj4KwO6RfcmLgBlC4xGp4UokOUg1ISecShIICVliRzTdKZcnHQWVIX3wts
         dNLEN5/g37Zm+0qlMqjr01wApvmntnJv6Rmpl8et1KfPM4C7lrIhtkmIQR7b1w9m9nIO
         weiqCSGc+vnzYoOfOTaP1hBd4olI15uoXjehXozUsqy+OsGTeeCW9WsGCyWqB/rIONcM
         Cg9A==
X-Forwarded-Encrypted: i=1; AJvYcCXhTtfroGiDHScngiYuNJIyxiOnxCYvnxbxJhib5LJaQJvNocSmVoR1CzoBCIvPbe73PJMv/neJ1Y4SJoMLnEd2r/Q=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQm+t4exX7eDs2/hVaKJSBvSrmRcBxmD7RB57eLWKMI3yRH17n
	EXn8PE49Gkx5Q3eDhvaA4EXiefnQcQVomP7c4Nepw8GcOVIubxScAbXdvtn8XTCUPiBkSzRfPGA
	hQEmoDzciD0ZHTjGJn4TbUyn9HnCdQ6xXxsKJj/b0Bg==
X-Gm-Gg: AZuq6aLk/ObwQkErcAwTenqaSH+hR6yF0E/mJCZsm8b7q9Hqqw+r7ovzRRX84zmejAT
	h92BdzF1gGDAxel0uo8quVVn7zcfEXRK5WG+Lb8ZawzTBdAqQ2nXtI44qQeca2Glkr7DIuIt4Jz
	dMbhXHQ6XcQxEkKT2ID023bqaXjcM1zei/dJC4O3oLMpOD9zngS66cOXKjsK1eCHsyD7IsSSuc/
	6AfN1p27Kg5RAYBa4DT2EZy+y6U6rirBnaDn8VpO1mE7tM+fZNFoOFaSXGYI0ObgOFgGn77E5tc
	XeWlOtm67+am6zZ3jdLkSFBCXgM=
X-Received: by 2002:a05:6000:2210:b0:435:bdc2:461 with SMTP id
 ffacd0b85a97d-435c9d18f01mr137457f8f.21.1769293348932; Sat, 24 Jan 2026
 14:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20260123094603.2835-2-shoudil@qti.qualcomm.com>
 <CA+s=J=zwcMjHif2txhR6kjh6MDmkd+i=NuxcmrddXvTgv43Rzg@mail.gmail.com> <qztpe3w7w72bonmpa56l22izj4vvz5jzj6z7f7i25hoe3wcym2@vstodpeiuamv>
In-Reply-To: <qztpe3w7w72bonmpa56l22izj4vvz5jzj6z7f7i25hoe3wcym2@vstodpeiuamv>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Sat, 24 Jan 2026 23:22:17 +0100
X-Gm-Features: AZwV_Qhd6Oz3cqh5m-PD3MdqCy2h9Ys_hKQqRd_BZ-E74pI0hkuOh_S5nEK_tJI
Message-ID: <CAHUKmYZ+cS6ELKZcYC24YOsKCK4d4Y2L3LrezuD6rW6+TMekUQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle multiple
 UDC controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>, quaresma.jose@gmail.com, 
	openembedded-devel@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>, Shoudi Li <shoudil@qti.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000912e75064929b5df"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 22:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123825

--000000000000912e75064929b5df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,
the reason I added a second version of android-tools is explained in the
pull-request which added android-tools version 10:
https://github.com/openembedded/meta-openembedded/pull/664#issuecomment-146=
8861667
(one version depends on meta-selinux and the other does not).

However I was not the one adding a second version of android-tools-conf. I
don't see a good reason to have two copies of the recipe
android-tools-conf, since this recipe doesn't depend on meta-selinux. This
was probably just a mistake.

On Sat, Jan 24, 2026 at 9:08=E2=80=AFPM Dmitry Baryshkov <
dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Sat, Jan 24, 2026 at 05:40:59PM +0800, Anuj Mittal wrote:
> > On Fri, Jan 23, 2026 at 5:46=E2=80=AFPM Jose Quaresma via
> > lists.openembedded.org
> > <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > From: Shoudi Li <shoudil@qti.qualcomm.com>
> > >
> > > For the boards with multiple UDC ports, adb funtion will be impacted
> due
> > > to below error.
> > >
> > > ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> > > ls: write error: Device or resource busy
> > >
> > > Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> > > ---
> > >  .../android-tools-conf-configfs/android-gadget-start        | 6 ++++=
--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git
> a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-to=
ols-conf-configfs/android-gadget-start
> b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-to=
ols-conf-configfs/android-gadget-start
> > > index ca6c3df275..76b5e29624 100644
> > > ---
> a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-to=
ols-conf-configfs/android-gadget-start
> > > +++
> b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-to=
ols-conf-configfs/android-gadget-start
> >
> > For some reason, there are two *android-tools-conf-configfs* recipes
> > which seem identical except for this and a few other minor changes. I
> > think this one in dynamic-layers/selinux should be removed instead of
> > aligning it with the other recipe.
>
> Looks like it. Commit d3f4e6851243 ("android-tools 10: import version
> from meta-clang"), which added the second copy, isn't clear, why the
> second copy was necessary.
>
> --
> With best wishes
> Dmitry
>

--000000000000912e75064929b5df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Dmitry,<br>the reason I added a second version of andro=
id-tools is explained in the pull-request which added android-tools version=
 10:=C2=A0<a href=3D"https://github.com/openembedded/meta-openembedded/pull=
/664#issuecomment-1468861667">https://github.com/openembedded/meta-openembe=
dded/pull/664#issuecomment-1468861667</a> (one version depends on meta-seli=
nux and the other does not).<br><br>However I was not the one adding a seco=
nd version of android-tools-conf. I don&#39;t see a good reason to have two=
 copies of the recipe android-tools-conf, since this recipe doesn&#39;t dep=
end on meta-selinux. This was probably just a mistake.<br></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sat, Jan 24, 2026 at 9:08=E2=80=AFPM Dmitry Baryshkov &lt;<a href=
=3D"mailto:dmitry.baryshkov@oss.qualcomm.com">dmitry.baryshkov@oss.qualcomm=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Sat, Jan 24, 2026 at 05:40:59PM +0800, Anuj Mittal wrote:<br>
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

--000000000000912e75064929b5df--


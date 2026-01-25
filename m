Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB17D74EFD
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 01:43:29 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31840.1769305402185813860
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 17:43:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RDOXe28C;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78c66bdf675so33726117b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 17:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769305401; cv=none;
        d=google.com; s=arc-20240605;
        b=I4JqBPhSKJs2RpuActwKYpP7H1jcnRE0esn0OvE6RyXKoKQpneL/vD9ATRcpXJnTI+
         gwzwlLE0IS00kGDDwczPCK9EvBfN1MYhV6oYG8WyF9mzx2sJ3o6hDqRJ4f0clIYcZv4R
         XECmjGnu9N/tx/OUrI8ANwsDOntOeyGO5qkwLNbzSC9+N0P52KvogBdqRU709jv13EWm
         F7NPmb3m5F6eHBvx7IhZ5/eWCvmDvVIdmUM7hE6YZ6sCLiFZ/XyUeVN4tla+P7IXYFmy
         hX6d4XLAjcnsS10WTE157NlBRG2Owp/47sM7UnfS7gn76D3hDavh68E8VBzPOyXmWWab
         PLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=52VksrndKwc+i6xP3sMv0ApheisZBb6uOeI+MehSwtQ=;
        fh=OYMqh+KqS9R3Oguojex/3qMey+Bv3ufw3uuvmPDgYLM=;
        b=ayG7yFjTIUcpQ20cZd4lUqProXUgs9fkA7+OEg7GqWh/eb0hSwGoZ/UQV0HN07+GW9
         Y84fQycne20N488xxYY+jnYMCGjP2lvqgbGi8YtHuQN9GQMdmVAahOMAnmBoOEvxnV2F
         Ei+rHs2BPdbtqo0WMxAuxXyZWl1y2TLjiKWnBZbiU8raAsIr/2RWU43LI5QuI3BVnPlm
         VtrfK0xheJQotaBMmoZGRPfUnrVusFS6HtzsFUmgJP3EO84bXzjbPrnkz7ta424evA6/
         8f7zpJeaj8CV/vQjzLtfX5ePb8skmaM0aHX2G97HR5yOeuPImjCNzAuorF12e4ZS77ta
         Y/mQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769305401; x=1769910201; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=52VksrndKwc+i6xP3sMv0ApheisZBb6uOeI+MehSwtQ=;
        b=RDOXe28C7xv0Lo9/Yw4tFSixk8aHpJBd2SdZ84V8+S+iEBlkpxi3a6VHK3tGJsxRcL
         lgu0pr0DycwDC5wr6G0RbNTbxLxLL1r9AsuUAthtNh+fMDzx/TKSuLrdY6l6zop+c1QU
         NLqAAiF8vwIpxT/FacC3Jv0w+GRENNh+X/VdI6+WsJwHTCiU1ABKBSdaGHHOxA6/zhSx
         9Z7V03YbYFY/05/ZPtlnLeBnYnvt5JMMsqSbiaWX0lvmHNsLIpq4XgJWDpH7AiGtuHlU
         QsV8zVqF+6nMyTs1ukGfFtFv8jhG1E7FYEYRQltx/cEDvcpxIDTDqASkLuebWzeYL+T9
         /pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769305401; x=1769910201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52VksrndKwc+i6xP3sMv0ApheisZBb6uOeI+MehSwtQ=;
        b=HDVx5m8HlGr/NyrnxnwB1TNu5D38DTH/L2i+MjbuiOKB9ouTb69MFdnGmhTPJyZwOY
         lMnGp70L6Q5OVRCbRR/ZfoRRDTb181aP7SH833iSxTuS+2Nl/8vqZLLZX6Wf9OMd/U3K
         lOAzQXftnPcbxu8f/Lwvkim9/ckNeBEJMZlU1Xpb77aNAh54r311G3mUrHSLgUGT9qQf
         lx2yO1JVbzy8goha9j68YqcSMzLayItJbiIJWIcADDuhpge07vlpT+n85/FJfnG54iZ4
         fJEFiQ9K896JvCr9ONaYZ4ZcrRla+2kDM80k5R+lna+0iOi46u3IgHTsmVI32eDOZrmE
         xdlw==
X-Forwarded-Encrypted: i=1; AJvYcCUchBeBewyfrWtc+m/EJbq8PEt3JpVSyzF1Lqvq1J54pn06p7q6Rdl94tt+eWTYTdHSUavcRkg8DJuTUOmpkRAFppA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzZLEBthlgMstCquhLghwptqz3ooVdMzddiVMU/ispYWkB7h3+D
	HnabVJbTUEQAOHd85SrA18XxSzuouSYjFwwY59Cv5Za9tnwXvlrAdBWdLbAlJHyxTKTGpLKS0Bd
	lKqS4rFnoAExzQ5psp8ID7FYfMxPWiUM=
X-Gm-Gg: AZuq6aLxOvcIxPiImOc3HAue8VTO9X6VNtaaDkIiO7k4f8aSQajBDDVnEogc5gFOyHf
	hwKaqC+s3LNmK3oTz5pNINRdDq2AsU7Ao94fuad9pBj2iMQryZYUFYdtGiff0/SWiErCWzQfXTC
	XEr3KG7ueZq/qPkQwhJ1PQiOt6vKryA5iCcBqofGvdmbyUxVPGe3MbXW8h1K6unZU5X99npeJe+
	CGdAXZ5TDyc8TMIhZW6J088/NjkkmCPC5I3ZhuVtaRtomWVs5v7PL3eeSw21nyuY25TU+MY+BHQ
	t4J5vvWEZKwC6m1/b4VQnGbT/8ZmbC48MOYvgXaZkEjEjqJ2JJx7PLTA3dmyKrKHxJXTXxZEut/
	eG8bG8mUw9CuQJe6eQk1pNWRlvjOwA/1C11cF2L3SC/Y=
X-Received: by 2002:a05:690c:6e0b:b0:786:3ee8:6703 with SMTP id
 00721157ae682-7945a9a4acdmr3176187b3.48.1769305401250; Sat, 24 Jan 2026
 17:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20260123094603.2835-2-shoudil@qti.qualcomm.com> <CA+s=J=zwcMjHif2txhR6kjh6MDmkd+i=NuxcmrddXvTgv43Rzg@mail.gmail.com>
In-Reply-To: <CA+s=J=zwcMjHif2txhR6kjh6MDmkd+i=NuxcmrddXvTgv43Rzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Jan 2026 17:42:55 -0800
X-Gm-Features: AZwV_QjafZ7b0TxxUl7QK3eOPonpRG5P1rPoC6uDmDys2T4hpckscGUuVdcoLDA
Message-ID: <CAMKF1soG+TqjKZ+FTDf=zRYDN0zNRe1NdbzeRk5OhjptVX3EaA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle multiple
 UDC controllers
To: anuj.mittal@oss.qualcomm.com
Cc: quaresma.jose@gmail.com, openembedded-devel@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>, Shoudi Li <shoudil@qti.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000f0d77606492c83f8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 01:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123830

--000000000000f0d77606492c83f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 1:41=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> On Fri, Jan 23, 2026 at 5:46=E2=80=AFPM Jose Quaresma via
> lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Shoudi Li <shoudil@qti.qualcomm.com>
> >
> > For the boards with multiple UDC ports, adb funtion will be impacted du=
e
> > to below error.
> >
> > ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> > ls: write error: Device or resource busy
> >
> > Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> > ---
> >  .../android-tools-conf-configfs/android-gadget-start        | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git
> a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-to=
ols-conf-configfs/android-gadget-start
> b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-to=
ols-conf-configfs/android-gadget-start
> > index ca6c3df275..76b5e29624 100644
> > ---
> a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-to=
ols-conf-configfs/android-gadget-start
> > +++
> b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-to=
ols-conf-configfs/android-gadget-start
>
> For some reason, there are two *android-tools-conf-configfs* recipes
> which seem identical except for this and a few other minor changes. I
> think this one in dynamic-layers/selinux should be removed instead of
> aligning it with the other recipe.
>

Right, I think its because there was selinux dependency. Things might have
changed so I would prefer that we delete
the one in
meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-to=
ols

and if we need something from meta-selinux, that could be added as a
bbappend in dynamic layer e.g. dependency on selinux or somesuch


>
> > @@ -2,6 +2,8 @@
> >
> >  set -e
> >
> > -sleep 3
> > +sleep 10
> >
> > -ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> > +ls /sys/class/udc/ | head -n 1 | xargs echo -n >
> /sys/kernel/config/usb_gadget/adb/UDC
> > +
> > +echo "Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB Gadget
> usage"
> > --
> > 2.52.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123822):
> https://lists.openembedded.org/g/openembedded-devel/message/123822
> Mute This Topic: https://lists.openembedded.org/mt/117415388/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f0d77606492c83f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 24,=
 2026 at 1:41=E2=80=AFAM Anuj Mittal via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:oss.=
qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Fri, Jan 23, 2026 at 5:46=E2=80=AFPM Jose Quaresma via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Shoudi Li &lt;<a href=3D"mailto:shoudil@qti.qualcomm.com" target=
=3D"_blank">shoudil@qti.qualcomm.com</a>&gt;<br>
&gt;<br>
&gt; For the boards with multiple UDC ports, adb funtion will be impacted d=
ue<br>
&gt; to below error.<br>
&gt;<br>
&gt; ls /sys/class/udc/ &gt; /sys/kernel/config/usb_gadget/adb/UDC<br>
&gt; ls: write error: Device or resource busy<br>
&gt;<br>
&gt; Signed-off-by: Shoudi Li &lt;<a href=3D"mailto:shoudil@qti.qualcomm.co=
m" target=3D"_blank">shoudil@qti.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../android-tools-conf-configfs/android-gadget-start=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 6 ++++--<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-to=
ols/android-tools-conf-configfs/android-gadget-start b/meta-oe/dynamic-laye=
rs/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/androi=
d-gadget-start<br>
&gt; index ca6c3df275..76b5e29624 100644<br>
&gt; --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/and=
roid-tools-conf-configfs/android-gadget-start<br>
&gt; +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/and=
roid-tools-conf-configfs/android-gadget-start<br>
<br>
For some reason, there are two *android-tools-conf-configfs* recipes<br>
which seem identical except for this and a few other minor changes. I<br>
think this one in dynamic-layers/selinux should be removed instead of<br>
aligning it with the other recipe.<br></blockquote><div><br></div><div>Righ=
t, I think its because there was selinux dependency. Things might have chan=
ged so I would prefer that we delete</div><div>the one in</div><div>meta-op=
enembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools</di=
v><div><br></div><div>and if we need something from meta-selinux, that coul=
d be added as a bbappend in dynamic layer e.g. dependency on selinux or som=
esuch</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt; @@ -2,6 +2,8 @@<br>
&gt;<br>
&gt;=C2=A0 set -e<br>
&gt;<br>
&gt; -sleep 3<br>
&gt; +sleep 10<br>
&gt;<br>
&gt; -ls /sys/class/udc/ &gt; /sys/kernel/config/usb_gadget/adb/UDC<br>
&gt; +ls /sys/class/udc/ | head -n 1 | xargs echo -n &gt; /sys/kernel/confi=
g/usb_gadget/adb/UDC<br>
&gt; +<br>
&gt; +echo &quot;Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB =
Gadget usage&quot;<br>
&gt; --<br>
&gt; 2.52.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123822): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123822" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123822</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117415388/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117415388/1997914</a><br>
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

--000000000000f0d77606492c83f8--


Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB64C77B7D
	for <webhook@archiver.kernel.org>; Sat, 13 May 2023 18:57:31 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.53308.1684004242205148265
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 13 May 2023 11:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=W1AkBqms;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-55a5a830238so104555787b3.3
        for <Openembedded-devel@lists.openembedded.org>; Sat, 13 May 2023 11:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684004241; x=1686596241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D/dGQU1eBkzcdz/wQXwDGOC/wDeI9eW4ekxQI7mljN4=;
        b=W1AkBqms+/O6FWTA5NLbsz5opcHEyRPVOG7s6YVNu/8H9GkhpGBIJ6cj98FGxhQGQX
         rBlZJV3t7d1HdYGWqItB9AJ6CtMisixXd47tKcjLRB7nRQADQBfuUVgpiIs6rvGp19Mr
         ha9SRjWCKCR6vjpOlGTa2iRSUCWQnYzmS6GoqAr/9o230rtlNZZIMgHJCGxqBkyl6mbc
         2+kG3i/aoZ5gyIVLhhyHIKCrcPCHoVtJjN9y6uazVwZvZIeOkXDXNkZgOldHdYwWI8bK
         8SWX2HwpTF5fU27zl9ETCToYVEFRpopczPVO95KhaYS8JS51ave5bNnJp1OxD3knZ2So
         ZDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684004241; x=1686596241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/dGQU1eBkzcdz/wQXwDGOC/wDeI9eW4ekxQI7mljN4=;
        b=SWGykk0xyVXZptmm8HSwRugEMLjUp2zpcj79ZDWHucV/McGX0zVlhQOmA6pjLBxTet
         mNNwogNLeut1SbXAAYRzJ/puyarCr83QuaJ8sAu9O8pWPPk04XbRsT367w/f07TB516P
         XOtUveUtimd6QEY8R8FXm6vPdyG0A0GI8suMRJ8kwlYbVS/N10p4I7Fxwf+IsWJFipUM
         2XfnOHYPD/x+nBZAMIHDo2MywfREEsVTBWUuHlHi8FiGtkwhDAJPjXZbEKiPvtmE13xO
         qpcTrw/J4eUuivi/hqgJYBQ3OXFGCIcIakGhcyhgDO7zmWINsVom6SiOkB+LQx1xprkn
         MUow==
X-Gm-Message-State: AC+VfDz9Rn2SwAmVoXzICBh0NZSEw6XqLPxaQvtpoY3mSryShICGwPW/
	C+Jw+FinhwDU0Cc4MvjMIfWUIN33UlqI767QDc4=
X-Google-Smtp-Source: ACHHUZ5ze6CjrPbbyTVu7MgwDpw2J4EsrDT15cwHU+M0PQsGw8PFDUHZCS8pQ04xphNVIueJkwEDuEScEvA9TBmYLEU=
X-Received: by 2002:a81:6004:0:b0:559:cd61:cec5 with SMTP id
 u4-20020a816004000000b00559cd61cec5mr26652366ywb.27.1684004241027; Sat, 13
 May 2023 11:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <6ef48dfeb218986c6227fadef69959b1493157cd.camel@gmail.com> <674.1683926094725585368@lists.openembedded.org>
In-Reply-To: <674.1683926094725585368@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 13 May 2023 11:57:10 -0700
Message-ID: <CANx9H-B4h67Tk+B_2AgshgrE8zMGot7aHdq2RgAikQMn4_hjWQ@mail.gmail.com>
Subject: Re: [oe] bug: meta-networking: networkmanager: Langdale: duplicate
 NetworkManager services at runtime
To: ken.s@variscite.com
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000096399c05fb97caeb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 May 2023 18:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102562

--00000000000096399c05fb97caeb
Content-Type: text/plain; charset="UTF-8"

On Fri, May 12, 2023 at 2:14 PM Ken Sloat via lists.openembedded.org <ken.s=
variscite.com@lists.openembedded.org> wrote:

> Hi Adrian,
>
> Thanks for your quick reply.
>
> I was looking at the packages-split folders the other day and yes it is
> packaged there.
>
> Thanks for pointing out rm_sysvinit_initddir. I debugged this a bit, and
> it turns out that "sysvinit" is actually still in DISTRO_FEATURES along
> with "systemd." In Langdale at least, it appears that the statements from:
>
>
> https://github.com/yoctoproject/poky/blob/langdale/meta/conf/distro/include/init-manager-systemd.inc
>
> that is:
> DISTRO_FEATURES:append = " systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"
> VIRTUAL-RUNTIME_init_manager ??= "systemd"
> VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
> VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
> VIRTUAL-RUNTIME_dev_manager ??= "systemd"
>
> are not removing "sysvinit" from DISTRO_FEATURES. The if statement in
> rm_sysvinit_initddir requires that both systemd be present and sysvinit not
> present to call the removal functions.
>
> I was only able to force "sysvinit" removal via
> DISTRO_FEATURES:remove = "sysvinit"
>
> I debugged in Kirkstone as well and rm_sysvinit_initddir did remove the
> scripts there (DISTRO_FEATURES properly set). Did something change with
> specifying systemd in Langdale? Those statements are still in
> init-manager-systemd.inc file in Langdale.
>

Langdale is now EOL.
https://wiki.yoctoproject.org/wiki/Releases

You probably want to be using INIT_MANAGER

https://docs.yoctoproject.org/4.2/dev-manual/init-manager.html#using-systemd-exclusively


> Sincerely,
> Ken Sloat
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102559):
> https://lists.openembedded.org/g/openembedded-devel/message/102559
> Mute This Topic: https://lists.openembedded.org/mt/98852053/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000096399c05fb97caeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, May 12, 2023 at 2:14 PM Ken Sloat via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;ken.s=3D<a href=
=3D"mailto:variscite.com@lists.openembedded.org">variscite.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><p>Hi Adrian,<br><br>T=
hanks for your quick reply.<br><br>I was looking at the packages-split fold=
ers the other day and yes it is packaged there.<br><br>Thanks for pointing =
out rm_sysvinit_initddir. I debugged this a bit, and it turns out that &quo=
t;sysvinit&quot; is actually still in DISTRO_FEATURES along with &quot;syst=
emd.&quot; In Langdale at least, it appears that the statements from:</p>
<p><a href=3D"https://github.com/yoctoproject/poky/blob/langdale/meta/conf/=
distro/include/init-manager-systemd.inc" rel=3D"noopener" target=3D"_blank"=
>https://github.com/yoctoproject/poky/blob/langdale/meta/conf/distro/includ=
e/init-manager-systemd.inc</a><br><br>that is:<br>DISTRO_FEATURES:append =
=3D &quot; systemd&quot;<br>DISTRO_FEATURES_BACKFILL_CONSIDERED:append =3D =
&quot; sysvinit&quot;<br>VIRTUAL-RUNTIME_init_manager ??=3D &quot;systemd&q=
uot;<br>VIRTUAL-RUNTIME_initscripts ??=3D &quot;systemd-compat-units&quot;<=
br>VIRTUAL-RUNTIME_login_manager ??=3D &quot;shadow-base&quot;<br>VIRTUAL-R=
UNTIME_dev_manager ??=3D &quot;systemd&quot;<br><br>are not removing &quot;=
sysvinit&quot; from DISTRO_FEATURES. The if statement in rm_sysvinit_initdd=
ir requires that both systemd be present and sysvinit not present to call t=
he removal functions.<br><br>I was only able to force &quot;sysvinit&quot; =
removal via<br>DISTRO_FEATURES:remove =3D &quot;sysvinit&quot;<br><br>I deb=
ugged in Kirkstone as well and rm_sysvinit_initddir did remove the scripts =
there (DISTRO_FEATURES properly set). Did something change with specifying =
systemd in Langdale? Those statements are still in init-manager-systemd.inc=
 file in Langdale.<br></p></blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Langdale is now EOL.</div><div dir=3D"auto"><div><a href=3D"https=
://wiki.yoctoproject.org/wiki/Releases">https://wiki.yoctoproject.org/wiki/=
Releases</a></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">You p=
robably want to be using INIT_MANAGER</div><div dir=3D"auto"><div dir=3D"au=
to"><br></div><div dir=3D"auto"><a href=3D"https://docs.yoctoproject.org/4.=
2/dev-manual/init-manager.html#using-systemd-exclusively">https://docs.yoct=
oproject.org/4.2/dev-manual/init-manager.html#using-systemd-exclusively</a>=
</div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)"><p><br></p>
<p>Sincerely,<br>Ken Sloat</p>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#102559): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/102559" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/102559</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98852053/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
98852053/924729</a><br>
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

--00000000000096399c05fb97caeb--


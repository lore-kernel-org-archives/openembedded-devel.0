Return-Path: <vincent.prince.fr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450C3C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 10:56:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.10304.1642762606064099275
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 02:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wj54fCl0;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 125so1199720wmc.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 02:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+yw2O12HvCKg6u8MsDYBMjP6c4N8nSrALCEZyrGZhn0=;
        b=Wj54fCl0MVcFX80vP1JEPGrIx3QMR72KvccKtWNy1bjWZwSaAA6B7nUukVvrbKPFiB
         0rujCcfQJiMLoQeYN3XDc7un+DW88SK9J+/aNbqq63UYthq8h85En//A/Ats8263TKe7
         OI/BuL3s20pus2H3Cly4SNdXMx9fbegZihRwGREOyT+t4Iy7jG/GuRudoIGPXE7dWWf9
         VZ2dlybHEfpHrJsNLpnDS8bYsD2J7PSzkboVcP3VkGt65qfOS9IwQvloGTsW6vUM2aWp
         Os+x9kDPP0tbzWWZqYjrVshZ0hARH/3nKXY3wMJviCEjtRoVVmPxyn1AMz6lRgt9y9tm
         B68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+yw2O12HvCKg6u8MsDYBMjP6c4N8nSrALCEZyrGZhn0=;
        b=awR42vrSlWrBAuL3D4JwKFiGwSw3DTksOvhJa2DO1oO9NSNOIaVlJbdMPzS07fqV4E
         flCwPX6+LvYOne5yeOfymtCMu7RRnk+QXClWOZqLxoyGGUcSTa0qsh6lL4KQJqgFxCU6
         27ZdD7XEFDvPd0rEg3mXjeOCFTG5xvyD8yySM+KDP1PhP46ED5mkJYv23puJPWPFza13
         +gQWVKKrtT9jIEvc0GMvaSLwtTDjAOYn7c6GPNXBUN0NRSWPXeqpHdep4T/fYyFwkak+
         EstM1vIAARjX120RCuxEnn9mysyAdPdaCCCoktlXjJsD9V0NZqIvD2CeN5heO/twnSm7
         NKsA==
X-Gm-Message-State: AOAM530AYJsnfiK6KGOo8+oGZowPOjO7QNjw3dWzC4URJMcJGpOKAWa3
	wocdS/+ISLwC4y3dw+NZR/IRDNjtCNys1a1PvQM=
X-Google-Smtp-Source: 
 ABdhPJyCgrQ2YiUesRg553y99c9VEBghNVPLclsSHdvSCYrKl+E+QtlBmAjtXHVYuDHbyBCtSLwZRRTt27uDSBh4LfQ=
X-Received: by 2002:a5d:608c:: with SMTP id w12mr3239305wrt.313.1642762604465;
 Fri, 21 Jan 2022 02:56:44 -0800 (PST)
MIME-Version: 1.0
References: <1633013662-14499-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1633013662-14499-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 21 Jan 2022 11:56:33 +0100
Message-ID: 
 <CAB2nKc8gyiq61aOe_1gsVUCD=yZE7zFZ+7KCdneSnF71jKKZEw@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] cifs-utils: upgrade 6.13 -> 6.14
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007d528005d6157996"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 10:56:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94965

--0000000000007d528005d6157996
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Am I the only one with some error on cifs-utils?

| (cd
/yocto/build/tmp/work/corei7-64-cube-linux/cifs-utils/6.13-r0/image/sbin &&
ln -sf mount.cifs mount.smb3)
| /bin/bash: line 0: cd:
/yocto/build/tmp/work/corei7-64-cube-linux/cifs-utils/6.13-r0/image/sbin:
No such file or directory

From Makefile.in
install-exec-hook: install-sbinPROGRAMS
        (cd $(DESTDIR)$(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)

In case we don't use usrmerge feature, shouldn't we create ${sbinbir} first=
?

Kind regards,
Vincent

Le jeu. 30 sept. 2021 =C3=A0 07:54, zhengruoqin <zhengrq.fnst@fujitsu.com> =
a
=C3=A9crit :

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  .../cifs/{cifs-utils_6.13.bb =3D> cifs-utils_6.14.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-support/cifs/{cifs-utils_6.13.bb =3D>
> cifs-utils_6.14.bb} (97%)
>
> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
> b/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
> similarity index 97%
> rename from meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
> rename to meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
> index a8d3e91ebb..5fafb4ef69 100644
> --- a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
> +++ b/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
> @@ -4,7 +4,7 @@ SECTION =3D "otherosfs"
>  LICENSE =3D "GPLv3 & LGPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>
> -SRCREV =3D "464a60344a324311a6f5bb326fdf5f422a3c9005"
> +SRCREV =3D "8c06dce7d596e478c20bc54bdcec87ad97f80a1b"
>  SRC_URI =3D "git://git.samba.org/cifs-utils.git"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93177):
> https://lists.openembedded.org/g/openembedded-devel/message/93177
> Mute This Topic: https://lists.openembedded.org/mt/85967489/3616779
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> vincent.prince.fr@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007d528005d6157996
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>Am I the only one with so=
me error on cifs-utils?</div><div><br></div><div>| (cd /yocto/build/tmp/wor=
k/corei7-64-cube-linux/cifs-utils/6.13-r0/image/sbin &amp;&amp; ln -sf moun=
t.cifs mount.smb3)<br>| /bin/bash: line 0: cd: /yocto/build/tmp/work/corei7=
-64-cube-linux/cifs-utils/6.13-r0/image/sbin: No such file or directory<br>=
</div><div><br></div><div>From Makefile.in</div><div>install-exec-hook: ins=
tall-sbinPROGRAMS<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd $(DESTDIR)$(ROOTSBINDI=
R) &amp;&amp; ln -sf mount.cifs mount.smb3)<br></div><div><br></div><div>In=
 case we don&#39;t use usrmerge=C2=A0feature, shouldn&#39;t we create ${sbi=
nbir} first?</div><div><br></div><div>Kind regards,</div><div>Vincent=C2=A0=
=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Le=C2=A0jeu. 30 sept. 2021 =C3=A0=C2=A007:54, zhengruoqin &lt;<=
a href=3D"mailto:zhengrq.fnst@fujitsu.com">zhengrq.fnst@fujitsu.com</a>&gt;=
 a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu=
.com" target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../cifs/{<a href=3D"http://cifs-utils_6.13.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">cifs-utils_6.13.bb</a> =3D&gt; <a href=3D"http://cifs-utils=
_6.14.bb" rel=3D"noreferrer" target=3D"_blank">cifs-utils_6.14.bb</a>}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-networking/recipes-support/cifs/{<a href=3D"http://cifs-u=
tils_6.13.bb" rel=3D"noreferrer" target=3D"_blank">cifs-utils_6.13.bb</a> =
=3D&gt; <a href=3D"http://cifs-utils_6.14.bb" rel=3D"noreferrer" target=3D"=
_blank">cifs-utils_6.14.bb</a>} (97%)<br>
<br>
diff --git a/meta-networking/recipes-support/cifs/<a href=3D"http://cifs-ut=
ils_6.13.bb" rel=3D"noreferrer" target=3D"_blank">cifs-utils_6.13.bb</a> b/=
meta-networking/recipes-support/cifs/<a href=3D"http://cifs-utils_6.14.bb" =
rel=3D"noreferrer" target=3D"_blank">cifs-utils_6.14.bb</a><br>
similarity index 97%<br>
rename from meta-networking/recipes-support/cifs/<a href=3D"http://cifs-uti=
ls_6.13.bb" rel=3D"noreferrer" target=3D"_blank">cifs-utils_6.13.bb</a><br>
rename to meta-networking/recipes-support/cifs/<a href=3D"http://cifs-utils=
_6.14.bb" rel=3D"noreferrer" target=3D"_blank">cifs-utils_6.14.bb</a><br>
index a8d3e91ebb..5fafb4ef69 100644<br>
--- a/meta-networking/recipes-support/cifs/<a href=3D"http://cifs-utils_6.1=
3.bb" rel=3D"noreferrer" target=3D"_blank">cifs-utils_6.13.bb</a><br>
+++ b/meta-networking/recipes-support/cifs/<a href=3D"http://cifs-utils_6.1=
4.bb" rel=3D"noreferrer" target=3D"_blank">cifs-utils_6.14.bb</a><br>
@@ -4,7 +4,7 @@ SECTION =3D &quot;otherosfs&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv3 &amp; LGPLv3&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e=
80d47fae504&quot;<br>
<br>
-SRCREV =3D &quot;464a60344a324311a6f5bb326fdf5f422a3c9005&quot;<br>
+SRCREV =3D &quot;8c06dce7d596e478c20bc54bdcec87ad97f80a1b&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.samba.org/cifs-utils.gi=
t" rel=3D"noreferrer" target=3D"_blank">git.samba.org/cifs-utils.git</a>&qu=
ot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93177): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93177" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93177</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85967489/3616=
779" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85967489/3616779</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:vincent.prince.fr@gmail.=
com" target=3D"_blank">vincent.prince.fr@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007d528005d6157996--


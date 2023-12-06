Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AD3C46CA0
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:33:38 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.34358.1701876816017609815
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 07:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQ1hospg;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b2e330033fso4192951b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 07:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701876815; x=1702481615; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L8wVP02N/0qcLHmDRKhC5IXdc/AFwBJEazmY8K39rmo=;
        b=TQ1hospgEsu7FP+NrdlTpiNlCnUD5jvVDjCMtrkgQ/jgDezR++OW+hvNUKteJCGDeD
         8OF6QGmVHB81TwLqFRlT0uGWTriSSyzvm9enSf7AgVI/P40mAgVOa4v5cbI8e7C0snki
         Uv2ezJtGeF9W14n+RoxA+il1lBP6RnX7kILsxqAejPuCz7yg9pQguzPPe7UX+lH0qJXF
         Czj5NL3w3t6hPky1Rteq/2vTGa4CMIPnRc6IhWnjx7QzDcpvZMXOLcyDZYLZPkRo0idz
         yVPVVQ2uJllJR4jDRewv57ZYgCw+YSxYHT7WWT0TKMlC2NTt9+afRyuY1pAVMkAFGZov
         +sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701876815; x=1702481615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8wVP02N/0qcLHmDRKhC5IXdc/AFwBJEazmY8K39rmo=;
        b=XjNcnnXa9VLETshEY4Fr59fA6yhGBOAP8DbfOEe/Id87VA4S+wo4Uk+nLWSV6af2Pc
         HA766CanY8dUcm4H3/0mRwaaP+unHaUnE5WbNKxhvlNx++94lQMcxRiM+x5E765lqnop
         ao9Q/87Sp/QJs0dPMbPY8Snc+NUxby0JfPiPIicFdxIFoI76CG6nfynpNQ0GeHqZa3u0
         twYXI/emikMMPaUVD3VeHlG7Kr/Qz51f9i8CYm1nrY3Oj+3DyIqJ1sjs4rK4icKxbcMy
         R0dJtF/PH/3TDbAIHBMvYFX9M62BfGgFEyAIUXxS4qn3uMb+GbAcelyEp53tqZ10rV1n
         rAaQ==
X-Gm-Message-State: AOJu0Yx53+q9j5ITDlXlcJQW8LJP7hJagWgOSCOVOGonSkD9HLc7TkJA
	pyP5nGLYx8Jfw5+LZWNrykj19Mt2MaT2XWOYeQM=
X-Google-Smtp-Source: AGHT+IHoqyAHLXv/BU9iQp7MVQetB14+n1GblflOvAQKy934OPLcRsX5nc95vxN34SQ7jmx7djO/1PzdVT6EaCXYOZw=
X-Received: by 2002:a05:6870:71d3:b0:1fa:fbef:1773 with SMTP id
 p19-20020a05687071d300b001fafbef1773mr1279745oag.52.1701876815139; Wed, 06
 Dec 2023 07:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20231206150753.396406-1-jan.vermaete@gmail.com>
In-Reply-To: <20231206150753.396406-1-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Dec 2023 07:33:24 -0800
Message-ID: <CAMKF1so3-oL4rcCO=g1inouOBGAPPKa4qKpCmkUMdqNrpyN=Rg@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] netdata: added Python as rdepends
To: Jan Vermaete <jan.vermaete@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000049867060bd91325"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 15:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107257

--000000000000049867060bd91325
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 7:08=E2=80=AFAM Jan Vermaete <jan.vermaete@gmail.com=
> wrote:

> Netdata has plugins.  Some of the written in Python.
>

Are these plugins required always to run main binaries from netdata if not
then maybe separate them out into package of their own and then redepend
that package on python


> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
> b/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
> index c56da3744..fc6d35505 100644
> --- a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
> +++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
> @@ -80,4 +80,4 @@ do_install:append() {
>
>  FILES:${PN} +=3D "${localstatedir}/cache/netdata/
> ${localstatedir}/lib/netdata/"
>
> -RDEPENDS:${PN} =3D "bash zlib"
> +RDEPENDS:${PN} =3D "bash python zlib"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107256):
> https://lists.openembedded.org/g/openembedded-devel/message/107256
> Mute This Topic: https://lists.openembedded.org/mt/103014256/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000049867060bd91325
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Dec 6, 2023 at 7:08=E2=80=AFAM Jan Vermaete &lt;<a =
href=3D"mailto:jan.vermaete@gmail.com">jan.vermaete@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Netdata has plugins.=C2=A0 Some o=
f the written in Python.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Are these plugin=
s required always to run main binaries from netdata if not then maybe separ=
ate them out into package of their own and then redepend that package on py=
thon</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Jan Vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.com" t=
arget=3D"_blank">jan.vermaete@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-webserver/recipes-webadmin/netdata/<a href=3D"http://netdata_1.4=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">netdata_1.43.2.bb</a> | 2 +-<b=
r>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-webserver/recipes-webadmin/netdata/<a href=3D"http://netd=
ata_1.43.2.bb" rel=3D"noreferrer" target=3D"_blank">netdata_1.43.2.bb</a> b=
/meta-webserver/recipes-webadmin/netdata/<a href=3D"http://netdata_1.43.2.b=
b" rel=3D"noreferrer" target=3D"_blank">netdata_1.43.2.bb</a><br>
index c56da3744..fc6d35505 100644<br>
--- a/meta-webserver/recipes-webadmin/netdata/<a href=3D"http://netdata_1.4=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">netdata_1.43.2.bb</a><br>
+++ b/meta-webserver/recipes-webadmin/netdata/<a href=3D"http://netdata_1.4=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">netdata_1.43.2.bb</a><br>
@@ -80,4 +80,4 @@ do_install:append() {<br>
<br>
=C2=A0FILES:${PN} +=3D &quot;${localstatedir}/cache/netdata/ ${localstatedi=
r}/lib/netdata/&quot;<br>
<br>
-RDEPENDS:${PN} =3D &quot;bash zlib&quot;<br>
+RDEPENDS:${PN} =3D &quot;bash python zlib&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107256): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107256" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107256</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103014256/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103014256/1997914</a><br>
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

--000000000000049867060bd91325--


Return-Path: <louis.rannou@semalibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3F3CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 14:50:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13827.1778165402871213231
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 07:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@semalibre.com header.s=dkim header.b=pvDHxUz+;
 spf=pass (domain: semalibre.com, ip: 185.246.84.56, mailfrom: louis.rannou@semalibre.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6AB551A356C;
	Thu,  7 May 2026 14:50:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 376C860495;
	Thu,  7 May 2026 14:50:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D006108194CA;
	Thu,  7 May 2026 16:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semalibre.com;
	s=dkim; t=1778165399;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-language:in-reply-to:references;
	bh=N/4B4hz9wBae423n+B/pC+WOuiflpDyn+15bY4KhFlE=;
	b=pvDHxUz+R0m67VSWb8M4XgNvrGXipVwrz7v3TtLH0DHS7sOv5s3JbjShSr3kv/84lkHE5z
	vNGBTY3tFGMiCMolo1VpU63yiidZqhUjfqeDidd6VcV8QK9+dx672h2opH6jhv8LtCdAvs
	iACHhhB8HVPa5ZJ0rubBfu7oUHX4XkMsm1/GUFi9eo3ycXvMdjZMeINe0dH5bwzkOZsZnr
	cSh0XQoVYxqBQlgv7eHrhaGiqeYvwuxk5lVLRQTLwDZanE88vEUs5dsi0UeWeZfyqCdRR7
	kGdxy0crMVn4Talz4zKj+o3iROKhZxZShSWhACviNPybL27glhemC6WVbopy/Q==
Content-Type: multipart/alternative;
 boundary="------------AOO4wHaDlsJi5fkZsYCQE6jO"
Message-ID: <801db7e6-604a-4965-a984-d3d2e5dce18d@semalibre.com>
Date: Thu, 7 May 2026 16:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] openvpn: change bash rdepends to
 rrecommends
To: Jose Quaresma <quaresma.jose@gmail.com>, skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
 Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
References: <20260506-bash-rr-v1-1-507ee57b7fe7@non.se.com>
 <4464a296-b5ef-46e4-a87d-90e9fcb29da3@gmail.com>
 <CANPvuRn42dyFcaDOhvjTQMkEEyumqaJ1YW3z7D=C_pviKAH_sQ@mail.gmail.com>
Content-Language: en-US
From: Louis Rannou <louis.rannou@semalibre.com>
In-Reply-To: <CANPvuRn42dyFcaDOhvjTQMkEEyumqaJ1YW3z7D=C_pviKAH_sQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 14:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126813

This is a multi-part message in MIME format.
--------------AOO4wHaDlsJi5fkZsYCQE6jO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable



On 5/7/26 10:46, Jose Quaresma wrote:
>
>
> Gyorgy Sarvari via lists.openembedded.org=20
> <http://lists.openembedded.org>=20
> <skandigraun=3Dgmail.com@lists.openembedded.org> escreveu (quinta,=20
> 7/05/2026 =C3=A0(s) 08:39):
>
>
>     On 5/6/26 18:07, Louis Rannou via lists.openembedded.org
>     <http://lists.openembedded.org> wrote:
>     > From: Louis Rannou <louis.rannou@non.se.com>
>     >
>     > The dependency to bash is only required for dns-updown scripts.
>     As bash is
>     > under the GPLv3 license, it might be preferred to exclude it.
>     >
>     > Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
>     > ---
>     >=C2=A0 meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
>     <http://openvpn_2.7.0.bb> | 2 +-
>     >=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>     >
>     > diff --git
>     a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
>     <http://openvpn_2.7.0.bb>
>     b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
>     <http://openvpn_2.7.0.bb>
>     > index 0cbe4641cd..d967a0dc12 100644
>     > --- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
>     <http://openvpn_2.7.0.bb>
>     > +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
>     <http://openvpn_2.7.0.bb>
>     > @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D
>     "--enable-iproute2,,iproute2,iproute2-ip"
>     >=C2=A0 PACKAGECONFIG[systemd] =3D
>     "--enable-systemd,--disable-systemd,systemd"
>     >=C2=A0 PACKAGECONFIG[selinux] =3D
>     "--enable-selinux,--disable-selinux,libselinux"
>     >
>     > -RDEPENDS:${PN}:append =3D " bash"
>     > +RRECOMMENDS:${PN}:append =3D " bash"
>
>
>     In case bash is excluded (with PACKAGE_EXCLUDE, INCOMPATIBLE_LICENS=
E,
>     BAD_RECOMMENDATIONS...) I would expect this change to throw an erro=
r
>     still, the latest during package QA, when it scans the scripts for
>     missing dependencies - because the dependency itself is still prese=
nt.
>     Does it not fail those checks?
>
That is correct. The check fails, I ignore how I missed that.

>
>     As an alternative, I wonder if it would make sense to install this
>     dns-updown script to a separate package, and make that depend on
>     bash only.
>
>
> A new package would be more appropriate.
> On the other hand, is bash really necessary? Sometimes it's just=20
> shaband that's wrong on script
> and POSIx /bin/sh can even be used.=C2=A0Could you try this?
That was also my first thought. The scripts are not POSIX compliant=20
unfortunately. It's quite sad as all older scripts used to be.

I'll send a v2 with a package openvpn-dns-updown. Do you think I should=20
add a rdepends between openvpn and this ? My first guess would be to not=20
take the dependency as the dns-updown scripts are recent.

Louis
--------------AOO4wHaDlsJi5fkZsYCQE6jO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 5/7/26 10:46, Jose Quaresma wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANPvuRn42dyFcaDOhvjTQMkEEyumqaJ1YW3z7D=3DC_pviKAH_sQ@mail.gm=
ail.com">
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">Gyorgy Sarvari via <a
              href=3D"http://lists.openembedded.org"
              moz-do-not-send=3D"true">lists.openembedded.org</a>
            &lt;skandigraun=3D<a
              href=3D"mailto:gmail.com@lists.openembedded.org"
              moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">gm=
ail.com@lists.openembedded.org</a>&gt;
            escreveu (quinta, 7/05/2026 =C3=A0(s) 08:39):<br>
          </div>
          <blockquote class=3D"gmail_quote"><br>
            On 5/6/26 18:07, Louis Rannou via <a
              href=3D"http://lists.openembedded.org" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">lists.openembedd=
ed.org</a>
            wrote:<br>
            &gt; From: Louis Rannou &lt;<a
              href=3D"mailto:louis.rannou@non.se.com" target=3D"_blank"
              moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">lo=
uis.rannou@non.se.com</a>&gt;<br>
            &gt; <br>
            &gt; The dependency to bash is only required for dns-updown
            scripts. As bash is<br>
            &gt; under the GPLv3 license, it might be preferred to
            exclude it.<br>
            &gt; <br>
            &gt; Signed-off-by: Louis Rannou &lt;<a
              href=3D"mailto:louis.rannou@non.se.com" target=3D"_blank"
              moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">lo=
uis.rannou@non.se.com</a>&gt;<br>
            &gt; ---<br>
            &gt;=C2=A0 meta-networking/recipes-support/openvpn/<a
              href=3D"http://openvpn_2.7.0.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">openvpn_2.7.0.bb=
</a>
            | 2 +-<br>
            &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
            &gt; <br>
            &gt; diff --git a/meta-networking/recipes-support/openvpn/<a
              href=3D"http://openvpn_2.7.0.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">openvpn_2.7.0.bb=
</a>
            b/meta-networking/recipes-support/openvpn/<a
              href=3D"http://openvpn_2.7.0.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">openvpn_2.7.0.bb=
</a><br>
            &gt; index 0cbe4641cd..d967a0dc12 100644<br>
            &gt; --- a/meta-networking/recipes-support/openvpn/<a
              href=3D"http://openvpn_2.7.0.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">openvpn_2.7.0.bb=
</a><br>
            &gt; +++ b/meta-networking/recipes-support/openvpn/<a
              href=3D"http://openvpn_2.7.0.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">openvpn_2.7.0.bb=
</a><br>
            &gt; @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D
            "--enable-iproute2,,iproute2,iproute2-ip"<br>
            &gt;=C2=A0 PACKAGECONFIG[systemd] =3D
            "--enable-systemd,--disable-systemd,systemd"<br>
            &gt;=C2=A0 PACKAGECONFIG[selinux] =3D
            "--enable-selinux,--disable-selinux,libselinux"<br>
            &gt;=C2=A0 <br>
            &gt; -RDEPENDS:${PN}:append =3D " bash"<br>
            &gt; +RRECOMMENDS:${PN}:append =3D " bash"<br>
            <br>
            <br>
            In case bash is excluded (with PACKAGE_EXCLUDE,
            INCOMPATIBLE_LICENSE,<br>
            BAD_RECOMMENDATIONS...) I would expect this change to throw
            an error<br>
            still, the latest during package QA, when it scans the
            scripts for<br>
            missing dependencies - because the dependency itself is
            still present.<br>
            Does it not fail those checks?<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    That is correct. The check fails, I ignore how I missed that.=C2=A0<b=
r>
    <br>
    <blockquote type=3D"cite"
cite=3D"mid:CANPvuRn42dyFcaDOhvjTQMkEEyumqaJ1YW3z7D=3DC_pviKAH_sQ@mail.gm=
ail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote gmail_quote_container">
          <blockquote class=3D"gmail_quote"><br>
            As an alternative, I wonder if it would make sense to
            install this<br>
            dns-updown script to a separate package, and make that
            depend on bash only.<br>
          </blockquote>
          <div><br>
          </div>
          <div>A new package would be more appropriate.</div>
          <div>On the other hand, is bash really necessary? Sometimes
            it's just shaband that's wrong on script</div>
          <div>and POSIx /bin/sh can even be used.=C2=A0Could you try thi=
s?</div>
        </div>
      </div>
    </blockquote>
    That was also my first thought. The scripts are not POSIX compliant
    unfortunately. It's quite sad as all older scripts used to be.<br>
    <br>
    I'll send a v2 with a package openvpn-dns-updown. Do you think I
    should add a rdepends between openvpn and this ? My first guess
    would be to not take the dependency as the dns-updown scripts are
    recent.<br>
    <br>
    Louis
  </body>
</html>

--------------AOO4wHaDlsJi5fkZsYCQE6jO--


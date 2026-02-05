Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C216BEA7969
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 04:53:37 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14006.1770267210964362341
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 20:53:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8Ir2EiF;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-794baacdefcso4972567b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 20:53:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770267210; cv=none;
        d=google.com; s=arc-20240605;
        b=ZpMcFARnsYE0G9cNMtSec1jpa+KNov95LKaj6GykEGG6oLqxeDBIkfPCWZ5NTs+9Y8
         f2Cey6Ux+jrFDfh/LI6kh44XxlwOWWyzUsehFxKdw7tcSS/oBdYeZ7g+gPr3nzlK9/g7
         lo6pjP8FdOKxE329PNi+pWKO+8o+s69vBjWNQFXy9wylkq8vIRlObYFrDu1hZwKz8fOa
         5eJ7bNZ/1/LTxShIbX7buky00vCXpTE2zX5Y97buJ1EYWdQw4QIKEeXyugTjjilwbcc+
         mM8ZYHpdaJLwK4zDGnnRXbgAABJH2UPRgoUk0f7TaNnJYkRUpr88BfeWFtvHfb8vQaMN
         khHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d3EZnR0tftgx16g4qGFqN81lnlpv1XmeNqA9rweuIrg=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=G4y9GfUN2lb5R0gVCteF6027Nao2Wq2YQ7+TWxGwfdYJkVUGZ9DHiiWsTwwMxfjRYv
         4xc90UPcIsD6/dP92uYBeAv/5mf3takI7Z77HTC6EMebgzrFOI3xrgnh7SqRuAlYJKD1
         l0HiPf49uUSvCV4Op0nRGQyWdkPtY/k+QO0dHjkjP3f1WSY/otzemJtqQ22tRcYN+Llk
         12Xh4BQOTKeEgaWuZqY5FLL1/EMZY++25hEWJjBHeJYe2GVGam5X7Hmgm1VVeA/ZFwUS
         SnhiG6+QgBvcn1KgNtxLMoS6D/HF/HijBZXCNqlDKX/SVJp0W7k3R6cgUGlvzRdCQ6TM
         wf+g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770267210; x=1770872010; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d3EZnR0tftgx16g4qGFqN81lnlpv1XmeNqA9rweuIrg=;
        b=W8Ir2EiFsO8yu5ofXwCudRko/q0/NJpGqtWSHQtLRdmNyMbDVt8Oc8RYKVViwpqrxW
         6sauCKFt2mngz5b4htUNVnra/XeL2QQwlvHdMbGHr1UUw9CLLmkmCqLohX+skjwNpUIg
         jHC+8gVNnbWBtVI1ZzVG6a24F3lNT/RSVbz6xP0Hx1msxiUWxcDT3358Xz0+zJlHap0I
         lIOutczMyRbpUA86NbwRTB8/b03ET4ono8F6YWCQdw/OKdM4sH+W0w344+2WNLELbUrp
         lyvATEf7lmRKC3bduHAeoKGqXYsZxXBKq89wVxPP8pTsiuC7TDnuUY1PyiqerSlo2XWg
         ebdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770267210; x=1770872010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3EZnR0tftgx16g4qGFqN81lnlpv1XmeNqA9rweuIrg=;
        b=nPBQzM9KWf/5f/cpIz7WBYr1kUl6F+wQGqEp28a7YBakUCeCjBR6LaRqKn7wOCDfuc
         HU82bZSTKJ0ZM9RoY+o2V/dDgSwowg3NPJACzPtzgtQ/jMvEDWmjjrjpbRKybONOH5c4
         cJyxtmiB0WCAaUxs3moICehbTpMoKRLOLorGlgvPMQTW2iXKP3wh9y6+fnuey3A//U1K
         jjeIrtPqjQPfdEUNBH5XMUVCob98r/Qkq4df9LIRO9TntUZe4EOWFBCzqxWIoRXVJ5sL
         +1D84tcZaVRJ1FyCoYJt6oxzNannw9nCpdgwFDF0EGMtv9thGy6DoOqiqHqniCbGZFJ6
         qprA==
X-Gm-Message-State: AOJu0YxnGh06VrOaRB7kYcafY2oAytQjLsmDM5wQJ32Z4RI5/LOjP44b
	oK3w0LHnPGWroe/ARI+2a0HeWqqV5bz4TxaaC74p20Ur3WM02kafagg5suzyOO3LeSDPXEO9NQ+
	HseLOzb3djTIXPmWaJ1zp/qKPJunse7w=
X-Gm-Gg: AZuq6aLW0IqUB2ckEV15AqeIgTxhqnOjf1sxt9HyXqN910MnURFkMGzw4qDkU0uHzhf
	ZDmfMDlxuP0WTUsmkL29H/Aav+W97xHVlz1ius6g9YuVkgn4glQM4g+acq5HX3oWlKsvC0+IINl
	Jz1CpTZGnC+GkvOVnUaQnjUIDOZD+gOZNC1QU7V4NBdeld9durqjJtEZb6EUdtH3oSQ7dpUkA8+
	dOjnxhpm7QlIoVwNSD8ofHKzm/OkpBWeBGea7joL1pPbpo51mCvc2R3Ki8RZAiqqMvhyqlZI25D
	L0NwdlrLpmJXiiO7tw/CbU6H3d905G/4axghx1L4Gu/amSNIj3UMXpqzdtstoi0r903AQe26dwp
	shKq/dhM+3SfPKDSIJTOECA==
X-Received: by 2002:a05:690c:4612:b0:794:c74c:afbf with SMTP id
 00721157ae682-794fe8428fdmr69846387b3.70.1770267209986; Wed, 04 Feb 2026
 20:53:29 -0800 (PST)
MIME-Version: 1.0
References: <20260204030503.1625693-1-skandigraun@gmail.com>
In-Reply-To: <20260204030503.1625693-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Feb 2026 20:53:02 -0800
X-Gm-Features: AZwV_QgB4rhSLVsi4KE1U3FimFfQJe8JaU3RE4mJW26q51CEYFaq5rRwwg5G9g0
Message-ID: <CAMKF1spqtXgad06k0iXHjp3-0mAk7yPgf0=73bSBhZE=jMHsAQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] freerdp3: upgrade 3.20.2 -> 3.22.0
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000357761064a0c748a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 04:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124151

--000000000000357761064a0c748a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

does this also solve configure issue seen here

https://gist.github.com/kraj/bda86016e7b8fc60f5fead5ee3dc9696

On Tue, Feb 3, 2026 at 7:05=E2=80=AFPM Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Ptests passed successfully.
>
> Dropped manpages PACKAGECONFIG: when it is enabled, it requires an
> executable that
> is compiled from the project's source, but since it is cross-compiled, it
> is not
> usable. The cmakefile also started to explicitly disable generating this
> tool
> when cross-compiling is enabled.
> Since this recipe has no native counterpart, and the manpages can't be
> generated
> in this state, this option was removed.
>
> Changes:
> 3.22.0:
> - Complete overhaul of SDL client
> - Introduction of new WINPR_ATTR_NODISCARD macro wrapping compiler or C
> language
>   version specific [[nodiscard]] attributes
> - Addition of WINPR_ATTR_NODISCARD to (some) public API functions so usag=
e
> errors
>   are producing warnings now
> - Add some more stringify functions for logging
> - CVE fixes: CVE-2026-23948, CVE-2026-24682, CVE-2026-24683,
> CVE-2026-24676,
>   CVE-2026-24677, CVE-2026-24678, CVE-2026-24684, CVE-2026-24679,
>   CVE-2026-24681, CVE-2026-24675, CVE-2026-24491, CVE-2026-24680
> - [core,info] fix missing NULL check
> - [gateway,tsg] fix TSG_PACKET_RESPONSE parsing
> - Allow querying auth identity with kerberos when running as a server
> - Sspi krb heimdal
> - Tsg fix idleTimeout parsing
> - [channels,smartcard] revert 649f7de
> - [crypto] deprecate er and der modules
> - [channels,rdpei] lock full update, not only parts
> - [winpr,platform] add WINPR_ATTR_NODISCARD macro
> - Wlog cleanup
> - new stringify functions & touch API defines
> - Add support for querying SECPKG_ATTR_PACKAGE_INFO to NTLM and Kerberos
> - [channels,video] measure times in ns
> - [utils] Nodiscard
> - Error handling fixes
> - [channels,drdynvc] check pointer before reset
> - Winpr api def
> - [winpr,platform] drop C23 [[nodiscard]]
> - [gdi] add additional checks for a valid rdpGdi
> - Sdl3 high dpiv2
> - peer: Disconnect if Logon() returned FALSE
> - [channels,rdpecam] fix PROPERTY_DESCRIPTION parsing
> - [channel,rdpsnd] only clean up thread before free
> - [channels,rdpei] add RDPINPUT_CONTACT_FLAG_UP
>
> 3.21.0:
> - CVE fixes: CVE-2026-23530, CVE-2026-23531, CVE-2026-23532,
> CVE-2026-23533,
>   CVE-2026-23534, CVE-2026-23732, CVE-2026-23883, CVE-2026-23884
> - [client,sdl] fix monitor resolution
> - [codec,progressive] fix progressive_rfx_upgrade_block
> - Krb cache fix
> - Rdpdr improved checks
> - Codec advanced length checks
> - Glyph fix length checks
> - Wlog printf format string checks
> - [warnings,format] fix format string warnings
> - Double free fixes
> - [clang-tidy] clean up code warnings
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>
> v2: add -DWITH_MANPAGES=3DOFF to EXTRA_OECMAKE
>
>  .../freerdp/{freerdp3_3.20.2.bb =3D> freerdp3_3.22.0.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/freerdp/{freerdp3_3.20.2.bb =3D>
> freerdp3_3.22.0.bb} (97%)
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
> b/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
> similarity index 97%
> rename from meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
> rename to meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
> index 81f160a848..c182ee1339 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
> @@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest +=3D "cmake coreutils"
>
>  inherit pkgconfig cmake ptest
>
> -SRCREV =3D "ef106b0c5adf739085ff4e8f45ef384e5a1c7bb3"
> +SRCREV =3D "e3ef4c71138f76516299cb3637d2d0c59b2a3737"
>  SRC_URI =3D "git://
> github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;tag=3D${P=
V}
> <http://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dhttps;t=
ag=3D$%7BPV%7D>
> \
>             file://run-ptest"
>
> @@ -38,6 +38,7 @@ EXTRA_OECMAKE =3D " \
>      -DWITH_CLIENT_SDL=3DOFF \
>      -DWITH_SAMPLE=3DOFF \
>      -DWITH_CAIRO=3DON \
> +    -DWITH_MANPAGES=3DOFF \
>   "
>
>  X11_DEPS =3D "virtual/libx11 libxinerama libxext libxcursor libxv libxi
> libxrender libxfixes libxdamage libxrandr libxkbfile"
> @@ -49,7 +50,6 @@ PACKAGECONFIG[gstreamer] =3D
> "-DWITH_GSTREAMER_1_0=3DON,-DWITH_GSTREAMER_1_0=3DOFF,gst
>  PACKAGECONFIG[cups] =3D "-DWITH_CUPS=3DON,-DWITH_CUPS=3DOFF,cups"
>  PACKAGECONFIG[fuse] =3D "-DWITH_FUSE=3DON,-DWITH_FUSE=3DOFF,fuse3,fuse3"
>  PACKAGECONFIG[pcsc] =3D "-DWITH_PCSC=3DON,-DWITH_PCSC=3DOFF,pcsc-lite"
> -PACKAGECONFIG[manpages] =3D "-DWITH_MANPAGES=3DON,-DWITH_MANPAGES=3DOFF,
> libxslt-native docbook-xsl-stylesheets-native"
>  PACKAGECONFIG[ffmpeg] =3D "-DWITH_DSP_FFMPEG=3DON -DWITH_FFMPEG=3DON
> -DWITH_SWSCALE=3DON, -DWITH_DSP_FFMPEG=3DOFF -DWITH_FFMPEG=3DOFF
> -DWITH_SWSCALE=3DOFF,ffmpeg"
>  PACKAGECONFIG[krb5] =3D "-DWITH_KRB5=3DON
> -DWITH_KRB5_NO_NTLM_FALLBACK=3DOFF,-DWITH_KRB5=3DOFF,krb5"
>  PACKAGECONFIG[openh264] =3D
> "-DWITH_OPENH264=3DON,-DWITH_OPENH264=3DOFF,openh264"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124119):
> https://lists.openembedded.org/g/openembedded-devel/message/124119
> Mute This Topic: https://lists.openembedded.org/mt/117628610/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000357761064a0c748a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">does this also solve configure issue seen here=C2=A0<div><=
br></div><div><a href=3D"https://gist.github.com/kraj/bda86016e7b8fc60f5fea=
d5ee3dc9696">https://gist.github.com/kraj/bda86016e7b8fc60f5fead5ee3dc9696<=
/a></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Feb 3, 2026 at 7:05=E2=80=AFPM Gyorg=
y Sarvari via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.or=
g">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Ptests passed successfully.<br>
<br>
Dropped manpages PACKAGECONFIG: when it is enabled, it requires an executab=
le that<br>
is compiled from the project&#39;s source, but since it is cross-compiled, =
it is not<br>
usable. The cmakefile also started to explicitly disable generating this to=
ol<br>
when cross-compiling is enabled.<br>
Since this recipe has no native counterpart, and the manpages can&#39;t be =
generated<br>
in this state, this option was removed.<br>
<br>
Changes:<br>
3.22.0:<br>
- Complete overhaul of SDL client<br>
- Introduction of new WINPR_ATTR_NODISCARD macro wrapping compiler or C lan=
guage<br>
=C2=A0 version specific [[nodiscard]] attributes<br>
- Addition of WINPR_ATTR_NODISCARD to (some) public API functions so usage =
errors<br>
=C2=A0 are producing warnings now<br>
- Add some more stringify functions for logging<br>
- CVE fixes: CVE-2026-23948, CVE-2026-24682, CVE-2026-24683, CVE-2026-24676=
,<br>
=C2=A0 CVE-2026-24677, CVE-2026-24678, CVE-2026-24684, CVE-2026-24679,<br>
=C2=A0 CVE-2026-24681, CVE-2026-24675, CVE-2026-24491, CVE-2026-24680<br>
- [core,info] fix missing NULL check<br>
- [gateway,tsg] fix TSG_PACKET_RESPONSE parsing<br>
- Allow querying auth identity with kerberos when running as a server<br>
- Sspi krb heimdal<br>
- Tsg fix idleTimeout parsing<br>
- [channels,smartcard] revert 649f7de<br>
- [crypto] deprecate er and der modules<br>
- [channels,rdpei] lock full update, not only parts<br>
- [winpr,platform] add WINPR_ATTR_NODISCARD macro<br>
- Wlog cleanup<br>
- new stringify functions &amp; touch API defines<br>
- Add support for querying SECPKG_ATTR_PACKAGE_INFO to NTLM and Kerberos<br=
>
- [channels,video] measure times in ns<br>
- [utils] Nodiscard<br>
- Error handling fixes<br>
- [channels,drdynvc] check pointer before reset<br>
- Winpr api def<br>
- [winpr,platform] drop C23 [[nodiscard]]<br>
- [gdi] add additional checks for a valid rdpGdi<br>
- Sdl3 high dpiv2<br>
- peer: Disconnect if Logon() returned FALSE<br>
- [channels,rdpecam] fix PROPERTY_DESCRIPTION parsing<br>
- [channel,rdpsnd] only clean up thread before free<br>
- [channels,rdpei] add RDPINPUT_CONTACT_FLAG_UP<br>
<br>
3.21.0:<br>
- CVE fixes: CVE-2026-23530, CVE-2026-23531, CVE-2026-23532, CVE-2026-23533=
,<br>
=C2=A0 CVE-2026-23534, CVE-2026-23732, CVE-2026-23883, CVE-2026-23884<br>
- [client,sdl] fix monitor resolution<br>
- [codec,progressive] fix progressive_rfx_upgrade_block<br>
- Krb cache fix<br>
- Rdpdr improved checks<br>
- Codec advanced length checks<br>
- Glyph fix length checks<br>
- Wlog printf format string checks<br>
- [warnings,format] fix format string warnings<br>
- Double free fixes<br>
- [clang-tidy] clean up code warnings<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
<br>
v2: add -DWITH_MANPAGES=3DOFF to EXTRA_OECMAKE<br>
<br>
=C2=A0.../freerdp/{<a href=3D"http://freerdp3_3.20.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">freerdp3_3.20.2.bb</a> =3D&gt; <a href=3D"http://freerdp=
3_3.22.0.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.22.0.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/freerdp/{<a href=3D"http://freerdp3_3.=
20.2.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.20.2.bb</a> =3D&gt=
; <a href=3D"http://freerdp3_3.22.0.bb" rel=3D"noreferrer" target=3D"_blank=
">freerdp3_3.22.0.bb</a>} (97%)<br>
<br>
diff --git a/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp3_3.2=
0.2.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.20.2.bb</a> b/meta-=
oe/recipes-support/freerdp/<a href=3D"http://freerdp3_3.22.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">freerdp3_3.22.0.bb</a><br>
similarity index 97%<br>
rename from meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp3_3.20=
.2.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.20.2.bb</a><br>
rename to meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp3_3.22.0=
.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.22.0.bb</a><br>
index 81f160a848..c182ee1339 100644<br>
--- a/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp3_3.20.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">freerdp3_3.20.2.bb</a><br>
+++ b/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp3_3.22.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">freerdp3_3.22.0.bb</a><br>
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest +=3D &quot;cmake coreutils&quot;<br>
<br>
=C2=A0inherit pkgconfig cmake ptest<br>
<br>
-SRCREV =3D &quot;ef106b0c5adf739085ff4e8f45ef384e5a1c7bb3&quot;<br>
+SRCREV =3D &quot;e3ef4c71138f76516299cb3637d2d0c59b2a3737&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/FreeRDP/FreeRDP.=
git;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=3Dh=
ttps;tag=3D${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest&quot;<br>
<br>
@@ -38,6 +38,7 @@ EXTRA_OECMAKE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-DWITH_CLIENT_SDL=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DWITH_SAMPLE=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DWITH_CAIRO=3DON \<br>
+=C2=A0 =C2=A0 -DWITH_MANPAGES=3DOFF \<br>
=C2=A0 &quot;<br>
<br>
=C2=A0X11_DEPS =3D &quot;virtual/libx11 libxinerama libxext libxcursor libx=
v libxi libxrender libxfixes libxdamage libxrandr libxkbfile&quot;<br>
@@ -49,7 +50,6 @@ PACKAGECONFIG[gstreamer] =3D &quot;-DWITH_GSTREAMER_1_0=
=3DON,-DWITH_GSTREAMER_1_0=3DOFF,gst<br>
=C2=A0PACKAGECONFIG[cups] =3D &quot;-DWITH_CUPS=3DON,-DWITH_CUPS=3DOFF,cups=
&quot;<br>
=C2=A0PACKAGECONFIG[fuse] =3D &quot;-DWITH_FUSE=3DON,-DWITH_FUSE=3DOFF,fuse=
3,fuse3&quot;<br>
=C2=A0PACKAGECONFIG[pcsc] =3D &quot;-DWITH_PCSC=3DON,-DWITH_PCSC=3DOFF,pcsc=
-lite&quot;<br>
-PACKAGECONFIG[manpages] =3D &quot;-DWITH_MANPAGES=3DON,-DWITH_MANPAGES=3DO=
FF, libxslt-native docbook-xsl-stylesheets-native&quot;<br>
=C2=A0PACKAGECONFIG[ffmpeg] =3D &quot;-DWITH_DSP_FFMPEG=3DON -DWITH_FFMPEG=
=3DON -DWITH_SWSCALE=3DON, -DWITH_DSP_FFMPEG=3DOFF -DWITH_FFMPEG=3DOFF -DWI=
TH_SWSCALE=3DOFF,ffmpeg&quot;<br>
=C2=A0PACKAGECONFIG[krb5] =3D &quot;-DWITH_KRB5=3DON -DWITH_KRB5_NO_NTLM_FA=
LLBACK=3DOFF,-DWITH_KRB5=3DOFF,krb5&quot;<br>
=C2=A0PACKAGECONFIG[openh264] =3D &quot;-DWITH_OPENH264=3DON,-DWITH_OPENH26=
4=3DOFF,openh264&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124119): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124119" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124119</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117628610/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117628610/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000357761064a0c748a--


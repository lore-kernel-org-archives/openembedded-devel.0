Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF90C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 18:20:30 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.825.1668795624348047440
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 10:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KoI3Cj7g;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x2so8304657edd.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 10:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qj2rHMBt1x05athU74nRRs53v9RhEo13bpbkC6ItIto=;
        b=KoI3Cj7gg+7FCnM3ubv4cBe6h3J2uUFVV6AnRNIkR1bOyhAILwM9q+gNyHafxiz1G4
         flBOLf4qT1WKCZm9/wZr6o6S4jbKisdpbaSp3TWOFZWCc1wMD0tKx3hT4J0B2yfq+II1
         KIjKoeeQSguXJpP4jtvSJKFHh9f5fVBOSGK45pHe/6wlIMNqYUOn8tOtlUU075rzutTT
         LSoKRAP28Ri6BS/wdGYGl/q/70oAQGom+78WMQm0Rk89pYAePGATSuQDGaHrTsn41tTm
         9rPWySBOSXR5s49rQ2+v9GhVziKtjg4oRa6wy11XJA4iTQDGmzp+IJf3phRZCB3VRPBV
         Sg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qj2rHMBt1x05athU74nRRs53v9RhEo13bpbkC6ItIto=;
        b=rZNctE/ttm6Amjh3f3+ny59zxC201sgGaUonNLfoqnOJkJjtcBvBe/x74QyrPdyPMa
         Dr9nVV89veLI7ExmYGAQNaynpPo8UCnl1aV6XSgeOQGoShWQlOxnedE2MP/qJbWncEC+
         jEs3FMf1BwsVccmOb9vIkj3eRBFHDPgQtvTbhyrVanDhKaCZih6Oe55neZMduMUmgdlV
         SIUHsMs2yp0kC7Lsp8Chn9uruSDeFnRR+m6mCumbJbQDGhwFzn4aJ07IN7OyKmOtqyia
         lAQ65GsUu5Pg7e1uFluv8RPsKKOs3OGnnXcVEVPbp5R3x/fQ2SLGROJAuN4vszSyewSD
         WWNA==
X-Gm-Message-State: ANoB5pmGavfUhJJ3a/cYYccReqRopJiI7w6G8rShbML+WW4zMRQNnw9k
	n9Qvss1YD1jCmtYbMvuKCKjmiexZCNEXS91e7GU=
X-Google-Smtp-Source: AA0mqf4COUH5n1+xkhHIwE1a6j2dmyna0rNJJPv+7DySGhyzFa7hULdMax2JU4ZQZwCKL1rarOHY+gPKKfD+ZY+Yi3U=
X-Received: by 2002:a50:bb08:0:b0:469:1684:217d with SMTP id
 y8-20020a50bb08000000b004691684217dmr2921288ede.270.1668795622516; Fri, 18
 Nov 2022 10:20:22 -0800 (PST)
MIME-Version: 1.0
References: <17283AC183E85183.19660@lists.openembedded.org>
In-Reply-To: <17283AC183E85183.19660@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 18 Nov 2022 10:20:11 -0800
Message-ID: <CANx9H-B=VEQSrUsdWjNK9YkN-fO54snSiPM55c66Zy2_rsyfqw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libio-pty-perl: upgrade 1.16 -> 1.17;
 enable ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>, ticotimo@gmail.com
Content-Type: multipart/alternative; boundary="000000000000486ce705edc2c254"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 18:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99612

--000000000000486ce705edc2c254
Content-Type: text/plain; charset="UTF-8"

Ping. I think this one missed getting pulled in.

On Wed, Nov 16, 2022 at 5:24 PM Tim Orling via lists.openembedded.org
<ticotimo=gmail.com@lists.openembedded.org> wrote:

> * Fix RDEPENDS for a minimal image
> * Inherit ptest-perl and add RDEPENDS
>
> 1.17 2022-11-11 Todd Rinaldo <toddr@cpan.org>
>     * Switch changelog entries to metacpan friendly format
>     * #29 - Fix printf format conversion specifiers in croak to support
> size_t on all platforms
>     * #11,#30 - Tty.pm: pre-allocate buffer for ioctl but leave it length 0
>     * #28 - Use $arg to match @ARGV in Makefile.PL
>
> https://metacpan.org/release/TODDR/IO-Tty-1.17
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  ...o-pty-perl_1.16.bb => libio-pty-perl_1.17.bb} | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/perl/{libio-pty-perl_1.16.bb =>
> libio-pty-perl_1.17.bb} (60%)
>
> diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
> b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
> similarity index 60%
> rename from meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
> rename to meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
> index 0f1c71b70c..684788f199 100644
> --- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
> +++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
> @@ -7,12 +7,22 @@ SRC_URI = "
> http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz \
>             file://0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch \
>             "
>
> -SRC_URI[md5sum] = "5ee30bf7c76f00cc69f92388ad776e2a"
> -SRC_URI[sha256sum] =
> "8f1a09c070738adc695df903f2e7f74308dd8d991b914c0bc390a0e6021294dd"
> +SRC_URI[sha256sum] =
> "a5f1a83020bc5b5dd6c1b570f48c7546e0a8f7fac10a068740b03925ad9e14e8"
>
>  S = "${WORKDIR}/IO-Tty-${PV}"
>
> -inherit cpan
> +inherit cpan ptest-perl
> +
> +RDEPENDS:${PN} += "\
> +    perl-module-carp \
> +    perl-module-exporter \
> +    perl-module-io-handle \
> +    perl-module-posix \
> +"
> +
> +RDEPENDS:${PN}-ptest += "\
> +    perl-module-test-more \
> +"
>
>  FILES:${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/IO/Tty/.debug/"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99601):
> https://lists.openembedded.org/g/openembedded-devel/message/99601
> Mute This Topic: https://lists.openembedded.org/mt/95081317/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000486ce705edc2c254
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div>Ping. I think this one missed getti=
ng pulled in.<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Nov 16, 2022 at 5:24 PM Tim Orling via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;ticotimo=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">* Fix RDEPENDS for a minimal image<br>
* Inherit ptest-perl and add RDEPENDS<br>
<br>
1.17 2022-11-11 Todd Rinaldo &lt;<a href=3D"mailto:toddr@cpan.org" target=
=3D"_blank">toddr@cpan.org</a>&gt;<br>
=C2=A0 =C2=A0 * Switch changelog entries to metacpan friendly format<br>
=C2=A0 =C2=A0 * #29 - Fix printf format conversion specifiers in croak to s=
upport size_t on all platforms<br>
=C2=A0 =C2=A0 * #11,#30 - Tty.pm: pre-allocate buffer for ioctl but leave i=
t length 0<br>
=C2=A0 =C2=A0 * #28 - Use $arg to match @ARGV in Makefile.PL<br>
<br>
<a href=3D"https://metacpan.org/release/TODDR/IO-Tty-1.17" rel=3D"noreferre=
r" target=3D"_blank">https://metacpan.org/release/TODDR/IO-Tty-1.17</a><br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://o-pty-perl_1.16.bb" rel=3D"noreferrer" target=3D=
"_blank">o-pty-perl_1.16.bb</a> =3D&gt; <a href=3D"http://libio-pty-perl_1.=
17.bb" rel=3D"noreferrer" target=3D"_blank">libio-pty-perl_1.17.bb</a>} | 1=
6 +++++++++++++---<br>
=C2=A01 file changed, 13 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-oe/recipes-devtools/perl/{<a href=3D"http://libio-pty-per=
l_1.16.bb" rel=3D"noreferrer" target=3D"_blank">libio-pty-perl_1.16.bb</a> =
=3D&gt; <a href=3D"http://libio-pty-perl_1.17.bb" rel=3D"noreferrer" target=
=3D"_blank">libio-pty-perl_1.17.bb</a>} (60%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/perl/<a href=3D"http://libio-pty-perl=
_1.16.bb" rel=3D"noreferrer" target=3D"_blank">libio-pty-perl_1.16.bb</a> b=
/meta-oe/recipes-devtools/perl/<a href=3D"http://libio-pty-perl_1.17.bb" re=
l=3D"noreferrer" target=3D"_blank">libio-pty-perl_1.17.bb</a><br>
similarity index 60%<br>
rename from meta-oe/recipes-devtools/perl/<a href=3D"http://libio-pty-perl_=
1.16.bb" rel=3D"noreferrer" target=3D"_blank">libio-pty-perl_1.16.bb</a><br=
>
rename to meta-oe/recipes-devtools/perl/<a href=3D"http://libio-pty-perl_1.=
17.bb" rel=3D"noreferrer" target=3D"_blank">libio-pty-perl_1.17.bb</a><br>
index 0f1c71b70c..684788f199 100644<br>
--- a/meta-oe/recipes-devtools/perl/<a href=3D"http://libio-pty-perl_1.16.b=
b" rel=3D"noreferrer" target=3D"_blank">libio-pty-perl_1.16.bb</a><br>
+++ b/meta-oe/recipes-devtools/perl/<a href=3D"http://libio-pty-perl_1.17.b=
b" rel=3D"noreferrer" target=3D"_blank">libio-pty-perl_1.17.bb</a><br>
@@ -7,12 +7,22 @@ SRC_URI =3D &quot;<a href=3D"http://www.cpan.org/modules/=
by-module/IO/IO-Tty-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Tty.xs-Do-not-mark-st=
rlcpy-as-static.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;5ee30bf7c76f00cc69f92388ad776e2a&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8f1a09c070738adc695df903f2e7f74308dd8d991b914=
c0bc390a0e6021294dd&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a5f1a83020bc5b5dd6c1b570f48c7546e0a8f7fac10a0=
68740b03925ad9e14e8&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/IO-Tty-${PV}&quot;<br>
<br>
-inherit cpan<br>
+inherit cpan ptest-perl<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 perl-module-carp \<br>
+=C2=A0 =C2=A0 perl-module-exporter \<br>
+=C2=A0 =C2=A0 perl-module-io-handle \<br>
+=C2=A0 =C2=A0 perl-module-posix \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot;\<br>
+=C2=A0 =C2=A0 perl-module-test-more \<br>
+&quot;<br>
<br>
=C2=A0FILES:${PN}-dbg +=3D &quot;${libdir}/perl/vendor_perl/*/auto/IO/Tty/.=
debug/&quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99601): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99601" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99601</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95081317/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
95081317/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000486ce705edc2c254--


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6B4CD6E56
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 09:53:56 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4517.1780221226501106757
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2026 02:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YDfCgfeQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccf6a63a45so13099156d6.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2026 02:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780221225; cv=none;
        d=google.com; s=arc-20240605;
        b=J3j5BYg5wjHKRI9r0eQUuavwmR0WFpfvGR6LCRm6hU7Lv3xVtcFLmnQQzVIY83s1bk
         kf3fxZcTm0R+Xv3Rz9SCMV1+L0NlTT5QbPP6eAE7ZXbuR6HmItAKTgW3LUSH/ZTXl5RI
         An7IyfbklWDBaDXYw6EqL+5QoBu1JjnsWO1MipLrxeWEhPAwZlKnVZoBhoFHPyiDVAmY
         cMdOlMDzIFvw1klXjS+j+KYJejXYit6oC74UHCOvZp9jrulckNXR33rlPKtJKTnFABQA
         QK8Gv0HVbvpLA11c/xdIU7+svHkjSvixJI0yeEqXaQZvqzGxenB1y0qai8LmIDeqdk2h
         HVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qi5PcMxnokQvdhjs4Ll1gsC8JURcPToXFjWD72cOGMk=;
        fh=a51YKbcHr/o3aEwkHFF5yF567ifSC9pRPPDUBAqvpS0=;
        b=DQXmhC86YunHdpTZ0H/YWLIDyTyE2Iq7UyA0tjMjDxJXywfr0HohzdgWwfcNHkDTls
         f00Bt3bKl7ITNF4iuwqTmw2Q8QX7OCmVSbOhq5BVfsY5eVQ0KnPDL1bM/CghyZqtuOyr
         cWTFGeA4fTSkexbw+hfPGIo3OVqnt8lMivipeTDYY8vxBCLtTTDuMQS6jMkumShmtSVR
         IjXfGTLpmNizjER6iw6dQSbLqX8XukGMznO1KlbmuODA0zzPKc0omPW7/sKlmcsnEyNW
         y+hY57y2TSJeVwnHZ+yxJnDPbN5FQMicARcEm3TuxzFuJsxzIVbn9QS73S1n63lA8+HA
         ChOQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780221225; x=1780826025; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qi5PcMxnokQvdhjs4Ll1gsC8JURcPToXFjWD72cOGMk=;
        b=YDfCgfeQqvHRPjej3QFraT31Y2kT6YB596LWIQyh1xWVZg+dghr/u3s0Q53nIyYksz
         JLwQZDB3qPGmlQ8tg/5/3smEr8kMGff7KIGBgYFqBAOqK8OaC2ZH1frCkjQBOYG8lLeJ
         ZxjAE402iYtI/9mZX6oOna2lSEfZ6t8o4++RMuMQSWGF3de7JJWtGVq3ZXpyOr4MJC5W
         H9IYpSyP3boSVQs6neEjQJOMTxjJuHinbYpuN3KXqhRX5ENScZ5n2QoKpd+nK0Yu20Zv
         0XarVrdv0UahBWyaMkRFegEOpywSReuHSL06XkSiSIjbd35GSSY24Xqr4DSpCo+lB2XZ
         1WEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780221225; x=1780826025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qi5PcMxnokQvdhjs4Ll1gsC8JURcPToXFjWD72cOGMk=;
        b=C66kZbNhLuT9oixSIR5r2hvRq5Er0DMHluDNChIg4zwX9TDxlUrDi2+EPrz+IQqTvt
         2GHyLmkibwAIJnDskmUQi9nDgarQKxO7Go8/jekhL9iNoUMePfksTVSF2klmWF8usoAv
         MkabNcXdy1+fFVCPv75JAatSN8pC+5tBnEOi8WUgqto5aXZOvQPEb1vVwPeEITuj+/F1
         PJEhRLXFTVADs1C8jefngbv2SlB8pJ52/k1b5rla9Mb4tpvgcwL0eM7N2mV0CRy/sBOt
         4xGVuIp/9w7y7RsVy6EVXtdn862+9DDpFNvlRd2yYT4EWKC8fo/zqBAXaV7/K5dP0jtx
         nTbw==
X-Gm-Message-State: AOJu0YwZaTly66NNgDhueWMa4hauHCOaCvCH56a1TYhVPRO2JlBxZ4+Q
	UGjRGqWL665ReMAXUWBnTbxPheyGEbfDvC+SKJPN57inkBIEt+yyn7uiR7co09MxPyJ0k8d7Vft
	86J2CzaEGUewIf+8mU8PRUayvyoNeskLZPZqogj0GgAbG
X-Gm-Gg: Acq92OGQjReJi92O2bXZv63Hyumi4mxLYyYGUvftoN7offqVfjdteP6TpYnkVKKgmD7
	JUk7ENKFRvT1nMZRl4k2Jd4pCAlgkdDEOxKKSNARURi2czEaVW6uLzvziCMuA90sw9Y50FFQHaV
	igOPm6/nzt0K0uVeEDpLBmVO3dDXY4uWDCMoWj3Vvlyh9dlYQ3Z8CqvKgE4480HlU1Hx09wLB1k
	mb0m8tlOsY/CcCh1rzufcqpuV+rwsPvnD7t7txohgxEbs7TgIy+LBsIaabT6wwEN6d6n8ifnFop
	7ClowUix4nwl7DkFdFNQBLoO3LxCsBD5W8fRYz9oRm3EIlITwknM6Lg9Lo0VvwYSbTkTnFr1eam
	W73vW6RAq791h7JGWdJpswK1yH/mQwElma6mJ6/MWW5oKQzXb8GKzVTA7paK469Bv45uhB/j3z5
	nFmhksd6O5UCN6ENwd
X-Received: by 2002:a05:6214:468d:b0:8b2:8b6:4bcf with SMTP id
 6a1803df08f44-8ccefa69ab5mr118673266d6.0.1780221225208; Sun, 31 May 2026
 02:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260528014218.171858-1-Shilong.Jiao@windriver.com>
In-Reply-To: <20260528014218.171858-1-Shilong.Jiao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 May 2026 11:53:18 +0200
X-Gm-Features: AVHnY4JrIXfH1LMWw_p0VEqLSCPHz_l0H1lt_2bgO0g7lhjByEcTPx2r8B5pUG8
Message-ID: <CAMKF1sprFWJhwg=+mbiZnOWzDmB3Jyb7i_sZLDzqCUiH+j8hNA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] lcms: add ptest support
To: Shilong.Jiao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c0126106531a0d12"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2026 09:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127303

--000000000000c0126106531a0d12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please forward port and test this patch to master branch

On Thu, May 28, 2026 at 3:42=E2=80=AFAM Shilong.Jiao via lists.openembedded=
.org
<Shilong.Jiao=3Deng.windriver.com@lists.openembedded.org> wrote:

> From: Shilong Jiao <Shilong.Jiao@windriver.com>
>
> Test results:
> root@qemux86-64:~# ptest-runner lcms
> START: ptest-runner
> 2026-05-28T01:12
> BEGIN: /usr/lib/lcms/ptest
> PASS: Base types ...Ok.
> PASS: quick floor ...Ok.
> PASS: Fixed point 15.16 representation ...Ok.
> PASS: D50 roundtrip ...Ok.
> PASS: 1D interpolation in 2pt tables ...Ok.
> PASS: 1D interpolation in 4pt tables ...Ok.
> PASS: 1D interpolation in 18pt tables ...Ok.
> PASS: 1D interpolation in descending 3pt tables ...Ok.
> PASS: 1D interpolation in descending 18pt tables ...Ok.
> PASS: 3D interpolation Trilinear (float)  ...Ok.
> PASS: 3D interpolation Trilinear (16)  ...Ok.
> PASS: Reverse interpolation 4 -> 3 ......Ok.
> PASS: 3D interpolation with granularity ...Ok.
> PASS: 4D interpolation with granularity ...Ok.
> PASS: 6D interpolation with granularity ...Ok.
> PASS: 8D interpolation with granularity ...Ok.
> PASS: Lab to XYZ and back (float only)  ...Ok.
> PASS: Lab V2 encoding ...Ok.
> PASS: Blackbody radiator ...Ok.
> PASS: Linear gamma curves (float) ....Ok.
> PASS: Curve 2.2 (float) ...|Err|<0.001953 .Ok.
> PASS: Curve 1.8 (table) ...|Err|<0.053287 .Ok.
> PASS: Curve 3.0 (table) ...|Err|<0.049726 .Ok.
> PASS: Curve 2.2 (word table) ...|Err|<0.972654 .Ok.
> PASS: Parametric curves ...Ok.
> PASS: Join curves descending ...Ok.
> PASS: Join curves sRGB (Float) ...Ok.
> PASS: Join curves sigmoidal ...Ok.
> PASS: 1 Stage LUT  ...Ok.
> PASS: 2 Stage LUT (16 bits) ...Ok.
> PASS: 3 Stage LUT (16 bits) ...Ok.
> PASS: 4 Stage LUT (16 bits) ...Ok.
> PASS: 5 Stage LUT (16 bits)  ...Ok.
> PASS: 6 Stage LUT (16 bits)  ...Ok.
> PASS: XYZ to XYZ LUT (float only)  ...Ok.
> PASS: Named Color LUT ...Ok.
> PASS: Floating point formatters ...Ok.
> PASS: ChangeBuffersFormat ...Ok.
> PASS: Multilocalized Unicode (II) ...Ok.
> PASS: Create named color profile ...Ok.
> PASS: Header version ...Ok.
> PASS: Error reporting on bad profiles ...Ok.
> PASS: Curves only transforms .........Ok.
> PASS: Encoded Lab->Lab transforms ...Ok.
> PASS: Matrix-shaper transform (float) ...Ok.
> PASS: Matrix-shaper transform (8 bits) ...Ok.
> PASS: Known values across matrix-shaper ...Ok.
> PASS: Gray Lab input profile ...Ok.
> PASS: Gray Lab output profile ...Ok.
> PASS: Matrix-shaper proofing transform (16 bits) ...Ok.
> PASS: CMYK roundtrip on perceptual transform ...Ok.
> PASS: Black ink only preservation ...Ok.
> PASS: Deciding curve types ...Ok.
> PASS: TAC detection ...Ok.
> PASS: CGATS parser on junk ...Ok.
> PASS: PostScript generator ...Ok.
> PASS: MD5 digest ...Ok.
> PASS: floating point tags on XYZ ...Ok.
> PASS: Parametric curve on Rec709 ...Ok.
> PASS: Floating Point segmented curve with short sampled segment ...Ok.
> PASS: Check MetaTag ...Ok.
> PASS: Set free a tag ...Ok.
> PASS: Planar 8 optimization ...Ok.
> PASS: Swap endian feature ...Ok.
> PASS: Forged MPE profile ...Ok.
> PASS: Empty MLUC ...Ok.
> PASS: OkLab color space ...Ok.
> PASS: centering of Lab16 ...Ok.
> PASS: Unbounded mode w/ integer output ...Ok.
> PASS: Bad CGATS file ...Ok.
> PASS: Gamut check on floats ...Ok.
> PASS: Context memory handling ...Ok.
> PASS: Alarm codes context ...Ok.
> PASS: 1D interpolation plugin ...Ok.
> PASS: Parametric curve plugin ...Ok.
> PASS: Tag type plugin ...Ok.
> PASS: Optimization plugin ...Ok.
> PASS: Full transform plugin ...Ok.
> PASS: Double from float ...Ok.
> DURATION: 11
> END: /usr/lib/lcms/ptest
> 2026-05-28T01:13
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Shilong Jiao <Shilong.Jiao@windriver.com>
> ---
>  .../conf/include/ptest-packagelists-meta-oe.inc   |  1 +
>  meta-oe/recipes-support/lcms/lcms/run-ptest       |  4 ++++
>  meta-oe/recipes-support/lcms/lcms_2.18.bb         | 15 ++++++++++++++-
>  3 files changed, 19 insertions(+), 1 deletion(-)
>  create mode 100755 meta-oe/recipes-support/lcms/lcms/run-ptest
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> index a9cbaf6982..8432ebfbf2 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -26,6 +26,7 @@ PTESTS_FAST_META_OE =3D "\
>      imagemagick \
>      jemalloc \
>      jq \
> +    lcms \
>      leveldb \
>      libcereal \
>      libdbi-perl \
> diff --git a/meta-oe/recipes-support/lcms/lcms/run-ptest
> b/meta-oe/recipes-support/lcms/lcms/run-ptest
> new file mode 100755
> index 0000000000..20d954c193
> --- /dev/null
> +++ b/meta-oe/recipes-support/lcms/lcms/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +cd $(dirname $0)
> +./testcms 2>&1 | awk '/^Checking/{test=3Dsubstr($0,10); sub(/
> \.\.\.$/,"",test); getline; print (/FAIL!/ ? "FAIL: " : "PASS: ") test}'
> diff --git a/meta-oe/recipes-support/lcms/lcms_2.18.bb
> b/meta-oe/recipes-support/lcms/lcms_2.18.bb
> index 1ff3b3908f..72cca1843f 100644
> --- a/meta-oe/recipes-support/lcms/lcms_2.18.bb
> +++ b/meta-oe/recipes-support/lcms/lcms_2.18.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3De9ce323c4b71c943a785db90142b228a"
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz \
>             file://CVE-2026-41254_1.patch \
>             file://CVE-2026-41254_2.patch \
> +           file://run-ptest \
>             "
>  SRC_URI[sha256sum] =3D
> "ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347"
>
> @@ -15,6 +16,18 @@ BBCLASSEXTEND =3D "native nativesdk"
>
>  S =3D "${UNPACKDIR}/lcms2-${PV}"
>
> -inherit autotools sourceforge-releases
> +inherit autotools sourceforge-releases ptest
> +
> +do_compile_ptest() {
> +    oe_runmake -C ${B}/testbed testcms
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    install -m 0755 ${B}/testbed/testcms ${D}${PTEST_PATH}/
> +    install -m 0644 ${S}/testbed/*.icc ${D}${PTEST_PATH}/
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "bash"
>
>  CVE_PRODUCT +=3D "littlecms:little_cms_color_engine"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127269):
> https://lists.openembedded.org/g/openembedded-devel/message/127269
> Mute This Topic: https://lists.openembedded.org/mt/119523997/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c0126106531a0d12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please forward port and test this patch to master branch=
=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, May 28, 2026 at 3:42=E2=80=AFAM Shilo=
ng.Jiao via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;Shilong.Jiao=3D<a href=3D"mailto:eng.windriver.com@lists.openembe=
dded.org">eng.windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">From: Shilong Jiao &lt;<a=
 href=3D"mailto:Shilong.Jiao@windriver.com" target=3D"_blank">Shilong.Jiao@=
windriver.com</a>&gt;<br>
<br>
Test results:<br>
root@qemux86-64:~# ptest-runner lcms<br>
START: ptest-runner<br>
2026-05-28T01:12<br>
BEGIN: /usr/lib/lcms/ptest<br>
PASS: Base types ...Ok.<br>
PASS: quick floor ...Ok.<br>
PASS: Fixed point 15.16 representation ...Ok.<br>
PASS: D50 roundtrip ...Ok.<br>
PASS: 1D interpolation in 2pt tables ...Ok.<br>
PASS: 1D interpolation in 4pt tables ...Ok.<br>
PASS: 1D interpolation in 18pt tables ...Ok.<br>
PASS: 1D interpolation in descending 3pt tables ...Ok.<br>
PASS: 1D interpolation in descending 18pt tables ...Ok.<br>
PASS: 3D interpolation Trilinear (float)=C2=A0 ...Ok.<br>
PASS: 3D interpolation Trilinear (16)=C2=A0 ...Ok.<br>
PASS: Reverse interpolation 4 -&gt; 3 ......Ok.<br>
PASS: 3D interpolation with granularity ...Ok.<br>
PASS: 4D interpolation with granularity ...Ok.<br>
PASS: 6D interpolation with granularity ...Ok.<br>
PASS: 8D interpolation with granularity ...Ok.<br>
PASS: Lab to XYZ and back (float only)=C2=A0 ...Ok.<br>
PASS: Lab V2 encoding ...Ok.<br>
PASS: Blackbody radiator ...Ok.<br>
PASS: Linear gamma curves (float) ....Ok.<br>
PASS: Curve 2.2 (float) ...|Err|&lt;0.001953 .Ok.<br>
PASS: Curve 1.8 (table) ...|Err|&lt;0.053287 .Ok.<br>
PASS: Curve 3.0 (table) ...|Err|&lt;0.049726 .Ok.<br>
PASS: Curve 2.2 (word table) ...|Err|&lt;0.972654 .Ok.<br>
PASS: Parametric curves ...Ok.<br>
PASS: Join curves descending ...Ok.<br>
PASS: Join curves sRGB (Float) ...Ok.<br>
PASS: Join curves sigmoidal ...Ok.<br>
PASS: 1 Stage LUT=C2=A0 ...Ok.<br>
PASS: 2 Stage LUT (16 bits) ...Ok.<br>
PASS: 3 Stage LUT (16 bits) ...Ok.<br>
PASS: 4 Stage LUT (16 bits) ...Ok.<br>
PASS: 5 Stage LUT (16 bits)=C2=A0 ...Ok.<br>
PASS: 6 Stage LUT (16 bits)=C2=A0 ...Ok.<br>
PASS: XYZ to XYZ LUT (float only)=C2=A0 ...Ok.<br>
PASS: Named Color LUT ...Ok.<br>
PASS: Floating point formatters ...Ok.<br>
PASS: ChangeBuffersFormat ...Ok.<br>
PASS: Multilocalized Unicode (II) ...Ok.<br>
PASS: Create named color profile ...Ok.<br>
PASS: Header version ...Ok.<br>
PASS: Error reporting on bad profiles ...Ok.<br>
PASS: Curves only transforms .........Ok.<br>
PASS: Encoded Lab-&gt;Lab transforms ...Ok.<br>
PASS: Matrix-shaper transform (float) ...Ok.<br>
PASS: Matrix-shaper transform (8 bits) ...Ok.<br>
PASS: Known values across matrix-shaper ...Ok.<br>
PASS: Gray Lab input profile ...Ok.<br>
PASS: Gray Lab output profile ...Ok.<br>
PASS: Matrix-shaper proofing transform (16 bits) ...Ok.<br>
PASS: CMYK roundtrip on perceptual transform ...Ok.<br>
PASS: Black ink only preservation ...Ok.<br>
PASS: Deciding curve types ...Ok.<br>
PASS: TAC detection ...Ok.<br>
PASS: CGATS parser on junk ...Ok.<br>
PASS: PostScript generator ...Ok.<br>
PASS: MD5 digest ...Ok.<br>
PASS: floating point tags on XYZ ...Ok.<br>
PASS: Parametric curve on Rec709 ...Ok.<br>
PASS: Floating Point segmented curve with short sampled segment ...Ok.<br>
PASS: Check MetaTag ...Ok.<br>
PASS: Set free a tag ...Ok.<br>
PASS: Planar 8 optimization ...Ok.<br>
PASS: Swap endian feature ...Ok.<br>
PASS: Forged MPE profile ...Ok.<br>
PASS: Empty MLUC ...Ok.<br>
PASS: OkLab color space ...Ok.<br>
PASS: centering of Lab16 ...Ok.<br>
PASS: Unbounded mode w/ integer output ...Ok.<br>
PASS: Bad CGATS file ...Ok.<br>
PASS: Gamut check on floats ...Ok.<br>
PASS: Context memory handling ...Ok.<br>
PASS: Alarm codes context ...Ok.<br>
PASS: 1D interpolation plugin ...Ok.<br>
PASS: Parametric curve plugin ...Ok.<br>
PASS: Tag type plugin ...Ok.<br>
PASS: Optimization plugin ...Ok.<br>
PASS: Full transform plugin ...Ok.<br>
PASS: Double from float ...Ok.<br>
DURATION: 11<br>
END: /usr/lib/lcms/ptest<br>
2026-05-28T01:13<br>
STOP: ptest-runner<br>
TOTAL: 1 FAIL: 0<br>
<br>
Signed-off-by: Shilong Jiao &lt;<a href=3D"mailto:Shilong.Jiao@windriver.co=
m" target=3D"_blank">Shilong.Jiao@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../conf/include/ptest-packagelists-meta-oe.inc=C2=A0 =C2=A0|=C2=A0 1=
 +<br>
=C2=A0meta-oe/recipes-support/lcms/lcms/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ++++<br>
=C2=A0meta-oe/recipes-support/lcms/<a href=3D"http://lcms_2.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">lcms_2.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 15 ++++++++++++++-<br>
=C2=A03 files changed, 19 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100755 meta-oe/recipes-support/lcms/lcms/run-ptest<br>
<br>
diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc<br>
index a9cbaf6982..8432ebfbf2 100644<br>
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
@@ -26,6 +26,7 @@ PTESTS_FAST_META_OE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0imagemagick \<br>
=C2=A0 =C2=A0 =C2=A0jemalloc \<br>
=C2=A0 =C2=A0 =C2=A0jq \<br>
+=C2=A0 =C2=A0 lcms \<br>
=C2=A0 =C2=A0 =C2=A0leveldb \<br>
=C2=A0 =C2=A0 =C2=A0libcereal \<br>
=C2=A0 =C2=A0 =C2=A0libdbi-perl \<br>
diff --git a/meta-oe/recipes-support/lcms/lcms/run-ptest b/meta-oe/recipes-=
support/lcms/lcms/run-ptest<br>
new file mode 100755<br>
index 0000000000..20d954c193<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/lcms/lcms/run-ptest<br>
@@ -0,0 +1,4 @@<br>
+#!/bin/sh<br>
+<br>
+cd $(dirname $0)<br>
+./testcms 2&gt;&amp;1 | awk &#39;/^Checking/{test=3Dsubstr($0,10); sub(/ \=
.\.\.$/,&quot;&quot;,test); getline; print (/FAIL!/ ? &quot;FAIL: &quot; : =
&quot;PASS: &quot;) test}&#39;<br>
diff --git a/meta-oe/recipes-support/lcms/<a href=3D"http://lcms_2.18.bb" r=
el=3D"noreferrer" target=3D"_blank">lcms_2.18.bb</a> b/meta-oe/recipes-supp=
ort/lcms/<a href=3D"http://lcms_2.18.bb" rel=3D"noreferrer" target=3D"_blan=
k">lcms_2.18.bb</a><br>
index 1ff3b3908f..72cca1843f 100644<br>
--- a/meta-oe/recipes-support/lcms/<a href=3D"http://lcms_2.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">lcms_2.18.bb</a><br>
+++ b/meta-oe/recipes-support/lcms/<a href=3D"http://lcms_2.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">lcms_2.18.bb</a><br>
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De9ce323c4b7=
1c943a785db90142b228a&quot;<br>
=C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-41254_1.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-41254_2.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ee67be3566f459362c1ee094fde2c159d33fa039=
0aa4ed5f5af676f9e5004347&quot;<br>
<br>
@@ -15,6 +16,18 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/lcms2-${PV}&quot;<br>
<br>
-inherit autotools sourceforge-releases<br>
+inherit autotools sourceforge-releases ptest<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 oe_runmake -C ${B}/testbed testcms<br>
+}<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 install -m 0755 ${B}/testbed/testcms ${D}${PTEST_PATH}/<br>
+=C2=A0 =C2=A0 install -m 0644 ${S}/testbed/*.icc ${D}${PTEST_PATH}/<br>
+}<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot;bash&quot;<br>
<br>
=C2=A0CVE_PRODUCT +=3D &quot;littlecms:little_cms_color_engine&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127269): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127269" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127269</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119523997/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119523997/1997914</a><br>
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

--000000000000c0126106531a0d12--


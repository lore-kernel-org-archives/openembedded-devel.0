Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A2ECD494C
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 04:58:56 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.9184.1695272333518269456
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 21:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PPG29ai+;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6c09f1f4610so360032a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 21:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695272333; x=1695877133; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWuPccBkmZUmYqA+tZ+8L94pxQ2Jh1oKEyLfDRMaKyk=;
        b=PPG29ai+pOFXPvfx91ulzfNJzdrs7x7+NyK7z6f5dTXV0yNmJAdMzYVuhdbEbqhIya
         /KMN7xxuiosPtoDz4bbnFIfmXYf4z9gKolcUz5rmnONz0EVPr2n4Emy7Cs2wg5E4udJ3
         iVGWvk+src6RY9fuEeRXa8uVrusVRR01tJEYW6P8cqgWjtBSX0zKzb74EH1bOEp08l2X
         CjQXn0qFrKI1BjuVYhFyknXjmIzpWdtTQ5YEAkvbgzFvEsLNGcDx2pe+xQYRpw8+AYOM
         n8enuTSHo0dq+xKfO4/JhpCkO4cSzWqPUn3DHjE3z3fBWpP1O3NetLUIxssJsWF6189N
         48SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695272333; x=1695877133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWuPccBkmZUmYqA+tZ+8L94pxQ2Jh1oKEyLfDRMaKyk=;
        b=a8zSL7Vh5EVUlo9R+519YC0awBs33BYvxsb0UxSXj2P8PipCXNK5oxQYLSfznLVJIr
         seMVh5NHTt6ROtJWSZMDLanzooWflC50+iQUkEFziMm+ACTDRrtb7I5hW17avYE43Buq
         8P9h1zqQCXg5RlzJ9bRaYSWpz4aiWvJLeeHIv0uW0RabA0P7RoCPbnX2ZeWt69dpwT2E
         bqE3OE/m9OGLPBRJMa3CmusIJnxwxyeaLi9xsoc2SMwWvlTE3KFJ70Cfgk+nvqedbLgp
         5eNeEYLQIjXA5AVSXJZxxZu0agxvZQd/qO+5TAde8VeWwy62PJBdR17NyKZqmg6tJ50u
         f7rQ==
X-Gm-Message-State: AOJu0YwOCfGnfBf9bPwQy6FS/sAoDn/rwDjmxcGQoUuRDEAj85LunSPK
	m4QVPbvIkIPhPppG3wzscC/qEGK6RZPaQQ9SwWtsEj58wQ0aLg==
X-Google-Smtp-Source: AGHT+IG7YsTnInvzMm/MLQdVSL7XV2l0p+MXCWzCk1EYQt2s/vE2faKpbLVVllxaEOaPOeuIWNVLK3m39WU3DDWuI14=
X-Received: by 2002:a05:6870:2104:b0:1d5:d899:a9c1 with SMTP id
 f4-20020a056870210400b001d5d899a9c1mr4601280oae.37.1695272332571; Wed, 20 Sep
 2023 21:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <1695110541-8515-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1695110541-8515-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Sep 2023 21:58:26 -0700
Message-ID: <CAMKF1srxxUHBr-QCYruqL0Tccz7BXZJAsGGHJ+VTYV7-tyjO3g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] xmlsec1: upgrade 1.2.37 -> 1.3.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 04:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105032

There is a ptest failure

---------------------------------------------------
  Verifying a signature with keys manager...
  func=3DxmlSecKeysMngrGetKey:file=3Dkeys.c:line=3D1347:obj=3Dunknown:subj=
=3Dunknown:error=3D45:key
is not found:details=3DNULL
  func=3DxmlSecDSigCtxProcessKeyInfoNode:file=3Dxmldsig.c:line=3D822:obj=3D=
unknown:subj=3Dunknown:error=3D45:key
is not found:details=3DNULL
  func=3DxmlSecDSigCtxProcessSignatureNode:file=3Dxmldsig.c:line=3D537:obj=
=3Dunknown:subj=3DxmlSecDSigCtxProcessKeyInfoNode:error=3D1:xmlsec
library function failed:-
  func=3DxmlSecDSigCtxVerify:file=3Dxmldsig.c:line=3D357:obj=3Dunknown:subj=
=3DxmlSecDSigCtxProcessSignatureNode:error=3D1:xmlsec
library function failed:-
  Error: signature verify
  func=3DxmlSecKeysMngrGetKey:file=3Dkeys.c:line=3D1347:obj=3Dunknown:subj=
=3Dunknown:error=3D45:key
is not found:details=3DNULL
  func=3DxmlSecDSigCtxProcessKeyInfoNode:file=3Dxmldsig.c:line=3D822:obj=3D=
unknown:subj=3Dunknown:error=3D45:key
is not found:details=3DNULL
  func=3DxmlSecDSigCtxProcessSignatureNode:file=3Dxmldsig.c:line=3D537:obj=
=3Dunknown:subj=3DxmlSecDSigCtxProcessKeyInfoNode:error=3D1:xmlsec
library function failed:-
  func=3DxmlSecDSigCtxVerify:file=3Dxmldsig.c:line=3D357:obj=3Dunknown:subj=
=3DxmlSecDSigCtxProcessSignatureNode:error=3D1:xmlsec
library function failed:-
  Error: signature verify
  FAIL: verify-keys-manager


On order to reproduce it.

MACHINE=3Dqemux86-64

bitbake meta-oe-ptest-image-xmlsec1 && bitbake
meta-oe-ptest-image-xmlsec1 -ctestimage

On Tue, Sep 19, 2023 at 1:03=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-xmldsigverify-Include-xmlsec-parser.h.patch
> removed since it's included in 1.3.1
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Added "--with-libltdl" option for ./configure to allow custom libltdl in=
stallations and deprecated "--enable-crypto-dl" option.
> -Added support for cclang compiler on non-MacOSX platforms.
> -(xmlsec-openssl) Restored support for LibreSSL and bumped minimum requir=
ed version to 3.5.0.
> -(xmlsec-nss) Restored minimum supported NSS version to 3.35.
> -Several other small fixes (more details).
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...mldsigverify-Include-xmlsec-parser.h.patch | 43 -------------------
>  .../{xmlsec1_1.2.37.bb =3D> xmlsec1_1.3.1.bb}   | 19 ++++----
>  2 files changed, 9 insertions(+), 53 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigv=
erify-Include-xmlsec-parser.h.patch
>  rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.2.37.bb =3D> xmlsec1_1=
.3.1.bb} (80%)
>
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-I=
nclude-xmlsec-parser.h.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001=
-xmldsigverify-Include-xmlsec-parser.h.patch
> deleted file mode 100644
> index 4347e925a3..0000000000
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-=
xmlsec-parser.h.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 30e1afe60820c18c89cd10e9dcb7208ad5676d1d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 19 Jan 2023 15:06:35 -0800
> -Subject: [PATCH] xmldsigverify: Include xmlsec/parser.h
> -
> -this ensures that xmlSecParserSetDefaultOptions definition is made
> -available
> -
> -Fixes
> -| xmldsigverify.c:275:5: error: call to undeclared function 'xmlSecParse=
rSetDefaultOptions'; ISO C99 and later do not support implicit function dec=
larations [-Wimplicit-function-declaration]
> -|     xmlSecParserSetDefaultOptions(XML_PARSE_NOENT | XML_PARSE_NOCDATA =
|
> -|     ^
> -
> -Upstream-Status: Submitted [https://github.com/lsh123/xmlsec/pull/463]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - examples/xmldsigverify.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/examples/xmldsigverify.c b/examples/xmldsigverify.c
> -index ed538c70..ff68120e 100644
> ---- a/examples/xmldsigverify.c
> -+++ b/examples/xmldsigverify.c
> -@@ -25,6 +25,7 @@
> - #include <xmlsec/xmldsig.h>
> - #include <xmlsec/crypto.h>
> -
> -+#include <xmlsec/parser.h>
> - /* #define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER   "/etc/httpd/con=
f/ssl.crt" */
> - #define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER      "/var/www/cgi-b=
in/keys-certs.def"
> - #define XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER              "/var/www/cgi-b=
in/keys-certs"
> -@@ -36,7 +37,7 @@ int verify_request(xmlSecKeysMngrPtr mngr);
> - int url_decode(char *buf, size_t size);
> -
> - int
> --main(int , char **) {
> -+main() {
> -     xmlSecKeysMngrPtr mngr;
> - #ifndef XMLSEC_NO_XSLT
> -     xsltSecurityPrefsPtr xsltSecPrefs =3D NULL;
> ---
> -2.39.1
> -
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb b/meta-oe/=
recipes-support/xmlsec1/xmlsec1_1.3.1.bb
> similarity index 80%
> rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
> rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.1.bb
> index a3da770943..934e81a3c3 100644
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.1.bb
> @@ -13,17 +13,16 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D352791d620=
92ea8104f085042de7f4d0"
>  SECTION =3D "libs"
>
>  SRC_URI =3D "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
> -    file://fix-ltmain.sh.patch \
> -    file://change-finding-path-of-nss.patch \
> -    file://makefile-ptest.patch \
> -    file://xmlsec1-examples-allow-build-in-separate-dir.patch \
> -    file://0001-nss-nspr-fix-for-multilib.patch \
> -    file://run-ptest \
> -    file://ensure-search-path-non-host.patch \
> -    file://0001-xmldsigverify-Include-xmlsec-parser.h.patch \
> -    "
> +           file://fix-ltmain.sh.patch \
> +           file://change-finding-path-of-nss.patch \
> +           file://makefile-ptest.patch \
> +           file://xmlsec1-examples-allow-build-in-separate-dir.patch \
> +           file://0001-nss-nspr-fix-for-multilib.patch \
> +           file://run-ptest \
> +           file://ensure-search-path-non-host.patch \
> +           "
>
> -SRC_URI[sha256sum] =3D "5f8dfbcb6d1e56bddd0b5ec2e00a3d0ca5342a9f57c24dff=
de5c796b2be2871c"
> +SRC_URI[sha256sum] =3D "10f48384d4fd1afc05fea545b74fbf7c152582f0a895c189=
f164d55270400c63"
>
>  inherit autotools-brokensep ptest pkgconfig
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105001): https://lists.openembedded.org/g/openembedde=
d-devel/message/105001
> Mute This Topic: https://lists.openembedded.org/mt/101452077/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


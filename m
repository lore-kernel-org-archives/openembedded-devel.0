Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15232CEBF92
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 00:29:26 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.394.1763425761183986339
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 16:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RO0th07G;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7c7634863a7so349355a34.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 16:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763425760; x=1764030560; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9HFMg2vHIOOV0a345CyLmUyoi/IFD9JiRpdSa29X4E=;
        b=RO0th07GWULaqf3PurU3kzsOmKLjFiZZtSCy8YdagW/oL4FSLwlVETpgjEJ61xrkdB
         5D88RGr6j39eT//9MPYwIF3h3afEszOcmERC/RRjdU6Q5KUePBy6+4roiClZqPVlf2DN
         v0tmyquDjM0a0ipsEBUSZn4SuqLId3x6qbQUEZJ0Mb74ZUliOdM1c9lnJ9YoW3sfiUAd
         sc13Ce6oqEZSxeJtriG/LBAaqHTEVHsJP538mA7+Zfb25wwVFyteIKTLNr288vLfU2W+
         +POTL7iU60AfM9KQxjUS3fYp8oy55ie7BcLV9oJIgY2zaCKnI+J53QyXNR3QlMFaWKC3
         FxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763425760; x=1764030560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S9HFMg2vHIOOV0a345CyLmUyoi/IFD9JiRpdSa29X4E=;
        b=AJusiNFMNm6f/wLbAPzNcxL4xQn/Z69f8mL+ozGH+6rWnoShhBx+DTjLwcZ+X41z1/
         B86QQDONACBy0TjcYWGoNzCoGmVlJpXYZ14vDvQngGV35OyB0BbIorUCjYXO3lTPVgen
         VJpYPubt0YYCUjhVb2Gys+edT0YLx9bZYSgG+SVjBcdtRqbVuQYRuQ83JbJialGx7WME
         OELi0Ust050wV5PC18JTN6/ytV/cJpjgHp8RvRKdqlGgGdSgamg4xuQ/fs2gwfMEQLX/
         E7ui7Ao/74IWsqulhrBHUyVXKz7a3RWs+iX8csZ0MmbYCMh9k45VsqQwaWwinaSyJmqV
         LyFw==
X-Gm-Message-State: AOJu0Yw/JNuK8ExXXVU5gluiTvVN95PpijJ3daGYAvh5XpHPyF2LEGla
	wJpQJC1xQxM6VwpzQD2ARK7Y8/xI6QytXOwGKHd6lHTdQBrzdw+wYfHBOYkN/5tk6Gq1DV405c8
	cIfJ9akcTVBH409rK0BhhfFjB0VIyFSA=
X-Gm-Gg: ASbGncvv1Vq5NjyNLSOI+lWq2HRMosh8o/1W+C9sJyCc/g+dU4enzaKIMgC+hSJ/jJP
	EgCey+oPA5RDRODg8Dw+VloIeJwKAxSiFoUDvSAam/xCD+Q5mZZPjgMzowJfUkJRI4O7c4JpuS8
	rKdUz5k5d8SGVIb7ctpX/pT/3i20Xsl98LQxFyix/xC4CXto02M27V7hVjagkjp6sOIrUZDrU0a
	VaYtUYT8ioBOZZWJrctjUhrOuszMX3de70zPrF8GPawiqLQALlIs7qv5wx6iZ64RS4KU7Qg
X-Google-Smtp-Source: AGHT+IEQw8QJdZj7Sjm9Fqd+WeZ9Hk89tCsO3MP+AEvfQ3mTSP41Bnqdsaixl3DF+5omYpOhsaJnhgXPRuaYti1FwXQ=
X-Received: by 2002:a05:6808:3087:b0:44d:bdeb:f577 with SMTP id
 5614622812f47-45097514933mr5273541b6e.31.1763425759814; Mon, 17 Nov 2025
 16:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20251118002723.829508-1-ankur.tyagi85@gmail.com> <1878F24C1EA587F5.1325495@lists.openembedded.org>
In-Reply-To: <1878F24C1EA587F5.1325495@lists.openembedded.org>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 18 Nov 2025 13:29:08 +1300
X-Gm-Features: AWmQ_bn6pA-LRgx4lRT-a4_uw6UcbHCmaXgXpvLc4Ea5EwMU2slhidNRkqRQALg
Message-ID: <CADySD0G2wXkJu53s-BE5thVdtZEmRbfp_Ys_GbZbuV7Xo8hOjQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 6/6] xmlsec1: upgrade 1.3.7 -> 1.3.9
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 00:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121793

ptest results:

root@qemux86-64:~# ptest-runner xmlsec1
START: ptest-runner
2025-11-18T00:22
BEGIN: /usr/lib64/xmlsec1/ptest
---------------------------------------------------------------------------=
--------------------
Signing a template file...
PASS: sign-tmpl

---------------------------------------------------------------------------=
--------------------
Signing a template file with xmlsec1...
Signature status: OK
PASS: sign-tmpl-xmlsec1

---------------------------------------------------------------------------=
--------------------
Signing a dynamicaly created template...
PASS: sign-dynamic-templ

---------------------------------------------------------------------------=
--------------------
Signing a file with a dynamicaly created template and an X509 certificate..=
.
PASS: sign-dynamic-templ-x509

---------------------------------------------------------------------------=
--------------------
Signing a node in a file with a dynamicaly created template and an
X509 certificate...
PASS: sign-file-node-dynamic-templ-x509

---------------------------------------------------------------------------=
--------------------
Verifying a signature with a single key...
Signature is OK
PASS: verify-single-key-1

Signature is OK
PASS: verify-single-key-2

---------------------------------------------------------------------------=
--------------------
Verifying a signature with keys manager...
Signature is OK
PASS: verify-keys-1-manager

Signature is OK
PASS: verify-keys-2-manager

---------------------------------------------------------------------------=
--------------------
Verifying a signature with xmlsec1...
Verification status: OK
PASS: verify-keys-1-xmlsec1

Verification status: OK
PASS: verify-keys-2-xmlsec1

---------------------------------------------------------------------------=
--------------------
Verifying a signature with X509 certificates...
Signature is OK
PASS: verify-x509

---------------------------------------------------------------------------=
--------------------
Verifying a signature using X509 certificates with xmlsec1...
Verification status: OK
PASS: verify-x509-xmlsec1

---------------------------------------------------------------------------=
--------------------
Verifying a signature over a node using X509 certificate...
Signature is OK
PASS: verify-node-x509

---------------------------------------------------------------------------=
--------------------
Verifying a signature over a node using X509 certificate with xmlsec1...
Verification status: OK
PASS: verify-node-x509-xmlsec1

---------------------------------------------------------------------------=
--------------------
Verifying a simple SAML response using X509 certificate...
Signature is OK
PASS: verify-sampl-x509

---------------------------------------------------------------------------=
--------------------
Verifying a simple SAML response using X509 certificate with xmlsec1...
Verification status: OK
PASS: verify-sampl-x509-xmlsec1

---------------------------------------------------------------------------=
--------------------
Encrypting data with a template file...
PASS: encrypt-tmpl

---------------------------------------------------------------------------=
--------------------
Encrypting data with a template file with xmlsec1...
PASS: encrypt-tmpl-xmlsec1

---------------------------------------------------------------------------=
--------------------
Encrypting data with a dynamicaly created template...
PASS: encrypt-dynamic-tmpl

---------------------------------------------------------------------------=
--------------------
Encrypting data with a session key...
PASS: encrypt-session-key

---------------------------------------------------------------------------=
--------------------
Decrypting data with a single key...
Decrypted binary data (10 bytes):
Big secret
PASS: decrypt-single-key-1

Decrypted XML data:
<?xml version=3D"1.0" encoding=3D"UTF-8"?>
<!--
XML Security Library example: Original XML doc file before encryption
(encrypt2 example).
-->
<Envelope xmlns=3D"urn:envelope">
  <Data>
    Hello, World!
  </Data>
</Envelope>

PASS: decrypt-single-key-2

---------------------------------------------------------------------------=
--------------------
Decrypting data with keys manager...
Decrypted binary data (10 bytes):
Big secret
PASS: decrypt-keys-1-manager

Decrypted XML data:
<?xml version=3D"1.0" encoding=3D"UTF-8"?>
<!--
XML Security Library example: Original XML doc file before encryption
(encrypt2 example).
-->
<Envelope xmlns=3D"urn:envelope">
  <Data>
    Hello, World!
  </Data>
</Envelope>

PASS: decrypt-keys-2-manager

---------------------------------------------------------------------------=
--------------------
Decrypting data with xmlsec1...
Big secretPASS: decrypt-key-1-xmlsec1

<?xml version=3D"1.0" encoding=3D"UTF-8"?>
<!--
XML Security Library example: Original XML doc file before encryption
(encrypt2 example).
-->
<Envelope xmlns=3D"urn:envelope">
  <Data>
    Hello, World!
  </Data>
</Envelope>
PASS: decrypt-key-2-xmlsec1

<?xml version=3D"1.0" encoding=3D"UTF-8"?>
<!--
XML Security Library example: Original XML doc file before encryption
(encrypt3 example).
-->
<Envelope xmlns=3D"urn:envelope">
  <Data>
    Hello, World!
  </Data>
</Envelope>
PASS: decrypt-key-3-xmlsec1

---------------------------------------------------------------------------=
--------------------
Decrypting using custom keys manager...
Decrypted binary data (10 bytes):
Big secret
PASS: decrypt-keys-1-manager

Decrypted XML data:
<?xml version=3D"1.0" encoding=3D"UTF-8"?>
<!--
XML Security Library example: Original XML doc file before encryption
(encrypt2 example).
-->
<Envelope xmlns=3D"urn:envelope">
  <Data>
    Hello, World!
  </Data>
</Envelope>

PASS: decrypt-keys-2-manager

Decrypted XML data:
<?xml version=3D"1.0" encoding=3D"UTF-8"?>
<!--
XML Security Library example: Original XML doc file before encryption
(encrypt3 example).
-->
<Envelope xmlns=3D"urn:envelope">
  <Data>
    Hello, World!
  </Data>
</Envelope>

PASS: decrypt-keys-3-manager

DURATION: 1
END: /usr/lib64/xmlsec1/ptest
2025-11-18T00:22
STOP: ptest-runner
TOTAL: 1 FAIL: 0


On Tue, Nov 18, 2025 at 1:27=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Refreshed patches and updated ptest.
>
> Changelog:
> https://github.com/lsh123/xmlsec/releases/tag/1.3.8
> https://github.com/lsh123/xmlsec/releases/tag/1.3.9
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...> 0001-force-to-use-our-own-libtool.patch} |    7 +-
>  ...change-finding-path-of-nss-and-nspr.patch} |    6 +-
>  ...atch =3D> 0003-xmlsec1-add-new-recipe.patch} |    7 +-
>  ...xamples-allow-build-in-separate-dir.patch} |    7 +-
>  ...h =3D> 0005-nss-nspr-fix-for-multilib.patch} |    9 +-
>  ...gure-QA-error-caused-by-host-lookup.patch} |    7 +-
>  ...Fix-LibXML2-deprecation-warnings-and.patch | 1190 +++++++++++++++++
>  .../recipes-support/xmlsec1/xmlsec1/run-ptest |  112 +-
>  .../{xmlsec1_1.3.7.bb =3D> xmlsec1_1.3.9.bb}    |   15 +-
>  9 files changed, 1296 insertions(+), 64 deletions(-)
>  rename meta-oe/recipes-support/xmlsec1/xmlsec1/{fix-ltmain.sh.patch =3D>=
 0001-force-to-use-our-own-libtool.patch} (81%)
>  rename meta-oe/recipes-support/xmlsec1/xmlsec1/{change-finding-path-of-n=
ss.patch =3D> 0002-change-finding-path-of-nss-and-nspr.patch} (83%)
>  rename meta-oe/recipes-support/xmlsec1/xmlsec1/{makefile-ptest.patch =3D=
> 0003-xmlsec1-add-new-recipe.patch} (91%)
>  rename meta-oe/recipes-support/xmlsec1/xmlsec1/{xmlsec1-examples-allow-b=
uild-in-separate-dir.patch =3D> 0004-examples-allow-build-in-separate-dir.p=
atch} (90%)
>  rename meta-oe/recipes-support/xmlsec1/xmlsec1/{0001-nss-nspr-fix-for-mu=
ltilib.patch =3D> 0005-nss-nspr-fix-for-multilib.patch} (94%)
>  rename meta-oe/recipes-support/xmlsec1/xmlsec1/{ensure-search-path-non-h=
ost.patch =3D> 0006-xmlsec1-Fix-configure-QA-error-caused-by-host-lookup.pa=
tch} (91%)
>  create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0007-xmlsec-e=
xamples-Fix-LibXML2-deprecation-warnings-and.patch
>  rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.7.bb =3D> xmlsec1_1.=
3.9.bb} (79%)
>
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/fix-ltmain.sh.patch =
b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-force-to-use-our-own-libtool=
.patch
> similarity index 81%
> rename from meta-oe/recipes-support/xmlsec1/xmlsec1/fix-ltmain.sh.patch
> rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0001-force-to-use-our-o=
wn-libtool.patch
> index 73c6ddb027..57c0ab36ff 100644
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1/fix-ltmain.sh.patch
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-force-to-use-our-own-l=
ibtool.patch
> @@ -1,4 +1,4 @@
> -From 1b9701faf22f5a17a81a2a2732794d9627499fcb Mon Sep 17 00:00:00 2001
> +From 37efc0ca231363aa9161c036ba12cc2b33f51a24 Mon Sep 17 00:00:00 2001
>  From: Yulong Pei <Yulong.pei@windriver.com>
>  Date: Thu, 21 Jan 2010 14:11:20 +0800
>  Subject: [PATCH] force to use our own libtool
> @@ -6,16 +6,15 @@ Subject: [PATCH] force to use our own libtool
>  Upstream-Status: Inappropriate [ OE specific ]
>
>  Signed-off-by: Yulong Pei <Yulong.pei@windriver.com>
> -
>  ---
>   ltmain.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/ltmain.sh b/ltmain.sh
> -index 1dea62a..bfb9784 100755
> +index 7271130e..4e0925a6 100755
>  --- a/ltmain.sh
>  +++ b/ltmain.sh
> -@@ -7225,7 +7225,7 @@ func_mode_link ()
> +@@ -7377,7 +7377,7 @@ func_mode_link ()
>         dir=3D$func_resolve_sysroot_result
>         # We need an absolute path.
>         case $dir in
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-=
of-nss.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0002-change-finding-=
path-of-nss-and-nspr.patch
> similarity index 83%
> rename from meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-o=
f-nss.patch
> rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0002-change-finding-pat=
h-of-nss-and-nspr.patch
> index 61c56ffc8b..4a30f483a2 100644
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.=
patch
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0002-change-finding-path-of=
-nss-and-nspr.patch
> @@ -1,4 +1,4 @@
> -From b43fa6bf612ee59db57573b39e357b6ca96d48b6 Mon Sep 17 00:00:00 2001
> +From 75d7dc918771483a6c4354ee77bc14c2ff83f467 Mon Sep 17 00:00:00 2001
>  From: Yulong Pei <Yulong.pei@windriver.com>
>  Date: Wed, 21 Jul 2010 22:33:43 +0800
>  Subject: [PATCH] change finding path of nss and nspr
> @@ -13,10 +13,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 8add879..7f137c0 100644
> +index b31b8bb6..b59acc86 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -933,7 +933,7 @@ NSS_PACKAGE=3Dmozilla-nss
> +@@ -965,7 +965,7 @@ NSS_PACKAGE=3Dmozilla-nss
>   NSPR_INCLUDE_MARKER=3D"nspr/nspr.h"
>   NSPR_LIB_MARKER=3D"libnspr4$shrext"
>   NSPR_LIBS_LIST=3D"-lnspr4 -lplds4 -lplc4"
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch=
 b/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patc=
h
> similarity index 91%
> rename from meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch
> rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-re=
cipe.patch
> index 55ae9887f2..1b50e2ed0e 100644
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe=
.patch
> @@ -1,4 +1,4 @@
> -From 83a1381e1d6bd1b5ec3df6f7c4bc1f4fe4f860b6 Mon Sep 17 00:00:00 2001
> +From 2e66dbeeec7d75ed86c87b83b3ac300257363c04 Mon Sep 17 00:00:00 2001
>  From: Jackie Huang <jackie.huang@windriver.com>
>  Date: Thu, 15 Jun 2017 14:44:01 +0800
>  Subject: [PATCH] xmlsec1: add new recipe
> @@ -14,7 +14,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com=
>
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
>  diff --git a/examples/Makefile b/examples/Makefile
> -index 0b352bc..de3c217 100644
> +index c6a25f09..3da1cb33 100644
>  --- a/examples/Makefile
>  +++ b/examples/Makefile
>  @@ -12,9 +12,17 @@ PROGRAMS =3D \
> @@ -37,6 +37,3 @@ index 0b352bc..de3c217 100644
>
>   all: $(PROGRAMS)
>
> ---
> -2.43.0
> -
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-all=
ow-build-in-separate-dir.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/00=
04-examples-allow-build-in-separate-dir.patch
> similarity index 90%
> rename from meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allo=
w-build-in-separate-dir.patch
> rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0004-examples-allow-bui=
ld-in-separate-dir.patch
> index 50706793b2..d7188083b3 100644
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-buil=
d-in-separate-dir.patch
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0004-examples-allow-build-i=
n-separate-dir.patch
> @@ -1,4 +1,4 @@
> -From 0c38c6864e7ba8f53a657d87894f24374a6a4932 Mon Sep 17 00:00:00 2001
> +From fab6503dca2046d32fa186c33c566c58110334a5 Mon Sep 17 00:00:00 2001
>  From: Jackie Huang <jackie.huang@windriver.com>
>  Date: Tue, 30 Dec 2014 11:18:17 +0800
>  Subject: [PATCH] examples: allow build in separate dir
> @@ -11,7 +11,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com=
>
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
>  diff --git a/examples/Makefile b/examples/Makefile
> -index de3c217..2e0ab6e 100644
> +index 3da1cb33..ff44cb7b 100644
>  --- a/examples/Makefile
>  +++ b/examples/Makefile
>  @@ -16,8 +16,10 @@ ifndef CC
> @@ -27,6 +27,3 @@ index de3c217..2e0ab6e 100644
>
>   DESTDIR =3D /usr/share/xmlsec1
>   install-ptest:
> ---
> -2.43.0
> -
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-fo=
r-multilib.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0005-nss-nspr-fi=
x-for-multilib.patch
> similarity index 94%
> rename from meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for=
-multilib.patch
> rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0005-nss-nspr-fix-for-m=
ultilib.patch
> index 9bb017b63b..a1cc4fd559 100644
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multi=
lib.patch
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0005-nss-nspr-fix-for-multi=
lib.patch
> @@ -1,4 +1,4 @@
> -From 1d7c01467e6f510b5636c73757f302a4bd277a3c Mon Sep 17 00:00:00 2001
> +From 9f1e319a5f7dcbe611d1f41a551f644c293ac3f0 Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Tue, 4 Feb 2020 23:39:49 -0800
>  Subject: [PATCH] nss/nspr: fix for multilib
> @@ -11,10 +11,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 40e9c0d..8f42d4d 100644
> +index b59acc86..b8b0542d 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -966,24 +966,24 @@ fi
> +@@ -990,24 +990,24 @@ fi
>   dnl Priority 1: User specifies the path to installation
>   if test "z$NSPR_FOUND" =3D "zno" -a "z$with_nspr" !=3D "z" -a "z$with_n=
spr" !=3D "zyes" ; then
>       AC_MSG_CHECKING(for nspr library installation in "$with_nspr" folde=
r)
> @@ -47,6 +47,3 @@ index 40e9c0d..8f42d4d 100644
>       fi
>   fi
>
> ---
> -2.43.0
> -
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-n=
on-host.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0006-xmlsec1-Fix-co=
nfigure-QA-error-caused-by-host-lookup.patch
> similarity index 91%
> rename from meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-no=
n-host.patch
> rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0006-xmlsec1-Fix-config=
ure-QA-error-caused-by-host-lookup.patch
> index 7b07628e5f..de2534ef78 100644
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host=
.patch
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0006-xmlsec1-Fix-configure-=
QA-error-caused-by-host-lookup.patch
> @@ -1,4 +1,4 @@
> -From c16d384fb64cf53351e150fb9e9b99cc6ba970b2 Mon Sep 17 00:00:00 2001
> +From 67642a6bbf7261626f41b84cccf9b55b93c4cbc9 Mon Sep 17 00:00:00 2001
>  From: Anatol Belski <anbelski@linux.microsoft.com>
>  Date: Thu, 14 Jan 2021 17:36:23 +0000
>  Subject: [PATCH] xmlsec1: Fix configure QA error caused by host lookup p=
ath
> @@ -9,16 +9,15 @@ It will eventually arise after the configure QA as the =
configure script should o
>
>  Upstream-Status: Inappropriate [embedded specific]
>  Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
> -
>  ---
>   configure.ac | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 3d23683..baf27b7 100644
> +index b8b0542d..795355af 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -286,8 +286,8 @@ fi
> +@@ -306,8 +306,8 @@ fi
>   dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>   dnl Common installation locations
>   dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0007-xmlsec-examples=
-Fix-LibXML2-deprecation-warnings-and.patch b/meta-oe/recipes-support/xmlse=
c1/xmlsec1/0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-and.patch
> new file mode 100644
> index 0000000000..156c7d8402
> --- /dev/null
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0007-xmlsec-examples-Fix-Li=
bXML2-deprecation-warnings-and.patch
> @@ -0,0 +1,1190 @@
> +From b68f4aa1d450b1a940dd950e1e5eadc2c91ac82f Mon Sep 17 00:00:00 2001
> +From: lsh123 <aleksey@aleksey.com>
> +Date: Sat, 15 Nov 2025 09:38:02 -0800
> +Subject: [PATCH] (xmlsec-examples) Fix LibXML2 deprecation warnings and =
update
> + README to show key name use (#990)
> +
> +See https://github.com/lsh123/xmlsec/issues/989
> +
> +Upstream-Status: Backport
> +(cherry picked from commit f15b6dcb5276facfbdbcd8dfe1f23026aa079e7a)
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + docs/xmldsig-verifier.html                    |   5 +-
> + examples/Makefile                             |   3 +-
> + examples/README.md                            |  40 +-
> + examples/decrypt1.c                           |   4 +-
> + examples/decrypt2.c                           |   4 +-
> + examples/decrypt3.c                           |   4 +-
> + examples/encrypt1-tmpl.xml                    |   8 +-
> + examples/encrypt1.c                           |   4 +-
> + examples/encrypt2.c                           |   4 +-
> + examples/encrypt3-res.xml                     |   8 +-
> + examples/encrypt3.c                           |   7 +-
> + examples/sign1-tmpl.xml                       |   6 +-
> + examples/sign1.c                              |   4 +-
> + examples/sign2.c                              |   4 +-
> + examples/sign3.c                              |   4 +-
> + examples/sign4.c                              |   4 +-
> + examples/verify-saml.c                        |   4 +-
> + examples/verify1.c                            |   4 +-
> + examples/verify2.c                            |   4 +-
> + examples/verify3.c                            |   2 -
> + examples/verify4.c                            |   2 -
> + examples/xmldsigverify.c                      | 379 ------------------
> + .../aleksey-xmldsig-01/enveloped-gost2001.xml |   3 -
> + .../enveloped-x509-digest-sha1.tmpl           |   3 -
> + .../enveloped-x509-digest-sha1.xml            |   3 -
> + .../enveloped-x509-digest-sha224.tmpl         |   3 -
> + .../enveloped-x509-digest-sha224.xml          |   3 -
> + .../enveloped-x509-digest-sha256.tmpl         |   3 -
> + .../enveloped-x509-digest-sha256.xml          |   3 -
> + .../enveloped-x509-digest-sha384.tmpl         |   3 -
> + .../enveloped-x509-digest-sha384.xml          |   3 -
> + .../enveloped-x509-digest-sha512.tmpl         |   3 -
> + .../enveloped-x509-digest-sha512.xml          |   3 -
> + .../enveloped-x509-issuerserial.tmpl          |   3 -
> + .../enveloped-x509-issuerserial.xml           |   3 -
> + .../enveloped-x509-missing-cert.tmpl          |   3 -
> + .../enveloped-x509-missing-cert.xml           |   3 -
> + .../enveloped-x509-same-subj-cert.tmpl        |   3 -
> + .../enveloped-x509-ski.tmpl                   |   3 -
> + .../aleksey-xmldsig-01/enveloped-x509-ski.xml |   3 -
> + .../enveloped-x509-subjectname.tmpl           |   3 -
> + .../enveloped-x509-subjectname.xml            |   3 -
> + 43 files changed, 46 insertions(+), 525 deletions(-)
> + delete mode 100644 examples/xmldsigverify.c
> +
> +diff --git a/docs/xmldsig-verifier.html b/docs/xmldsig-verifier.html
> +index befd21a6..c8381e98 100644
> +--- a/docs/xmldsig-verifier.html
> ++++ b/docs/xmldsig-verifier.html
> +@@ -47,11 +47,8 @@
> + <div align=3D"center">
> +         <h1>Online XML Digital Signature Verifer is retired as of Octob=
er, 2022</h1>
> +     </div>
> +-<p>If you are interested in verifying an XML Digital Signature, then yo=
u should consider using
> ++    <p>If you are interested in verifying an XML Digital Signature, the=
n you should consider using
> +     <a href=3D"xmlsec-man.html">the xmlsec command line tool</a>.
> +-    The source code for the Online XML Digital Signature Verifer is ava=
ilable on
> +-    <a href=3D"https://github.com/lsh123/xmlsec/blob/master/examples/xm=
ldsigverify.c">GitHub</a> and in the "examples/"
> +-    folder of the source tarfile.
> +     </p>
> + </td></tr></table></td>
> + </tr></table></body>
> +diff --git a/examples/Makefile b/examples/Makefile
> +index ff44cb7b..945f3dab 100644
> +--- a/examples/Makefile
> ++++ b/examples/Makefile
> +@@ -9,8 +9,7 @@ PROGRAMS =3D \
> +       $(PROGRAMS_SIGN) \
> +       $(PROGRAMS_VERIFY) \
> +       $(PROGRAMS_ENC) \
> +-      $(PROGRAMS_DEC) \
> +-      xmldsigverify
> ++      $(PROGRAMS_DEC)
> +
> + ifndef CC
> + CC    =3D gcc
> +diff --git a/examples/README.md b/examples/README.md
> +index f07a07cb..acf39c31 100644
> +--- a/examples/README.md
> ++++ b/examples/README.md
> +@@ -35,9 +35,10 @@ To run this example:
> + ./sign1 sign1-tmpl.xml rsakey.pem
> + ```
> +
> +-To sign a template file with `xmlsec1` command line utility (use `xmlse=
c` on Windows):
> ++To sign a template file with `xmlsec1` command line utility (use `xmlse=
c` on Windows).
> ++Note that in this example we set KeyName to be the same as the filename=
 of the private key:
> + ```
> +-xmlsec1 sign --privkey rsakey.pem --output sign1.xml sign1-tmpl.xml
> ++xmlsec1 sign --privkey:rsakey.pem rsakey.pem --output sign1.xml sign1-t=
mpl.xml
> + ```
> +
> + ### sign2: signing a file with a dynamicaly created template
> +@@ -108,10 +109,11 @@ To run this example:
> + ./verify2 sign2-res.xml rsapub.pem
> + ```
> +
> +-To verify a signed document with `xmlsec1` command line utility (use `x=
mlsec` on Windows):
> ++To verify a signed document with `xmlsec1` command line utility (use `x=
mlsec` on Windows).
> ++Note that in this example we set KeyName to be the same as the filename=
 of the private key:
> + ```
> +-xmlsec1 verify --pubkey rsapub.pem sign1-res.xml
> +-xmlsec1 verify --pubkey rsapub.pem sign2-res.xml
> ++xmlsec1 verify --pubkey:rsakey.pem rsapub.pem sign1-res.xml
> ++xmlsec1 verify --pubkey:rsakey.pem rsapub.pem sign2-res.xml
> + ```
> +
> + ### verify3: verifying an enveloped signature using X509 certificate
> +@@ -185,9 +187,10 @@ To run this example:
> + ```
> +
> + To encrypt binary data with a template file with `xmlsec1` command line
> +-utility (use `xmlsec` on Windows):
> ++utility (use `xmlsec` on Windows). Note that in this example we set Key=
Name to be
> ++the same as the filename of the key:
> + ```
> +-xmlsec1 encrypt --deskey deskey.bin  --binary-data binary.dat --output =
encrypt1.xml encrypt1-tmpl.xml
> ++xmlsec1 encrypt --deskey:deskey.bin deskey.bin  --binary-data binary.da=
t --output encrypt1.xml encrypt1-tmpl.xml
> + ```
> +
> + ### encrypt2: encrypting XML file using a dynamicaly created template
> +@@ -213,7 +216,8 @@ encrypt3-doc.xml    An example XML file for encrypti=
on by encrypt3.c
> + encrypt3-res.xml    The result of encryptin encrypt3-doc.xml by encrypt=
3.c
> + ```
> +
> +-To run this example:
> ++To run this example (note: we are using the private key here instead of=
 the public
> ++key to make decrypt3 example work)):
> + ```
> + ./encrypt3 encrypt3-doc.xml rsakey.pem
> + ```
> +@@ -244,11 +248,13 @@ To run this example:
> + ./decrypt2 encrypt2-res.xml deskey.bin
> + ```
> +
> +-To decrypt binary data with `xmlsec1` command line utility (use `xmlsec=
` on Windows):
> ++To decrypt binary data with `xmlsec1` command line utility (use `xmlsec=
` on Windows).
> ++Note that in this example we set KeyName to be the same as the filename=
 of the
> ++(private) key:
> + ```
> +-xmlsec1 decrypt --deskey deskey.bin encrypt1-res.xml
> +-xmlsec1 decrypt --deskey deskey.bin encrypt2-res.xml
> +-xmlsec1 decrypt --privkey rsakey.pem encrypt3-res.xml
> ++xmlsec1 decrypt --deskey:deskey.bin deskey.bin encrypt1-res.xml
> ++xmlsec1 decrypt --deskey:deskey.bin deskey.bin encrypt2-res.xml
> ++xmlsec1 decrypt --privkey:rsakey.pem rsakey.pem encrypt3-res.xml
> + ```
> +
> + ### decrypt3: decrypting binary file using custom keys manager
> +@@ -265,16 +271,6 @@ To run this example:
> + ./decrypt3 encrypt3-res.xml
> + ```
> +
> +-### xmldsigverify: CGI script for signatures verifications
> +-
> +-Files:
> +-```
> +-xmldsigverify.c     The source code
> +-```
> +-
> +-To run this example, install compiled xmldsigverify script into
> +-your web server cgi-bin directory.
> +-
> + ### Keys and certificates
> + ```
> + cacert.pem          Root (trusted) certificate
> +diff --git a/examples/decrypt1.c b/examples/decrypt1.c
> +index e069bd7a..c9d2ec38 100644
> +--- a/examples/decrypt1.c
> ++++ b/examples/decrypt1.c
> +@@ -52,8 +52,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -149,7 +147,7 @@ decrypt_file(const char* enc_file, const char* key_f=
ile) {
> +     assert(key_file);
> +
> +     /* load template */
> +-    doc =3D xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET);
> ++    doc =3D xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", enc_fil=
e);
> +         goto done;
> +diff --git a/examples/decrypt2.c b/examples/decrypt2.c
> +index 522af222..49be8e60 100644
> +--- a/examples/decrypt2.c
> ++++ b/examples/decrypt2.c
> +@@ -55,8 +55,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -232,7 +230,7 @@ decrypt_file(xmlSecKeysMngrPtr mngr, const char* enc=
_file) {
> +     assert(enc_file);
> +
> +     /* load template */
> +-    doc =3D xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET);
> ++    doc =3D xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", enc_fil=
e);
> +         goto done;
> +diff --git a/examples/decrypt3.c b/examples/decrypt3.c
> +index e24effc0..8fddfa70 100644
> +--- a/examples/decrypt3.c
> ++++ b/examples/decrypt3.c
> +@@ -58,8 +58,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -165,7 +163,7 @@ decrypt_file(xmlSecKeysMngrPtr mngr, const char* enc=
_file) {
> +     assert(enc_file);
> +
> +     /* load template */
> +-    doc =3D xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET);
> ++    doc =3D xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", enc_fil=
e);
> +         goto done;
> +diff --git a/examples/encrypt1-tmpl.xml b/examples/encrypt1-tmpl.xml
> +index 3d61a901..5c1a5f3f 100644
> +--- a/examples/encrypt1-tmpl.xml
> ++++ b/examples/encrypt1-tmpl.xml
> +@@ -1,12 +1,12 @@
> + <?xml version=3D"1.0"?>
> +-<!--
> +-XML Security Library example: Simple encryption template file for encry=
pt1 example.
> ++<!--
> ++XML Security Library example: Simple encryption template file for encry=
pt1 example.
> + -->
> + <EncryptedData xmlns=3D"http://www.w3.org/2001/04/xmlenc#">
> +     <EncryptionMethod Algorithm=3D"http://www.w3.org/2001/04/xmlenc#tri=
pledes-cbc"/>
> +     <KeyInfo xmlns=3D"http://www.w3.org/2000/09/xmldsig#">
> +-      <KeyName/>
> +-    </KeyInfo>
> ++      <KeyName>deskey.bin</KeyName>
> ++    </KeyInfo>
> +     <CipherData>
> +       <CipherValue></CipherValue>
> +     </CipherData>
> +diff --git a/examples/encrypt1.c b/examples/encrypt1.c
> +index ee3eaa8b..dc52ccf5 100644
> +--- a/examples/encrypt1.c
> ++++ b/examples/encrypt1.c
> +@@ -55,8 +55,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -156,7 +154,7 @@ encrypt_file(const char* tmpl_file, const char* key_=
file,
> +     assert(data);
> +
> +     /* load template */
> +-    doc =3D xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE=
_NONET);
> ++    doc =3D xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE=
_NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", tmpl_fi=
le);
> +         goto done;
> +diff --git a/examples/encrypt2.c b/examples/encrypt2.c
> +index 14b57af9..989afec3 100644
> +--- a/examples/encrypt2.c
> ++++ b/examples/encrypt2.c
> +@@ -56,8 +56,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -154,7 +152,7 @@ encrypt_file(const char* xml_file, const char* key_f=
ile) {
> +     assert(key_file);
> +
> +     /* load template */
> +-    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET);
> ++    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_fil=
e);
> +         goto done;
> +diff --git a/examples/encrypt3-res.xml b/examples/encrypt3-res.xml
> +index 2fca87e7..129771a6 100644
> +--- a/examples/encrypt3-res.xml
> ++++ b/examples/encrypt3-res.xml
> +@@ -11,13 +11,13 @@ XML Security Library example: Original XML doc file =
before encryption (encrypt3
> + <KeyName>rsakey.pem</KeyName>
> + </KeyInfo>
> + <CipherData>
> +-<CipherValue>QYYKljhcX20QyP20hYmq8CSES875oIdbrsjMOxnb0VnYDn01Jk00OIPpb9=
gdIdZg
> +-MLOtSy26mWrQ+XqfPGuyaA=3D=3D</CipherValue>
> ++<CipherValue>pFfhaCpQfHTOJ+mRN919Ia3JimY2AS/8u9pimLEWGGjh3egy3pE2st4+Yo=
VkpS4G
> ++XyUU4Ps+KRzsdJcKI4moXQ=3D=3D</CipherValue>
> + </CipherData>
> + </EncryptedKey>
> + </KeyInfo>
> + <CipherData>
> +-<CipherValue>+UiDv73SE8K8KwXuOmHLHK7N2hNWDakTAEu6NprbCdULC1w/LXT9FLtNRJ=
etmwwO
> +-XpBqTY56AAMeMgpxPWN3SPO0ETeQw7pR+bp0IjUvcGlFSXz6yE1qgQ=3D=3D</CipherVal=
ue>
> ++<CipherValue>PMuoILFXjCmMg2pCzrmJYZcySLsTzgGYRX2ymYV9tLVrNSPhWV2mwMHWMc=
hSWH9b
> ++8pRgdaJ3msWmN3EqqElV1Y5wEDQjB5nMz7Tsz3+QmrAxGfxj7bCPyw=3D=3D</CipherVal=
ue>
> + </CipherData>
> + </EncryptedData>
> +diff --git a/examples/encrypt3.c b/examples/encrypt3.c
> +index e3f23104..71a6a559 100644
> +--- a/examples/encrypt3.c
> ++++ b/examples/encrypt3.c
> +@@ -7,7 +7,8 @@
> +  * Usage:
> +  *      ./encrypt3 <xml-doc> <rsa-pem-key-file>
> +  *
> +- * Example:
> ++ * Example (note: we are using the private key here instead of the publ=
ic
> ++ * key to make decrypt3 example work):
> +  *      ./encrypt3 encrypt3-doc.xml rsakey.pem > encrypt3-res.xml
> +  *
> +  * The result could be decrypted with decrypt3 example:
> +@@ -58,8 +59,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -233,7 +232,7 @@ encrypt_file(xmlSecKeysMngrPtr mngr, const char* xml=
_file, const char* key_name)
> +     assert(key_name);
> +
> +     /* load template */
> +-    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET);
> ++    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_fil=
e);
> +         goto done;
> +diff --git a/examples/sign1-tmpl.xml b/examples/sign1-tmpl.xml
> +index ac71a949..34b96f6f 100644
> +--- a/examples/sign1-tmpl.xml
> ++++ b/examples/sign1-tmpl.xml
> +@@ -1,6 +1,6 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> ++<!--
> ++XML Security Library example: Simple signature template file for sign1 =
example.
> + -->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +@@ -20,7 +20,7 @@ XML Security Library example: Simple signature templat=
e file for sign1 example.
> +     </SignedInfo>
> +     <SignatureValue/>
> +     <KeyInfo>
> +-      <KeyName/>
> ++      <KeyName>rsakey.pem</KeyName>
> +     </KeyInfo>
> +   </Signature>
> + </Envelope>
> +diff --git a/examples/sign1.c b/examples/sign1.c
> +index be107333..e86d3604 100644
> +--- a/examples/sign1.c
> ++++ b/examples/sign1.c
> +@@ -54,8 +54,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -150,7 +148,7 @@ sign_file(const char* tmpl_file, const char* key_fil=
e) {
> +     assert(key_file);
> +
> +     /* load template */
> +-    doc =3D xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE=
_NONET);
> ++    doc =3D xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE=
_NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", tmpl_fi=
le);
> +         goto done;
> +diff --git a/examples/sign2.c b/examples/sign2.c
> +index 1a6ee936..a5408a0a 100644
> +--- a/examples/sign2.c
> ++++ b/examples/sign2.c
> +@@ -57,8 +57,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -156,7 +154,7 @@ sign_file(const char* xml_file, const char* key_file=
) {
> +     assert(key_file);
> +
> +     /* load doc file */
> +-    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET);
> ++    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_fil=
e);
> +         goto done;
> +diff --git a/examples/sign3.c b/examples/sign3.c
> +index de372e42..c927d946 100644
> +--- a/examples/sign3.c
> ++++ b/examples/sign3.c
> +@@ -61,8 +61,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -164,7 +162,7 @@ sign_file(const char* xml_file, const char* key_file=
, const char* cert_file) {
> +     assert(cert_file);
> +
> +     /* load doc file */
> +-    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET);
> ++    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_fil=
e);
> +         goto done;
> +diff --git a/examples/sign4.c b/examples/sign4.c
> +index bb5f03b3..012e4b63 100644
> +--- a/examples/sign4.c
> ++++ b/examples/sign4.c
> +@@ -60,8 +60,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -167,7 +165,7 @@ sign_file(const char* xml_file, const char* id_attr,=
 const char* key_file, const
> +     assert(cert_file);
> +
> +     /* load doc file */
> +-    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET);
> ++    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_fil=
e);
> +         goto done;
> +diff --git a/examples/verify-saml.c b/examples/verify-saml.c
> +index fea78a7f..95abaf0e 100644
> +--- a/examples/verify-saml.c
> ++++ b/examples/verify-saml.c
> +@@ -65,8 +65,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -221,7 +219,7 @@ verify_file(xmlSecKeysMngrPtr mngr, const char* xml_=
file) {
> +     assert(xml_file);
> +
> +     /* load file */
> +-    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET);
> ++    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_fil=
e);
> +         goto done;
> +diff --git a/examples/verify1.c b/examples/verify1.c
> +index 00ad07e1..73c6063f 100644
> +--- a/examples/verify1.c
> ++++ b/examples/verify1.c
> +@@ -53,8 +53,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -149,7 +147,7 @@ verify_file(const char* xml_file, const char* key_fi=
le) {
> +     assert(key_file);
> +
> +     /* load file */
> +-    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET);
> ++    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_fil=
e);
> +         goto done;
> +diff --git a/examples/verify2.c b/examples/verify2.c
> +index 377dccc5..f421f89f 100644
> +--- a/examples/verify2.c
> ++++ b/examples/verify2.c
> +@@ -56,8 +56,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +@@ -232,7 +230,7 @@ verify_file(xmlSecKeysMngrPtr mngr, const char* xml_=
file) {
> +     assert(xml_file);
> +
> +     /* load file */
> +-    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET);
> ++    doc =3D xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_=
NONET | XML_PARSE_NOENT);
> +     if ((doc =3D=3D NULL) || (xmlDocGetRootElement(doc) =3D=3D NULL)){
> +         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_fil=
e);
> +         goto done;
> +diff --git a/examples/verify3.c b/examples/verify3.c
> +index 558e3290..04dd32b0 100644
> +--- a/examples/verify3.c
> ++++ b/examples/verify3.c
> +@@ -57,8 +57,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +diff --git a/examples/verify4.c b/examples/verify4.c
> +index 705d8a5f..23a96918 100644
> +--- a/examples/verify4.c
> ++++ b/examples/verify4.c
> +@@ -57,8 +57,6 @@ main(int argc, char **argv) {
> +     /* Init libxml and libxslt libraries */
> +     xmlInitParser();
> +     LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +
> +     /* Init libxslt */
> + #ifndef XMLSEC_NO_XSLT
> +diff --git a/examples/xmldsigverify.c b/examples/xmldsigverify.c
> +deleted file mode 100644
> +index c6611f43..00000000
> +--- a/examples/xmldsigverify.c
> ++++ /dev/null
> +@@ -1,379 +0,0 @@
> +-/**
> +- * XML Security Library example: CGI verification script.
> +- *
> +- * This is free software; see Copyright file in the source
> +- * distribution for preciese wording.
> +- *
> +- * Copyright (C) 2002-2024 Aleksey Sanin <aleksey@aleksey.com>. All Rig=
hts Reserved.
> +- */
> +-#include <stdlib.h>
> +-#include <string.h>
> +-#include <assert.h>
> +-#include <dirent.h>
> +-
> +-#include <libxml/tree.h>
> +-#include <libxml/xmlmemory.h>
> +-#include <libxml/parser.h>
> +-
> +-#ifndef XMLSEC_NO_XSLT
> +-#include <libxslt/xslt.h>
> +-#include <libxslt/security.h>
> +-#endif /* XMLSEC_NO_XSLT */
> +-
> +-#include <xmlsec/xmlsec.h>
> +-#include <xmlsec/xmltree.h>
> +-#include <xmlsec/xmldsig.h>
> +-#include <xmlsec/crypto.h>
> +-
> +-#include <xmlsec/parser.h>
> +-/* #define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER   "/etc/httpd/con=
f/ssl.crt" */
> +-#define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER      "/var/www/cgi-b=
in/keys-certs.def"
> +-#define XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER              "/var/www/cgi-b=
in/keys-certs"
> +-
> +-
> +-int load_keys(xmlSecKeysMngrPtr mngr, const char* path, int report_load=
ed_keys);
> +-int load_trusted_certs(xmlSecKeysMngrPtr mngr, const char* path, int re=
port_loaded_certs);
> +-int verify_request(xmlSecKeysMngrPtr mngr);
> +-int url_decode(char *buf, size_t size);
> +-
> +-int
> +-main() {
> +-    xmlSecKeysMngrPtr mngr;
> +-#ifndef XMLSEC_NO_XSLT
> +-    xsltSecurityPrefsPtr xsltSecPrefs =3D NULL;
> +-#endif /* XMLSEC_NO_XSLT */
> +-
> +-    /* start response */
> +-    fprintf(stdout, "Content-type: text/plain\n");
> +-    fprintf(stdout, "\n");
> +-
> +-    /* Init libxml and libxslt libraries */
> +-    xmlInitParser();
> +-    LIBXML_TEST_VERSION
> +-    xmlLoadExtDtdDefaultValue =3D XML_DETECT_IDS | XML_COMPLETE_ATTRS;
> +-    xmlSubstituteEntitiesDefault(1);
> +-
> +-    /* make sure that we print out everything to stdout */
> +-    xmlGenericErrorContext =3D stdout;
> +-
> +-    /* Init libxslt */
> +-#ifndef XMLSEC_NO_XSLT
> +-    /* disable everything */
> +-    xsltSecPrefs =3D xsltNewSecurityPrefs();
> +-    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_READ_FILE,        =
xsltSecurityForbid);
> +-    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_WRITE_FILE,       =
xsltSecurityForbid);
> +-    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_CREATE_DIRECTORY, =
xsltSecurityForbid);
> +-    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_READ_NETWORK,     =
xsltSecurityForbid);
> +-    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_WRITE_NETWORK,    =
xsltSecurityForbid);
> +-    xsltSetDefaultSecurityPrefs(xsltSecPrefs);
> +-#endif /* XMLSEC_NO_XSLT */
> +-
> +-    /* Init xmlsec library */
> +-    if(xmlSecInit() < 0) {
> +-        fprintf(stdout, "Error: xmlsec initialization failed.\n");
> +-        return(-1);
> +-    }
> +-
> +-    /* Check loaded library version */
> +-    if(xmlSecCheckVersion() !=3D 1) {
> +-        fprintf(stdout, "Error: loaded xmlsec library version is not co=
mpatible.\n");
> +-        return(-1);
> +-    }
> +-
> +-    /* Load default crypto engine if we are supporting dynamic
> +-     * loading for xmlsec-crypto libraries. Use the crypto library
> +-     * name ("openssl", "nss", etc.) to load corresponding
> +-     * xmlsec-crypto library.
> +-     */
> +-#ifdef XMLSEC_CRYPTO_DYNAMIC_LOADING
> +-    if(xmlSecCryptoDLLoadLibrary(NULL) < 0) {
> +-        fprintf(stdout, "Error: unable to load default xmlsec-crypto li=
brary. Make sure\n"
> +-                        "that you have it installed and check shared li=
braries path\n"
> +-                        "(LD_LIBRARY_PATH and/or LTDL_LIBRARY_PATH) env=
ironment variables.\n");
> +-        return(-1);
> +-    }
> +-#endif /* XMLSEC_CRYPTO_DYNAMIC_LOADING */
> +-
> +-    /* Init crypto library */
> +-    if(xmlSecCryptoAppInit(XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER) =
< 0) {
> +-        fprintf(stdout, "Error: crypto initialization failed.\n");
> +-        return(-1);
> +-    }
> +-
> +-    /* Init xmlsec-crypto library */
> +-    if(xmlSecCryptoInit() < 0) {
> +-        fprintf(stdout, "Error: xmlsec-crypto initialization failed.\n"=
);
> +-        return(-1);
> +-    }
> +-
> +-    /* create keys manager */
> +-    mngr =3D xmlSecKeysMngrCreate();
> +-    if(mngr =3D=3D NULL) {
> +-        fprintf(stdout, "Error: failed to create keys manager.\n");
> +-        return(-1);
> +-    }
> +-    if(xmlSecCryptoAppDefaultKeysMngrInit(mngr) < 0) {
> +-        fprintf(stdout, "Error: failed to initialize keys manager.\n");
> +-        return(-1);
> +-    }
> +-
> +-    if(load_keys(mngr, XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER, 0) < 0) {
> +-        xmlSecKeysMngrDestroy(mngr);
> +-        return(-1);
> +-    }
> +-
> +-    if(load_trusted_certs(mngr, XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER, 0) =
< 0) {
> +-        xmlSecKeysMngrDestroy(mngr);
> +-        return(-1);
> +-    }
> +-
> +-    if(verify_request(mngr) < 0) {
> +-        xmlSecKeysMngrDestroy(mngr);
> +-        return(-1);
> +-    }
> +-
> +-    /* Destroy keys manager */
> +-    xmlSecKeysMngrDestroy(mngr);
> +-
> +-    /* Shutdown xmlsec-crypto library */
> +-    xmlSecCryptoShutdown();
> +-
> +-    /* Shutdown crypto library */
> +-    xmlSecCryptoAppShutdown();
> +-
> +-    /* Shutdown xmlsec library */
> +-    xmlSecShutdown();
> +-
> +-    /* Shutdown libxslt/libxml */
> +-#ifndef XMLSEC_NO_XSLT
> +-    xsltFreeSecurityPrefs(xsltSecPrefs);
> +-    xsltCleanupGlobals();
> +-#endif /* XMLSEC_NO_XSLT */
> +-
> +-    xmlCleanupParser();
> +-
> +-    return(0);
> +-}
> +-
> +-/**
> +- * load_trusted_certs:
> +- * @mngr:       the keys manager.
> +- * @path:       the path to a folder that contains trusted certificates=
.
> +- *
> +- * Loads trusted certificates from @path.
> +- *
> +- * Returns 0 on success or a negative value if an error occurs.
> +- */
> +-int load_trusted_certs(xmlSecKeysMngrPtr mngr, const char* path, int re=
port_loaded_certs) {
> +-    DIR* dir;
> +-    struct dirent* entry;
> +-    char filename[2048];
> +-    int len;
> +-
> +-    assert(mngr);
> +-    assert(path);
> +-
> +-    dir =3D opendir(path);
> +-    if(dir =3D=3D NULL) {
> +-        fprintf(stdout, "Error: failed to open folder \"%s\".\n", path)=
;
> +-        return(-1);
> +-    }
> +-    while((entry =3D readdir(dir)) !=3D NULL) {
> +-        assert(entry->d_name);
> +-        len =3D strlen(entry->d_name);
> +-        if((len > 4) && (strcmp(entry->d_name + len - 4, ".pem") =3D=3D=
 0)) {
> +-            snprintf(filename, sizeof(filename), "%s/%s", path, entry->=
d_name);
> +-            if(xmlSecCryptoAppKeysMngrCertLoad(mngr, filename, xmlSecKe=
yDataFormatPem, xmlSecKeyDataTypeTrusted) < 0) {
> +-                fprintf(stdout,"Error: failed to load pem certificate f=
rom \"%s\"\n", filename);
> +-                closedir(dir);
> +-                return(-1);
> +-            }
> +-            if(report_loaded_certs) {
> +-                fprintf(stdout, "Loaded trusted certificate from \"%s\"=
...\n", filename);
> +-            }
> +-        } else if((len > 4) && (strcmp(entry->d_name + len - 4, ".der")=
 =3D=3D 0)) {
> +-            snprintf(filename, sizeof(filename), "%s/%s", path, entry->=
d_name);
> +-            if(xmlSecCryptoAppKeysMngrCertLoad(mngr, filename, xmlSecKe=
yDataFormatDer, xmlSecKeyDataTypeTrusted) < 0) {
> +-                fprintf(stdout,"Error: failed to load der certificate f=
rom \"%s\"\n", filename);
> +-                closedir(dir);
> +-                return(-1);
> +-            }
> +-            if(report_loaded_certs) {
> +-                fprintf(stdout, "Loaded trusted certificate from \"%s\"=
...\n", filename);
> +-            }
> +-        }
> +-    }
> +-    closedir(dir);
> +-    return(0);
> +-}
> +-
> +-int load_keys(xmlSecKeysMngrPtr mngr, const char* path, int report_load=
ed_keys) {
> +-    char filename[256];
> +-
> +-    assert(mngr);
> +-
> +-    snprintf(filename, sizeof(filename), "%s/keys.xml", path);
> +-    if(xmlSecCryptoAppDefaultKeysMngrLoad(mngr, filename) < 0) {
> +-        fprintf(stdout,"Error: failed to load keys from \"%s\"\n", file=
name);
> +-        return(-1);
> +-    }
> +-
> +-    if(report_loaded_keys) {
> +-        fprintf(stdout, "Loaded keys from \"%s\"...\n", filename);
> +-    }
> +-    return(0);
> +-}
> +-
> +-
> +-/**
> +- * verify_request:
> +- * @mng:                the keys manager
> +- *
> +- * Verifies XML signature in the request (stdin).
> +- *
> +- * Returns 0 on success or a negative value if an error occurs.
> +- */
> +-int
> +-verify_request(xmlSecKeysMngrPtr mngr) {
> +-    xmlBufferPtr buffer =3D NULL;
> +-    xmlSecByte buf[256];
> +-    xmlDocPtr doc =3D NULL;
> +-    xmlNodePtr node =3D NULL;
> +-    xmlSecDSigCtxPtr dsigCtx =3D NULL;
> +-    int ret;
> +-    int res =3D -1;
> +-
> +-    assert(mngr);
> +-
> +-    /* load request in the buffer */
> +-    buffer =3D xmlBufferCreate();
> +-    if(buffer =3D=3D NULL) {
> +-        fprintf(stdout,"Error: failed to create buffer\n");
> +-        goto done;
> +-    }
> +-
> +-    while(!feof(stdin)) {
> +-        ret =3D fread(buf, 1, sizeof(buf), stdin);
> +-        if(ret < 0) {
> +-            fprintf(stdout,"Error: read failed\n");
> +-            goto done;
> +-        }
> +-        xmlBufferAdd(buffer, buf, (xmlSecSize)ret);
> +-    }
> +-
> +-    /* is the document submitted from the form? */
> +-    if(strncmp((char*)xmlBufferContent(buffer), "_xmldoc=3D", 8) =3D=3D=
 0) {
> +-        xmlBufferShrink(buffer, 8);
> +-        buffer->use =3D url_decode((char*)xmlBufferContent(buffer), xml=
BufferLength(buffer));
> +-    }
> +-
> +-    /**
> +-     * Load doc
> +-     */
> +-    xmlSecParserSetDefaultOptions(XML_PARSE_NOENT | XML_PARSE_NOCDATA |
> +-                        XML_PARSE_PEDANTIC | XML_PARSE_NOCDATA);
> +-    doc =3D xmlReadMemory((const char*)xmlBufferContent(buffer), xmlBuf=
ferLength(buffer),
> +-        NULL, NULL, xmlSecParserGetDefaultOptions());
> +-    if (doc =3D=3D NULL) {
> +-        fprintf(stdout, "Error: unable to parse xml document (syntax er=
ror)\n");
> +-        goto done;
> +-    }
> +-
> +-    /*
> +-     * Check the document is of the right kind
> +-     */
> +-    if(xmlDocGetRootElement(doc) =3D=3D NULL) {
> +-        fprintf(stdout,"Error: empty document\n");
> +-        goto done;
> +-    }
> +-
> +-    /* find start node */
> +-    node =3D xmlSecFindNode(xmlDocGetRootElement(doc), xmlSecNodeSignat=
ure, xmlSecDSigNs);
> +-    if(node =3D=3D NULL) {
> +-        fprintf(stdout, "Error: start <dsig:Signature/> node not found\=
n");
> +-        goto done;
> +-    }
> +-
> +-    /* create signature context */
> +-    dsigCtx =3D xmlSecDSigCtxCreate(mngr);
> +-    if(dsigCtx =3D=3D NULL) {
> +-        fprintf(stdout,"Error: failed to create signature context\n");
> +-        goto done;
> +-    }
> +-
> +-    /* we would like to store and print out everything */
> +-    /* actually we would not because it opens a security hole
> +-    dsigCtx->flags =3D XMLSEC_DSIG_FLAGS_STORE_SIGNEDINFO_REFERENCES |
> +-                     XMLSEC_DSIG_FLAGS_STORE_MANIFEST_REFERENCES |
> +-                     XMLSEC_DSIG_FLAGS_STORE_SIGNATURE;
> +-    */
> +-
> +-    /* Verify signature */
> +-    if(xmlSecDSigCtxVerify(dsigCtx, node) < 0) {
> +-        fprintf(stdout,"Error: signature verification failed\n");
> +-        goto done;
> +-    }
> +-
> +-    /* print verification result to stdout */
> +-    if(dsigCtx->status =3D=3D xmlSecDSigStatusSucceeded) {
> +-        fprintf(stdout, "RESULT: Signature is OK\n");
> +-    } else {
> +-        fprintf(stdout, "RESULT: Signature is INVALID\n");
> +-    }
> +-    fprintf(stdout, "--------------------------------------------------=
-\n");
> +-    xmlSecDSigCtxDebugDump(dsigCtx, stdout);
> +-
> +-    /* success */
> +-    res =3D 0;
> +-
> +-done:
> +-    /* cleanup */
> +-    if(dsigCtx !=3D NULL) {
> +-        xmlSecDSigCtxDestroy(dsigCtx);
> +-    }
> +-
> +-    if(doc !=3D NULL) {
> +-        xmlFreeDoc(doc);
> +-    }
> +-
> +-    if(buffer !=3D NULL) {
> +-        xmlBufferFree(buffer);
> +-    }
> +-    return(res);
> +-}
> +-
> +-/* not the best way to do it */
> +-#define toHex(c) ( ( ('0' <=3D (c)) && ((c) <=3D '9') ) ? (c) - '0' : \
> +-                 ( ( ('A' <=3D (c)) && ((c) <=3D 'F') ) ? (c) - 'A' + 1=
0 : 0 ) )
> +-
> +-/**
> +- * url_decode:
> +- * @buf:        the input buffer.
> +- * @size:       the input buffer size.
> +- *
> +- * Does url decoding in-place.
> +- *
> +- * Returns length of the decoded result on success or
> +- * a negative value if an error occurs.
> +- */
> +-int url_decode(char *buf, size_t size) {
> +-    size_t ii, jj;
> +-    char ch;
> +-
> +-    assert(buf);
> +-
> +-    for(ii =3D jj =3D 0; ii < size; ++ii, ++jj) {
> +-        ch =3D buf[ii];
> +-        if((ch =3D=3D '%') && ((ii + 2) < size)) {
> +-            buf[jj] =3D (char)(toHex(buf[ii + 1]) * 16 + toHex(buf[ii +=
 2]));
> +-            ii +=3D 2;
> +-        } else if(ch =3D=3D '+') {
> +-            buf[jj] =3D ' ';
> +-        } else if(ii !=3D jj){
> +-            buf[jj] =3D buf[ii];
> +-        }
> +-    }
> +-    return((int)jj);
> +-}
> +-
> +-
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-gost2001.xml b/tests/ale=
ksey-xmldsig-01/enveloped-gost2001.xml
> +index a00b1a91..d2535e92 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-gost2001.xml
> ++++ b/tests/aleksey-xmldsig-01/enveloped-gost2001.xml
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl b/=
tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl
> +index b1aef672..90c53215 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml b/t=
ests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml
> +index 51813562..d0b7272f 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl =
b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl
> +index fe5e8e5d..6737c0e8 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml b=
/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml
> +index 865770bf..06a76abd 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl =
b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl
> +index 3ccee872..86755bc8 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml b=
/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml
> +index 33c16f5d..283ebf57 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl =
b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl
> +index 2342efb5..f0513280 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml b=
/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml
> +index ca8581ce..384fcdaa 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl =
b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl
> +index 4c4d5e2c..05572e63 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml b=
/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml
> +index 2ff30400..c781cc0f 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl b=
/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl
> +index 48160c0b..bc7f712d 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml b/=
tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml
> +index d7ff383f..5adbecac 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl b=
/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl
> +index 915dd55c..9e1cd393 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml b/=
tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml
> +index 2a517e0e..3dcba72e 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl=
 b/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl
> +index 915dd55c..9e1cd393 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-ski.tmpl b/tests/al=
eksey-xmldsig-01/enveloped-x509-ski.tmpl
> +index 542680a9..adf7084c 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-ski.tmpl
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-ski.tmpl
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-ski.xml b/tests/ale=
ksey-xmldsig-01/enveloped-x509-ski.xml
> +index 68b2c554..89e77f0f 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-ski.xml
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-ski.xml
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl b/=
tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl
> +index ba982e63..868540cf 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> +diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml b/t=
ests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml
> +index daa82e85..b4cfdb85 100644
> +--- a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml
> ++++ b/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml
> +@@ -1,7 +1,4 @@
> + <?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +-<!--
> +-XML Security Library example: Simple signature template file for sign1 =
example.
> +--->
> + <Envelope xmlns=3D"urn:envelope">
> +   <Data>
> +       Hello, World!
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest b/meta-oe/=
recipes-support/xmlsec1/xmlsec1/run-ptest
> index afd8c69853..edb5f7a4b9 100755
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest
> @@ -8,78 +8,130 @@ check_return() {
>      fi
>  }
>
> -echo "---------------------------------------------------"
> +echo "------------------------------------------------------------------=
-----------------------------"
>  echo "Signing a template file..."
>  ./sign1 sign1-tmpl.xml rsakey.pem > sign1-res.xml
> -./verify1 sign1-res.xml rsapub.pem
>  check_return sign-tmpl
>
> -echo "---------------------------------------------------"
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Signing a template file with xmlsec1..."
> +xmlsec1 sign --privkey:rsakey.pem rsakey.pem --output sign1-res-xmlsec1.=
xml sign1-tmpl.xml
> +check_return sign-tmpl-xmlsec1
> +
> +echo "------------------------------------------------------------------=
-----------------------------"
>  echo "Signing a dynamicaly created template..."
>  ./sign2 sign2-doc.xml rsakey.pem > sign2-res.xml
> -./verify1 sign2-res.xml rsapub.pem
>  check_return sign-dynamic-templ
>
> -echo "---------------------------------------------------"
> -echo "Signing with X509 certificate..."
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Signing a file with a dynamicaly created template and an X509 cert=
ificate..."
>  ./sign3 sign3-doc.xml rsakey.pem rsacert.pem > sign3-res.xml
> -./verify3 sign3-res.xml ca2cert.pem cacert.pem
> -check_return sign-x509
> +check_return sign-dynamic-templ-x509
>
> -echo "---------------------------------------------------"
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Signing a node in a file with a dynamicaly created template and an=
 X509 certificate..."
> +./sign4 sign4-doc.xml "data" rsakey.pem rsacert.pem > sign4-res.xml
> +check_return sign-file-node-dynamic-templ-x509
> +
> +echo "------------------------------------------------------------------=
-----------------------------"
>  echo "Verifying a signature with a single key..."
>  ./verify1 sign1-res.xml rsapub.pem
> +check_return verify-single-key-1
>  ./verify1 sign2-res.xml rsapub.pem
> -check_return verify-single-key
> +check_return verify-single-key-2
>
> -echo "---------------------------------------------------"
> +echo "------------------------------------------------------------------=
-----------------------------"
>  echo "Verifying a signature with keys manager..."
>  ./verify2 sign1-res.xml rsakey.pem
> +check_return verify-keys-1-manager
>  ./verify2 sign2-res.xml rsakey.pem
> -check_return verify-keys-manager
> +check_return verify-keys-2-manager
> +
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Verifying a signature with xmlsec1..."
> +xmlsec1 verify --pubkey:rsakey.pem rsapub.pem sign1-res-xmlsec1.xml
> +check_return verify-keys-1-xmlsec1
> +xmlsec1 verify --pubkey:rsakey.pem rsapub.pem sign2-res.xml
> +check_return verify-keys-2-xmlsec1
>
> -echo "---------------------------------------------------"
> +echo "------------------------------------------------------------------=
-----------------------------"
>  echo "Verifying a signature with X509 certificates..."
>  ./verify3 sign3-res.xml ca2cert.pem cacert.pem
>  check_return verify-x509
>
> -echo "---------------------------------------------------"
> -echo "Verifying a signature with additional restrictions..."
> -./verify4 verify4-res.xml ca2cert.pem cacert.pem
> -check_return verify-res
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Verifying a signature using X509 certificates with xmlsec1..."
> +xmlsec1 verify --untrusted ca2cert.pem --trusted cacert.pem sign3-res.xm=
l
> +check_return verify-x509-xmlsec1
> +
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Verifying a signature over a node using X509 certificate..."
> +./verify4 sign4-res.xml "data" ca2cert.pem cacert.pem
> +check_return verify-node-x509
> +
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Verifying a signature over a node using X509 certificate with xmls=
ec1..."
> +xmlsec1 verify --add-id-attr ID --untrusted ca2cert.pem --trusted cacert=
.pem sign4-res.xml
> +check_return verify-node-x509-xmlsec1
>
> -echo "---------------------------------------------------"
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Verifying a simple SAML response using X509 certificate..."
> +./verify-saml verify-saml-res.xml ca2cert.pem cacert.pem
> +check_return verify-sampl-x509
> +
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Verifying a simple SAML response using X509 certificate with xmlse=
c1..."
> +xmlsec1 verify --trusted ca2cert.pem --trusted cacert.pem verify-saml-re=
s.xml
> +check_return verify-sampl-x509-xmlsec1
> +
> +echo "------------------------------------------------------------------=
-----------------------------"
>  echo "Encrypting data with a template file..."
>  ./encrypt1 encrypt1-tmpl.xml deskey.bin > encrypt1-res.xml
> -./decrypt1 encrypt1-res.xml deskey.bin
>  check_return encrypt-tmpl
>
> -echo "---------------------------------------------------"
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Encrypting data with a template file with xmlsec1..."
> +xmlsec1 encrypt --deskey:deskey.bin deskey.bin  --binary-data binary.dat=
 --output encrypt1-res-xmlsec1.xml encrypt1-tmpl.xml
> +check_return encrypt-tmpl-xmlsec1
> +
> +echo "------------------------------------------------------------------=
-----------------------------"
>  echo "Encrypting data with a dynamicaly created template..."
>  ./encrypt2 encrypt2-doc.xml deskey.bin > encrypt2-res.xml
> -./decrypt1 encrypt2-res.xml deskey.bin
>  check_return encrypt-dynamic-tmpl
>
> -echo "---------------------------------------------------"
> +echo "------------------------------------------------------------------=
-----------------------------"
>  echo "Encrypting data with a session key..."
>  ./encrypt3 encrypt3-doc.xml rsakey.pem > encrypt3-res.xml
> -./decrypt3 encrypt3-res.xml
>  check_return encrypt-session-key
>
> -echo "---------------------------------------------------"
> +echo "------------------------------------------------------------------=
-----------------------------"
>  echo "Decrypting data with a single key..."
>  ./decrypt1 encrypt1-res.xml deskey.bin
> +check_return decrypt-single-key-1
>  ./decrypt1 encrypt2-res.xml deskey.bin
> -check_return encrypt-single-key
> +check_return decrypt-single-key-2
>
> -echo "---------------------------------------------------"
> +echo "------------------------------------------------------------------=
-----------------------------"
>  echo "Decrypting data with keys manager..."
>  ./decrypt2 encrypt1-res.xml deskey.bin
> +check_return decrypt-keys-1-manager
>  ./decrypt2 encrypt2-res.xml deskey.bin
> -check_return encrypt-keys-manager
> +check_return decrypt-keys-2-manager
>
> -echo "---------------------------------------------------"
> -echo "Writing a custom keys manager..."
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Decrypting data with xmlsec1..."
> +xmlsec1 decrypt --deskey:deskey.bin deskey.bin encrypt1-res-xmlsec1.xml
> +check_return decrypt-key-1-xmlsec1
> +xmlsec1 decrypt --deskey:deskey.bin deskey.bin encrypt2-res.xml
> +check_return decrypt-key-2-xmlsec1
> +xmlsec1 decrypt --privkey:rsakey.pem rsakey.pem encrypt3-res.xml
> +check_return decrypt-key-3-xmlsec1
> +
> +echo "------------------------------------------------------------------=
-----------------------------"
> +echo "Decrypting using custom keys manager..."
>  ./decrypt3 encrypt1-res.xml
> +check_return decrypt-keys-1-manager
>  ./decrypt3 encrypt2-res.xml
> -check_return write-keys-manager
> +check_return decrypt-keys-2-manager
> +./decrypt3 encrypt3-res.xml
> +check_return decrypt-keys-3-manager
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb b/meta-oe/r=
ecipes-support/xmlsec1/xmlsec1_1.3.9.bb
> similarity index 79%
> rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
> rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
> index 1990444dcc..ca6ebba59c 100644
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
> @@ -13,16 +13,17 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D352791d620=
92ea8104f085042de7f4d0"
>  SECTION =3D "libs"
>
>  SRC_URI =3D "https://github.com/lsh123/xmlsec/releases/download/${PV}/${=
BP}.tar.gz \
> -           file://fix-ltmain.sh.patch \
> -           file://change-finding-path-of-nss.patch \
> -           file://makefile-ptest.patch \
> -           file://xmlsec1-examples-allow-build-in-separate-dir.patch \
> -           file://0001-nss-nspr-fix-for-multilib.patch \
> +           file://0001-force-to-use-our-own-libtool.patch \
> +           file://0002-change-finding-path-of-nss-and-nspr.patch \
> +           file://0003-xmlsec1-add-new-recipe.patch \
> +           file://0004-examples-allow-build-in-separate-dir.patch \
> +           file://0005-nss-nspr-fix-for-multilib.patch \
> +           file://0006-xmlsec1-Fix-configure-QA-error-caused-by-host-loo=
kup.patch \
> +           file://0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-=
and.patch \
>             file://run-ptest \
> -           file://ensure-search-path-non-host.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "d82e93b69b8aa205a616b62917a269322bf63a3eaafb3775=
014e61752b2013ea"
> +SRC_URI[sha256sum] =3D "a631c8cd7a6b86e6adb9f5b935d45a9cf9768b3cb090d461=
e8eb9d043cf9b62f"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/lsh123/xmlsec/releases"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/(?P<pver>\d+(\.\d+)+)"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121792): https://lists.openembedded.org/g/openembedde=
d-devel/message/121792
> Mute This Topic: https://lists.openembedded.org/mt/116349307/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


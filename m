Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084A9FB5173
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 22:21:14 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66779.1775514063933267168
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 15:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KapE9K6q;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40423dbe98bso1675279fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 15:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775514063; cv=none;
        d=google.com; s=arc-20240605;
        b=kK+Mz3aCUT3FltY4lWz/tAXL6u+tbT9gOy85/q7MD0Hf+uMZXyOCd3B8L/I/sh9nSw
         hel0ij6a2xRgXvFh3ikwarmL6Wb8CpdHZfpFqajLGSzvXUpjTZRUURdMAX8EOn6qH4Ud
         sfu3e6k7F4CSHZiOq1c2TW3wO+fGN6Z76eipidxVTVYZAYTvR5fUysRW2NXTszCjncUa
         bDTpQtIPnesHY+ubWEuZ/v6WqHwoK1gTLb+DWOneqN7HhF1w+BggojuwHFKLwGFYboLJ
         crofEWNIWsFZydyZ4H2rZynD72TW7e2Q5yoJlNUpp+JsHBAJfI64KJ4SpNFKcA9RRmH9
         c9IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zq0wFDnE/NRleFc7L5Q5VYqr/6HvI99d9cl4hDTm3Lw=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=SnJ5WN2BwU+1VovPHfcl1Wn6vi0vqFNaKZke+AA45kySOHtCM4lbS53b49MTA9kRct
         o8NEAIv6ANWx6sILmQ6LjMiSizATRHJYZj9WXKcs30gXzqEEHvcX0M1WzDPtVIyHi2Vd
         qsosJlgaLgzbxr0nYhzv+O6c9/mHBf7ikc1gAst+hvYqtqnadFH8YFAGcFGaIRuURjE0
         YisulWmAO9DuHzah7wyuX4CvLedAFE7/AirZ4/Af0TC4VeMyw07z30fFDQG4vbVls1Hl
         ZH2HQlVHM0quWhJN2uvMbZgPfyyd7htpShSbg6T9c9NMsmJTs80PaH3L4nKimZ8y39qx
         Queg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775514063; x=1776118863; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0wFDnE/NRleFc7L5Q5VYqr/6HvI99d9cl4hDTm3Lw=;
        b=KapE9K6qvV2+k9nJCjUryLcwRI/nZ1K31a9q7KQckDZ8S8aG3Z5gMW7ltwrF8XbDs0
         0Jjj1d4YHnZ1l3TWpee685eYi97fXTfm8Pl7N+JwV43o9VIw5eeNOptVDb9Z/PO4V/wd
         udPtdY8zrclKyhpEigFNA8cDYAhWezyPqykakI4EJFvie/Xqem32ZB/LPZL6u20jJpK8
         kHz2q1A3dHrc+R8TtaB6Ou8M6Sk71JzQVq55iNSBzQon1QZ/6CD5nhhHJ/zMhyyyDcmz
         FjLcSkSTqjM/u1oCDza7nsB+LEpFKgEhStThbA8PqB9h3+ZLkhlzUwQ79qRPM7TXFxha
         CbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775514063; x=1776118863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zq0wFDnE/NRleFc7L5Q5VYqr/6HvI99d9cl4hDTm3Lw=;
        b=SP4LUDTSiMZVg/1Yy7BebfI3490+qn6qlRzK5dFcOA3Yn/Dz+dgpNF6sr83AqnDu95
         eB0bsbWyRIIJCa0b4umPZga+6jzwG4BC3Cz9yMdrcCthw1kQL1MI+ph0TKaJavWT6gBI
         NyvWURVdcpIx+efuVKpBK7NPExFVy3GlRJPXNgOVkgd6vFs5kQ7gDpXjOseLjf2n5eAD
         RmcSM1wDJn6Sri2K5hDWXYFaj2EBTECQEP6MjPOmheQTDpMbX9EvKwvuokYsTXfetJ0P
         VGojq5ieXZR0AqLvBwHum2CSr5OkV7xj05QD6jxrL86EmGuYylQcUNV4zlPst+F6umfY
         YSDw==
X-Gm-Message-State: AOJu0Yz0FPXWJGRFYuWkuCsKCJ2bX8qk90Bjo8VrZ2YsNNwAK32cGb49
	1j8v7hkFOhaDEG84VHbSSJlFHGM02gSdo10AkAvz7p8vaoxTRPR9C/JgsHbWgf5WXsBwj9MiYv+
	DUWQhYhQDSE8IzM0Br9+iAVwqdz7UFVUnCoxW
X-Gm-Gg: AeBDieseOqurKmjc+jnbK/pLl0NH+fn+QNpAAaN2nVRIcov3hbaBs843MGQr5V6U7qN
	UYgBeC8jQ7Uqk3TExp7pyJ0ylRi1BXebCfCj3FyvMFE/6aujwh0UaXBoHZMyGUMhzdWKbeQx1yZ
	QaaQKn5JID1f0ZeioFJQyJDuPP/MeHngBmUXBDUcx6dTXFWolWSisQVvT1nxsPrvmj8iEOPd5ed
	9oP8CjStpY207emI538Ix3SN/KPBABrtJ9yr+TuXYAovzJT94BfTgtMcODW0koyTrtD3AvXGEyg
	h6jXmMaI
X-Received: by 2002:a05:6820:c98:b0:680:a893:146c with SMTP id
 006d021491bc7-6821d23845cmr7354841eaf.8.1775514063027; Mon, 06 Apr 2026
 15:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <18A3DA03CDF37206.657799@lists.openembedded.org> <714ae3cf-461f-4fcb-9647-ea4ee5e37bd3@gmail.com>
In-Reply-To: <714ae3cf-461f-4fcb-9647-ea4ee5e37bd3@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 7 Apr 2026 10:20:52 +1200
X-Gm-Features: AQROBzAeSepCRpyLBlf7-GvvelCUguGq84pXHKN6C9ekNI_i9EhvSAML7VdYDP0
Message-ID: <CADySD0EZN94dbSQJ57oogo1cXm6FmihU6DmhTkpW0pQAEkJOLw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][whinlatter][PATCH 1/2] dovecot: patch CVE-2025-59031
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 22:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126068

On Tue, Apr 7, 2026 at 7:11=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This patch is kinda heavy handed - it removes a feature that was
> considered terminally vulnerable.
> Alternatively we can also just live with this in the stable branches,
> with a note or something in the recipe.
> Though CVE scores are pretty random, fwiw this one rolled 4.3.
>

I agree and the users can decide whether to use this script or not.
At least the patch is not going to cause a regression in the stable
branch recipe.

cheers
Ankur

> On 4/6/26 21:06, Gyorgy Sarvari via lists.openembedded.org wrote:
> > Details: https://nvd.nist.gov/vuln/detail/CVE-2025-59031
> >
> > Backport the patch that was identified[1] by Debian.
> >
> > [1]: https://security-tracker.debian.org/tracker/CVE-2025-59031
> >
> > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > ---
> >  .../dovecot/dovecot/CVE-2025-59031.patch      | 142 ++++++++++++++++++
> >  .../dovecot/dovecot_2.4.1-4.bb                |   1 +
> >  2 files changed, 143 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE=
-2025-59031.patch
> >
> > diff --git a/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-5=
9031.patch b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-59031=
.patch
> > new file mode 100644
> > index 0000000000..6f13502422
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/dovecot/dovecot/CVE-2025-59031.pa=
tch
> > @@ -0,0 +1,142 @@
> > +From aac45a278d95afeec8c702b5b4966ea0a96e5ad6 Mon Sep 17 00:00:00 2001
> > +From: Aki Tuomi <aki.tuomi@open-xchange.com>
> > +Date: Thu, 8 Jan 2026 08:51:59 +0200
> > +Subject: [PATCH] fts: Remove decode2text.sh
> > +
> > +The script is flawed and not fit for production use, should
> > +recommend writing your own script, or using Apache Tika.
> > +
> > +CVE: CVE-2025-59031
> > +Upstream-Status: Backport [https://github.com/dovecot/core/commit/36a9=
5e7fa6b913db6c03a15862628b06be66eb3e]
> > +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > +---
> > + src/plugins/fts/Makefile.am    |   3 -
> > + src/plugins/fts/decode2text.sh | 105 --------------------------------=
-
> > + 2 files changed, 108 deletions(-)
> > + delete mode 100755 src/plugins/fts/decode2text.sh
> > +
> > +diff --git a/src/plugins/fts/Makefile.am b/src/plugins/fts/Makefile.am
> > +index ae57d8f..4485cf4 100644
> > +--- a/src/plugins/fts/Makefile.am
> > ++++ b/src/plugins/fts/Makefile.am
> > +@@ -65,9 +65,6 @@ xml2text_CPPFLAGS =3D $(AM_CPPFLAGS) $(BINARY_CFLAGS=
)
> > + xml2text_LDADD =3D $(LIBDOVECOT) $(BINARY_LDFLAGS)
> > + xml2text_DEPENDENCIES =3D $(module_LTLIBRARIES) $(LIBDOVECOT_DEPS)
> > +
> > +-pkglibexec_SCRIPTS =3D decode2text.sh
> > +-EXTRA_DIST =3D $(pkglibexec_SCRIPTS)
> > +-
> > + doveadm_module_LTLIBRARIES =3D \
> > +     lib20_doveadm_fts_plugin.la
> > +
> > +diff --git a/src/plugins/fts/decode2text.sh b/src/plugins/fts/decode2t=
ext.sh
> > +deleted file mode 100755
> > +index 151fb7c..0000000
> > +--- a/src/plugins/fts/decode2text.sh
> > ++++ /dev/null
> > +@@ -1,105 +0,0 @@
> > +-#!/bin/sh
> > +-
> > +-# Example attachment decoder script. The attachment comes from stdin,=
 and
> > +-# the script is expected to output UTF-8 data to stdout. (If the outp=
ut isn't
> > +-# UTF-8, everything except valid UTF-8 sequences are dropped from it.=
)
> > +-
> > +-# The attachment decoding is enabled by setting:
> > +-#
> > +-# plugin {
> > +-#   fts_decoder =3D decode2text
> > +-# }
> > +-# service decode2text {
> > +-#   executable =3D script /usr/local/libexec/dovecot/decode2text.sh
> > +-#   user =3D dovecot
> > +-#   unix_listener decode2text {
> > +-#     mode =3D 0666
> > +-#   }
> > +-# }
> > +-
> > +-libexec_dir=3D`dirname $0`
> > +-content_type=3D$1
> > +-
> > +-# The second parameter is the format's filename extension, which is u=
sed when
> > +-# found from a filename of application/octet-stream. You can also add=
 more
> > +-# extensions by giving more parameters.
> > +-formats=3D'application/pdf pdf
> > +-application/x-pdf pdf
> > +-application/msword doc
> > +-application/mspowerpoint ppt
> > +-application/vnd.ms-powerpoint ppt
> > +-application/ms-excel xls
> > +-application/x-msexcel xls
> > +-application/vnd.ms-excel xls
> > +-application/vnd.openxmlformats-officedocument.wordprocessingml.docume=
nt docx
> > +-application/vnd.openxmlformats-officedocument.spreadsheetml.sheet xls=
x
> > +-application/vnd.openxmlformats-officedocument.presentationml.presenta=
tion pptx
> > +-application/vnd.oasis.opendocument.text odt
> > +-application/vnd.oasis.opendocument.spreadsheet ods
> > +-application/vnd.oasis.opendocument.presentation odp
> > +-'
> > +-
> > +-if [ "$content_type" =3D "" ]; then
> > +-  echo "$formats"
> > +-  exit 0
> > +-fi
> > +-
> > +-fmt=3D`echo "$formats" | grep -w "^$content_type" | cut -d ' ' -f 2`
> > +-if [ "$fmt" =3D "" ]; then
> > +-  echo "Content-Type: $content_type not supported" >&2
> > +-  exit 1
> > +-fi
> > +-
> > +-# most decoders can't handle stdin directly, so write the attachment
> > +-# to a temp file
> > +-path=3D`mktemp`
> > +-trap "rm -f $path" 0 1 2 3 14 15
> > +-cat > $path
> > +-
> > +-xmlunzip() {
> > +-  name=3D$1
> > +-
> > +-  tempdir=3D`mktemp -d`
> > +-  if [ "$tempdir" =3D "" ]; then
> > +-    exit 1
> > +-  fi
> > +-  trap "rm -rf $path $tempdir" 0 1 2 3 14 15
> > +-  cd $tempdir || exit 1
> > +-  unzip -q "$path" 2>/dev/null || exit 0
> > +-  find . -name "$name" -print0 | xargs -0 cat |
> > +-    $libexec_dir/xml2text
> > +-}
> > +-
> > +-wait_timeout() {
> > +-  childpid=3D$!
> > +-  trap "kill -9 $childpid; rm -f $path" 1 2 3 14 15
> > +-  wait $childpid
> > +-}
> > +-
> > +-LANG=3Den_US.UTF-8
> > +-export LANG
> > +-if [ $fmt =3D "pdf" ]; then
> > +-  /usr/bin/pdftotext $path - 2>/dev/null&
> > +-  wait_timeout 2>/dev/null
> > +-elif [ $fmt =3D "doc" ]; then
> > +-  (/usr/bin/catdoc $path; true) 2>/dev/null&
> > +-  wait_timeout 2>/dev/null
> > +-elif [ $fmt =3D "ppt" ]; then
> > +-  (/usr/bin/catppt $path; true) 2>/dev/null&
> > +-  wait_timeout 2>/dev/null
> > +-elif [ $fmt =3D "xls" ]; then
> > +-  (/usr/bin/xls2csv $path; true) 2>/dev/null&
> > +-  wait_timeout 2>/dev/null
> > +-elif [ $fmt =3D "odt" -o $fmt =3D "ods" -o $fmt =3D "odp" ]; then
> > +-  xmlunzip "content.xml"
> > +-elif [ $fmt =3D "docx" ]; then
> > +-  xmlunzip "document.xml"
> > +-elif [ $fmt =3D "xlsx" ]; then
> > +-  xmlunzip "sharedStrings.xml"
> > +-elif [ $fmt =3D "pptx" ]; then
> > +-  xmlunzip "slide*.xml"
> > +-else
> > +-  echo "Buggy decoder script: $fmt not handled" >&2
> > +-  exit 1
> > +-fi
> > +-exit 0
> > diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb=
 b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> > index 09583f1694..769e693c5a 100644
> > --- a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> > +++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> > @@ -22,6 +22,7 @@ SRC_URI =3D "http://dovecot.org/releases/2.4/dovecot-=
${PV}.tar.gz \
> >             file://CVE-2025-30189-5.patch \
> >             file://CVE-2025-30189-6.patch \
> >             file://CVE-2025-30189-7.patch \
> > +           file://CVE-2025-59031.patch \
> >             "
> >  SRC_URI[sha256sum] =3D "fb188603f419ed7aaa07794a8692098c3ec2660bb9c67d=
0efe24948cbb32ae00"
> >
> >
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126064): https://lists.openembedded.org/g/openembedde=
d-devel/message/126064
> Mute This Topic: https://lists.openembedded.org/mt/118695942/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


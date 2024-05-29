Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF01C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 08:13:27 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.8629.1716970403896727944
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 01:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ECDwCliT;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-529b4011070so2157507e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716970402; x=1717575202; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjo09IwY4tRidVVDqoIQODLNboAMaelQow1zsUfcDaE=;
        b=ECDwCliTLr1GCpsOXhOHXvPPl3SGXvlnpF7tTPRZDA31R5dmgDysp0qCPI+0D0h0bY
         qJykQzAeePa0iqPJnJaUarohJQRF+Bw8BbCnAdcst25GQJegc/ANgA7lfFNsLlJ1+bzA
         0eF8SIpSyGQXHj4Te3JbqxHDL2YmvW6cxX1xzvoLNNehRVJlSeicfVy7FKtUq4G9vyQ0
         EjCZdcUymhFhiXHgi3UArmlAzJ0D7hM5oEDq0DCnQSkCvCbmFXx7lqS4jNbGJ5Ndg21j
         9gDDqH+j8rLtcvSucpKJoSD/CgzmJomd1vy1sucav7ppTZAzt9bPXVwPLOJ1zFIGKGrU
         5cvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716970402; x=1717575202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjo09IwY4tRidVVDqoIQODLNboAMaelQow1zsUfcDaE=;
        b=ahr0I8MJj3aMeqqmt35czEUH+VOX0TdoZKZ3mdI281KT/Ww+acrZsN5/qreKnAEhtT
         7ueK1fV7MKlEJjBF8RpqwnmWUC7GqM9X0OOZJhLZrZlzBWFJwZ7bhRFJUN1xvsB/n9Ms
         3Qu6wmIskoVZg8w/iygdg8smOyYWSsL6VnjfkpQYWbhp9xTyKGSaH0QciCiff6KXob86
         JQ7mnXZSqHeaiRxSuk1/qDGFWg40FgiKajW0ac4FcVxMhfZZCopKbnjxsuRR41t7D195
         CLNfwlmwbbIXhFlGX2sF3fve2/UQVrQrQ4Tarr8pKlqSlOSBxuH3bmIEUbyEXtPzXc2J
         oLhg==
X-Forwarded-Encrypted: i=1; AJvYcCW6zfWgWChtTRLO/3srzlWow5zpoLwiBWWooK63IMWQFUL9PhlBZa8EjX6JAc4hYbMrjuyWsj3P9XtnaS4kQ4lFVXrGqX9AjW7YILD/f6gb1jPBTcuIIPMiHw==
X-Gm-Message-State: AOJu0Yy6VJYS6sJQeP4g9x7gFfmZkITNfpTlnHzU5DHkaTVbKBbilhC3
	4mFSUjshHB+Vrp+mtdKdebhuc9esRwWWIm3DTG3dPQPohjDTgoBYbDo8bZZOsujnrsUBDEqEwo0
	EqzrpsUGydPz8FeVBH/CFtXFH98SdwRBN
X-Google-Smtp-Source: AGHT+IFDSNtY7XxP0HTOpfYxexyeM/uvsQJ32UpC1HksOt/8SvKgYQKGmqETvyGAFtXi6MS9fwTbleImG17pSSwleY0=
X-Received: by 2002:ac2:560f:0:b0:524:339:4375 with SMTP id
 2adb3069b0e04-52964eb5ddemr8079181e87.40.1716970401848; Wed, 29 May 2024
 01:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <17B7B53C3EDF28D1.684@lists.openembedded.org> <MW4PR11MB582222F9663808BF94036B07843B2@MW4PR11MB5822.namprd11.prod.outlook.com>
 <17D3E714C5BD9D2D.9428@lists.openembedded.org>
In-Reply-To: <17D3E714C5BD9D2D.9428@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 May 2024 10:13:00 +0200
Message-ID: <CA+chaQd+3XbZi1JhGsftbSJycU4eYv6eTjabj-dwt2UP6p-5dg@mail.gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH V2 1/2] nodejs: fix CVE-2024-22025
To: martin.jansa@gmail.com
Cc: archana.polampalli@windriver.com, akuster808 <akuster808@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 08:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110608

All 3 are also in:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/kirk=
stone-nut
and:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/kirk=
stone-nutk
but not in:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/kirk=
stone-nut2
nor:
https://git.openembedded.org/meta-openembedded/log/?h=3Dkirkstone-next

On Wed, May 29, 2024 at 10:06=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> +Armin
>
> These 3 are still applicable for kirkstone, is there a reason why they
> weren't picked for last kirkstone update?
>
> e3a43ce251 nodejs: fix CVE-2023-46809
> 7a5471b5ed nodejs: fix CVE-2024-22025
> adfda33005 nodejs: fix CVE-2024-22019
>
> On Thu, Mar 28, 2024 at 2:23=E2=80=AFPM Polampalli, Archana via
> lists.openembedded.org
> <archana.polampalli=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > Reminder!
> > ________________________________
> > From: openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org> on behalf of Polampalli, Archana via lists.openembedde=
d.org <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
> > Sent: Tuesday, February 27, 2024 17:07
> > To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org>
> > Subject: [oe][meta-oe][kirkstone][PATCH V2 1/2] nodejs: fix CVE-2024-22=
025
> >
> > From: Archana Polampalli <archana.polampalli@windriver.com>
> >
> > Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> > ---
> >  .../nodejs/nodejs/CVE-2024-22025.patch        | 148 ++++++++++++++++++
> >  .../recipes-devtools/nodejs/nodejs_16.20.2.bb |   1 +
> >  2 files changed, 149 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-220=
25.patch
> >
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22025.patc=
h b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22025.patch
> > new file mode 100644
> > index 000000000..ac3a54aba
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22025.patch
> > @@ -0,0 +1,148 @@
> > +From 9052ef43dc2d1b0db340591a9bc9e45a25c01d90 Mon Sep 17 00:00:00 2001
> > +From: Matteo Collina <hello@matteocollina.com>
> > +Date: Tue, 6 Feb 2024 16:47:20 +0100
> > +Subject: [PATCH 4/5] zlib: pause stream if outgoing buffer is full
> > +
> > +Signed-off-by: Matteo Collina <hello@matteocollina.com>
> > +PR-URL: https://github.com/nodejs-private/node-private/pull/540
> > +Reviewed-By: Robert Nagy <ronagy@icloud.com>
> > +Ref: https://hackerone.com/reports/2284065
> > +
> > +CVE-ID: CVE-2024-22025
> > +
> > +Upstream-Status: Backport [https://github.com/nodejs/node/commit/9052e=
f43dc2d1b0d]
> > +
> > +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> > +---
> > + lib/zlib.js                            | 32 +++++++++++++++++++------=
-
> > + test/parallel/test-zlib-brotli-16GB.js | 22 ++++++++++++++++++
> > + test/parallel/test-zlib-params.js      | 24 +++++++++++--------
> > + 3 files changed, 61 insertions(+), 17 deletions(-)
> > + create mode 100644 test/parallel/test-zlib-brotli-16GB.js
> > +
> > +diff --git a/lib/zlib.js b/lib/zlib.js
> > +index 9bde199..8e033e5 100644
> > +--- a/lib/zlib.js
> > ++++ b/lib/zlib.js
> > +@@ -560,10 +560,11 @@ function processCallback() {
> > +   self.bytesWritten +=3D inDelta;
> > +
> > +   const have =3D handle.availOutBefore - availOutAfter;
> > ++  let streamBufferIsFull =3D false;
> > +   if (have > 0) {
> > +     const out =3D self._outBuffer.slice(self._outOffset, self._outOff=
set + have);
> > +     self._outOffset +=3D have;
> > +-    self.push(out);
> > ++    streamBufferIsFull =3D !self.push(out);
> > +   } else {
> > +     assert(have =3D=3D=3D 0, 'have should not go down');
> > +   }
> > +@@ -588,13 +589,28 @@ function processCallback() {
> > +     handle.inOff +=3D inDelta;
> > +     handle.availInBefore =3D availInAfter;
> > +
> > +-    this.write(handle.flushFlag,
> > +-               this.buffer, // in
> > +-               handle.inOff, // in_off
> > +-               handle.availInBefore, // in_len
> > +-               self._outBuffer, // out
> > +-               self._outOffset, // out_off
> > +-               self._chunkSize); // out_len
> > ++    if (!streamBufferIsFull) {
> > ++      this.write(handle.flushFlag,
> > ++                 this.buffer, // in
> > ++                 handle.inOff, // in_off
> > ++                 handle.availInBefore, // in_len
> > ++                 self._outBuffer, // out
> > ++                 self._outOffset, // out_off
> > ++                 self._chunkSize); // out_len
> > ++    } else {
> > ++      const oldRead =3D self._read;
> > ++      self._read =3D (n) =3D> {
> > ++        self._read =3D oldRead;
> > ++        this.write(handle.flushFlag,
> > ++                   this.buffer, // in
> > ++                   handle.inOff, // in_off
> > ++                   handle.availInBefore, // in_len
> > ++                   self._outBuffer, // out
> > ++                   self._outOffset, // out_off
> > ++                   self._chunkSize); // out_len
> > ++        self._read(n);
> > ++      };
> > ++    }
> > +     return;
> > +   }
> > +
> > +diff --git a/test/parallel/test-zlib-brotli-16GB.js b/test/parallel/te=
st-zlib-brotli-16GB.js
> > +new file mode 100644
> > +index 0000000..1ca10f7
> > +--- /dev/null
> > ++++ b/test/parallel/test-zlib-brotli-16GB.js
> > +@@ -0,0 +1,22 @@
> > ++use strict';
> > ++
> > ++const common =3D require('../common');
> > ++const { createBrotliDecompress } =3D require('node:zlib');
> > ++const strictEqual =3D require('node:assert').strictEqual;
> > ++
> > ++// This tiny HEX string is a 16GB file.
> > ++// This test verifies that the stream actually stops.
> > ++/* eslint-disable max-len */
> > ++const content =3D 'cfffff7ff82700e2b14020f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c32200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180ee=
fd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0=
074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc130071=
5800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0=
088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0f=
ff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcffff=
f7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7f=
feffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8d=
efff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b000=
40f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f01108=
70500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe09=
80382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff=
04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcff=
ff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe=
7ffff3ffc1300715800a07bff3f';
> > ++
> > ++const buf =3D Buffer.from(content, 'hex');
> > ++
> > ++const decoder =3D createBrotliDecompress();
> > ++decoder.end(buf);
> > ++
> > ++// We need to wait to verify that the libuv thread pool had time
> > ++// to process the data and the buffer is not empty.
> > ++setTimeout(common.mustCall(() =3D> {
> > ++  // There is only one chunk in the buffer
> > ++  strictEqual(decoder._readableState.buffer.length, 1);
> > ++}), common.platformTimeout(100));
> > +diff --git a/test/parallel/test-zlib-params.js b/test/parallel/test-zl=
ib-params.js
> > +index 30d4f13..18271fe 100644
> > +--- a/test/parallel/test-zlib-params.js
> > ++++ b/test/parallel/test-zlib-params.js
> > +@@ -12,23 +12,29 @@ const deflater =3D zlib.createDeflate(opts);
> > + const chunk1 =3D file.slice(0, chunkSize);
> > + const chunk2 =3D file.slice(chunkSize);
> > + const blkhdr =3D Buffer.from([0x00, 0x5a, 0x82, 0xa5, 0x7d]);
> > +-const expected =3D Buffer.concat([blkhdr, chunk2]);
> > +-let actual;
> > ++const blkftr =3D Buffer.from('010000ffff7dac3072', 'hex');
> > ++const expected =3D Buffer.concat([blkhdr, chunk2, blkftr]);
> > ++const bufs =3D [];
> > ++
> > ++function read() {
> > ++  let buf;
> > ++  while ((buf =3D deflater.read()) !=3D=3D null) {
> > ++    bufs.push(buf);
> > ++  }
> > ++}
> > +
> > + deflater.write(chunk1, function() {
> > +   deflater.params(0, zlib.constants.Z_DEFAULT_STRATEGY, function() {
> > +     while (deflater.read());
> > +-    deflater.end(chunk2, function() {
> > +-      const bufs =3D [];
> > +-      let buf;
> > +-      while ((buf =3D deflater.read()) !=3D=3D null)
> > +-        bufs.push(buf);
> > +-      actual =3D Buffer.concat(bufs);
> > +-    });
> > ++
> > ++    deflater.on('readable', read);
> > ++
> > ++    deflater.end(chunk2);
> > +   });
> > +   while (deflater.read());
> > + });
> > +
> > + process.once('exit', function() {
> > ++  const actual =3D Buffer.concat(bufs);
> > +   assert.deepStrictEqual(actual, expected);
> > + });
> > +--
> > +2.40.0
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-o=
e/recipes-devtools/nodejs/nodejs_16.20.2.bb
> > index b786c0273..b4261eaf8 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
> > @@ -28,6 +28,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV=
}.tar.xz \
> >             file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch \
> >             file://CVE-2022-25883.patch \
> >             file://CVE-2024-22019.patch \
> > +           file://CVE-2024-22025.patch \
> >             "
> >  SRC_URI:append:class-target =3D " \
> >             file://0001-Using-native-binaries.patch \
> > --
> > 2.40.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110607): https://lists.openembedded.org/g/openembedde=
d-devel/message/110607
> Mute This Topic: https://lists.openembedded.org/mt/105196299/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


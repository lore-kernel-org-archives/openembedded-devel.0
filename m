Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5C9CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:28:13 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4684.1791318488376778946
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AiB8a7+F;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4932b13c4ccso1622834fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 13:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791318487; cv=none;
        d=google.com; s=arc-20260327;
        b=dlMHAP3UG/fYHn/Dzf9kJwBD/bsiffHw5qed8hqQWOyy9apmaK7+ecL2gZDrIBN65I
         tsCRNOQwE2W20LUbUoI+Zec+inMHpFmPladxLdPiJnWxxSRc/BEFqsAVD/5bkgdLDUAA
         MAyjNYRmfMqfCcb6BG/grbDUaJ0Ane/ppzNGndhYraDIa/Pyzy55WU8nFsfpMkb9N5l9
         4vpRfVvf+8jULCF6HdnR5gRVya1dtqEA55eGvSpf85tbdBTbngyAcLG93f+8Ce9CkjjZ
         9oOMNHfS9MKjf1Wr2F7cbYF4kXcjTpzlGjhO8SeqjBDCnK/gAAqzJZYuGFjdPaU7gUXi
         nJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CULVkHXfpOG83JEqlR6icRbRYoyI9YhKkmOBYmhsKdc=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=gP6UUsaUUUQU8B9YSx7o6mU+Ei1ULSy4/YSwNvfArXPImcGzbpWB0YQmGqHGk626BS
         mxnemAZFPA+1a13iizNBLLVWUZLxrPjqxUQEjBW0OqbhguvwiEbKYufPQcb8t+vXwJ8T
         bFYeu616P7MrbuzJ2iuMfykYFHYbjZVhvv6XjXpfrrXB8NKQQ2zfzpObRkSYXpvg7GIa
         03G93pSiWohtftLJXY2k/2hPwOczM8SSG6vsHw2jc1uqzs345nzFBRm2jKxOZgSZPcUs
         c5iiS9moQY7qvfDXVaybLxjPXniQJddKs4fwukSkYPA8MHzf+vOA6cELxGxZE4ZJvxAB
         Jz0w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791318487; x=1791923287; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CULVkHXfpOG83JEqlR6icRbRYoyI9YhKkmOBYmhsKdc=;
        b=AiB8a7+FmdTAKsV0kAoAzKaLsIaIl30kWrWX2y+Q+MtZvQZBSqMCMDD3L9tvIBn//f
         0I2kb3diOY5OzTA1Zwkih/W8jSg2WABSx2OYyj2tUu4hgTxgsOqKvs4PWFdwyEILWEKu
         zYqzw5vlFKT9rfLD1944dgV7xVyRIDfxpb+quApNsxzSuMEBDoqiJYuSN7PK8Gaf0Kqp
         v/iGkw3o5HZoTpx5HJWRB8P9q9kHb1tEEx2o3je6rI/KCABBssNxPLhrEywVPee2ITbZ
         1y4nUKoyCDuIB/LkGpimZb90lxYkBnaTNRG3v+76gJ7ONUavrVlFYwpmTaf5nfRn+bLz
         M9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318487; x=1791923287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CULVkHXfpOG83JEqlR6icRbRYoyI9YhKkmOBYmhsKdc=;
        b=e9QW0z1B3DDh4+/HZKkbkE0Jh4NM3Mp57xMxXbRKUqOsPcb3848V6b3CeDxDJ1dur2
         TtrxZzFbFO3Eb0JpuBK9OJo5+gFIzJioyK8e3/fGCeCCZQ7JPyYLr9gKfhugYay85IlD
         Ro123icSGYw2M40onnyMFeUt6RXrctkpZXIILhESNJMatOASHWGHpnCTw8Y2IFn/kr8J
         bLDQnKL2iPlLAvkyW2eV/X5kZx5fEAGNaO6IWwn8IlgseazUGqeksDoD1hR5wubRgXHE
         uuVcxREPB14/JPmC40olLM2IuXS04JszA/vDTTWwsmq7vw466WfeRB9m45o2ik/TzrSQ
         jbXA==
X-Gm-Message-State: AFq9FYLdPjqE8OzzhWkR0TWi/FbqI+jZOv8VEPqQ/orSvSV4S0rN+lDr
	nhWmsar0a9BIIfUIH1XXG8DHKAAX/WouTQNIce0cJbWkeCHhiHoZfPhxulIzs4MVtoGYZaLMxAh
	v8KKzKZKLYwnajj2/iJJoz7SSlRYuSgc=
X-Gm-Gg: AYBFou1MhawkJczQn03w5YtNaWnIWoNjwGLcDhGCqS/983IeaCzJkn9GWVb4UU2TlbT
	YUfNsXeXGCADKOC7+msNWfR2GRDq/sO3JJMWHNO26TpdIX06o08OqsSWkA/YMcDPOmuL0quYPvV
	AdaKQWaTAYh0uGFYyKp86D3aru+o7BKaMP6kNjA4M0rjVqmxNphYmU6wfTEx4zHA3V73Vq6P0TF
	Dlp/0DDL5e55EvXT+ndNpoSeRLWGQgoDyydSJUl//KBF+Jl86d5B99hB6S7agnQfMCGNpqAt7Sn
	+23/IBLgl4HcDc+5ce50Pdw5gLl/Hwksly+hVnkusPmIxOA1Zw8AsSVsHDQusBwtcl2H5A==
X-Received: by 2002:a05:6871:384c:b0:494:502e:f003 with SMTP id
 586e51a60fabf-4a25950f48cmr84127fac.31.1791318487478; Tue, 06 Oct 2026
 13:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com> <CA+s=J=xkrKm7u-AA6F40JsLHEc+_1B6ahJeb9CEsHzm3+eRn8Q@mail.gmail.com>
In-Reply-To: <CA+s=J=xkrKm7u-AA6F40JsLHEc+_1B6ahJeb9CEsHzm3+eRn8Q@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 7 Oct 2026 09:27:54 +1300
X-Gm-Features: AclHuK_UmuMHQ4O0Wh3jiIQ-2ejolEyu8ChyDzguzdhKxAZN7xz8i7gJOmsbLvc
Message-ID: <CADySD0GeU=AG4OCMQJbcTpLpuk0eekTCTgQNr-fMZ+62sB0mgg@mail.gmail.com>
Subject: Re: [oe][meta-oe][wrynose][PATCH 1/24] rabbitmq-c: patch CVE-2026-44235
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 20:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130639

On Tue, Oct 6, 2026 at 5:19=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualcom=
m.com> wrote:
>
> On Thu, Sep 24, 2026 at 12:33=E2=80=AFPM Ankur Tyagi via
> lists.openembedded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Details:
> > https://nvd.nist.gov/vuln/detail/cve-2026-44235
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../rabbitmq-c/CVE-2026-44235.patch           | 95 +++++++++++++++++++
> >  .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |  1 +
> >  2 files changed, 96 insertions(+)
> >  create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/=
CVE-2026-44235.patch
> >
> > diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-202=
6-44235.patch b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026=
-44235.patch
> > new file mode 100644
> > index 0000000000..fcb0e1e1d1
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235=
.patch
> > @@ -0,0 +1,95 @@
> > +From 52f00ef57e55c783c2c436590296d9ff986b65d0 Mon Sep 17 00:00:00 2001
> > +From: Claude <noreply@anthropic.com>
> > +Date: Tue, 28 Apr 2026 00:30:47 +0000
> > +Subject: [PATCH] amqp_connection: reject undersized frames in
> > + amqp_handle_input
> > +
> > +A malicious AMQP server (or active network attacker on an unencrypted
> > +connection) can send an AMQP frame whose stated frame body is shorter
> > +than the per-frame-type header it claims to carry. amqp_handle_input()
> > +then computed encoded.len as
> > +
> > +  state->target_size - HEADER_SIZE - <fixed_header_bytes> - FOOTER_SIZ=
E
> > +
> > +with no lower-bound check on target_size. Because encoded.len is a
> > +size_t, the subtraction wrapped to a value near SIZE_MAX. The bogus
> > +length was passed to amqp_decode_method() / amqp_decode_properties()
> > +and through to the table decoder, whose internal bounds checks could
> > +no longer constrain the parser. The result was an out-of-bounds read
> > +and process crash on the client side, reachable during amqp_login.
> > +
> > +Validate target_size against the minimum required for each frame type
> > +(METHOD: HEADER_SIZE+4+FOOTER_SIZE, HEADER: HEADER_SIZE+12+FOOTER_SIZE=
,
> > +BODY: HEADER_SIZE+FOOTER_SIZE) and return AMQP_STATUS_BAD_AMQP_DATA
> > +when the frame is too small, before computing encoded.len.
> > +
> > +Add the verified PoC bytes as a regression seed for the existing
> > +fuzz_server harness.
> > +
> > +Refs: GHSA-9mmv-r8g3-qp46
> > +(cherry picked from commit 1d3afbb056fee5cc9ea05680bf32288715d0d802)
> > +
> > +CVE: CVE-2026-44235
> > +Upstream-Status: Backport [https://github.com/alanxz/rabbitmq-c/commit=
/1d3afbb056fee5cc9ea05680bf32288715d0d802]
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + .../input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw | Bin 0 -> 113 bytes
>
> This causes:
>
> ERROR: rabbitmq-c-0.15.0-r0 do_patch: Applying patch
> '/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch'
> on target directory
> '/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-=
linux/rabbitmq-c/0.15.0/sources/rabbitmq-c-0.15.0'
> CmdError('quilt --quiltrc
> /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-l=
inux/rabbitmq-c/0.15.0/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch CVE-2026-44235.patch
> File fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw: git binary diffs
> are not supported.
> patching file librabbitmq/amqp_connection.c
> Patch CVE-2026-44235.patch does not apply (enforce with -f)
>
> May be we should drop this hunk instead of working around.
>

agree, will send v2 to fix this.

> > + librabbitmq/amqp_connection.c                 |  19 +++++++++++++++++=
+
> > + 2 files changed, 19 insertions(+)
> > + create mode 100644 fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw
> > +
> > +diff --git a/fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw b/fuzz/inp=
ut/fuzz_server_ghsa-9mmv-r8g3-qp46.raw
> > +new file mode 100644
> > +index 0000000000000000000000000000000000000000..558e9f5bff6b24ad3104b8=
a3038ab5b271257dcc
> > +GIT binary patch
> > +literal 113
> > +zcmZQ%0D&+DE+FItvaHO#6&U^l0azR#5qxj8*#?Ay5=3DJ1KHNeNw(+|W*&5I8WKF0)>
> > +L=3DVq{ht2+k({(TL>
> > +
> > +literal 0
> > +HcmV?d00001
> > +
> > +diff --git a/librabbitmq/amqp_connection.c b/librabbitmq/amqp_connecti=
on.c
> > +index 56ab8a8..4326ef7 100644
> > +--- a/librabbitmq/amqp_connection.c
> > ++++ b/librabbitmq/amqp_connection.c
> > +@@ -320,6 +320,13 @@ int amqp_handle_input(amqp_connection_state_t sta=
te, amqp_bytes_t received_data,
> > +
> > +       switch (decoded_frame->frame_type) {
> > +         case AMQP_FRAME_METHOD:
> > ++          /* A METHOD frame body must contain at least the 4-byte met=
hod id.
> > ++           * Reject undersized frames before subtracting from target_=
size to
> > ++           * avoid an unsigned underflow that would yield a huge enco=
ded.len
> > ++           * and cause out-of-bounds reads in amqp_decode_method(). *=
/
> > ++          if (state->target_size < HEADER_SIZE + 4 + FOOTER_SIZE) {
> > ++            return AMQP_STATUS_BAD_AMQP_DATA;
> > ++          }
> > +           decoded_frame->payload.method.id =3D
> > +               amqp_d32(amqp_offset(raw_frame, HEADER_SIZE));
> > +           encoded.bytes =3D amqp_offset(raw_frame, HEADER_SIZE + 4);
> > +@@ -335,6 +342,15 @@ int amqp_handle_input(amqp_connection_state_t sta=
te, amqp_bytes_t received_data,
> > +           break;
> > +
> > +         case AMQP_FRAME_HEADER:
> > ++          /* A HEADER frame body must contain at least 12 bytes (clas=
s_id,
> > ++           * weight, body_size). Reject undersized frames before subt=
racting
> > ++           * from target_size to avoid an unsigned underflow that wou=
ld yield
> > ++           * a huge encoded.len and cause out-of-bounds reads in
> > ++           * amqp_decode_properties() / the table decoder
> > ++           * (CVE: GHSA-9mmv-r8g3-qp46). */
> > ++          if (state->target_size < HEADER_SIZE + 12 + FOOTER_SIZE) {
> > ++            return AMQP_STATUS_BAD_AMQP_DATA;
> > ++          }
> > +           decoded_frame->payload.properties.class_id =3D
> > +               amqp_d16(amqp_offset(raw_frame, HEADER_SIZE));
> > +           /* unused 2-byte weight field goes here */
> > +@@ -354,6 +370,9 @@ int amqp_handle_input(amqp_connection_state_t stat=
e, amqp_bytes_t received_data,
> > +           break;
> > +
> > +         case AMQP_FRAME_BODY:
> > ++          if (state->target_size < HEADER_SIZE + FOOTER_SIZE) {
> > ++            return AMQP_STATUS_BAD_AMQP_DATA;
> > ++          }
> > +           decoded_frame->payload.body_fragment.len =3D
> > +               state->target_size - HEADER_SIZE - FOOTER_SIZE;
> > +           decoded_frame->payload.body_fragment.bytes =3D
> > diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.=
bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> > index 4fd6302f2c..642e1e443b 100644
> > --- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> > +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
> > @@ -4,6 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7e12f6e40e66=
2e039e2f02b4893011ec"
> >  LICENSE =3D "MIT"
> >
> >  SRC_URI =3D "git://github.com/alanxz/rabbitmq-c.git;branch=3Dmaster;pr=
otocol=3Dhttps \
> > +           file://CVE-2026-44235.patch \
> >  "
> >  SRCREV =3D "84b81cd97a1b5515d3d4b304796680da24c666d8"
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#130249): https://lists.openembedded.org/g/openembed=
ded-devel/message/130249
> > Mute This Topic: https://lists.openembedded.org/mt/121405170/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


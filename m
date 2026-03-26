Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B276710A62CD
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 13:27:30 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48218.1774531644739905270
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 06:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Y5FZZgfy;
 spf=pass (domain: mvista.com, ip: 209.85.208.52, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66aed966c7eso1273099a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 06:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774531643; cv=none;
        d=google.com; s=arc-20240605;
        b=A7ekq5otSFJttRlAiLRSdCeWYa4H3p6Eh8R6lY2TloGRIn54MTDHlDDqVLQbdmwNo2
         Jin0INSZoMEMS5kbY6g//RP4o36HU2C39S1zHHtUAur/AM3NDCRYeKbsPdSjRuI2Nneh
         RuDFlupUSwa13MKw9Go7v/YAnGjgBUtSB4Vn0nDxOVpPHfTjGREtE8JRJq3k69KZT7H1
         x+IjU/LAPoieUKeVdnYzAey8Q0iDAXIZgIC8FIFHlKT+cuwNUTwd02cVe+t8cvm8g8dT
         khNKIg7v0VzEDfQgub6+LRbqRvqXhd8nQK9ktnyX3zV3Bl1jdgVhckZ/BwYRMGsxErHN
         9hAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hexD3i5AQfaL/Wec8FkpOaNotq+UkDvvx1hdQMDavqI=;
        fh=/Zfoi4o9G9NEfOtGJ0LSUrfiVhZcuLLzOVZQmzCL8qM=;
        b=N6ESCR5UxKdMALmbDcTzknDcHs0Nx9krPuNkLkcHcMlJ/c4pj4HkpR6ZQdsxQQ1Hev
         Z7gKhadS56PgQWDHTK3sVqXSKsm6vwIr7PCxWpfCl5yQT2rlUFZe6jbvfmmqx1l+cMV7
         wyFk/RKryrqGe2NielOMrmUF7Bhip4WTQUpL5qU7ZpY/cJ6IgVEqrjBParfEvlOcXOMR
         R1cKE+4ZZFEqcpiHa8rnFNkAV9SfcIiLyGLod/dn4ekngJzaa9PZk+h75mf8rYGQV49t
         zkdNpQS128aXlqRu6EtviOxAjuB2drsVVC0bM+zgXqGru6oP+7j0NWfNm44jqAjhNwJb
         2H3w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774531643; x=1775136443; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hexD3i5AQfaL/Wec8FkpOaNotq+UkDvvx1hdQMDavqI=;
        b=Y5FZZgfyzw6kKdZCjNueFjKX3q7w9YAOWF1z7mzelzP+iGHU0Vu1UtzbPhqLCyfGgk
         PI/1F5aV5D/hxc6ZcxSlhqyTWAfrXokn1ONBBGuerD6WiEaC6w0SHGaJopxCpPtq5Xt2
         tXvYZk/MPu2w0GlhKZGOs9fGs3/LDfTeYNtNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774531643; x=1775136443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hexD3i5AQfaL/Wec8FkpOaNotq+UkDvvx1hdQMDavqI=;
        b=ZeWCvJkPi2lqNgCeWL7h0itpKxql6BOjWkgURtIuX16yh5Db6GUPZVDJZKrdQ5WJEr
         60aV2y2S/yg5OKOGX3ZgKX7xzAyNmN0LU+TiuFhfZZLaTTlvPoHCAKNTcvnTfU4Pq0Uh
         T2mdsGre4NRbUML9fWOWXiwRRA8tMWP2rWdfuxnVIgWgmdI7LF9sZczx6wj18RKXy2Ej
         ysV4tupcz3CswwvZIBLWllDogGUkeYFqWLQlWFNZdzwe6cK+ArBt+wMjAuASX9Lcfgxb
         6Oe/W9dRK4tts480TNqnwgFtO2BTmr5yBYB29xVakGs+/Qownb3EASs6abRfA9zH7nbV
         /UcA==
X-Gm-Message-State: AOJu0Yzyq7/ZDfznLJQIpkGa0NJY3RdSCPDO5PxZ8HvaZ97vBmQmuIYU
	ZVd81rspM//v+7/YmPTDxyL2VM6wB6DKT9AglPXcRPyt6yGkl1hwe8XbqOxKd2H6AtI6a/q0D+C
	oNVGgu/qsQQFrpu/O2p2Qv82xLCXLOIL3NgqnHvcYF4O5Xf1KGAcs6c71jw==
X-Gm-Gg: ATEYQzz+S3jbzpmc2d0qFx9Su40Qh8MpUjwbyskMbltbrQJqQt5vDmyB/p/kjWxYKky
	1hz4QnNYyw0/goxBXdUwi6Kx+FnLNKpJVFzN7oC+dtx/s2kBI4puOoDPVjd0m+3BpZzchCPYeYp
	v++QCtWPRfNEMzJBtvs0f9vwfQrCcFQFBG+dAthyKoUdgtwrA15OOykc5s5h6LYZmhyU/5pQFLe
	y8BXrxSBS2xzpBsFTnG0RL5WuNTiIpA+V95TqWLDb0+/hQNMBsNj+NdzPo5KO+YcMci3403dFnK
	wIaoJ4o/YPDWDxJ7EI3JYIwua1Vt7giWVTBdmaQKdTrIgpnWQQ==
X-Received: by 2002:a05:6402:23c3:b0:666:d779:1f40 with SMTP id
 4fb4d7f45d1cf-66a8267137amr4547855a12.9.1774531642793; Thu, 26 Mar 2026
 06:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260325124141.142149-1-vanusuri@mvista.com> <CANQUz1-hx-EMd29DGk4_SiU6G5xN9C1e+SxNC68MgFNzLW4hwA@mail.gmail.com>
 <3ac55d19-3f24-4578-a6d1-38f3f031e6a5@gmail.com>
In-Reply-To: <3ac55d19-3f24-4578-a6d1-38f3f031e6a5@gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 26 Mar 2026 18:57:10 +0530
X-Gm-Features: AQROBzC-aWbkih_yRIG0EZFY5LjbodVRgiPT-uNFqiwK-8SCktc0pIHeM1Vj1aE
Message-ID: <CANQUz1-VhaKKXsGYxnDfiODAXoikgkL0Bd2ZQs424RYGi=gk2g@mail.gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH] libssh: Fix CVE-2026-0966
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000362e74064ded5883"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 13:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125722

--000000000000362e74064ded5883
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy,

Thank you for the quick response and for queuing it up in the repo.

Thanks & Regards,
Vijay

On Thu, Mar 26, 2026 at 6:28=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

> On 3/26/26 12:28, Vijay Anusuri wrote:
> > Hi Team,
> >
> > Just checking in=E2=80=94do we have any updates on this?
> >
> > I wasn=E2=80=99t able to find it in meta-openembedded-contrib.
> >
>
> It is queued up now in the repo, thanks.
>
>
> > Thanks & Regards,
> >
> > Vijay
> >
> >
> >
> >
> > On Wed, Mar 25, 2026 at 6:11=E2=80=AFPM <vanusuri@mvista.com
> > <mailto:vanusuri@mvista.com>> wrote:
> >
> >     From: Vijay Anusuri <vanusuri@mvista.com <mailto:vanusuri@mvista.co=
m
> >>
> >
> >     Pick commits according to [1]
> >
> >     [1] https://security-tracker.debian.org/tracker/CVE-2026-0966
> >     <https://security-tracker.debian.org/tracker/CVE-2026-0966>
> >     [2] https://www.libssh.org/security/advisories/CVE-2026-0966.txt
> >     <https://www.libssh.org/security/advisories/CVE-2026-0966.txt>
> >
> >     Skip the test commit as it's not applicable in libssh-0.8.9
> >
> >     Signed-off-by: Vijay Anusuri <vanusuri@mvista.com
> >     <mailto:vanusuri@mvista.com>>
> >     ---
> >      .../libssh/libssh/CVE-2026-0966-1.patch       | 38 ++++++++++++
> >      .../libssh/libssh/CVE-2026-0966-2.patch       | 62
> +++++++++++++++++++
> >      .../recipes-support/libssh/libssh_0.8.9.bb <http://
> >     libssh_0.8.9.bb>    |  2 +
> >      3 files changed, 102 insertions(+)
> >      create mode 100644 meta-oe/recipes-support/libssh/libssh/
> >     CVE-2026-0966-1.patch
> >      create mode 100644 meta-oe/recipes-support/libssh/libssh/
> >     CVE-2026-0966-2.patch
> >
> >     diff --git a/meta-oe/recipes-support/libssh/libssh/
> >     CVE-2026-0966-1.patch b/meta-oe/recipes-support/libssh/libssh/
> >     CVE-2026-0966-1.patch
> >     new file mode 100644
> >     index 0000000000..a645282afd
> >     --- /dev/null
> >     +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
> >     @@ -0,0 +1,38 @@
> >     +From 6ba5ff1b7b1547a59f750fbc06b89737b7456117 Mon Sep 17 00:00:00
> 2001
> >     +From: Jakub Jelen <jjelen@redhat.com <mailto:jjelen@redhat.com>>
> >     +Date: Thu, 8 Jan 2026 12:09:50 +0100
> >     +Subject: [PATCH] CVE-2026-0966 misc: Avoid heap buffer underflow i=
n
> >     ssh_get_hexa
> >     +
> >     +Signed-off-by: Jakub Jelen <jjelen@redhat.com
> >     <mailto:jjelen@redhat.com>>
> >     +Reviewed-by: Pavol =C5=BD=C3=A1=C4=8Dik <pzacik@redhat.com <mailto=
:
> pzacik@redhat.com>>
> >     +(cherry picked from commit 417a095e6749a1f3635e02332061edad3c6a340=
1)
> >     +
> >     +ssh_get_hexa function not present in misc.c. It was in dh.c file i=
n
> >     +older libssh versions.
> >     +
> >     +ssh_get_hexa function moved from dh.c from misc.c by the below
> commit
> >     +https://git.libssh.org/projects/libssh.git/commit/?
> >     id=3D43a4f86b6e14a907b3a298d10d5cd7efb59f6a09 <https://git.libssh.o=
rg/
> >
>  projects/libssh.git/commit/?id=3D43a4f86b6e14a907b3a298d10d5cd7efb59f6a0=
9>
> >     +
> >     +Upstream-Status: Backport [https://git.libssh.org/projects/
> >     libssh.git/commit/?id=3D6ba5ff1b7b1547a59f750fbc06b89737b7456117
> >     <https://git.libssh.org/projects/libssh.git/commit/?
> >     id=3D6ba5ff1b7b1547a59f750fbc06b89737b7456117>]
> >     +CVE: CVE-2026-0966
> >     +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com
> >     <mailto:vanusuri@mvista.com>>
> >     +---
> >     + src/dh.c | 2 +-
> >     + 1 file changed, 1 insertion(+), 1 deletion(-)
> >     +
> >     +diff --git a/src/dh.c b/src/dh.c
> >     +index 7116d1dc..321aeba6 100644
> >     +--- a/src/dh.c
> >     ++++ b/src/dh.c
> >     +@@ -1486,7 +1486,7 @@ char *ssh_get_hexa(const unsigned char *what=
,
> >     size_t len) {
> >     +   size_t i;
> >     +   size_t hlen =3D len * 3;
> >     +
> >     +-  if (len > (UINT_MAX - 1) / 3) {
> >     ++  if (what =3D=3D NULL || len < 1 || len > (UINT_MAX - 1) / 3) {
> >     +     return NULL;
> >     +   }
> >     +
> >     +--
> >     +2.25.1
> >     +
> >     diff --git a/meta-oe/recipes-support/libssh/libssh/
> >     CVE-2026-0966-2.patch b/meta-oe/recipes-support/libssh/libssh/
> >     CVE-2026-0966-2.patch
> >     new file mode 100644
> >     index 0000000000..9a035dbc1e
> >     --- /dev/null
> >     +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
> >     @@ -0,0 +1,62 @@
> >     +From 3e1d276a5a030938a8f144f46ff4f2a2efe31ced Mon Sep 17 00:00:00
> 2001
> >     +From: Jakub Jelen <jjelen@redhat.com <mailto:jjelen@redhat.com>>
> >     +Date: Thu, 8 Jan 2026 12:10:44 +0100
> >     +Subject: [PATCH] CVE-2026-0966 doc: Update guided tour to use
> >     SHA256 fingerprints
> >     +
> >     +Signed-off-by: Jakub Jelen <jjelen@redhat.com
> >     <mailto:jjelen@redhat.com>>
> >     +Reviewed-by: Pavol =C5=BD=C3=A1=C4=8Dik <pzacik@redhat.com <mailto=
:
> pzacik@redhat.com>>
> >     +(cherry picked from commit 1b2a4f760bec35121c490f2294f915ebb9c992a=
e)
> >     +
> >     +Upstream-Status: Backport [https://git.libssh.org/projects/
> >     libssh.git/commit/?id=3D3e1d276a5a030938a8f144f46ff4f2a2efe31ced
> >     <https://git.libssh.org/projects/libssh.git/commit/?
> >     id=3D3e1d276a5a030938a8f144f46ff4f2a2efe31ced>]
> >     +CVE: CVE-2026-0966
> >     +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com
> >     <mailto:vanusuri@mvista.com>>
> >     +---
> >     + doc/guided_tour.dox | 10 ++++------
> >     + 1 file changed, 4 insertions(+), 6 deletions(-)
> >     +
> >     +diff --git a/doc/guided_tour.dox b/doc/guided_tour.dox
> >     +index 008ccb4e..bdd7489c 100644
> >     +--- a/doc/guided_tour.dox
> >     ++++ b/doc/guided_tour.dox
> >     +@@ -190,7 +190,6 @@ int verify_knownhost(ssh_session session)
> >     +     ssh_key srv_pubkey =3D NULL;
> >     +     size_t hlen;
> >     +     char buf[10];
> >     +-    char *hexa =3D NULL;
> >     +     char *p =3D NULL;
> >     +     int cmp;
> >     +     int rc;
> >     +@@ -201,7 +200,7 @@ int verify_knownhost(ssh_session session)
> >     +     }
> >     +
> >     +     rc =3D ssh_get_publickey_hash(srv_pubkey,
> >     +-                                SSH_PUBLICKEY_HASH_SHA1,
> >     ++                                SSH_PUBLICKEY_HASH_SHA256,
> >     +                                 &hash,
> >     +                                 &hlen);
> >     +     ssh_key_free(srv_pubkey);
> >     +@@ -217,7 +216,7 @@ int verify_knownhost(ssh_session session)
> >     +             break;
> >     +         case SSH_KNOWN_HOSTS_CHANGED:
> >     +             fprintf(stderr, "Host key for server changed: it is
> >     now:\n");
> >     +-            ssh_print_hexa("Public key hash", hash, hlen);
> >     ++            ssh_print_hexa(SSH_PUBLICKEY_HASH_SHA256, hash, hlen)=
;
> >     +             fprintf(stderr, "For security reasons, connection wil=
l
> >     be stopped\n");
> >     +             ssh_clean_pubkey_hash(&hash);
> >     +
> >     +@@ -238,10 +237,9 @@ int verify_knownhost(ssh_session session)
> >     +             /* FALL THROUGH to SSH_SERVER_NOT_KNOWN behavior */
> >     +
> >     +         case SSH_KNOWN_HOSTS_UNKNOWN:
> >     +-            hexa =3D ssh_get_hexa(hash, hlen);
> >     +             fprintf(stderr,"The server is unknown. Do you trust
> >     the host key?\n");
> >     +-            fprintf(stderr, "Public key hash: %s\n", hexa);
> >     +-            ssh_string_free_char(hexa);
> >     ++            fprintf(stderr, "Public key hash: ");
> >     ++            ssh_print_hash(SSH_PUBLICKEY_HASH_SHA256, hash, hlen)=
;
> >     +             ssh_clean_pubkey_hash(&hash);
> >     +             p =3D fgets(buf, sizeof(buf), stdin);
> >     +             if (p =3D=3D NULL) {
> >     +--
> >     +2.25.1
> >     +
> >     diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb <http:/=
/
> >     libssh_0.8.9.bb> b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> >     <http://libssh_0.8.9.bb>
> >     index a1fc64446c..8cc0883b2b 100644
> >     --- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb <http://
> >     libssh_0.8.9.bb>
> >     +++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb <http://
> >     libssh_0.8.9.bb>
> >     @@ -29,6 +29,8 @@ SRC_URI =3D "git://git.libssh.org/projects/
> >     libssh.git;protocol=3Dhttps;branch=3Dstable <http://git.libssh.org/
> >     projects/libssh.git;protocol=3Dhttps;branch=3Dstable>
> >                 file://CVE-2025-8277-3.patch \
> >                 file://CVE-2025-8114.patch \
> >                 file://CVE-2026-3731.patch \
> >     +           file://CVE-2026-0966-1.patch \
> >     +           file://CVE-2026-0966-2.patch \
> >                "
> >      SRCREV =3D "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
> >
> >     --
> >     2.25.1
> >
>
>

--000000000000362e74064ded5883
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Gyorgy,<br><br>Thank you for the quick respon=
se and for queuing it up in the repo.<br><br></div>Thanks &amp; Regards,<br=
></div>Vijay</div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 26, 2026 at 6:28=E2=80=AFPM G=
yorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com">skandigraun@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 3/26/26 12:28, Vijay Anusuri wrote:<br>
&gt; Hi Team,<br>
&gt; <br>
&gt; Just checking in=E2=80=94do we have any updates on this?<br>
&gt; <br>
&gt; I wasn=E2=80=99t able to find it in meta-openembedded-contrib.<br>
&gt; <br>
<br>
It is queued up now in the repo, thanks.<br>
<br>
<br>
&gt; Thanks &amp; Regards,<br>
&gt; <br>
&gt; Vijay<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Wed, Mar 25, 2026 at 6:11=E2=80=AFPM &lt;<a href=3D"mailto:vanusuri=
@mvista.com" target=3D"_blank">vanusuri@mvista.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">va=
nusuri@mvista.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@=
mvista.com" target=3D"_blank">vanusuri@mvista.com</a> &lt;mailto:<a href=3D=
"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;&=
gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Pick commits according to [1]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[1] <a href=3D"https://security-tracker.debian.org/=
tracker/CVE-2026-0966" rel=3D"noreferrer" target=3D"_blank">https://securit=
y-tracker.debian.org/tracker/CVE-2026-0966</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://security-tracker.debian.org/=
tracker/CVE-2026-0966" rel=3D"noreferrer" target=3D"_blank">https://securit=
y-tracker.debian.org/tracker/CVE-2026-0966</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[2] <a href=3D"https://www.libssh.org/security/advi=
sories/CVE-2026-0966.txt" rel=3D"noreferrer" target=3D"_blank">https://www.=
libssh.org/security/advisories/CVE-2026-0966.txt</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://www.libssh.org/security/advi=
sories/CVE-2026-0966.txt" rel=3D"noreferrer" target=3D"_blank">https://www.=
libssh.org/security/advisories/CVE-2026-0966.txt</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Skip the test commit as it&#39;s not applicable in =
libssh-0.8.9<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:=
vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:vanusuri@mvista.com" t=
arget=3D"_blank">vanusuri@mvista.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../libssh/libssh/CVE-2026-0966-1.patch=C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 38 ++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../libssh/libssh/CVE-2026-0966-2.patch=C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 62 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../recipes-support/libssh/<a href=3D"http://=
libssh_0.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a> &=
lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://libssh_0.8.9.bb" rel=3D"noreferre=
r" target=3D"_blank">libssh_0.8.9.bb</a>&gt;=C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A03 files changed, 102 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-oe/recipes-support/li=
bssh/libssh/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-0966-1.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-oe/recipes-support/li=
bssh/libssh/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-0966-2.patch<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/recipes-support/libssh/libssh/=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-0966-1.patch b/meta-oe/recipes-support/lib=
ssh/libssh/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-0966-1.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..a645282afd<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/recipes-support/libssh/libssh/CVE-202=
6-0966-1.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,38 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 6ba5ff1b7b1547a59f750fbc06b89737b7456117 Mon =
Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From: Jakub Jelen &lt;<a href=3D"mailto:jjelen@red=
hat.com" target=3D"_blank">jjelen@redhat.com</a> &lt;mailto:<a href=3D"mail=
to:jjelen@redhat.com" target=3D"_blank">jjelen@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Date: Thu, 8 Jan 2026 12:09:50 +0100<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] CVE-2026-0966 misc: Avoid heap bu=
ffer underflow in<br>
&gt;=C2=A0 =C2=A0 =C2=A0ssh_get_hexa<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Jakub Jelen &lt;<a href=3D"mailto:j=
jelen@redhat.com" target=3D"_blank">jjelen@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jjelen@redhat.com" tar=
get=3D"_blank">jjelen@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Reviewed-by: Pavol =C5=BD=C3=A1=C4=8Dik &lt;<a hre=
f=3D"mailto:pzacik@redhat.com" target=3D"_blank">pzacik@redhat.com</a> &lt;=
mailto:<a href=3D"mailto:pzacik@redhat.com" target=3D"_blank">pzacik@redhat=
.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+(cherry picked from commit 417a095e6749a1f3635e023=
32061edad3c6a3401)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ssh_get_hexa function not present in misc.c. It wa=
s in dh.c file in<br>
&gt;=C2=A0 =C2=A0 =C2=A0+older libssh versions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ssh_get_hexa function moved from dh.c from misc.c =
by the below commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<a href=3D"https://git.libssh.org/projects/libssh.=
git/commit/" rel=3D"noreferrer" target=3D"_blank">https://git.libssh.org/pr=
ojects/libssh.git/commit/</a>?<br>
&gt;=C2=A0 =C2=A0 =C2=A0id=3D43a4f86b6e14a907b3a298d10d5cd7efb59f6a09 &lt;<=
a href=3D"https://git.libssh.org/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.libssh.org/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0projects/libssh.git/commit/?id=3D43a4f86b6e14a907b3=
a298d10d5cd7efb59f6a09&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Upstream-Status: Backport [<a href=3D"https://git.=
libssh.org/projects/" rel=3D"noreferrer" target=3D"_blank">https://git.libs=
sh.org/projects/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0libssh.git/commit/?id=3D6ba5ff1b7b1547a59f750fbc06b=
89737b7456117<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://git.libssh.org/projects/libs=
sh.git/commit/" rel=3D"noreferrer" target=3D"_blank">https://git.libssh.org=
/projects/libssh.git/commit/</a>?<br>
&gt;=C2=A0 =C2=A0 =C2=A0id=3D6ba5ff1b7b1547a59f750fbc06b89737b7456117&gt;]<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+CVE: CVE-2026-0966<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto=
:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:vanusuri@mvista.com" t=
arget=3D"_blank">vanusuri@mvista.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+---<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ src/dh.c | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/src/dh.c b/src/dh.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 7116d1dc..321aeba6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/src/dh.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/src/dh.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -1486,7 +1486,7 @@ char *ssh_get_hexa(const uns=
igned char *what,<br>
&gt;=C2=A0 =C2=A0 =C2=A0size_t len) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0size_t i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0size_t hlen =3D len * 3;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 if (len &gt; (UINT_MAX - 1) / 3) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 if (what =3D=3D NULL || len &lt; 1 || len =
&gt; (UINT_MAX - 1) / 3) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0+2.25.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/recipes-support/libssh/libssh/=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-0966-2.patch b/meta-oe/recipes-support/lib=
ssh/libssh/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-0966-2.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..9a035dbc1e<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/recipes-support/libssh/libssh/CVE-202=
6-0966-2.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,62 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 3e1d276a5a030938a8f144f46ff4f2a2efe31ced Mon =
Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From: Jakub Jelen &lt;<a href=3D"mailto:jjelen@red=
hat.com" target=3D"_blank">jjelen@redhat.com</a> &lt;mailto:<a href=3D"mail=
to:jjelen@redhat.com" target=3D"_blank">jjelen@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Date: Thu, 8 Jan 2026 12:10:44 +0100<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] CVE-2026-0966 doc: Update guided =
tour to use<br>
&gt;=C2=A0 =C2=A0 =C2=A0SHA256 fingerprints<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Jakub Jelen &lt;<a href=3D"mailto:j=
jelen@redhat.com" target=3D"_blank">jjelen@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jjelen@redhat.com" tar=
get=3D"_blank">jjelen@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Reviewed-by: Pavol =C5=BD=C3=A1=C4=8Dik &lt;<a hre=
f=3D"mailto:pzacik@redhat.com" target=3D"_blank">pzacik@redhat.com</a> &lt;=
mailto:<a href=3D"mailto:pzacik@redhat.com" target=3D"_blank">pzacik@redhat=
.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+(cherry picked from commit 1b2a4f760bec35121c490f2=
294f915ebb9c992ae)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Upstream-Status: Backport [<a href=3D"https://git.=
libssh.org/projects/" rel=3D"noreferrer" target=3D"_blank">https://git.libs=
sh.org/projects/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0libssh.git/commit/?id=3D3e1d276a5a030938a8f144f46ff=
4f2a2efe31ced<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://git.libssh.org/projects/libs=
sh.git/commit/" rel=3D"noreferrer" target=3D"_blank">https://git.libssh.org=
/projects/libssh.git/commit/</a>?<br>
&gt;=C2=A0 =C2=A0 =C2=A0id=3D3e1d276a5a030938a8f144f46ff4f2a2efe31ced&gt;]<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+CVE: CVE-2026-0966<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto=
:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:vanusuri@mvista.com" t=
arget=3D"_blank">vanusuri@mvista.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+---<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ doc/guided_tour.dox | 10 ++++------<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 4 insertions(+), 6 deletions(-)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/doc/guided_tour.dox b/doc/guided_tour=
.dox<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 008ccb4e..bdd7489c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/doc/guided_tour.dox<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/doc/guided_tour.dox<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -190,7 +190,6 @@ int verify_knownhost(ssh_sessi=
on session)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0ssh_key srv_pubkey =3D NULL;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0size_t hlen;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0char buf[10];<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 char *hexa =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0char *p =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0int cmp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -201,7 +200,7 @@ int verify_knownhost(ssh_sessi=
on session)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0rc =3D ssh_get_publickey_hash(=
srv_pubkey,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSH_PUBLICKE=
Y_HASH_SHA1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSH_PUBLICKE=
Y_HASH_SHA256,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;h=
ash,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;h=
len);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0ssh_key_free(srv_pubkey);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -217,7 +216,7 @@ int verify_knownhost(ssh_sessi=
on session)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0br=
eak;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SSH_KNOWN_H=
OSTS_CHANGED:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fp=
rintf(stderr, &quot;Host key for server changed: it is<br>
&gt;=C2=A0 =C2=A0 =C2=A0now:\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_pri=
nt_hexa(&quot;Public key hash&quot;, hash, hlen);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_pri=
nt_hexa(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fp=
rintf(stderr, &quot;For security reasons, connection will<br>
&gt;=C2=A0 =C2=A0 =C2=A0be stopped\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ss=
h_clean_pubkey_hash(&amp;hash);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -238,10 +237,9 @@ int verify_knownhost(ssh_sess=
ion session)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 FALL THROUGH to SSH_SERVER_NOT_KNOWN behavior */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SSH_KNOWN_H=
OSTS_UNKNOWN:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hexa =
=3D ssh_get_hexa(hash, hlen);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fp=
rintf(stderr,&quot;The server is unknown. Do you trust<br>
&gt;=C2=A0 =C2=A0 =C2=A0the host key?\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf=
(stderr, &quot;Public key hash: %s\n&quot;, hexa);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_str=
ing_free_char(hexa);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf=
(stderr, &quot;Public key hash: &quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_pri=
nt_hash(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ss=
h_clean_pubkey_hash(&amp;hash);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =
=3D fgets(buf, sizeof(buf), stdin);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (p =3D=3D NULL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0+2.25.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/recipes-support/libssh/<a href=
=3D"http://libssh_0.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8=
.9.bb</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://libssh_0.8.9.bb" rel=3D"noreferre=
r" target=3D"_blank">libssh_0.8.9.bb</a>&gt; b/meta-oe/recipes-support/libs=
sh/<a href=3D"http://libssh_0.8.9.bb" rel=3D"noreferrer" target=3D"_blank">=
libssh_0.8.9.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libssh_0.8.9.bb" rel=3D"noref=
errer" target=3D"_blank">http://libssh_0.8.9.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index a1fc64446c..8cc0883b2b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-oe/recipes-support/libssh/<a href=3D"htt=
p://libssh_0.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</=
a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://libssh_0.8.9.bb" rel=3D"noreferre=
r" target=3D"_blank">libssh_0.8.9.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/recipes-support/libssh/<a href=3D"htt=
p://libssh_0.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</=
a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://libssh_0.8.9.bb" rel=3D"noreferre=
r" target=3D"_blank">libssh_0.8.9.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -29,6 +29,8 @@ SRC_URI =3D &quot;git://<a href=
=3D"http://git.libssh.org/projects/" rel=3D"noreferrer" target=3D"_blank">g=
it.libssh.org/projects/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0libssh.git;protocol=3Dhttps;branch=3Dstable &lt;<a =
href=3D"http://git.libssh.org/" rel=3D"noreferrer" target=3D"_blank">http:/=
/git.libssh.org/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0projects/libssh.git;protocol=3Dhttps;branch=3Dstabl=
e&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CV=
E-2025-8277-3.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CV=
E-2025-8114.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CV=
E-2026-3731.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CV=
E-2026-0966-1.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CV=
E-2026-0966-2.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0SRCREV =3D &quot;04685a74df9ce1db1bc116a83a0d=
a78b4f4fa1f8&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.25.1<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000362e74064ded5883--


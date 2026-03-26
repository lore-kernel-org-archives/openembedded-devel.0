Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02FC10A1E7F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:29:01 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45917.1774524535614700587
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=K1b0kgph;
 spf=pass (domain: mvista.com, ip: 209.85.208.47, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66a395905a4so1291532a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774524533; cv=none;
        d=google.com; s=arc-20240605;
        b=kvf6A6C3CqoQI41sVEofD8tfLC0F7XPIyrTtxek3pC74GpTi8HNNcQLKVUP5VhIgvn
         WyBczgT1L5JlM8SKAQ2Aq039HfBbvQT5EWjSOmeaRDki4I3fpzZbjGd7UAKbA9o1Pdod
         ZZFkM0XnV2boTKgljn6crWGhY7uvewLmJl3CKfkdtR2Nt8S7AjRgbnMD645LWCbIbeuq
         LllSR57M/2G27dQ2hoPmvGA54kGsWRrG12Vb7LyVA8jNyLDY/l+A3OVDrO5HLGMAEChO
         iMmeKsEL6SmAg6OiHaW/ljbxnNGgz6i73AqyAMDVXngNItUHQULY1QdzL0qtvH41b5J/
         wsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QnjupA2ZQ7kclUdlm1ZjOIjYFhdtIBXGdWz9ioBTCNs=;
        fh=0o8T1UwYufgAJuQ2aJ1FnAjBKcQ9cY25RMo3GCwk7qk=;
        b=RZDoK9C8eY9KW6wOm2jkG4k8mAspydHTjCr5SQhaj4VpP/S8S1RSpgmBf6XgRkqK2u
         v0W9vWK2nA1xjTrUUQZ/I6sfe8k3DVdYM4j5pQUnzK/qI73Se6mxDfo9OTId59eHgAqe
         3A0csNPr7jxDYdZwvM4BPBOywn0ZVquTwt8xL2VE/iQ0VMvQYejh+l7curZSUt+bYlYb
         5VqlXIG4SgHzAvaNwQhLCbdFanq7DmUyblxZIJzyX3HrTWF5Dvdfog39DGp4IEJmii2J
         umPE8rKmAADHyM7FzdSuX6Wgkj9TC++jlioXbX+zkGeTf3ofES3jfskWu+X3RvJr+d9l
         cXUA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774524533; x=1775129333; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QnjupA2ZQ7kclUdlm1ZjOIjYFhdtIBXGdWz9ioBTCNs=;
        b=K1b0kgphfk55L9VFhLVp1fY+nHBNjb2yvcbTzEp8Fwxx/Uvm2YB92LoiWSW7UY67cY
         0xkvfm9C8JfJXYFGiS4MVQHYCsHK/7hZg12HETXOqQq+0CxzGVoqNWGKSd2IjRw2z4rV
         dKE/5qRThD3hWtnNs9pws6xVlPuhUzVWlgvSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774524533; x=1775129333;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnjupA2ZQ7kclUdlm1ZjOIjYFhdtIBXGdWz9ioBTCNs=;
        b=W/gsBywTSYAsMvIZQp+9lBRCUOBb1IRqt28x6u1RGmXZWTtBP75wz4Wqc0kRnsKtkq
         vI22rA8VzC3hDeGi5CllzYepz6oTO3sY3Ewnjb6RjJaQ4EQjypcdypx+vqSRBEa3u4jQ
         ZJT5LOZOm3BadoRMSihM87TSyGA8yaT86hrjDfZ4+u10sXnHl5scrOJ2W03Dh47VguzR
         UgmT32KHZxwfgOd+bYQkSGQjgzZhbuEenjO1/Ctvlw+APq0JyrOt06fwF+szhvizEalP
         87smUR8zNi/o1lGNR4aff9hLqR7bWWvyr9ZBHZZJw//BSubCQXjrcTvUzgxtLZHqykGY
         GlcA==
X-Gm-Message-State: AOJu0YzTGOLys3Gf2r+L5wiQGnCKbwHXQR0ZyLrXEKwI7EJAPJyR3Nqa
	B9CPAsldL2hR9ENnjEVSsNeSuO2udu/gpCL9Ba5ZHo4p1z3U+PqC9SXL70Q5jCmuZRvLKcgFliN
	lhMPV+jReryFNMOr2+jXwXK77b2rzYrnA1dckZB1Khwc6nVfwscXhb32f3g==
X-Gm-Gg: ATEYQzzV2hRwnVlMz8HvMN42zV18nCrcHIs9r+7hndeO+K5CVKU2v6reHmbRTfpd5sV
	ON4rowzSueHGyT0gKCUkMnDsBJq8lmLerB4FZt5PAXrqXkQl0ZdC0n/DvYLLIMcix7hA/QiY3Cx
	eRdbSPl98VgKTXXB8JK4NMJomSk77Op58rFmGrzJ4Qo4RjOLpScyu7w5owU5nFybj5jtKw4llSr
	ByubhPl2BMNSJGmp8AmbRPFuqV18jLojNhX3I9+eKOBj/7b2ByZAtE/WOMJvZifUAYXXi5Wnhq6
	WaYpeM6lGxUhnHqYRnepuJ956M0J8s2eWqTGHds=
X-Received: by 2002:a05:6402:3483:b0:66a:55eb:1cfe with SMTP id
 4fb4d7f45d1cf-66a826f29aamr4959137a12.29.1774524533226; Thu, 26 Mar 2026
 04:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260325124141.142149-1-vanusuri@mvista.com>
In-Reply-To: <20260325124141.142149-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 26 Mar 2026 16:58:41 +0530
X-Gm-Features: AQROBzAy5GNAoC7VjjM6TBFGCm1jijeaMRC4r-ArWi8C5pFNkYgm3GwFzu9TAtA
Message-ID: <CANQUz1-hx-EMd29DGk4_SiU6G5xN9C1e+SxNC68MgFNzLW4hwA@mail.gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH] libssh: Fix CVE-2026-0966
To: openembedded-devel@lists.openembedded.org, 
	Gyorgy Sarvari <skandigraun@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000072cd7b064debb053"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125655

--00000000000072cd7b064debb053
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Just checking in=E2=80=94do we have any updates on this?

I wasn=E2=80=99t able to find it in meta-openembedded-contrib.

Thanks & Regards,

Vijay



On Wed, Mar 25, 2026 at 6:11=E2=80=AFPM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Pick commits according to [1]
>
> [1] https://security-tracker.debian.org/tracker/CVE-2026-0966
> [2] https://www.libssh.org/security/advisories/CVE-2026-0966.txt
>
> Skip the test commit as it's not applicable in libssh-0.8.9
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../libssh/libssh/CVE-2026-0966-1.patch       | 38 ++++++++++++
>  .../libssh/libssh/CVE-2026-0966-2.patch       | 62 +++++++++++++++++++
>  .../recipes-support/libssh/libssh_0.8.9.bb    |  2 +
>  3 files changed, 102 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
>
> diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
> b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
> new file mode 100644
> index 0000000000..a645282afd
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
> @@ -0,0 +1,38 @@
> +From 6ba5ff1b7b1547a59f750fbc06b89737b7456117 Mon Sep 17 00:00:00 2001
> +From: Jakub Jelen <jjelen@redhat.com>
> +Date: Thu, 8 Jan 2026 12:09:50 +0100
> +Subject: [PATCH] CVE-2026-0966 misc: Avoid heap buffer underflow in
> ssh_get_hexa
> +
> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> +Reviewed-by: Pavol =C5=BD=C3=A1=C4=8Dik <pzacik@redhat.com>
> +(cherry picked from commit 417a095e6749a1f3635e02332061edad3c6a3401)
> +
> +ssh_get_hexa function not present in misc.c. It was in dh.c file in
> +older libssh versions.
> +
> +ssh_get_hexa function moved from dh.c from misc.c by the below commit
> +
> https://git.libssh.org/projects/libssh.git/commit/?id=3D43a4f86b6e14a907b=
3a298d10d5cd7efb59f6a09
> +
> +Upstream-Status: Backport [
> https://git.libssh.org/projects/libssh.git/commit/?id=3D6ba5ff1b7b1547a59=
f750fbc06b89737b7456117
> ]
> +CVE: CVE-2026-0966
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/dh.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/dh.c b/src/dh.c
> +index 7116d1dc..321aeba6 100644
> +--- a/src/dh.c
> ++++ b/src/dh.c
> +@@ -1486,7 +1486,7 @@ char *ssh_get_hexa(const unsigned char *what,
> size_t len) {
> +   size_t i;
> +   size_t hlen =3D len * 3;
> +
> +-  if (len > (UINT_MAX - 1) / 3) {
> ++  if (what =3D=3D NULL || len < 1 || len > (UINT_MAX - 1) / 3) {
> +     return NULL;
> +   }
> +
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
> b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
> new file mode 100644
> index 0000000000..9a035dbc1e
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
> @@ -0,0 +1,62 @@
> +From 3e1d276a5a030938a8f144f46ff4f2a2efe31ced Mon Sep 17 00:00:00 2001
> +From: Jakub Jelen <jjelen@redhat.com>
> +Date: Thu, 8 Jan 2026 12:10:44 +0100
> +Subject: [PATCH] CVE-2026-0966 doc: Update guided tour to use SHA256
> fingerprints
> +
> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> +Reviewed-by: Pavol =C5=BD=C3=A1=C4=8Dik <pzacik@redhat.com>
> +(cherry picked from commit 1b2a4f760bec35121c490f2294f915ebb9c992ae)
> +
> +Upstream-Status: Backport [
> https://git.libssh.org/projects/libssh.git/commit/?id=3D3e1d276a5a030938a=
8f144f46ff4f2a2efe31ced
> ]
> +CVE: CVE-2026-0966
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + doc/guided_tour.dox | 10 ++++------
> + 1 file changed, 4 insertions(+), 6 deletions(-)
> +
> +diff --git a/doc/guided_tour.dox b/doc/guided_tour.dox
> +index 008ccb4e..bdd7489c 100644
> +--- a/doc/guided_tour.dox
> ++++ b/doc/guided_tour.dox
> +@@ -190,7 +190,6 @@ int verify_knownhost(ssh_session session)
> +     ssh_key srv_pubkey =3D NULL;
> +     size_t hlen;
> +     char buf[10];
> +-    char *hexa =3D NULL;
> +     char *p =3D NULL;
> +     int cmp;
> +     int rc;
> +@@ -201,7 +200,7 @@ int verify_knownhost(ssh_session session)
> +     }
> +
> +     rc =3D ssh_get_publickey_hash(srv_pubkey,
> +-                                SSH_PUBLICKEY_HASH_SHA1,
> ++                                SSH_PUBLICKEY_HASH_SHA256,
> +                                 &hash,
> +                                 &hlen);
> +     ssh_key_free(srv_pubkey);
> +@@ -217,7 +216,7 @@ int verify_knownhost(ssh_session session)
> +             break;
> +         case SSH_KNOWN_HOSTS_CHANGED:
> +             fprintf(stderr, "Host key for server changed: it is now:\n"=
);
> +-            ssh_print_hexa("Public key hash", hash, hlen);
> ++            ssh_print_hexa(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);
> +             fprintf(stderr, "For security reasons, connection will be
> stopped\n");
> +             ssh_clean_pubkey_hash(&hash);
> +
> +@@ -238,10 +237,9 @@ int verify_knownhost(ssh_session session)
> +             /* FALL THROUGH to SSH_SERVER_NOT_KNOWN behavior */
> +
> +         case SSH_KNOWN_HOSTS_UNKNOWN:
> +-            hexa =3D ssh_get_hexa(hash, hlen);
> +             fprintf(stderr,"The server is unknown. Do you trust the hos=
t
> key?\n");
> +-            fprintf(stderr, "Public key hash: %s\n", hexa);
> +-            ssh_string_free_char(hexa);
> ++            fprintf(stderr, "Public key hash: ");
> ++            ssh_print_hash(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);
> +             ssh_clean_pubkey_hash(&hash);
> +             p =3D fgets(buf, sizeof(buf), stdin);
> +             if (p =3D=3D NULL) {
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> index a1fc64446c..8cc0883b2b 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> @@ -29,6 +29,8 @@ SRC_URI =3D "git://
> git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Dstable
>             file://CVE-2025-8277-3.patch \
>             file://CVE-2025-8114.patch \
>             file://CVE-2026-3731.patch \
> +           file://CVE-2026-0966-1.patch \
> +           file://CVE-2026-0966-2.patch \
>            "
>  SRCREV =3D "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
>
> --
> 2.25.1
>
>

--00000000000072cd7b064debb053
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p><span>Hi Team,</span></p><p><span>Just checking in=E2=
=80=94do we have any updates on this?</span></p><p><span>I wasn=E2=80=99t a=
ble to find it in meta-openembedded-contrib.<br><br></span></p><p><span>Tha=
nks &amp; Regards,<br></span></p><p><span>Vijay</span></p><br><div><br></di=
v></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 25, 2026 at 6:11=E2=80=AFPM &lt;<a href=
=3D"mailto:vanusuri@mvista.com">vanusuri@mvista.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Vijay Anusuri &lt;=
<a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.co=
m</a>&gt;<br>
<br>
Pick commits according to [1]<br>
<br>
[1] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-0966" r=
el=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/tra=
cker/CVE-2026-0966</a><br>
[2] <a href=3D"https://www.libssh.org/security/advisories/CVE-2026-0966.txt=
" rel=3D"noreferrer" target=3D"_blank">https://www.libssh.org/security/advi=
sories/CVE-2026-0966.txt</a><br>
<br>
Skip the test commit as it&#39;s not applicable in libssh-0.8.9<br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../libssh/libssh/CVE-2026-0966-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
8 ++++++++++++<br>
=C2=A0.../libssh/libssh/CVE-2026-0966-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6=
2 +++++++++++++++++++<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.8.9.bb" rel=3D"=
noreferrer" target=3D"_blank">libssh_0.8.9.bb</a>=C2=A0 =C2=A0 |=C2=A0 2 +<=
br>
=C2=A03 files changed, 102 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
6-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
6-2.patch<br>
<br>
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch b/=
meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch<br>
new file mode 100644<br>
index 0000000000..a645282afd<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch<br>
@@ -0,0 +1,38 @@<br>
+From 6ba5ff1b7b1547a59f750fbc06b89737b7456117 Mon Sep 17 00:00:00 2001<br>
+From: Jakub Jelen &lt;<a href=3D"mailto:jjelen@redhat.com" target=3D"_blan=
k">jjelen@redhat.com</a>&gt;<br>
+Date: Thu, 8 Jan 2026 12:09:50 +0100<br>
+Subject: [PATCH] CVE-2026-0966 misc: Avoid heap buffer underflow in ssh_ge=
t_hexa<br>
+<br>
+Signed-off-by: Jakub Jelen &lt;<a href=3D"mailto:jjelen@redhat.com" target=
=3D"_blank">jjelen@redhat.com</a>&gt;<br>
+Reviewed-by: Pavol =C5=BD=C3=A1=C4=8Dik &lt;<a href=3D"mailto:pzacik@redha=
t.com" target=3D"_blank">pzacik@redhat.com</a>&gt;<br>
+(cherry picked from commit 417a095e6749a1f3635e02332061edad3c6a3401)<br>
+<br>
+ssh_get_hexa function not present in misc.c. It was in dh.c file in<br>
+older libssh versions. <br>
+<br>
+ssh_get_hexa function moved from dh.c from misc.c by the below commit<br>
+<a href=3D"https://git.libssh.org/projects/libssh.git/commit/?id=3D43a4f86=
b6e14a907b3a298d10d5cd7efb59f6a09" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.libssh.org/projects/libssh.git/commit/?id=3D43a4f86b6e14a907b3a298=
d10d5cd7efb59f6a09</a><br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://git.libssh.org/projects/libs=
sh.git/commit/?id=3D6ba5ff1b7b1547a59f750fbc06b89737b7456117" rel=3D"norefe=
rrer" target=3D"_blank">https://git.libssh.org/projects/libssh.git/commit/?=
id=3D6ba5ff1b7b1547a59f750fbc06b89737b7456117</a>]<br>
+CVE: CVE-2026-0966<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ src/dh.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/dh.c b/src/dh.c<br>
+index 7116d1dc..321aeba6 100644<br>
+--- a/src/dh.c<br>
++++ b/src/dh.c<br>
+@@ -1486,7 +1486,7 @@ char *ssh_get_hexa(const unsigned char *what, size_t=
 len) {<br>
+=C2=A0 =C2=A0size_t i;<br>
+=C2=A0 =C2=A0size_t hlen =3D len * 3;<br>
+ <br>
+-=C2=A0 if (len &gt; (UINT_MAX - 1) / 3) {<br>
++=C2=A0 if (what =3D=3D NULL || len &lt; 1 || len &gt; (UINT_MAX - 1) / 3)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0return NULL;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch b/=
meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch<br>
new file mode 100644<br>
index 0000000000..9a035dbc1e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch<br>
@@ -0,0 +1,62 @@<br>
+From 3e1d276a5a030938a8f144f46ff4f2a2efe31ced Mon Sep 17 00:00:00 2001<br>
+From: Jakub Jelen &lt;<a href=3D"mailto:jjelen@redhat.com" target=3D"_blan=
k">jjelen@redhat.com</a>&gt;<br>
+Date: Thu, 8 Jan 2026 12:10:44 +0100<br>
+Subject: [PATCH] CVE-2026-0966 doc: Update guided tour to use SHA256 finge=
rprints<br>
+<br>
+Signed-off-by: Jakub Jelen &lt;<a href=3D"mailto:jjelen@redhat.com" target=
=3D"_blank">jjelen@redhat.com</a>&gt;<br>
+Reviewed-by: Pavol =C5=BD=C3=A1=C4=8Dik &lt;<a href=3D"mailto:pzacik@redha=
t.com" target=3D"_blank">pzacik@redhat.com</a>&gt;<br>
+(cherry picked from commit 1b2a4f760bec35121c490f2294f915ebb9c992ae)<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://git.libssh.org/projects/libs=
sh.git/commit/?id=3D3e1d276a5a030938a8f144f46ff4f2a2efe31ced" rel=3D"norefe=
rrer" target=3D"_blank">https://git.libssh.org/projects/libssh.git/commit/?=
id=3D3e1d276a5a030938a8f144f46ff4f2a2efe31ced</a>]<br>
+CVE: CVE-2026-0966<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ doc/guided_tour.dox | 10 ++++------<br>
+ 1 file changed, 4 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/doc/guided_tour.dox b/doc/guided_tour.dox<br>
+index 008ccb4e..bdd7489c 100644<br>
+--- a/doc/guided_tour.dox<br>
++++ b/doc/guided_tour.dox<br>
+@@ -190,7 +190,6 @@ int verify_knownhost(ssh_session session)<br>
+=C2=A0 =C2=A0 =C2=A0ssh_key srv_pubkey =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0size_t hlen;<br>
+=C2=A0 =C2=A0 =C2=A0char buf[10];<br>
+-=C2=A0 =C2=A0 char *hexa =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0char *p =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0int cmp;<br>
+=C2=A0 =C2=A0 =C2=A0int rc;<br>
+@@ -201,7 +200,7 @@ int verify_knownhost(ssh_session session)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0rc =3D ssh_get_publickey_hash(srv_pubkey,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSH_PUBLICKEY_HASH_SHA1,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSH_PUBLICKEY_HASH_SHA256,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;hash,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;hlen);<br>
+=C2=A0 =C2=A0 =C2=A0ssh_key_free(srv_pubkey);<br>
+@@ -217,7 +216,7 @@ int verify_knownhost(ssh_session session)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SSH_KNOWN_HOSTS_CHANGED:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Host=
 key for server changed: it is now:\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_print_hexa(&quot;Public key=
 hash&quot;, hash, hlen);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_print_hexa(SSH_PUBLICKEY_HA=
SH_SHA256, hash, hlen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;For =
security reasons, connection will be stopped\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_clean_pubkey_hash(&amp=
;hash);<br>
+ <br>
+@@ -238,10 +237,9 @@ int verify_knownhost(ssh_session session)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALL THROUGH to SSH_SER=
VER_NOT_KNOWN behavior */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SSH_KNOWN_HOSTS_UNKNOWN:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hexa =3D ssh_get_hexa(hash, hle=
n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,&quot;The s=
erver is unknown. Do you trust the host key?\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Public ke=
y hash: %s\n&quot;, hexa);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_string_free_char(hexa);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Public ke=
y hash: &quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_print_hash(SSH_PUBLICKEY_HA=
SH_SHA256, hash, hlen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_clean_pubkey_hash(&amp=
;hash);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D fgets(buf, sizeof(bu=
f), stdin);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D NULL) {<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.8.9.=
bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a> b/meta-oe/reci=
pes-support/libssh/<a href=3D"http://libssh_0.8.9.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libssh_0.8.9.bb</a><br>
index a1fc64446c..8cc0883b2b 100644<br>
--- a/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.8.9.bb" rel=
=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a><br>
+++ b/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.8.9.bb" rel=
=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a><br>
@@ -29,6 +29,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.libssh.org/=
projects/libssh.git;protocol=3Dhttps;branch=3Dstable" rel=3D"noreferrer" ta=
rget=3D"_blank">git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=
=3Dstable</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-8277-3.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-8114.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-3731.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-0966-1.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-0966-2.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRCREV =3D &quot;04685a74df9ce1db1bc116a83a0da78b4f4fa1f8&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--00000000000072cd7b064debb053--


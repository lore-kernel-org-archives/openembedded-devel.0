Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DF6EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 19:15:05 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.16384.1687202096121013221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 12:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bE+FyjJl;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-77e35504c1bso103302139f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687202095; x=1689794095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UUPRc0H37ZlhNeV8yF/UkEpD1biU0Lb1Tow6oNi/nJQ=;
        b=bE+FyjJlGFEik7+FAHctw/+5PLWz3pfRjP5I2T/zDqIK03odz6KWHN7NLk1dDjQ7S7
         tVujAYRlbvclv3Fooj71YEtX6ZFyRovn/MG5P+pjYNMCLRRWxi7qHcmwrJolTrP8cUm1
         UVGb1bVYqWVV4vjKT/OgwTZcXA7iaygUard7RZ7Swgsg0tp++ukyM8Aa+YccG4RbVyCe
         ddcG46R5zq4Ern6drxyMFw+zbDJpQheNQws+/eAbPSmgFn3GYbcuK3a270CKpjp9ENjU
         PC640k9eTVICaGEXjrUZjMnwf5EMfqPxjFLv8Yb1hi9K1eUNwyqRUUgoJY+U3intiTwm
         WcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687202095; x=1689794095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUPRc0H37ZlhNeV8yF/UkEpD1biU0Lb1Tow6oNi/nJQ=;
        b=NDQ1LLBwo1BvMz8AMLqSnoOIztwfmClvv6IofqNJvYqWAdmF2BX/ZEg2L4zdiEABze
         3g4SFH08tJzk3qp8uCbjbUJh9X67Upo8ZOrtXCDTZm0N217sexsQs1HeQ9O9HFkod5G2
         DfEdb2errBpTvxgJ6JfNj5Hh6wqednS4Kln6GSsUHgOBx12+JDXH116e28YlcsvGr+y/
         KlV86sNlCa4M3A+EjtTo+JOQToLeqmDu55+w35aMOzLE4PmlRH0iNhz4iizV2oMdxHTf
         +3I3a7M7PVR52NtCjOg/tNnRNgdnEp5aZMiqUU8hofskBPFCh0ng3r7o31lLvyxWbx/P
         Iwmg==
X-Gm-Message-State: AC+VfDxf4mJS86nPMPau4lOsE1oaj2kAuBLbLMBzAdKDoeW942qm1YWU
	U1zeN8OXKG1yXH1Z2CbEcbjAMDqbKm38LF8rd3c=
X-Google-Smtp-Source: ACHHUZ5Dg7FsT0PvcruS9qsxEFt9g5n2azcSPpapSLcgdNMASnweBeY/RenkPv2VGVB0MFzsveUoAf/f+xBcq9ZjhHU=
X-Received: by 2002:a6b:6b0e:0:b0:774:94e1:3aee with SMTP id
 g14-20020a6b6b0e000000b0077494e13aeemr9321181ioc.6.1687202095248; Mon, 19 Jun
 2023 12:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181955.103171-1-beniaminsandu@gmail.com>
In-Reply-To: <20230619181955.103171-1-beniaminsandu@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 19 Jun 2023 20:14:44 +0100
Message-ID: <CAO5Uq5SyM6MAO_Q5Y_+1F7PxQ7QevCMhCNwagSWDHLaEhL6Www@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: remove unneeded headers
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008d39ed05fe8059f8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 19:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103444

--0000000000008d39ed05fe8059f8
Content-Type: text/plain; charset="UTF-8"

Keeping up with Apple given they take nothing is frankly a right pain,
adding things which are nice to have rather than just broken seems like
we're just adding to the problem. Last time I resynchronized this it took
me days, unless there's a really good reason to do this, or there's a way
to get it upstreamed I'd rather we didn't.


On Mon, 19 Jun 2023, 19:20 Beniamin Sandu, <beniaminsandu@gmail.com> wrote:

> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  .../mdns/0009-remove-unneeded-headers.patch   | 33 +++++++++++++++++++
>  .../recipes-protocols/mdns/mdns_1790.80.10.bb |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644
> meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
>
> diff --git
> a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
> b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
> new file mode 100644
> index 000000000..74d387368
> --- /dev/null
> +++
> b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
> @@ -0,0 +1,33 @@
> +From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 00:00:00 2001
> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> +Date: Thu, 15 Jun 2023 17:02:58 +0000
> +Subject: [PATCH] remove unneeded headers
> +
> +From a quick look, these seem to not be needed and having them
> +breaks the build with mbedtls 3.x. Without them it builds fine
> +on both 2.x and 3.x versions.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> +---
> + mDNSPosix/mbedtls.c | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> +index a73681b..ab8f8c7 100644
> +--- a/mDNSPosix/mbedtls.c
> ++++ b/mDNSPosix/mbedtls.c
> +@@ -38,10 +38,8 @@
> + #include <mbedtls/sha256.h>
> + #include <mbedtls/base64.h>
> +
> +-#include <mbedtls/certs.h>
> + #include <mbedtls/x509.h>
> + #include <mbedtls/ssl.h>
> +-#include <mbedtls/config.h>
> +
> + // Posix TLS server context
> + struct TLSContext_struct {
> +--
> +2.34.1
> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> index 612d343c8..46f1b70cb 100644
> --- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> +++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
> @@ -21,6 +21,7 @@ SRC_URI = "git://
> github.com/apple-oss-distributions/mDNSResponder;protocol=https
>             file://0006-Handle-noisy-netlink-sockets.patch \
>             file://0007-Mark-deleted-interfaces-as-being-changed.patch \
>             file://0008-Handle-errors-from-socket-calls.patch \
> +           file://0009-remove-unneeded-headers.patch \
>             file://mdns.service \
>             "
>  SRCREV = "8769ab51605e465425d33d757f602ce5905ca639"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103440):
> https://lists.openembedded.org/g/openembedded-devel/message/103440
> Mute This Topic: https://lists.openembedded.org/mt/99629056/3618097
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008d39ed05fe8059f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Keeping up with Apple given they take nothing is frankly =
a right pain, adding things which are nice to have rather than just broken =
seems like we&#39;re just adding to the problem. Last time I resynchronized=
 this it took me days, unless there&#39;s a really good reason to do this, =
or there&#39;s a way to get it upstreamed I&#39;d rather we didn&#39;t.<div=
 dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, 19 Jun 2023, 19:20 Beniamin Sandu, &lt;<a =
href=3D"mailto:beniaminsandu@gmail.com">beniaminsandu@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Beniamin Sandu &=
lt;<a href=3D"mailto:beniaminsandu@gmail.com" target=3D"_blank" rel=3D"nore=
ferrer">beniaminsandu@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../mdns/0009-remove-unneeded-headers.patch=C2=A0 =C2=A0| 33 ++++++++=
+++++++++++<br>
=C2=A0.../recipes-protocols/mdns/<a href=3D"http://mdns_1790.80.10.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">mdns_1790.80.10.bb</a> |=C2=A0=
 1 +<br>
=C2=A02 files changed, 34 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0009-r=
emove-unneeded-headers.patch<br>
<br>
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneed=
ed-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-=
unneeded-headers.patch<br>
new file mode 100644<br>
index 000000000..74d387368<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-head=
ers.patch<br>
@@ -0,0 +1,33 @@<br>
+From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 00:00:00 2001<br>
+From: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">beniaminsandu@gmail.com</a>&gt;<br>
+Date: Thu, 15 Jun 2023 17:02:58 +0000<br>
+Subject: [PATCH] remove unneeded headers<br>
+<br>
+From a quick look, these seem to not be needed and having them<br>
+breaks the build with mbedtls 3.x. Without them it builds fine<br>
+on both 2.x and 3.x versions.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">beniaminsandu@gmail.com</a>&gt;<br>
+---<br>
+ mDNSPosix/mbedtls.c | 2 --<br>
+ 1 file changed, 2 deletions(-)<br>
+<br>
+diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c<br>
+index a73681b..ab8f8c7 100644<br>
+--- a/mDNSPosix/mbedtls.c<br>
++++ b/mDNSPosix/mbedtls.c<br>
+@@ -38,10 +38,8 @@<br>
+ #include &lt;mbedtls/sha256.h&gt;<br>
+ #include &lt;mbedtls/base64.h&gt;<br>
+<br>
+-#include &lt;mbedtls/certs.h&gt;<br>
+ #include &lt;mbedtls/x509.h&gt;<br>
+ #include &lt;mbedtls/ssl.h&gt;<br>
+-#include &lt;mbedtls/config.h&gt;<br>
+<br>
+ // Posix TLS server context<br>
+ struct TLSContext_struct {<br>
+--<br>
+2.34.1<br>
diff --git a/meta-networking/recipes-protocols/mdns/<a href=3D"http://mdns_=
1790.80.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mdns_1790.80=
.10.bb</a> b/meta-networking/recipes-protocols/mdns/<a href=3D"http://mdns_=
1790.80.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mdns_1790.80=
.10.bb</a><br>
index 612d343c8..46f1b70cb 100644<br>
--- a/meta-networking/recipes-protocols/mdns/<a href=3D"http://mdns_1790.80=
.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mdns_1790.80.10.bb<=
/a><br>
+++ b/meta-networking/recipes-protocols/mdns/<a href=3D"http://mdns_1790.80=
.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mdns_1790.80.10.bb<=
/a><br>
@@ -21,6 +21,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/appl=
e-oss-distributions/mDNSResponder;protocol=3Dhttps" rel=3D"noreferrer noref=
errer" target=3D"_blank">github.com/apple-oss-distributions/mDNSResponder;p=
rotocol=3Dhttps</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-Handle-noisy-netlink-=
sockets.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-Mark-deleted-interfac=
es-as-being-changed.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-Handle-errors-from-so=
cket-calls.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-remove-unneeded-heade=
rs.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mdns.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRCREV =3D &quot;8769ab51605e465425d33d757f602ce5905ca639&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103440): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103440" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/103440</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99629056/3618=
097" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/99629056/3618097</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kiernan@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.com</a>]=
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000008d39ed05fe8059f8--


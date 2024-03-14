Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D7BC54E58
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 01:08:22 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.779.1710378495930684037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 18:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H4uNIx9p;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60a3c48e70fso5465567b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 18:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710378495; x=1710983295; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5xxWHMmmXnXyBzZhjsnjmradchvTwv5EQ0E0mrL4hFQ=;
        b=H4uNIx9p0KEz5jRGK9aMzvRvoDZzMY0YWMTpeHtLiYieRoq1XkcXzqshYgrGicsbMb
         SeCYemJv+H6yurBgWqSPrjEddefIFhcBvnuZ8s+NZ0sXYf7dczBKszvBP3adVWx7VTdn
         bsGvJG1EHbybPZyWUtAEZqDe/c1fFHKb/v1r/zoO9XhoE6Z9+B/vCDy5UR9h1RjeneBz
         R5Shr0Q5Yzkrn8tRfhW9sVWUtEYCpeScwJVfgplwIcAEKHnfDPIQqSneVVu630XNJRj+
         2RXfwEfKZeYxKt7bsb+dUTF+pV7JtH/Kp/oGIN2dw5/vL1cI5S+XXjUHWyoFY9Exeer8
         GoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710378495; x=1710983295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xxWHMmmXnXyBzZhjsnjmradchvTwv5EQ0E0mrL4hFQ=;
        b=ZkO7XDMEoJINYIGd1EaH4ZvQ8TyEWRxr3Hha0jE3lV+OWbl5ML6CSl1tJy6ihWcf4f
         V3gsIdNANNE1y51DBr0ebxZrYuP4xAkVcrcIKwFod+va8msJ3LLsCDdOsN6i7tK/WcKO
         HOK8Wyj5Uaq6XhKZ/sddZdxoifqbDl40SVyO3y6x4Y59VfdN1vVMBRlrG6zCXxWUy/PI
         R1JEJHGwCYHup5s2hTDzf+jVH08r4uqxu2BbZJ2G5Pl3uulXaVYSmSvQBUFZEtWFW95l
         IEPD9rKkUyGh2tgNzEqow77bDDWKrwVmooQXkeeQQ6GgM5lV41KDEz7LojpSHAeRoeIp
         5fJw==
X-Gm-Message-State: AOJu0Yz5xonba3MuxFqV1V7PREB/aYtmwiktmndJb1D3Y4rWbIYGp1/4
	wLRyuuK30sKFPhQUltOgfKeJDiNIL241RgN64ITvFHNx86wRa4Was77tHrusMJ8NKbQL+on2c8G
	XoFFBhyIJscjj44viXCwYWP+BC2w=
X-Google-Smtp-Source: AGHT+IFG5u2IhWHF9mhy+oD4YZ1eB49wV20toaOn7SYI5p9UdOAeIP3Im2ga1lNwUmN7XpqNCSwRX3Ii8+AatxqajMQ=
X-Received: by 2002:a81:5c55:0:b0:60a:434b:ab29 with SMTP id
 q82-20020a815c55000000b0060a434bab29mr330035ywb.26.1710378495032; Wed, 13 Mar
 2024 18:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <17BC7C079BEBAD71.17826@lists.openembedded.org>
In-Reply-To: <17BC7C079BEBAD71.17826@lists.openembedded.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 13 Mar 2024 19:08:02 -0600
Message-ID: <CACS+7ZT1A+kjJZFPO5KVbABwcx_=KfyM8eJOUp32jLHr-aqicw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] python3-pylint: Fix ptest failures
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Dan McGregor <dan.mcgregor@vecima.com>
Content-Type: multipart/alternative; boundary="000000000000a0c4d2061394861e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 01:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109308

--000000000000a0c4d2061394861e
Content-Type: text/plain; charset="UTF-8"

Hopefully this works, used base64 encoding this time.

Otherwise, you can pull from
https://git.openembedded.org/meta-openembedded-contrib/log/?h=dankm/pylint

On Wed, Mar 13, 2024, 19:05 Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:

> From: Dan McGregor <dan.mcgregor@vecima.com>
>
> Due to the way we install ptests, some imports switch from
> first party to third party. Update test expectations
>
> Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
> ---
>  ...1-Adjust-test-expectations-for-ptest.patch | 44 +++++++++++++++++++
>  .../python/python3-pylint_3.1.0.bb            |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
> b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
> new file mode 100644
> index 00000000000..8edecbf1bd1
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
> @@ -0,0 +1,44 @@
> +From f3a213cf4922c122e554277ea2031c0c54cd3fe5 Mon Sep 17 00:00:00 2001
> +From: Dan McGregor <dan.mcgregor@vecima.com>
> +Date: Wed, 13 Mar 2024 14:08:25 -0600
> +Subject: [PATCH] Adjust test expectations for ptest
> +
> +Because of the way we install ptests, some first party imports
> +became third party. Reflect that in the test case.
> +
> +Upstream-Status: Inappropriate (embedded specific)
> +Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
> +---
> + tests/functional/w/wrong_import_order.txt | 22 +++++++++++-----------
> + 1 file changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/tests/functional/w/wrong_import_order.txt
> b/tests/functional/w/wrong_import_order.txt
> +index 068d2140d..9594ff9e0 100644
> +--- a/tests/functional/w/wrong_import_order.txt
> ++++ b/tests/functional/w/wrong_import_order.txt
> +@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard import ""sys""
> should be placed before
> + wrong-import-order:15:0:15:15::"standard import ""datetime"" should be
> placed before third party imports ""six"",
> ""astroid.are_exclusive""":UNDEFINED
> + wrong-import-order:18:0:18:22::"third party import ""totally_missing""
> should be placed before local import ""package.Class""":UNDEFINED
> + wrong-import-order:20:0:20:14::"third party import ""astroid"" should be
> placed before local imports ""package.Class"", "".package""":UNDEFINED
> +-wrong-import-order:22:0:22:22::"first party import ""pylint.checkers""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> +-wrong-import-order:23:0:23:25::"first party import ""pylint.config""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> +-wrong-import-order:24:0:24:17::"first party import ""pylint.sys"" should
> be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> +-wrong-import-order:25:0:25:28::"first party import ""pylint.pyreverse""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> +-wrong-import-order:30:0:30:40::"third party import
> ""six.moves.urllib.parse.quote"" should be placed before first party
> imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys"",
> ""pylint.pyreverse"" and local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> +-wrong-import-order:31:0:31:23::"first party import ""pylint.constants""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> +-wrong-import-order:32:0:32:19::"standard import ""re"" should be placed
> before third party imports ""six"", ""astroid.are_exclusive"",
> ""unused_import"", ""totally_missing"", ""astroid"",
> ""six.moves.urllib.parse.quote"", first party imports ""pylint.checkers"",
> ""pylint.config"", ""pylint.sys"", ""pylint.pyreverse"",
> ""pylint.constants"", and local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> +-wrong-import-order:32:0:32:19::"third party import ""requests"" should
> be placed before first party imports ""pylint.checkers"",
> ""pylint.config"", ""pylint.sys"", ""pylint.pyreverse"",
> ""pylint.constants"" and local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> +-wrong-import-order:33:0:33:24::"first party import ""pylint.exceptions""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> +-wrong-import-order:34:0:34:21::"first party import ""pylint.message""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> +-wrong-import-order:35:0:35:11::"standard import ""time"" should be
> placed before third party imports ""six"", ""astroid.are_exclusive"",
> ""unused_import"" (...) ""astroid"", ""six.moves.urllib.parse.quote"",
> ""requests"", first party imports ""pylint.checkers"", ""pylint.config"",
> ""pylint.sys"" (...) ""pylint.constants"", ""pylint.exceptions"",
> ""pylint.message"", and local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> ++wrong-import-order:22:0:22:22::"third party import ""pylint.checkers""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> ++wrong-import-order:23:0:23:25::"third party import ""pylint.config""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> ++wrong-import-order:24:0:24:17::"third party import ""pylint.sys"" should
> be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> ++wrong-import-order:25:0:25:28::"third party import ""pylint.pyreverse""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> ++wrong-import-order:30:0:30:40::"third party import
> ""six.moves.urllib.parse.quote"" should be placed before local imports
> ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",
> "".package4"", ""package4.Class4""":UNDEFINED
> ++wrong-import-order:31:0:31:23::"third party import ""pylint.constants""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> ++wrong-import-order:32:0:32:19::"standard import ""re"" should be placed
> before third party imports ""six"", ""astroid.are_exclusive"",
> ""unused_import"" (...) ""pylint.pyreverse"",
> ""six.moves.urllib.parse.quote"", ""pylint.constants"" and local imports
> ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",
> "".package4"", ""package4.Class4""":UNDEFINED
> ++wrong-import-order:32:0:32:19::"third party import ""requests"" should
> be placed before local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> ++wrong-import-order:33:0:33:24::"third party import ""pylint.exceptions""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> ++wrong-import-order:34:0:34:21::"third party import ""pylint.message""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> ++wrong-import-order:35:0:35:11::"standard import ""time"" should be
> placed before third party imports ""six"", ""astroid.are_exclusive"",
> ""unused_import"" (...) ""requests"", ""pylint.exceptions"",
> ""pylint.message"" and local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> index 49f0b3eb6e4..12f4f908af7 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> @@ -4,6 +4,7 @@ LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
>
>  SRC_URI += "git://
> github.com/pylint-dev/pylint;branch=maintenance/3.1.x;protocol=https \
> +           file://0001-Adjust-test-expectations-for-ptest.patch \
>             file://run-ptest \
>             "
>  SRCREV = "053c2c3a25f97f043e10cdd41d2609e495a68f57"
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109307):
> https://lists.openembedded.org/g/openembedded-devel/message/109307
> Mute This Topic: https://lists.openembedded.org/mt/104918714/3617261
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> danismostlikely@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a0c4d2061394861e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hopefully this works, used base64 encoding this time.<div=
 dir=3D"auto"><br></div><div dir=3D"auto">Otherwise, you can pull from=C2=
=A0<a href=3D"https://git.openembedded.org/meta-openembedded-contrib/log/?h=
=3Ddankm/pylint">https://git.openembedded.org/meta-openembedded-contrib/log=
/?h=3Ddankm/pylint</a></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 13, 2024, 19:05 Dan McGregor via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;da=
nismostlikely=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">From: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@vecima.com" tar=
get=3D"_blank" rel=3D"noreferrer">dan.mcgregor@vecima.com</a>&gt;<br>
<br>
Due to the way we install ptests, some imports switch from<br>
first party to third party. Update test expectations<br>
<br>
Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@vecima.com" =
target=3D"_blank" rel=3D"noreferrer">dan.mcgregor@vecima.com</a>&gt;<br>
---<br>
=C2=A0...1-Adjust-test-expectations-for-ptest.patch | 44 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-pylint_3.1.0.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">python3-pylint_3.1.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 45 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pylint=
/0001-Adjust-test-expectations-for-ptest.patch<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust=
-test-expectations-for-ptest.patch b/meta-python/recipes-devtools/python/py=
thon3-pylint/0001-Adjust-test-expectations-for-ptest.patch<br>
new file mode 100644<br>
index 00000000000..8edecbf1bd1<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-e=
xpectations-for-ptest.patch<br>
@@ -0,0 +1,44 @@<br>
+From f3a213cf4922c122e554277ea2031c0c54cd3fe5 Mon Sep 17 00:00:00 2001<br>
+From: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@vecima.com" target=
=3D"_blank" rel=3D"noreferrer">dan.mcgregor@vecima.com</a>&gt;<br>
+Date: Wed, 13 Mar 2024 14:08:25 -0600<br>
+Subject: [PATCH] Adjust test expectations for ptest<br>
+<br>
+Because of the way we install ptests, some first party imports<br>
+became third party. Reflect that in the test case.<br>
+<br>
+Upstream-Status: Inappropriate (embedded specific)<br>
+Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@vecima.com"=
 target=3D"_blank" rel=3D"noreferrer">dan.mcgregor@vecima.com</a>&gt;<br>
+---<br>
+ tests/functional/w/wrong_import_order.txt | 22 +++++++++++-----------<br>
+ 1 file changed, 11 insertions(+), 11 deletions(-)<br>
+<br>
+diff --git a/tests/functional/w/wrong_import_order.txt b/tests/functional/=
w/wrong_import_order.txt<br>
+index 068d2140d..9594ff9e0 100644<br>
+--- a/tests/functional/w/wrong_import_order.txt<br>
++++ b/tests/functional/w/wrong_import_order.txt<br>
+@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::&quot;standard import &qu=
ot;&quot;sys&quot;&quot; should be placed before<br>
+ wrong-import-order:15:0:15:15::&quot;standard import &quot;&quot;datetime=
&quot;&quot; should be placed before third party imports &quot;&quot;six&qu=
ot;&quot;, &quot;&quot;astroid.are_exclusive&quot;&quot;&quot;:UNDEFINED<br=
>
+ wrong-import-order:18:0:18:22::&quot;third party import &quot;&quot;total=
ly_missing&quot;&quot; should be placed before local import &quot;&quot;pac=
kage.Class&quot;&quot;&quot;:UNDEFINED<br>
+ wrong-import-order:20:0:20:14::&quot;third party import &quot;&quot;astro=
id&quot;&quot; should be placed before local imports &quot;&quot;package.Cl=
ass&quot;&quot;, &quot;&quot;.package&quot;&quot;&quot;:UNDEFINED<br>
+-wrong-import-order:22:0:22:22::&quot;first party import &quot;&quot;pylin=
t.checkers&quot;&quot; should be placed before local imports &quot;&quot;pa=
ckage.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.pac=
kage2&quot;&quot;&quot;:UNDEFINED<br>
+-wrong-import-order:23:0:23:25::&quot;first party import &quot;&quot;pylin=
t.config&quot;&quot; should be placed before local imports &quot;&quot;pack=
age.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.packa=
ge2&quot;&quot;&quot;:UNDEFINED<br>
+-wrong-import-order:24:0:24:17::&quot;first party import &quot;&quot;pylin=
t.sys&quot;&quot; should be placed before local imports &quot;&quot;package=
.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.package2=
&quot;&quot;&quot;:UNDEFINED<br>
+-wrong-import-order:25:0:25:28::&quot;first party import &quot;&quot;pylin=
t.pyreverse&quot;&quot; should be placed before local imports &quot;&quot;p=
ackage.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.pa=
ckage2&quot;&quot;&quot;:UNDEFINED<br>
+-wrong-import-order:30:0:30:40::&quot;third party import &quot;&quot;six.m=
oves.urllib.parse.quote&quot;&quot; should be placed before first party imp=
orts &quot;&quot;pylint.checkers&quot;&quot;, &quot;&quot;pylint.config&quo=
t;&quot;, &quot;&quot;pylint.sys&quot;&quot;, &quot;&quot;pylint.pyreverse&=
quot;&quot; and local imports &quot;&quot;package.Class&quot;&quot;, &quot;=
&quot;.package&quot;&quot;, &quot;&quot;.package2&quot;&quot; (...) &quot;&=
quot;package3.Class3&quot;&quot;, &quot;&quot;.package4&quot;&quot;, &quot;=
&quot;package4.Class4&quot;&quot;&quot;:UNDEFINED<br>
+-wrong-import-order:31:0:31:23::&quot;first party import &quot;&quot;pylin=
t.constants&quot;&quot; should be placed before local imports &quot;&quot;p=
ackage.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.pa=
ckage2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&qu=
ot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UND=
EFINED<br>
+-wrong-import-order:32:0:32:19::&quot;standard import &quot;&quot;re&quot;=
&quot; should be placed before third party imports &quot;&quot;six&quot;&qu=
ot;, &quot;&quot;astroid.are_exclusive&quot;&quot;, &quot;&quot;unused_impo=
rt&quot;&quot;, &quot;&quot;totally_missing&quot;&quot;, &quot;&quot;astroi=
d&quot;&quot;, &quot;&quot;six.moves.urllib.parse.quote&quot;&quot;, first =
party imports &quot;&quot;pylint.checkers&quot;&quot;, &quot;&quot;pylint.c=
onfig&quot;&quot;, &quot;&quot;pylint.sys&quot;&quot;, &quot;&quot;pylint.p=
yreverse&quot;&quot;, &quot;&quot;pylint.constants&quot;&quot;, and local i=
mports &quot;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&qu=
ot;, &quot;&quot;.package2&quot;&quot; (...) &quot;&quot;package3.Class3&qu=
ot;&quot;, &quot;&quot;.package4&quot;&quot;, &quot;&quot;package4.Class4&q=
uot;&quot;&quot;:UNDEFINED<br>
+-wrong-import-order:32:0:32:19::&quot;third party import &quot;&quot;reque=
sts&quot;&quot; should be placed before first party imports &quot;&quot;pyl=
int.checkers&quot;&quot;, &quot;&quot;pylint.config&quot;&quot;, &quot;&quo=
t;pylint.sys&quot;&quot;, &quot;&quot;pylint.pyreverse&quot;&quot;, &quot;&=
quot;pylint.constants&quot;&quot; and local imports &quot;&quot;package.Cla=
ss&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.package2&quo=
t;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&quot;.packag=
e4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UNDEFINED<br>
+-wrong-import-order:33:0:33:24::&quot;first party import &quot;&quot;pylin=
t.exceptions&quot;&quot; should be placed before local imports &quot;&quot;=
package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.p=
ackage2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&q=
uot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UN=
DEFINED<br>
+-wrong-import-order:34:0:34:21::&quot;first party import &quot;&quot;pylin=
t.message&quot;&quot; should be placed before local imports &quot;&quot;pac=
kage.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.pack=
age2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&quot=
;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UNDEF=
INED<br>
+-wrong-import-order:35:0:35:11::&quot;standard import &quot;&quot;time&quo=
t;&quot; should be placed before third party imports &quot;&quot;six&quot;&=
quot;, &quot;&quot;astroid.are_exclusive&quot;&quot;, &quot;&quot;unused_im=
port&quot;&quot; (...) &quot;&quot;astroid&quot;&quot;, &quot;&quot;six.mov=
es.urllib.parse.quote&quot;&quot;, &quot;&quot;requests&quot;&quot;, first =
party imports &quot;&quot;pylint.checkers&quot;&quot;, &quot;&quot;pylint.c=
onfig&quot;&quot;, &quot;&quot;pylint.sys&quot;&quot; (...) &quot;&quot;pyl=
int.constants&quot;&quot;, &quot;&quot;pylint.exceptions&quot;&quot;, &quot=
;&quot;pylint.message&quot;&quot;, and local imports &quot;&quot;package.Cl=
ass&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.package2&qu=
ot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&quot;.packa=
ge4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UNDEFINED<br=
>
++wrong-import-order:22:0:22:22::&quot;third party import &quot;&quot;pylin=
t.checkers&quot;&quot; should be placed before local imports &quot;&quot;pa=
ckage.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.pac=
kage2&quot;&quot;&quot;:UNDEFINED<br>
++wrong-import-order:23:0:23:25::&quot;third party import &quot;&quot;pylin=
t.config&quot;&quot; should be placed before local imports &quot;&quot;pack=
age.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.packa=
ge2&quot;&quot;&quot;:UNDEFINED<br>
++wrong-import-order:24:0:24:17::&quot;third party import &quot;&quot;pylin=
t.sys&quot;&quot; should be placed before local imports &quot;&quot;package=
.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.package2=
&quot;&quot;&quot;:UNDEFINED<br>
++wrong-import-order:25:0:25:28::&quot;third party import &quot;&quot;pylin=
t.pyreverse&quot;&quot; should be placed before local imports &quot;&quot;p=
ackage.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.pa=
ckage2&quot;&quot;&quot;:UNDEFINED<br>
++wrong-import-order:30:0:30:40::&quot;third party import &quot;&quot;six.m=
oves.urllib.parse.quote&quot;&quot; should be placed before local imports &=
quot;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &qu=
ot;&quot;.package2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot=
;, &quot;&quot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quo=
t;&quot;:UNDEFINED<br>
++wrong-import-order:31:0:31:23::&quot;third party import &quot;&quot;pylin=
t.constants&quot;&quot; should be placed before local imports &quot;&quot;p=
ackage.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.pa=
ckage2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&qu=
ot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UND=
EFINED<br>
++wrong-import-order:32:0:32:19::&quot;standard import &quot;&quot;re&quot;=
&quot; should be placed before third party imports &quot;&quot;six&quot;&qu=
ot;, &quot;&quot;astroid.are_exclusive&quot;&quot;, &quot;&quot;unused_impo=
rt&quot;&quot; (...) &quot;&quot;pylint.pyreverse&quot;&quot;, &quot;&quot;=
six.moves.urllib.parse.quote&quot;&quot;, &quot;&quot;pylint.constants&quot=
;&quot; and local imports &quot;&quot;package.Class&quot;&quot;, &quot;&quo=
t;.package&quot;&quot;, &quot;&quot;.package2&quot;&quot; (...) &quot;&quot=
;package3.Class3&quot;&quot;, &quot;&quot;.package4&quot;&quot;, &quot;&quo=
t;package4.Class4&quot;&quot;&quot;:UNDEFINED<br>
++wrong-import-order:32:0:32:19::&quot;third party import &quot;&quot;reque=
sts&quot;&quot; should be placed before local imports &quot;&quot;package.C=
lass&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.package2&q=
uot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&quot;.pack=
age4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UNDEFINED<b=
r>
++wrong-import-order:33:0:33:24::&quot;third party import &quot;&quot;pylin=
t.exceptions&quot;&quot; should be placed before local imports &quot;&quot;=
package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.p=
ackage2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&q=
uot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UN=
DEFINED<br>
++wrong-import-order:34:0:34:21::&quot;third party import &quot;&quot;pylin=
t.message&quot;&quot; should be placed before local imports &quot;&quot;pac=
kage.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.pack=
age2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&quot=
;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UNDEF=
INED<br>
++wrong-import-order:35:0:35:11::&quot;standard import &quot;&quot;time&quo=
t;&quot; should be placed before third party imports &quot;&quot;six&quot;&=
quot;, &quot;&quot;astroid.are_exclusive&quot;&quot;, &quot;&quot;unused_im=
port&quot;&quot; (...) &quot;&quot;requests&quot;&quot;, &quot;&quot;pylint=
.exceptions&quot;&quot;, &quot;&quot;pylint.message&quot;&quot; and local i=
mports &quot;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&qu=
ot;, &quot;&quot;.package2&quot;&quot; (...) &quot;&quot;package3.Class3&qu=
ot;&quot;, &quot;&quot;.package4&quot;&quot;, &quot;&quot;package4.Class4&q=
uot;&quot;&quot;:UNDEFINED<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pylint_3.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-py=
lint_3.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://p=
ython3-pylint_3.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pyt=
hon3-pylint_3.1.0.bb</a><br>
index 49f0b3eb6e4..12f4f908af7 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pylint_=
3.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-pylint_3.=
1.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pylint_=
3.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-pylint_3.=
1.0.bb</a><br>
@@ -4,6 +4,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc107cf754550e65755c42=
985a5d4e9c9&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/pylint-dev/pyli=
nt;branch=3Dmaintenance/3.1.x;protocol=3Dhttps" rel=3D"noreferrer noreferre=
r" target=3D"_blank">github.com/pylint-dev/pylint;branch=3Dmaintenance/3.1.=
x;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Adjust-test-expectati=
ons-for-ptest.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRCREV =3D &quot;053c2c3a25f97f043e10cdd41d2609e495a68f57&quot;<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109307): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109307" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/109307</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104918714/361=
7261" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/104918714/3617261</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:danismostlike=
ly@gmail.com" target=3D"_blank" rel=3D"noreferrer">danismostlikely@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a0c4d2061394861e--


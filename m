Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1280C47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:03:35 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.30589.1704679406549706411
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Q/1ATUkI;
 spf=pass (domain: mvista.com, ip: 209.85.208.170, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ccbc328744so14039031fa.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704679405; x=1705284205; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jihtX8UEL2txCmIsLSya058sbacaQZK+5U/bygXjigo=;
        b=Q/1ATUkIs/pq9OIa6B5f4ebjOLBCpubkXTybIH5L7onrX0xMayXhQLIex08mgcSEW0
         gInlBeGkbHZc1+tgXmwws4/1zgLTOCwfVJLLgOW4xdAg2d6wdqFA+HCKARsF4Fsy81BT
         qYFEKKyR+QOPBjDTuUEW+cjHTZuHNeldVvSyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704679405; x=1705284205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jihtX8UEL2txCmIsLSya058sbacaQZK+5U/bygXjigo=;
        b=a/YoWYaLGy/w3TbkBCLuMWMdlOkBjZrlUqaR6ZYDVVGIWfbkQ+kCE0Lmpw04RIWd4Z
         3BRE+hspIRT6eu6REApbHXja3hXaayB8cuOyQzpis15O7wmFyCZzDthd4P+yBmco52xg
         jG2b1bM1Z/MVurz8q/ZcRG2OjkmRJLPIvL3h624dx2uWGdUyK1r8qpEQ6DzmgjwnqoKd
         dFPs2Z80wSe++Ln9nBhgGPy1A1wirvA6sOKtv2r0fqXQ8UYCErXoQz5GYdKEsqqljJxp
         go5datrAMUgZKP5s87/VUMPmkfhLg9PZtYj0CNmey+w5Pwq5W1AXZcnVy0Zq6szsDVgl
         1+xw==
X-Gm-Message-State: AOJu0YzAUMUUDTrnZ6wJ8jijdUQLVNP0ejCNpAAqXaSaPLOrLJ0ffUYf
	YtpylDH7bvw1x8Wt21nfEI4oc6tTJ4+lBepfKwUs3QPubwFhIA==
X-Google-Smtp-Source: AGHT+IHlGeGnSVxk6NJ/+NDybVZzsHCyvoMr81RlSwAnCy7i0MylNVjcovfXye5MsCCvSbRxhSr+kDcLh9PEB8YXYdU=
X-Received: by 2002:a2e:934a:0:b0:2cd:2376:1414 with SMTP id
 m10-20020a2e934a000000b002cd23761414mr1017441ljh.3.1704679404408; Sun, 07 Jan
 2024 18:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20231220085438.97520-1-vanusuri@mvista.com> <17A27E534D74AE07.24485@lists.openembedded.org>
In-Reply-To: <17A27E534D74AE07.24485@lists.openembedded.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 8 Jan 2024 07:33:12 +0530
Message-ID: <CANQUz19=7fcc3yKXBVj+hjB7cH+5VneHLXqAiQSv9xF3d1iiTg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH v3 4/4] libssh: upgrade 0.10.4 -> 0.10.5
To: vanusuri@mvista.com, Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Yi Zhao <yi.zhao@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000005b22b5060e659a5f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108081

--0000000000005b22b5060e659a5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Any update on this ?

Thanks & Regards,
Vijay

On Wed, Dec 20, 2023 at 2:25=E2=80=AFPM Vijay Anusuri via lists.openembedde=
d.org
<vanusuri=3Dmvista.com@lists.openembedded.org> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Changelog:
> https://git.libssh.org/projects/libssh.git/tag/?h=3Dlibssh-0.10.5
>
> * Generate cases list dynamically in run-ptest.
> * Install missing file to fix ptest failure.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>
> Ref:
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dstable=
/nanbield-nut&id=3Db0833f1f3ec78f16a79d9ff66cdd19da93496018
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../recipes-support/libssh/libssh/run-ptest   | 42 ++-----------------
>  .../{libssh_0.10.4.bb =3D> libssh_0.10.5.bb}    |  5 ++-
>  2 files changed, 7 insertions(+), 40 deletions(-)
>  rename meta-oe/recipes-support/libssh/{libssh_0.10.4.bb =3D>
> libssh_0.10.5.bb} (85%)
>
> diff --git a/meta-oe/recipes-support/libssh/libssh/run-ptest
> b/meta-oe/recipes-support/libssh/libssh/run-ptest
> index 159994e9b..6346b72d5 100644
> --- a/meta-oe/recipes-support/libssh/libssh/run-ptest
> +++ b/meta-oe/recipes-support/libssh/libssh/run-ptest
> @@ -1,53 +1,17 @@
>  #!/bin/sh
>
> -# Valid tests to run
> -tests=3D"torture_bind_config \
> -       torture_buffer \
> -       torture_bytearray \
> -       torture_callbacks \
> -       torture_channel \
> -       torture_config \
> -       torture_crypto \
> -       torture_hashes \
> -       torture_init \
> -       torture_isipaddr \
> -       torture_keyfiles \
> -       torture_knownhosts_parsing \
> -       torture_list \
> -       torture_misc \
> -       torture_moduli \
> -       torture_options \
> -       torture_packet \
> -       torture_packet_filter \
> -       torture_pki \
> -       torture_pki_ecdsa \
> -       torture_pki_ed25519 \
> -       torture_pki_rsa \
> -       torture_push_pop_dir \
> -       torture_rand \
> -       torture_session_keys \
> -       torture_temp_dir \
> -       torture_temp_file \
> -       torture_threads_buffer \
> -       torture_threads_crypto \
> -       torture_threads_init \
> -       torture_threads_pki_rsa \
> -       torture_tokens \
> -         "
> -
>  ptestdir=3D$(dirname "$(readlink -f "$0")")
>  cd "$ptestdir"/tests || exit
>
> -# Run specified tests
> +tests=3D$(find * -type f -name 'torture_*')
> +
>  for f in $tests
>  do
> -    if test -e ./"$f"; then
> +    if test -x ./"$f"; then
>          if ./"$f" > ./"$f".out 2> ./"$f".err; then
>              echo "PASS: $f"
>          else
>              echo "FAIL: $f"
>          fi
> -    else
> -        echo "SKIP: $f"
>      fi
>  done
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
> similarity index 85%
> rename from meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> rename to meta-oe/recipes-support/libssh/libssh_0.10.5.bb
> index 4b2ced5e5..f33987acf 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://
> git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Dstable
>
> file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
>             file://run-ptest \
>            "
> -SRCREV =3D "e8322817a9e5aaef0698d779ddd467a209a85d85"
> +SRCREV =3D "479eca13aaaa46b43e68c52186e3783f06ae6f34"
>
>  S =3D "${WORKDIR}/git"
>
> @@ -34,12 +34,15 @@ EXTRA_OECMAKE =3D " \
>  do_compile:prepend () {
>      if [ ${PTEST_ENABLED} =3D "1" ]; then
>          sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/config.h
> +        sed -i -e 's|${S}|${PTEST_PATH}|g' ${B}/config.h
>      fi
>  }
>
>  do_install_ptest () {
>      install -d ${D}${PTEST_PATH}/tests
>      cp -f ${B}/tests/unittests/torture_* ${D}${PTEST_PATH}/tests/
> +    install -d ${D}${PTEST_PATH}/tests/unittests
> +    cp -f ${S}/tests/unittests/hello*.sh
> ${D}${PTEST_PATH}/tests/unittests/
>  }
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107653):
> https://lists.openembedded.org/g/openembedded-devel/message/107653
> Mute This Topic: https://lists.openembedded.org/mt/103278130/7301997
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005b22b5060e659a5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Armin,</div><div><br></div><div>Any update on this=
 ?</div><div><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Dec 20, 2023 at 2:25=E2=80=AFPM Vijay Anusuri via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;vanusuri=3D<a href=
=3D"mailto:mvista.com@lists.openembedded.org">mvista.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Changelog:<br>
<a href=3D"https://git.libssh.org/projects/libssh.git/tag/?h=3Dlibssh-0.10.=
5" rel=3D"noreferrer" target=3D"_blank">https://git.libssh.org/projects/lib=
ssh.git/tag/?h=3Dlibssh-0.10.5</a><br>
<br>
* Generate cases list dynamically in run-ptest.<br>
* Install missing file to fix ptest failure.<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
<br>
Ref: <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/comm=
it/?h=3Dstable/nanbield-nut&amp;id=3Db0833f1f3ec78f16a79d9ff66cdd19da934960=
18" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-=
openembedded-contrib/commit/?h=3Dstable/nanbield-nut&amp;id=3Db0833f1f3ec78=
f16a79d9ff66cdd19da93496018</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/libssh/libssh/run-ptest=C2=A0 =C2=A0| 42 ++------=
-----------<br>
=C2=A0.../{<a href=3D"http://libssh_0.10.4.bb" rel=3D"noreferrer" target=3D=
"_blank">libssh_0.10.4.bb</a> =3D&gt; <a href=3D"http://libssh_0.10.5.bb" r=
el=3D"noreferrer" target=3D"_blank">libssh_0.10.5.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 5 ++-<br>
=C2=A02 files changed, 7 insertions(+), 40 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/libssh/{<a href=3D"http://libssh_0.10.=
4.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.10.4.bb</a> =3D&gt; <a =
href=3D"http://libssh_0.10.5.bb" rel=3D"noreferrer" target=3D"_blank">libss=
h_0.10.5.bb</a>} (85%)<br>
<br>
diff --git a/meta-oe/recipes-support/libssh/libssh/run-ptest b/meta-oe/reci=
pes-support/libssh/libssh/run-ptest<br>
index 159994e9b..6346b72d5 100644<br>
--- a/meta-oe/recipes-support/libssh/libssh/run-ptest<br>
+++ b/meta-oe/recipes-support/libssh/libssh/run-ptest<br>
@@ -1,53 +1,17 @@<br>
=C2=A0#!/bin/sh<br>
<br>
-# Valid tests to run<br>
-tests=3D&quot;torture_bind_config \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_buffer \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_bytearray \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_callbacks \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_channel \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_config \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_crypto \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_hashes \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_init \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_isipaddr \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_keyfiles \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_knownhosts_parsing \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_list \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_misc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_moduli \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_options \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_packet \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_packet_filter \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_pki \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_pki_ecdsa \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_pki_ed25519 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_pki_rsa \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_push_pop_dir \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_rand \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_session_keys \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_temp_dir \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_temp_file \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_threads_buffer \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_threads_crypto \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_threads_init \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_threads_pki_rsa \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0torture_tokens \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
=C2=A0ptestdir=3D$(dirname &quot;$(readlink -f &quot;$0&quot;)&quot;)<br>
=C2=A0cd &quot;$ptestdir&quot;/tests || exit<br>
<br>
-# Run specified tests<br>
+tests=3D$(find * -type f -name &#39;torture_*&#39;)<br>
+<br>
=C2=A0for f in $tests<br>
=C2=A0do<br>
-=C2=A0 =C2=A0 if test -e ./&quot;$f&quot;; then<br>
+=C2=A0 =C2=A0 if test -x ./&quot;$f&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ./&quot;$f&quot; &gt; ./&quot;$f&quot;=
.out 2&gt; ./&quot;$f&quot;.err; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;PASS: $f&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL: $f&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;SKIP: $f&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0done<br>
diff --git a/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.10.4=
.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.10.4.bb</a> b/meta-oe/re=
cipes-support/libssh/<a href=3D"http://libssh_0.10.5.bb" rel=3D"noreferrer"=
 target=3D"_blank">libssh_0.10.5.bb</a><br>
similarity index 85%<br>
rename from meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.10.4.=
bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.10.4.bb</a><br>
rename to meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.10.5.bb=
" rel=3D"noreferrer" target=3D"_blank">libssh_0.10.5.bb</a><br>
index 4b2ced5e5..f33987acf 100644<br>
--- a/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.10.4.bb" re=
l=3D"noreferrer" target=3D"_blank">libssh_0.10.4.bb</a><br>
+++ b/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.10.5.bb" re=
l=3D"noreferrer" target=3D"_blank">libssh_0.10.5.bb</a><br>
@@ -11,7 +11,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.libssh.org/=
projects/libssh.git;protocol=3Dhttps;branch=3Dstable" rel=3D"noreferrer" ta=
rget=3D"_blank">git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=
=3Dstable</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libgcrypt.c-Fix-proto=
type-of-des3_encrypt-des3_decry.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRCREV =3D &quot;e8322817a9e5aaef0698d779ddd467a209a85d85&quot;<br>
+SRCREV =3D &quot;479eca13aaaa46b43e68c52186e3783f06ae6f34&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
@@ -34,12 +34,15 @@ EXTRA_OECMAKE =3D &quot; \<br>
=C2=A0do_compile:prepend () {<br>
=C2=A0 =C2=A0 =C2=A0if [ ${PTEST_ENABLED} =3D &quot;1&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|${B}|${PTEST_PATH}|g&#39=
; ${B}/config.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s|${S}|${PTEST_PATH}|g&#39; ${B=
}/config.h<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0do_install_ptest () {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests<br>
=C2=A0 =C2=A0 =C2=A0cp -f ${B}/tests/unittests/torture_* ${D}${PTEST_PATH}/=
tests/<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests/unittests<br>
+=C2=A0 =C2=A0 cp -f ${S}/tests/unittests/hello*.sh ${D}${PTEST_PATH}/tests=
/unittests/<br>
=C2=A0}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107653): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107653" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107653</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103278130/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103278130/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000005b22b5060e659a5f--


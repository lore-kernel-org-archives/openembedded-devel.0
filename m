Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B37C10F1E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 16:41:04 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.55033.1671554454380267578
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 08:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VTSxmacS;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id d2-20020a4ab202000000b004ae3035538bso1383710ooo.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 08:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mo5yDCXSyJ5AonjU5yVT7Q7I9V/Hvw0H4OxKQAS9yFc=;
        b=VTSxmacS1MDkEN/SRArdOrOsyxDizNbF7IdCcl/CUv+EMYRazA20WWpqN4Km+4QxqF
         /Pgu+6a0no/2q07X51mLlMTrMuGwCJsDLYC6zIZtxqGY3xHRBabJqnrWsI1kLeksTvWA
         HR53WdM1CbjYrmT/TvFdmnlN7XQjgHJvxhMO9UE5kCpllgbemPEALXh2TJUpd3FPTj26
         SrQbr71s62mq0mZO21EtkyyDkqPFQQkBHWg3SVQI9JeWGPwQlOxDBuGGyJ8qYHEgSGZv
         ufZmSaya72P0zJDbNTAJbz3ioNe8p1q1g9QKW0Gnd+LDHaQzWU4xmOVGhPsuHAwDWtKw
         X42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mo5yDCXSyJ5AonjU5yVT7Q7I9V/Hvw0H4OxKQAS9yFc=;
        b=nL9nA2i7lfhFnQBPjAXbJ4Fz3Kl6mjgBHg/k5zb976PIlfuUFT8rDyvqolSQf7mIwT
         XmcfwDsp3/0ASM/FzpYGgypsipTaZg7YcP5uURkrHqZ2KW+1UKDTggVfiHZ54o1NftTm
         hxA2gocPulpAzsbi+sIATyuyVbq9MP7EaxRFEGhDiGwSWbnKi0N0KJZZqkSScELqxWs4
         FY9zTe8RuFVyyJzyIez60BnkysTs9QURsGJBbIpF7yy+wiLhJDsIPTo/Ks2m/S60dPDF
         zYmtEOXqf8ykaUCUbsw+gV2J5aOjdyHVbV2tkjeTujt+hW50ur4TUG4u3A6/9hoKK9Dv
         Jqag==
X-Gm-Message-State: AFqh2koo70EKZBSIV8otdcAa1b+vQqsV1LEnlJa/7zHCica/xCHCuDu6
	pof61x+vRDMHj16b2OJOpg7FOoDNczdjWPw//bw=
X-Google-Smtp-Source: AMrXdXttuV1oGJGa4Gkhmf3hjOKl0PnZvs751jBIA7XXeJCIougS9dED5/tUF/oUymx0Z5WgKo6XxXT7YcGm0poc+Ww=
X-Received: by 2002:a4a:cf15:0:b0:4b1:52d7:5963 with SMTP id
 l21-20020a4acf15000000b004b152d75963mr202155oos.73.1671554453399; Tue, 20 Dec
 2022 08:40:53 -0800 (PST)
MIME-Version: 1.0
References: <ef4e5634-436f-0501-3add-92bf1fcb0ec6@gmail.com>
In-Reply-To: <ef4e5634-436f-0501-3add-92bf1fcb0ec6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Dec 2022 08:40:42 -0800
Message-ID: <CAMKF1soSwLThSPACKuZMH8_BueFDdu=+Rwjm00TNXZf1dzhzqQ@mail.gmail.com>
Subject: Re: kirkstone merge request: Dec 20th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006aedc305f0451922"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 16:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100161

--0000000000006aedc305f0451922
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged thanks
I see there is a branch called kirtstone-next this looks a typo and push
Can we delete this branch if that=E2=80=99s so ?

On Tue, Dec 20, 2022 at 6:31 AM akuster808 <akuster808@gmail.com> wrote:

> The following changes since commit
> 50d4a8d2a983a68383ef1ffec2c8e21adf0c1a79:
>
>    re2: fix branch name from master to main (2022-11-02 06:50:29 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to a8055484f2829e8dfd03d5c8520b2c611aa7ebd2:
>
>    dool: Add patch to fix rebuild (2022-12-11 16:18:53 -0500)
>
> ----------------------------------------------------------------
> Alexander Stein (1):
>        dool: Add patch to fix rebuild
>
> Archana Polampalli (1):
>        Nodejs - Upgrade to 16.18.1
>
> He Zhe (2):
>        protobuf: upgrade 3.19.4 -> 3.19.6
>        python3-protobuf: upgrade 3.20.0 -> 3.20.3
>
> Hitendra Prajapati (3):
>        dhcp: Fix CVE-2022-2928 & CVE-2022-2929
>        strongswan: CVE-2022-40617 A possible DoS in Using Untrusted URIs
> for Revocation Checking
>        nginx: CVE-2022-41741, CVE-2022-41742 Memory corruption in the
> ngx_http_mp4_module
>
> Narpat Mali (1):
>        python3-oauthlib: upgrade 3.2.0 -> 3.2.2
>
> Peter Kjellerstedt (2):
>        chrony: Remove the readline PACKAGECONFIG
>        chrony: Remove the libcap and nss PACKAGECONFIGs
>
> Zheng Qiu (1):
>        redis: build with USE_SYSTEMD=3Dyes when systemd is enabled
>
>   meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb   | 2 +
>   .../recipes-connectivity/dhcp/files/CVE-2022-2928.patch         | 120
> +++++++++++
>   .../recipes-connectivity/dhcp/files/CVE-2022-2929.patch         | 40 ++=
++
>   meta-networking/recipes-support/chrony/chrony_4.2.bb            | 19 +-
>   .../recipes-support/strongswan/files/CVE-2022-40617.patch       | 157
> ++++++++++++++
>   meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb  | 1 +
>   .../oe-npm-cache                                                | 0
>   ...oe-cache-native_16.14.bb =3D> nodejs-oe-cache-native_16.18.bb} |   0
>   ...g-native-binaries.patch =3D> 0001-Using-native-binaries.patch} |  40
> ++--
>   .../nodejs/0002-Install-both-binaries-and-use-libdir.patch      | 96
> ---------
>   .../nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch | 151
> -------------
>   .../nodejs/{nodejs_16.14.2.bb =3D> nodejs_16.18.1.bb} |   8 +-
>   .../protobuf/{protobuf_3.19.4.bb =3D> protobuf_3.19.6.bb} |   2 +-
>   meta-oe/recipes-extended/redis/redis-7/redis.service            | 1 +
>   meta-oe/recipes-extended/redis/redis_7.0.4.bb                   | 8 +-
>   meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch | 261
> +++++++++++++++++++++++
>   meta-oe/recipes-support/dool/dool_1.0.0.bb                      | 1 +
>   .../{python3-oauthlib_3.2.0.bb =3D> python3-oauthlib_3.2.2.bb} |   2 +-
>   .../{python3-protobuf_3.20.0.bb =3D> python3-protobuf_3.20.3.bb} |   2 =
+-
>   .../nginx/files/CVE-2022-41741-CVE-2022-41742.patch             | 319
> ++++++++++++++++++++++++++++
>   meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb              | 4 +-
>   21 files changed, 948 insertions(+), 286 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch
>   create mode 100644
> meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch
>   create mode 100644
> meta-networking/recipes-support/strongswan/files/CVE-2022-40617.patch
>   rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14 =3D>
> nodejs-oe-cache-16.18}/oe-npm-cache (100%)
>   rename
> meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.14.bb =3D>
> nodejs-oe-cache-native_16.18.bb} (100%)
>   rename
> meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binaries.patch
> =3D> 0001-Using-native-binaries.patch} (70%)
>   delete mode 100644
>
> meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use=
-libdir.patch
>   delete mode 100644
>
> meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-o=
ption.patch
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.2.bb =3D>
> nodejs_16.18.1.bb} (94%)
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_3.19.4.bb =3D>
> protobuf_3.19.6.bb} (98%)
>   create mode 100644
> meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
>   rename meta-python/recipes-devtools/python/{python3-oauthlib_3.2.0.bb
> =3D> python3-oauthlib_3.2.2.bb} (92%)
>   rename meta-python/recipes-devtools/python/{python3-protobuf_3.20.0.bb
> =3D> python3-protobuf_3.20.3.bb} (92%)
>   create mode 100644
>
> meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.pa=
tch
>
>

--0000000000006aedc305f0451922
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">Merged thanks=C2=A0</div><div dir=3D"auto"=
>I see there is a branch called kirtstone-next this looks a typo and push</=
div><div dir=3D"auto">Can we delete this branch if that=E2=80=99s so ?</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote" d=
ir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 20, 2022 at 6=
:31 AM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The followin=
g changes since commit 50d4a8d2a983a68383ef1ffec2c8e21adf0c1a79:<br>
<br>
=C2=A0=C2=A0 re2: fix branch name from master to main (2022-11-02 06:50:29 =
-0400)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openemb=
edded</a> kirkstone-next<br>
<br>
for you to fetch changes up to a8055484f2829e8dfd03d5c8520b2c611aa7ebd2:<br=
>
<br>
=C2=A0=C2=A0 dool: Add patch to fix rebuild (2022-12-11 16:18:53 -0500)<br>
<br>
----------------------------------------------------------------<br>
Alexander Stein (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dool: Add patch to fix rebuild<br>
<br>
Archana Polampalli (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Nodejs - Upgrade to 16.18.1<br>
<br>
He Zhe (2):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 protobuf: upgrade 3.19.4 -&gt; 3.19.6<=
br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-protobuf: upgrade 3.20.0 -&gt;=
 3.20.3<br>
<br>
Hitendra Prajapati (3):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dhcp: Fix CVE-2022-2928 &amp; CVE-2022=
-2929<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strongswan: CVE-2022-40617 A possible =
DoS in Using Untrusted URIs <br>
for Revocation Checking<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nginx: CVE-2022-41741, CVE-2022-41742 =
Memory corruption in the <br>
ngx_http_mp4_module<br>
<br>
Narpat Mali (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-oauthlib: upgrade 3.2.0 -&gt; =
3.2.2<br>
<br>
Peter Kjellerstedt (2):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chrony: Remove the readline PACKAGECON=
FIG<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chrony: Remove the libcap and nss PACK=
AGECONFIGs<br>
<br>
Zheng Qiu (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 redis: build with USE_SYSTEMD=3Dyes wh=
en systemd is enabled<br>
<br>
=C2=A0=C2=A0meta-networking/recipes-connectivity/dhcp/<a href=3D"http://dhc=
p-relay_4.4.3.bb" rel=3D"noreferrer" target=3D"_blank">dhcp-relay_4.4.3.bb<=
/a>=C2=A0=C2=A0 | 2 +<br>
=C2=A0=C2=A0.../recipes-connectivity/dhcp/files/CVE-2022-2928.patch=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 120 <br>
+++++++++++<br>
=C2=A0=C2=A0.../recipes-connectivity/dhcp/files/CVE-2022-2929.patch=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 40 ++++<br>
=C2=A0=C2=A0meta-networking/recipes-support/chrony/<a href=3D"http://chrony=
_4.2.bb" rel=3D"noreferrer" target=3D"_blank">chrony_4.2.bb</a>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +-<br>
=C2=A0=C2=A0.../recipes-support/strongswan/files/CVE-2022-40617.patch=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 157 <br>
++++++++++++++<br>
=C2=A0=C2=A0meta-networking/recipes-support/strongswan/<a href=3D"http://st=
rongswan_5.9.6.bb" rel=3D"noreferrer" target=3D"_blank">strongswan_5.9.6.bb=
</a>=C2=A0 | 1 +<br>
=C2=A0=C2=A0.../oe-npm-cache=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 0<br>
=C2=A0=C2=A0...<a href=3D"http://oe-cache-native_16.14.bb" rel=3D"noreferre=
r" target=3D"_blank">oe-cache-native_16.14.bb</a> =3D&gt; <a href=3D"http:/=
/nodejs-oe-cache-native_16.18.bb" rel=3D"noreferrer" target=3D"_blank">node=
js-oe-cache-native_16.18.bb</a>} |=C2=A0=C2=A0 0<br>
=C2=A0=C2=A0...g-native-binaries.patch =3D&gt; 0001-Using-native-binaries.p=
atch} |=C2=A0 40 ++--<br>
=C2=A0=C2=A0.../nodejs/0002-Install-both-binaries-and-use-libdir.patch=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 96 <br>
---------<br>
=C2=A0=C2=A0.../nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch=
 | 151 <br>
-------------<br>
=C2=A0=C2=A0.../nodejs/{<a href=3D"http://nodejs_16.14.2.bb" rel=3D"norefer=
rer" target=3D"_blank">nodejs_16.14.2.bb</a> =3D&gt; <a href=3D"http://node=
js_16.18.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_16.18.1.bb</a>} =
|=C2=A0=C2=A0 8 +-<br>
=C2=A0=C2=A0.../protobuf/{<a href=3D"http://protobuf_3.19.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">protobuf_3.19.4.bb</a> =3D&gt; <a href=3D"http://=
protobuf_3.19.6.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.19.6.bb=
</a>} |=C2=A0=C2=A0 2 +-<br>
=C2=A0=C2=A0meta-oe/recipes-extended/redis/redis-7/redis.service=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +<br>
=C2=A0=C2=A0meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.0.4.bb=
" rel=3D"noreferrer" target=3D"_blank">redis_7.0.4.bb</a>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8 +-<br>
=C2=A0=C2=A0meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch=
 | 261 <br>
+++++++++++++++++++++++<br>
=C2=A0=C2=A0meta-oe/recipes-support/dool/<a href=3D"http://dool_1.0.0.bb" r=
el=3D"noreferrer" target=3D"_blank">dool_1.0.0.bb</a>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +<br>
=C2=A0=C2=A0.../{<a href=3D"http://python3-oauthlib_3.2.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-oauthlib_3.2.0.bb</a> =3D&gt; <a href=3D"ht=
tp://python3-oauthlib_3.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-oauthlib_3.2.2.bb</a>} |=C2=A0=C2=A0 2 +-<br>
=C2=A0=C2=A0.../{<a href=3D"http://python3-protobuf_3.20.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-protobuf_3.20.0.bb</a> =3D&gt; <a href=3D"=
http://python3-protobuf_3.20.3.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-protobuf_3.20.3.bb</a>} |=C2=A0=C2=A0 2 +-<br>
=C2=A0=C2=A0.../nginx/files/CVE-2022-41741-CVE-2022-41742.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 319 <br>
++++++++++++++++++++++++++++<br>
=C2=A0=C2=A0meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.20=
.1.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.20.1.bb</a>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +-<b=
r>
=C2=A0=C2=A021 files changed, 948 insertions(+), 286 deletions(-)<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-support/strongswan/files/CVE-2022-40617.patch<br>
=C2=A0=C2=A0rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14 =
=3D&gt; <br>
nodejs-oe-cache-16.18}/oe-npm-cache (100%)<br>
=C2=A0=C2=A0rename <br>
meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs-oe-cache-native_1=
6.14.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-native_16.14.=
bb</a> =3D&gt; <br>
<a href=3D"http://nodejs-oe-cache-native_16.18.bb" rel=3D"noreferrer" targe=
t=3D"_blank">nodejs-oe-cache-native_16.18.bb</a>} (100%)<br>
=C2=A0=C2=A0rename <br>
meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binaries.patch <b=
r>
=3D&gt; 0001-Using-native-binaries.patch} (70%)<br>
=C2=A0=C2=A0delete mode 100644 <br>
meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-l=
ibdir.patch<br>
=C2=A0=C2=A0delete mode 100644 <br>
meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-opt=
ion.patch<br>
=C2=A0=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodej=
s_16.14.2.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_16.14.2.bb</a> =
=3D&gt; <br>
<a href=3D"http://nodejs_16.18.1.bb" rel=3D"noreferrer" target=3D"_blank">n=
odejs_16.18.1.bb</a>} (94%)<br>
=C2=A0=C2=A0rename meta-oe/recipes-devtools/protobuf/{<a href=3D"http://pro=
tobuf_3.19.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.19.4.bb</a=
> =3D&gt; <br>
<a href=3D"http://protobuf_3.19.6.bb" rel=3D"noreferrer" target=3D"_blank">=
protobuf_3.19.6.bb</a>} (98%)<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch<br>
=C2=A0=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://p=
ython3-oauthlib_3.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-oaut=
hlib_3.2.0.bb</a> <br>
=3D&gt; <a href=3D"http://python3-oauthlib_3.2.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python3-oauthlib_3.2.2.bb</a>} (92%)<br>
=C2=A0=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://p=
ython3-protobuf_3.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pro=
tobuf_3.20.0.bb</a> <br>
=3D&gt; <a href=3D"http://python3-protobuf_3.20.3.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3-protobuf_3.20.3.bb</a>} (92%)<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patc=
h<br>
<br>
</blockquote></div></div>

--0000000000006aedc305f0451922--


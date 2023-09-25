Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A59FCE7AB4
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 17:58:24 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.68214.1695664696826549321
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 10:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VX/ExKow;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6bf04263dc8so4301809a34.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695664696; x=1696269496; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1NUvRomJBB811TfEc5dL3cpCx3UbZghdCpN5IvgFKk=;
        b=VX/ExKow6cK8aOPb7lQu96mUGEf81IA5bvviVF0BW79F3Br/TUeY/ED+6+s+J5s4GY
         tRdBKyvZqy80XcxxzRh/IXO4AUvEN8xKitsv2hVZ/S6ZYsfLn2I72kV8zRTtHre4Em2Z
         GeOc97ncUWQtX2MOVJ5Fqgka4WUBnXMBYGhdckBsGwdXk9zV83FFGJzOzURGXRJF9IKn
         HyTwsZzOE5KACZ/UtRcqJNKMxTq4lOZ61/MLc0gPH7QvqWKz7/ysqxOua1K4nLj3w4ox
         vBk6hAZABa9H0VpIDcfyT934SD/tjfNvnfGjL5NqzsoCcbUd4e4l/GvnGOAcskMyFMrC
         hR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695664696; x=1696269496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1NUvRomJBB811TfEc5dL3cpCx3UbZghdCpN5IvgFKk=;
        b=FClyqVhRyUU/KUC0qUjZZ8OKhzGFuyXR24KsZmwiiaEYQuEvWoJ7Rvf5RG23iKDb3t
         u1i3F2pxZeOGu7oZNUjDr7aE7Vqmlxjo8O7tXDBkZpVuC6JEzXf9w33rXSmtSak1PIKk
         whVfOMIQks9dF4xAKzSItuC/Q1+eEkQ+LvslulH97omx6EuBDp5NQnupRRn1yUWP+852
         LwE6CAaHaRnvjRK+/pxnjgYxZaujMc8lLeJvzlE1YeIsp/oTbHXUgiCBxeOj8NMpeC09
         N+q59NvlzagqvUgZ67WSfVok1XgJnshtCnYo60Tih2JZikljGToBia2AEG9R5IKI8Pqj
         fjzg==
X-Gm-Message-State: AOJu0YyEmiF/YNP2PaC8zsJRH6xboIUM2lWe1z4TebCothjwVvXj8P/n
	wO5Ck7a+uvAMqjVtUQC2MnWZRPLj6ocq50fYpTM=
X-Google-Smtp-Source: AGHT+IH7obZgvhTAGNlxXLeVEUJ28bQiMlVvdduGc+POpddcAYK67DU7EnJuuHLQJom6Rdh+BV5dXDnRBOhKIvU8Ykw=
X-Received: by 2002:a05:6871:594:b0:1bf:26f0:6b5b with SMTP id
 u20-20020a056871059400b001bf26f06b5bmr9815164oan.32.1695664695924; Mon, 25
 Sep 2023 10:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230925131349.12941-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20230925131349.12941-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Sep 2023 10:57:49 -0700
Message-ID: <CAMKF1soBhLJudUsZ0MLcC2Xhg4nkm7Li12Akz0KBRy8dD6fKwg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mosquitto: upgrade 2.0.17 -> 2.0.18
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 17:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105131

On Mon, Sep 25, 2023 at 6:15=E2=80=AFAM Gianfranco
<costamagna.gianfranco@gmail.com> wrote:
>
> Add two patches from Debian, pull requests proposed upstream as 2894 and =
2895
> to make it start only when board is online, and to fix dynamic websockets=
 link failure
> ---
>  .../mosquitto/files/2894.patch                | 23 +++++++++++++++++
>  .../mosquitto/files/2895.patch                | 25 +++++++++++++++++++
>  ...osquitto_2.0.17.bb =3D> mosquitto_2.0.18.bb} |  4 ++-
>  3 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/=
2894.patch
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/=
2895.patch
>  rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.17.=
bb =3D> mosquitto_2.0.18.bb} (95%)
>
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894.pa=
tch b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> new file mode 100644
> index 000000000..3275e57e3
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> @@ -0,0 +1,23 @@
> +From: Joachim Zobel <jz-2017@heute-morgen.de>
> +Date: Wed, 13 Sep 2023 09:55:34 +0200
> +Subject: [PATCH] Link correctly with shared websockets library if needed=
 see:
> + https://github.com/eclipse/mosquitto/pull/2751
> +
> +Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and  Daniel=
 Engberg <daniel.engberg.lists@pyret.net>

It will be good to annotate the patch with Signed-off-by and Upstream-Statu=
s:

https://docs.yoctoproject.org/dev/contributor-guide/recipe-style-guide.html=
?highlight=3Dupstream+status#patch-upstream-status

> +---
> + src/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index 9380a04..dce8313 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -200,7 +200,7 @@ if (WITH_WEBSOCKETS)
> +                       link_directories(${mosquitto_SOURCE_DIR})
> +               endif (WIN32)
> +       else (STATIC_WEBSOCKETS)
> +-              set (MOSQ_LIBS ${MOSQ_LIBS} websockets)
> ++              set (MOSQ_LIBS ${MOSQ_LIBS} websockets_shared)
> +       endif (STATIC_WEBSOCKETS)
> + endif (WITH_WEBSOCKETS)
> +
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895.pa=
tch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> new file mode 100644
> index 000000000..a9e9c97b8
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> @@ -0,0 +1,25 @@
> +From: Joachim Zobel <jz-2017@heute-morgen.de>
> +Date: Wed, 13 Sep 2023 10:05:43 +0200
> +Subject: [PATCH] Mosquitto now waits for network-online when starting
> + (Closes: #1036450)
> +
> +See: https://github.com/eclipse/mosquitto/issues/2878
> +---
> + service/systemd/mosquitto.service.simple | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/service/systemd/mosquitto.service.simple b/service/systemd/=
mosquitto.service.simple
> +index 15ee0d6..c2a330b 100644
> +--- a/service/systemd/mosquitto.service.simple
> ++++ b/service/systemd/mosquitto.service.simple
> +@@ -1,8 +1,8 @@
> + [Unit]
> + Description=3DMosquitto MQTT Broker
> + Documentation=3Dman:mosquitto.conf(5) man:mosquitto(8)
> +-After=3Dnetwork.target
> +-Wants=3Dnetwork.target
> ++After=3Dnetwork-online.target
> ++Wants=3Dnetwork-online.target
> +
> + [Service]
> + ExecStart=3D/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
> diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0=
.17.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
> similarity index 95%
> rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.=
17.bb
> rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18=
.bb
> index 690b6bc12..0c9ccc810 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.bb
> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
> @@ -17,9 +17,11 @@ DEPENDS =3D "uthash cjson"
>  SRC_URI =3D "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
>             file://mosquitto.init \
>             file://1571.patch \
> +           file://2894.patch \
> +           file://2895.patch \
>  "
>
> -SRC_URI[sha256sum] =3D "3be7a911236567c1a9fbe25baf3e3167004ba4a0c151a448=
ef1f7fc077dba52f"
> +SRC_URI[sha256sum] =3D "d665fe7d0032881b1371a47f34169ee4edab67903b2cd2b4=
c083822823f4448a"
>
>  inherit systemd update-rc.d useradd cmake pkgconfig
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105128): https://lists.openembedded.org/g/openembedde=
d-devel/message/105128
> Mute This Topic: https://lists.openembedded.org/mt/101573484/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA13AE706F9
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 09:07:08 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.11765.1695287227788868172
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Sep 2023 02:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=j5b7sE5p;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.215.181, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-578b407045bso512437a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1695287226; x=1695892026; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/e5c1ttCP27alUaJ9J9gYGcY4EvUPu5hONm4GSaehg=;
        b=j5b7sE5pvOKy7S91U/Vhl4QVsztxTDXLDCXWKN6bZr8Q5oTkHyveeFKXS9dyPqqVTn
         aIIaKQss9JMlkIYRPNZuq79J1aqDSxZBbE6XHyN67XgYwA1DDZh9f53mfF56ZB/iqAUh
         Q4zoWZHDMGI0wsxkHOmfqGnZ4EpxCwX3fr7WW/lribfFNZzrrhGMjBtIxnbRLxdX6aYQ
         1iGNHG7cPi+59qztp8aBgW/GJPXH5Q8gQWW9zIT3OM8bqqsXBSNPucRGCrWQpDAgw/Tr
         fdPg+nzVLUSk92fAfr/V+YJzWMkkOWJfkdsYwD7Xg3ZghzQBf064tYUigDtA60KK61TL
         g83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695287226; x=1695892026;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/e5c1ttCP27alUaJ9J9gYGcY4EvUPu5hONm4GSaehg=;
        b=STTH7BzLgGEeWARdCVt3FQEyijBfPcZjleu5bpcjYI1ad3zvA7EpsM3/G7QY4G+Q4u
         F/sTtSg9sApEKuuCNPYbtAcZlnCg9WBmBij4DzN6f9xm/LqLLmC0QVyW6JZVRESj2x/Y
         owSrQsDeQhJFuYRrS8jbg1hGQRBLSkzk+HtnOi4elpAyS/l9f6jHCPMOA6x9wispqErj
         UoRy0cH6XrhkeuydQIf+1lHQs3ZikUBhclBiZz3l2+ZGgytfDqNlpL/Vknb84auWn5zd
         /Ni6+dSErCAOFd1jNejD+ZSLHgA3psnjp1kQQtqr6l8vyNC/Gg1BuEcpsiq9/DHd9T8A
         lENQ==
X-Gm-Message-State: AOJu0Yw/TpyxkiNlei6o+DFKYqfIvMHoNYv0b4cz7ei85Vzy/uK1KBw5
	LYuuXvVorqpB2sp+PAHvVgd+cE/fNuaJJhbrGZpW0/l78u4nXPU1DR/NoQJ6zmZT5O1FbJrM+gf
	tDktavMxzmB+SIc84KD149peE3HMwty7lisHuiR04pClUY2D1krJvCnb8+tv4IQ==
X-Google-Smtp-Source: AGHT+IEvURH7/KHfZRqdOUCmM+6HYDuO2GLcKP1TetONyVgUb39R8GuPudUdy4gJlXg5TMVKjvV7kJrh2uWe8d6qbns=
X-Received: by 2002:a05:6a20:3944:b0:12e:73bb:cbb6 with SMTP id
 r4-20020a056a20394400b0012e73bbcbb6mr5334100pzg.14.1695287226104; Thu, 21 Sep
 2023 02:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230921070508.103712-1-jonas.gorski@bisdn.de>
In-Reply-To: <20230921070508.103712-1-jonas.gorski@bisdn.de>
From: Jonas Gorski <jonas.gorski@bisdn.de>
Date: Thu, 21 Sep 2023 11:06:54 +0200
Message-ID: <CAJpXRYQNaDU_-P8eb-cS7gSjjxVqwpbS_U2NCipFU8wJO1N42Q@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] frr: upgrade 8.4.4 -> 9.0.1
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 09:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105039

Am Do., 21. Sept. 2023 um 09:05 Uhr schrieb Jonas Gorski
<jonas.gorski@bisdn.de>:
>
> Upgrade FRR to 9.0.1:
>
> * drop all existing patches since they are included in 9.0.1
> * add a patch fixing (harmless) error messages in log
> * license files moved to doc/licenses
> * protobuf-c-native (for protoc) and protobuf-c are now needed
>
> Changelogs:
> https://github.com/FRRouting/frr/releases/tag/frr-9.0.1
> https://github.com/FRRouting/frr/commit/31ed3dd753d62b5d8916998bc32814007=
e91364b
> https://github.com/FRRouting/frr/releases/tag/frr-9.0
> https://github.com/FRRouting/frr/commit/2863e7efbcd0cbfbd41d3be04c660d77d=
f65d0ea
>
> Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
> ---

(snip)

> diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb b/meta-ne=
tworking/recipes-protocols/frr/frr_9.0.1.bb
> similarity index 91%
> rename from meta-networking/recipes-protocols/frr/frr_8.4.4.bb
> rename to meta-networking/recipes-protocols/frr/frr_9.0.1.bb
> index 826b6878065c..b656d91a97c0 100644
> --- a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
> +++ b/meta-networking/recipes-protocols/frr/frr_9.0.1.bb
> @@ -6,18 +6,15 @@ HOMEPAGE =3D "https://frrouting.org/"
>  SECTION =3D "net"
>
>  LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> -                    file://COPYING-LGPLv2.1;md5=3D4fbd65380cdd2559510790=
08b364516c"
> +LIC_FILES_CHKSUM =3D "file://doc/licenses/GPL-2.0;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263 \
> +                    file://doc/licenses/LGPL-2.1;md5=3D4fbd65380cdd25595=
1079008b364516c"
>
> -SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=
=3Dstable/8.4 \
> +SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=
=3Dstable/9.0 \
>             file://frr.pam \
> -           file://0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not=
-py.patch \
> -           file://CVE-2023-3748.patch \
> -           file://CVE-2023-41358.patch \
> -           file://CVE-2023-41360.patch \
> +           file://0001-tools-make-quiet-actually-suppress-output.patch \

First I noticed I forgot to add Upstream-Status to this patch. Then I
noticed I didn't git add this patch at all m(.

Will send a v2.

Best Regards,
Jonas

--=20
BISDN GmbH
K=C3=B6rnerstra=C3=9Fe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=C2=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=C3=B6psel


Commercial register:=C2=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=C2=A0DE283257294



Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6C9CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:53:03 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16431.1781085174541955730
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZUbWdxJl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bebbc325000so854801966b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 02:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781085173; x=1781689973; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wXw6n8S04w8ooiVzPSLDhKa4jNtXnqz0jbZstBlfkjo=;
        b=ZUbWdxJl077WksuGPyL6gZMyh2J/tU3Ru3/S4Z1hO3w/3stAH53H4lOw+HYMAiqwZS
         ppOtVf7nICUSuMSvNyTJgmYQto5hrgR3aUJnKm5OUufd+S1DOug4pJmoJ4jG6tcLvn/U
         wnmE7rx6Sq6JWnXupo+Qco96bgJB6KR7uicpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781085173; x=1781689973;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXw6n8S04w8ooiVzPSLDhKa4jNtXnqz0jbZstBlfkjo=;
        b=PWHpVSSxbait7IuX/f79bvvnn6rwBdkoSsVk4NyPffgWXlx5wUDEN5p1BNobfZX6pb
         FzdGygBstZbILiu889ICR6WF5uMfC1KMIeTI4DOS8aJjd92P6YuditSJQxLqwcSSl/d1
         P1DIWdDEXhyJRNpRwnGcoL2EM9dNjHcFBYy/+UF7FfHA9U5AYUplDftVSsmU8IE+VI9O
         BFSYnUXPrM+8KsBVb4krZ18Sn2H2X6+TWXP8mlzdSgVNezUDPYI9/KQS1uDKp6m03aRq
         8oA99dMUgsEHsenNI+uObNlbd1CyGsQKNncjKNgKwDNJn5QWovq69ExSTQMnrn3k3dHF
         wQkg==
X-Forwarded-Encrypted: i=1; AFNElJ8OMUxvBdjs/YPDzgn+u3UaqJ362l4MLJZcox/rr0EOfR2/hgwwqk2uerlxsLvDSbPmu5iNnXkJLdV1SGCu5dXI8/g=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwIJoMqtWc7JQDRmdxujW6Q3A5/pTY8MFBWaGffCNhtNqZ6jlA5
	JnkbPBCuvVyVt4KpBRYjR+tjRFMW8CWmuNYVQHRpyNIuPRO1fUzDWoLEebpNmXtW010=
X-Gm-Gg: Acq92OHQci8nI3i/qzwm7CTqa/3TQKFR0hc2k8RV8FU1pz5X0t89g/efYRke3/6b3zK
	DNGwKLoJzERKM2LvJDw7cXV+AuX/WDBLcJ5nRbtBs2Ijo3Jw15DtE678lbs3T7YJD71PyCWGdnG
	LuOUJaR+MBYZ51AsqpIYyjwc45WpmcuBaTad/gKzVgHmvMqXSXfW4RNxQW2zw39tEx4Ta73O/YH
	UI06MCATcbdDpxnV5RKIm9puCL0DrBOSjIm1LRxjfMWwHfuAztNb7eaNoDyZ3/xt7t5XpR5+2Js
	PQpVEjO26K+brPQG1EtIxT5r0tVBxQNcHg9N0BOevDogohjmTlpI5rlyRzvjZvCGNMX6IoRhqMA
	Iq5W5KK4foPLd3+o7qngVivBe/E1kBgHdfyRCpOPPrfkYRoR81xHWYJm9q3isaMgeMjownMoZcv
	9gZ2WKDnJHzcS6Kv+l434S1lCSJSYvwTbN0exxenR9Cos3ITr/tm/e0+gd70UjOvzPVJ6K9SHs9
	+LL4BRD28XzjiPka2U+ggY7KkTt5XNcqbs=
X-Received: by 2002:a17:907:2d07:b0:bef:36f3:7277 with SMTP id a640c23a62f3a-bf3738f3532mr1268440966b.23.1781085172774;
        Wed, 10 Jun 2026 02:52:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e996:5a7:2609:813f? ([2001:8b0:aba:5f3c:e996:5a7:2609:813f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c72esm9354993a12.23.2026.06.10.02.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:52:52 -0700 (PDT)
Message-ID: <e036c6714991459d21fafd6993fa9495b6d92d9f.camel@linuxfoundation.org>
Subject: Re: [oe] [meta-networking][PATCH] python3-scapy: Replace
 oe.utils.all_distro_featuresc with bb.utils.contains
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:52:50 +0100
In-Reply-To: <20260609144855.1473568-1-khem.raj@oss.qualcomm.com>
References: <20260609144855.1473568-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 09:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127514

On Tue, 2026-06-09 at 07:48 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> oe.utils.all_distro_features is being removed.
>=20
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
> =C2=A0meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb | 2 =
+-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.=
bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
> index 678aec0135..fac14221c5 100644
> --- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
> +++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
> @@ -42,7 +42,7 @@ do_install_ptest() {
> =C2=A0=C2=A0=C2=A0=C2=A0 # note1: if ipv6 isn't enabled, skip the related=
 test (add '-K ipv6' argument)
> =C2=A0=C2=A0=C2=A0=C2=A0 # note2: to make this test work, your ISP also m=
ust support ipv6 - the test is trying
> =C2=A0=C2=A0=C2=A0=C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to p=
ing google.com through ipv6.
> -=C2=A0=C2=A0=C2=A0 if [ "${@oe.utils.all_distro_features(d, 'ipv6', 'tru=
e', 'false')}" =3D "false" ]; then
> +=C2=A0=C2=A0=C2=A0 if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6',=
 'true', 'false', d)}" =3D "false" ]; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i 's/UTscapy.py/UTs=
capy.py -K ipv6/g' ${D}${PTEST_PATH}/run-ptest
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0}

Thanks,  I was going to write that patch after your report but you beat me =
too it!

Cheers,

Richard


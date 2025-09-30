Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB4CCCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:42:09 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.21282.1759225321461040362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A8bjM11o;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-43f9eb204baso113995b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759225320; x=1759830120; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9aI81MqAzSAyHumFakv9XRbB6h/qe9l1yIMYAFI1Z4=;
        b=A8bjM11oA8lyWQRAyv/o9espiUV+k8rxMGws75zcjDUZvnpmAESkqheSdVABVI94aS
         xrJoD5rAtquPxcOLNg7XHnFb94yraiQ+0GCSpOROE4qZ83uhpWoaDs2nrc4LJTTi/Df3
         mproqb4wMsmn2PW5W6NIyo6JplZBnF1ypAVp6CdEF26tM9U4SEms00DbzWmJhfkRXyav
         ptooAf7U5FB7G7ZAYJwziGuNRJD2XlL2SETgq44RbqN/CkenttyjtcR2Vq2Grxf3mXL2
         3vQPXW3R3qdjr4RQcussP4cTFaNNyLSGnIE3eXNIerBrNDww5EBG5TMEm1QITsWAZxX8
         hCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759225320; x=1759830120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9aI81MqAzSAyHumFakv9XRbB6h/qe9l1yIMYAFI1Z4=;
        b=irDHMkm+qO0uBgQURak6o8mslJO6pKY/HYKkAcCkNzmMNa5+Qz+w8R4ThXisfzJZV7
         r0gXFTnKVIWMQNb7l23JNsPuujaV0N5jlkdDcBWtaWyIYyoMjRVMtLtPYX1YUGH+7Mr8
         IYlUcA8o026E9PcQ4zpepI0aA9C03ce6BWd6vM9OvsGMk3vsjhavHVfvMT7QVf/AsMDO
         lquLLHX1cAuGbdt1mhQXkyNlIfJ9u6FQciGghlM1uI2B/0vYA9T8por3h8piBBr6opQ5
         xS5GY8W/MEUTrLUMVYjmHywiglq8CPhV4rR8u2TLJfPFbVFEWYQHX6Yvi8+M5haUU4Vb
         UmtQ==
X-Gm-Message-State: AOJu0YyqWUK+4DA339E09sQma9uMRrVC8zt9Sa8JouuXN9NoLdseI+YE
	4lAhMQENjkkSO+gOxuZVFmGsf9A7CrBWlvXo6k8v9966T7/I/+OYOh1Q653W4FaFVIws8D1IABn
	ohCZgKXaDPPo3ZNS4Ic/rJ6loBmbIHzHlkVx4at0=
X-Gm-Gg: ASbGncu+zmWxJT6QPPVJLGbXDPBRioMKluX/855Riuz+uK2U476rUnlCd3WVxapxf6W
	CxnXloY0HN7CUl7qB4Mh2wq+jrYQb0IEU08O92V3Ydg9a7axUxWOsoetvMpQHZNEUjlXSGx7z92
	Reis/BYtQppv//dDPqUJMASdwiYoBsdG+bQG9H15TlMXfdb50BzD4JPbW+swj8pS9+arSw8B+WI
	YF7VaP1GKY02waR5hq3MEPxCXvrOWsE
X-Google-Smtp-Source: AGHT+IGuSSf1B8A0MYvabEXRkLUP4n3ttl8P8Jvl9ENAcPe+GsRXrWuMu18qFGjRIU2H/nUWmVVtCxPraclHJ/NDIsI=
X-Received: by 2002:a05:6808:2228:b0:43d:20d2:aee1 with SMTP id
 5614622812f47-43f93fe4818mr1544720b6e.12.1759225320510; Tue, 30 Sep 2025
 02:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250930061420.1018845-1-divya.chellam@windriver.com>
In-Reply-To: <20250930061420.1018845-1-divya.chellam@windriver.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 30 Sep 2025 22:41:49 +1300
X-Gm-Features: AS18NWDihAob4bXwCdpxQnbIv2QS1VDQXbNp_XCumxUZzBDg0d2CX4bt7rUKa50
Message-ID: <CADySD0G5urb78Wk4NUkt-1wUCHK8mXhqwYVZ_5fWdrGwZgAoGQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH 1/1] cjson: upgrade 1.7.18 -> 1.7.19
To: Divya.Chellam@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120076

Though new version has some more fixes but if intention was to provide
CVE fix only then we already have a pending patch
https://lists.openembedded.org/g/openembedded-devel/message/119628

On Tue, Sep 30, 2025 at 7:14=E2=80=AFPM dchellam via lists.openembedded.org
<Divya.Chellam=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Divya Chellam <divya.chellam@windriver.com>
>
> This includes CVE-fix for CVE-2025-57052
>
> Changelog:
> https://github.com/DaveGamble/cJSON/blob/master/CHANGELOG.md
>
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---
>  .../recipes-devtools/cjson/{cjson_1.7.18.bb =3D> cjson_1.7.19.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/cjson/{cjson_1.7.18.bb =3D> cjson_1.7.19=
.bb} (97%)
>
> diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/rec=
ipes-devtools/cjson/cjson_1.7.19.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> rename to meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
> index bdeab3055c..799eb119d6 100644
> --- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> +++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D218947f77e8cb8=
e2fa02918dc41c50d0"
>  SRC_URI =3D "git://github.com/DaveGamble/cJSON.git;branch=3Dmaster;proto=
col=3Dhttps \
>             file://run-ptest \
>           "
> -SRCREV =3D "acc76239bee01d8e9c858ae2cab296704e52d916"
> +SRCREV =3D "c859b25da02955fef659d658b8f324b5cde87be3"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120050): https://lists.openembedded.org/g/openembedde=
d-devel/message/120050
> Mute This Topic: https://lists.openembedded.org/mt/115509843/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


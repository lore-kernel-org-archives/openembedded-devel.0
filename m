Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6D9C282DE
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 17:13:45 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.18956.1741194818487720974
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 09:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Eec7HxDr;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bbb440520so41680845e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 09:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741194817; x=1741799617; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs1Z9Tmxtqved4wrydHNo8V6KfACfixSSVZ4Iw9PO6g=;
        b=Eec7HxDrTXszuTSf/Wy5pMwa8RbILCr6xgaRv6846RVeuM04lYG2M+QVCS60La8DJg
         U2icKxliXUU+GembL6hj1iHBcE06hj/Q7+ZvcM0/yJktCZ0Pcczj4KFVd2NB8DXGQpcO
         C7uCyTz+hGoK4zW8804s6RzH14EAcEvV1We6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741194817; x=1741799617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cs1Z9Tmxtqved4wrydHNo8V6KfACfixSSVZ4Iw9PO6g=;
        b=axi4FWrRwIYaDngDVXuuwXttWl2NNTyrjOUMy06UU3aD7z1vhSihEyKVB5m5KsrTgY
         RNtzwEWmbZclY7B7fYrag8cKVbnqZ/LVWUV9+F3AOY/+ICzKqFbv42y4PIqhHeRTuP5E
         g8IODfbtAJYlwJBKQ0uyDGeTSotx9BQc5WWI+y8KyMLo9noqkEhQIy7hHzhgWQ7sy/rM
         mMT5UV1yaVDeCBFO7fARRvClmg4+eactEWcu1GI/hT3Ol3JZZoaE1S4drSJWpTKKBOUj
         BAA+DmJ8VVubRxMPRug+/BgFSEnYVsGjA5ht/M4Sa03rVidjCiHvqb2fnn13kWECjT5D
         VtcQ==
X-Gm-Message-State: AOJu0YwflHv2yChzxGjr+cbhiGCe+kC0luJM+u7R760gu17ZrU8juE9P
	nZ8PtSiHiilvFBTNDVrsHcFh0YhtpJHHGm2sailH/wECnkmEYrWZBWo2xKY1IujbiK6CMUgrN+F
	FAKVRUfOvOFguxlmvzzXqPBHBWOdYBanHfC31GA==
X-Gm-Gg: ASbGncuiJzzWqupJ+v8QesUAk6miUVo/hb/r1jdrF5flC0wuBI09AUjeSyI0uvz+d6B
	0mDoSIsBkWQ2lXIatZhB3TkphdnzTAcYhKwhBI6UcJfPDfo8oXU0ASAjPv4/TsNB/EcHyIInqQy
	UgZA6Tof/G68DCjLvwNvljnSuJ60RY
X-Google-Smtp-Source: AGHT+IEXeEIaEUYs4W6JS0GtTx6SU2VlTh5OMg+YCHYSxQy8ZwzTkHEgOC5WqEkzj+1g+KEugoKADF+hMu7qSzIZW9A=
X-Received: by 2002:a5d:5f4b:0:b0:38d:dfb8:3679 with SMTP id
 ffacd0b85a97d-3911f740307mr3763829f8f.17.1741194816828; Wed, 05 Mar 2025
 09:13:36 -0800 (PST)
MIME-Version: 1.0
References: <20250305170435.3320386-1-sofiane.hamam@smile.fr>
In-Reply-To: <20250305170435.3320386-1-sofiane.hamam@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 5 Mar 2025 18:13:10 +0100
X-Gm-Features: AQ5f1JrhXFVIzNyaw4w0ATNLkvSUhELa161PX4m5o8-d4gDcA62ZbFsgpJzXMIE
Message-ID: <CAMSfU+7zrbNA4Nri5b0Hjc7gxKa_THyTBj4XeXS-13rCPH7Y2g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] Wolfssl: add ptest
To: sofiane.hamam@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 17:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115761

Hello,

Le mer. 5 mars 2025 =C3=A0 18:07, Sofiane HAMAM via lists.openembedded.org
<sofiane.hamam=3Dsmile.fr@lists.openembedded.org> a =C3=A9crit :
>
> Add ptest for Wolfssl package.
> Set IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-wolfssl to 700M
> enough to avoid a "No space left on device".
>
> BEGIN: /usr/lib/wolfssl/ptest
> Wolfssl ptest logs are stored in /tmp/wolfss_temp.qvuQ9h/ptest.log
> Test script returned: 0
> unit_test: Success for all configured tests.
> PASS: Wolfssl
> DURATION: 7
> END: /usr/lib/wolfssl/ptest
>
> Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>

Thank you Sofiane!
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

> ---
>  .../ptest-packagelists-meta-networking.inc    |  1 +
>  .../wolfssl/files/run-ptest                   | 24 +++++++++++++++++++
>  .../wolfssl/wolfssl_5.7.2.bb                  | 24 +++++++++++++++++--
>  .../images/meta-networking-image-ptest.bb     |  1 +
>  4 files changed, 48 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/ru=
n-ptest
>
> diff --git a/meta-networking/conf/include/ptest-packagelists-meta-network=
ing.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.i=
nc
> index 2197a06e7..113725882 100644
> --- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
> +++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
> @@ -19,6 +19,7 @@ PTESTS_FAST_META_NETWORKING =3D "\
>      openhpi \
>      squid \
>      tcpdump \
> +    wolfssl \
>  "
>
>  # firewalld currently hangs forever so disable it for now
> diff --git a/meta-networking/recipes-connectivity/wolfssl/files/run-ptest=
 b/meta-networking/recipes-connectivity/wolfssl/files/run-ptest
> new file mode 100644
> index 000000000..ff66f4ef6
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/wolfssl/files/run-ptest
> @@ -0,0 +1,24 @@
> +#!/bin/sh
> +
> +echo "############ Running Wolfssl Ptest ##########"
> +
> +log_file=3Dptest.log
> +temp_dir=3D$(mktemp -d /tmp/wolfss_temp.XXXXXX)
> +echo "Wolfssl ptest logs are stored in ${temp_dir}/${log_file}"
> +
> +./test/unit.test > "$temp_dir/$log_file" 2>&1
> +
> +echo "Test script returned: $?"
> +
> +MAGIC_SENTENCE=3D$(grep "unit_test: Success for all configured tests." $=
temp_dir/$log_file)
> +
> +if [ -n "$MAGIC_SENTENCE" ]; then
> +    echo "$MAGIC_SENTENCE"
> +    echo "PASS: Wolfssl"
> +else
> +    echo "#### Issue with at least one test !####"
> +    echo "FAIL: Wolfssl"
> +fi
> +NUM_FAILS=3D$(grep -c "Failed" $temp_dir/$log_file)
> +
> +exit $NUM_FAILS
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.b=
b b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
> index 009434d96..b7ff23e71 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
> @@ -12,14 +12,34 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69=
f5fce4486a80fdaf4a4263"
>  PROVIDES +=3D "cyassl"
>  RPROVIDES:${PN} =3D "cyassl"
>
> -SRC_URI =3D "git://github.com/wolfSSL/wolfssl.git;protocol=3Dhttps;branc=
h=3Dmaster"
> +SRC_URI =3D " \
> +    git://github.com/wolfSSL/wolfssl.git;protocol=3Dhttps;branch=3Dmaste=
r \
> +    file://run-ptest \
> +"
> +
>  SRCREV =3D "00e42151ca061463ba6a95adb2290f678cbca472"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools
> +inherit autotools ptest
>
>  PACKAGECONFIG ?=3D "reproducible-build"
>
>  PACKAGECONFIG[reproducible-build] =3D "--enable-reproducible-build,--dis=
able-reproducible-build,"
>  BBCLASSEXTEND +=3D "native nativesdk"
> +
> +RDEPENDS:${PN}-ptest +=3D " bash"
> +
> +do_install_ptest() {
> +    # Prevent QA Error "package contains reference to TMPDIR [buildpaths=
]" for unit.test script
> +    # Replace the occurences of ${B}/src with '${PTEST_PATH}'
> +    sed -i 's|${B}/src|${PTEST_PATH}|g' ${B}/tests/unit.test
> +
> +    install -d ${D}${PTEST_PATH}/test
> +
> +    # create an empty folder examples, needed in wolfssl's tests/api.c t=
o "Test loading path with no files"
> +    install -d ${D}${PTEST_PATH}/examples
> +    cp -rf ${B}/tests/. ${D}${PTEST_PATH}/test
> +    cp -rf ${S}/certs  ${D}${PTEST_PATH}
> +    cp -rf ${S}/tests  ${D}${PTEST_PATH}
> +}
> diff --git a/meta-networking/recipes-core/images/meta-networking-image-pt=
est.bb b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
> index 295da982e..b6238d610 100644
> --- a/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
> +++ b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
> @@ -20,6 +20,7 @@ BBCLASSEXTEND =3D "${@' '.join(['mcextend:'+x for x in =
d.getVar('PTESTS_META_NETWO
>  # box) and explicitly add up to 1500MB.
>  IMAGE_OVERHEAD_FACTOR =3D "1.0"
>  IMAGE_ROOTFS_EXTRA_SPACE =3D "324288"
> +IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-wolfssl =3D "714288"
>  # If a particular ptest needs more space, it can be customized:
>  #IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-<pn> =3D "1024288"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115760): https://lists.openembedded.org/g/openembedde=
d-devel/message/115760
> Mute This Topic: https://lists.openembedded.org/mt/111531871/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [y=
oann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal


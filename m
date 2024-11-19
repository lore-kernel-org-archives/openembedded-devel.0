Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771F7D6C29E
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 21:17:42 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.33005.1732051059686435127
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 13:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ERDYm3Qu;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7181eb9ad46so838400a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 13:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732051059; x=1732655859; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFtpReqZHOieGNfY2Ryk0/Fzhm0lMHReNqRcXU+d33s=;
        b=ERDYm3QuQm+L6YZQrC1vr6T+pfH4vgpcArwpI/N0sCTPHu9FqNgfk3XqCi4CkmCLuA
         Khgj9/U159C3od8RIacxD59KYSr77dTAEchxE0sTfym6HNC9VVV+LVNe0Ao3s6nGIUe5
         YQA1mShuCgTGoAx+VZktNy+6+SuEZ2ANLCvah8vK/G0wPuAn/2J6ykcgnIKF4lpC5ZDA
         A1UJOWFSKxPEEOZCPDZmLIIGUBfF/gsw3rE0tD4UlMWi56BEaiC/pvb+j/hE/1WPwNV9
         9ZzSyTiZgFYBED2YgiG0a82ANXPCWa1AdeX/Ajdo7OaqqD0D+bFciz3PVykvyoh+Pu44
         4qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732051059; x=1732655859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFtpReqZHOieGNfY2Ryk0/Fzhm0lMHReNqRcXU+d33s=;
        b=sxLr6rxpJDcS41uUVW0OIot2GsJZaAeUW7xtvUtdC0mGfl+Bq9huisvW9tjqcQ42wD
         olrEGi02v7TGksFGMGeDyMfeY1+u5RipfpyTHMa5dmAbDefR5I8qzIYQGQ34wRVdNKby
         2BHXAqnhby6aXSwhRZ2b0EIu1abrm1jH62hgTdIhhBZMqAlmdKHCU5tZQgUtZrxtWIb3
         GL/uCQH1978Yjv8lkli+rUQqaJ/8SQ3rJyFQcAfo5+uH7LzsNnYhKDMEW4/nFDXjlCup
         ywLVTJDO/dtPAgP9goKtI34hcuaCorddM9dTgd1XuDx172PuXNVfWTEjCD7ZgA4oM4Tw
         amKQ==
X-Gm-Message-State: AOJu0YwmtD/JWiYC3aFSBPoAZ8WDJw0pjrXlGXsVwSkCP92LDVfhmPmW
	YA8dija1MxI/W0yokGZgRZSn60IzZHhNSwPY/+IXZ7il1Qcg+9JNpULS+5I8Un08hJ+byzX8XzH
	rOex0xjcAQGzFil/XLo7vtM44iRyxRg==
X-Google-Smtp-Source: AGHT+IG8234/0KB5MUdq6BAXqspOz10QaYvm/xQVaWpoxuGEY5P1/BQGcLvYSzQnSY8CjjmOhggOuIYIuNP7b400p6Q=
X-Received: by 2002:a05:6830:84b:b0:716:a571:d3ab with SMTP id
 46e09a7af769-71ab31faca6mr362154a34.21.1732051058920; Tue, 19 Nov 2024
 13:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20241112165106.2273168-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20241112165106.2273168-1-peng.zhang1.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2024 13:17:13 -0800
Message-ID: <CAMKF1srLOCMrSqmGbtWfymw8JTFHnyUZk5EsR+ECBdbVBiF5og@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v5] parallel: Add recipe for GNU Parallel
To: peng.zhang1.cn@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 21:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113918

I have taken v3, please send the delta between v3 and v5 as a separate
patch please.

On Tue, Nov 12, 2024 at 8:51=E2=80=AFAM Zhang, Peng (Paul) (CN) via
lists.openembedded.org
<peng.zhang1.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> This recipe adds the parallel package, a shell tool for executing jobs
> in parallel using one or more computers.
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  .../parallel/parallel_20241022.bb             | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/parallel/parallel_20241022.b=
b
>
> diff --git a/meta-oe/recipes-extended/parallel/parallel_20241022.bb b/met=
a-oe/recipes-extended/parallel/parallel_20241022.bb
> new file mode 100644
> index 000000000..30ff9182e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "GNU Parallel - A shell tool for executing jobs in parallel =
using one or more computers"
> +DESCRIPTION =3D "GNU Parallel is a command-line tool for executing jobs =
in parallel on one or more computers. \
> +It allows users to run multiple commands simultaneously, making it easie=
r to process large batches of tasks."
> +
> +HOMEPAGE =3D "https://www.gnu.org/software/parallel/"
> +LICENSE =3D "CC-BY-SA-4.0 & GFDL-1.3-or-later & GPL-3.0-or-later"
> +
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb248a4f03e89ea=
4b8 \
> +    file://LICENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62dc8a2e50b1d45=
0fea66b7 \
> +    file://LICENSES/GPL-3.0-or-later.txt;md5=3D8da5784ab1c72e63ac74971f8=
8658166 \
> +"
> +
> +SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
> +SRC_URI[sha256sum] =3D "6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420939=
ba937925c0a57a12"
> +
> +inherit autotools bash-completion
> +
> +PACKAGES +=3D "${PN}-zsh-completion"
> +FILES:${PN}-zsh-completion =3D "${datadir}/zsh"
> +
> +RDEPENDS:${PN} =3D " \
> +    perl \
> +    perl-module-file-basename \
> +    perl-module-file-glob \
> +    perl-module-file-path \
> +    perl-module-file-temp \
> +    perl-module-filehandle \
> +    perl-module-getopt-long \
> +    perl-module-io-select \
> +    perl-module-ipc-open3 \
> +    perl-module-posix \
> +    perl-module-symbol \
> +    perl-module-thread-queue \
> +    perl-module-threads \
> +    perl-module-threads-shared \
> +"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113795): https://lists.openembedded.org/g/openembedde=
d-devel/message/113795
> Mute This Topic: https://lists.openembedded.org/mt/109538400/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A203C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 18:31:06 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.1276.1699727463267143523
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 10:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FAQjxRQU;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1e9a757e04eso2157393fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 10:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699727462; x=1700332262; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06FuvKew5Clb2rZiyrGBLnTZqjKVYWE/biv7R/09YcY=;
        b=FAQjxRQUdhx/eNvh/o3PO0IK6+TbUcTHrWEgGZPhMvb6CHnkG4Lx+x1AMzW4YSbzPg
         t68Zd92N0xjC7hcpFvqo708VbVk3ptLExAKIvW/xSW4LRDbVLIEnNvnFy6IuOaCGHsJG
         Tzu/VZ6I6GhXp/HtvS2+OpiFjYur8cySYnhNPGu4VebWf25rWb4CiTDqovs8CIBYMIm/
         QlvZ17Cz92YjV2Qv9aMYYKs/fs2c1tLhIFt56MCz7tu5urgq4nmrOXee32MHKjNQllYv
         ubmVvCQWYgj6uftz/adgjNeM+6IKxMqHTvAIH2xaE3c4ALVTd7S7FOAVL/FABGx/T1b4
         lOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699727462; x=1700332262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06FuvKew5Clb2rZiyrGBLnTZqjKVYWE/biv7R/09YcY=;
        b=Pln5tLwRxQa+tO6/4bejhFSChB2QQ6CoVVgcuKpCu6H04WTGtr8GPhFFi3u4h5UkJk
         YQ2PgZpWtQfGGDAyx1+ZMaJ+kCG6Jekairdd3PG3xRY1uAdwC3Y8eqwAAlqzk38SrRFu
         kA6TqaOzslJPlWl8Bii2gFtTxvXQ6Nzlxe8dx79GKNeCqUWzE2SvSYZ6Y7hqhy2eXWoV
         HQPZm1CvkeuTvQf8g2zp55dHD+TLRTcyG8lNsrgVwEocGZxk42xxcJV62eeb8OCTiXMM
         jx/52scc8fAfLfCyuNVGMoE2W20k27wjr56wxu7lvJsBPc47Tx3UfQ1DIJMwGMVXMGul
         gaAw==
X-Gm-Message-State: AOJu0YzMAKMjTVIzZ37anoYhweNs8liQHo2DBf/VcfsnEyk8S3omVvDm
	dZbOhFk9oKldH6yF/EyA54LJFAY+hSaeasecMNo=
X-Google-Smtp-Source: AGHT+IFZTRtM9CcGDV/Mv90IzLnLRU37vTN6Qhb6Ole0grbjVpmBSyvYxPXCbeEKaLq3YSloRMgEcqG+s4ctTN7wZ24=
X-Received: by 2002:a05:6870:cb82:b0:1e9:e364:fad3 with SMTP id
 ov2-20020a056870cb8200b001e9e364fad3mr3186002oab.4.1699727462419; Sat, 11 Nov
 2023 10:31:02 -0800 (PST)
MIME-Version: 1.0
References: <20231015183007.385143-1-jan.claussen10@web.de> <F8BE072F-A616-447C-8AAF-DB9E1D08D13B@getmailspring.com>
In-Reply-To: <F8BE072F-A616-447C-8AAF-DB9E1D08D13B@getmailspring.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Nov 2023 10:30:36 -0800
Message-ID: <CAMKF1spgAw3VRxGECeyk3hbNM3yx1CZVGz4VNZOb+iiOWw9=2A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 18:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106560

Thanks for your contribution Jan

On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@w=
eb.de> wrote:
>
> ---
> meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 +++++++++++++++++++++
> 1 file changed, 23 insertions(+)
> create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb
>
> diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipe=
s-support/btop/btop_1.2.13.bb
> new file mode 100644
> index 000000000..f780a993a
> --- /dev/null
> +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Resource monitor that shows usage and stats for processor, =
memory, disks, network and processes."
> +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> +SECTION =3D "console/utils"
> +
> +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;bra=
nch=3Dmain"
> +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +FILES:${PN} +=3D " \
> + /usr/share/icons \

Lets use ${datadir} instead of hardcoded /usr/share

> + /usr/share/icons/hicolor \
> + /usr/share/icons/hicolor/48x48 \
> + /usr/share/icons/hicolor/scalable \
> + /usr/share/icons/hicolor/48x48/apps \
> + /usr/share/icons/hicolor/48x48/apps/btop.png \
> + /usr/share/icons/hicolor/scalable/apps \
> + /usr/share/icons/hicolor/scalable/apps/btop.svg \
> +"
> --
> 2.42.0
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106559): https://lists.openembedded.org/g/openembedde=
d-devel/message/106559
> Mute This Topic: https://lists.openembedded.org/mt/102530478/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05A2E7719A
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 23:33:35 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.7216.1736465610593451727
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 15:33:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VTXT1w7G;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-27d0e994ae3so610412fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 15:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736465610; x=1737070410; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jPYL8sjXtmOEFjxulYFVIgHw6j8fc7ROPwQuw0hMQo=;
        b=VTXT1w7GjEM8UME6i+a58yiXlmFoSu6cDtkrYfPQwHh3rUp8me9KTRVJrNuCNvJHWW
         9Jg5Cfie0AW2wk0+w366Khi6GqP93u1XvpdftsbWR/z7QvzAupRbwRrCy+LR24N/LPrz
         B/EQpyDtPNzpqtHIueHww4+78dQ28OQ8JZ03B1f60WyBZPX39Pk17rcCDfaWfRC5Sv/T
         DwGte0MvscWvfkGVlv6TyTWdu8uP8L7dgptfyzNBzkpWOsbS62JaTNCm3IOa05Ibteeg
         wZUGgDFaag2BghL6ZjvzF45+REAplJT1HcE0SXYdN5NBn3LUm13mynA6icEa5lCRUCZa
         fB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736465610; x=1737070410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jPYL8sjXtmOEFjxulYFVIgHw6j8fc7ROPwQuw0hMQo=;
        b=joahXTbweXOriZXNYpV8gll9HoPPeYvM9G1aNbn+hvqQggozyb43lrwcieOotQYzaQ
         diEqbWVBYsxcKtoieV133dI3yMYJKR/tIfHuwIAfJ9SqkWd1nJzG0/gaX6/32yq2CTOz
         ZhFb55At7ccOWsYSRRZPpA0+vGItLfKzNGiPar/EbXEOHD46MS4AMthrVPX4tEwfVUyC
         yekYkO+xZHmo6hRkoREjYPspUMRhv4RKbAHag+weDv248JXTIcxdd8/Nlbcn+UEnKHmJ
         KXpd9YgL0p9RT/EHTO4ebDn22KeBUwdYSTCIkavmoMBQy3mseuFZbvIVoLVSzjTYIMK8
         u1kw==
X-Gm-Message-State: AOJu0Yx9Lf+j5AO4pXSJTnCZLRhnxWgIW2q8WEbFRzBOLl793ZF+Xs4w
	df43oPkPQwe1DqCeoLgfLy2gwL3Fi4/SsxonhNpDjoLRtpdvuFfzMB8IZTx/soitKrl1EFPfJd/
	dl2LTJcSO88iXmOvrTP82ZZ0xg+AAxA==
X-Gm-Gg: ASbGncv6IFps/WJrmuZQBTBMJW7HJeV8rVEZJvB5oh6MQfuUMH7F6fDl71EbSFnLMVg
	CbnBhAkiPXc9q1dFJMX8x+YIlQIFRWzu6m7WbuOy/uhuTl8g7jj6p
X-Google-Smtp-Source: AGHT+IGOiQiBwxYd/ET/XUBJsXx904TwYBjEyztZ38p6h2kIiYHkm5tcAeLCO2uuUaAl2SpDQR4O1XXlKD07XGFJqbE=
X-Received: by 2002:a05:6870:ce91:b0:29e:19ee:4832 with SMTP id
 586e51a60fabf-2aa066fbbeamr4352891fac.18.1736465609864; Thu, 09 Jan 2025
 15:33:29 -0800 (PST)
MIME-Version: 1.0
References: <ac413271-b152-499b-94f4-e04fab4ae9be@gmail.com>
In-Reply-To: <ac413271-b152-499b-94f4-e04fab4ae9be@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Jan 2025 15:33:03 -0800
X-Gm-Features: AbW1kvYuxE7LM3aRC0i2PskCglp8nLQhh7fKjjk7v3gq1TJUI-WHcqkMQZjgXSM
Message-ID: <CAMKF1spSecEje5N8sFheiVNcrh1Dvgh_Mx4u5v7=9fhGMe4N+w@mail.gmail.com>
Subject: Re: kirkstone merge request: Jan 9th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 23:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114763

merged thanks Armin.

On Thu, Jan 9, 2025 at 5:05=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 7b3fdcdfaab2fc964bbf9eec2cce4e03001fa8=
cf:
>
>    libgsf: Upgrade 1.14.49 -> 1.14.53 (2024-12-08 15:04:56 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 66ec16850573a7ec69248b81f9904cdfba79b930:
>
>    packagegroup-meta-multimedia: Remove library only packages from rdeps
> (2025-01-01 09:13:52 -0500)
>
> ----------------------------------------------------------------
> Colin McAllister (1):
>        lldpd: Fix CVE-2023-41910
>
> Fabrice Aeschbacher (1):
>        mosquitto: upgrade 2.0.18 -> 2.0.19
>
> Khem Raj (2):
>        nspr: Fix build with clang16
>        packagegroup-meta-multimedia: Remove library only packages from rd=
eps
>
> Mingli Yu (1):
>        asio: Add ptest support
>
> Peter Marko (2):
>        hostapd: Patch CVE-2024-3596
>        hostapd: Patch security advisory 2024-2
>
> Soumya Sambu (2):
>        python3-werkzeug: Fix CVE-2024-34069
>        python3-werkzeug: Fix CVE-2024-49767
>
> Vijay Anusuri (1):
>        php: upgrade 8.1.30 -> 8.1.31
>
> Wang Mingyu (1):
>        mosquitto: upgrade 2.0.19 -> 2.0.20
>
> Yogita Urade (1):
>        postgresql: upgrade 14.13 -> 14.14
>
>   .../packagegroups/packagegroup-meta-multimedia.bb               | 34
> +-----
>   meta-networking/recipes-connectivity/mosquitto/files/1571.patch | 22 --=
--
>   meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 25 --=
---
>   .../mosquitto/{mosquitto_2.0.18.bb =3D> mosquitto_2.0.20.bb} |   4 +-
>   .../recipes-daemons/lldpd/files/CVE-2023-41910.patch            | 26 ++=
+++
>   meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb            | 1 +
>   ...1-SAE-Check-for-invalid-Rejected-Groups-element-length.patch | 52
> +++++++++
>   ...3-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch | 38
> +++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch | 82
> ++++++++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch | 165
> ++++++++++++++++++++++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch | 62
> +++++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch | 52
> +++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch | 51
> +++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch | 46
> ++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch | 105
> ++++++++++++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch | 47
> ++++++++
>   meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb            | 10 ++
>   .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 7 +-
>   .../postgresql/{postgresql_14.13.bb =3D> postgresql_14.14.bb} |   2 +-
>   meta-oe/recipes-devtools/php/{php_8.1.30.bb =3D> php_8.1.31.bb} |   2 +=
-
>   .../asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch   | 45
> ++++++++
>   meta-oe/recipes-support/asio/asio/run-ptest                     | 19 ++=
++
>   meta-oe/recipes-support/asio/asio_1.20.0.bb                     | 21 ++=
+-
>   .../nspr/0001-Fix-Wincompatible-function-pointer-types.patch    | 39
> +++++++
>   meta-oe/recipes-support/nspr/nspr_4.29.bb                       | 1 +
>   .../python/python3-werkzeug/CVE-2024-34069-0001.patch           | 149
> +++++++++++++++++++++++++
>   .../python/python3-werkzeug/CVE-2024-34069-0002.patch           | 120
> ++++++++++++++++++++
>   .../python/python3-werkzeug/CVE-2024-49767.patch                | 87
> +++++++++++++++
>   meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb   | 5 +-
>   29 files changed, 1227 insertions(+), 92 deletions(-)
>   delete mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/1571.patch
>   delete mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>   rename
> meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.18.bb =3D>
> mosquitto_2.0.20.bb} (95%)
>   create mode 100644
> meta-networking/recipes-daemons/lldpd/files/CVE-2023-41910.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/0001-SAE-Check-for-invalid-R=
ejected-Groups-element-length.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/0003-SAE-Reject-invalid-Reje=
cted-Groups-element-in-the-pa.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_14.13.bb =3D>
> postgresql_14.14.bb} (84%)
>   rename meta-oe/recipes-devtools/php/{php_8.1.30.bb =3D> php_8.1.31.bb} =
(99%)
>   create mode 100644
> meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.c=
pp.patch
>   create mode 100644 meta-oe/recipes-support/asio/asio/run-ptest
>   create mode 100644
> meta-oe/recipes-support/nspr/nspr/0001-Fix-Wincompatible-function-pointer=
-types.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0001.=
patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-34069-0002.=
patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-werkzeug/CVE-2024-49767.patch
>


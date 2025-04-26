Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B3FC369C2
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 00:32:37 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.1421.1745627554814618650
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 17:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ORiV7Kz1;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3fe83c8cbdbso964876b6e.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 17:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745627554; x=1746232354; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D49c0elY25Nmvz5AqRpWAyV9vSSdoWgAAj0F4Ls6upI=;
        b=ORiV7Kz11FD2KIyQbzC2AIAAEXw74SiN0kotwQesSGKZEBJrQTD3ZicnAXi5rhkAl4
         cIjxctGHaW6usgnlulSu9SfMpru41CRTijxKZxqAbjEv4cMjrzTRJpl0JkdpJjD4GOkc
         1hX3GT0sNur43peyN9p8L+S0Kat66lpgqbRXgBdtZXtxmBxgj6Vqr48LVpDh35xrBbBv
         PuBcvP6EiF3SSNVtBWw8Eg45HcPnUZ56tYainOnbcWNLYUTM00hmtpDlJqoy9TWbhqLl
         5eFlkY5U/aTo2zg8cA8jWohW52dY79iel6krAfRjWHwZ1lBTJk3WtWrw5ubRgMegruAO
         AaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745627554; x=1746232354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D49c0elY25Nmvz5AqRpWAyV9vSSdoWgAAj0F4Ls6upI=;
        b=agtZF+SF1L4k/wikbDC7fzbpqkGUBIKm4T9GKkqvrxE/0/e6l1KcKCMXUFxzeBt3bX
         Tr0qMGzhXeccmniGN12MKf4bzCdRJi2KlxFEAQ2XWICdGrUaJCG5xIQnZTpPNLt3JUbv
         tfs9kpSna4dPQCCqzVvR1qcayVSOoy9yEsaCcqL+zFuNNyzXNOCmWnD/NR7V4dnjgG6L
         K9FIIgvpeBi1QFT8gP6/Cql7j34k4FFyBJ84frhBrbPaawh/COAhUnsSBX6WRS+dzIZ/
         Lj5EjPEjHVRVqO1wcmV+yt0qeoQU03PtOpc3TFzDnIW1rtsRTrSjaG+T32dcNCUGl1Dt
         oOIg==
X-Gm-Message-State: AOJu0Yw8HQbtoTOqyfl4QNPLnUyXTAox1yoVsh20XlfrTYcdoQWD1YiD
	JPloqrdYhIdqQJeXbVvwpN4P92jM+IgIf/LWsIOXhx6je524j+Xigi+7g7e57cE00A+lCtdTvLU
	/bhMTM2uI3vIJeriioUJ1xlnCtcI=
X-Gm-Gg: ASbGncv7SM6NLpJs0MWrIiuOUTPR3sYxiFh+WCgxrABcBO63SQO/cjnUkeF/4cnajC5
	QgsJCJwOpTCObwNYtNcwMMc5sLCYuebIWTNxIhVGz0VWWML+j1SsAlFe+MamR6D24qI41Wo01VV
	hjaG9TOW95wS5ccC7I4n/ShMeScL+ZgWPi
X-Google-Smtp-Source: AGHT+IGlfuKgwA1Perwjq2ckAr7uMl/Sl4SQSa7g7B2fsRZyK6jDbxRNCNj91InufC2M/Nc9XtYYzr7/DEeT18nCZjk=
X-Received: by 2002:a05:6820:3102:b0:606:449a:4093 with SMTP id
 006d021491bc7-60658d7218amr1075340eaf.0.1745627554032; Fri, 25 Apr 2025
 17:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <a10ba3db-e9cb-4d3c-8616-0ce14f7ba206@gmail.com>
In-Reply-To: <a10ba3db-e9cb-4d3c-8616-0ce14f7ba206@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 17:32:08 -0700
X-Gm-Features: ATxdqUGxdXX8U8SdxOn3r6KCBeVhUmzfw41Jmow8yEPCWo9IIxp-4n1pQlmkQX0
Message-ID: <CAMKF1soLWFECxR1=Oa_dDucPHjDZ34uFaJO0V3idYEJfNcwXMQ@mail.gmail.com>
Subject: Re: kirkstone merge request: April 25th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 00:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117139

applied
thanks Armin.

On Fri, Apr 25, 2025 at 5:22=E2=80=AFPM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit f8dddbfcbfe502cb71375a7a907e61a92e8d44=
74:
>
>    openvpn: renew the sample keys (2025-03-29 14:24:38 -0400)
>
> are available in the Git repository at:
>
>    git://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to e42549cef364ae09b3b7c8b64bbeab32e50f1bb0:
>
>    net-snmp: fix memory leak (2025-04-20 13:43:55 -0400)
>
> ----------------------------------------------------------------
> Haixiao Yan (1):
>        lmsensors: Clean stale files for sensord to avoid incorrect GCC
> header dependencies
>
> Jiaying Song (1):
>        corosync: fix CVE-2025-30472
>
> Jinfeng Wang (2):
>        netplan: Fix CVE-2022-4968
>        net-snmp: fix memory leak
>
>   .../recipes-connectivity/netplan/netplan/CVE-2022-4968.patch    | 442
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-connectivity/netplan/netplan_0.104.bb   | 1 +
>   .../corosync/0001-totemsrp-Check-size-of-orf_token-msg.patch    | 74 ++=
+++
>   meta-networking/recipes-extended/corosync/corosync_3.0.3.bb     | 1 +
>   ...0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch | 32 ++
>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb    | 1 +
>   meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb               | 5 +-
>   7 files changed, 555 insertions(+), 1 deletion(-)
>   create mode 100644
> meta-networking/recipes-connectivity/netplan/netplan/CVE-2022-4968.patch
>   create mode 100644
> meta-networking/recipes-extended/corosync/corosync/0001-totemsrp-Check-si=
ze-of-orf_token-msg.patch
>   create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-=
fix-memory-leak-by-freeing-tclist.patch
>


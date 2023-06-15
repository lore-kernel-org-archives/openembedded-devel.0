Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045CFEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:51:12 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.20534.1686840666472800448
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 07:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AtUtCBDB;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-39c77cf32deso619025b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 07:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686840666; x=1689432666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcGhHsjDu/rfyKNCX5eHa0ySEYmFNs1cdfvN2Xlwmug=;
        b=AtUtCBDB9QAsIjnRnTTBUul4gL7iYU9/gO0QCEkiV5CH9Z6FAsMpj3LjEi66UhBm8z
         8Zq34zKNha+FzqH/7l7D7qouMLRfq4/ue+bEAEwb1qaq1j5jp3h2NALzjcjwwbVYr3/r
         fFoVUoUXw/hcYeW12ySBSLAd30zUOQu3UmQGwjpsNJSkqZXwOJ+EJZhwiC6LrSKDZWi2
         ukX3u9PU4kEJ39hI+Ee+rzVYx/htOXZT/jmfPoPQFn3Jt10gB84YMVXto1uPx2OuN1d5
         i42f4e8cE97jskeMPVVaPUWglKRfUEcRq53tDLavKpweKa5vt1gzsN10XzY8FbpSRSOW
         kcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686840666; x=1689432666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcGhHsjDu/rfyKNCX5eHa0ySEYmFNs1cdfvN2Xlwmug=;
        b=dTETobJgQZHydLCYzv3WSgJbLnuEmrtBCRZiXZglpw571nzJgNTRv9XQS3CrZh1A5L
         PK4pbIfwdSatLjbEeCCQhWic3AyIaIpx55lnOEC3muQciigwhNnIaVEKWmbd2YVnE9UV
         i6R6noGQ5EVYp8vwMml8HrJpewzhS0YJNjpYKWZ5+7T9q7vVP2NOYZ/HxrItfxxGfq/E
         RN5Mjv5iU3ZPZR4aJOWSZT63QtiyBzwAeykxkciWWbBwQluOlpx90Y/amWYqm3kgxlXA
         RBRvHi+CDxyyfcdG9CVzTP1WtEyt5tnMaRbWcE5L42CJc6aXr3sp+8abBrbTWfuQGiWU
         wvIw==
X-Gm-Message-State: AC+VfDzOVHJYBZf20c5IHcQeXWdDYYhp08QqiHe1LHAnXszTYmUFKhEy
	NlMN6cSHUIeF7ZYZ7z/gCTfkfPIkKRyNhcKP67/ZUxGu
X-Google-Smtp-Source: ACHHUZ4LT+maiTlCRH+Ja/6BW21fsS8a3uwaFYQUPoXdK0afF+BlnMvtmkWaxMJ4+Kv+xGe7MEKmsCzeOUa/27yFPGA=
X-Received: by 2002:aca:b587:0:b0:394:4a66:a89 with SMTP id
 e129-20020acab587000000b003944a660a89mr3299270oif.1.1686840665497; Thu, 15
 Jun 2023 07:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <c60a8966-4494-3a82-e4d9-efd8827a9b30@gmail.com>
In-Reply-To: <c60a8966-4494-3a82-e4d9-efd8827a9b30@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jun 2023 07:50:39 -0700
Message-ID: <CAMKF1srXcq4DXT5+8M0cGXO7m5QtuGq1=fcc__N8kXmWZXaf1A@mail.gmail.com>
Subject: Re: kirkstone merge request: June 15th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 14:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103308

applied Thanks Armin

On Thu, Jun 15, 2023 at 4:53=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit f95484417e3d3e65ca15b460ba71dfd35773f0=
e4:
>
>    python3-m2crypto: fix for CVE-2020-25657 (2023-06-03 07:55:37 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to bdad2a789e30703a825b876279665720d06d55dc:
>
>    python3-werkzeug: fix for CVE-2023-23934 (2023-06-11 11:43:33 -0400)
>
> ----------------------------------------------------------------
> Hitendra Prajapati (3):
>        wireshark: CVE-2023-2855 Candump log file parser crash
>        wireshark: CVE-2023-2856 VMS TCPIPtrace file parser crash
>        wireshark: Fix CVE-2023-2858 & CVE-2023-2879
>
> Narpat Mali (1):
>        python3-werkzeug: fix for CVE-2023-23934
>
> schitrod=3Dcisco.com@lists.openembedded.org (1):
>        gnulib: Update recipe name to 2018-12-18
>
> vkumbhar (1):
>        c-ares: fix CVEs CVE-2023-32067 and CVE-2023-31130
>
>   .../recipes-support/wireshark/files/CVE-2023-2855.patch         | 108
> +++++++++
>   .../recipes-support/wireshark/files/CVE-2023-2856.patch         | 69
> ++++++
>   .../recipes-support/wireshark/files/CVE-2023-2858.patch         | 95
> ++++++++
>   .../recipes-support/wireshark/files/CVE-2023-2879.patch         | 37 ++=
++
>   meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 4 +
>   meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31130.patch      | 328
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch      | 85
> +++++++
>   meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 2 +
>   .../gnulib/{gnulib_2018-03-07.03.bb =3D> gnulib_2018-12-18.bb} |   0
>   .../python/python3-werkzeug/CVE-2023-23934.patch                | 116
> ++++++++++
>   meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb   | 3 +-
>   11 files changed, 846 insertions(+), 1 deletion(-)
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2879.patch
>   create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/CVE-2023-31130.patch
>   create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
>   rename meta-oe/recipes-support/gnulib/{gnulib_2018-03-07.03.bb =3D>
> gnulib_2018-12-18.bb} (100%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0677C4321E
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 17:33:47 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.133441.1670175223751073073
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Dec 2022 09:33:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n8onf470;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id r11so4924230oie.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Dec 2022 09:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Za42h7rK3TIeJx6MMuXMIj1o5N/X/tzoFEGiJRz/e24=;
        b=n8onf470jrGrnRNvzzn26+3DIarjEenWmOUp4Af0q3DC08znfVtzjLTbsvAnDgOUnn
         gZtnhJ9cqUvpjZdirX7XIEx1SLCdbymJxX1+0GZQhCjOzV06nW9IEXpPjQobD8IhFCrp
         FWKktSLipC5Mn6ZCsEOmdB6eKDsyGqQRttzfxz+iocNMlbFwvkTY2oUsQKq9iXUWBe/5
         /GCAor5CYAQDnvNrqJKhtqa8Z6lrFkmfeSLSC52FzG0W4tyKL058jrxAuGQi9KXuNo4N
         YhhTKyFrAOhhbimGr++1wK+aofwwRVy7jssjpC03OhhweFPY8wrVe0m06veHxVJic2d9
         Si7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Za42h7rK3TIeJx6MMuXMIj1o5N/X/tzoFEGiJRz/e24=;
        b=tBTfQeNvZB6dY9xtETVABDAYyRaBBPFu3xK4Ih+T89HNqIf7m0vX8SLe+7SPu0GEPs
         W4nxIp6gOjKvvB0c4hfMolrnE0gWjX/UGaMjuynTblnJ4n2/YJr9PkhLHLtL0uAwpZ6u
         w4hgC9Qbromay8Z+U49qBwRYJhp8V1kHNftooquYMhvS1zTepgYEF6ftfeyroCCl4W4W
         5HQ3BeNJQI5G0TxWcQyX3hPggDnsep9YhRkmEP35E2BWeoSio3HD31U7frkpCUWGusRi
         LRi4ja+82AUrhTwNJaDazMbA8S9WMCK2YX4Q/ryk3/hI+HCBabuIG7uaS00aOFOsRLBL
         IPrw==
X-Gm-Message-State: ANoB5pmV8x1p6B583S802iQKQVlCQ0NgcVhjy6X+O4Ncde+jgQUi/wox
	6bllBXG8vFANIbAzLiiX55+d5fCzbcsiSb6m9GViH9d5iK0=
X-Google-Smtp-Source: AA0mqf7Q8A8y4eTV40JdPNuTtDM44kgGSbpP/nS8aflUSoJKvJSyi/H43QO+rdYEk1+VQqSoAphenmsWKL4QgYzEtk4=
X-Received: by 2002:a05:6808:1c1:b0:34f:d32d:cad5 with SMTP id
 x1-20020a05680801c100b0034fd32dcad5mr39954583oic.262.1670175222906; Sun, 04
 Dec 2022 09:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20221204064433.5377-1-kai.kang@windriver.com>
In-Reply-To: <20221204064433.5377-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Dec 2022 09:33:17 -0800
Message-ID: <CAMKF1sqOAm2Emi2MBRQ1hQE6V2ezOSscKz4E2XCxOKkyBhS4sQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH v2 0/1] python3-wxgtk4: replace deprecated inspect.getargspec
To: kai.kang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Dec 2022 17:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99947

On Sat, Dec 3, 2022 at 10:44 PM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Hi Khem,
>
> The backported patch is dos format which ends with CRLF. But the other
> part of this commit still end with LF. It seems fail to call `git apply`
> directly. So I pushed to github:
>
> https://github.com/kkang-wr/meta-openembedded/commit/b9a114e5c992afd6619512cd78098ef9d9072170
>
> It should be fetched and cherry-picked

Please create a PR for ease against
https://github.com/openembedded/meta-openembedded
as a special case.

>
> Thanks,
>
> Kai Kang (1):
>   python3-wxgtk4: replace deprecated inspect.getargspec
>
>  ...eplace-deprecated-inspect.getargspec.patch | 65 +++++++++++++++++++
>  .../python3-wxgtk4/python3-wxgtk4_4.2.0.bb    |  2 +
>  2 files changed, 67 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
>
> --
> 2.17.1
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6494BC4167B
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 19:46:42 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.143406.1672083993182491786
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 11:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l4AaKD1E;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id s186so10900918oia.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 11:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CSNyhAolzGJukG70Pb2mj6sRRi4K7Ul5fKjDHLpKOR8=;
        b=l4AaKD1EInAIR85MQ9Gf60Hpp0503qHqf7W5+pi1db5OdHo0t6oZzgYxML5zwYGh1M
         wg8QpPchPuehz9efvblHBy0ErrP40sy+kduhg9ak3GnULHO0mG57RswP2hs5BUsY3N3/
         BmaDYzi+h1zkQUae1YtZNkMTbDhNN3lQmnDQ6TRicyISkmjBxMoYX+SHQE9yjrMFyNJ7
         0FuLrfyjTak8O0bG4FWNjbareMRtO9yB/vphHICcHpgo8DKmVuqRLwrYQcW23peXWbqw
         Z2syZJB0XGdVZLW7BdFW8yuKe52cA6GatXPaFacZ7ko5iNRQgvapIQaGdcrqwSRfoWoS
         RfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSNyhAolzGJukG70Pb2mj6sRRi4K7Ul5fKjDHLpKOR8=;
        b=iB9JB2Mf9Cn90/6jPYBoYIr4OAM9pdNiXHGRwnVZdw6r7acmn1wQiQfpWPkpEyVS9u
         ETRhL1BZ6+O89uWbmUP8i5QGYora35jylSbgTL0PuY+J2PFJ4qjRfDQBF8CYfMlOkzJA
         accCreX2sJd2LUdm6uZ1Mo2xjNAMxx/dPBDqd2s3ukrVR/wH1NnXNDZDNw0KdwBqc4lI
         S2PBU/MynAY1b8UBA9hAH4PAw8t/qlgZ432hZzv6WqMDMtc7RxfRcWexA9CLQD96/3Cj
         6bDtD/59TjVf1hLnfr/ZdrFTYFQ9HekhLPKb1GPQM+NLSWtKXJdT8x2fpBG0akekcfua
         vQDQ==
X-Gm-Message-State: AFqh2kq9p8c8v+4xYQU3rcGqUkTZaeUjEckaXvLMWcT/bkzFbGuoDpX8
	SkWkxVe3JeQi9u5Tcmz5dUJD8D5fNH2olHqmrc0=
X-Google-Smtp-Source: AMrXdXtSHYSpa9ZyTt0JdM/NhfFO4iwFCddUGBlTJ5JchghtNs6hDxFAe417kBto9w2TJcA58SYafj1wjF2E1oZTIlk=
X-Received: by 2002:aca:3855:0:b0:35c:53a9:5513 with SMTP id
 f82-20020aca3855000000b0035c53a95513mr961853oia.262.1672083992213; Mon, 26
 Dec 2022 11:46:32 -0800 (PST)
MIME-Version: 1.0
References: <f2a94bfe-2971-b281-e06c-cfe2303b846c@gmail.com>
In-Reply-To: <f2a94bfe-2971-b281-e06c-cfe2303b846c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Dec 2022 11:46:05 -0800
Message-ID: <CAMKF1sr9V9pvAzNQWqXuEyZEU-684bT-kTVNfre8LrLGPa11ag@mail.gmail.com>
Subject: Re: Dunfell merge request: Dec 26th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 19:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100244

merged thanks

On Mon, Dec 26, 2022 at 11:01 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 7203130ed8b58c0df75cb72222ac2bcf546bce44:
>
>    [dunfell] wireguard: Upgrade to 1.0.20220627 (module) and
> 1.0.20210914 (tools) (2022-10-30 14:47:43 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 7952135f650b4a754e2255f5aa03973a32344123:
>
>    postgresql: Fix CVE-2022-2625 (2022-12-11 16:01:15 -0500)
>
> ----------------------------------------------------------------
> Hitendra Prajapati (2):
>        nginx: CVE-2022-41741, CVE-2022-41742 Memory corruption in the
> ngx_http_mp4_module
>        postgresql: Fix CVE-2022-2625
>
> Ivan Stepic (1):
>        flatbuffers: adapt for cross-compilation environments
>
> Omkar Patil (1):
>        ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3
>
> Ranjitsinh Rathod (1):
>        strongswan: Fix CVE-2022-40617
>
>   ...3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} |   2 +-
>   .../recipes-support/strongswan/files/CVE-2022-40617.patch       | 210
> +++++++
>   meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb  | 1 +
>   meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.patch        | 904
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb               | 1 +
>   meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb      | 7 +-
>   .../nginx/files/CVE-2022-41741-CVE-2022-41742.patch             | 319
> ++++++++++
>   meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb              | 4 +-
>   8 files changed, 1445 insertions(+), 3 deletions(-)
>   rename
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb
> => ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)
>   create mode 100644
> meta-networking/recipes-support/strongswan/files/CVE-2022-40617.patch
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.patch
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patch
>


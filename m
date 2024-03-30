Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973A3C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 17:04:29 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.1540.1711818264086871248
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Mar 2024 10:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e02Yt1Xf;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-229a90b7aa9so1466584fac.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Mar 2024 10:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711818263; x=1712423063; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzhWHY6iATtuZ/T7CTIdi+5etNMlP0Ql14zCnRAvGb8=;
        b=e02Yt1XfyA3VCsuPrMR8w8Fqz7nfpzwQmo4KS1dGC6RsW2QRxKzQtilnvRJ3A92igc
         I5CQnsh25ki+Mx08h4idTe2N0M3IbgHINQKMH/rdvoG1jau5p/85w40K8N2uOXWYHmJM
         1ItKGJtZydXF+QBn7j0I7CpGnGP2qqFHF7JDtL1cUghAOZL5i62XH0jsDwyVByubYWMW
         wR62tJeQjZlaQ/r44jouDX1S1VmjdcNi0Vt8ek2GaWqcRrJc9Ptui0/ohgF6dZktltVQ
         MxSqNAuXwV0b/E8HN8fV2kEa79tPyNMm3d53eNeTUjHd+WfqjjG6vqkgF9h9BBnxZTBD
         vDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711818263; x=1712423063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzhWHY6iATtuZ/T7CTIdi+5etNMlP0Ql14zCnRAvGb8=;
        b=fkvCqIM4KtQhUQgW11bNHw2JZnN4ZDt+Qcea6NGRbcWR/YYvz+PtysVW4lOHzHJpDh
         PZTJLXQg5TPshx6rahuGTzievbizfbyyWRG6dqpXYoWp3rzO2UoK83qRwY96Z674dTtp
         sNsq/kwWP2QSfM/gavh+gfDoL8CgbLkM5ilCYxEfQgPzk5q/n/kbLcksYWvS3W6GULsH
         C+95OTCezZjarKoH8wQnmnvxTQfZOYB8ZwSGHHwLmHYAJkKALGpEXTZbzy5h5vbhE8QW
         RyOiFiYw257v3u+ts6NcLIvKLhzrXkFMo8t8lV2cAi6zCc49+Eh9A1EyrpIN9xnFZgHn
         6jFA==
X-Forwarded-Encrypted: i=1; AJvYcCWkputjkAp/yO0FEh8UqdDPkUpWE9qjOq1CxyYwzh9ztXCeUJYBgLYLnNZQH1Z/BEN6p7Ol3vohQv3sW4iX6QWlf+EOzUdQEjZGscw/c/1G7TBEQ4RBDmeyxg==
X-Gm-Message-State: AOJu0Yy3Kq0Kpoj6SiNBi9lUnuNafce60I/34ao+T13dYVxYpS8z9V/l
	U/zBUZTqlmzNg9l45qOJ5jdMciZcqPzWeCYuAnjtLR/UiNkqpnI2wuYFaVDwh7vl4b0JipL/vPd
	K/j3dJ9IR7c/SaT9VNaWHs/pjG9axDHrw
X-Google-Smtp-Source: AGHT+IHyzzVMGArbYrNgdXLtIBfoefPaRGr/3im3RDLilofpVMWTTG7pU/DwAWs/BUOHVxpt7gojbtpeLSMPj9KWgs8=
X-Received: by 2002:a05:6871:3309:b0:22e:1de:e18f with SMTP id
 nf9-20020a056871330900b0022e01dee18fmr4149848oac.13.1711818263250; Sat, 30
 Mar 2024 10:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230109152538.896240-1-yi.zhao@windriver.com> <1ae2a64e-1796-4989-9157-a6b9ece677d3@windriver.com>
In-Reply-To: <1ae2a64e-1796-4989-9157-a6b9ece677d3@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Mar 2024 10:03:57 -0700
Message-ID: <CAMKF1sp4hVLRx8qwsOC3H564DtyqrtxptUSY4=SC=Y3mtDF7aQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] freeradius: upgrade 3.0.21 ->
 3.0.26 --> Should we update to 3.2.x?
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: yi.zhao@eng.windriver.com, openembedded-devel@lists.openembedded.org, 
	"Yang, Liezhi" <Liezhi.Yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Mar 2024 17:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109688

last three point releases of 3.2.x series has been stability releases,
and I think it will become next stable following the release pattern,
so I am fine with upgrading to 3.2.3, please rebase the patch on top
of master-next and send here please.

On Sat, Mar 30, 2024 at 8:05=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> Robert and I had an internal discussion about whether we should update
> freeradius to the 3.2.x branch. See below. If there's no objection,
> Robert please send you local update to the list so that it makes it into =
5.0.
>
>
> Robert said:
>
> I've updated it to 3.2.3 in my local repo, but 3.2.x are 'Features' relea=
se,
> and 3.0.x are 'Stable' release:
>
> https://freeradius.org/releases/
>
> I think that keep it as 3.0.x is better than 3.2.x for LTS24 (YP-5.0)?
>
>
> I think it's a judgment call.
>
> You are right that there are new features being introduced:
>    https://freeradius.org/release_notes/?br=3D3.2.x
> but there is also a dedciated branch for 3.2.x:
>    https://github.com/FreeRADIUS/freeradius-server/tree/v3.2.x
>
> separate from the master branch and there's talk of a major update happen=
ing for the 4.0 release:
>    https://freeradius.org/4.0/alpha.html
>
> If you look around at what other distros are carrying, the more recently =
updated/released
> distros (Fedora 39, Debian 12) have 3.2.x:
>    https://pkgs.org/download/freeradius
> and ubuntu-24.04, will ship 3.2:
>    https://repology.org/project/freeradius/versions
>
>
> I wasn't able to find a document about FR's release schedule or EOL dates
>
> but it seems to me that we should add 3.2.x.
>
>
> ../Randy


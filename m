Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D2AC7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:04:48 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.1370.1685556277580694567
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 11:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=m9KCnf0X;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f4d80bac38so7065099e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685556276; x=1688148276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0YrIWdlZ+RVNzMcpMfNQC9Rg4NhDXsrk4YYhVcocbM=;
        b=m9KCnf0XCTDAf//C8XOeTr3xhnLmasqeOAH9BoQ9U6ZMfEei3Tj8/ZHjBY3bk2q9Uj
         lX0p2+GQ3YtWS51SZRBeTqrE2IS73xfUGsL3eVnS2IxVP+wwMB59ShUq6kuShPb2v/lp
         WOO7oDtZxb+VgFZAFSVsWk02H6yHwXmTN2PSKZlPo+Y5FL4dXOjOrccTNt/4Akq8zDK3
         gu3EgDYfwg9ALATP84k2SJJ/h6RUwZwgXbLY5sd0HcrhPBGCHjpCd/mJZ4rgiQRPKkrU
         +yaF2sp4UF46FYKC2oTHwWzyr+3avt7hWgI63wOrzExZdIYMeIeOyJg034RS09xLkU1P
         Vg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685556276; x=1688148276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0YrIWdlZ+RVNzMcpMfNQC9Rg4NhDXsrk4YYhVcocbM=;
        b=CEJLf0crNf7bv1XcimmKRJF/kYuSnh7f5MVg1gPlTY3uGEvyzMGk577uIEq4+V0KAd
         Snp1W9gdGPF1iZUvrgWYwEi+ctXXBXxlX7K3ikuLNXtWQDqMkmJIwAEHFHAdLNPtYCH1
         4WQfRfJ8l65SNL5kQmVbuoWZb8tT4PDBUwAAnmrfjzTj+ScYminyg3mNoYHmT44rcomJ
         CSih2u7gYN8iZE7Nhp3CyedXGgTFSb3o5QIehWZJjnwlWIPX8NQMt2/LbyQ1RdIcr8Vz
         pt1sgJCod52EhRrAawjR3Vh05j7mUrxwx0QphEfOvHRysZgGViDye3Fgkzt1Ko2D5dOS
         lZ8w==
X-Gm-Message-State: AC+VfDzlfCr769sHikU36dDqdDmMu4iotxP/HwMQCY4jWLYu63GiHNKq
	cQxKlBeszlNpLu3UKdzSuxWKgpZYyLGSBEZA81M=
X-Google-Smtp-Source: ACHHUZ6PHRXNRJCl2Izmm33Yr9dDqDEYSxvQidQet0vfqPZwLtklT5pis6/suNvAJwbQQH+pouT7gFJ4AhbK0EKcwKc=
X-Received: by 2002:a2e:9405:0:b0:2aa:4519:fa0 with SMTP id
 i5-20020a2e9405000000b002aa45190fa0mr2951338ljh.34.1685556275347; Wed, 31 May
 2023 11:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB36782A89BAFA8FCEAF1ECC4681489@TY2PR02MB3678.apcprd02.prod.outlook.com>
In-Reply-To: <TY2PR02MB36782A89BAFA8FCEAF1ECC4681489@TY2PR02MB3678.apcprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 May 2023 20:04:24 +0200
Message-ID: <CANNYZj9Ldo1PxzVKKu8-SPV=HZo_4uMT0qUP6SYjLge42F6dgA@mail.gmail.com>
Subject: Re: [oe] DISTRO_FEATURE gobject-introspection-data or gobject-introspection?
To: Petr Gotthard <petr.gotthard@advantech.cz>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 18:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103070

On Wed, 31 May 2023 at 18:00, Petr Gotthard <petr.gotthard@advantech.cz> wrote:
>
> Hello. Is there a DISTRO_FEATURE "gobject-introspection" or just "gobject-introspection-data", please? Or both?
>
> Recently there was a set of patches called "requires gobject-introspection-data DISTRO_FEATURE", but for some recipes it added "gobject-introspection" instead, which is not defined anywhere and hence the build fails. Was it an intention, or a typo?
> The recipes in question are: firewalld, blueman and system-config-printer (which contains both gobject-introspection-data and gobject-introspection)

The correct and the only one is gobject-introspection-data. If you can
send patches to fix this, would be appreciated.

Alex


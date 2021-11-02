Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C1CC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 15:17:30 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.1169.1635866250415615880
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 08:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B3c35vz9;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id e65so20430668pgc.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y8lsQCMlwFEe8YDubEE8o05y9SuZbknkhzMY7DkTiGc=;
        b=B3c35vz9ekR56a6je6OUsFhHTPu5/LShjg05I4aZq1gr6a7/JQxQtZzqvu+uB2+mU+
         l9zss6ztYJ1kFHR+n9u+7oYnkNTmcO6WCvLfqdqCLKGNHZKyOdviFULIo5k4tq2XW0cD
         hOHeEk/zYETnYRli9EGJvYL8azFzmu3NTaCs69S+hJppQ6K2F36D2NY/KvIBOidqnMoy
         sXmdBHbK5k4XcLjXwo/dwQglU/3Q00w4IBSG0nZ1RjzCjEzroNoMurXNQEHjKy+x4/AT
         rgiVw7GrzINsOr7+KWfyy14r8Hn/uaxzXVj96qSHOHiGEaHDt8T+o1GS3ctc8zXVyRH7
         7VYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y8lsQCMlwFEe8YDubEE8o05y9SuZbknkhzMY7DkTiGc=;
        b=ZM3opJ2PDqXyFdkWo8zA5DCcrF4OnkAmy+yYANwjJILWmce1dXPp85N4gMzp5K3S+i
         suCXVtdH/gHBBCEg6eDYTyug0PDMSu3KWn6pNXqGQ1ghS7zHx5ikaMAfsHSgMWEULA2i
         7vXibPSJQbs82Kpc9Y/35rbf/RXSTkSUFddtVNy5gn//ArBqqE1o6hCXfPAd/P+BqIsF
         o4Z6sYoylHufIbbButnOf1UxKYpnZl8eBzbKBQ/KJplPO5SpuriB1o5TojRzKaRo756Q
         Lzc7gaCT0IRhdjpkiJhgB8Ft+jXKREqGNcRTKKQ6k7BB3AK3aJJiefU7hw872ydtKf6X
         zIlQ==
X-Gm-Message-State: AOAM533x+e1pGXBj43vHvC4zal8cJc21cQ5H/uGIbd/91neTpj2byv+X
	EZzYuRk8Hj29votEZNHcj0ibrtjavzbxiNkXrd8=
X-Google-Smtp-Source: 
 ABdhPJyIcnU5b3Cxs8qzhpEcl5IsZrMnHyrKtgx8UiD5p85ji73IydMxLACjry0L6+BYtaNQkWCaaXev7W/011XepYc=
X-Received: by 2002:a05:6a00:2353:b0:47e:64c3:57c3 with SMTP id
 j19-20020a056a00235300b0047e64c357c3mr31499813pfj.72.1635866249944; Tue, 02
 Nov 2021 08:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211101224402.3949691-1-schnitzeltony@gmail.com>
 <CALbNGRSZMyeVc+WeHZY-NHbEYzsFpoJeV6ZBGtXAR-oXN-RKKQ@mail.gmail.com>
 <f70a72c4-5d10-57d1-429b-c4d613b606cd@gmail.com>
In-Reply-To: <f70a72c4-5d10-57d1-429b-c4d613b606cd@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 2 Nov 2021 16:17:18 +0100
Message-ID: 
 <CALbNGRR6EPAqmOJ4UtFvdoV8EELJ-uVnZQZnTJhNKS9eiU0ntA@mail.gmail.com>
Subject: Re: [oe] [PATCH] mozjs-78: Get rid of erroneous dependency trying to
 satisfy llvm_objdump
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 15:17:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93779

On Tue, Nov 2, 2021 at 3:23 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 11/1/21 11:32 PM, Andreas M=C3=BCller wrote:
> > On Mon, Nov 1, 2021 at 11:44 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > Just saw this one did not make it to master-next. Is there an issue or
> > was it just overseen?
> >
>
> I squashed this into original patch.
Ah - OK thanks

Andreas


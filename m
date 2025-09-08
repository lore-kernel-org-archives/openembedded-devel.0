Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD69CA1016
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 21:48:19 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.6759.1757368089875613872
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 08 Sep 2025 14:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O+ItrwrL;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-723ad237d1eso44384007b3.1
        for <Openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 14:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757368089; x=1757972889; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bknRQx59NHkSlKB2RFKLkY1TqZC2Q/SdtQGiKhanb6c=;
        b=O+ItrwrL52FejHtYsW7LtWlKqU17mhAXrHFTRGaJBz5ucD8xc/AnKCjZ5Q1TYgUmD/
         SzcD9gk7/gU0FqGRxirOb/a9oA28yz6HN0EJgkwiUc4jVM1GfAN7hTz8ZIl3tx9R8fMG
         Qpg5yuuxog2XYrBKTdainUWAhI34/hP5YrM9aUQJ9siK1a/RywfkWz6Ixx/w7QkdmS7O
         6HoEHF3YhVSqBDSi16ZiqP/eKKrNr6Tf6tZvI6ltueOikzvtBfYmDl6M3C9uTDAmqh7h
         22cUiksDwP1xN+YjtdXwTLFBEFqoafotR65ivy//baE22dFr/AxsubcU3N9mZk1NDtUQ
         Uudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757368089; x=1757972889;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bknRQx59NHkSlKB2RFKLkY1TqZC2Q/SdtQGiKhanb6c=;
        b=A7IBKY0wBb/THmpxSYijk5IDThQxlhlHbkMwBFsw6QxWA5QJuiYdZfaxHRR9Bfky6g
         v8c3vaZEbdV0EpC8Gh4rqnCjKiQrvbvKlIJXWgazFGVcWGAInfVQdeGUsMV2JWEuQoGN
         CQdOak6bxgLOjh8eIs1w24c7E+TUK/rXy1GmjHlvv+olByZsjF79r5OryhXBTYOlTTRK
         n0UucO5Nc9MPJRySA3YRgaN27W6AdoOYyR+XbO3PumbmYQfq8s9HTn1oqMk+wrEHNuGF
         Vwinz/pQVIwdb5nABjXWP2hz9XdDL3qJ6FHLB9IPoFq7n7DIkh+WIa1SOk793ce6SIbV
         i9OQ==
X-Gm-Message-State: AOJu0Yy8VqHsLtwo7uAaEXTZkWMsZ0BGEJAc8Q2W93AZnBfVtQvy+GWA
	IwADemgRqMVKyXDiz+PdlQulbBc78o5jZprsp8U4ndWqQgm2jouCy+oCoZLnWtE7FUgGo8d2jCg
	ZlYsXRVq/r+npZRmnnurxrJuDMA5Je4hi/Ds/ly8=
X-Gm-Gg: ASbGncsuzSg2CrQyyUaOgKVFwMQmxTAaLLjgnNNIfJVmilNoIr8nFU3Pd1NyUqRANUi
	eDTrjDyGXqVTq0pPIexjUbJdX3SICpIT5fAGFVFa3+qXjzEcxa5JsxIdRdRik6rYDzk/36moIUN
	fSQn3cUJzo/M1fNdm8DjTY3gomdc11SVgU9t92RUGyAX9IkMc1zRtz3RH53ncMwmW6b9uVvljxs
	wYuCN2b5vlP7kcPexlQwvMniJeQuoCfYmk1R3UuLweS0Jamu/JN8xA0/JtsMYXsxSGOPS7GdQds
	YTmovMd8sKE5tlYqoc0573TdnkFa2ksoIYKhz/5fFOyWYGeIlR/tNXjCoVzVgm8s2XHp
X-Google-Smtp-Source: AGHT+IE0qBzAWmXxJJUkW+jIzI2YifHRx5+960D8a9bbH0Dec2d1dlzKz9a2RrpXDzuSF8dwTa14RM19o0D7K+r8bww=
X-Received: by 2002:a05:690c:14:b0:71f:f359:6c9d with SMTP id
 00721157ae682-727f2bcc967mr78995757b3.11.1757368088659; Mon, 08 Sep 2025
 14:48:08 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Sep 2025 14:47:42 -0700
X-Gm-Features: Ac12FXwTdjoOkFgYSKMNgYzABLnjcJWXlfcAeuY2YuEcvAoLkvMYdJj-y2RcXpw
Message-ID: <CAMKF1sqhzO979KgHE9BEfbw5xe7NH0GKZji9VHOAy6pn+E9NDQ@mail.gmail.com>
Subject: Stable branch maintainership
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 21:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119335

Dear Community members,

Armin has been doing awesome work in maintaining stable release for
meta-openembedded layers for many releases, however his situation has
changed such that he is not able to continue the meta-oe stable
maintenance.

We have three branches in maintenance, kirstone, scarthgap and
walnascar at the moment and
a backlog has been piling up. Several members have raised concerns on
mailing lists on pending
updates for the stable branches

I would love to have someone step up to help with the stable
maintainers role. Which would
be looking for stable branch patches on mailing lists and reviewing
them and creating a staging
branch ( like contrib/stable/kirkstone-nut etc ), testing and
preparing final pull.

Armin used his own machines to run the CI, we now do have a machine
available for OE CI
which we should be able to use for the CI loops for these branches if needed.

Looking forward to hearing from you

Thank you
-Khem


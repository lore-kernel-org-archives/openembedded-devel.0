Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEEEC27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 20:30:29 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.41584.1718569820129586850
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 13:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nTKKkn4a;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c4e2cd931aso468553a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 13:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718569819; x=1719174619; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saZG64ULfk01toLDnyKzmco5VUrAeVaSbSvJ02iyhp0=;
        b=nTKKkn4amTtroxrlrlkcgIbT4+ZfJuVb6EYiM6z75wNDbm0nY58JbcX+kLZ4Ad/mAG
         gOxfnl6EA6cWMjudInHZ1fGKB6qUEupExWDiSzIhyl18WHvvPEH47mLHWjjAkpT4nDGA
         YtCGqFCyxRQD8W6YKxlCtKtHHJXZazuwcDzulx+ZN3qxgN7ecLkTRcFFSImntuqsHTVn
         +1mj/wZmit6Zl+76UcZQzivVslBR3UmelAsnVIAyLAkMN1v7inOI9+2Sjhw9kSR88Y6y
         6R12/+ubRfJdySPF5BJ7lXBYv0S6D6hKrF2Qea92powRyuN+Mn2MUnbOImUyxPSb7N2m
         Q/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718569819; x=1719174619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saZG64ULfk01toLDnyKzmco5VUrAeVaSbSvJ02iyhp0=;
        b=dIzDvaYD1qk9WDY4hiBxVLQ1WiG9LRrc5P0kQ/slPYZii8eVr/PRgGmErg9DXh7LUP
         yoeBK+dSg891/xv28fMCjxS2cnCYsUZa4ROvHkFgZX2ADCUbVqKAK+aZBuCDtwG9GEI2
         z+kwWJj4CoaN5rHz8gBrHgwcG1bjcl7cwffvGza5RQAQBIZadB9RjxVXumRnJRABbFqQ
         DiF+xPj8d0gyPUsFgTeheO1W7FLNnmpzoH47Dkva52Oyj7YX8pnAY5GalPYSWol4yy8B
         ZnOXNq34V3cqwXE8lRrHGdkghM8TUxJ4ZypWOh8TcGLuPnT8O7IFo7EYAX00cYFQlebl
         a9RQ==
X-Gm-Message-State: AOJu0Yy4O6GHG6x9lutXurx9em+tIhOU72kL1NJp/XWC2FGzgExvxEfi
	C81lhiWZDyoedSZDlHr50neuvFhiLedrqWcv8KrbXCmtvXUUByitRGVdaQiR35oSG128aVUsJhb
	JtvJoxnOvMXEr4ryNrQX+RInEQQw=
X-Google-Smtp-Source: AGHT+IGIfGnzV6cZc+Yp1VuBLOCO1FzaMnykSJDtP6R3Tz9InPEq2Oacbduiqdy3cdpQaQYPJkkCGI3hEOAyl1sPJDM=
X-Received: by 2002:a17:903:41cd:b0:1f6:daa5:95b with SMTP id
 d9443c01a7336-1f862c42c33mr94747345ad.6.1718569819354; Sun, 16 Jun 2024
 13:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240616192310.856262-1-peter.marko@siemens.com> <20240616192310.856262-4-peter.marko@siemens.com>
In-Reply-To: <20240616192310.856262-4-peter.marko@siemens.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 16 Jun 2024 17:30:07 -0300
Message-ID: <CAOMZO5Aa6UxGFHUd6W7xHBOq0A6G5u9+kf3yUOhAGu-=Ya-81A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 3/6] libwebsockets: fix buildpath warnings
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org, 
	Gerard Salvatella <gerard.salvatella@siemens.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 20:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110930

On Sun, Jun 16, 2024 at 4:24=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Gerard Salvatella <gerard.salvatella@siemens.com>
>
> From: Gerard Salvatella <gerard.salvatella@siemens.com>

Duplicated From line.


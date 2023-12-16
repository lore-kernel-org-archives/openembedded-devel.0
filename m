Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFFDC38147
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 08:03:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.11774.1702713800102560496
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Dec 2023 00:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V32iJSEe;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3364a5ccbb1so1255483f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 00:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702713798; x=1703318598; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qZEN3dtzyxhpDBxcgDRBS9tsiat4hphup026yNFQPdM=;
        b=V32iJSEewmoG1FZ0/Lw0h6BGXeqnSqJIRi1AzfLLdbfclKqv5vIcwsrVSOzFBzCa3q
         80qlJX3bmqnxMKeWNWZJlQW/9567gSs8m1++69KcXL8EmkZwaI3Ep/wAKALQda9abcxX
         5bwGQpCWRbEkSQIQPh/sE7rU9qDRiIHtsvUbcp1Ht80NbHHqF2QRcBp96LAHs1lA9+nL
         74I1vg5a8HLRXyNcP/jmct8DdC9juQz8EPYHJyPf4KtAP0PHBUg5xtD0xlLmG09/pGg6
         qyW4zq49uYHcq8o2LG7fGKxwKH6z2V+bVvEA+a/vLcAyRYiGvZGjvbKi7HuGqZJ9e3e3
         wdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702713798; x=1703318598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZEN3dtzyxhpDBxcgDRBS9tsiat4hphup026yNFQPdM=;
        b=WkuyeVwPs3iEVLiD6OVDjf20dHylxwhcfzV16Wh7NxvU6eioNJvb4+VjLfVySdVoz8
         W9Sz9Ie925Ui5V/M9+1Xp8frZCYoG7PMOZZAIWR0U9ccxsvRWc+WG7xrwQ5N07AnJBu3
         JoGwT5wmfhoJMIqy7jTMNF15kwydggbnEnEhYFAn7rNeOO3SWQPGDny8k79hlR8tgHHY
         Tgfl8XZ1X5F7u4xQw+VpYSvVnBZtnxz5d03p08YAe6W5s3qDx3KH+QIl/7QI+XZnrV4X
         fNxDxuhX/A41MLE+fOmyMdG08SwrV2+rheo7jcfSimr9p9jOPOsRgNq7suzlD+Jpfjw2
         thIA==
X-Gm-Message-State: AOJu0YzkHKbMzcZguvxKfrD+NfCE6K9R/0EySEdNEjuF8Zm21EMjn3IV
	PsMuB6+Zgf0jcqiIjpHhz/EQ0JiLhvYjoQdbufA=
X-Google-Smtp-Source: AGHT+IHn0K5ffw7criY7K3UdHIZjXp+VV10gjfITQ3YdZ+FBiWlvCeK5E5wTj1LvW5c1cDxpmQ/SwWDvFhuLHTwNCl0=
X-Received: by 2002:adf:e10f:0:b0:333:533d:9ce1 with SMTP id
 t15-20020adfe10f000000b00333533d9ce1mr7080706wrz.82.1702713798181; Sat, 16
 Dec 2023 00:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20231211131938.127747-1-alexandre.belloni@bootlin.com> <CAMKF1souk89CZBBCjM3W=-cZYYmyvyrtV-U8t2i0Zs26fwJOcA@mail.gmail.com>
In-Reply-To: <CAMKF1souk89CZBBCjM3W=-cZYYmyvyrtV-U8t2i0Zs26fwJOcA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 16 Dec 2023 09:03:06 +0100
Message-ID: <CA+chaQcq1m2KvKgDF9a9+NQTeMpjoOx=AxLJ9BwNViYANA2=hg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] poco: fix branch
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
Cc: alexandre.belloni@bootlin.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001846f1060c9bf3e1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 08:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107530

--0000000000001846f1060c9bf3e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 7:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> Hi Alex,
>
> Thanks for the patch. I did not take it since there already was
> another upgrade patch [1] proposed which fixed this issue as well.
> Please report if this issue still persists


1211613642269b7d53bea58b02de7fcd25ece3b9 is still being used in nanbield
and mickledore where this patch would be useful, Adding armin to the thread=
.

langdale has the same issue but
with f1aefe34a46891b09230422bbc37465bc6d0a0d1 which also isn't in any
branch anymore

--0000000000001846f1060c9bf3e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Dec 13, 2023 at 7:47=E2=80=AFPM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi Alex,<br>
<br>
Thanks for the patch. I did not take it since there already was<br>
another upgrade patch [1] proposed which fixed this issue as well.<br>
Please report if this issue still persists</blockquote><div><br></div><div>=
1211613642269b7d53bea58b02de7fcd25ece3b9 is still being used in nanbield an=
d mickledore where this patch would be useful, Adding armin to the thread.<=
/div><div><br></div><div>langdale has the same issue but with=C2=A0f1aefe34=
a46891b09230422bbc37465bc6d0a0d1 which also isn&#39;t in any branch anymore=
</div></div></div>

--0000000000001846f1060c9bf3e1--


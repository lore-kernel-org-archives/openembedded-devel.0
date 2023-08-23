Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A634C3DA66
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 17:23:19 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.2661.1692811389921660422
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 10:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IVMh5Iky;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-570deae2594so1879862eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 10:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692811389; x=1693416189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0C1ci+XsAWuMUnoPU4jtqyV+jGFk+LnT+B6pNiZ80Hg=;
        b=IVMh5Iky7JT8t3aRRm96tHvIHqo9VwnCVzM0ZPL6MTrVASWJL+lqdDETIFYbj+jreM
         zdm/B6fw5+yKjssHpKTNSwW8EpLWumg5CsRi5suZQLezynFP45sPZ4ImBCTijHG57keO
         QFK3PtrqglCvJPpS+Bqad+ixH+MmAWnREdYe0G3YQ3nlBIH9wLc6/Eq7x4x9q8jPpHTN
         2ew7ug3qTgdlhRzFEggH1W3G2g3pZLrHtBrhEc7ylInyy1pZYBI6nwp6LBYD1wYV6CdY
         X4DsG6EDD2ZrAMuDgFYxgly3JixJ+gRh6fUUxL7y4ce1DqMDlZsRos+Vf2/uLV0+SXGl
         VL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692811389; x=1693416189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0C1ci+XsAWuMUnoPU4jtqyV+jGFk+LnT+B6pNiZ80Hg=;
        b=ORTwOU4ouOO7sAgBMQS/NnVGFYOFJX0Eu4cbTuIJjFkTuV73/lBzKrmVkoifGOT5LE
         En3qAF8WzIN6povSdNBVRd4CodU0BN6y9lI7DmCXj/QPKjIBVDCb4HByLLHdJsiCwOMT
         VHKGNI2K6G/vUGVaodZaysN3bSLTKHGP/utA73u9//0QEo7psKNP7F5NEgUrdtvviHSm
         M0BmsvK1r+r5KqNpC62Lo5QPnqK96CWtjv+zzqXQCsHZ6iMhFL+zRZb2O8zfyvx09QrX
         KGmNW/GuOVHaJv8UPf729Q67gY72+rfLEGkXwi2s5/0MEjzQZzJ6UQPneAmvJBz6YJ+Z
         yIsA==
X-Gm-Message-State: AOJu0YzZ//MrhIQorbJ+Tm4Ybp6PUj245TqH+6K6LtbjoUWSsmFsjOxl
	yhyIrksra/ZxLANuERymFwuq198sPWw1SQg9FTg=
X-Google-Smtp-Source: AGHT+IFWIBlIHxjSigzUxiK8vzPUdcH9J2pEXGH6Y9mEXjBV7w13JsWeVG+oGS5hf5opgNfsuQ50E01TR0nm3KNgcfs=
X-Received: by 2002:a4a:91d3:0:b0:56d:10bb:c2d4 with SMTP id
 e19-20020a4a91d3000000b0056d10bbc2d4mr12386649ooh.1.1692811389044; Wed, 23
 Aug 2023 10:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230823121957.5626-1-f_l_k@t-online.de> <20230823121957.5626-3-f_l_k@t-online.de>
 <CAMKF1so8xeZqi_O1Pxt95csnBtYoi5MknvHxQCDeN6djNUWAEw@mail.gmail.com> <ZGTUZR.GRK8GCNOYH7I3@googlemail.com>
In-Reply-To: <ZGTUZR.GRK8GCNOYH7I3@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Aug 2023 10:22:58 -0700
Message-ID: <CAMKF1spBO6JxHP7VdZ4KbCXCT9SKve9pvD+Q=YYTOfanCKwk5g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/5] spice: upgrade 0.14.2 -> 0.15.2
To: mrksvolk@googlemail.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000840ece06039a5d03"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 17:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104554

--000000000000840ece06039a5d03
Content-Type: text/plain; charset="UTF-8"

Ok, thanks.

On Wed, Aug 23, 2023 at 10:19 AM <mrksvolk@googlemail.com> wrote:

> On Wed, Aug 23 2023 at 09:28:39 AM -07:00:00, Khem Raj <raj.khem@gmail.com>
> wrote:
>
> have you built it for musl targets ? If we drop the thread_id patch this
> would be affected unless it has been made portable in different way
>
>
> The file that was patched has been removed. Looks like it was rewritten in
> cpp
> I was able to build spice for musl x86_64 without errors
>

--000000000000840ece06039a5d03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Ok, thanks.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Aug 23, 2023 at 10:19 AM &lt;<a href=3D"mailto=
:mrksvolk@googlemail.com">mrksvolk@googlemail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div id=3D"m_-2236124335587328607geary-body" =
dir=3D"auto">On Wed, Aug 23 2023 at 09:28:39 AM -07:00:00, Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt; wrote:<br><blockquote type=3D"cite"><div style=3D"white-space:break-sp=
aces">have you built it for musl targets ? If we drop the thread_id patch
this would be affected unless it has been made portable in different
way</div></blockquote><div><br></div><div>The file that was patched has bee=
n removed. Looks like it was rewritten in cpp</div><div>I was able to build=
 spice for musl x86_64 without errors</div></div></blockquote></div></div>

--000000000000840ece06039a5d03--


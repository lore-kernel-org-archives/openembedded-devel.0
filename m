Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F040C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 12:15:08 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.6241.1641384906660054636
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 04:15:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=k6FDHnGx;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.179,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f179.google.com with SMTP id t66so26543151qkb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 04:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QV9OqaVL9Vwf1j9R6ra0zlKTR2ohcUS7ggqUHDvtJM8=;
        b=k6FDHnGxxM7Ov98adY+1vvB73ZOt8VSjmOLkVFvSpePoGuTVN7ysu9facvKiBzU5+f
         O67jqTaIXavCdcdH2slMC8OSPjbAZkDNVLO699K15mmYiE7dERkSTZY/1webzrRIDFPL
         /pa6LX3YRR3GabNRcam6lFW5hCaDxQYtwhyUYHqZcDFKlCbH/4QDTx/CIz84GPZ1tFek
         26uu+A8gLJtybeqv9tTyeCUIlCcV5JC43INGzzfe1ZQ3fKH22vERYZAxCYSk2b5nH+cJ
         3DacH2UD/dw4jkLQ/HPR/ErUciFd3wvuwWY6D7JH99HX3DHVgL765y7sS5nhK6CPIYfM
         hCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QV9OqaVL9Vwf1j9R6ra0zlKTR2ohcUS7ggqUHDvtJM8=;
        b=1/0TiU20L98xj1ya1Jtj/32qjFj3WgynHo88wYvFKhHBoLsYeukV/sKEan9PtiMpZN
         PQ4F6dkvirb3ZUQ8mf+g8sl4Oi4o3Tz98DGrhcO6Y2CDzhqHut4298tnPUVYtcEc/jG5
         8m06U25EICD8FV47NJFnZD5hypKfAlIFRSy03H9xEuN/wp7WnxGsTU3/+rj2rpRz7N1r
         1zBomsH2eENMXAmPSW2vllrwKBgvZGSD/Y851qrADlp8NKcwKRueDrjtExF1FRiYj6dF
         3ZBEm5nO0F9luz5AS54fNxDQCsuMkqSraPo8JhQDiklDxUV4RiW5AsgqnDpNaaSRenxr
         FtIw==
X-Gm-Message-State: AOAM533pxpI60XZ/zxuTSvsQ6f4CCxRxCP/2iB8K0x89blWUa6WIm2Lv
	uupnw+1JzgsnjfTkrp5b/lWlpo8iClocgmNq
X-Google-Smtp-Source: 
 ABdhPJzrY20l0VcQoJS2A5cDpnYci7wsTj+LXAjQ+5tWxVRSPEc8eNDgPhoS4XuGB5kP+iE/gCyutA==
X-Received: by 2002:a05:620a:4ef:: with SMTP id
 b15mr38332282qkh.411.1641384905399;
        Wed, 05 Jan 2022 04:15:05 -0800 (PST)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id
 bi9sm32923254qkb.60.2022.01.05.04.15.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 04:15:05 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f174.google.com with SMTP id l17so37214352qtk.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 04:15:04 -0800 (PST)
X-Received: by 2002:a05:622a:5cd:: with SMTP id
 d13mr46998083qtb.47.1641384904512;
 Wed, 05 Jan 2022 04:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20220103163754.32439-1-alexk@zuma.ai>
In-Reply-To: <20220103163754.32439-1-alexk@zuma.ai>
Date: Wed, 5 Jan 2022 09:14:53 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKr_xau_sZfRjVFeA_1F6NZP2-t+SGfga_9-Hin=J3Rejg@mail.gmail.com>
Message-ID: 
 <CAP9ODKr_xau_sZfRjVFeA_1F6NZP2-t+SGfga_9-Hin=J3Rejg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] ifupdown-ng: Add recipe
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Alex Kiernan <alexk@zuma.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jan 2022 12:15:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94658

Em seg., 3 de jan. de 2022 =C3=A0s 13:37, Alex Kiernan
<alex.kiernan@gmail.com> escreveu:
>
> ifupdown-ng is a network device manager that is largely compatible with
> Debian ifupdown, BusyBox ifupdown and Cumulus Networks' ifupdown2.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> ---
> Changes in v2:
> - drop merged upstream SBINDIR patch
>
>  .../ifupdown-ng/ifupdown-ng_0.11.3.bb         | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ifupdown-ng/ifupdown-=
ng_0.11.3.bb
>
> diff --git a/meta-networking/recipes-support/ifupdown-ng/ifupdown-ng_0.11=
.3.bb b/meta-networking/recipes-support/ifupdown-ng/ifupdown-ng_0.11.3.bb
> new file mode 100644
...

> +do_compile () {
> +       oe_runmake
> +}
> +
> +do_install () {
> +       oe_runmake 'DESTDIR=3D${D}' install
> +}

The do_compile and do_install could be dropped as this is the default.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


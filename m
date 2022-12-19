Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461BCC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 20:15:58 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.32924.1671480953141780088
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 12:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lfYiGEi+;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-12c8312131fso12974071fac.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 12:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjkAInswWUE4YCGMRvuxPamOEkrYkBCRBw6teTRJPvg=;
        b=lfYiGEi++CVOtZI8CoGAt9jqwXIcbFStaoDdDc1OypjnzEZyL6+ro53RFKN+woFxlH
         +L9ph8o985C1UJTwFzU6hdrn8z3R8j89QEbE6v/c16s3Wzy0+5vF5wIhT+arGDWYL+tJ
         b3njf4JZPeb+RovBhIHSnCjGYbD5kNDzZcJAq/E0wlWv9l2roNlqwFgyxncBJeJD3/xy
         mdgm+gOfhkL/pWw7HrVDS+H408sh/3xBv3ouacMj0QobQSWpZ2RiiiG+OGblW3PINygt
         9pG20+MNv2060WmFMoSHXTSyhHo7mo47rypYYlZzjSgYCS4CxRmvR1gmq7JHbDGvswY9
         uuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjkAInswWUE4YCGMRvuxPamOEkrYkBCRBw6teTRJPvg=;
        b=N76zoDdB+9EAQ0g1m76UFHbDZz4i/FU7QyUJqu9ntEYb12j/T97kkjHfj5THWMLply
         5UW0r7REjIrP54whYrArpOzoqb4IFxpS8wNNvVwlbbpOcQoOo0JPmiZZNBew1SVX+fSu
         0d+0e3ucYeVsfcw3pFMdNGXy+yW4gYZLwuwu31BS2txmJpEOfG9sUmIV87JfWMmiDgSu
         85oauv4BzKQ0/TtL+DwrkHAK3dpmGttA71Gv5vj4iHzNb2zb92fmPzS/7zndILP89ARg
         csiWsuRUfbNIvAvWhDOzv+V3QQx0RhbfcTbceEiqxv0bqX6WcA6W3Rz+wTGZeYTrokJf
         oGJw==
X-Gm-Message-State: AFqh2kpknFgTrNDDCCG2vMF/QmCyji9ZpGVMnW1e/SvSXJTRun5O3A/K
	FI5QYcEA4fqq3I0AJhBnyphqKZYRRuVduc+lzDE=
X-Google-Smtp-Source: AMrXdXtobwoC09dpufvX3IMIhs3lXSoXa2TuU8xIDB4268ackxvm8rvRglaBA9Fs03tSnvTpj24LHk/w9lt4XLsNT9g=
X-Received: by 2002:a05:6870:98b1:b0:13b:1e05:a73d with SMTP id
 eg49-20020a05687098b100b0013b1e05a73dmr1143233oab.55.1671480952358; Mon, 19
 Dec 2022 12:15:52 -0800 (PST)
MIME-Version: 1.0
References: <20221219131041.452949-1-f_l_k@t-online.de> <20221219131041.452949-6-f_l_k@t-online.de>
 <CAMKF1sq4hns=rdZSKpXFocsXOGOaN9MShn151gsrbi8ZfLE58w@mail.gmail.com> <XGL5NR.LHXCDF0LKTW71@t-online.de>
In-Reply-To: <XGL5NR.LHXCDF0LKTW71@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2022 12:15:26 -0800
Message-ID: <CAMKF1sqt0WtWzAaPJx==4tncojJTD3Xz-+-+QeT+65_AzFPWew@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 06/10] xdg-desktop-portal: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 20:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100113

On Mon, Dec 19, 2022 at 11:43 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Mo, 19. Dez 2022 um 11:25:16 -0800 schrieb Khem Raj <raj.khem@gmail.co=
m>:
>
> 10:01:37 ERROR: Nothing PROVIDES 'python3-dbusmock-native' (but /mnt/jenk=
ins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-oe/recipes-s=
upport/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
>
>
> Sorry, I forgot that I allowed to build python3-dbusmock-native in oe-cor=
e. What would be the right way to fix it? I ask because I sent a patch for =
it some time ago when python3-dbusmock-native was needed for evolution-data=
-server tests and was rejected in oe-core. I don't remember what the proble=
m was.
> I think removing the dependency of python3-dbusmock-native would also wor=
k as long as it is installed on the host system. But it's not by default, a=
t least for ubuntu 22.04

Well I see python3-dbusmock is in core layer, it should be simple to
bbclassextend it to provide native variant as well. What objections
did you see ?


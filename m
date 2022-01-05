Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BCEC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 12:16:31 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.6249.1641384989593454008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 04:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=tHvk6J2M;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.51,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f51.google.com with SMTP id kk22so37335273qvb.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 04:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/UxXzcIIoaSmlCwKe05OK4T1UFrRn3CMZf5u8Exe3oA=;
        b=tHvk6J2MgzKr9u15TIIZvhK7Wz0BTVND/XCmAmWL8VixOMDCUbvO6Hl3gIwBRVb7TK
         S7eeaVsXQ0pO1+4xnBQuSKIm8Uvw1awAEntnG3BObwRh2u+pvFeBFLUAkZaYI0hgHWra
         kDHZ4mDaBx8WyDOKeA1FnJFPXrM8n30hgllkCS2RQMfiHdAlloK7F8ITufsEA9pSSivU
         LLnoc3ArsMm19nIY7HuaRz76xuZ/LnqXrHmQ/+i6RM/hP+Je4xSiFviVIe4w93LyPPTt
         vFxPr7fiD5Xqw74pTTnPjrJfhRb9Q1x9v4zo1TKdFbfdm4EYo8yCmtfnfDxBqwzGiBAi
         oGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/UxXzcIIoaSmlCwKe05OK4T1UFrRn3CMZf5u8Exe3oA=;
        b=6gjXC19ZiuI1oYQLNoYbFtSeY2Vv1DXZBajmc1FoCuPqsVl4cjJ5QvJRPFPAjs2p6K
         yBnDJvMdGD5LgGnGr1oazkKJzbE+GfgDxiNMtZMEETt0uPztqgk6pe5hZQGB5ixok9Kp
         DWYUkhDRjoCESM3DGGGWkt7DbiGQ6CPE5/hNszSV0Z+Husu/iJPVFZmwe6xDA3EPDZxg
         qS+or5yyErQ0ew1DCLIU6t3ZZTU4KGOkI4qKq8P5x5VOf9WWU00rfBEW1Z8E+nJZIw3s
         EqsJkBugc3m2U3o4bn0irXcftU9sATdOZjI01jRSGnHP8kksaxrnOSSqAYWj+MWmeljh
         JCyQ==
X-Gm-Message-State: AOAM530RT9kwKxBQrVOQFo/A6eBNgbiDc8D4FngLniY2ASb7xDStGGOc
	RgApWEjRZF9UM6RvgVKtJCGLKi/L24kBq4Ik
X-Google-Smtp-Source: 
 ABdhPJxUuEou7SPbTvWZWljmO4dzbiFynunHIOWow49oUIg43bXyh5OMlAnmTY9IssmTERWT0y7FAQ==
X-Received: by 2002:a05:6214:27ee:: with SMTP id
 jt14mr50047488qvb.2.1641384988271;
        Wed, 05 Jan 2022 04:16:28 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com.
 [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id
 f141sm30824854qke.92.2022.01.05.04.16.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 04:16:28 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f177.google.com with SMTP id b85so38012702qkc.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 04:16:27 -0800 (PST)
X-Received: by 2002:a37:5545:: with SMTP id
 j66mr38392004qkb.705.1641384987291;
 Wed, 05 Jan 2022 04:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20220103163754.32439-1-alexk@zuma.ai>
 <CAAnfSTvy_xKboMuVNqodt5PduOtdj+tNM+qPc84X-Z=vKtSRWw@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvy_xKboMuVNqodt5PduOtdj+tNM+qPc84X-Z=vKtSRWw@mail.gmail.com>
Date: Wed, 5 Jan 2022 09:16:16 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKpSjs7_g-aHDf=WjNDbwLDrru8h8Xu9K2zAuDGAN=beRQ@mail.gmail.com>
Message-ID: 
 <CAP9ODKpSjs7_g-aHDf=WjNDbwLDrru8h8Xu9K2zAuDGAN=beRQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] ifupdown-ng: Add recipe
To: Ross Burton <ross@burtonini.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Alex Kiernan <alexk@zuma.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jan 2022 12:16:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94659

Hello Ross,

Em ter., 4 de jan. de 2022 =C3=A0s 07:28, Ross Burton <ross@burtonini.com> =
escreveu:
> On Mon, 3 Jan 2022 at 16:40, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > ifupdown-ng is a network device manager that is largely compatible with
> > Debian ifupdown, BusyBox ifupdown and Cumulus Networks' ifupdown2.
>
> If this is a superior alternative, should this be merged into oe-core
> as the replacement for the existing ifupdown scripts?

I think we could consider it but it'd be interesting to check the size
difference between both so we can have a clear idea on the impact of
it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


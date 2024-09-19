Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF1BCDD566
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 00:58:07 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.9033.1726707483269031217
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 17:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IfBq+Au2;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-710d2cf2955so199743a34.1
        for <Openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 17:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726707482; x=1727312282; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l+PXt1NH5E4hWyLlw/MUOoX2njNqaPJy+dELok7W4jQ=;
        b=IfBq+Au2G0NSTbnpB5TJVwddR9sgkfNkt0yEqyM17JU18RGljFBvT0AMf60a0gzFYX
         sGjmwzOUDzi0xYJ6+M/9OfN28omnQ20B1UAYGH2Y7tuj8BIjfMZ0qlzp7P6tWOwAMcvw
         6lHIyZoiY1lEnoBQ89Sk2e7s5vOHVSeg/F7g5+SNfeiJ4MHv5oAuZT5fqP+TU7AMh9+7
         9LKIV6xQ2TeLk2O40t821Gl1NVBAgEvQMTSNISHq1EO5UFDjYIiPW3093ZG0LZHwEAEK
         9PySpXy8dE2VtaSaGQrzAgugGaGVWcTYDjtnV8Zyl6kihbqJ5tiY9EbH8LxdZRU95kzR
         jg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726707482; x=1727312282;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+PXt1NH5E4hWyLlw/MUOoX2njNqaPJy+dELok7W4jQ=;
        b=SYg9vSn1F7s1hyJTFNGNReCKCxD9oy6x1iLo8lr+ThkJB1EelCnVkozF+ZAuuoaxp9
         P3jKNsQpYTT+IkhkUQTovRO8O9Cc6TgsRPqGMwIccftIj0Vi4NQr5VlRnJ2C9/cSMqd3
         N6hiBnBojnYECR9gAoa+V4aP4R1VlsW1+8LFipIOIYb4Qn2iiR1CGcUpVeaI72kkaRpV
         8RX8d97/pdZ/i+vi5JprWuQaQoTDCq6DOqQrkjE1IfnTt8aoHzH1XLJuUXFYlkuSOzWb
         w/+Fx9Ty7l7gqi0HZD4qjxtiQOXxd0+MrgKRQDfkTCqhaafDll0/jCi1EVDx/afsH9hg
         xQlw==
X-Gm-Message-State: AOJu0YxDlbDTxnquXnGr1uLJsCub2fyJ3KxLERw2waixiVlaGwhzOuqw
	eH/dxchDG4VOPeq4rrVqIWS5TTJiCOdkGXx1mxCWZ4RwMETF+PUKHS4n3zkJGJmdWBbDKJefxoc
	1wAebcBcAE4myHUaZqIi5JLZ5KOFdFWQf
X-Google-Smtp-Source: AGHT+IGkFAJosiTzlXpxAx16SQAE9pM36Y2W/Wn2UnrTgaOiC/Fbj39/GjbZS29he9m9FA+PrgsgyhBxJbnyL4RWexE=
X-Received: by 2002:a05:6830:6e89:b0:710:f926:708a with SMTP id
 46e09a7af769-711094be6dcmr17699143a34.31.1726707482109; Wed, 18 Sep 2024
 17:58:02 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Sep 2024 17:57:36 -0700
Message-ID: <CAMKF1sopXXE0pCtYV-RZHRoSVbjYfFpxd6wDxdhJhN3dYhq4dg@mail.gmail.com>
Subject: meta-openembedded styhead release branch update
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 00:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112362

Hello all,

`styhead` branch is not available in meta-openembedded repository. Armin
has agreed to maintain this branch as part of his release maintainer
responsibilities.

Help out testing it out with styhead branch of core layer and other layers
so we can weed out any issues.

Send out patches with [styhead] marker in subject-prefix. This will
help in applying them appropriately.

master branch is open for regular development.

Thank you
-Khem


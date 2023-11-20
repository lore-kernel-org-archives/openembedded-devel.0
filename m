Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4569C5B563
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:15 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.43607.1700452269158972428
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GXIXfQ2I;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5af6c445e9eso43335317b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452268; x=1701057068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4uBtDyUb2rNr6P0jOcNCGh8Db1p75gGTJT8CY0lhIo=;
        b=GXIXfQ2IrEyMvAZZ5p0WeohbH7+sznEYKxQkqnqr/NkvC2tUQ2jlz1qMHUJy8ZL4mb
         s+egR7UK0ITXDL0KGfngwmWSzEQFn6rmx7uHJLihDHAnnroG3gU6NALNgCijPbgFTYAT
         sPdBa69jAw/Z49sDi/FvAoQtcxTlDav5LdmcllhmVEfN5njGrK6Huf6tyshwjt+OyS9q
         5sJsw4MKHTfaLf9eHQbEXP+sZXgO954mpQlz2gQcYwVzOSb3NFKlrtecb5b1a3CIng+N
         jelqgn5rjH5hde8RDfVqnDE0dIyKC7zzUJ71qveu4gjrytpTvt60Fwu0MCMOwBtH1tjG
         eeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452268; x=1701057068;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4uBtDyUb2rNr6P0jOcNCGh8Db1p75gGTJT8CY0lhIo=;
        b=gny4NujVngioYVjghcNZYfhslTN+Kqmon67UPPeVgAl1x6B6E5zAz2Sq+GeSLzqUfe
         /IX24coLQdqKlA2g2n78TLArljp1Oc86Y9r7lFhK+o6aPrUOHxCEZNHGFKLcIIlLGK9N
         kavdY4KSJS737LyL2mHUfP+EIVkAoPJU2N+u/Yv2OrCZWJLGJEtrHJMMdSwtk8ZAUU+I
         8skEcbDgwopLNjiPnybDlZqZ8lKE890tbqOEiyQQmDT94d8gdf4BM25bbS7LVEWHyfaZ
         Pfkqr62PPWCav75xQr0nWf4d74hHSDVmM5X7ANDMMiviZJNfQPf3vYJZu4g/3whHKQpA
         C1ww==
X-Gm-Message-State: AOJu0YxkjcBhgTh+tC4B3gn353H1KN5o5ym60YCGN1n0oB3GCgOUCReu
	XQtrBFVESMgY81hdsQpCv3k=
X-Google-Smtp-Source: AGHT+IHRiGjHVPSV5YtBEnGTmoC+KSZAkTu1/KSHEFnA44RBIbGRHobf+Z5z26fKoJKCAiRCNpSyHw==
X-Received: by 2002:a81:7cc6:0:b0:5a7:afcc:80fe with SMTP id x189-20020a817cc6000000b005a7afcc80femr6153749ywc.3.1700452268157;
        Sun, 19 Nov 2023 19:51:08 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700123856-22615-1-git-send-email-wangmy@fujitsu.com>
References: <1700123856-22615-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-types-setuptools: upgrade
 68.2.0.0 -> 68.2.0.1
Message-Id: <170045226738.1416826.11752033982410460471.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:07 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106924


On Thu, 16 Nov 2023 16:37:36 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  Bump flake8-pyi to 23.11.0
> 
> 

Applied, thanks!

[1/1] python3-types-setuptools: upgrade 68.2.0.0 -> 68.2.0.1
      commit: d5d19962b2ffd0b54e9b8f426556775a29e0d68c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>



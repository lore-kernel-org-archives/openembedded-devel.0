Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54064C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 07:45:42 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.25112.1750059938798937255
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jun 2025 00:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fFRuifwT;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso1027389e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jun 2025 00:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750059937; x=1750664737; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNMDe6YLN3arVb25mHGJtY6Omitj6l1ggTe4+SEaNaU=;
        b=fFRuifwTI38Qr1/JDm0kEbopupguTgxcIE/mroyX+SgQlgGo4clktcK8jGRTKGPeNw
         AEnCk4CECMuM6liQrzxHvJh3r768FY3P+0hKMfiH3jla+BbyGbR0OUJwqeTm+4vfqH6p
         fXhhb8IAKxQA3MqPaYbkRzmONlxfAOGJER8SJr+T/8K8Icpqx2EJ5zD2zxw6fhP2AasB
         85r7RYctNkJaqaGpTjYWxYtPtdehuMDeutyvwh3wdB/ibR1yP6dfWasjEZtYgDjvfO04
         xjaCSzbv5ZhDbKXmdyTJEogzOCJRl8hZZKrP8DeSzIOw/Pqm1kWwUmU++XcqQlNez8uO
         0KHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059937; x=1750664737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNMDe6YLN3arVb25mHGJtY6Omitj6l1ggTe4+SEaNaU=;
        b=dv7i+8Byzo0XhODl/vfeeuXXgtOik/k2t66TRLEEuC9HA71ZPaC0m/1L6TyLh3XWp9
         Jv2vdLEBNW0JVxelj++CC6D26xgFRTWZys5ang0+fKDiru+wmvl+CcM0rAzgjQrMAR5P
         GamJOpuwyeQzwKg3wicGpRQM0lP8fXMSfomEqSyB7D3cTx7dBRXMegmb85BDbnseiue8
         4CtyjpgeflJb6RSYly0dOyd5KSRB6xuA9j3WtGIFhZR7ZIfWSHOwbmqYEXqtYCViFqFv
         AUmyQZhkVCS5yX3q4PKrAWDM7TWWNSbzIAkpG2ofv51xClAdd4RkOR98WTijcadRmH4+
         Srsg==
X-Gm-Message-State: AOJu0YyJ6nDCaBKLlF8o/oaWgmVTFJK8ENjCdjZ4DhzxrsJfb9VSpkkR
	aZV9lVWaxQ7vYcuW9JvFEiutYsxwcA29dWuYty/wTe8tVFY3sEp0bvrSWBLXRkTcrYN+GhYjbOZ
	wfWVtaneQU5ncVi/xUizP/CpRKmc04Qs=
X-Gm-Gg: ASbGnct+yMGizG+AxP/8/gWA24Ym3xJx3Zuvz30QzKN05hIuRGZyHy5L/e86W0LDH04
	L5Ivyu49+PBcJSnNMtQTclAO/tzbodTLhPm+xYtCgLlQ0dSs5CK85nZ4lpxeKubNeI+rVa0AMkS
	bx+3Tg1VgRU2DKLQA7ltk52qzLmD5YlK/ECwElaDc8dWo81VGJap9x+CLP/oRYI0lFe6QI8FyH
X-Google-Smtp-Source: AGHT+IEbHEUH5uMHlu5KdWfAjZk/DfaHODxxJbep/vwHkLBRV2I+TuztLKT1/mBshmjJOfqovq0VCrwzw8o9LrLTOyY=
X-Received: by 2002:a05:6512:2212:b0:553:aed7:9807 with SMTP id
 2adb3069b0e04-553b6e714f8mr1675279e87.9.1750059936643; Mon, 16 Jun 2025
 00:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
 <20250531113252.3889951-2-johannes.schneider@leica-geosystems.com>
 <acd9f5dac0d1fd5b700d1a0a5b634ba509b2d3b0.camel@pengutronix.de> <AM8PR06MB752161D5026A4CE68CC049DDBC70A@AM8PR06MB7521.eurprd06.prod.outlook.com>
In-Reply-To: <AM8PR06MB752161D5026A4CE68CC049DDBC70A@AM8PR06MB7521.eurprd06.prod.outlook.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 16 Jun 2025 08:45:24 +0100
X-Gm-Features: AX0GCFubVdVjTv8P2KBecrdLdVBluH1EsE9R8VFyySLj6IYaZ2O2Py6ldcrQiQ0
Message-ID: <CAO5Uq5TCe8aQW+x4cG7JTJ-9N_zhOGexWkn5TxERFE6y5=s91g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/6] signing.bbclass: refactor signing_import_cert_from_*
To: johannes.schneider@leica-geosystems.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Jun 2025 07:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117914

On Mon, Jun 16, 2025 at 6:54=E2=80=AFAM Johannes Schneider via
lists.openembedded.org
<johannes.schneider=3Dleica-geosystems.com@lists.openembedded.org>
wrote:
>
> sidequestions: what tooling do you usually use to juggle patches?
> and how should the Reviewed-by tags be handled?
>

Try b4 - https://b4.docs.kernel.org/en/latest/

Reviewed-by - add these to subsequent revisions if you're making minor
changes, if there's wholesale changes which merit re-review, drop
them.


--
Alex Kiernan


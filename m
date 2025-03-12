Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC9BC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:02:19 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.37999.1741788137857516312
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 07:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CJQc/qDs;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549644ae382so8020351e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741788136; x=1742392936; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=437Zn3x4neBC+xCUcLE2UHJW3omN4txaE2+F70T5Qp8=;
        b=CJQc/qDsLb7czI1UggzCSwsWSxN2Si7NZq2Di8TRPSaFMlNQuiWnKDg20rU6RHIRKx
         AIIHFwTqfI9/2bN5hUflu4Sxt0PKWGkdHVKL0JOO9c3odfVI5RHAdyLIaFBe7Ns+jpke
         U5jGMC3P5HKq/E3V2XZ2ui2rLwfIVOxnzyRwmqzQr0QciX3/Wnu2XocrcQV0eELRaJVT
         HjKth7FJBUtVSgct5KjQnp726KVW/BHC36dU9EWDkKnGyoiHmZBUXUnjPblmIes3O/aE
         gsFf75vUfWEY6+Ei0AJvOc9x+OuRTIygDwnu68olezftzDrLXagDZhVk9ISsc7YTEPV8
         jakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741788136; x=1742392936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=437Zn3x4neBC+xCUcLE2UHJW3omN4txaE2+F70T5Qp8=;
        b=KqvJLtBqqPcHQ1MsKKMTxjZtgbYPBjmIDHBhv/1USv2U/ury2isRqHG9bkjGSyBtxT
         9HOaah7h0NT4SH2pAlMc9h2en0C8y+XBC2BKWainS/BLqd91c8VPbcTGZPJCAcJbwCZL
         sut5lA9P94gXFk+kVKfDjE903J2Nok5LOcbuHLcQ3FVLpJcUIEdvQsg7cqp/vjonfEIW
         jVxlrIFVGd0qpd2qAvTm6okFuK/qyncLTnK4Gm+06B76OQl60xCIbFJ6W+vqYl1pErwO
         wgR5fQySLsgvRXuk6tU5YVCPTxFxVSZF9BLhi/yVI+Sd1YyZ5TWqmzzVq3/NqJhTe4t1
         CO6w==
X-Gm-Message-State: AOJu0Yy1NW9JhvYsf4hfNJnmpfVZZIWaSNCod6rclBkz3fNMYvueIOdI
	CnDpW/fawzbxJc5hd/3BnRkd8+qEHEwJYoG2kyiMGA64aAq14RkDXDncNsSrCRo4yiDx6J6FjPs
	fpsg7Iv6TRCH28vT0j4d7Z4mYyN0=
X-Gm-Gg: ASbGncsEZtDZ1IdoHDnc+5rXhGvtPmsZymfbxyr1MLWO5FhmF380+jw4OGfZrtGFgcw
	GUjxYydiEOQl6p6JY7wp+GpAB1fGlGq+AvI13qMhH/2iRCTctJD8BROrl8X7S5n2PTMehZzV9FO
	bBBedmJlmE5E+nDXweXM9X5LFQuR1/lS5X2gOoXirK8eAdCBc1n3qLXi/Piw==
X-Google-Smtp-Source: AGHT+IES9MRtVBJGIf3uaFiDmcTHRHJ1Tz/y7CI96FKA+qwRFJjbPQ679borrFKUcnbPg+cs5kYVM3GySsyQiNz0Eyw=
X-Received: by 2002:a05:6512:3c9e:b0:549:5866:6489 with SMTP id
 2adb3069b0e04-54990ec654dmr7358475e87.47.1741788135371; Wed, 12 Mar 2025
 07:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250312111915.2970032-1-naresh.solanki@9elements.com>
In-Reply-To: <20250312111915.2970032-1-naresh.solanki@9elements.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 12 Mar 2025 11:02:03 -0300
X-Gm-Features: AQ5f1JpciHVWFRomOcoZuMN99CiqjtQxpLaObbaR3c272u59VIpf0Q44vUTW2lQ
Message-ID: <CAOMZO5DaZbRXuv4vgWk9evNcV4iW6gXy2Vjv7oWsnMo_R9ku4Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-openembedded: flashrom: Update to v1.4.0
To: naresh.solanki@9elements.com
Cc: openembedded-devel@lists.openembedded.org, linux-kernel@vger.kernel.org, 
	"Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 14:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115924

On Wed, Mar 12, 2025 at 10:52=E2=80=AFAM Naresh Solanki via
lists.openembedded.org
<naresh.solanki=3D9elements.com@lists.openembedded.org> wrote:
>
> From: "Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>

This From line is incorrect.

It should be:

From: Patrick Rudolph <patrick.rudolph@9elements.com>


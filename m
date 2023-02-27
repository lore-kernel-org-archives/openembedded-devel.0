Return-Path: <kekiefer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2F5C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 16:37:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.95098.1677515845017885943
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 08:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bffemkkP;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: kekiefer@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id bh1so7278713plb.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6G824SsO13BEnLBZy4EhNjEHo0EB9Zcb5SMaXhQ3dU=;
        b=bffemkkPHJ8Wxb1q78rroVG04MJQCP9b7qfkNWfp26z8DaSpRvYmYwIGLOsj+ncS+V
         kx0+Oc18jPM5GSZUNap91F3mon+uLUcm3AzXXzRveWdixTW7pFHFHSMdxmsAf5mTqZ5B
         aY4qLx4Qf5onyRdFnS2RsDGS+I/HRwZoMBmKsuPkQz/ryExe+VhXf/I00W1qh2A5d/cK
         83O9kemcrVh5fPcGBke7vqIrIUtjfCGYiX+QfqESgNHc4AKNsPzwvnmtulNzrk5kQDu2
         bpNZMKEN0WoDgpTA947mG2lFX20Sn3cxNrgHDwEcDV/StT3/mfLevj2mG6PYg20iRypS
         8fWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6G824SsO13BEnLBZy4EhNjEHo0EB9Zcb5SMaXhQ3dU=;
        b=oLMK6LSli2rlsWii23NgUpwsstugcoGCl/v2JW/CVz7KrL+3DkcmNCMCwi0/GOqbrs
         e6j1XnRQXjhlEzuS6BXOUQRLJq7+WFNUrh5UK8wEr6djJ6OW0Dzmz5gEA3R+zM3Ny3Bu
         c49yaFBgMGtSkZuIrRRx/MNe+H8XImwR1HKYXSHoJBwFk8WNcJ4aY+QAlTiLCxrvbg8A
         J+oUTC13QMHzCS4EKt4WMmh1RMnwpqIHNkP4iRCBqiGTGapR7RBpXGCexoStxRDrsyUm
         cWoMvXAflhMmXHxD7zAt8GeJcBPjPCxtfX8t9dkz31vOEBwX/jueFuS8qQ5/wEGk66V9
         ARwA==
X-Gm-Message-State: AO0yUKVMEEPj0GieS/MD/m5Y85Lg2a4eOwf4ZUfUCkD9YlEABMt7WXk1
	OS4JM4IMOAkeaSb+oq5xYELqOv740l9QhQ==
X-Google-Smtp-Source: AK7set/ZMAvVw61a0hVuOSODnOvh47Pp4S5eJwFaS4Ubnj06wUQiAZrVTYAWckpI2d/OOp+bAZD0Wg==
X-Received: by 2002:a17:903:230b:b0:19a:9833:704 with SMTP id d11-20020a170903230b00b0019a98330704mr30724047plh.61.1677515844031;
        Mon, 27 Feb 2023 08:37:24 -0800 (PST)
Received: from smtpclient.apple ([2600:8802:570f:cd00:65f7:639a:f820:887c])
        by smtp.gmail.com with ESMTPSA id h191-20020a6383c8000000b004fbfefd5183sm4270084pge.80.2023.02.27.08.37.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Feb 2023 08:37:23 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [meta-python][landgale][PATCH] python3-pybind11: Upgrade to
 2.10.3
From: Kurt Kiefer <kekiefer@gmail.com>
In-Reply-To: <20230225195655.3682899-1-kekiefer@gmail.com>
Date: Mon, 27 Feb 2023 08:37:12 -0800
Cc: Khem Raj <raj.khem@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1C6BD3D0-0517-4B0E-80A9-546BD4FDD80B@gmail.com>
References: <20230225195655.3682899-1-kekiefer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3731.300.101.1.3)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 16:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101297

> On Feb 25, 2023, at 11:56 AM, kekiefer@gmail.com wrote:
>=20
> From: Khem Raj <raj.khem@gmail.com>
>=20
> It gets pkgconfig support which is required by some dependent packages
> like rwmem
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 5c455804aede17e0ea0cbb7ab55f8580f912e664)
> Signed-off-by: Kurt Kiefer <kekiefer@gmail.com>


I would like to retract this submission. I'm going to resubmit a more =
surgical
patch to the existing version, and provide rationale for why a fix is =
needed
on langdale.

Thanks, and I apologize for the thrash,

Kurt



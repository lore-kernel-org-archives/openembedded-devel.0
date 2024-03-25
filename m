Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF311C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 16:51:09 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.340.1711385464435517961
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 09:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C3/B5shl;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2218da9620cso2613074fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 09:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711385463; x=1711990263; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O010wsrS8IigzmHt4hXaeCz8+7HzkQsknQ3GFp/Kx9I=;
        b=C3/B5shlgpr6ItY996ad5BMNtY4ep9ZOVbLtvQidx8jer/CP4Uvg1GynbsNHWtIiK8
         xK2crD+t+dj+qJz8DcwNKQ441STSIpm66r+nn5ZzfbQ4aHhkoF6yHZEOZqm/LLSb3vuX
         m5WPPw22rIDvbnp7v1XwPDq+GBVpzohOmptODX50veWIcSBBfBIkNdMJBuzCx3qpu7vr
         rST/LJVRr+QnHg0eYI0jy5FPBjghqRfvUMNuGilmHiOmvzSyubAv6o+IV/UUW+BIFai/
         d70hGM7c6/vtw7JXCOgjD+UjYlECZ8T7oT9ziJou0zkoK3oJQ1Y9WxIsmPlWE7qe/h1H
         Cwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711385463; x=1711990263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O010wsrS8IigzmHt4hXaeCz8+7HzkQsknQ3GFp/Kx9I=;
        b=QYEjhUSSykqiIQUGk6yZEZ+1aoRuSMj6777IawMkrdfHt8Xj0CN4ogu76jf6q7q846
         /sQ7pc5boCb1UDk5d0rA/zlvPXZMh4KGNZJBjysmI1ayeYmEr4PNRng9Ae9U4qd5S+7p
         kB+3GRgwcT/7Z2CE2PMtyB2e76Y1vN1CH/RdxeuMFdmtyiPLm+iDTLDqVLMmb98qhFd3
         I2W0o5KD9YnfZpM8/ja/9SoBBDfq/TL3wDKjlDiHzZ18oxpkqgOBXKwi6hxe/gef/gmw
         u1o6PHtSZbQ/JJE7yuj193IYqpLsvxpr5rX/h7ev0tlHl678sQQ758bXPKnNf6vMR+17
         HDng==
X-Gm-Message-State: AOJu0YzBvplE9Qby9qjChw7jp0RLMV6lUGGJ5OqwPDaVJPB+9/ajFk0j
	DHTU8r4DV50K/UCipy+8DIrinHBEP5Fq0U6mH3UfMDSH7d5JM6AP7f39Pui2TP7TFm/UO5KfhGX
	H/tY6uU60Z0xV5sN5SOFPLaV2jcw=
X-Google-Smtp-Source: AGHT+IH56x8YqQZ3T6cg7wFCSZufO8khj39VuzktbflQwIYSKMGJMOmrt1+7qXjptBZ046DTUq+AvkuhBxLeVbH/5to=
X-Received: by 2002:a05:6871:31af:b0:229:800f:3ed6 with SMTP id
 lv47-20020a05687131af00b00229800f3ed6mr6626090oac.36.1711385463642; Mon, 25
 Mar 2024 09:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <29470.1711345175727733393@lists.openembedded.org> <29470.1711374964855578067@lists.openembedded.org>
In-Reply-To: <29470.1711374964855578067@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Mar 2024 09:50:37 -0700
Message-ID: <CAMKF1srWVvy9tME92yc16tPVRyjELep1m90ew+ev=9+dtgY9+Q@mail.gmail.com>
Subject: Re: [oe] [[meta-oe][PATCH]aer-inject:add new recipe]
 [[meta-oe][PATCH]aer-inject:add new recipe]
To: chenheyun <chen_heyun@163.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 16:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109595

there is another issue

WARNING: aer-inject-1.0-r0 do_package_qa: QA Issue: Recipe LICENSE
includes obsolete licenses GPL-2.0 [obsolete-license]
WARNING: aer-inject-1.0-r0 do_package_qa: QA Issue: File
/usr/.debug/aer-inject in package aer-inject-dbg contains reference to
TMPDIR [buildpaths]

Please look into these too.

On Mon, Mar 25, 2024 at 6:56=E2=80=AFAM chenheyun <chen_heyun@163.com> wrot=
e:
>
> hi
>     i fix it in 109586=EF=BC=9B
> https://lists.openembedded.org/g/openembedded-devel/message/109586
>    thanks=E3=80=82
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109587): https://lists.openembedded.org/g/openembedde=
d-devel/message/109587
> Mute This Topic: https://lists.openembedded.org/mt/105119602/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


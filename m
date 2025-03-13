Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F14C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 15:48:41 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.18255.1741880916995495666
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 08:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e8ygcZ9z;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-728a433ec30so1111958a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741880916; x=1742485716; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hHQBeRR7KQ7jYKWtbnk4J2F0nJDlYVggIbk8G8sNNM=;
        b=e8ygcZ9zvD3d3ci3AHdseuTrjtqKF9I8j3aez4kWNLKF+aSirLIpkufdBDovZUKRxP
         Z3Zi62wv4NncOMJRNBmNNGOd5mkRVosyuLHRY/YmSOAxiCZL1r27AOocFbWZQpZyRINL
         j5z6UQ/XBH3XFMcbFRl1CRUanVlxq2iEIxWs7gHgccoWTjEFbDeOnCF5kYD21LzWtinN
         0/wk3VD9EATyNdGGJXjdgDfLRwh4A5bFXNRupy4KcnI8pWElJRska2pbjffPI1qYzMRm
         xyEwehSjjlBN2KhLnAgEawuSYg9Vs7m3+eOSIX7Btq7Kyot1Y5v+mSLl1DOTPisqu/tZ
         TQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880916; x=1742485716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hHQBeRR7KQ7jYKWtbnk4J2F0nJDlYVggIbk8G8sNNM=;
        b=ojgM7FRTw79ydf7kVpklfhLmhAfPfP0+P65cXVusfernznP4it8hZsf/MSkGqIN7uc
         x8FEPtIU8ldlN4DpVZ92QVJu47979dQ897G99t5e+YoNTmu0J2DUXFN0ZS2iGxeYjxNa
         FYhCxY/KbbHr8S4k8NeMhdtinz6J/6P2CaekhlpeiXSDK3bWFfM11XMSY0Dhlx3IvkUM
         kdRKOTKuD9IvGV+PJgWu+z+yd1YNR4LwhRVYY7LbUv++/7KmDGiDxVEqeAwGUUPLOsj/
         QbbtJpTEuFaOyEJbvH6Edfn8SNcwfw26btKxROfrpC2v/0yd/4RzoMr483yI4IbEQ7SS
         AUAg==
X-Gm-Message-State: AOJu0YzHQw5qk9GgOGZlyvtpIi1cr7c9mphiBmkznsBiOVs0z9p66m/r
	ecXYMO7rXX/g5Qgi9hg57RsqKKbTXl7ZkXoWTkNqLxcVtidDva3BTg/j5z58Ny0z7qsSOURRPg0
	zjrQmpKt0grhJ4UKvHyN6Ye2mZnI=
X-Gm-Gg: ASbGnctw0eemYevcE8gAwU+p+VBKbQi6p9Ka0f4hKVOQQFc9P+S6AaPTH/2WsiVuEQO
	o4+RSZ8UHHDt56FTpJXdRDp7Mplh903RZ0qK9pdgug2eWSb28CiX0WkAcV6nwp1/i3LleNlQ4RR
	RwkH5sCP4QcD7CQlDkjmh2IoER0z7epDAS+yVzHE06
X-Google-Smtp-Source: AGHT+IHbHlcnsyRDMud+/n7IikXfOg0s0AuBXfWC8rgtF8xwTPvW9d3B5ybbFnhH5b5EsMC6prWqlItm9boc/M7bC5M=
X-Received: by 2002:a05:6830:6d85:b0:72b:9965:d994 with SMTP id
 46e09a7af769-72b9965e590mr7419911a34.23.1741880916179; Thu, 13 Mar 2025
 08:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250307093255.1110778-1-awais.belal@gmail.com>
 <20250307093255.1110778-2-awais.belal@gmail.com> <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
 <CAM=5Amb6u5-8pmud11do97X4UAwLToizR9SiGjPD=4+Zqet6Rw@mail.gmail.com>
 <CAMKF1sroz=jLxp9PfMkZoQwtRjyvDZhK15kGLS32q5vu7dxcHA@mail.gmail.com> <CAM=5AmYtt81oiNVQqYMbu--Z0vTfGpQ5eHUpdJeV2KqoUdT4Ww@mail.gmail.com>
In-Reply-To: <CAM=5AmYtt81oiNVQqYMbu--Z0vTfGpQ5eHUpdJeV2KqoUdT4Ww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Mar 2025 08:48:09 -0700
X-Gm-Features: AQ5f1JoyYWdDtIiU-c3Muv9wJCE8wqrOg4OvdDqmw2nFV9Acx7yOHHv7-8dpQaI
Message-ID: <CAMKF1srDnbOc3LGOJ0YBVNGbxJ8-7bzSZMowWZ=WuONeFbvuiQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
To: Awais Belal <awais.belal@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 15:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115976

there still are errors see

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/452/step=
s/15/logs/stdio

On Wed, Mar 12, 2025 at 11:51=E2=80=AFAM Awais Belal <awais.belal@gmail.com=
> wrote:
>>>>
>>>>
>>>
>>>  The changeset was intended for scarthgap and I haven't made sure if ma=
ster builds. Is that a requirement? The cgi module was dropped in python 3.=
13 which is what master is following at this point. I might send a separate=
 series for master once I move on to that.
>>
>>
>> Patches are routed by master to release branches if they are needed in m=
aster. They are done for master and then backported
>
>
> Hi Khem,
> I've just sent https://patchwork.yoctoproject.org/project/oe/list/?series=
=3D32428 which coupled with the changes here fixes mongodb build for master=
 as well. Kindly note that the other series (https://patchwork.yoctoproject=
.org/project/oe/list/?series=3D32428) is not needed for scarthgap.
>
> --
> Regards,
> Awais Belal


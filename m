Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAA2CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:34:29 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.8047.1755250466856025955
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ib+d5akN;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7af30a5so292529566b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755250465; x=1755855265; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBq88c/lSxZ+XXEsu/RwGpq+seKvBZk0eIykDuvvF58=;
        b=ib+d5akNZH7HsRJ0pvyadWEaj3tWGPB+O5QC0AC3LCe0zCNdoQcjWZ9XqY9SONtepS
         5OEy0SRINmwt5so+1eLc4/O1YjsTsCe6ARYjGUyU+x56DzwrJoSbi0wb3w6f5UyabdCL
         k1yJVMq4fm4Kung+Lg84RJsmO7DD6hi26loUhKzr9NoUQqpEJt+wDtJHz3qOp6rG+3EB
         fk3BlTQ1yjFQXPOQsHaK3odRiqhjGOPz+0eiyW5P1LtKpeGP4MSD4nXOfXfL0jgXdTB5
         EzT5VJGboaixhdijwuW22vUlweBW7aN9Xqndg3SD9NxYJG9ojhaK+X2Z+OW5S04psW/K
         j0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755250465; x=1755855265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lBq88c/lSxZ+XXEsu/RwGpq+seKvBZk0eIykDuvvF58=;
        b=EQkBRgy8tMHLOhaesUQwe26Bn1rfqX9dYysFVFupLxQDM2isSo6+JJzI+q7js3qlVh
         GUWCITx5b+9t+HkzdjEVeJgeiiMceXUyH+cfe4gltbZVDlELIGySPOPccFkDnJdetLT9
         ZOH9n7iCfthWCE3Pl1F+3g7IhrRheuVWj+UFsPMNrpIsTGmovzoaxVvp1Q6yss355YUE
         57AIMFtzsidZO4d8GswiquBaa41ydSwveLMZKVTZpFvldCFxZE7E3+v+yphE9Qp9lPru
         rxeqRNH8o8CORM+eqdzIH3PZ/at8Fgw9R+fP7X7reaT5/AJzib/E343zrfwP4f+OpLS5
         2Y2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX68mWrWPJr0H5ldAacLsdbz8aADS8kj1jCSxHxi2k9Obm58j9oh38rHLWFZqoCAjUIjy9MWmhr8Jzc3CxW2Op/kNY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxs9NxvJKZjBJtjcm1U221++455IrmWv/598xaDpOaY0HTKOtmA
	gqvz3TMzM35ofKAYx5Kd9deu6+56qYjNudzn+R2VRfifCDw+qqjk7B2U2294N758
X-Gm-Gg: ASbGncuadyehYhxH4+X6kPwEdTWkx1Y5WLEy2BC4rDUnWcr+yQLQJRk9+g7aOuZ+XDe
	ZEFGggj5iL/mI2WcXdr3GEI6uv9rZli6rRlWHvQmCK82vFMGd9Uq4zsWbuH19JXFXzvQT/SWu5D
	/9sLmBUnR0rO9ZSF5vqkucCVBXqjidc1kKrvIzc2i47KLLf8OdbLbfaPo86eUxsUTfRcNfwr48Q
	TmYZVnTQK4oARqJDL5hcP4SRZ5AUGq2xHUicGq8Q8aZm31lYer3nmIsbmuAXmH4WXXxXZyzEh8V
	t8mlJLpnmAd4+MzZRc0zRnTrGdIHod/PKQE5/MntB1+Eaf9VuGAZ9jEgYIelzo9JK9bfywRODAt
	SdPL+NzTBasNsDAAv2/JGC7YbOcOoGA==
X-Google-Smtp-Source: AGHT+IHDEZWxTIdFfsx+CYggMsrHL7stQS2fwFElpk4q9hHmNaMkBBjfIMzYX+eoJpWgj8sLGyQPqg==
X-Received: by 2002:a17:907:3e11:b0:ae3:cc60:8ce7 with SMTP id a640c23a62f3a-afcdc1d3847mr137526766b.19.1755250465059;
        Fri, 15 Aug 2025 02:34:25 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53e25sm105876566b.22.2025.08.15.02.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 02:34:24 -0700 (PDT)
Message-ID: <4228dee9-3943-493e-9d76-8e41d2a6b086@gmail.com>
Date: Fri, 15 Aug 2025 11:34:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
 conflict by using SRC_URI.
To: alex.kanavin@gmail.com, "Lau, Karn Jye" <karn.jye.lau@intel.com>
Cc: "peter.marko@siemens.com" <peter.marko@siemens.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
 <AS1PR10MB5697355DC7874A906AB2E20EFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj9bSkBW1DRgHe8JDvYxgsfjowYCAg8RCyxSi6pVtwhJXA@mail.gmail.com>
 <LV8PR11MB8699B8D2F8167A3F836B80F5D734A@LV8PR11MB8699.namprd11.prod.outlook.com>
 <CANNYZj_eghchJhG0DmgF=nUUrCuaq3okE1GUYCCtZ8FbqNs6Eg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj_eghchJhG0DmgF=nUUrCuaq3okE1GUYCCtZ8FbqNs6Eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 09:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118967



On 8/15/25 11:29, Alexander Kanavin via lists.openembedded.org wrote:
> On Fri, 15 Aug 2025 at 11:21, Lau, Karn Jye <karn.jye.lau@intel.com> wrote:
>> https://github.com/openembedded/meta-openembedded/commit/6dedea42620332987d92044a7e8c8e85fa07c107
>> when this changes was make, scarthgap  already unbuildable
>> unfortunately it get bump further to version 3.6.4 regardless.
>> https://github.com/openembedded/meta-openembedded/commit/2c9126bd0dd0f62021f5db34d698489bb814ebda
> But how did either change manage to land in scarthgap without failing
> in testing at any point? Something doesn't compute here, especially
> because people started reporting the failure only today.

I can only answer the last part: the merge happened yesterday evening,
that's why the reports are coming now.

>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118966): https://lists.openembedded.org/g/openembedded-devel/message/118966
> Mute This Topic: https://lists.openembedded.org/mt/114713300/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



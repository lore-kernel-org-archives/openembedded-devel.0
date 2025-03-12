Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457FBC35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 17:07:56 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.122.1741795431819073490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 09:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=K4s7pAIs;
 spf=pass (domain: 9elements.com, ip: 209.85.216.52, mailfrom: naresh.solanki@9elements.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fec13a4067so66242a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1741795431; x=1742400231; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zepZhP3iRgu7VCHTnXMvKSWtEDnWV47OgGyOqd5go6Q=;
        b=K4s7pAIs8qB/IPLkjN3dzH0LjmGQM0dC3RGLl3UsI/nheX1JAesG5QcARswT/XaK5G
         9VRLV+go/6MZhHkOJrNbB6zrcNsCNI4421Gu0CTavdAENLvx+yWRjXY331jl0gj7I4q2
         Aj+2PEIb8wtncyHdIfAiSw4H/7YVDIwEQWq6L3uY70Ac9ec2OjDg7VpmIompSNN+mQf3
         YfhaXWYTzrAg06XBuLaS8VcxJW47kjyQN3vMaAHtOE2NxqUuWrK2hXVTMvFIPTf+V+SR
         +irMzI8tuxtapaH6cVBaRkpanMn0S7d2h11uMI41ycNQTme0yGXSyfsBjBkhGzcAlB1I
         BbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741795431; x=1742400231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zepZhP3iRgu7VCHTnXMvKSWtEDnWV47OgGyOqd5go6Q=;
        b=QWTFn1ywEUBjVGU4NsfCWNBP9caKc5pIXLtuj9LjVd4yZHCN+bWKCMiq6Yho57Kiny
         cV7X07CyB4PGvTJkqQjx3VbcnZdSBvKh0FSKeGS0w9FspEoEvg1Bkf6zxV61o9ywn0b5
         wNlYlIOHfPwlhhqdtlZqVh+N9+gKlEq7CDzZU5aUZg57XVnyNvCLmpAOTk9Z7XvNyTWR
         S8M+Q+iFLgtvAoF31hOoarJoQWQSeGBSKEyAikQaH+IoWUP5o61CjjzC6P7eodvvYzMt
         x/GD+Dy4rNbEbD2G9PYIjsoqpN+x7y0JEeyTbXv8gtqLXAj9NIKCqf7wX1unx+PcFXdd
         L5BQ==
X-Gm-Message-State: AOJu0YyHGWBR+pVr4VzI25t74V6FrOOAtAsAUQY7ZyUVSu6hCYydiCeJ
	5cDgAH9S91DBal4LDTjxhgjqWl8zntD7BBp0363zvRyV5pLV8zJKGGiWzg+AsuqevkEu34JUmeq
	xYg7q0IVY7DjqqgjJOBZGpIoocRNfXRKKJfL3Uw==
X-Gm-Gg: ASbGncvNThyKDhpDVn4Hrxlyu8+iCwW1CnznE6w8X1ULvgV0rDLmbGUiVfSPu9FB+0R
	/LH825+65dscR5X2jhYw9Pd03NlRnRWV/qdVnCzGCCyaNK7h7J+1tMHt/g6yDctI0LAMtQc5Ud6
	tv9CFDbAdF/c+n8LFFvb1EswFgcw==
X-Google-Smtp-Source: AGHT+IEf8vqxGqPhkQcc+WtrBu7Tpvs00r93QHKClgJq3i01gR0qdZRbJLqJ0wVixMhZyzimw5pfDjPnzxwpUS88S38=
X-Received: by 2002:a17:90b:510c:b0:2f4:49d8:e6f6 with SMTP id
 98e67ed59e1d1-300ff0a4293mr10164785a91.3.1741795431274; Wed, 12 Mar 2025
 09:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250312111915.2970032-1-naresh.solanki@9elements.com> <66b24018-0b7e-42b6-ad86-d80f37538678@gmail.com>
In-Reply-To: <66b24018-0b7e-42b6-ad86-d80f37538678@gmail.com>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 12 Mar 2025 21:33:40 +0530
X-Gm-Features: AQ5f1JqhE-2C8PQWLBe_GyQfLe2vWf7oUoGv_nnpjpn1XMv_BWlTtG7j-X0Bh4o
Message-ID: <CABqG17im5hO7xv-r16mFhJwcXyXt-6OKA_vTaRdc7kuQrdZyzA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-openembedded: flashrom: Update to v1.4.0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, linux-kernel@vger.kernel.org, 
	"Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 17:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115933

Hi Gyorgy,

On Wed, 12 Mar 2025 at 19:47, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>
> On 12.03.25 12:19, Naresh Solanki via lists.openembedded.org wrote:
> > -Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/51960]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -Change-Id: I55c4e8529d36f0850dd56441c3fb8602c5d889fd
> > +Upstream-Status: Inactive-Upstream
> Is that really the case? I mean it is just being updated to a new
> version, it doesn't look that inactive. That PR seems to be abandoned by
> the submitter at the first superficial sight, is this not the case?
Yes. its being inactive for long time.
> > +
> > +EXTRA_OEMESON="-Dbash_completion=disabled -Dtests=disabled"
> Nitpick: Could you please fix the whitespaces around the equal sign?
Sure.

Regards,
Naresh
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41747CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 06:13:44 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.6151.1758694423626651130
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 23:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZMQ1LtE3;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-ea5d1270b56so7132493276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 23:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758694423; x=1759299223; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCeQlDJ8XYUq/Og7FqpIdkyn1Gu6gMBas9JWpo+F1qo=;
        b=ZMQ1LtE34qfnwzbx85xUPGqnKcOSkDJv94N6Tz+FSFXua7y6kTEZZL6UKUspN6lSs8
         0L8+FC7kQKxb6uJewSjraAt5/swyAXq1ENXUXjZfjafm0OouJzRLkkY/DkmYKV4fCCKF
         1t0yWgzLtJrHluMFwU6QJhIY1YA9gLNCgJ4ZexFz+UCwnfZ2oFwbIe+rMgM2XZixRTsy
         Qbixzy5iVoAM9OxP0SYOc7g3sT1AhQcwU8bqfVoEvARf/8si9IVI6/8qKoLQPAnzW1vf
         AvV6B86A71gK9//wvF0mr1S9Rv+p3QNV608FU/DbZdVoCSBK8WihhZynaLVyl5ulJArc
         GWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758694423; x=1759299223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCeQlDJ8XYUq/Og7FqpIdkyn1Gu6gMBas9JWpo+F1qo=;
        b=Wm9FdABhxHy4kJv15meuuz4SLqm7Tfl9FqsmwVaDNFL2cr99P/6dxvFqXinOrKkc+S
         G4kEng4W8j5XAWdUdzPQsWGeHEJyiUc+6aOGhvDSjLtL5wX3WlKckjCE+1RHtyYJpNd0
         mvIjA2Sp6XHJHs9wGQvTKRES48ilRPc1fS2lclY3BlHm2ml34bl9XR6y0geVO6MY8n8m
         HaQzgqK9MMTKmrf3sxagiEQxr7+m/RpR3TaUjNooTb+SG5mjs7FmgCeHBg3tMZi+nlCC
         nFDkf1o3zgrqGlGfmjPLc0uMAWtdSUAsAPoi8XR7N5GfwEpX8pEnuD3wnigXLO9zIZ/O
         AZzA==
X-Gm-Message-State: AOJu0YwqDKc+EErVCr1yltJmnN5z8qZ93cFSW3SYwRlFH9d8BbCKopLl
	uJcXKqMw+ioRmhAeI69MnOUFHtL5qbbl/aIm82jzk+2mT6HMMcq+37GSqI+X06NLaGnHdQ/lfnW
	ECEsNWMx9oaEaQSHKbIxJuTHjK9nY9so=
X-Gm-Gg: ASbGncvNhz5Yw2exiEmQ7lcIY3hxRiL8rSJX+49k1shkbaDN6THfp5lnXFEZqyDnNua
	W2HSrwd8HCcqXE+m/Q/sc0jdYsLCVcMF825KSKqhAqtHT6ZKM0jsVYxVHZb5FVrGOgemREq1xNO
	DE6Gejy5J56bYQz1gqNUzTpCRECmqfq+jJNqECHM8mrCdTKceE/WfrZh1udi4QY02QXTfPb+LcE
	UbQfAVtj4/KMmFTNtUWLncFKdKqbE4ATf1ZeQfcQSHtmUkswUY21YAmlx5bYbdMlIucUcmS7DdO
	KgDpz4mB1DgkeKJ4r/+V6/nTvGaqoA1tt9TNgeI=
X-Google-Smtp-Source: AGHT+IEQq5o9fcCopfcgYRu1k96VrtZ5ZGe0bXV4zAZc9ZZ5bfPaQAQ2c9MUYfqqIY7/siuWYMX7PPyS6AnDhKyx/oQ=
X-Received: by 2002:a05:6902:4009:b0:ea4:1082:95d3 with SMTP id
 3f1490d57ef6-eb330773ad5mr4062540276.45.1758694422778; Tue, 23 Sep 2025
 23:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1758626365.git.anuj.mittal@intel.com> <6def8d74-347f-400c-94da-1360b625013e@gmail.com>
 <7b710a5a675f5bf2fbc5a1f5da6a770a5f4c7ab5.camel@intel.com>
In-Reply-To: <7b710a5a675f5bf2fbc5a1f5da6a770a5f4c7ab5.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Sep 2025 23:13:16 -0700
X-Gm-Features: AS18NWD7olIWeLRlrXWwmowA5fPLhC9rzB-DMu4ZxVSjLMwA4V-LNrwqxBFlZHg
Message-ID: <CAMKF1spavqjc0fFnNS3y9n8OQf1phdcd2A74dcWTkRcBZ=RfNQ@mail.gmail.com>
Subject: Re: [oe] [scarthgap][PATCH 00/24] Scarthgap pull request
To: anuj.mittal@intel.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"skandigraun@gmail.com" <skandigraun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 06:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119751

On Tue, Sep 23, 2025 at 9:01=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Dintel.com@lists.openembedded.org> wrote:
>
> On Tue, 2025-09-23 at 16:46 +0200, Gyorgy Sarvari wrote:
> > On 9/23/25 13:57, Anuj Mittal via lists.openembedded.org wrote:
> > > Please consider merging these changes for scarthgap. Tested with
> > > autobuilder and locally with qemux86-64 and qemuarm64:
> > >
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/94=
4
> > >
> >
> > Is this the correct link? This build has failed.
>
> Yes, correct link but I should have added more details.
>
> It uses a custom configuration that also attempts to build world for
> qemuarm64. I had seen these failures - they are not related to this set
> of patches, so I didn't want to hold the queue and was planning to
> address these later.
>
> But, I've included the fixes for these failures in current batch now.
> Latest build passes with the patches I just sent.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/951
>

Thanks for adding more context, I am fine with this patchset and
thusly installed.


> Thanks,
>
> Anuj
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119749): https://lists.openembedded.org/g/openembedde=
d-devel/message/119749
> Mute This Topic: https://lists.openembedded.org/mt/115392513/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


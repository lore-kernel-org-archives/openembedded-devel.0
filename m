Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 447B579803
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 16:54:49 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id b15-v6so28422784oib.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=khFxYMMjU+dq4KXIA6wChpEf7Ot2BaAzNGaY1z+3tFY=;
	b=jpOhmWwLs6YlVR8c5QVBSgcxhOsdhHui8s02DgWzlbMSxDM120xvIgxMl65tGaghsZ
	5agvQviNAknZJArOU+gUL4/VebrLwO+Sn/bGOCn7hLTQHWTWZRzmHIh3X52n3b046Uom
	3rC6VcvHOkJFOd/KgXRcjtN5LGrwihWRbpmV6UePq/fChcq/9/NTfdN/PWmIKWKYZ4yb
	UOGUbolUKZcq8yVneMQ2dDk+Y3EEpeGoTRALxcgWWJTc1+zIXd2B5Er8jIPjrx+X1YP8
	HV1SF+TisUIsuDC90ICGRsji2oWfs6J01mmGr4zx4RJQoC3Ki3oOErGOGk8eOe8i/Iua
	nDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=khFxYMMjU+dq4KXIA6wChpEf7Ot2BaAzNGaY1z+3tFY=;
	b=RXk5BxsGqqb6zfiOoQVxutvY1752kocFiNzcF3K118FNkwvRE1PcwFzqwRBcxsvsl+
	zCu75p1fAXQZF6JgY6Fr7a/pxwP2oeVMZRdTo+5HPo0FYF6x7vbeHkMvQXy6qsurTedq
	FN9qtzborLmZowEFL6/piEaaQqPVllHfpO9knSZUsnUJ6pqZHbL5ljfR/7uEUGl+RRQh
	FPj/Qtm8MMMcd2vCalCqdwHAV6ORJtXYZlBjNQOLr1gTUR6nGOnQqYP4gjj0eUdDNMWN
	PLM82jjLNOtMTntVVCkkvz1dYHMQgvTGOVYEbxK03DH5Z8yy3fkmrVHuodBaRILNCblb
	WRHA==
X-Gm-Message-State: APzg51DD/OrwrLa59LPMcBxASzht0gNHJbNtJEieqZDE5oBnVFOAVVxs
	1ow/LNY192sFFS/dzVuO6XWF0aro5+tcdeFzRgA=
X-Google-Smtp-Source: ANB0Vdb3s6xOlA9x34meqLLqp3e3IZhRLBxmczgghBosN2+A1HxAVgfXiatpeinNEwJKfb84bC7Wgv6Vn0Pvvinx5g4=
X-Received: by 2002:aca:b154:: with SMTP id
	a81-v6mr9618143oif.34.1536339290204; 
	Fri, 07 Sep 2018 09:54:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP;
	Fri, 7 Sep 2018 09:54:49 -0700 (PDT)
In-Reply-To: <CAMKF1speuTVVk+o9svpy-Chudk18WGvMcvEEd70dsw8x+9Kdag@mail.gmail.com>
References: <20180907102842.24197-1-schnitzeltony@gmail.com>
	<CAMKF1speuTVVk+o9svpy-Chudk18WGvMcvEEd70dsw8x+9Kdag@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 7 Sep 2018 18:54:49 +0200
Message-ID: <CALbNGRT4HbiFCxVT9CYEX=-cOKCT0HfKkAJ35F5FH2e5xJWzDg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] blueman: rdepend on packagegroup-tools-bluetooth instead of bluez5-obex
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2018 16:54:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 7, 2018 at 4:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
> hi Andreas
>
> On Fri, Sep 7, 2018 at 3:29 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>>
>> Have a better out-of-the-box experience
>>
>
> Making a recipe rdep on a meta recipe is sort of too coarse grained
> the vice versa is expected
> can we encode all needed recipes in rdep ?
That just causes redundancies - what is the problem exactly?

Andreas


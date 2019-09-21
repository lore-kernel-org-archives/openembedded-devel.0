Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5B37E7F51D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2019 16:46:01 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id f12so23234895iog.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2019 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0/20w1YmqPynidoPIwP5R5KmWG0p6JXSl5syfnmojco=;
	b=ELapqXy7EItqIFZSwQtc5xIBNk4j9z/Mcq4L8xQp7xXsk42pgmoD3dkAq+seVF6ydZ
	VUsaRgtHhgNvM9aoSxIN9YF+Cq3QVbmwElhmV+/VyO+ucHR7dof+8qS45HmP9RcV2jpk
	HXOsy2eq2bNj1aOLvioA+z3b/yCYQm/KphWIL3xOLyawzHNsA/W5iJVYr77HMAUCa6uv
	CXin9q6CJ3evWKjboUr2aumfXNb6BztoGBGHSj7wRaH7YjFK7G4weyXy6Ymvd8AyunXL
	3Gvn0UHVbTe5UUP9fSeZjC+xSNzTJ3NGU6J6HaUBsOmkrEzv2XcR6MLhvvsJjIeZwKEG
	uNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0/20w1YmqPynidoPIwP5R5KmWG0p6JXSl5syfnmojco=;
	b=mTeRmv0Ws2T7EaAW6u8wsfVNAN9DtgavKo9qMnjmsL+twdCbJQpHfmin5nFhsl4ytb
	Dw7efWIcg8mb1hIHIzvmxuqP5bUDA8FcQYKi8XficrgVAsa0fvOzoy0R1O0Y2Dui4PwU
	PMJV/oOIbtyxDwoJXtVhl6qlgwLIMUa4N/t8VoqPx2NznXhfA1h7unaTDS5FCzdx9eg6
	ENpczRdhpmTscWf4m+47sfj6CXIY0uNidH3MqV4+QhVirg23q3QAa9yR7mJS6JX6VGi/
	NloUz23uYiF2iXr1ZLCxWsOd3bPwxvf/8dtqQQ8t/4fFwtazAvPuH75ehgcKlwWhHozj
	d2Bw==
X-Gm-Message-State: APjAAAWZvCLok6AyvbMzMqrSi9HasWxlF/ngPKFAqxZDoCWaI8NbumlO
	jI68uXoJkH4Gz6Anxcc+fQUCudn1UdzkKCmRS7rFDVRF
X-Google-Smtp-Source: APXvYqxKflSHO90S1PoN0QVGK1xHP4RinxIP717KGxm9ppADP+R3xpWa+ZvvO9EZgnwgEMhS+Zlqh76QbQ83vJda/94=
X-Received: by 2002:a5d:9849:: with SMTP id p9mr14173354ios.102.1569084362292; 
	Sat, 21 Sep 2019 09:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190919181618.102575-1-alex.kiernan@gmail.com>
	<CAO5Uq5RMEv4OzV_dXGo4frqm==mBobLvsCo4G9rfbv+_Fm77TA@mail.gmail.com>
	<CAMKF1somsr7R6oghQq01+P18Pmmwt=pUZyNuF=aKUqNQRQ4nPQ@mail.gmail.com>
	<CAO5Uq5Rq2XwPxbo9ge7Zsdz1nb4vAkh=hG7K311NVGhRfOqGiA@mail.gmail.com>
In-Reply-To: <CAO5Uq5Rq2XwPxbo9ge7Zsdz1nb4vAkh=hG7K311NVGhRfOqGiA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 21 Sep 2019 17:45:51 +0100
Message-ID: <CAO5Uq5TakMX-hbtBNeQbqJ9AtAsQEzb5M=W5H2aMxrO7en+4ww@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ostree: Add recipe
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
X-List-Received-Date: Sat, 21 Sep 2019 16:46:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 21, 2019 at 12:08 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Fri, Sep 20, 2019 at 8:22 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Also fails on all builders
> >
> > https://errors.yoctoproject.org/Errors/Details/271527/
> >
>
> Huh... I could've sworn I tested all PACAKGECONFIGs, clearly I didn't
> do gobject-introspection.
>

Bleurgh... horrid upstream hack to fix a different problem which
breaks cross gir completely. About to send v2.

-- 
Alex Kiernan


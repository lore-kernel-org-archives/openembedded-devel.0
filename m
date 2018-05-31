Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C7AF174BE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 10:28:51 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l1-v6so53157982wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 03:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=j6Skrwtjhc1/IQvqYk4PM18sTrymNghtcPOE/yg11Ik=;
	b=KspAnVzcD/hFqzbt6zXCTBHMWnhies+goqQ5o0oLhb76UFGXm5nuN0mlliWemCeCq9
	fMhogXenPiYd52H8TFdz/MIdDcpddJN4mYcz2gO21k8hjz6yvcylmBX/3Dqfa9FdfePO
	I2IemmnZnu9pMyJjqjCOS0TCt5i5DqMr4SleBjahXCmgoHLPH7tT3olKNLaeJ5nKJc9K
	Pa23S6ObsAFvQ/zCQPuMsUOW5KVIkZ1sEbkdnk7qKPqpumY4BZpn9ULnH/8oBTGcKYu/
	6DIF9uBCETYwbvjvCKp/6EsVjzYUpstsUhmsM2Vma2ID8vz0BYUr3lCvzJNYN9+fWulJ
	4z3w==
X-Gm-Message-State: ALKqPwc91lz4KBMWLte/897xci4rmVSVNZSTMDQTkzQOyHeMpK3hSfJG
	aIQ/XREgRqsdYFcX8Sdit9Xq77Rs
X-Google-Smtp-Source: ADUXVKJ4IZqk/6sr3dHR4yXUaCIBOvcLCt1VGTYOQuHlq5abeDfdF3DO64PVm8EInE648XVSFoUtzw==
X-Received: by 2002:a50:ca43:: with SMTP id
	e3-v6mr7268687edi.222.1527762532115; 
	Thu, 31 May 2018 03:28:52 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w22-v6sm1599120edw.42.2018.05.31.03.28.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 31 May 2018 03:28:51 -0700 (PDT)
Message-ID: <ce457d1a5cd7cc0bbebc6db4afa18011df24e6e7.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2018 11:28:50 +0100
In-Reply-To: <CALbNGRTZOo_EaPNuQWB0iV-OVUy-uwKgt-PGwBz3O=ROqMZBxQ@mail.gmail.com>
References: <CALbNGRTZOo_EaPNuQWB0iV-OVUy-uwKgt-PGwBz3O=ROqMZBxQ@mail.gmail.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: Avoid version going backwards for beta versions
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
X-List-Received-Date: Thu, 31 May 2018 10:28:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Thu, 2018-05-31 at 01:32 +0200, Andreas Müller wrote:
> Hi,
> 
> There was a pre-release for fluidsynth-2.0.0.beta and I expect the
> release will be fluidsynth-2.0.0. How would I name the beta recipe to
> avoid version going backwards with 2.0.0?
> 
> I know there was a thread where Martin gave hints how to achieve but I
> can't find it - sigh.
> 
> Please help a forgetful old man :)

What I tend to do is something like:

fluidsynth-1.99+2.0.0.beta

In debian based distros, the tilde will always cause sorting to be lower
than the version specified before the tilde, so e.g.

fluidsynth-2.0.0~beta.1

works as expected, and I *think* this latter approach works in OE, too.


Cheers,
Andre'



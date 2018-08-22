Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC0D279304
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 12:57:24 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id r184-v6so594293ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 05:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iArheV6dki3CO+beZcbL/+A0BXhb6XD6SJ5PvoSmvnQ=;
	b=luJsbnKoKICeYWw8mYydZEUrm3P0rHEtD+wF09Kra6GKPUe/mgs847ne7pR0lAtqi9
	Wc+q9c1hjDyGkE1NQPJaiXVEn/1L0BxiSewxCBai2M+z5lsfVmfnyXsD0Ag5PjSkmklU
	C/N6b8mv7G0pumBS/BYZQ2gIjj4lEUkRrsy1LAJioG6UhXTf04Pg0B7kPi37HnoN2vaH
	R15wwj3uYxSOc1atJZI3XhhwDmOLIweL+rZXdKZ2MeTX+IVAtwpZOted5tiMwsR9goN5
	NL/pK9SylRcS8zMmzCmyEhqLjs6+5ILx/1JW89Oa4gHt1DguQ9iIt336IlWASnWDKVK1
	IODA==
X-Gm-Message-State: AOUpUlHuaIEPWclast666+uAK1WRrvQ1Rkd0gXFI6XevZctXGNL+I5ZZ
	zFhk7fTvBNd7bRp0i/niZ1BSKFi9
X-Google-Smtp-Source: ANB0VdabtGWhDQ8Lij6TJ3KvYHEy8ay1qn1N8+PalgIOi7aGVpMKCnt/zC1XXXxRp1W5bL7MM0ar4Q==
X-Received: by 2002:a81:5283:: with SMTP id
	g125-v6mr7405023ywb.380.1534942645524; 
	Wed, 22 Aug 2018 05:57:25 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m39-v6sm1110269ywh.65.2018.08.22.05.57.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Aug 2018 05:57:24 -0700 (PDT)
Message-ID: <87e69908e530da8fd208d852b7e123befc872e7d.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2018 13:57:23 +0100
In-Reply-To: <82afa6b0-9354-e827-c844-53fbefb7735c@skidata.com>
References: <20180820153234.10990-1-git@andred.net>
	<8fbb395c-0d16-0498-6b42-8482fa0cb972@skidata.com>
	<ab7d92497b385db0bf5fee8ba61f125131bf1570.camel@andred.net>
	<82afa6b0-9354-e827-c844-53fbefb7735c@skidata.com>
X-Mailer: Evolution 3.28.5-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH v2 1/5] layer.conf: stop OpenJDK-8(native) build dependencies from being installed
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
X-List-Received-Date: Wed, 22 Aug 2018 12:57:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-08-22 at 14:11 +0200, Richard Leitner wrote:
> Hi André,
> 
> On 8/22/18 2:04 PM, André Draszik wrote:
> > Hi Richard,
> > 
> > I've noticed that I had one more uncommitted but necessary patch lying
> > around to make the aarch32 port work with musl.
> 
> Thank you for noticing!
> 
> We should definitely add qemu test-images with musl. So similar issues 
> pop up during my automated tests ;-)
> 
> Do you have a qemu musl setup which could be integrated in our oeqa?

Well, I have my hacked qemu cortex a7 machine that doesn't work with oeqa.
For musl, I have my own distro, but not sure how the rest of the Yocto
project does the automated musl testing - there might be something more
standard...

Because of the different hotspot versions, it would really need to test all
three ports, default, aarch64, aarch32 and each with glibc and musl.

BTW, I just today saw that meta-ivi has a qemu cortex a9 here
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ivi/tree/meta-ivi-bsp
maybe that works better with oeqa?


Cheers,
Andre'




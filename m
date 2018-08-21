Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id EDF6F7900A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:15:53 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id r3-v6so7794053ywc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=F59074VwiSR+Uh9uAfJehwYQv09ZHyD1/tjK36fIPZg=;
	b=PwDqWU4ncJOlsJ4Bt+svaxvfI8A++77REZ7x7W8cvB8AGuePVsA/pESYRy0L4J8eca
	MXgzw6DvzwFuizSktZYiEUIlkbrcABknLCQiF/I6O0/75n82KiV3SUFNZKIegoBWpCT3
	xDDiXVaXPhxMf2aaWv0wH7ZXaae+NVJ8gemAmsDWSVOhpriy867N2DTp4CWfdwh3Ooyj
	AWu4Nw+brKr2IA8J+6WsWa95+Kb0TMy34Ei+DEHEei1wsNKNV2XzXMpwtN90C15mQ9lL
	A/aD/BsbOYH3xCGyTc2Ba2yV5wWBfe//FaO1tK/eo/x6uGrNvj+ARzbgJKN8+NHiBoVH
	9jgg==
X-Gm-Message-State: AOUpUlHGNC+x78K5EFmsurHkXfhsvefhrhMPYpTHgX3fPvr6mMtcBbC2
	wtEG/DW6FZrI8lvADeYZ8yX2Gc8p
X-Google-Smtp-Source: AA+uWPxSr+iCO2bZnkFmjY9EMiM28e7LjZPf/ufWL2HJohf0JXCuO/Qjk1tXFqVHzbs6msqKBcC+kA==
X-Received: by 2002:a0d:f984:: with SMTP id
	j126-v6mr27519458ywf.290.1534835754773; 
	Tue, 21 Aug 2018 00:15:54 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i123-v6sm3016168ywe.14.2018.08.21.00.15.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Aug 2018 00:15:54 -0700 (PDT)
Message-ID: <9c53388dadf2f69a4057c201a2cacea6467c2791.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2018 08:15:52 +0100
In-Reply-To: <631c8fe1-73a0-9cbf-3e92-7f481027dd65@skidata.com>
References: <20180820153234.10990-1-git@andred.net>
	<20180820153234.10990-5-git@andred.net>
	<631c8fe1-73a0-9cbf-3e92-7f481027dd65@skidata.com>
X-Mailer: Evolution 3.28.5-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH v2 5/5] openjdk-8: add aarch32 port 8u172b11
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
X-List-Received-Date: Tue, 21 Aug 2018 07:15:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-08-21 at 08:54 +0200, Richard Leitner wrote:
> Hi André,
> thank you for your patches!
> 
> Just one little question on your tests: did you run the oeqa test for your
> qemu cortex A7 target? Did you enable the compiled mode test?

I ran the all java (not javac) tests from oeqa manually, as the qemu machine
I hacked together has the issue that oeqa just times out waiting for the
login prompt for a reason I didn't figure out quickly enough for my
liking... It'd be good to have an 'official', working cortex a7 qemu machine
somewhere in yocto, though.

But yes, oeqa would also need updating to not skip the compile mode on
armv7.


Cheers,
Andre'

> 
> On 8/20/18 5:32 PM, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > Similar to the aarch64 build, we import the specific aarch32 port when
> > building for ARMv7. We also add all the necessary patches to:
> > * compile using gcc v8
> > * compile against musl
> > 
> > This was tested on:
> > * QEMU with cortex A7 emulation (using glibc)
> > * real hardware (using musl)
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > 
> 
> regards;Richard.L



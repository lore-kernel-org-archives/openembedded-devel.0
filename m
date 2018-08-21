Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 453B379015
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:53:51 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id x67-v6so2741829ywg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZXptw+8xUuW5IaedkuJI6C+sUE0HQ5F+Vav49PPrw0g=;
	b=ZN49VLwYOrovZDtrHNAgEEg6c4fUr9l5kr0kFel4YvxgeLs2BOpG7U+xX5wIqWQpxS
	8wttHeEy6hhoQuLu2OOwYw/7uUWUzlbCgH8XRN9ItkY6f70hpX/ua+uZFVjyEtkMYu8K
	f+O8UafLoBST5EZSumoKGVGKFYarFFg0Awusnhbj6lwH0UTFqTUjKOdgjEqH/kobEah7
	Z4CX5vGcqFCrYNy6M8rtxUTwoQoyE/reV/xH8JSZa4O8+Ea9Mo51gbGr/IiLPydl7axk
	FUXI3nFMJfy0g45kvsWdz6oB+Tqq9HBWwrCvhFGFjPD6p5KzozMTMGbCVL2/BlK86yNs
	TpsQ==
X-Gm-Message-State: AOUpUlGZSf4SoLd07dUVX4NUZALbY8k3uKZDL4GhGeBgGk6i/62OHzwH
	xjqCsmKyMvlWs9dkpHKlixXUCj6e
X-Google-Smtp-Source: AA+uWPyFK2nv/yBbs/0A4r30zW/S98QxYZ98Z3JvKl5Xcoj1LqiP4XdoldA/ug2baTlAJ6QOSTOVJQ==
X-Received: by 2002:a0d:f8c7:: with SMTP id
	i190-v6mr9348593ywf.354.1534838031906; 
	Tue, 21 Aug 2018 00:53:51 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	201-v6sm5428135ywn.103.2018.08.21.00.53.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Aug 2018 00:53:51 -0700 (PDT)
Message-ID: <8268bfcedc43a67d1cfbce9812f80c47d73ea8dc.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2018 08:53:49 +0100
In-Reply-To: <0ff06b23-3fee-b8dc-b481-425f78c296d4@skidata.com>
References: <20180820153234.10990-1-git@andred.net>
	<20180820153234.10990-5-git@andred.net>
	<631c8fe1-73a0-9cbf-3e92-7f481027dd65@skidata.com>
	<9c53388dadf2f69a4057c201a2cacea6467c2791.camel@andred.net>
	<0ff06b23-3fee-b8dc-b481-425f78c296d4@skidata.com>
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
X-List-Received-Date: Tue, 21 Aug 2018 07:53:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-08-21 at 09:26 +0200, Richard Leitner wrote:
> On 8/21/18 9:15 AM, André Draszik wrote:
> > On Tue, 2018-08-21 at 08:54 +0200, Richard Leitner wrote:
> > > Hi André,
> > > thank you for your patches!
> > > 
> > > Just one little question on your tests: did you run the oeqa test for
> > > your
> > > qemu cortex A7 target? Did you enable the compiled mode test?
> > 
> > I ran the all java (not javac) tests from oeqa manually, as the qemu
> > machine
> > I hacked together has the issue that oeqa just times out waiting for the
> > login prompt for a reason I didn't figure out quickly enough for my
> > liking... It'd be good to have an 'official', working cortex a7 qemu
> > machine
> > somewhere in yocto, though.
> 
> Ok. Thanks.
> I was also trying to set up a working cortexa7 qemu machine some months
> ago,
> but apparently failed too ;-)
> 
> Yeah, it would be great to have one in oe-core (or at least meta-java) to
> fully automate our tests.
> 
> > 
> > But yes, oeqa would also need updating to not skip the compile mode on
> > armv7.
> 
> I'll send a patch for that.

Thanks :-)

> Another question: have you checked if the aarch32 port works for ARMv6?
> I'm just curious because openjdk.java.net/projects/aarch32-port/ says:
> 
> 	The port will be fully compatible with ARMv7 and may support ARMv6
> 	depending on community interest.

I didn't as I read it as: "If people contribute patches, it can be made to
work. But nobody has done so so far". Also, Debian only enables this for
ARMv7 (although they have no specific ARMv6 port), and I know for sure that
it doesn't work on ARMv5.


Cheers,
Andre'




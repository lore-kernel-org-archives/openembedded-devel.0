Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8763C7864F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:58:07 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id v71so14437113wmv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 01:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yfOLCTreOuh9ywOlbnj9hrqR9i2k1u1TlHpykSfYhMw=;
	b=WmrNz/rJHbPrmfduTL526Xjj1XHLFwMx9lC/qRfEFbgj6Nmn6Y82NPoJbRAUPoAgy0
	ZXhvF2SBwO7S9MknzPc1tIGH/pRZ4BUr6C+e7M5lh00KM5A7daDBWCHSlYaLDpRkSmkn
	9qwbw7KsRmhueyl7kUTlp96m2TihvDtlvV/7RpopRqsCogL6dbbsGLLwU7iGO0ByDuVc
	G1o96L6vQgZQXfIga+bVrlhFeWJNFG5yRjIqt6qrC4CTlLU7LLYKlZICmmoD/y6DwkVG
	GhWv0LtVhANbd2ZgKzFfAOptkJ9vSc5qd4ApBTICA88SbfOjouLQn3qtLVowtPrhZof8
	0A7g==
X-Gm-Message-State: AKwxyte3GivQ2inX1DyYoGmp7gg35uI8H1Uf9oIAQEr25+7RPJCGET2L
	G10Y4lr1OFzpBO+ExXn8utg=
X-Google-Smtp-Source: ACJfBounK19xyTyz+O4CItcMpUQSAN0Jv8bC41KZ7mDIdsBGhePLQBEuW72krmPHLmKQ0/VFCa5rvw==
X-Received: by 10.80.138.130 with SMTP id j2mr2200567edj.36.1516183088436;
	Wed, 17 Jan 2018 01:58:08 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id u17sm3053226edm.6.2018.01.17.01.58.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 01:58:07 -0800 (PST)
Message-ID: <1516183087.28972.69.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:58:07 +0000
In-Reply-To: <fcae9a6d-a41f-b22a-7d10-b84bf02bd056@gmail.com>
References: <20180112122942.22396-1-git@andred.net>
	<1515760402.28972.39.camel@andred.net>
	<fcae9a6d-a41f-b22a-7d10-b84bf02bd056@gmail.com>
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/2] uthash: update to v2.0.2
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
X-List-Received-Date: Wed, 17 Jan 2018 09:58:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-01-16 at 22:20 -0800, akuster808 wrote:
> 
> On 01/12/2018 04:33 AM, André Draszik wrote:
> > On Fri, 2018-01-12 at 12:29 +0000, André Draszik wrote:
> > [...]
> > > +HOMEPAGE = "https://troydhanson.github.io/uthash/"
> > > +SECTION = "base"
> > > +LICENSE = "BSD-1-Clause"
> > > +LIC_FILES_CHKSUM =
> > > "file://LICENSE;md5=5cc1f1e4c71f19f580458586756c02b4"
> > 
> > Note that there is no common license file for BSD-1-Clause in OE-core,
> > which
> > causes this warning:
> > 
> > WARNING: <image> do_rootfs: The license listed BSD-1-Clause was not in
> > the licenses collected for recipe uthash
> > 
> > Is this really the first recipe using BSD-1-Clause?
> 
> Does the standalone "BSD" license over Clause 1?

Well, the stand-alone BSD license is effectively BSD-3-Clause, so it's of
course more restrictive than the 1-Clause version.


Cheers,
Andre'



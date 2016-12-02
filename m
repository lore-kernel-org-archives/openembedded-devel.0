Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-wj0-f174.google.com (mail-wj0-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id AD01971A1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 13:19:53 +0000 (UTC)
Received: by mail-wj0-f174.google.com with SMTP id xy5so231818167wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 05:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jldZh8Y2BYf9ql2Ou7ONi3+eJZbz88ok+zCoRK4Bms0=;
	b=LIaKRyXRBIZ2YFRdxj/d6p0qcFTPFIKL1VbIgAPVc4PJ6DNbaOFKtWNP1Dc2KfekVK
	VESzRJWuyvJIqqtWJBOiS5xJhVb8RcsLibQgPr8w0oTZwV3AdJMI23u37tl+RYdslUMm
	Un5r1YiKM/3OPZCmDBDCF9LFhdkYwqZyGcHjb2/W4TKoUYWV0WMqsqx2XLLo7CbwdFAt
	OWa2b5FLOdbgPlkI0jT5FqV7gJ1YS1AWO/omRmxZ/3WanScRMglw335mUkFXJKmI9cLR
	R6k0+KZN6fX4KRkvDkxIuBwb3zpAfuMU7me+s3C5D50OPVoZ8IwDWF+/2tvFdynfNbXB
	bYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jldZh8Y2BYf9ql2Ou7ONi3+eJZbz88ok+zCoRK4Bms0=;
	b=dgu4QrIdtqAB6QTRwFguw3faPWKdxIvL/OmshC1fTBPySSUTwrwwwnFGXKdqOBkPmJ
	6oW1HHZiZp7Pwe8XO/Q/Ap//dIDxhgw7iET/WFzXOvpkCRqRWc9ibd0wJIpVLBO33kN1
	oMxz6sVujQDdxVuHkq75+veo3s7cxnsYkzmEsECjnteSwixvYmg0WgqUQMPOknaYe4/9
	g0+UP5zLhIPJzS9aXJnE7utofKKM+RdUAD8otCo7UpMcZBK2azAXy8ZG8F5Z8H9ifSw0
	Y767x0VWGh0VLazAwFR23aCwgtqM9wFGiPI7CPV5kixXOorKr4Lfux057goEPYtEp078
	kpMA==
X-Gm-Message-State: AKaTC02QLbYNp/lQ6rDl4idMKLLJb/LkyOB0VrdoSwSwxUtl9TKmlF7BveDxVjgbSnFso1ky
X-Received: by 10.194.99.38 with SMTP id en6mr38800907wjb.184.1480684794146;
	Fri, 02 Dec 2016 05:19:54 -0800 (PST)
Received: from gordanmarkus-XPS13 (static-212-247-53-108.cust.tele2.se.
	[212.247.53.108]) by smtp.googlemail.com with ESMTPSA id
	yj10sm5595305wjb.3.2016.12.02.05.19.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Dec 2016 05:19:53 -0800 (PST)
Message-ID: <1480684792.22967.5.camel@pelagicore.com>
From: Gordan =?UTF-8?Q?Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 02 Dec 2016 14:19:52 +0100
In-Reply-To: <20161202103105.GE3721@jama>
References: <20161202092012.12438-1-gordan.markus@pelagicore.com>
	<20161202095419.GD3721@jama> <1480674073.22967.3.camel@pelagicore.com>
	<20161202103105.GE3721@jama>
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] gdb: Fix QA Warning
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
X-List-Received-Date: Fri, 02 Dec 2016 13:19:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-12-02 at 11:31 +0100, Martin Jansa wrote:
> On Fri, Dec 02, 2016 at 11:21:13AM +0100, Gordan Markuš wrote:
> > On Fri, 2016-12-02 at 10:54 +0100, Martin Jansa wrote:
> > > On Fri, Dec 02, 2016 at 10:20:11AM +0100, Gordan Markuš wrote:
> > > > WARNING: QA Issue: gdb: invalid PACKAGECONFIG: readline
> > > > [invalid-
> > > > packageconfig]
> > > > 
> > > > Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
> > > > ---
> > > >  recipes-devtools/gdb/gdb_%.bbappend | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/recipes-devtools/gdb/gdb_%.bbappend b/recipes-
> > > > devtools/gdb/gdb_%.bbappend
> > > > index 3e663e7..41592c4 100644
> > > > --- a/recipes-devtools/gdb/gdb_%.bbappend
> > > > +++ b/recipes-devtools/gdb/gdb_%.bbappend
> > > > @@ -1 +1 @@
> > > > -PACKAGECONFIG ??= "readline python"
> > > > +PACKAGECONFIG ??= "python"
> > > 
> > > What gdb are you using? The version in oe-core has readline
> > > PACKAGECONFIG
> > > 
> > > meta/recipes-devtools/gdb/gdb-common.inc:PACKAGECONFIG ??=
> > > "readline"
> > > meta/recipes-devtools/gdb/gdb-common.inc:# Use --without-system-
> > > readline to compile with readline 5.
> > > meta/recipes-devtools/gdb/gdb-common.inc:PACKAGECONFIG[readline]
> > > = "-
> > > -with-system-readline,--without-system-readline,readline"
> > > 
> > 
> > We are using the gdb from poky and it's a similar case there.
> > Though, 
> > the gdb itself doesn't have the readline PACKAGECONFIG. It is
> > enabled
> > by default in the *.inc files. 
> 
> No, it isn't, read:
> https://patchwork.openembedded.org/patch/116843/
> discussion.
In that case the patch can be discarded.
Thank you for sharing this Martin!
> 
> > gdb-cross-canadian.inc:PACKAGECONFIG ??= "python readline"
> > gdb-cross-canadian.inc:PACKAGECONFIG[readline] = "--with-system-
> > readline,--without-system-readline,nativesdk-readline"
> > gdb-common.inc:PACKAGECONFIG ??= "readline"
> > gdb-common.inc:PACKAGECONFIG[readline] = "--with-system-readline,
> > --without-system-readline,readline"
> > gdb-cross.inc:PACKAGECONFIG ??= "python readline"
> > gdb-cross.inc:PACKAGECONFIG[readline] = "--with-system-readline,
> > --without-system-readline,readline-native"
> > 
> > > > -- 
> > > > 2.9.3
> > > > 
> > > > -- 
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-dev
> > > > el
> > > 
> > > 
> 
> 


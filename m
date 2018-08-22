Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 88E1C7902B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 12:04:01 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id z143-v6so540090ywa.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 05:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=F5rqOAw5qnA+lnfgrHGnfLvQme5tfiIyXXaODGvq818=;
	b=G44ni9Q6ViVeJz1tWCA7Zy/Oz1gLbpuExhJwM1L00iwFDmQ5ZiIWpit2Y14FdBeoUG
	/zdnAUeDyGxNMPIBElPBRh1QGlMZuGbJRbPO6Bk8jYCVzO5mVJjsiX8XIkTqd6IVxUeH
	c4ebYs9kuKyopmCjvwxWYkHu8CqClm4Ep4AWdxT2yu6FBJ3FVrnFK+aoc6RPIynQ9VS3
	PVbOIB3s4QKLGW2xARlXnvURWgfoqqNH1kfRkX45acyCXnovD7QH7RBFFO5m8VLYKV11
	MMbY5P2A1PiZnbKPmEIGT5UCdEV/j/OESfRel7zhAkO/Wk0vJgOkHF9YELtauRqUk37b
	i2lw==
X-Gm-Message-State: AOUpUlEi1Jk+1npKJ+YqygSnZdlqLO77ckshhF3r4xw3SiqPFV1MMpbI
	FER5SktUKtD1HlzWkw43PGG3IpY+
X-Google-Smtp-Source: AA+uWPyc3KRJwXpZn/YQRB6u9RM5Iub7P8T0/ZqYjzqBuOWyCa6psKduGQ3fW4s43qZKkME922XtoQ==
X-Received: by 2002:a81:55c1:: with SMTP id
	j184-v6mr7361519ywb.146.1534939442221; 
	Wed, 22 Aug 2018 05:04:02 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n187-v6sm713132ywn.76.2018.08.22.05.04.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Aug 2018 05:04:01 -0700 (PDT)
Message-ID: <ab7d92497b385db0bf5fee8ba61f125131bf1570.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2018 13:04:00 +0100
In-Reply-To: <8fbb395c-0d16-0498-6b42-8482fa0cb972@skidata.com>
References: <20180820153234.10990-1-git@andred.net>
	<8fbb395c-0d16-0498-6b42-8482fa0cb972@skidata.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 12:04:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Richard,

I've noticed that I had one more uncommitted but necessary patch lying
around to make the aarch32 port work with musl.

Hope it's not too late for v3, but I can send a follow-up instead if you
prefer.

Cheers,
Andre'

On Wed, 2018-08-22 at 11:26 +0200, Richard Leitner wrote:
> Hi,
> this is a note to let you know that I've just added this series to the
> master-next branch of the meta-java repository at
> 	git://git.yoctoproject.org/meta-java
> 
> As soon as it has gone through some more testing it will likely be
> merged to the master branch.
> 
> If you have any questions, please let me know.
> 
> regards;Richard.L
> 
> On 8/20/18 5:32 PM, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > Avoid installation of all openjdk-8-native buildtime dependencies into
> > a depending recipe's sysroot.
> > To execute openjdk-8-native as part of a depending recipe's build, we
> > don't need the openjdk-8-native build time dependencies (like ant-
> > native,
> > or more importantly icedtea-7-native), just its runtime dependencies,
> > unless of course that depending recipe's builds needs those tools
> > itself.
> > In that case, it needs to specify them explicitly, though (of course!).
> > 
> > Use SSTATE_EXCLUDEDEPS_SYSROOT to prevent openjdk-8-native build time
> > dependencies from being copied in the sysroot unless explicitly
> > requested.
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > ---
> >  conf/layer.conf | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/conf/layer.conf b/conf/layer.conf
> > index 3b00f61..8e8a300 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -14,3 +14,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
> >  SIGGEN_EXCLUDERECIPES_ABISAFE += "\
> >      ca-certificates-java \
> >  "
> > +
> > +SSTATE_EXCLUDEDEPS_SYSROOT += "\
> > +    openjdk-8-native->(ant-native|attr-native|coreutils-
> > native|icedtea7-native|libxslt-native|make-native|openssl-native|zip-
> > native|unzip-native) \
> > +"
> > 



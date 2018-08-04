Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0B860777
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Aug 2018 10:01:14 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id f23-v6so2964711edr.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2018 03:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=fUY4CyyCeUg+8fef5S0/18/Hc0Vg7/LjPOJTM2wMv10=;
	b=MgzIazE4ZMpNvhX1596xH8Gamofmr5mGpy3NjA8e1mbaGQOkFhKqYa0yFFb4uCZijY
	Q9yRsAfUcp4UY6z1lRL9nAJi/kAGHRIN5lhqRW73dObPN6UYY9J0kOPuud7px1WSlX0P
	/+WxCriazrKW2gbm7joGIJ+vxl/mha1ItBh5LFVzsRXz5ClVBvGTpDKQJ0Jt5S+JqEt7
	t21mMRB2PcAT6bed5vInnwMqr8Gz7XvK1xjZyP1QkbNtQLtlr0WX+4s2j9oZtxxSxtE/
	sSeIgZsVhVTn0wsi6BrMhkom2e+npc7T2NuTMwm5Awx7sTUFf/IQ6upfkJ4/2swXbgV3
	XSlw==
X-Gm-Message-State: AOUpUlF23pGY+T6eoOluBDp0lZ4j5HHesIVwCkMy3QLBfuoiLefNokAn
	zVsUyzkn0Gou7xcy/dLMsTSjsqRR
X-Google-Smtp-Source: AAOMgpcDM+C6iQYhI4eFlUCQeKHSqdMEQvnMiKdvtmDTAV5KTQGCbMEEro7Ruw/0dCRyMRYdS4XTbQ==
X-Received: by 2002:a50:e0c9:: with SMTP id
	j9-v6mr10476944edl.198.1533376875496; 
	Sat, 04 Aug 2018 03:01:15 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	r11-v6sm2516600edp.60.2018.08.04.03.01.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 04 Aug 2018 03:01:14 -0700 (PDT)
Message-ID: <9d34c4df011bea3937bc720c637237d5438422d9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 04 Aug 2018 11:01:14 +0100
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: [meta-java] openjdk vs openjre recipe history
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
X-List-Received-Date: Sat, 04 Aug 2018 10:01:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Does anybody know why there are openjdk & openjre recipes, rather than just
one recipe creating mulitple runtime packages?

With the current approach, we get
* a JRE from the openjdk recipe
* a (separately compiled) JRE from the openjre recipe
even though they are compiled from the same sources

And you also have to constantly modify your PREFERRED_PROVIDER java2-vm /
java2-runtime based on the image you want to build, e.g. building an image
that wants to install openjdk, but your preferred provider is openjre, gives
you lots of warnings from bitbake, meaning you have to update your preferred
provider.

This isn't very intuitive to say the least.

Other distros (or debian at least), just create multiple packages from the
same recipe, i.e. there is one openjdk source, which creates both the
runtime only package, and the compiler in a separate package, amongst other
things.


Cheers,
Andre'



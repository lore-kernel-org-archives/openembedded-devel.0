Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 465AC65CB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 13:39:45 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id e190so60888364lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 06:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=4dpF3pmDyneljibctg51TQKgw0bpM+ktMOrRTFioEfk=;
	b=QrZHFq2XEroxdOhVJRmoonXOTt7FgIgUdcqRH8ZLYE5NZAnR/ExGi2saC6g707UnBN
	Mlc4R4h0PgQOUGLiVF50fD80DW/eD/y1JvxOzhNLC4PB1B+qhqX4/vIUFl2PDU36xjJl
	k10iPh6jLPgjuwv0isu0a04IK/orY2iLqnj89jCpYtSHXWGmWyS3ZVlvnPYAJdwXMTLB
	6wCErW9t5x3PyFeBoXgxfMKP0sJZj31ZqB25rCoFV9T/C2fLo2FfGR4wTmc1rk/JHLmT
	EVZLAy2pmgq7YuUfprkevaKBSxCz6dbEfu/IYaORI0LrR4DArq5Bor243Nbm3FBwhD/M
	lJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=4dpF3pmDyneljibctg51TQKgw0bpM+ktMOrRTFioEfk=;
	b=IU7Ua8q/Jp9OA+ZvIywl5+ti8I1xGANRX8ZTfpYfOjbVnONF5VZpj0hx5PAdJakNB/
	Lvszh49Fr27YNu1rRgZKk/64woWKJ32kWAbEdKH0gY8PGa4b3CpGwJ+oC68V+7LAvghS
	z3IhnQVdizKyFQe5SYB4UpMKghO22FNCPa/rB0kCEaEtCwqqNhQw/3lJ/JZML6Ak8qSO
	VS784bW8YsXQ0KbGlExCK9OhIb1zIN3xkHjA8yY2y8GkcsCenOh1fuIsDdNrzEsCdILZ
	QcGT/74Ju0yMJuvv5wsHvx3TgVAwEhodakDJAfApOs35jMFGQrR3QolV0EaeBs2LqwdY
	g38w==
X-Gm-Message-State: AOPr4FXK2qrYGKqtGW/JEA+RKG7yD25HModRd34F9U6EnXezDAiLwZDxSx2mrEM3qvZWYA==
X-Received: by 10.25.151.75 with SMTP id z72mr6451685lfd.30.1461245985312;
	Thu, 21 Apr 2016 06:39:45 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	m141sm566310lfb.12.2016.04.21.06.39.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2016 06:39:44 -0700 (PDT)
Date: Thu, 21 Apr 2016 15:39:42 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160421133942.GD8320@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	mark.asselstine@windriver.com, rehsack@gmail.com
References: <20160419142059.GB5970@mentor.com>
	<1461080229-23859-1-git-send-email-joe_macdonald@mentor.com>
	<20160420082429.GB3520@ad.chargestorm.se>
	<20160420082917.GC3520@ad.chargestorm.se>
	<20160420185624.GB5528@mentor.com>
	<20160420190915.GC5528@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20160420190915.GC5528@mentor.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: mark.asselstine@windriver.com
Subject: Re: [meta-networking][PATCH v3] dnsmasq: get systemd only working again
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
X-List-Received-Date: Thu, 21 Apr 2016 13:39:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Joe MacDonald <Joe_MacDonald@mentor.com> [160420 21:09]:

> [Re: [oe] [meta-networking][PATCH v3] dnsmasq: get systemd only working again] On 16.04.20 (Wed 14:56) Joe MacDonald wrote:

> > Wow this one is kind of thorny, huh?

> > How about the attached patch?  I hope it strikes the right balance
> > between not duplicating too much and not making things too complex to
> > maintain later on.

> Or, rather, this one.  :-)

This one works fine for my use-case! ;-)

Thus,

Acked-by: Anders Darander <anders@chargestorm.se>

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB


Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id B1FC960268
	for <Openembedded-devel@lists.openembedded.org>;
	Wed,  4 Oct 2017 09:32:12 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id q132so21856640wmd.2
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 04 Oct 2017 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=ezZakwZalfiI8Li3htfh1muoe/QnpfuMIoa9pkMe/wA=;
	b=rnMq0HL8DstJ6t4J/skGe3yrALryNbsODHPkQ6kY37OuqVBvITE5OD56XzS2TUwUzk
	5z5m+/s3Sio7F8nhfIqCof8b2Rvxrc5EY8SXybwTDWnoDda9SRlhgvBLmmIC9+5yyNx6
	xP1NOWbkd1QQdkkeZDMq+i6zIKNPoNgkcf9K340HL3/i3bKPCUV8elBx6DYgRanh8/Es
	LJwLWOxPcAa2+o58W36ErW8JdIvAA/s96IyyI9xodLHPzy/JedlCOx1yAe6RH8xlHrKB
	4J0xg9rDgWa/PUfP+zrFAk0ok/oM3TxjijkScX3eFeYbpdsY77hic4InidRz8XsdGgQE
	6NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=ezZakwZalfiI8Li3htfh1muoe/QnpfuMIoa9pkMe/wA=;
	b=H+WTQ2fe0sC62jJUhKFctwZVFS4dbzmjLfYxI2Fi6vCjTwZYrAU803ehZr6fxpsHjp
	EcjhwoFujzvEAoeMxycXO6Sm2FHh7VCHFnpmPHyzQAG8U/Qmvvtf0V4dQo2hZfG2vocq
	PUrF1pVdFTbXJBFTV2/G8gEbKwKwW9JVM8qr8j9QoXtN9JPevblJivS1AqfoxXyrUYVT
	Vw9TlV9bR0n1/VTmLsSSyfV6zPwwOhV1Q8QtrS7z+bhzrZketI6bD+AKLtvBum63gpQi
	gjOBbp0kvwSYdXv+x2VnewfTZld+bpEeNBIHb0PjIlkbGrwp5tRK4y3nHwCulWJvW7tW
	z1vw==
X-Gm-Message-State: AMCzsaUEa+NThPZkM5IjLktnP2EmMpWdcezmjeRYbv8RCwpPNuwoVn7v
	7/7ghLDRDDla3EdcfURVpr5N
X-Google-Smtp-Source: AOwi7QDhFYAdnvr07BCp5BCTC5vB07c4S2pjMKxvwqpseDLjLw/lJPKCUII0dXcxnCIteEf/ia1mtA==
X-Received: by 10.28.152.5 with SMTP id a5mr7546343wme.131.1507109533438;
	Wed, 04 Oct 2017 02:32:13 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C5A4.dip0.t-ipconnect.de. [93.232.197.164])
	by smtp.gmail.com with ESMTPSA id x5sm7926741wre.18.2017.10.04.02.32.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 02:32:12 -0700 (PDT)
Message-ID: <1507109531.25153.6.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, 
	Openembedded-devel@lists.openembedded.org
Date: Wed, 04 Oct 2017 11:32:11 +0200
In-Reply-To: <20171003094039.30186-1-ricardo.ribalda@gmail.com>
References: <20171003094039.30186-1-ricardo.ribalda@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: Add sdl-config to HOSTTOOLS
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
X-List-Received-Date: Wed, 04 Oct 2017 09:32:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-10-03 at 11:40 +0200, Ricardo Ribalda Delgado wrote:
> Without this patch bitbake cannot find sdl-config
> 
> ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
> Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
> Following is the list of potential problems / advisories:
> 
> libsdl-native is set to be ASSUME_PROVIDED but sdl-config can't be
> found in PATH. Please either install it, or configure qemu not to
> require sdl.

Making sdl-config available is the wrong solution. See https://bugzilla
.yoctoproject.org/show_bug.cgi?id=11725

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




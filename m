Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiaGH-0003VU-9g
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 00:28:49 +0100
Received: by lami14 with SMTP id i14so6386038lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2012 15:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=niuD3/+jIY26BZI6hDC5KxCmVa7jkDX2Z08bkmVLXSw=;
	b=wOLiEUmJmFhvEWWvgZTx1aPQlnm7LyoaxHEOiD86QdnlSWIYm4Rrj2ulcp7Sg+GoZ3
	pq/d0i/aA1/IxYvvXO3gTaVQhLCd4Dh0pSafsZr2rbqGZSDF38aYCU+miD2VSVNJLcKo
	rQ5leA9xUO4EyN87GdBpOmyojm+unpZfr9VSc=
Received: by 10.152.123.75 with SMTP id ly11mr39215912lab.32.1325719287279;
	Wed, 04 Jan 2012 15:21:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Wed, 4 Jan 2012 15:20:56 -0800 (PST)
In-Reply-To: <CAObi9r-Gm9_ORVY--3dyrgaAts3AEprr7jxfv8-WNJRr1aqKUw@mail.gmail.com>
References: <CAObi9r-QdBpK9hzwQr1M1tjjKW1F+qLfr2CLbjyWCAuSuEUKAQ@mail.gmail.com>
	<20120104180932.GD32676@sakrah.homelinux.org>
	<CAObi9r_A=fv0Q4QQMxzXTLmsdS1yb4y+9EApxrCkGiX53L70=g@mail.gmail.com>
	<CAMKF1spZGshc70t3e3dUjfckxEVFg0UX+Wtga7GJssFPuEugDg@mail.gmail.com>
	<CAObi9r-Gm9_ORVY--3dyrgaAts3AEprr7jxfv8-WNJRr1aqKUw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2012 15:20:56 -0800
Message-ID: <CAMKF1srjY=UC8_KCJvx08YuAbNa1fqp0pBAUCdsSO7LnW2e+YQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: some ipk contents missed in rootfs - fuse_2.7.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2012 23:28:49 -0000
Content-Type: text/plain; charset=UTF-8

> Yes, one bb can generate many ipks as defined by PACKAGES variable.
> Just I want to be sure; up to your example, If I need foo.ipk and
> foo-utils.ipk contents in my rootfs do I need to add "foo foo-utils" or
> just "foo" to IMAGE_INSTALL?

IMAGE_INSTALL should be populated with packages so you need both unless
foo or some other package which is included RDEPENDS on foo-utils



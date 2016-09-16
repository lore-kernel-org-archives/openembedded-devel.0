Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 69EA8700F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 09:03:33 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id r145so19063797ior.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 02:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Q/PIE35oq99fkbw3LF9R6su1VlnFV9Xp4U56O7mPCiA=;
	b=LrGpYjYxRr4OfZaBuR/E16s0Gm7kmyqevVKF+4WMrAm0D21oxnvOTo53h1+vHnztpv
	YRlmWe1nc80ke5bNPRTHeMUa/zLx7iANg5egSW4L084T+YOPl/gr09BYC3c6T3soUyXW
	1bMy9Dhn2dBTrkm585/ZwlJ+MRoN6sAJmGBZzs9LJOOh6YPEgvwe7rFpnQGWq1wfUqSb
	Y4yTIJjAnYV1dJI+aOFCjOXzv+LRaMIkxjOF7H4LqMGezB3fWcSxgeGabfL/AHXkRIqO
	Au5YBGp1Q/1MHxQRtkIft1yRW2be81P2KBUTo7QQasLIv3VEzauJqe8ZyUkSk8ZZvq60
	DtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Q/PIE35oq99fkbw3LF9R6su1VlnFV9Xp4U56O7mPCiA=;
	b=CzPrQrhOEStoxo2j4+mYWTeMlUymigfckdJ9nwHRfwsBrTRo5oWPbyEpZxV+NJCNBq
	rTmYd1+OxN8X+oITFBG0kwE/V1nFoo5O1wvzNC/oo1klvK+Ahh6geuMo2XUTBmZGsoko
	EZ9jaUlSqju//iOvRdLKEC7De1xXRN6cr8Vd4zfZ71qpzc7hiOg8YYqRjeGkviRfrr1r
	P0xfll89K+PGsxRnDglLvwTOj5CECIeOIfsyEICBvs/vP4KhhJtVBFjTgA8A/DmSp8uM
	OuT5cuTFfsArJ2HZBxQwkLrUHYjSxW9hFinGf9ce4wN0ekNBT5j0NQpaQCNVN0lQ3f4x
	dTnw==
X-Gm-Message-State: AE9vXwOeYqO7lk1E4ml3IJDBPo0fKTYRlrkh8F/Omvm21t1csgZujS4QX96steAfeROdsVAvVBKptSgLj39nFonB
X-Received: by 10.107.53.206 with SMTP id k75mr23759997ioo.195.1474016614426; 
	Fri, 16 Sep 2016 02:03:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Fri, 16 Sep 2016 02:03:14 -0700 (PDT)
In-Reply-To: <CA+chaQfXzaqCyQMZ-ou+p7m4_vFg4pvSa2Sm60t3MX6TL8yraw@mail.gmail.com>
References: <1473970910-2046-1-git-send-email-ross.burton@intel.com>
	<CA+chaQfXzaqCyQMZ-ou+p7m4_vFg4pvSa2Sm60t3MX6TL8yraw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Sep 2016 10:03:14 +0100
Message-ID: <CAJTo0Lbwsvi1KL0mdwKkhBK0QE4cA_aF+bZCWuyPwHPBaSov2Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-oe] portaudio: upgrade to latest release
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
X-List-Received-Date: Fri, 16 Sep 2016 09:03:34 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2016 at 21:39, Martin Jansa <martin.jansa@gmail.com> wrote:

> This PV change looks like a downgrade as old recipe had SRCREV = "1387" and
> new PV indicates 1919.
>

 Old recipe:

-PV = "v19+svnr${SRCPV}"
-SRCREV = "1387"

New recipe:

+PV = "v19+svnr1919"

Surely that's an upgrade?

Ross


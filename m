Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id A1FF8770D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 18:08:07 +0000 (UTC)
Received: by ioir85 with SMTP id r85so515343ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 10:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+P9qJdTOWMBb9PrFNP4ULB3n4M+QfUmT1HzKyUHHU8M=;
	b=OoW+Jy45ljU7SMIwYwKbJlPG8M64KsfWO81/diIKADQmpMnDpNERI9cWlTjOA5S+Bj
	ueqbMXgiVOXXrMjuCsEgNZ1tGIlj1FQzG8zhDhzFx1iyj8ZmLqGrISsEOgDJWQZesDhY
	3rTYcR6/wi/NioisbsSVDR4dAkUPwBHpD2LhYQE0QKPdjkHEjpQxAYeEnvlPBBC8AYyv
	Bq8Ohjac/HK63HWrBZKKuYDi4VxfQymy9xRlv57qi+j0rDvXdL6Vg31WpXDq510HWCz0
	sZ4IzIdp0EYY9S7a0CjeWBOYiOKiakeoL03wNWJMBnC5kQCEoU8jw0UMarXvpNF9Gec5
	jeJQ==
X-Received: by 10.107.162.137 with SMTP id l131mr8168757ioe.49.1447265287340; 
	Wed, 11 Nov 2015 10:08:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Wed, 11 Nov 2015 10:07:37 -0800 (PST)
In-Reply-To: <7F78FF81-F48C-45D0-9F1A-2D719A20CC48@gmail.com>
References: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
	<CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
	<B2ABFB12-3EF3-4008-94A1-A6390986AAFB@gmail.com>
	<88DAE25B-BAA9-4F99-B404-71D2D2973BBD@gmail.com>
	<4E8196B8-4770-41B9-B80A-3A9A911087D3@gmail.com>
	<CAMKF1sp8SrFpqeY4iD-juwPv6y2y5f4ZDisPU9LiCUuUXDWhqA@mail.gmail.com>
	<7F78FF81-F48C-45D0-9F1A-2D719A20CC48@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2015 10:07:37 -0800
Message-ID: <CAMKF1srTimQy2RtDk+=nnA7p+jC80u0eBTd9_v+9_FLfWt0MPA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: =?UTF-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: Re: [meta-oe][PATCH 1/3] samba: fix dependencies and QA issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Nov 2015 18:08:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 11, 2015 at 8:37 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
> grep remains silent regarding DISTRO_FEATURES and linuxstdbase :(

right, its a OVERRIDE so you can do something like

foo_linuxstdbase = .....


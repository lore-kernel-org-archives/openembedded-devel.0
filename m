Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 73E2B7807A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 18:09:37 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id b23so472064qkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 11:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x3Cbgqre0Swy4wMDZXzkhdf5ERSL4yiF/mU/eOIQbnk=;
	b=ZcyIpFchNd/Vg440FRXnotR5mXNVLOi47wsuTga+JrLjdod69F73AD3xFy800eRlQp
	VL6K7PQ9U3mzIldv6WawJtb1LlCVdZiwUd1fxaxFGpspPEOvf7nist98o6VCmHDd00jA
	YnY/RzEl8j6mLF9OBTw06WYXh/o6a0+doJGlV3zYX4UUhPtw3bE60v4K4de4uiRVSfkQ
	xCLEHUpxs0/Z3+oVBHnIeVkeT5iTpGIDzwgJqpt1VP5pbqTOwU7yh02odFp9IHnRD9Mw
	SxLlNES7UJPpsK4U90QqXbdVK5IoF4YpanqGhKmPO3oNOdb4o6KWCuhQyY8QJVAXLVe0
	hr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x3Cbgqre0Swy4wMDZXzkhdf5ERSL4yiF/mU/eOIQbnk=;
	b=iS4/oFUkMlTdQPOg3PLWzUVWvmmQhZUkoWZFJ4QppfUxqaI4QB/HxM0hSBpj29XW2Q
	K3ARcVPK51d9Xhw16fqwcWQL/K7J7gbCK9aClcZ7hUwrkfwFNkX2Rz2u6BKLfSNAokpJ
	UG/S6O9vJ8jh768Z1aNyP8Cxh87ulRSF/uYjHCrigxwptI1HG2EaoKAyuwlScJadaXM9
	XY/ib4TWPFfL3AcfTuZsTBZ3IBCmZ6AMtm6UfKAEidtRkK54Xdy4187L2Ot3tpaGCLjB
	FPbawUBbHaLbqnbVWhf8SrAdhLubIL0q/fr/7TL6yhEY7F7eBwOhplxLJ86xUH1Cmkp6
	7Pkw==
X-Gm-Message-State: AHPjjUj9xkXzEOtdcWcbXQp8DuZ5ECsc4dg7q8J/zN1cXw0usditoT3d
	ziYkQgxSc3FjYh2xfi0WRaULlI3ZC3mxOH0PkkU=
X-Google-Smtp-Source: AOwi7QDdDXVfZSJwlEwtS/nYzOC/ZybX/OKCz2AfbjV8F3jZfVpFsYl3X0ezbgbS5HyWz87zhs2ezSs65ZvX0+OGqas=
X-Received: by 10.55.185.194 with SMTP id j185mr3338142qkf.101.1505844578588; 
	Tue, 19 Sep 2017 11:09:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Tue, 19 Sep 2017 11:09:37 -0700 (PDT)
In-Reply-To: <1505806772-29423-1-git-send-email-haris.okanovic@ni.com>
References: <1505806772-29423-1-git-send-email-haris.okanovic@ni.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 19 Sep 2017 14:09:37 -0400
Message-ID: <CAHUNapQ9N_NujKhA7r_4JRtQyLEq7Da7v9s1Q=O8QiJTk_1MHQ@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] tpm2-tools_git: Fix S (source dir) to match `destsuffix` of SRC_URI
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
X-List-Received-Date: Tue, 19 Sep 2017 18:09:37 -0000
Content-Type: text/plain; charset="UTF-8"

It's probably best to put "[meta-measured]" in the subject line so
everyone knows for which repository this patch is intended.

Philip: maybe that could be added to the README/MAINTAINERS file(s)?


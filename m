Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1E5786B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 12:33:22 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id i11so11471520wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 04:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qsDPoV+iUVkyWtoRmW4IPlUSrn0ZV0vUUyWMKF87dZc=;
	b=OSlnoyPW/lgUCMW8KU5TDoayGVfjUgtXQf/HFog+K9wKtV1zU+hmUQLscL1kvC5Qk3
	c7REt/t6qu8vVNlTtjzepXWT+Qd2CAH+aKBvLmOYy43A0+xbaB92zynwadl/ran6i0K5
	CIgvd25aEsDVkEF2LMzGo0M1nbRoOM06m/cUhvOVjEZJIcWDT9Q8MpQeD4Nd8HHl/TD2
	xRUTVySordH8L84kr0VCaForjtsA4deQeKMKf6KV4SJ+m/Hq9KYongSkPmNRZUiabY1E
	dDdhOAJMXSTF+iy6TRAXdBNZj8lEomwxBzXJYUHr0JjSw5CWVPbC/2Hkqbk/8FVFxhhm
	7mnA==
X-Gm-Message-State: AKGB3mJt3CHdOr5gzkhiiByB1uHt/Ubk4y0Gz8TFzGKlT1cgKEeA6lCi
	zinLm30eh4WAtxv2W9Y9DAJD5R69
X-Google-Smtp-Source: ACJfBov+TbZVUF/xeyzrrqaG+vcer6OHZwbn5Qnn48+8xBy6mF818KuX7zzRu0fNqeJFiyTE8/gPWw==
X-Received: by 10.80.134.163 with SMTP id r32mr35040435eda.209.1515760403648; 
	Fri, 12 Jan 2018 04:33:23 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c2sm12081360edi.66.2018.01.12.04.33.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Jan 2018 04:33:22 -0800 (PST)
Message-ID: <1515760402.28972.39.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jan 2018 12:33:22 +0000
In-Reply-To: <20180112122942.22396-1-git@andred.net>
References: <20180112122942.22396-1-git@andred.net>
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
X-List-Received-Date: Fri, 12 Jan 2018 12:33:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-01-12 at 12:29 +0000, André Draszik wrote:
> 
[...]
> +HOMEPAGE = "https://troydhanson.github.io/uthash/"
> +SECTION = "base"
> +LICENSE = "BSD-1-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5cc1f1e4c71f19f580458586756c02b4"

Note that there is no common license file for BSD-1-Clause in OE-core, which
causes this warning:

WARNING: <image> do_rootfs: The license listed BSD-1-Clause was not in the licenses collected for recipe uthash

Is this really the first recipe using BSD-1-Clause?
Should a license file be added to OE-core, or is there a different approach
taken normally?


Cheers,
Andre'



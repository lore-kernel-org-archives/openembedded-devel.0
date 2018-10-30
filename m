Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5B71679C59
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:18:15 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id h13so369816itl.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7vl/Tw5fK+C8cWAneYZ1eiMQMXmL8XIz9efcnvYfwg0=;
	b=eJCOV5vTOhJUrx0UNnDV58eMf2vyRmPMQSKHJAs7SDHRxhTZ8IXwCTaWySQGTWxqXU
	5WSd0tbaX7A0zUaStjju6bnMBxbX2ohcgoRGoXFUHvOlU4yF32gI1nRtti7pjVicATMQ
	fb1EUGO6lSEfBolK32XP4gur6i2Ce5XvT1FKli7gZUzQONFfdpLlEAoJrJHNJHxqCy/l
	YAStixvnnXu5G/TQMipjYqmivs5H81i9jtG3U0aTnGiX30Vjw1pcUA7LdTByiCzhWQ0U
	hvIqF7L9zO7Hw45BVxY7qCJbujh+Kx5bgEufS/p4lTL9X3Kgu/v6thxqkINl4of+pMLt
	N/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7vl/Tw5fK+C8cWAneYZ1eiMQMXmL8XIz9efcnvYfwg0=;
	b=b6UPZ6D193/bgbkskFb3IwHqKP1s/HXxZg6KXyGhvUNbGsSktBs7s9jnt+WhzWLqJ2
	A+3upPwXDeECokkvzYDQYOOk46oflm+brLgl3d2NX6LOIGnO/d3tPFG3X3UXYDAMRbeC
	qxwMD8UTgtNY7ci6sjTZIVxjeXK0e+i1sdRqe/qtIsUqg1RDgnKHAp+ktJN+m0WVdeRg
	EI/xhoXTi+kyRVPaw4pjxmIhjQQcUuap9V8inntRXLA9AtCptJGd9iuXC/tTJzIajhOw
	qavmYjroxDzV1Ec0KzLiuu7tc2UXjLCZ9B4CB4XkgdgkqiMi+MEpzG6fmi/+K7VKOeqN
	khoA==
X-Gm-Message-State: AGRZ1gI46mteODPi2+YVTxZ4NjLMnGa/gPMQYwjV60EdejDtHxSbytRi
	z3jTqOEJM2POkfm4ibUD44c3KTGGdBnx1PAck1+hWzTU
X-Google-Smtp-Source: AJdET5eQFnOIaftdu2NTsHCh5kloUtCOOtLWImndXBrWgN7OngDE0SCrHjvVC07y1luTAiQNlixpiellP/uBDVRujR8=
X-Received: by 2002:a05:660c:a06:: with SMTP id e6mr915901itk.62.1540898296313;
	Tue, 30 Oct 2018 04:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<950a5e000cdf171ed8bce8d574a7f7d4b91c1fb7.1540830650.git.brendank310@gmail.com>
In-Reply-To: <950a5e000cdf171ed8bce8d574a7f7d4b91c1fb7.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:18:04 +0000
Message-ID: <CAJTo0La5tT0Z6Dyfkv_M0riNOBmgtu_K2NuJiK2uBznPvZyVSw@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 08/16] libgweather: add recipe for libgweather
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
X-List-Received-Date: Tue, 30 Oct 2018 11:18:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:42, brendank310 <brendank310@gmail.com> wrote:
> +SRC_URI = "git://gitlab.gnome.org/GNOME/libgweather.git;protocol=http;branch=gnome-3-28 \

Why not tarball (small, checksumed, easier to mirror)

> +FILES_${PN} += "${libdir}"

This breaks library packaging.

> +SRCREV="${AUTOREV}"

Never use this in mainline recipes.

Ross


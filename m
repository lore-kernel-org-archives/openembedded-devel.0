Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3ABCEB2C2
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 21:02:54 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.66150.1727730166471530793
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 14:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RgcovdpR;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-277fa3de06fso1856687fac.0
        for <Openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727730165; x=1728334965; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MbsJBNPY/XpvvAVURK1jnEQS8TCfJzQiQVGeac54MMM=;
        b=RgcovdpREvQbMzFDQ/ZJ63RpA2Gq/sPWLY9XO33pq0Sy/v9bHFDirU0/WYVjjMUBC9
         cEZgJ+wArfUoPrI6h4WbL8PcslVgqe7QSWagy19KhxGh6OyzwoxAJpuGxjxRBV3eo7P9
         9YcqdMKpFpq6AYg9mjtXpnXzHFaQ/2X/jN+d6eO1NuGdy4q9JAymyACRFGXVnesiPC1c
         CTeqES2WNUGV9ivTwAsND7OFZaSS+hwC9rK0juMAmvx5BEJvlvb0nnwmjxruk8PmBd1z
         i3nRVDAVTY5kRZmTVBxCMMAbdjEvsw98tT67vRJLKYa8NlspeUEVTGGHErbHMN+GXQ7V
         dkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727730165; x=1728334965;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbsJBNPY/XpvvAVURK1jnEQS8TCfJzQiQVGeac54MMM=;
        b=mH0RHsmveXKtYDKeFnNJVdXUxmVKz7lZ4pwTV0O+4UmXp7RPNxiV2TXhPHcqswYrwt
         BqQKhj4/TrSook46/cmdcu5CDsbJnfJu/u4B0uBLSstCKnJ50I2kG70N/sB2TVVpEP/w
         j1YwJBxovIPlY3c1r7rJOiREkLND1rAJDp7SgVTEdtsDji0fur44bE5R0D6YoeGaeoVb
         TlEb23o2KdHC3fJbncRPg0Dgdk6Dg4iePtrG2z61DWJqr2HLcFhl5IAZLpKwRN9ynvSe
         wWfwPh0eXNItAWao3NNT93StpUdmAaw91PXqVmoGljWhkTHj0FcrPSPCo+F8ghMfpe25
         nmdQ==
X-Gm-Message-State: AOJu0Yzpy86MckEjkN6OFbkj+G7LN9VYrKUHcrdpYB2koy7BxyD/SL4i
	KqpPbxJWjYFvB34+CIfXA5YE1Cj2D13N3KV6qv0TAF1Vl7ZPx8DY+tT8G/2ggKI9LVfUct55Kpq
	0QpwkPRP89S9P3sh5yXQDLdKG2mOrIBSs
X-Google-Smtp-Source: AGHT+IHJOqcvZz0lR1JFCYin0u+8gcmI3jw3+5f3r2hNSjVcL8G3rlE2FpX14PJnoJBPWWkD+/IOZVLlO8mA+jGmRS8=
X-Received: by 2002:a05:6871:591:b0:278:8b:57b1 with SMTP id
 586e51a60fabf-28710bb8146mr8673359fac.35.1727730165298; Mon, 30 Sep 2024
 14:02:45 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Sep 2024 14:02:18 -0700
Message-ID: <CAMKF1sqjB8punqcXc6OtXSA3gX_Nu9B6xU4ib8sFK9h9jh3Opw@mail.gmail.com>
Subject: On ptests in meta-openembedded layers
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 21:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112615

Hi All,

As you might know we have recipe ptests enabled on meta-openembedded
layers. With recent
fixes in last few weeks, we have managed to run all ptest enabled
recipes to pass these ptests
which is a good progress. I would like to mention that if we are
making changes to any such
recipe in meta-python which has ptest enabled them please run the
ptests on the change before
submitting the patch. I will also enable ptest run for meta-python in
the CI job to run ptests
Eventually, I hope that other layers in meta-openembedded can reach
the same level
I hope we can keep the ptests working, so I will not accept patches
which regress the ptests
in meta-python for now.

To run ptests on qemux86-64 add ptests to DISTRO_FEATURES and then

bitbake meta-python-image-ptest-<RECIPE> && bitbake -ctestimage
meta-python-image-ptest-<RECIPE>

would build and run the ptests for RECIPE, to run a subset of recipes
there are predefined images e.g.

meta-python-image-ptest-fast - all tests that finish in ~1mins each
meta-python-image-ptest-slow - Run ptests which can take a bit to run
meta-python-image-ptest-all - Run every ptest enabled recipe in meta-python

Other layers have similar naming conventions

<LAYERNAME>-image-ptest-<RECIPE>

as well, in case you are interested in improving other meta-openembedded layers.

To enable ptests in recipes which dont have it would also be welcome.
Once ptests are
added and you want to add them to above ptest image mechanism then add it to

PTESTS_FAST_META_PYTHON or PTESTS_FAST_META_PYTHON vars defined in
meta-python/conf/include/ptest-packagelists-meta-python.inc

Other layers have similar mechanisms in place too.

Thanks
-Khem


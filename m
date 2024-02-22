Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D528EC54791
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 04:26:44 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.6184.1708575996980720942
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 20:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JOwRXmRR;
 spf=pass (domain: konsulko.com, ip: 209.85.214.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dbae7b8ff2so34826785ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 20:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1708575995; x=1709180795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FRxDtkpOtk7KzJTDGsu0JjdeYei0VbvXNPpC/QdEeJQ=;
        b=JOwRXmRRFT7LpsL+V7X1+DznJh5Zx5p9YyROUCeEbaErHmIoewtp5Ox1AkIrxOKiZG
         t1Cfi7Hpw20XNDVi1Cprany98rroH407671oxx7SL9d223pDFOQ7bajiNshcyOxp8PFz
         IJCryzkPvuoQCu/Fti3CAwtxGJsCIZT8khUV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708575995; x=1709180795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRxDtkpOtk7KzJTDGsu0JjdeYei0VbvXNPpC/QdEeJQ=;
        b=FGoHwuirNAv0Nq6bEYCV+2myplRSCBfSHDFFjQSyD3XX4pJ2C/+44mpgc08N8fuAy4
         AmT3muK0LP7MpkFdxaVdXozF9PKEhGNf6oAslkB0m8+IpU8mipz1lJLSS1YMxsAf/YNL
         kPyGf+CqTovLsllRn667vL7ePQ1CCY9jiCzyBBv16EgaP3kpW4jgDCXGZOUNe9J6sLAB
         zn4bIqLecuNdqSTJEAWzm8FXgcx+cyD9SOs5nyiVJAoI/KYWib2We7kP7Iool8GGMTdl
         87P282SxLhrh1GLbqbYbqhtMEm3pviD4eak9E8fx9bwVGZjB62CGvBw7lYQOqy9X//NE
         F9UA==
X-Gm-Message-State: AOJu0YwyVYOuRq3QnNsIOJ4MQ00CC90VudEHyn3T+/nWdN19tc9Z89SB
	p2LbATpaC4CrzJs4OeqZLrhd7yF9weBDO7CICNeNzYOnFgScaIlfIsnc2RwzJLR4At/rL1sdXpN
	Bc/Q=
X-Google-Smtp-Source: AGHT+IGRINPGjyiQbjyo7PxSDOil44qfoD8WI8bFGHC02hIYSitr9gU49mmQsN63KvReSLBmmIzXyg==
X-Received: by 2002:a17:903:445:b0:1db:917f:5a42 with SMTP id iw5-20020a170903044500b001db917f5a42mr17983240plb.3.1708575995462;
        Wed, 21 Feb 2024 20:26:35 -0800 (PST)
Received: from localhost ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id iy1-20020a170903130100b001d8accb025fsm8857487plb.197.2024.02.21.20.26.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 20:26:34 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/3] fix PTESTS_PPROBLEMS_*
Date: Wed, 21 Feb 2024 20:26:28 -0800
Message-Id: <cover.1708573650.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 04:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108978

When PTESTS_FAST_* and PTESTS_SLOW_* were added, we should also have added
PTEST_PROBLEMS_* for meta-*-image-ptest.bb and meta-*-image-ptest-all.bb
so that the BBCLASSEXTEND magic works, even for the "problem children".

This series makes meta-oe, meta-perl and meta-python behave the same as
oe-core (even the PTESTS_PROBLEMS are available there in core-image-ptest-*).

The following changes since commit 7f173ed0fb3d91200e22762f3f6c8b62955fc39e:

  netdata: version bump 1.43.2 -> 1.44.3 (2024-02-21 14:36:06 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/fix-PTESTS_PROBLEMS
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/fix-PTESTS_PROBLEMS

Tim Orling (3):
  meta-oe-image-ptest: add PTESTS_PROBLEMS_META_OE
  meta-perl-image-ptest: add PTESTS_PROBLEMS_META_PERL
  meta-python-image-ptest: add PTESTS_PROBLEMS_META_PYTHON

 meta-oe/recipes-core/images/meta-oe-image-ptest-all.bb         | 2 +-
 meta-oe/recipes-core/images/meta-oe-image-ptest.bb             | 2 +-
 meta-perl/recipes-core/images/meta-perl-image-ptest-all.bb     | 2 +-
 meta-perl/recipes-core/images/meta-perl-image-ptest.bb         | 2 +-
 meta-python/recipes-core/images/meta-python-image-ptest-all.bb | 2 +-
 meta-python/recipes-core/images/meta-python-image-ptest.bb     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.34.1



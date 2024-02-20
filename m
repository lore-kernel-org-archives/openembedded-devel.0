Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F93C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:32:11 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.6481.1708403531291177204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pf68f3Xb;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c1404d05bfso3442922b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 20:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708403530; x=1709008330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ww0bb5Px5I6f5aR2gSjEcFPlIWGlyzqX/7lWZD7colY=;
        b=Pf68f3XbSRqJZWyS4moAM+bBcbu6EzNnmbUoI8YsXcrnbxm9xlUdynhy4Rs/DQ6bvv
         Q4hMx5lyuawITTx+TOAOBLMrQkHyG1KMPjrx6rykEZ2Rt8MqIScBVI1iIjXWWmA0DaCl
         Q8TZW6zfx0xm/caV3xPlPeFSqd5rGdc8fpYMW+zsUNL8Exi+VcUUvtH+tRZOG/mPHxdp
         pAK0LkoQzA0c3S07Xzf9U4QFupQ5rDfKZKsBovpMVznB8J6uN3cU0njLrGSYYgWchBYq
         Wm/3q9GO31IIy9p92WQfE4C/LuOQBzcKX47xPXs6FyRNvJ2q5ryIP4M89hOWjk0xmyuY
         3v7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708403530; x=1709008330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ww0bb5Px5I6f5aR2gSjEcFPlIWGlyzqX/7lWZD7colY=;
        b=UglYvNUh1CxBhy5Rc1QGonVQNTCx2Ca+Nksyot33XrGN1akRsSch0Nhn9gY3eBiLnl
         4pxO6qVKriU3Hl+qWL+syxSMPYyBAi4EVe/CJ4GdIisgy9xN6nkhE5lKPqInb/rzGqG6
         V5pjiao9dE0XVNCqBGtva5FmhgCmygiot7Cb5N4aQw+mI+i0kEQjF5dojm/DFw2SJ10M
         cebhngKBQuFMgLP1tlKy5wxoGZw0ub+ueZmmbW9LqyTLiDV6YJ0IaEHTSZH6cpsHhf2i
         nosyQxRLOnAb55/TnwYOU4GjLvF249LLvg0XD7LztmT87zF81wZToxYrI4bL5U+1a+h6
         H6Ug==
X-Gm-Message-State: AOJu0YzY8p/8lhHUHIiA1McSfXkNC0e+g2fO/FWOSJWjGthqvN9WW056
	j97YEbTUmKbXyW4bk+Lb+eEKzPedEPmu+4llN6BpyhHc0DhyVyoPfDT4E8Wo
X-Google-Smtp-Source: AGHT+IH1tnzweR/qwAf7pPD4UVxP2SqT4N8ObzVUwIONi82s+Ul1Gw6Fw5Pbnr0mG2lXASVkonqqYA==
X-Received: by 2002:aca:2109:0:b0:3c0:3c3d:3671 with SMTP id 9-20020aca2109000000b003c03c3d3671mr13497461oiz.30.1708403530118;
        Mon, 19 Feb 2024 20:32:10 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id g14-20020a63110e000000b005dc88b232a5sm5490269pgl.26.2024.02.19.20.32.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 20:32:09 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 0/3] python3-prettytable update; fix ptests
Date: Mon, 19 Feb 2024 20:31:50 -0800
Message-Id: <cover.1708403129.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 04:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108907

The prior version did not run any ptests, since the test_prettytable.py was
not discovered by pytest. Also, since python3-pytest upgrade to 8.0.0 the
python3-pytest-lazy-fixture module was non-functional.

* Add python3-pytest-lazy-fixtures (with the s)
* Upgrade to the latest python3-prettytable 3.10.0
* Drop python3-pytest-lazy-fixture (without the s)

All the ptests for meta-python-image-ptest-python3-prettytable pass on qemux86-64:

$ resulttool report build/tmp/log/oeqa/testresults.json
==============================================================================================================
Test Result Status Summary (Counts/Percentages sorted by testseries, ID)
==============================================================================================================
--------------------------------------------------------------------------------------------------------------
Test Series | ID                                                                     | Passed    | Failed | Skipped
--------------------------------------------------------------------------------------------------------------
oeqa | runtime_meta-python-image-ptest-python3-prettytable_qemux86-64_20240220002104 | 171 (99%) | 0 (0%) | 1 (1%)
--------------------------------------------------------------------------------------------------------------
Total | 1                                                                            | 171       | 0      | 1
--------------------------------------------------------------------------------------------------------------

==============================================================================================================
qemux86-64 PTest Result Summary
==============================================================================================================
--------------------------------------------------------------------------------------------------------------
Recipe              | Passed    | Failed | Skipped | Time(s)
--------------------------------------------------------------------------------------------------------------
python3-prettytable | 166       | 0      | 0      | 0
--------------------------------------------------------------------------------------------------------------

The following changes since commit bd9086015b1485d8b16d91954f9140901fd9a0fb:

  meta-gnome: drop ${PYTHON_PN} (2024-02-19 19:57:38 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/python3-prettytable-update
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/python3-prettytable-update

Tim Orling (3):
  python3-pytest-lazy-fixtures: add 1.0.5
  python3-prettytable: upgrade 3.9.0 => 3.10.0; fix ptests
  python3-pytest-lazy-fixture: drop recipe

 .../ptest-packagelists-meta-python.inc        |  1 -
 .../packagegroups/packagegroup-meta-python.bb |  3 +-
 ...3.9.0.bb => python3-prettytable_3.10.0.bb} | 33 ++++++++++---------
 .../python3-pytest-lazy-fixture/run-ptest     |  3 --
 .../python3-pytest-lazy-fixture_0.6.3.bb      | 26 ---------------
 .../python3-pytest-lazy-fixtures_1.0.5.bb     | 21 ++++++++++++
 6 files changed, 39 insertions(+), 48 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.9.0.bb => python3-prettytable_3.10.0.bb} (67%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.5.bb

-- 
2.34.1



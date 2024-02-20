Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06F7C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 00:48:00 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.2708.1708390078293739605
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 16:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HyK6s4um;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c15dd2a1fdso903516b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 16:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708390077; x=1708994877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YKc6k3+8YZXgKjRf8kxWnYMnQuHLtjMo4iI7bHi52Sg=;
        b=HyK6s4umr7PV1j6trwoeAI1M32p0k4t2TyLR6xMsO0YELSa6RkeTI9+Fi4WKs9xa9W
         YSQWioSuiz64g8cJt8eE0bxR7ESOXgQHUFIflsLqVv2Pfo41dmEj8VTSslZVgQvEU3tN
         k8CGMv2XlSkx5nFBjaaBw/4Y16x0+h4KU3dOkB7FlBR+nuzWIXRkJ3VXHljPUr8KCZne
         SyW20FE09VIQOIu2iGk4I/jDLFnPWnzFjIx4Kn4hwza+Z9gtPeGbcuEWvkJ8OqgkD8V1
         CIVxbuNR1vl3MI8e3i2x+ahWz5Hyh7OTt5DUNu9Ec24fU1k0wAAqce1dwb6Qia1hzird
         3oDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708390077; x=1708994877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKc6k3+8YZXgKjRf8kxWnYMnQuHLtjMo4iI7bHi52Sg=;
        b=QeZw18m5ghbNrOV34FiKnoFzS9hgP6GzE5m3gE9vopSCEuWGnqTsLOahw+KvBkWSIo
         A/1IskTT2iUb6dZBCNdcTa1CodmxDOScd+p3wWWjrlQHSBOWw4wy9VN8giNjaGpcZKzw
         q0BUZJ8BmCWAIbyHM/gx2nnrF1EZU8CLL3RM9DvWYMqW23Q1i9SlvAI6Ol1MXeKIoTxG
         J/rEndUeP32qV+vbjfnynfd1ssJezlHEu76PUm/9eWYze+pYA0CyZqQCvyCH67xvCwLh
         6GDnoztBY7NkOHxG2jKx4XVAD9H4oYowfqTk//9tA35g+6Ih568w8Ug0h16g2Qm72db9
         pHCA==
X-Gm-Message-State: AOJu0Yx89kNofXZsCCHUHdBiH3OdauCZFCxManF4KPPRbk8fUZiPtO34
	dvf0wJZe0hv/NEZP2HMCxHN/5ZlIcanE9DVviVMtHxZxPsGZmkjCZeAG7uft
X-Google-Smtp-Source: AGHT+IF+28hD8ZxPwkv0EugARYLWc2SUuOf1iRuwQad+5E9p9KGau4AIfAqed+/OYip4UI4nc5mm5w==
X-Received: by 2002:a05:6358:988e:b0:17a:d7c3:96ea with SMTP id q14-20020a056358988e00b0017ad7c396eamr18753718rwa.11.1708390076947;
        Mon, 19 Feb 2024 16:47:56 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id e15-20020a056a0000cf00b006e3be1a64f7sm4101548pfj.160.2024.02.19.16.47.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 16:47:56 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/3] python3-prettytable update; fix ptests
Date: Mon, 19 Feb 2024 16:47:43 -0800
Message-Id: <cover.1708389659.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 00:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108894

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

The following changes since commit ae28f34aab8c7e32e610446fe82868dc020e088a:

  python3-meson-python: move to oe-core (2024-02-19 10:22:55 -0800)

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



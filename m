Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C331AD2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 07:03:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1471.1768892614829195502
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 23:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OSu8Sfae;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430fbb6012bso4190265f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 23:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768892613; x=1769497413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=daqUGFVNc/8lf3dXEhRQqtWkaEb8mRV9Q5Yxf9KW6mw=;
        b=OSu8SfaeALQGlSvjt8RtXMxlHx2QGxR2pH8xLBrk+G0dqXbneKvUoiVdXdwkfiY34o
         C+LfJZU8Jq8XgWItk902aQs4YdxzMKTs+QqGoYJNqFzynDUbjCEHvhFBLAim+349E2tL
         UbmrmrZ1zuXF17nxqL6FWPf8sOTTQxWGQxBh8kSRSeZmcKkpwpSEmVIO8TWHR13/9XkE
         W7q7V3OLcixu4YBX7SYtwE6FtA6yxCM/mEYkaAQkkMLY23EcKN+89eqVExmArNPauycO
         JiW0Cq6RLC77gsNeMmJr8Kl6XNV4A8/H9ASY4da3cGDmZqJKy36h0YT00SJhn9MQNRuo
         bWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768892613; x=1769497413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=daqUGFVNc/8lf3dXEhRQqtWkaEb8mRV9Q5Yxf9KW6mw=;
        b=MHMTYfDac9Tto7Cmsh0dn8qCCvhPnYuDNmXA6z8e5jptDvFQ5oJEOO7+DFMsyBNzFJ
         egNdSxXbr9+QI74GYC6Mbu2jvSupllp9tab3tqfAvw22nHbqW36TlQ9fTBElPnyLXb3I
         RioWuWeBdCg3oYQilITFs18nQf4LDr/o0LIDT8mFLVuRe+i47CIUHItxOGFSoDoKOc9D
         02wVMfhpgL/lVx6X7AddXF1OvgTmGApVcXHuBKvjSt5HZWFUEYQ82/Li57g1Le7ZlpGB
         n40UwB1qde+hMt/dx2JEQQRO1GmCtSG4y5Jv+yUcOLUxfllpBAeNiOIM02sgAEuMZg/t
         M5IA==
X-Gm-Message-State: AOJu0YzS1iY5sGaR3lKudKdcqMJNmZlM9b0iuLi2Eq688TksjcuRvRMj
	b+Ou/2IuOWcXJEJRRURLYmFVJ4O8TJa05OaWrbr9rwNeOAxR40jZW+/neI6OHw==
X-Gm-Gg: AZuq6aIbb3mLUDN1fb2zBltp06EV9UwJWb9p9tMZb4fLZ5OGBDgEG9hBlpGoZ7KJE0g
	35AEmZiLIIqF8St5rcLx9oreULb6C+IWBjMMZeqgsNCNcgK/lvq6KNceJJZbnAdtHaV1ceIbdFZ
	8InkFUvAguFMoaUdOr+texL1n4XoayGQvUnlQt5VWKmE83TFQ5B9ILimpFg88Go+J+mYA0akvzk
	MahvNGIvaUZ8TEurfdIHuTVCoIBCyBE6TT5BeFnyPd1RqWIu1FZlsXQJKpsGoegxxuU1mSLFz5i
	oWYMlVZrn09hpBEQfj4cJH/wHT1DsZ5CU/EAQshYKVlFzDMKYClAAMXzvBS+zFDv5P494a5Eo/f
	INjl6VC4WPChmiOlIVR6ENLBEpyYsry4MpUHiShxBo30QJPqqRUEZ59Si9G64kYMNobrRZHYZRE
	dhS6Rrzn6U
X-Received: by 2002:a5d:584a:0:b0:42c:b8fd:21b3 with SMTP id ffacd0b85a97d-4358ff39e8amr1127894f8f.57.1768892612771;
        Mon, 19 Jan 2026 23:03:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm28270837f8f.3.2026.01.19.23.03.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:03:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Kirkstone Pull Request Jan 20th
Date: Tue, 20 Jan 2026 08:03:31 +0100
Message-ID: <20260120070331.5050-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 07:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123660

This PR intentionally concentrates exclusively on the python3-django recipes.

There are some (non-django) patches on the ML for Kirkstone since the last PR
that are not included here. Those patches are not forgotten, but this particular
PR's goal is to fix these specific recipes that regressed in this branch over time.

Beside the regular ptest-enabled recipes, the below ptest artifacts include test
results from all 3 python3-django recipes, without Selenium tests. The recipes
themselves in the meta-oe layer are however not enabled for ptest, because the tests have
dependencies which are not available in meta-oe. The used bbappends are available
in the meta-oe-test layer (along with the dependencies), if anyone would like to
replicate the results.

As previously mentioned in the ML, there is one failing test for python3-django_2.2.28 recipe.
This particular recipe is executed in a custom testimage that is expected to fail, 
all other ptests are running in images which are expected to succeed.

World build arm: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21099599067
World build aarch64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21099722170
World build x86: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21101293918
World build x86-64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21108269303
Yocto Project Compability Check: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21112686733
Ptest results (logs attached to Github actions run): https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21143653380

Please let me know if you have any questions or comments.

===========

The following changes since commit 7d4507f226bd2af939d4482fb14a809867ece939:

  libsodium: patch CVE-2025-69277 (2026-01-12 13:48:02 +0100)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut

for you to fetch changes up to 8f5f5cf4b335a09313c48394c62bfb614868fc1e:

  python3-django: (4.2.27) add back setuptools3 support (2026-01-19 15:24:39 +0100)

----------------------------------------------------------------
Gyorgy Sarvari (12):
      python3-django: fix intendation error in CVE patch
      python3-django: fix regression from CVE-2024-24680 patch
      python3-django: implement group method for FakeMatch
      python3-django: handle non-existing import from CVE patch
      python3-django: fix hostname length validation in URLvalidator
      python3-django: (v2.2.28) fix ipv6 validation
      python3-django: (v2.2.28) fix tests
      python3-django: (v3.2.25) fix ipv6 validation
      python3-django: (v3.2.25) fix tests
      python3-django: fix CVE-2023-36053 patch
      python3-django: upgrade 4.2.26 -> 4.2.27
      python3-django: (4.2.27) add back setuptools3 support

Haixiao Yan (2):
      python3-django: Fix undefined _lazy_re_compile
      python3-django: Fix missing JSONField in django.db.models

 .../0001-Fix-tag_strip-tests.patch                 |  37 +++++
 ...-Fixed-URLValidator-crash-in-some-edge-ca.patch |  56 +++++++
 ...utils.tests.HTMLEqualTests.test_parsing_e.patch |  32 ++++
 .../0001-add-back-setuptools-support.patch         | 179 +++++++++++++++++++++
 .../0001-Fix-patch-for-CVE-2023-36053.patch        |  43 +++++
 .../python3-django/0001-Fix-tag_strip-tests.patch  |  37 +++++
 ...-Fixed-URLValidator-hostname-length-valid.patch |  30 ++++
 ...-Fixed-URLValidator-crash-in-some-edge-ca.patch |  57 +++++++
 ...ed-35172-Fixed-intcomma-for-string-floats.patch |  30 ++++
 ...ctdb.tests.InspectDBTestCase.test_custom_.patch |  45 ++++++
 ...utils.tests.HTMLEqualTests.test_parsing_e.patch |  32 ++++
 ...TestResultTest.test_pickle_errors_detecti.patch |  59 +++++++
 .../python/python3-django/0001-fix-ipv6-test.patch |  34 ++++
 ...-fix-quote-type-in-expected-error-message.patch |  31 ++++
 ...0001-implement-group-method-for-FakeMatch.patch |  42 +++++
 .../python/python3-django/CVE-2024-41991.patch     |  18 +--
 .../Fix-missing-JSONField-in-django.db.mo.patch    |  77 +++++++++
 .../Fix-undefined-_lazy_re_compile.patch           |  49 ++++++
 .../python/python3-django_2.2.28.bb                |  15 +-
 .../python/python3-django_3.2.25.bb                |   3 +
 ...3-django_4.2.26.bb => python3-django_4.2.27.bb} |   9 +-
 21 files changed, 901 insertions(+), 14 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fix-tag_strip-tests.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.27/0001-add-back-setuptools-support.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fix-patch-for-CVE-2023-36053.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fix-tag_strip-tests.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-32298-Fixed-URLValidator-hostname-length-valid.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-35172-Fixed-intcomma-for-string-floats.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-inspectdb.tests.InspectDBTestCase.test_custom_.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Made-RemoteTestResultTest.test_pickle_errors_detecti.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-fix-ipv6-test.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-fix-quote-type-in-expected-error-message.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-implement-group-method-for-FakeMatch.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/Fix-missing-JSONField-in-django.db.mo.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/Fix-undefined-_lazy_re_compile.patch
 rename meta-python/recipes-devtools/python/{python3-django_4.2.26.bb => python3-django_4.2.27.bb} (52%)


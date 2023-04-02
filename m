Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0832FC77B60
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:01 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.56512.1680474591637801602
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ch83NESl;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id q102so25467661pjq.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPiTUHU0VnDcd088LF4IkNAk5R9ldWuX+2+sAeKyf50=;
        b=ch83NESl4mVfPU3NUWgGzyY8qpBnqYg9yzFlrZkw0kiNPRYstf8fMNAMGRDP04ZHmC
         gqA1vY6ni7Q2fNhyqTlafeDCK4jgQKTkt6SuG3LstGJ6i1CJl95avkWV5HM/jyqQFQg2
         b8KcWOwOT/IWVStMfg0QEQHrOp9nBAuvKcrkQfXxyGia5sf+PgfmaELNkIeiCQo6Msxj
         9xQ1zvNy5uqC4FvVJKeQs/KpmCKCIWYqU6Wj+7o/KfPKL33cutGOqltyNka0M/yCqvum
         qLnZG5cOU46UC4qXbixZl9BwYjX+MH023NjAmj1y46j2jNI7lj8lPRnEhsHi4bO6rSpK
         eEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KPiTUHU0VnDcd088LF4IkNAk5R9ldWuX+2+sAeKyf50=;
        b=icjVhn3yPQuPnzAwyEyxYwrQRdX6uLu0DlD8Xb9rcd0u5xZPDtkPIwWLnjT9ASAPNh
         pk0pLwKGqQrF3oeWiYLz7T+j4C7ATEQsmLH4RssIG/5AekLuJBt3zbfIkOIRjzifzklD
         N1/oZw/UNIcVdFlkmn0LSafFkHeHaXC43f4+nZyuz2tIZKQAt45vi6stq4tY5x2NS28e
         agYDt7i+q9fl+gm3l7WO++1X+nszQRCgbweS/ibwOGfXsII//yuN9WXVekp8L0OgV8SF
         1/W8ZknYib3M74I3J+q1Nc42qv011zmG5y5AXhuaTIqI8iNOkjYg0JXaLnls9VDzI9j+
         Bq0w==
X-Gm-Message-State: AO0yUKVRRMeJZjsopPc6z3XQnJvYMK02NaE7Ax8+Z/IZAbjz3zSR9RLV
	6+yu3T8OfQespRtYNJIMCOcgT6rPm5g=
X-Google-Smtp-Source: AK7set86Ekh+V9XUhxUVEBx36SBZj7oQJrHLP4nq52tos7BWoHVYyLB2bgYV2WG/JneTz+zgYIBsjg==
X-Received: by 2002:a05:6a20:669f:b0:d7:380b:660 with SMTP id o31-20020a056a20669f00b000d7380b0660mr28228741pzh.3.1680474590168;
        Sun, 02 Apr 2023 15:29:50 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.29.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:29:49 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/11] Refactor meta-oe, meta-perl, meta-python ptests with BBCLASSEXTEND parallel execution
Date: Sun,  2 Apr 2023 15:29:32 -0700
Message-Id: <cover.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101878

This series implements parallel ptest execution, similar to
"core-image-ptest: Switch to BBCLASSEXTEND parallel execution"

Refactor meta-*-ptest-image.bb for an image per ptest in the form of
meta-*-ptest-image-XXX using class extensions.

* Add meta-*-ptest-all-image.bb depends on ALL meta-*-ptest-image-XXX in meta-*
* Add meta-*-ptest-fast-image.bb depends on meta-* ptests which take less than ~30s

This allows parallel execution of the tests.

The downside to this approach is the parsing time of an image generating
this number of class extensions is slow but making it easier to execute
and collect test data should outweigh that.

A useful advantage is that the dependencies of each ptest package are
checked/tested individually.

Add to local.conf:
IMAGE_CLASSES += "testimage"

All the meta-*-ptest-image-XXX can be built with:
$ bitbake meta-*-ptest-all-image

Subsequently, al the ptest images can be run with:
$ bitbake -c testimage meta-*-ptest-all-image

You will likely want to limit the number of parallel image tests:

BB_NUMBER_THREADS = "4"

based on the number of TAP devices you have defined or the number of simultaneous
QEMU sessions your server can support.

Results can be summarized with:

$ resulttool report tmp/log/oeqa/testresults.json


Call to arms:

1. When upgrading recipes that have ptest enabled, run testimage
   $ bitbake meta-*-ptest-image-<pn>
   $ bitbake -c testimage meta-*-ptest-image-<pn>
2. Help move recipes in PTEST_PROBLEMS_* to a state where all ptests pass
3. Test on architectures you care about and report problems.
4. Enable ptest in more recipes:
   * inherit ptest
   * provide a run-ptest script
   * add to conf/include/ptest-packagelists-meta-*.inc
5. Migrate python recipes which use pytest to the new "pytest --automake" methodology
6. Enable this methodology in more meta-openembedded layers.

The following changes since commit 17243e70c8309751a1129a9214899ec476ab121a:

  python3-betamax: fix ptest failture of fixture and record modes (2023-03-28 10:44:00 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/ptest-refactoring
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=timo/ptest-refactoring

Tim Orling (11):
  cli11: do not inherit ptest
  span-lite: do not inherit ptest
  ptest-packagelists-meta-oe.inc: add ptest recipes
  meta-oe-ptest*-image: enable BBCLASSEXTEND parallel execution
  ptest-packagelists-meta-python.inc: add ptest recipes
  meta-python-ptest*-image: enable BBCLASSEXTEND parallel execution
  python3-aspectlib: fix ptest
  ptest-packagelists-meta-perl.inc: add ptest recipes
  recipes-perl/packagegroups: move to recipes-core/
  recipes-perl/images: move to recipes-core
  meta-perl-ptest*-image: enable BBCLASSEXTEND parallel execution

 .../include/ptest-packagelists-meta-oe.inc    | 60 ++++++++++++++
 .../images/meta-oe-ptest-all-image.bb         | 25 ++++++
 .../images/meta-oe-ptest-fast-image.bb        |  6 ++
 .../images/meta-oe-ptest-image.bb             | 38 ++++++++-
 meta-oe/recipes-support/cli11/cli11_2.3.2.bb  |  3 +-
 .../span-lite/span-lite_0.10.3.bb             |  1 -
 .../include/ptest-packagelists-meta-perl.inc  | 50 +++++++++++
 .../images/meta-perl-base.bb                  |  0
 .../images/meta-perl-image.bb                 |  0
 .../images/meta-perl-ptest-all-image.bb       | 25 ++++++
 .../images/meta-perl-ptest-fast-image.bb      |  6 ++
 .../images/meta-perl-ptest-image.bb           | 41 ++++++++++
 .../packagegroups/packagegroup-meta-perl.bb   |  0
 .../images/meta-perl-ptest-image.bb           |  9 --
 .../ptest-packagelists-meta-python.inc        | 82 +++++++++++++++++++
 .../images/meta-python-ptest-all-image.bb     | 25 ++++++
 .../images/meta-python-ptest-fast-image.bb    |  6 ++
 .../images/meta-python-ptest-image.bb         | 38 ++++++++-
 .../python/python3-aspectlib/run-ptest        |  2 +-
 .../python/python3-aspectlib_2.0.0.bb         |  4 +-
 20 files changed, 405 insertions(+), 16 deletions(-)
 create mode 100644 meta-oe/conf/include/ptest-packagelists-meta-oe.inc
 create mode 100644 meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb
 create mode 100644 meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb
 create mode 100644 meta-perl/conf/include/ptest-packagelists-meta-perl.inc
 rename meta-perl/{recipes-perl => recipes-core}/images/meta-perl-base.bb (100%)
 rename meta-perl/{recipes-perl => recipes-core}/images/meta-perl-image.bb (100%)
 create mode 100644 meta-perl/recipes-core/images/meta-perl-ptest-all-image.bb
 create mode 100644 meta-perl/recipes-core/images/meta-perl-ptest-fast-image.bb
 create mode 100644 meta-perl/recipes-core/images/meta-perl-ptest-image.bb
 rename meta-perl/{recipes-perl => recipes-core}/packagegroups/packagegroup-meta-perl.bb (100%)
 delete mode 100644 meta-perl/recipes-perl/images/meta-perl-ptest-image.bb
 create mode 100644 meta-python/conf/include/ptest-packagelists-meta-python.inc
 create mode 100644 meta-python/recipes-core/images/meta-python-ptest-all-image.bb
 create mode 100644 meta-python/recipes-core/images/meta-python-ptest-fast-image.bb

-- 
2.34.1



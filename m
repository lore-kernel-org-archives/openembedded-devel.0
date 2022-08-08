Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC047C3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:08 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.26237.1659968699120725992
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JjL6BYSd;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso14717387pjf.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QkNeApRcdCSJfaKSFrq4nApbubRt9NivCJVhqCZWRbM=;
        b=JjL6BYSdHbk76Q0xvTDo7tDIMLpkwyJzc+wbhrheNYUA5fw8yZDbzytkKhd+11SoDG
         7PzozIplO7nW1X6s6HnglKoMDv9TOyVSBsoEI60JVBQCgyn6eLePajaAJXWAfZHfKsKh
         X+M08MNdPd3yLeQTZp6+d4WVEbzxyvuWLks8FJxB1jZHg/KY2T1cetlonJRCbH11wWs+
         UUaNOhh6npu7612uUuwaex0Jcw7M2IjrIn+6kYAbjeNe8sEOacUnHXvCu6hiEjKzk56x
         TXk2aafkX1fVg1deyO68loTR6pt6uJLiRDOqBBOd6MR3iX8DWKbCnOeeGp4mXo9BJ9HH
         hLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QkNeApRcdCSJfaKSFrq4nApbubRt9NivCJVhqCZWRbM=;
        b=q7kIuTOL+R7Ko0D74P7nZBe1WHyS8wPY+0rOyL0HN79JztLWJ3fhX88RdwwKEiHcOh
         geemMH47lwDm0fWkUgcSKHUenMEpW6jAT4C0alls2iu88ZP484aJv8hgLr5cYN7wScVS
         9nMVrq6+xnr6qERGMhqSd+ty1awWOKqH6wxqVEHE3UA0kP4Hp1As5jYNv4HLxdB+Br27
         o0PJDwD3vyo0qhXb1KwCv6bUSdug1BOZo1h0pA1H3MmdsIA6Q9RcmbYFxAnAw/WjoeTD
         m9lr1QjWVyI/zwW0bLpInLIb35/WTHwinMJHedQ92h9Nw2IW8r/2uAKuDqafcwakBzau
         oSfQ==
X-Gm-Message-State: ACgBeo2VuE1+2BhLRfoCbDc1jbcZm6o/jDaToggNsKL07G1KJ6CNyVuT
	q3sUmHA7jN6Z951noA90xrT3TVXcFHk=
X-Google-Smtp-Source: 
 AA6agR6xCy82QMPhEGFxBAwbImDmTEqYPU/KPhkwz+9O9my254VI9S72UiCkCtijge4Dh6I041pYVw==
X-Received: by 2002:a17:903:2c7:b0:16c:ebf6:db22 with SMTP id
 s7-20020a17090302c700b0016cebf6db22mr18933041plk.16.1659968697900;
        Mon, 08 Aug 2022 07:24:57 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.24.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:24:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 00/13] Patch review
Date: Mon,  8 Aug 2022 07:22:39 -0700
Message-Id: <cover.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98160

Please have comments back by Wednesday.

The following changes since commit 8f2dc1023482863e2630d1b94052c41ce748b38f:

  tracker: upgrade 3.3.1 -> 3.3.2 (2022-07-26 07:27:26 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut

Akash Hadke (1):
  polkit: Add --shell /bin/nologin to polkitd user

Anuj Mittal (1):
  yasm: fix buildpaths warning

Khem Raj (1):
  ibus: Swith to use main branch instead of master

Marta Rybczynska (1):
  polkit: update patches for musl compilation

Martin Jansa (1):
  glmark2: fix compatibility with python-3.11

Mingli Yu (6):
  net-snmp: set ac_cv_path_PSPROG
  postgresql: Fix the buildpaths issue
  freeradius: Fix buildpaths issue
  openipmi: Fix buildpaths issue
  apache2: Fix the buildpaths issue
  frr: fix buildpaths issue

Vyacheslav Yurkov (1):
  polkit: add udisks2 rule

Yi Zhao (1):
  polkit-group-rule-udisks2: fix override syntax in RDEPENDS

 meta-gnome/recipes-support/ibus/ibus.inc      |   2 +-
 ...01-version.c-don-t-print-build-flags.patch |  41 +++++++
 .../freeradius/freeradius_3.0.21.bb           |   1 +
 .../recipes-protocols/frr/frr_8.2.2.bb        |   5 +
 .../net-snmp/net-snmp_5.9.1.bb                |   1 +
 .../openipmi/openipmi_2.0.32.bb               |   4 +
 ...b-fix-compatibility-with-python-3.11.patch |  76 ++++++++++++
 .../recipes-benchmark/glmark2/glmark2_git.bb  |   3 +-
 ...-config_info.c-not-expose-build-info.patch | 110 ++++++++++++++++++
 meta-oe/recipes-dbs/postgresql/postgresql.inc |   8 ++
 .../recipes-dbs/postgresql/postgresql_14.4.bb |   1 +
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |   5 +
 .../files/50-org.freedesktop.udiskie.rules    |  24 ++++
 .../polkit/polkit-group-rule-udisks2.bb       |  17 +++
 ...ded-support-for-duktape-as-JS-engine.patch |  20 ++--
 ...0004-Make-netgroup-support-optional.patch} | 103 ++++++++--------
 ...ke-netgroup-support-optional-duktape.patch |  34 ++++++
 .../recipes-extended/polkit/polkit_0.119.bb   |   4 +-
 ...make_exports.awk-not-expose-the-path.patch |  32 +++++
 .../recipes-httpd/apache2/apache2_2.4.54.bb   |   1 +
 20 files changed, 426 insertions(+), 66 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-compatibility-with-python-3.11.patch
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch
 create mode 100644 meta-oe/recipes-extended/polkit/files/50-org.freedesktop.udiskie.rules
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
 rename meta-oe/recipes-extended/polkit/polkit/{0003-make-netgroup-support-optional.patch => 0004-Make-netgroup-support-optional.patch} (74%)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0005-Make-netgroup-support-optional-duktape.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0001-make_exports.awk-not-expose-the-path.patch

-- 
2.25.1



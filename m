Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C669FC433EF
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:26:49 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.158.1651422406704686841
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fa/XPNt+;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id i24so10660878pfa.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xxp4N5sQm34od6G4r2bzggvtdjkFRVOSoW9ON//I8cg=;
        b=fa/XPNt+NGlMDZVKqTgHMGQjEAcbjV9BqKzpeq/UVX0rfEvDXWZ2YE85Hf8+e+kns7
         /qkuXhyf3oQlPeYZGsgKIprD6dzQTEAJg0U4k5Kl6Z/VvlrF2A5/Fy8+tEbevLZb8fCg
         jz3QFkhBK/nJ1S72nPSnyT55gOXTW7AUBYL3eNOtqspKT37+RIvLWKXu1eSuoIwD2IRJ
         Wm8pAi17/25DETdHN10xqsuUUZxP6SCo8C6PX6Xg90h7OPdId+xc3px6pfhCpOM23OJN
         VnZ5GfZDmjnrbshyc+lsYSy8J1hQ4cKul/2/7O1Dqk43HbnGRxZBk17oG5uYPJeN+JbG
         64hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xxp4N5sQm34od6G4r2bzggvtdjkFRVOSoW9ON//I8cg=;
        b=7nTGiNWiMVe9Vdt3QafRyY4HrX+0vlkcA7a5JPHs+TtAkHGKS/mKG2uvEdqGfnOhaM
         /X2rcngXEA+PQwcsBmbt8Z7hobccRfboDQcTbvbHrDQVABKValNW8RE8ME3QYc6KvpCR
         WETH1aysK/voVBk2K81PeoRIqgAUW2DKSgHi6lC7k2Da6h73a3o9ja7MUdr9TInrgvVg
         cDAm2a6InaA2/6uRgoD+YOcHTRTwnkQxp9UBF6Qdkro3gemLPrrGPpyCYo7370Fw5MFZ
         8rHbnNtp1g/JDst1RVLbA+YQ3bpMGZgH3fBdrnPyyvqreOa6aLppTkWDROzWg8HCjRCO
         QUjg==
X-Gm-Message-State: AOAM530d9r8XjShOUEdh437Fgi2QRbIdQxx6hSerGRIlOf2pDaRh+qL5
	vQjxa09PDptUD9aihTGNF66pqsKlHJz/UA==
X-Google-Smtp-Source: 
 ABdhPJxyaTXBjqyNLTbvaSTkanWOvKhnQ8gIaDxl+EudBCnrk8Q0z3Zwv/aLqjhQXOixwX8waACGDw==
X-Received: by 2002:a05:6a00:230d:b0:4f6:ec4f:35ff with SMTP id
 h13-20020a056a00230d00b004f6ec4f35ffmr7777546pfh.53.1651422405712;
        Sun, 01 May 2022 09:26:45 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:9a0c:5968:29f0:efcf])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b0015e8d4eb243sm3063569plc.141.2022.05.01.09.26.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:26:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 00/10] re-org layers
Date: Sun,  1 May 2022 09:26:33 -0700
Message-Id: <20220501162643.513646-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:26:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96912

This series enables meta-networking to drop the layer depends
on meta-python.

Armin Kuster (10):
  crda: move to a dynamic-layer for python
  cyrus-sasl: move from meta-networking to meta-oe
  netplan: move from meta-networking to meta-oe
  nvmetcli: move recipe to meta-oe
  packagegroup-meta-oe: update pkg group
  python3-ldap: move to meta-python
  packagegroup-meta-python.bb: update pkg group
  firewalld: move to dynamic meta-python layer
  packagegroup-meta-networking: update pkg group
  meta-networking: drop meta-python layer depends

 meta-networking/conf/layer.conf                            | 1 -
 .../crda/0001-Make-alpha2-to-be-3-characters-long.patch    | 0
 .../crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch    | 0
 .../crda/crda/crda-4.14-python-3.patch                     | 0
 .../crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch  | 0
 .../crda/crda/fix-gcc-6-unused-variables.patch             | 0
 .../crda/crda/fix-issues-when-USE_OPENSSL-1.patch          | 0
 .../crda/fix-linking-of-libraries-used-by-reglib.patch     | 0
 .../meta-python}/recipes-connectivity/crda/crda/make.patch | 0
 .../crda/crda/use-target-word-size-instead-of-host-s.patch | 0
 .../meta-python}/recipes-connectivity/crda/crda_3.18.bb    | 0
 .../recipes-connectivity/firewalld/files/firewalld.init    | 0
 .../recipes-connectivity/firewalld/firewalld_0.9.4.bb      | 0
 .../packagegroups/packagegroup-meta-networking.bb          | 6 +-----
 .../netplan/netplan/0001-Makefile-do-not-use-Werror.patch  | 0
 .../netplan/0001-Makefile-fix-parallel-build-failure.patch | 0
 .../0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch     | 0
 .../recipes-connectivity/netplan/netplan_0.104.bb          | 0
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 7 +++++++
 .../0001-sample-Rename-dprintf-to-cyrus_dprintf.patch      | 0
 .../cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch             | 0
 .../cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch       | 0
 .../cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch   | 0
 .../debian_patches_0014_avoid_pic_overwrite.diff           | 0
 .../cyrus-sasl/cyrus-sasl/saslauthd.conf                   | 0
 .../cyrus-sasl/cyrus-sasl/saslauthd.service                | 0
 .../recipes-networking}/cyrus-sasl/cyrus-sasl_2.1.28.bb    | 0
 .../recipes-support/nvmetcli/nvmetcli_0.7.bb               | 0
 .../recipes-core/packagegroups/packagegroup-meta-python.bb | 1 +
 .../recipes-networking}/python/python3-ldap_3.4.0.bb       | 0
 30 files changed, 9 insertions(+), 6 deletions(-)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/crda-4.14-python-3.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/make.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda_3.18.bb (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/firewalld/files/firewalld.init (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/firewalld/firewalld_0.9.4.bb (100%)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch (100%)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch (100%)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch (100%)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan_0.104.bb (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.conf (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.service (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl_2.1.28.bb (100%)
 rename {meta-networking => meta-oe}/recipes-support/nvmetcli/nvmetcli_0.7.bb (100%)
 rename {meta-networking/recipes-devtools => meta-python/recipes-networking}/python/python3-ldap_3.4.0.bb (100%)

-- 
2.25.1



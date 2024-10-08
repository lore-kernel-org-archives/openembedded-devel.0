Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A2ECEFC38
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 17:36:43 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.1896.1728409002825775396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 10:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SLwb4mA5;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e28833f1c31so31861276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 10:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728409002; x=1729013802; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdU/Sk1YkUiTS5KyuATLimT8MfK15asKjD0Y1gApO8g=;
        b=SLwb4mA5AeYYqVHzNkDsk3+/CMfbk6+kSd32pmQzVUZOKYijRckfPVSFGRli5dOUGo
         eS/om4R/Hehi3+4ZYYYNp7ZdDvAhTwoYaHYobXzU1Xa4u9VBnZGEWF7x+EXZReQSYrOZ
         +bhkrQxPsUdzbdBm8saI6j+o8JR6fxW2/FkZ/juUL26Pcp0ZFtorEqUoNfzhzHM/VcHM
         2yVIgufDyjNrioino4wfdAgC12PJQmeuaPnGlXTBzfCMhLXPYvJa97N351PZKnPQRDuS
         q1PBJWggxAMEpUVQf9C59pejy3xLbFQuMks87y/aXb5RoTiCWDy1l5qZxa7lXSG4019H
         taiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728409002; x=1729013802;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdU/Sk1YkUiTS5KyuATLimT8MfK15asKjD0Y1gApO8g=;
        b=bd9yhptvEDsZ9FfxPmKbd8Z/6JmpXjyRk9tmh090kPJdRtmILTZ2dE7rjhleR6wPBf
         KKqD3etWI51Jvr2cNm+5XmYLrruD7W0tQ3CXZ5Zaf5zUAnzEQPKki7C88AToRXC+3MNl
         KYBS6XaPN+mmRC4Ub8hpIQrZGY8CAI2C3MTG2lrQYNITn7SpRD7a4E4RNM9qsQricmtZ
         7y2IrUxy/kJPI4MldLud9eAuWB4EbQdINN38pfkT+36AXdl4VPaYcCJIMX69wCZUz/Qe
         mc3Jg92SHsLuoULwcruSZr6pNivOlawDmzdKqPaEsAJHpY3s7TcJSDhzjYQHeC1YxFbE
         l2Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUFz4Z7xJ8A79XhxvMR+gxVEhXiRa0j5cG7oJniARtA4b71SPDf7PrQ69MwvoYlzWuesn591pokPFsDCgwlD8MvEmM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzc0mS+QVQzRsQG+7TkuagANM1SlaOnFMck0Tmg+RFgf+dyKmU9
	Ni47E6JXZG+Nq4n4lCEl/1V6JlvY6gxfofkP/8xcay4K63SRVbIf
X-Google-Smtp-Source: AGHT+IF+zSN4X8IWRUn/biH4/RB5CNod7nAll+rxcdpjuspXnbwv16eYl8fVz4bnfXlr2IMxqyc08Q==
X-Received: by 2002:a05:690c:3347:b0:6db:d02f:b2c4 with SMTP id 00721157ae682-6e30dec2921mr37172757b3.7.1728409001827;
        Tue, 08 Oct 2024 10:36:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:726e:cc37:52e8:7907? ([2600:1700:45dd:7000:726e:cc37:52e8:7907])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d93e2cdasm15079217b3.114.2024.10.08.10.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 10:36:41 -0700 (PDT)
Message-ID: <f2cafd9b-09a9-447b-b09f-3b223d99dfde@gmail.com>
Date: Tue, 8 Oct 2024 13:36:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: Oct 8th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 17:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112718

The following changes since commit ce456f692384f56f03328d3466a36f05146314f2:

   tgt: fix CVE-2024-45751 (2024-09-22 10:06:37 -0400)

are available in the Git repository at:

   git://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 72018ca1b1a471226917e8246e8bbf9a374ccf97:

   rocksdb: Add an option to set static library (2024-10-06 07:29:13 -0400)

----------------------------------------------------------------
Armin Kuster (1):
       Revert "mariadb: fix runtime failure on riscv"

Dmitry Baryshkov (1):
       android-tools: Create flag file /etc/usb-debugging-enabled

Khem Raj (1):
       mariadb: Upgrade to 10.11.9 release

Michael Olbrich (1):
       nftables: avoid python dependencies when building without python

Nikhil R (2):
       nftables: Conditionally add ${PN}-python as RDEPENDS for ptest
       rocksdb: Add an option to set static library

Peter Marko (2):
       hostapd: Patch CVE-2024-3596
       hostapd: Patch security advisory 2024-2

Raghuvarya S (2):
       android-tools-adbd.service: Update ConditionPathExists to /etc
       android-toold-adbd: Fix inconsistency between selinux configurations

Trevor Woerner (1):
       apache2: use update-alternatives for httpd

Yi Zhao (1):
       libldb: upgrade 2.8.0 -> 2.8.1

Yogesh Tyagi (1):
       tbb-native: Fix build with gcc-13

  meta-networking/recipes-filter/nftables/nftables_1.0.9.bb       | 9 +-
  .../recipes-support/libldb/{libldb_2.8.0.bb => libldb_2.8.1.bb} |   2 +-
  .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
  .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb   | 2 +-
  ...1-SAE-Check-for-invalid-Rejected-Groups-element-length.patch | 52 
+++++++++
  ...3-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch | 38 
+++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch | 82 
++++++++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch | 165 
+++++++++++++++++++++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch | 62 
++++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch | 52 
+++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch | 51 
+++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch | 46 
++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch | 105 
+++++++++++++++++
  .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch | 47 
++++++++
  meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb            | 10 ++
  .../{mariadb-native_10.11.7.bb => mariadb-native_10.11.9.bb} |   0
  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 5 +-
  .../mariadb/0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch   | 170 
----------------------------
  .../mariadb/0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch     | 66 
-----------
  .../mariadb/0001-Remove-the-compile_time_assert-lines.patch     | 43 
-------
  .../mysql/{mariadb_10.11.7.bb => mariadb_10.11.9.bb} |   0
  .../recipes-dbs/rocksdb/files/static_library_as_option.patch    | 71 
++++++++++++
  meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb                    | 2 +
  .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
  .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
  .../tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch | 57 
++++++++++
  meta-oe/recipes-support/tbb/tbb_2021.11.0.bb                    | 1 +
  meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb          | 3 +
  28 files changed, 856 insertions(+), 291 deletions(-)
  rename meta-networking/recipes-support/libldb/{libldb_2.8.0.bb => 
libldb_2.8.1.bb} (97%)
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch
  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.7.bb => 
mariadb-native_10.11.9.bb} (100%)
  delete mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch
  delete mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch
  delete mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_time_assert-lines.patch
  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.7.bb => 
mariadb_10.11.9.bb} (100%)
  create mode 100644 
meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
  create mode 100644 
meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch



Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507B3C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 12:19:33 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web09.40144.1666009163877493871
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 05:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V40iTaKa;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 101-20020a9d0bee000000b00661b54d945fso5658105oth.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 05:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8TdholgUPyJwCuogRPxOkaKGMKBKn7cAZtDp9micnM=;
        b=V40iTaKapinDfppJ0mhB6fGktlCxhe59vqYj5O+BBTiIH2TlhmliSrAxkwfUMEyEow
         6pI9SSUHPUOKN2jeJ3Qv6wgFEt4/3ClCvoNov+91Gm7fOWFgRuit/s6FZ6s2TifBmRZ4
         GP3W3yea9ACOwQ0wNvrJr1xXHY8gh9CetOVlKIsGARHS0eM34yF56a/eGnBglNjxVh/s
         t7NzBR94QIfl2yEpJ6KTazsBiKVBnthVJzMBvXRRqqKtUMgF58cmKBb9f6E0I5+FJJhX
         Y0eDu9VuPvwX0+dHwNPkepc5kivaqnx7TBJzCusJSHPYCzZSTpHEecpk3yz3taCA5c/m
         wQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b8TdholgUPyJwCuogRPxOkaKGMKBKn7cAZtDp9micnM=;
        b=7e4qmeyl/3o/RQtRA7EgH99Wkh6cf+BrL2qydXc2AqALtqG4DVe/6rlq+2aISqpf6E
         O9aRq6qJbgRSaPE9ZkgtbTAKpQdVrsXHd9OU5qbUSKTFN5VUTcCPifN3fNgJU1DKOAbs
         i3TFkGBilNzGoSncU3Trbed2d35vFqKZZLBNBkmAVKcYxuTM7SXDEGU5nuOYWMfFefxt
         /JEFcaURTZL5lgtHU6VESXDaY7AhQr7qY05g2o5+f0twadKIAkYYvLU/iLUYVZkX+Myj
         dDP5WBYFsJ3dJYu6tOwyPpV5U2W4XsjCoW209Lr7Dp8f5EcJDnTgc6wCLCJBRXhpiZV0
         QjwQ==
X-Gm-Message-State: ACrzQf0KOwHJgNV+X67ldeu3k0dGRZ5PoYdvZ8rPUf6w/x31uioRUYgr
	sVZRFtqoiwhHzU3nAN+6X4A=
X-Google-Smtp-Source: AMsMyM4+T4Vpn16vDH6JTEjj/roCaeWieK+tGgwURJFoCNju7gr135uSFgHsjtuZwHOxaADj5OXbFw==
X-Received: by 2002:a9d:1b6b:0:b0:660:d29b:b014 with SMTP id l98-20020a9d1b6b000000b00660d29bb014mr4668237otl.299.1666009161578;
        Mon, 17 Oct 2022 05:19:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:4d4c:e983:fca5:2bbb? ([2600:1700:9190:ba10:4d4c:e983:fca5:2bbb])
        by smtp.gmail.com with ESMTPSA id x5-20020a4a8d45000000b0047f94999318sm4154989ook.29.2022.10.17.05.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 05:19:20 -0700 (PDT)
Message-ID: <db46ab2a-48cb-d1f0-2d34-ad3609af21da@gmail.com>
Date: Mon, 17 Oct 2022 08:19:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 12:19:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99197

The following changes since commit bd2d8fba766f912bd1bc5cde7d6f0e72152f1547:

   minicoredumper: retry elf parsing as long as needed (2022-09-25 
11:03:26 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 744a4b6eda88b9a9ca1cf0df6e18be384d9054e3:

   frr: Security fix CVE-2022-37032 (2022-10-13 10:59:41 -0400)

----------------------------------------------------------------
Chen Qi (1):
       polkit: refresh patch

Hitendra Prajapati (1):
       wireshark: CVE-2022-3190 Infinite loop in legacy style dissector

Hitomi Hasegawa (1):
       libsdl: add CVE-2019-14906 to allowlist

Ovidiu Panait (1):
       net-snmp: upgrade 5.9.1 -> 5.9.3

Wang Mingyu (1):
       tcpreplay: upgrade 4.4.1 -> 4.4.2

Yi Zhao (2):
       open-vm-tools: Security fix CVE-2022-31676
       frr: Security fix CVE-2022-37032

wangmy (1):
       dnsmasq: upgrade 2.86 -> 2.87

  meta-networking/recipes-protocols/frr/frr/CVE-2022-37032.patch  | 42 
++++++
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
  ...01-ac_add_search_path.m4-keep-consistent-between-32bit.patch | 11 +-
  .../net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch    | 4 +-
  .../net-snmp/0001-get_pid_from_inode-Include-limit.h.patch      | 6 +-
  .../0001-snmpd-always-exit-after-displaying-usage.patch         | 55 
--------
  ...1-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch | 4 +-
  .../net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch | 28 ----
  .../net-snmp/0004-configure-fix-incorrect-variable.patch        | 6 +-
  .../net-snmp/net-snmp/fix-libtool-finish.patch                  | 6 +-
  .../net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch        | 26 ++--
  .../net-snmp-add-knob-whether-nlist.h-are-checked.patch         | 4 +-
  .../net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch        | 4 +-
  .../net-snmp-testing-add-the-output-format-for-ptest.patch      | 2 +-
  .../net-snmp/net-snmp/reproducibility-have-printcap.patch       | 4 +-
  .../net-snmp/{net-snmp_5.9.1.bb => net-snmp_5.9.3.bb} |   4 +-
  meta-networking/recipes-support/dnsmasq/dnsmasq.inc             | 5 +-
  .../recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch         | 191 
----------------------------
  meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb         | 8 --
  meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb         | 7 +
  ...1-Properly-check-authorization-on-incoming-guestOps-re.patch | 43 
+++++++
  .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 1 +
  .../tcpreplay/{tcpreplay_4.4.1.bb => tcpreplay_4.4.2.bb} |   2 +-
  .../recipes-support/wireshark/files/CVE-2022-3190.patch         | 145 
+++++++++++++++++++++
  meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 1 +
  .../polkit/polkit/0004-Make-netgroup-support-optional.patch     | 20 +--
  meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb                | 3 +
  27 files changed, 295 insertions(+), 338 deletions(-)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2022-37032.patch
  delete mode 100644 
meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.patch
  delete mode 100644 
meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
  rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.1.bb 
=> net-snmp_5.9.3.bb} (98%)
  delete mode 100644 
meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.86.bb
  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb
  create mode 100644 
meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-Properly-check-authorization-on-incoming-guestOps-re.patch
  rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.1.bb 
=> tcpreplay_4.4.2.bb} (85%)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch


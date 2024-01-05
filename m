Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C054C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 12:58:46 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.22725.1704459522727156528
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 04:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RFUB4rX5;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e86fc3f1e2so14746407b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704459522; x=1705064322; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNjOXiZu1D3UpLXYPMsMxS8Oex2O5rvMLqaGwAvz3dU=;
        b=RFUB4rX5pPOnZt/VxfDUfZW2mnqTFKJqfDsUOg6LpKPnD7F0cLkJlXz+/aQmmawDXw
         CkZWYl4ZJ/9qwaJJTyrBv1FSnS4G0LxS9GAKFknjRp5v36o9VskJQUhzVgqsSxglnUqG
         WjKDFRW2ec/AbahdQDQs171o+NtbuZd71I+e4EWCKI220m8i8KkHHTVcIwhWz6RiP8OV
         3wQupDR73Z9au34tirK+5dpXk/Bp79uwInncnTm8PxmZYN7TJoA2Q+gmGhC37hDGn02Y
         PRcpP6Iaio26bcOlWRMGSN2+90LK+VcXmPJXSAuE86pI/T1iTVaOTm5jWcIvA2NOBuUA
         DppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704459522; x=1705064322;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNjOXiZu1D3UpLXYPMsMxS8Oex2O5rvMLqaGwAvz3dU=;
        b=QF3NNTb7Kg8burTwXQ5IRCnZwA+xtX2Rh+a5Xa2gmWP/gRa+dSuvzUK0II6xF4ik3x
         aJQthRDh3PN8YEjZ2/RmydUx5GOOGBj+GiQS1WadMQsVny32qKwP4DxszzKW4mhJlaM3
         xH0ljw2irPIquBpJ6BJh6+K/1c6eJzPX+QTgJSNjXZ5GhMQkn8gWrxjBYMf1y5ruETFz
         vkYZGUx1tg+z347zFNNLxDabbDYerqvcKkhuqioeyYjB5z1XsAzoIKDCBZsH/W4reXx5
         bvECDAnnVlTy3oPeuMMYBTySLE6mr4wKhJLlMqnc1bEbq2abk7mFiNQV9Xt4xeuYCgpv
         unUQ==
X-Gm-Message-State: AOJu0YxGNJW2zMasWUWEU6SgX7NW19pbV4wsShltCBRrs9PM2JW/6GEJ
	YvD/U8SEgqlHzz1mYFhMSdI=
X-Google-Smtp-Source: AGHT+IF8hllPCmhSYaHB6gL7OUkBM6eMJ+VLO6oLEwZ6RJyjB1Ranzzi4TDBSKROxpVhd2z0piUq3g==
X-Received: by 2002:a81:5c85:0:b0:5f1:5ab9:2f53 with SMTP id q127-20020a815c85000000b005f15ab92f53mr2166760ywb.27.1704459521709;
        Fri, 05 Jan 2024 04:58:41 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10::29? ([2600:1700:9190:ba10::29])
        by smtp.gmail.com with ESMTPSA id p129-20020a0dff87000000b005e171297cafsm609856ywf.107.2024.01.05.04.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 04:58:41 -0800 (PST)
Message-ID: <e6668968-0efe-411f-b2ea-efa2a4dc83f5@gmail.com>
Date: Fri, 5 Jan 2024 07:58:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: nanbield merge request: Jan 5th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 12:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108046

The following changes since commit 1750c66ae8e4268c472c0b2b94748a59d6ef866d:

   emlog: Add PV (2023-11-01 08:16:30 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded nanbield-next

for you to fetch changes up to 2da6e1b0e43a8993fd422fee3f83940100b59f4c:

   poco: fix branch (2024-01-05 07:52:17 -0500)

----------------------------------------------------------------
Alexandre Belloni (1):
       poco: fix branch

Christian Eggers (1):
       python3-gcovr: switch to main branch

Dylan Turner (1):
       apache2: v2.4.57 to v2.4.58 to fix CVE-2023-43622

Edi Feschiyan (1):
       libbytesize: update SRC_URI

Fabio Estevam (3):
       openocd: Use https for github
       python3-piccata: Use https for github
       multipath-tools: Use https for github

Jeffrey Pautler (1):
       apache2: add vendor to product name used for CVE checking

Jonas Gorski (1):
       frr: fix CVEs CVE-2023-4675{2,3} and CVE-2023-4723{4,5}

Khem Raj (3):
       hwdata: upgrade 0.370 -> 0.375
       openvpn: upgrade 2.6.3 -> 2.6.6
       python3-scapy: upgrade to latest revision

Ross Burton (1):
       yajl: fix CVE-2017-16516, CVE-2022-24795, CVE-2023-33460

Wang Mingyu (3):
       hdf5: Fix install conflict when enable multilib.
       dnf-plugin-tui: Recover BBCLASSEXTEND variants
       strongswan: upgrade 5.9.11 -> 5.9.12

Zoltán Böszörményi (3):
       python3-ninja-syntax: Set BBCLASSEXTEND = "native nativesdk"
       python3-ninja: Set BBCLASSEXTEND = "native nativesdk"
       geos: Fix packaging

  meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb  | 2 +-
  meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch  | 125 
++++++++++++++++++++++++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch  | 117 
++++++++++++++++++++++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch  | 95 
+++++++++++++++++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch  | 112 
+++++++++++++++++++++++++
  meta-networking/recipes-protocols/frr/frr_9.0.1.bb              | 6 ++
  .../openvpn/{openvpn_2.6.3.bb => openvpn_2.6.6.bb} |   4 +-
  .../strongswan/{strongswan_5.9.11.bb => strongswan_5.9.12.bb} |   2 +-
  meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb   | 2 +
  meta-oe/recipes-devtools/openocd/openocd_git.bb                 | 2 +-
  meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch         | 37 
++++++++
  meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch         | 59 
+++++++++++++
  meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch         | 35 
++++++++
  meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                     | 6 +-
  meta-oe/recipes-navigation/geos/geos_3.12.0.bb                  | 2 +-
  meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb                     | 6 +-
  .../recipes-support/hwdata/{hwdata_0.370.bb => hwdata_0.375.bb} |   2 +-
  meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb         | 2 +-
  .../recipes-support/multipath-tools/multipath-tools_0.9.3.bb    | 2 +-
  meta-oe/recipes-support/poco/poco_1.12.4.bb                     | 4 +-
  meta-python/recipes-devtools/python/python3-gcovr_6.0.bb        | 2 +-
  .../recipes-devtools/python/python3-ninja-syntax_1.7.2.bb       | 4 +-
  meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb     | 1 +
  .../recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb   | 2 +-
  ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 31 
-------
  .../apache2/{apache2_2.4.57.bb => apache2_2.4.58.bb} |   5 +-
  26 files changed, 617 insertions(+), 50 deletions(-)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
  rename meta-networking/recipes-support/openvpn/{openvpn_2.6.3.bb => 
openvpn_2.6.6.bb} (95%)
  rename 
meta-networking/recipes-support/strongswan/{strongswan_5.9.11.bb => 
strongswan_5.9.12.bb} (99%)
  create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch
  create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
  create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
  rename meta-oe/recipes-support/hwdata/{hwdata_0.370.bb => 
hwdata_0.375.bb} (91%)
  delete mode 100644 
meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb => 
apache2_2.4.58.bb} (98%)



Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE97C369D5
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 00:22:07 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.1166.1745626925940636920
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 17:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lY73KCQ8;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6febbd3b75cso29237057b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 17:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745626925; x=1746231725; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaPkuxWaM/GTXDDSB3QlbG5uIxEdW5vdgGo+jm7sKIU=;
        b=lY73KCQ8wLUcxw/psNlVnyL5+D9JK3mfDVskslGb8bqsWDaWw4AefelQrGHI7shU+O
         eA6oPFMNSrux+TVQZWDf5AN2BruQgSWA4c3Xw1HJxFbQMNski0oEV2sFWId0kGH8T8aG
         cu3krm3tleUNX32MC5QIzwuSWZcjRDzdk4SZmxdroXfccMScJiLvIiqdBP/wF7UjEUuR
         HQn0VTqeasQJq422CQJyoO68tSWW4UhvAH3fy7u0om6ymZSiGO0/5wiqqO5KPps9x33W
         MsA5gNwYfhe3R0YhQXXCBsYFGpj56z5PUzWwbA23bVd2UuX0ulwgpUlznMR9bA6gLiW0
         CTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745626925; x=1746231725;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AaPkuxWaM/GTXDDSB3QlbG5uIxEdW5vdgGo+jm7sKIU=;
        b=sN1Eu14uYJU/KGY/G//cupU0HqrDWoAjD/ZrKPW8tH9/nG4PWUdlRk+5PRzVtqJ1FB
         dUZaLw5gIjNJyV76uzKpeiw76B/wjonRZqc+Hqr6scRul3v5v9rjC9rPqsNqXrnE8fhl
         f3rxf5ozcNMXBD2Qteek4S9jgk+dT2greuljgALS0FbjXHY+Bng8YzkCeF9x48x6zhff
         t+UiU0x9GfHVFGCkIBB6n3rLAZT8UXOjSvUbKfLSMsMErMojscBXD/Vlld+29QEnHf5d
         /eQOuKfRopyuyxTsy342CMcAVRIzX8veRhQDU2vbaMrFQAgV8Sncp9BU4MmZBE8GXEkG
         Uf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlm/R4yws3kbeqrec110hUo3UZASoh5J9BatYpy66rlSPz/OlCHVyLvbW6nhM4LpBNhz8eJIqzZMpQt7LS8uT413M=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy0UcqHJr61+ww7/XzpTyW9eaNzZq9NcaXVoauSSAOwnKPsR64o
	2+ucVgY4gmPWXSFFcClkF1Ud0VsaFWH2DwBeqiSFiroSrLnvGXnL
X-Gm-Gg: ASbGncsNARONc+AzdpqU9u8cAsG5dzR7juhZ12pjzeI9GAdNwuon9m4Zhogytr172ny
	+sz4b8FIJhHG/ypY4kzzv0pZ8Eq6yfusRXvpmIY4K07XpZE2JqZF7DqBuaD/eYxivCTAaMcgdmf
	VUtXvFZlrgz9scSyLKnjAkBMsPM7zEdstRfe6y1uPaFCXs4LgaY4QVc7x0UG9R3V7iuvHFQzLyV
	EjuWKyVrHHQI7ntJKt1g5q9m6qROqOhpdL8vzdyYeiXHwNtEC1CQ4AUNjSjGoIdZaqdmkS6RFB+
	BaxRLDB+WggX8sbufDd4s3p2JkMEtGYgpKAYGLOz8/kT2q+ST+t2J0n2hidXAii2BYOGsrorJbg
	kY03+LtP94xDjlnVt
X-Google-Smtp-Source: AGHT+IGXiP7URsgQYte6RFuT2st7/mi+QYplEtUzSsM94fXZXwVQCsnDtGqoQwS5j3e4oQzMM5odSg==
X-Received: by 2002:a05:690c:9686:b0:6fd:4718:9bde with SMTP id 00721157ae682-7085f1612c6mr24090767b3.9.1745626925071;
        Fri, 25 Apr 2025 17:22:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:1f85:ef30:acd1:a429? ([2600:1700:45dd:7000:1f85:ef30:acd1:a429])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70841b0ff75sm11198347b3.120.2025.04.25.17.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 17:22:04 -0700 (PDT)
Message-ID: <a10ba3db-e9cb-4d3c-8616-0ce14f7ba206@gmail.com>
Date: Fri, 25 Apr 2025 20:22:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: April 25th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 00:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117138

The following changes since commit f8dddbfcbfe502cb71375a7a907e61a92e8d4474:

   openvpn: renew the sample keys (2025-03-29 14:24:38 -0400)

are available in the Git repository at:

   git://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to e42549cef364ae09b3b7c8b64bbeab32e50f1bb0:

   net-snmp: fix memory leak (2025-04-20 13:43:55 -0400)

----------------------------------------------------------------
Haixiao Yan (1):
       lmsensors: Clean stale files for sensord to avoid incorrect GCC 
header dependencies

Jiaying Song (1):
       corosync: fix CVE-2025-30472

Jinfeng Wang (2):
       netplan: Fix CVE-2022-4968
       net-snmp: fix memory leak

  .../recipes-connectivity/netplan/netplan/CVE-2022-4968.patch    | 442 
++++++++++++++++++++++++++++
  meta-networking/recipes-connectivity/netplan/netplan_0.104.bb   | 1 +
  .../corosync/0001-totemsrp-Check-size-of-orf_token-msg.patch    | 74 +++++
  meta-networking/recipes-extended/corosync/corosync_3.0.3.bb     | 1 +
  ...0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch | 32 ++
  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb    | 1 +
  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb               | 5 +-
  7 files changed, 555 insertions(+), 1 deletion(-)
  create mode 100644 
meta-networking/recipes-connectivity/netplan/netplan/CVE-2022-4968.patch
  create mode 100644 
meta-networking/recipes-extended/corosync/corosync/0001-totemsrp-Check-size-of-orf_token-msg.patch
  create mode 100644 
meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch



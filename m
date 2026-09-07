Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCACC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 11:12:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32596.1788779525152901228
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 04:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=igsYwIyQ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=RLUx3ba3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvKen496169
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Sep 2026 11:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OrrPQwI+YgvkAi8+QdlmWNpnbweToQmys9v
	HQ5p9m9I=; b=igsYwIyQIHz/pfaNV8T3HAGehY2kq/jqcRsoc2gjyTb70xxCW6S
	LDMDhROtCkMKReRPbbSJKoWafhCUDKJsbgic8/+Qvmjs0Q4Nz0pSF63qDDMgEcOJ
	G5Bs144Wlq6drhgKuKVnxvA/RzINlzlzYfWTaJ8MfdTo0dTRSgJotShfiezGiqfF
	+f1VL+lw6xJTmNY0VpeX5jNKr/vhuaQLp5vO93lLI1b0aXpHKDAXO10clIHOvAfM
	NwLczAm7ckffHH+Ee9e9DM3FIHgePZaI4GI6an4AIkWmcsOrmHNgMkeIEHngx18L
	3WbK7UuzhsOTfkenzSAjH/n2IiPRo8DuB3Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk81q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 11:12:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5556609a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779523; x=1789384323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OrrPQwI+YgvkAi8+QdlmWNpnbweToQmys9vHQ5p9m9I=;
        b=RLUx3ba38BYuc2bkVVhKSAbVCVGQEY/nJe+8iA1PN9swb1W1hZcrESsE/IDIzgkR9j
         +VCCIbPZaGxvNVaMH0JqVYuBaKeDstkVfmTn1fOVLSAIh2ePtEMDCSUEkzFRDkqTjATf
         83bDECWXQvzefeco8THdUzYZx+62FhY2MwoiVbzyu/W94KzmvrhvZRPCqNdE/Y5o9mVN
         OeUHwkt9UZpfIlnZikQc2HeUH/C6VAs/ES0V0lvDkjueNzSmMfJygXckhah04lT5Kzu2
         8Nracy28cwg66KVeZR6YAC4L5exuz92WNr82D1T8RDUQEa1Rg47j8cUsPY7zBi8ytJlg
         Cqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779523; x=1789384323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OrrPQwI+YgvkAi8+QdlmWNpnbweToQmys9vHQ5p9m9I=;
        b=j+/uBJAAH5prV8jBfCVC/Ij9g7ov68xCTcAuKkI82djXILvV1IPcMkwqyDUEv06s2A
         x9VZzBkl3UZ+Zk992xmExX6MM0VyaZnr5DlhmRWasshD9qoaUUyjiA3eKe2EqEiODat5
         T0wH5RgySBKzoavYTtTtV3SEbhbN95f8XaCD5YHLxG5slXeHy4W0h8HefVU3KZrK6VnI
         LFn1JvevL7CZ4jCw6kWDIKpsYG6DYvn8mSVh+ZVxS+LVw99rK26Az6/WO03yIR4/tbmB
         MkrE/ywkPnLL/2tvvtkeB2hVx5Xt47BXI0aLuRPf5YyFIy3FUS5LOAmYT4VknPogUPO3
         LAYQ==
X-Gm-Message-State: AFuF++kWQseLXSMkb1rkCTdKeh4g1uJqmJ0M303r2NqawpuiiLZWuWie
	aT2g7fI9yJ+sGLD2LQATe+R84Ravrpil3tfQ/Ggjf4QL6DgmaACWc6FeZ8Zz7fv2ZZ5gB4yI2cD
	Jo/LHjkC9bCutDWyFnvF8lQ9F7mY95wdJQ1z/+nbavZiWMn/twT3Q9T5V/6EIeUhDdk+jwvdGYx
	F0L1BFeLUpAaWvtiHx7cmlBA==
X-Gm-Gg: AYBFou1WXTa+8bLVJuP/F+fHWiQqWPBznNrwH4M5Ivcdy1w3q+auiGS+dEOLKvc9Lyr
	5IatWYDyYmLUBMrPtA2n8e4oWWjPO3BqfRNVH39n2oWxWTFghhIjwNiRKqKEA3Kmh6b6CtGKdES
	FAjo1VInXeMQJkE6jRF1+5UEZcaypJ9ZnWTuR8hAbhMwBRTL2Myxe3Aiicsd8SYmJzs4JM91bep
	m9mMKiKXWgfzbPooVUBbT/tcqriph9yFHxPPtqM5RCHYjI48n/1SQPRmWq25nnU/AzUjBqIDPbh
	VT6HOGN0gFVzgnf2fy+X+JWoLpqvy+DI3xgO0RhFaafZpi9BZfli96yaj9/5T71serHX5Goteeb
	NXPOUUQw35uG5FLai7WAGPtVu7F1Dz1l/AQ==
X-Received: by 2002:a05:6a21:3382:b0:3d0:a555:c823 with SMTP id adf61e73a8af0-3da39feab06mr36951402637.14.1788779523294;
        Mon, 07 Sep 2026 04:12:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:3382:b0:3d0:a555:c823 with SMTP id adf61e73a8af0-3da39feab06mr36951276637.14.1788779522401;
        Mon, 07 Sep 2026 04:12:02 -0700 (PDT)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm25718793eec.18.2026.09.07.04.12.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:12:01 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/44] Scarthgap pull request
Date: Mon,  7 Sep 2026 16:41:51 +0530
Message-Id: <cover.1788779254.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMyBTYWx0ZWRfX/Nga5obqd9yU
 RPeeUx92rzzK83Pz6lUxiRSYZqmew6S6qG+lEtWMgMEapt69CiJ3mrPdWMkMv6fAeWRNzpAILnU
 o+NmGmCOTZuRiqwU8hhcqvSK8/mfVP4=
X-Proofpoint-GUID: DWYT_6SwLEGuy-mJSvVJV8IHv0agIByH
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9e9c04 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=milf36sc1-Tr9zBXY3YA:9 a=3WC7DwWrALyhR5TkjVHa:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: DWYT_6SwLEGuy-mJSvVJV8IHv0agIByH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMyBTYWx0ZWRfX7DkII7BgcUux
 Jx5kLAdtmVd0sB8JfGPvDK4hd0+5j+9ho9udRToIe6IeEKdNynmQiAYZrfU9ciACC05Iw9Ccdnf
 HBTC056nDEsVSmf28oa/hcwygQrUmKov6X7YITWe0/DvhSCYtZMMZOqIdc1olKgzvkwLeaK4ZHf
 UwqwVhV4aoDQSFRE5Es9M5Kp8qoecjkjUdnVKcgzIR/Tnc6EiIwHuG9PnX9XE+WFHo8s75MbgJg
 xN2iXJJQ/KHnsAqUD0HLJjdo0bQxXw8GnAvfC6rDdqxB1KezCEUG2Y/qH6Q6Nm5GihnQh7l4L5Z
 tCT+JgnK24cnh0h3PB46//NuhLz1GOc9DqzRgpWNErplVrrtx2QdFaLckg5ygN+aZqrMBDCEmOX
 +uU89xBkPct6H2xVu6osTkT6XiroMJfZssEbyInKUvPQofb8P8beH3CrcouubdPqWcZZQ+McoEk
 fWvRWMM7jpXU4oXLdLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070123
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 11:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129846

Please merge these changes in scarthgap. Tested locally and on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1763


The following changes since commit bec755063a8b5da65df626f5749496aadaa4f4bb:

  thrift: fix CVE-2026-58389 (2026-08-13 10:01:51 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

for you to fetch changes up to b5874ea07d69919d9b40d59f2c2f0bbd24bc3259:

  libssh: Fix CVE-2026-59850 (2026-09-02 10:39:59 +0530)

----------------------------------------------------------------

Ankur Tyagi (1):
  jsoncpp: upgrade 1.9.5 -> 1.9.7

Benjamin Bouvier (2):
  net-snmp: add CVE_PRODUCT
  rsyslog: add CVE_PRODUCT

Darsh Kelaiya (16):
  python3-filelock: fix CVE-2025-68146
  python3-filelock: fix CVE-2026-22701
  python3-httplib2: fix CVE-2026-59939
  python3-django: fix CVE-2026-15307
  python3-django: fix CVE-2026-15337
  python3-django: fix CVE-2026-15830
  python3-aiohttp: ignore CVE-2026-34515
  python3-aiohttp: fix CVE-2025-69224
  python3-aiohttp: fix CVE-2025-69227
  python3-aiohttp: fix CVE-2025-69229
  python3-aiohttp: fix CVE-2025-69223
  python3-aiohttp: fix CVE-2026-22815
  python3-aiohttp: fix CVE-2026-34514
  python3-aiohttp: fix CVE-2026-34513
  python3-aiohttp: fix CVE-2026-34993
  python3-aiohttp: fix CVE-2026-34518

Devansh Patel (6):
  hdf5: Fix CVE-2026-26199
  hdf5: Fix CVE-2026-26197
  python3-cbor2: Fix CVE-2026-26209
  python3-httplib2: correct CVE_PRODUCT mapping
  python3-cbor2: use exact CVE_PRODUCT mapping
  python3-web3: add CVE_PRODUCT mapping

Gyorgy Sarvari (3):
  python3-httpx: set CVE_PRODUCT
  python3-twisted: set CVE_PRODUCT
  smarty: extend CVE_PRODUCT

Hetvi Thakar (11):
  python3-ujson: Fix CVE-2026-32875
  python3-ujson: Fix CVE-2026-32874
  python3-ujson: Fix CVE-2026-44660
  python3-ujson: Fix CVE-2026-54911
  python3-simpleeval: Fix CVE-2026-32640
  python3-web3: Fix CVE-2026-40072
  libssh: Fix CVE-2026-59843
  libssh: Fix CVE-2026-59844
  libssh: Fix CVE-2026-59846
  libssh: Fix CVE-2026-59848
  libssh: Fix CVE-2026-59850

Hitendra Prajapati (4):
  libssh: set status for CVE-2026-15370
  libssh: set status for CVE-2026-59842
  libssh: fix for CVE-2026-59845, CVE-2026-59847
  opensc: fix for CVE-2026-40528

Vijay Anusuri (1):
  giflib: Fix CVE-2026-26740

 .../net-snmp/net-snmp_5.9.4.bb                |    2 +
 .../giflib/giflib/CVE-2026-26740.patch        |   40 +
 .../recipes-devtools/giflib/giflib_5.2.2.bb   |    1 +
 ...akage-when-compiled-with-C-17-1668-1.patch |  525 ++++++++
 .../{jsoncpp_1.9.5.bb => jsoncpp_1.9.7.bb}    |    6 +-
 .../rsyslog/rsyslog_8.2402.0.bb               |    2 +
 .../hdf5/files/CVE-2026-26197.patch           |   69 +
 .../hdf5/files/CVE-2026-26199.patch           |  675 ++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |    2 +
 .../libssh/libssh/CVE-2026-59843.patch        |   84 ++
 .../libssh/libssh/CVE-2026-59844.patch        |   52 +
 .../libssh/libssh/CVE-2026-59845.patch        |   68 +
 .../libssh/libssh/CVE-2026-59846.patch        |   87 ++
 .../libssh/libssh/CVE-2026-59847-01.patch     |   39 +
 .../libssh/libssh/CVE-2026-59847-02.patch     |   35 +
 .../libssh/CVE-2026-59848-regression.patch    |   45 +
 .../libssh/libssh/CVE-2026-59848.patch        |  684 ++++++++++
 .../libssh/libssh/CVE-2026-59850.patch        |   40 +
 .../recipes-support/libssh/libssh_0.10.6.bb   |   12 +
 .../opensc/files/CVE-2026-40528.patch         |   44 +
 .../recipes-support/opensc/opensc_0.25.1.bb   |    1 +
 .../recipes-support/smarty/smarty_4.4.1.bb    |    2 +-
 .../python3-aiohttp/CVE-2025-69223.patch      |  848 ++++++++++++
 .../python3-aiohttp/CVE-2025-69224.patch      |  161 +++
 .../python3-aiohttp/CVE-2025-69227.patch      |  163 +++
 .../python3-aiohttp/CVE-2025-69229_p1.patch   |  113 ++
 .../python3-aiohttp/CVE-2025-69229_p2.patch   |  256 ++++
 .../python3-aiohttp/CVE-2026-22815.patch      | 1020 +++++++++++++++
 .../python3-aiohttp/CVE-2026-34513.patch      |  211 +++
 .../python3-aiohttp/CVE-2026-34514.patch      |   65 +
 .../python3-aiohttp/CVE-2026-34518.patch      |   64 +
 .../python3-aiohttp/CVE-2026-34993.patch      |  364 ++++++
 .../python/python3-aiohttp_3.9.5.bb           |   21 +
 .../CVE-2026-26209-dependent.patch            |   27 +
 .../python3-cbor2/CVE-2026-26209_p1.patch     |  173 +++
 .../python3-cbor2/CVE-2026-26209_p2.patch     |  435 +++++++
 .../python3-cbor2/CVE-2026-26209_p3.patch     |   81 ++
 .../python3-cbor2/CVE-2026-26209_p4.patch     |   28 +
 .../python/python3-cbor2_5.6.4.bb             |    7 +
 .../CVE-2026-15307.patch                      |  563 ++++++++
 .../CVE-2026-15337.patch                      |  163 +++
 .../CVE-2026-15830.patch                      | 1144 +++++++++++++++++
 .../python/python3-django_5.0.14.bb           |    3 +
 .../python3-filelock/CVE-2025-68146.patch     |   88 ++
 .../python3-filelock/CVE-2026-22701.patch     |   44 +
 .../python/python3-filelock_3.13.4.bb         |    4 +
 .../python3-httplib2/CVE-2026-59939.patch     |  745 +++++++++++
 .../python/python3-httplib2_0.22.0.bb         |    4 +
 .../python/python3-httpx_0.27.0.bb            |    2 +
 .../CVE-2026-32640_p1.patch                   |   55 +
 .../CVE-2026-32640_p2.patch                   |  187 +++
 .../CVE-2026-32640_p3.patch                   |  485 +++++++
 .../CVE-2026-32640_p4.patch                   |   90 ++
 .../python/python3-simpleeval_0.9.13.bb       |    8 +-
 .../python/python3-twisted_24.3.0.bb          |    2 +
 .../python/python3-ujson/CVE-2026-32874.patch |   61 +
 .../python/python3-ujson/CVE-2026-32875.patch |  199 +++
 .../python/python3-ujson/CVE-2026-44660.patch |  112 ++
 .../python/python3-ujson/CVE-2026-54911.patch |  267 ++++
 .../python/python3-ujson_5.9.0.bb             |    4 +
 .../python/python3-web3/CVE-2026-40072.patch  |  434 +++++++
 .../python/python3-web3_6.17.0.bb             |    3 +
 62 files changed, 11215 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.5.bb => jsoncpp_1.9.7.bb} (82%)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59843.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59844.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59845.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59846.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-01.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-02.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59848-regression.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59848.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59850.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2026-40528.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69223.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-22815.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34513.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34514.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34518.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15307.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15337.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15830.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2025-68146.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-22701.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-httplib2/CVE-2026-59939.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32874.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32875.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/CVE-2026-44660.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-web3/CVE-2026-40072.patch

-- 
2.34.1



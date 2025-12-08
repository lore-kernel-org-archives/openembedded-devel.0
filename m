Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C9DD2CE17
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 01:23:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1536.1765156975494972178
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Dec 2025 17:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c3dEW61+;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=QhZv+AaL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MIhoo3408442
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Dec 2025 01:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LPQKV+X2bXQReYLy0prt2+tq9HECx5I7Epo
	+ZN4CG7Y=; b=c3dEW61+blceYQIqEHeWdvp0A2RlAIegIKtN0CcaN2+N5S4baiH
	LyhhTU7uHQPFtP2BipDByfEQP+hwP00/tNjhgRDWzopayXNjCm4Zej2QtQm7ez79
	MZtVqKxLjUyrS8I0f1CMH7A35LFishR1iXWKYzrjuWT7B22jAEXap62jdBkLKiPY
	hd1967CM4MXZ652s5UKgnegZC1xqYSq/Dr/MHbCrQO8E14Wsb4jGXelgXiOPnKYX
	jKhgAkL6lHnUn5gt2LwAuWqsHTuXvwZPT7ScSN8TUZbIGyDxGrvMkOM1Ff2Woyk+
	7oLQEC7vJtdWkRvyAi1MIYJ/EXlR/pOtrxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjvb6tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 01:22:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-299ddb0269eso44822045ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Dec 2025 17:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765156973; x=1765761773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPQKV+X2bXQReYLy0prt2+tq9HECx5I7Epo+ZN4CG7Y=;
        b=QhZv+AaLJk56GE6RjEjYe/NOY6rIoxUNCnaMuKX5od4G+xX4D6U+W5qD5ucb16GQdq
         RnJ60pUwox79ZYjPvIERgTkTCJN4tRbzwszU8Dd46lV3BdlH26Ne57MdcBwBKYfUjodb
         SCZIMGuHDUVpxRNFx890yTiFG1R29oVohO0XfTcnVYxcIM/OKUpzcbc/s+hnw2tbj8+a
         VPg8EStFEGKt0GzsJfs5Kaxo9VtZLYybAEpB8E/hgZMrAIoNV+tPMWgSJb37SwozFAqL
         3meEnpEfH6QDxVRdX8bmmUf6qyjdDCo37y4y6+Py2MYDBn4k6bixdWaDRZPK5RF4ZnqD
         vKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765156973; x=1765761773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPQKV+X2bXQReYLy0prt2+tq9HECx5I7Epo+ZN4CG7Y=;
        b=rwvJbXrL2UymJbFkhOLq/Tgw751ZuRVAoNR6ioR0745R8whE0cvZBD0adxyTAIAXd4
         w/2blanhJmQovDNYZj+qosdNl8ryMIie3SVGzszpAavel9zUiNUGNmbSB/oYK74iwedA
         LYbH02WcZQ7asqSWTY4EpA1Tz9valJFX+E8DcJOpdnv54ZzDKVlnq+xY54OcEHuOlzY3
         DA11irdLdKyC/rng2j5o04XZbWZnSpWs2v6nVwlecc8teePMb/5sCeg1bt6r6hbVG+Dq
         h7SpouAb5M8pcaBp5tcvN872gk0c/qrQi/nPpfjuW8n1GNa6u7/HtZUF3hEkr2tsA+SU
         ziAA==
X-Forwarded-Encrypted: i=1; AJvYcCUuRkK7EFAm0eWSVF6HNK34tGsBYe4cNcItqyELQyZLfjJ6s634LBZ7Ul26iBkNJbpIZRN1Dgj7akOOmDHOPAvWjwY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxTG9plqxDDdHbANm2ZDGoeLIZ10YQqlxn+hLga10R75xWGSfbF
	CJOgsNeF/yE9gSXjhE5kwBsk6hOZTSvi0QNiK5hPYclLUdBshK/sFKz9acqluUVBU7aqtgnjQns
	zF0TdWa1ZoM9ZQj6/Z+w2RHunF2nJUw/L2FlpiXMJ1xONRaWuFQOPaX4OrQCz7E+NCiEGuV9K7O
	gwq0DqQErC
X-Gm-Gg: ASbGncu1Op76cdquaPVCAdC7wCD0m88tvcAKgtpErD/J1adeSLTqwAaxC6vhNVwpXUy
	GSuwBdyx8nPusHC4SnKZViwpoJnsjnukN+BeHcK5slosZiEYMkuLjWgK3Uj2JgUAv5giusTxK6q
	nb6RG/CJA3vgGkSvHauJbK4APuIxkX3qsimqBMd6bUGmembzdA1MmUAbceja+4drDLy11j35E48
	Nij0md9rV3WNnu9lNXPisQtjIZNKrwiPhyRM6TKy7+SdaqkWbLmLfNwdU7gK87Q6y7t3OW7dHoq
	+NkAK6GwH9Cmdi3DW50Wa1J8k+/9vv1oM3epHsFSYyjxiesaBqQjjVKujHpL7YG/QXXcWMJEect
	vuq+o0H5+3rWGC1Dxi8OXCXHnW+GxWnW8wffxulzj
X-Received: by 2002:a17:902:d481:b0:296:2aed:4fab with SMTP id d9443c01a7336-29df5aa3ba7mr60957195ad.23.1765156973261;
        Sun, 07 Dec 2025 17:22:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXX5ur2WEmtdtLknPqAe5xD9TtqvkLyQBhOwe6SrKXQfDviB+pvp93TVXmXU5VJrkBVTtgvQ==
X-Received: by 2002:a17:902:d481:b0:296:2aed:4fab with SMTP id d9443c01a7336-29df5aa3ba7mr60957045ad.23.1765156972750;
        Sun, 07 Dec 2025 17:22:52 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cfcfasm104432245ad.41.2025.12.07.17.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 17:22:52 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/27] Scartgap pull request
Date: Mon,  8 Dec 2025 06:52:45 +0530
Message-ID: <cover.1765156725.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=6936286e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=oY2X5Id9c2NOlcxSy3IA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAwOSBTYWx0ZWRfX/MAXTxekTzwK
 z2Bm4wrdTOlCf4dxFBPS+Hh1dsEhlOwfe6nWUFrUZ39SYviCNZbBvE7BsaTjz/TabStzQ0gEBYh
 aE7XgPDGwq3EdDHHm7MuFUUqMqbkYvMBvTIGMolNvpOLnOugkbD9ANItGA9mvxCD57x2uDDZzDW
 cN1j2d1Y0jll2iqlCgBA13sNlkr0oq4AYm5sPUL5f3RIs7D+D7nVdyqURQCXSdopDm9X1Lk0hk1
 VMT/us8KK6RXjZlnD9T5UwSB5xiLtA34RceekRq6gyRnJ/jUttrgkhI24VAu4jD0UsFbQJjL5yB
 QgdlXHjgJ6yEhJLIp1JOeGMWUGj4i6jjSkn0MVDx238pb1wUbzI0QNR61z2d2m/Lsj7SqWDXAYX
 h6f7bdXwzI+L9gg9PYrP6CEaQ3H1uA==
X-Proofpoint-ORIG-GUID: 0bL6RjNw6tJFC9bfmdkb7wOPo4kDMqb6
X-Proofpoint-GUID: 0bL6RjNw6tJFC9bfmdkb7wOPo4kDMqb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 01:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122368

Please merge these changes in scarthgap. Tested on autobuilder and
locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1153

The following changes since commit 89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099:

  cockpit: set correct CVE_PRODUCT (2025-11-28 11:27:05 -0800)

are available in the Git repository at:

  https://github.com/anujm1/meta-openembedded anujm/scarthgap
  https://github.com/anujm1/meta-openembedded/tree/anujm/scarthgap

Anuj Mittal (1):
  pidgin: fix reproducibility issues

Deepak Rathore (1):
  hdf5 1.14.4-3: Fix CVE tag format in patches

Gyorgy Sarvari (20):
  yasm: add alternative CVE_PRODUCT
  yasm: patch CVE-2023-29579
  yasm: patch CVE-2021-33464
  yasm: patch CVE-2021-33456
  redis: ignore CVE-2022-0543
  redis: handle CVE-2025-27151
  nbdkit: patch CVE-2025-47711
  nbdkit: patch CVE-2025-47712
  xrdp: patch CVE-2022-23468
  xrdp: patch CVE-2022-23477
  xrdp: patch CVE-2022-23478
  xrdp: patch CVE-2022-23479
  xrdp: patch CVE-2022-23480
  xrdp: patch CVE-2022-23481
  xrdp: patch CVE-2022-23482
  xrdp: patch CVE-2022-23483
  xrdp: patch CVE-2022-23484
  xrdp: patch CVE-2022-23493
  xrdp: patch CVE-2023-40184
  xrdp: patch CVE-2023-42822

Kai Kang (1):
  libtracefs: avoid run bison

Khem Raj (1):
  net-snmp: Fix a crash and support for 6.7+ kernel

Vijay Anusuri (1):
  net-snmp: Update Upstream-status in the
    net-snmp-5.9.4-kernel-6.7.patch

Yi Zhao (1):
  crash: add zlib-native to depends for crash-cross

yuyu (1):
  trace-cmd: Update SRC_URI to use HTTPS protocol

 .../net-snmp/net-snmp-5.9.4-kernel-6.7.patch  | 123 ++++++
 .../net-snmp/netsnmp-swinst-crash.patch       |  17 +
 .../net-snmp/net-snmp_5.9.4.bb                |   2 +
 .../nbdkit/nbdkit/CVE-2025-47711.patch        | 172 +++++++++
 .../nbdkit/nbdkit/CVE-2025-47712.patch        | 166 ++++++++
 .../recipes-support/nbdkit/nbdkit_1.33.11.bb  |   4 +-
 .../yasm/yasm/CVE-2021-33456.patch            |  35 ++
 .../yasm/yasm/CVE-2021-33464.patch            |  34 ++
 .../yasm/yasm/CVE-2023-29579.patch            |  39 ++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |   6 +-
 .../redis/redis/CVE-2025-27151.patch          |  32 ++
 .../recipes-extended/redis/redis_6.2.21.bb    |   5 +-
 .../recipes-extended/redis/redis_7.2.12.bb    |   2 +
 meta-oe/recipes-kernel/crash/crash_8.0.4.bb   |   2 +
 ...ake-sqlhist_remake-to-run-bison-and-.patch | 108 ++++++
 .../libtracefs/libtracefs_1.7.0.bb            |   1 +
 .../trace-cmd/trace-cmd_3.1.5.bb              |   2 +-
 ...025-2923-CVE-2025-6816-CVE-2025-6856.patch |   3 +-
 ...-6269-CVE-2025-6270-CVE-2025-6516_01.patch |   3 +-
 ...-6269-CVE-2025-6270-CVE-2025-6516_02.patch |   3 +-
 .../recipes-support/pidgin/pidgin_2.14.2.bb   |   7 +
 .../xrdp/xrdp/CVE-2022-23468.patch            |  34 ++
 .../xrdp/xrdp/CVE-2022-23477.patch            |  38 ++
 .../xrdp/xrdp/CVE-2022-23478.patch            |  85 +++++
 .../xrdp/xrdp/CVE-2022-23479.patch            |  83 ++++
 .../xrdp/xrdp/CVE-2022-23480-1.patch          | 356 ++++++++++++++++++
 .../xrdp/xrdp/CVE-2022-23480-2.patch          |  54 +++
 .../xrdp/xrdp/CVE-2022-23481.patch            |  46 +++
 .../xrdp/xrdp/CVE-2022-23482.patch            |  69 ++++
 .../xrdp/xrdp/CVE-2022-23483.patch            |  65 ++++
 .../xrdp/xrdp/CVE-2022-23484.patch            |  31 ++
 .../xrdp/xrdp/CVE-2022-23493.patch            |  33 ++
 .../xrdp/xrdp/CVE-2023-40184.patch            |  73 ++++
 .../xrdp/xrdp/CVE-2023-42822.patch            | 304 +++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  13 +
 35 files changed, 2043 insertions(+), 7 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/netsnmp-swinst-crash.patch
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47711.patch
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47712.patch
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2025-27151.patch
 create mode 100644 meta-oe/recipes-kernel/libtracefs/libtracefs/0001-libtracefs-Add-make-sqlhist_remake-to-run-bison-and-.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-1.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-2.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2023-40184.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2023-42822.patch

-- 
2.52.0



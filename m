Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21326CD342C
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 03:13:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4082.1778123575356537877
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Q5FT5yb8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IPXqazZ7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6471JHA8442845
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 May 2026 03:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+eVUc94sRJTrrLscUYywuPwvDx3ttDVwDgq
	T3RR1YB0=; b=Q5FT5yb8pByDqIBthr9OrOJMCSkMMknh0g3uA+Qat/NhrcICxA6
	IK/ylmIoDCKyWcARYBuSLeu2oO+65R+avDujRF6Czol8muAtk7vXVUZzHevsqSF0
	oTdfJhjV22W8Zov+0HRT2I1bzryhpbdz88x6gkUXJBj6yBcGendvMibKlmAK7dy7
	dHXLpw7yEtj6XjG8kq1G85kNRQvg42zZt7U5BRzB5xOpGtKUUJ2BjGK44ReQ0NX7
	wsWT1K6/Xr+gWzeIkKQYYIzJWj7ic2MlZcx7cOuKBARyKiERflS9Mae7PUY8QIum
	1tMyY9Zb+5jLLo26992FlX+v2xTd4Wjg+3w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299kpby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 03:12:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9f5ac4e36so4045015ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 20:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778123573; x=1778728373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+eVUc94sRJTrrLscUYywuPwvDx3ttDVwDgqT3RR1YB0=;
        b=IPXqazZ7ftJ918Va4lKIZ21LOopQe5bmdun0esmG15WSz8Y62LuprkbUwpcO6n9Dn8
         ikgqJFQxwpwcsoSuSdvxvl30rkavSBZvkxaBr6qgQOf9NhZuW2Djp8qToEAYNiRZu/92
         pqT7mCqupBWFLA/FMDVxDYVHQdq+FZNICeNs3shOl3RiRHzbFTnGzSTW1IwuVVAPBZh8
         Jb0fvwAMUPTkmTtY25fpq/i45xQGU53MJp4eYjiSWhCMpkB+Ia3SOg731M4m4G5y0smt
         m3hCjZ44JVPJvyeGStsuIo0m+osUJrwWgPEtDICMZ5aDFmNYEpq/S33jW3BS0lb4bTaC
         TKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778123573; x=1778728373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+eVUc94sRJTrrLscUYywuPwvDx3ttDVwDgqT3RR1YB0=;
        b=JJSrUJ6/Gfu1RasHwWYgoZkeos7GpeOsiB0cGsWLmVUD6gjRkp650uTverQJ0/Ncux
         yIh1WcWGi/kdcgHqYiP0coy4jpkqo3LJl7bcznCP222mqn+kDsmXpwjUHNaHoxAxa5PH
         23ibNs4C3gP1qRWOiLafquUoexh/xTFn6s24bXbxRT7k2/rmxDdDGxITI0lPbFHZIcIX
         v7mhqEkmi3l1n0yNp0kXZWU3keTDe+121l9vHIRV/oUwXrC7A5CXHqk9ZknbvMfUP+89
         YSez1dxGbLwELN0UsVq6M5JgowrQeJFyTrxHzqbC/C0/+Aoa4Dx3NpBAcNDflYnNfYzJ
         78kw==
X-Forwarded-Encrypted: i=1; AFNElJ/dOZQVmNkOvr+T4H9l7c0UDB4m8Q89B7PtfSwCs/Cq9Vw75X4bp/JIA7pV1jgCf4RC3E3pFXl2al34xOrbiFygkUo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcGCN/RP95qb48nTjVE9Ywsh6f/5UOfYor2SMu9m/ovhelEiJc
	mel6/5r8Ws/u3pwqFJlhM1rzbiakRcM17gXBkGSY1u4JYQ+JLQcLp0DpwBVtaNlqCtJVG1skdx2
	ohQu78ABrBjRF8eJnj2bIDXS1CqBGEH/zhXIK4QOhiXnU8z/TIgi9dGN1mSKeZv1jQP0nu0x9Gk
	P6TXehN3oe
X-Gm-Gg: AeBDietOwfZFaiI5TJ5y+gkHnAh1Lu+qYIDmehvowqJz0Wo+MpzJKJP/G7I8snRDxjM
	7InVHjQ6IatC48E8A4+h3V0H8bMJsGHib4bSUdS/66SYoVtAXpv4LxMjqQ3slH4vm0wqhC/sqtj
	CoMXxkysTVbuOZTJ1ZSH03dtP2PlxOjqDnhP0vVhM76539DfSnApLbXRRq+pUPgJGtY+awr/fhs
	133EBDqEEy+J62tc2Y4tIpFp5ZLHaVGNpuAaLcHUynuQ8bzOpR5NxvQnyEC91dLys1OA0KGnG/s
	EG2YYiEmS2FN5V7FC0xIdaY8am3ARS0ELiDCMl2x9RkzvMm+lLpq/PEyAod/eGAMZwq0FtxOLNx
	+gsola0Y1Qg0CCEqhfCuuYLBOmgUvUYu/ht4rDTvTJ5NW0f9dLKSy13t0A04w418=
X-Received: by 2002:a17:903:8ce:b0:2b4:604c:ec6f with SMTP id d9443c01a7336-2ba7a34c2e8mr59744455ad.32.1778123572807;
        Wed, 06 May 2026 20:12:52 -0700 (PDT)
X-Received: by 2002:a17:903:8ce:b0:2b4:604c:ec6f with SMTP id d9443c01a7336-2ba7a34c2e8mr59744055ad.32.1778123572058;
        Wed, 06 May 2026 20:12:52 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babb0e487csm7100895ad.72.2026.05.06.20.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 20:12:51 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/27] Scarthgap pull request
Date: Thu,  7 May 2026 08:42:43 +0530
Message-ID: <cover.1778123390.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fc0336 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=KWutmgCAO36qBre9xrQA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: ZLL3MJnm2Qexow6NfgLLNdw9jS9LtvBx
X-Proofpoint-GUID: ZLL3MJnm2Qexow6NfgLLNdw9jS9LtvBx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAyOCBTYWx0ZWRfXyVpaxpY+sXwu
 bLpanIdzV28hFyqhSzH8hIkCJSm79ukgE4veWKMhrUHiekdLedQU7p0Ilsp0y1TFaPYd8UK4Yj9
 StNeUaDStvr/gRz6m7h1tl/kJZrdL1/g4wdKELHjJJUWbw5zgSp6jCWlXMHti+1kpixhEvBtUPP
 G4nj0Usddpv1mRMnD5xNlt5s3l//VBM9NW6GWYQpGqRaX/Yj8q2weVw5LJI2O/GYtIdUJFzjMry
 bGxErY3JVKa1CS2DS1spVmGUcAjeqzLy7v2+4svvwsqWbJH0s/7Nzs7ovUbLmc3QS+t6RS5yM7+
 1wupJGLmGz+0NHde8I9bWpW7CXDku+drzz67hFgjk+JP07inNhtREoxuSiauzlo3LcZZXSqf7JT
 ZbopUsFjUSP0F13XPuBWCE5HX7dC+A8Bo2SFwXr+SFtFk2+48W7AO/TkY52hxC5+qjNDCAbImh+
 dHXNsYJFI8hlC0z3ajA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 03:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126808

Please merge these changes in scarthgap. Tested on autobuilder and locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1510

The following changes since commit 5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e:

  nginx: fix CVE-2026-28753 (2026-04-15 14:12:18 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

for you to fetch changes up to ae7dfb12245c7f9b9a353499e2688015bd4e6413:

  jq: Stick to C17 until next release (2026-05-05 06:57:17 +0530)

----------------------------------------------------------------

Ankur Tyagi (11):
  opensc: patch CVE-2025-49010
  opensc: patch CVE-2025-66037
  opensc: patch CVE-2025-66038
  opensc: patch CVE-2025-66215
  libssh: patch CVE-2026-0968
  libssh: patch CVE-2026-0967
  libssh: Fix CVE-2026-0965
  jq: patch CVE-2026-32316
  jq: patch CVE-2026-33947
  jq: patch CVE-2026-33948
  jq: patch CVE-2026-39979

Daniel Turull (1):
  jq: fix CVE-2026-40164

Gyorgy Sarvari (5):
  nginx: set CVE_PRODUCT
  python3-tornado: set CVE_PRODUCT
  openjpeg: patch CVE-2026-6192
  corosync: patch CVE-2026-35091
  corosync: patch CVE-2026-35092

Hitendra Prajapati (2):
  nginx: fix CVE-2026-32647
  python3-pillow: fix CVE-2026-40192

Khem Raj (2):
  krb5: Backport additional fixes to build on clang
  jq: Stick to C17 until next release

Libo Chen (2):
  hdf5: fix CVE-2025-2308
  hdf5: fix CVE-2025-6857

Michael Opdenacker (1):
  kernel-hardening-checker: update 0.6.10.2 -> 0.6.17.1

Mikko Rapeli (1):
  onig: fix gcc 15 build

Naman Jain (1):
  imagemagick: Fix CVEs

Zahir Hussain (1):
  rocksdb: packageconfig knob for set static library option

 .../corosync/corosync/CVE-2026-35091.patch    |  47 +
 .../corosync/corosync/CVE-2026-35092.patch    |  57 ++
 .../corosync/corosync_3.1.10.bb               |   2 +
 ...001-Fix-more-non-prototype-functions.patch | 862 ++++++++++++++++++
 ...oid-strict-prototype-compiler-errors.patch | 379 ++++++++
 .../recipes-connectivity/krb5/krb5_1.21.3.bb  |   2 +
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb  |   2 +-
 .../jq/jq/CVE-2026-32316.patch                |  55 ++
 .../jq/jq/CVE-2026-33947.patch                | 107 +++
 .../jq/jq/CVE-2026-33948.patch                |  51 ++
 .../jq/jq/CVE-2026-39979.patch                |  32 +
 .../jq/jq/CVE-2026-40164.patch                |  92 ++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   8 +
 .../openjpeg/openjpeg/CVE-2026-6192.patch     |  35 +
 .../openjpeg/openjpeg_2.5.4.bb                |   1 +
 ...b => kernel-hardening-checker_0.6.17.1.bb} |   2 +-
 .../hdf5/files/CVE-2025-2308.patch            | 333 +++++++
 .../hdf5/files/CVE-2025-6857.patch            | 255 ++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   2 +
 .../imagemagick/CVE-2026-24481.patch          |  30 +
 .../imagemagick/CVE-2026-25638.patch          |  29 +
 .../imagemagick/CVE-2026-25794.patch          |  60 ++
 .../imagemagick/CVE-2026-25795.patch          |  32 +
 .../imagemagick/CVE-2026-25796.patch          |  46 +
 .../imagemagick/CVE-2026-25797_1.patch        | 344 +++++++
 .../imagemagick/CVE-2026-25797_2.patch        | 143 +++
 .../imagemagick/CVE-2026-25798.patch          | 109 +++
 .../imagemagick/CVE-2026-25799.patch          |  42 +
 .../imagemagick/CVE-2026-25897.patch          |  34 +
 .../imagemagick/CVE-2026-25898_1.patch        |  39 +
 .../imagemagick/CVE-2026-25898_2.patch        |  37 +
 .../imagemagick/CVE-2026-25965.patch          | 322 +++++++
 .../imagemagick/CVE-2026-25966.patch          |  56 ++
 .../imagemagick/CVE-2026-25967.patch          |  38 +
 .../imagemagick/CVE-2026-25968.patch          |  39 +
 .../imagemagick/CVE-2026-25969.patch          |  63 ++
 .../imagemagick/CVE-2026-25970.patch          | 139 +++
 .../imagemagick/CVE-2026-25970_pre1.patch     |  57 ++
 .../imagemagick/CVE-2026-25982.patch          |  77 ++
 .../imagemagick/CVE-2026-25985.patch          |  67 ++
 .../imagemagick/CVE-2026-25986.patch          |  42 +
 .../imagemagick/CVE-2026-25987.patch          |  44 +
 .../imagemagick/CVE-2026-25988.patch          |  50 +
 .../imagemagick/CVE-2026-26066.patch          |  49 +
 .../imagemagick/CVE-2026-26283.patch          |  33 +
 .../imagemagick/CVE-2026-26284.patch          |  31 +
 .../imagemagick/CVE-2026-26983.patch          |  41 +
 .../imagemagick/imagemagick_7.1.1.bb          |  28 +
 .../libssh/libssh/CVE-2026-0965.patch         | 284 ++++++
 .../libssh/libssh/CVE-2026-0967.patch         | 360 ++++++++
 .../libssh/libssh/CVE-2026-0968-1.patch       |  64 ++
 .../libssh/libssh/CVE-2026-0968-2.patch       | 136 +++
 .../recipes-support/libssh/libssh_0.10.6.bb   |   4 +
 ...08dee4a01dee60c4cd67f2e2e46484ef50a5.patch | 138 +++
 meta-oe/recipes-support/onig/onig_6.9.9.bb    |   1 +
 .../opensc/files/CVE-2025-49010.patch         |  72 ++
 .../opensc/files/CVE-2025-66037.patch         |  35 +
 .../opensc/files/CVE-2025-66038.patch         |  41 +
 .../opensc/files/CVE-2025-66215-1.patch       |  29 +
 .../opensc/files/CVE-2025-66215-2.patch       |  37 +
 .../opensc/files/CVE-2025-66215-3.patch       |  45 +
 .../opensc/files/CVE-2025-66215-4.patch       |  62 ++
 .../recipes-support/opensc/opensc_0.25.1.bb   |   7 +
 .../python3-pillow/CVE-2026-40192.patch       |  50 +
 .../python/python3-pillow_10.3.0.bb           |   1 +
 .../python/python3-tornado_6.4.2.bb           |   2 +
 .../nginx/nginx-1.24.0/CVE-2026-32647.patch   |  78 ++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   2 +
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   1 +
 69 files changed, 5892 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-more-non-prototype-functions.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0002-Avoid-strict-prototype-compiler-errors.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40164.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6192.patch
 rename meta-oe/recipes-security/kernel-hardening-checker/{kernel-hardening-checker_0.6.10.2.bb => kernel-hardening-checker_0.6.17.1.bb} (96%)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970_pre1.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25982.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25985.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25986.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25987.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25988.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26066.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26283.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26284.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26983.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-2.patch
 create mode 100644 meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-49010.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66037.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66038.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66215-1.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66215-2.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66215-3.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-66215-4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-40192.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647.patch

-- 
2.53.0



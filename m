Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E757FC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 08:54:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14696.1786611255007372669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 01:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Y4NuSGPG;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Y+U9koZO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g7XZ1072366
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 08:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gpDO67NS6dWic/iMJS41PU+r3nXxnJBoEP9
	dyJWkwR8=; b=Y4NuSGPG+fRzxc0vjm5Jo1AnCiFlwUSnT+9/n67XlytqERrx0n+
	B7WAtTiWBy78noNy2ri7rKoFj0BO3k+RuFNQXTq/M8sDAehUdOQy8D4+305Itjln
	TaRzRqxwL/6tISf109f5YIEgxRqvbmhXW3ZSCg8laPHCkBSN4VNYLPkaLEZp4xxL
	5Gr3yKbxtCg25DniajB/TO7dfgOPNTtgY79b9d3YQusNdyE+hp/6RpJrE4J70EO9
	gnar4YBLaj52yjYfDgcmpXVFBdMglgVwvCTMpvJugCfpT4V2AmeOYOVfaPQ+yFIZ
	9jP9i0gyK8qeAXPbw3CIPYIpBSfF0R7BMEg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14syhfch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 08:54:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7621655eso2889459a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 01:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786611254; x=1787216054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gpDO67NS6dWic/iMJS41PU+r3nXxnJBoEP9dyJWkwR8=;
        b=Y+U9koZOYjhV1A0ZihxnJNEeNzPR4y+wnIPXrGgpWKL0t0tTHJFljxhjdEcXqrrP77
         BSLByk/a4eO8t3h6JcZwI0EGey5qetSRVmb+9FatmuIbTizOSuzBXcgNPM9USWuz+EHH
         9zbc5We+hZJ0hiV9AAJj4NqpuG+iNAxcbvchc3MfsTzASotyFjzs5D4QzPrHdI1sSrwl
         mapsFd++hCE/Y8/JW9EtOupNqqqh+zPQ9mwbodV83eIaNDg9XS2X7FMz11R/dF6kQAA7
         fC6g2Frb0B2kQOfHHMV5HHQUEZ+9GMafhNV05pQ+9GWxOdwTCEnsAQ71S4nNkjyBXvyi
         TrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611254; x=1787216054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gpDO67NS6dWic/iMJS41PU+r3nXxnJBoEP9dyJWkwR8=;
        b=O6GODpJ+7P57SAnZcU9bDcjjoEvqtxk18NUOo7xt+SiG3M1RKJo0Fr/b/VVrswt2J8
         RbQLxPhTkMZSJYSuB0rzaLPZTtiRaTbirOUMzHrpkyOZ3ORA5hbvMKtTYdafCAfTqadK
         JRsK1Q29WSDKzbuQ4O92kvzJIkUyLbh/i49WOnWHB5HJmbbsLioJQ9sOvx3R7WukR2BX
         +5Va/X6/h2vZ9k/eX6TEbPp3YoIzdoR55V4Ly7LRejOAEJIyiu3lwOGIQ3N6Yy7qRY1j
         rh50RNONiDtYjCCjnIFA2NejvTlo4N6X6gSq17JTMC1lHIN941FV+AL4iBrIAesbI60i
         E7Pg==
X-Gm-Message-State: AOJu0YyqNXAc0x7Dpe+Hh3tiUlM/AdCibIH1ZM0NDBqLSeZeemlF5HUj
	kITAp2KOhgOwtGnl3TI45sSeStpBrUSX3Lt8CbHbK05H6HUfDJAVLZq22uhAghr0KHlYYkctFjw
	bFY42XqoY24w1Lt0rizlGw69xiLKobI8TNjTRxzIhJckxHOjLIDq39GyYd1hw/yYqIvweYHT6w9
	z/ZTtEwgaJ04krgis7Q6s=
X-Gm-Gg: AR+sD12vO8WwSo+EwFvtg52A4ihJL9AukBr/OFOyyF9gzUeSarfwcAR36tmuq5+WHwf
	8PBQMxeZ3tmsaMZZWdlmw9qfZB9k3MAoMH36eXJI5oXkJ1hcyPllwsNGO21/RKwq/0+lj4HPgq+
	OScXc5GOK4/6nOAZ37QTnC4iavsAOzOM58hOxMp7OMX9o9lvwL72M4tfE/eY+ISDco2LONK9DHR
	pqAQG8Gv/CHwbpN8DVC7Zuaeup8c3L/vnTRr8G5ROFVRv+epwkO+vqke4L9NrTaFEDVDCKFlQHZ
	nX0r7HXANV4O7W3hmfrVQW7CVovnNx7XzFqfK+GuuAimcC5qW11KPiLOkmsXhJRgwHuIRaVtpRI
	aOvHuw/VYVvu+XFinGcFvmoO5uEDddBM=
X-Received: by 2002:a17:90b:3c07:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-3931dfe91f7mr5217509a91.2.1786611253787;
        Thu, 13 Aug 2026 01:54:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3c07:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-3931dfe91f7mr5217464a91.2.1786611253196;
        Thu, 13 Aug 2026 01:54:13 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412d8a8eb2sm9720597c88.3.2026.08.13.01.54.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:54:12 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/23] Scarthgap pull request
Date: Thu, 13 Aug 2026 14:24:01 +0530
Message-ID: <cover.1786607800.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7d8636 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=27ikW0FHSzDbQUw5uLsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA2MSBTYWx0ZWRfXwIja8wRJTzEf
 xuTNVQVoGtXDEIzVk563TmHFv20F95Ja0oe9CsyYvKoMlfUjFvqtP6CIsPZvtoNpIeAKhp3gMCg
 PL4xyIFOTRDTkm9cUTSZ3JbO1D2DcFfISoS45vGD/U76dx5bP2ri8IWj6cn8MXnZGHhtJyOZSAV
 e45/LV5pwqdEwGWUw/mzErt7D6nAnoL7wP9UFif9DL/ql1YtYsoalkW1BUQQ8cixUZOVl1UVZYD
 Ls1f21XfshrisRB97NAnLrjXCJsrfWfsoBnP9BxLgz2ZCG35Q1huN8EurpkSEB5A95MuQ4Lmv5J
 /+gFGA6dwkLoo7FSNmsPYNls8apmV3jQ4diOIUrTqwCuHKB+GTRL2r6QaW89kNYuPUSK8vr/wPI
 eSqxZhmmzDn5nH9Q7spJrj1E7runixmRO879hsF/46wOrdUH/PTrCfMRHsQMQvgztLcD2CnELqk
 9nxxuXprUn4jFEJdqaQ==
X-Proofpoint-ORIG-GUID: DYrOJqBFsFHWQfVA1rHuzTxSN-8N77bh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA2MSBTYWx0ZWRfXx7tOJsXk0Yl1
 6VcuZ1NectvcDoPHAUWaJvAuG4irfH1xaoOR4XqYqoPhdUqi6MdlgyixpwZkAQDBOnBBuOLuwHz
 JSgc0MeTEvQnkzE+1lx8ErSCx3sO8TY=
X-Proofpoint-GUID: DYrOJqBFsFHWQfVA1rHuzTxSN-8N77bh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 08:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128938

Please merge these changes in scarthgap. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1720

The following changes since commit ef3df29f2cfca6a9513b51ebcdccf82b6c8a836f:

  libdbi-perl: Fix CVE-2026-14740 (2026-07-30 07:53:25 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

for you to fetch changes up to bec755063a8b5da65df626f5749496aadaa4f4bb:

  thrift: fix CVE-2026-58389 (2026-08-13 10:01:51 +0530)

----------------------------------------------------------------

Adarsh Jagadish Kamini (4):
  thrift: fix CVE-2026-55971
  thrift: fix CVE-2026-58023
  thrift: fix CVE-2026-48144
  thrift: fix CVE-2026-58389

Ankur Tyagi (4):
  redis: upgrade 7.2.12 -> 7.2.15
  redis: upgrade 6.2.21 -> 6.2.23
  nginx: upgrade 1.25.5 -> 1.26.0
  nginx: upgrade 1.26.0 -> 1.26.3

Benjamin Bouvier (2):
  librelp: add CVE_PRODUCT
  tcpdump: add CVE_PRODUCT

Darsh Kelaiya (1):
  python3-flask: fix CVE-2026-27205

Emanuele Ghidoli (1):
  jq: fix build broken by the CVE-2026-43895 backport

Hetvi Thakar (5):
  python3-pyjwt: Fix CVE-2026-48522
  python3-pyjwt: Fix CVE-2026-48524
  python3-pyjwt: Fix CVE-2026-48525
  python3-pyjwt: Fix CVE-2026-48526
  python3-twisted: Fix CVE-2026-42304

Jason Schonberg (1):
  php: upgrade 8.2.32 -> 8.2.33

Roland Kovacs (1):
  thrift: fix multiple CVEs

Tugrul Kukul (2):
  jq: fix CVE-2026-39956
  jq: fix CVE-2026-44777

Vijay Anusuri (1):
  libssh: Remove duplicate CVE_STATUS entry for CVE-2025-14821

s-tokumoto (1):
  fuse: Add "fuse:fuse" to CVE_PRODUCT

 .../recipes-support/fuse/fuse_2.9.9.bb        |    2 +-
 .../recipes-support/tcpdump/tcpdump_4.99.4.bb |    2 +
 .../thrift/thrift/CVE-2026-43868.patch        | 1381 +++++++++++++++++
 .../thrift/thrift/CVE-2026-43870.patch        |  127 ++
 .../thrift/thrift/CVE-2026-48144.patch        |   36 +
 .../thrift/thrift/CVE-2026-55971.patch        |   98 ++
 .../thrift/thrift/CVE-2026-58023.patch        |  231 +++
 .../thrift/thrift/CVE-2026-58389.patch        |   93 ++
 .../thrift/thrift_0.20.0.bb                   |    8 +
 .../jq/jq/CVE-2026-39956.patch                |   55 +
 .../jq/jq/CVE-2026-44777.patch                |  233 +++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   12 +
 .../php/{php_8.2.32.bb => php_8.2.33.bb}      |    2 +-
 ...-hiredis-use-default-CC-if-it-is-set.patch |    3 +-
 ...ile-to-use-environment-build-setting.patch |    3 +-
 ...003-hack-to-force-use-of-libc-malloc.patch |    3 +-
 .../0004-src-Do-not-reset-FINAL_LIBS.patch    |    3 +-
 ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |    3 +-
 ...006-Define-correct-gregs-for-RISCV32.patch |    3 +-
 .../init-redis-server                         |    0
 .../{redis-7.2.12 => redis-7.2.15}/redis.conf |    0
 .../redis.service                             |    0
 .../{redis_6.2.21.bb => redis_6.2.23.bb}      |    2 +-
 .../{redis_7.2.12.bb => redis_7.2.15.bb}      |    2 +-
 .../rsyslog/librelp_1.11.0.bb                 |    2 +
 .../recipes-support/libssh/libssh_0.10.6.bb   |    2 -
 .../python/python3-flask/CVE-2026-27205.patch |  260 ++++
 .../python/python3-flask_3.0.3.bb             |    2 +
 .../python/python3-pyjwt/CVE-2026-48522.patch |   94 ++
 .../python/python3-pyjwt/CVE-2026-48524.patch |   91 ++
 .../python/python3-pyjwt/CVE-2026-48525.patch |  115 ++
 .../python/python3-pyjwt/CVE-2026-48526.patch |   87 ++
 .../python/python3-pyjwt_2.8.0.bb             |    8 +-
 .../python3-twisted/CVE-2026-42304.patch      |  369 +++++
 .../python/python3-twisted_24.3.0.bb          |    2 +-
 .../CVE-2024-7347-1.patch                     |    0
 .../CVE-2024-7347-2.patch                     |    0
 .../nginx/nginx-1.25.5/CVE-2025-23419.patch   |  119 --
 .../CVE-2026-28755.patch                      |    0
 meta-webserver/recipes-httpd/nginx/nginx.inc  |    3 -
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |    3 +
 .../{nginx_1.25.5.bb => nginx_1.26.3.bb}      |    2 +-
 42 files changed, 3324 insertions(+), 137 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43868.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43870.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48144.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55971.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58023.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-44777.patch
 rename meta-oe/recipes-devtools/php/{php_8.2.32.bb => php_8.2.33.bb} (99%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0001-hiredis-use-default-CC-if-it-is-set.patch (92%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (94%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0003-hack-to-force-use-of-libc-malloc.patch (90%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0004-src-Do-not-reset-FINAL_LIBS.patch (87%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (86%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0006-Define-correct-gregs-for-RISCV32.patch (95%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_6.2.21.bb => redis_6.2.23.bb} (97%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.12.bb => redis_7.2.15.bb} (97%)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask/CVE-2026-27205.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48522.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48524.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48525.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-48526.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2026-42304.patch
 rename meta-webserver/recipes-httpd/nginx/{files => nginx-1.24.0}/CVE-2024-7347-1.patch (100%)
 rename meta-webserver/recipes-httpd/nginx/{files => nginx-1.24.0}/CVE-2024-7347-2.patch (100%)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch
 rename meta-webserver/recipes-httpd/nginx/{nginx-1.25.5 => nginx-1.26.3}/CVE-2026-28755.patch (100%)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.5.bb => nginx_1.26.3.bb} (77%)

-- 
2.54.0



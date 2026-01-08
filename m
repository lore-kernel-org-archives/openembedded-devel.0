Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CD5D14891
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 02:12:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23022.1767838317236389771
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 18:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Cr4KHzcF;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=FWPLkp1e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607JGWX73152263
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Jan 2026 02:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Me+OyeA3SDTW7H/t2GLLurpEHgN3VDRFI6s
	DD33xF2g=; b=Cr4KHzcFizNVdutzl2ZAGDuRohza6I2K438ygSgCHwb1FdsemrY
	pb7dAp5adhwRXLns4Ha/trCMjFv5GUwtjmYzSxfIwwfLqfkir2/1ybUdBTCdb9I7
	2SOd5LnyjgLBvFfy6Cgyuw0TsM4ev2eRA6JEFQkkmjoRY8vAHzWOzEcWN81xExDh
	1Cauy2FXLcVEinF/KsGvDB18cP2ScVbKsMGpbFZbI+uIb7yH32jcOrQt1x6CyPCQ
	AunA7/pigJ77o/y0GANKwjSFXqXEl5P8E0F5nle8WEwjQEDh9I91WiodwY5feO1l
	ggvIsS8Gc2OV3ysReCe1cOgemQb4H34Udzw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjathag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:11:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso1380343b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 18:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767838316; x=1768443116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Me+OyeA3SDTW7H/t2GLLurpEHgN3VDRFI6sDD33xF2g=;
        b=FWPLkp1e59vo5JH8ssj2Yn1Hs4bul0iGEOseitAtSkbj8/+Tqz8NAAlCgvklFAnhcM
         Hpw5NYq4pmg1Y3jeyiK94lqfUuyKtY5HRVffM4mFTGEOru+vI7ydqDt00b4EO2HrzVV0
         qNpt1wjiaUL5nNYiK0NpQGJjm0qC5rUAfXJg72AEE/LkLUl2eLKFR4mMav3eUTy4+QDs
         oAh4/RMUmiuZJRxAdwUWfcIPXcYuPtDzBXmZcqgt3T8yC4rYVVIxWgN8IB07WA/eIKL+
         2EKt2+NgIwmQOT0HcRd5p137cUVf7yiA6M+kjm1NfrysnZb2KQQ+HtyXoxygWrHjbXSN
         Hoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767838316; x=1768443116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Me+OyeA3SDTW7H/t2GLLurpEHgN3VDRFI6sDD33xF2g=;
        b=QiXfie49UbL+asNrLFgsa1/bbv57u3V9DkzfBOkDMNTPsY+D/eQjNFq+VoqiRRnYu+
         4SCxaCwjWiqtJh4aas0qeB1OlmbmJMfZRQEc2e2JhIApj/CmNj3fdEJRLbaXqMqAhtf6
         WDRVL+MBCjU70joEvB+R2qAbbT61ZxJcGT4FkWOvRZh4JZoC8HJNjXbQDaTgdjs5/pvR
         HA4qSTDuTxj0BDQPnDpozhUxcx+j+K+UqxTahIX1qCV0uMeUaO6Q29hjDzQvSLZlt+hr
         gUqLlGuYdb9ITWPFuQeVpvknZmWPpFRNnSMNmDOZr/hPmAT0AsFPovJQwkwysWNcGiQy
         aKww==
X-Gm-Message-State: AOJu0YzHoaWkoXypxYYaX9KJz8wac1p4JAMkJamVZ1kC5ab0UTbZl6s5
	mYTrqHXv4N2c46KXnBwEbrljDhlw1iB/zcYUfu1uZPhgfqUyJd68FsEI5iFbelsdmJmusoZSLCj
	nrYKnQMpfVZMIKQV6v7s8BnjQGfjOg4Ot3zF8W9FlqkbaF/BoTXygogIzLttMEjtDCQUwH7f4BQ
	t/AVhO+CzyhESBb3dSn7c=
X-Gm-Gg: AY/fxX61pg/Tt0gQTGV7rpsEfGz15+wXbiK1az7RZEnqNcNwqVeUX3lB36TJKl2oWR3
	p+KLA2JxBa7UGuhJAqSMJ0FJ2uMtlOoXqjouUnwooVYLbl27f6H4qwBVVHbrIFtuNU/XMLz4mPr
	LSvXU8y6BB2ukA4Qp1gGr2Ne8BHuUzzPG6yiVT557ZD+FCjX1oL6P0txT4OGOdr+LYwNS/ODttk
	pJpeUCUiz6XnUBiNECzMbXayj9FYi8O6zRME9mG3H4q08wIyv8870QMVs7RZJ0+60KsV1WPmHad
	RNB2Yr8Z/oS7UgFqlL4ETyLKVowyr5Im9tsJZe9XCVqAL5e/60gc0swLguTenwMn9E4TISFDL3F
	b7OPgbV5p1Rl18O4/NB5Io7x7k5ZyH5CPbbsdcUAm
X-Received: by 2002:aa7:869a:0:b0:7e8:3fcb:9b01 with SMTP id d2e1a72fcca58-8194e130c64mr4939023b3a.23.1767838315752;
        Wed, 07 Jan 2026 18:11:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfic7Qjuf/Uot9DaJ4us8svx2R37qMa0OM6R+dL6GXXyuBPQ1atTcuXz8KV3hZiBBlAYO4Vg==
X-Received: by 2002:aa7:869a:0:b0:7e8:3fcb:9b01 with SMTP id d2e1a72fcca58-8194e130c64mr4939010b3a.23.1767838315141;
        Wed, 07 Jan 2026 18:11:55 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5de80d1sm6031241b3a.63.2026.01.07.18.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 18:11:54 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [PATCH 00/30] Whinlatter pull request
Date: Thu,  8 Jan 2026 07:41:45 +0530
Message-ID: <cover.1767765802.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695f126c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=j3tyT0woE-qyD6Lx5w8A:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: iAotqeByamldBAS3i-iuigGivvNAY2lB
X-Proofpoint-GUID: iAotqeByamldBAS3i-iuigGivvNAY2lB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAxNCBTYWx0ZWRfXylAS5O/Z5+ZL
 3vUqTre0pCrelHwYYBRz4bmr3uLx+jkA5APeVr4Ja4UXariuLJjZeTghv1gwJCi3gojB6Weov0k
 pPlG8/UC3j9sLYGYCwwiXUFEns4FmMLonx7NvCedBJbm1m81FF0vwQGVB7C1gT3NOiMGqvGPZqQ
 sWnbOgtWkFgXIbvwuOCoc7gI9GoNqIeKbdC+f3X2RXb3xtCDiv2URotbQn96GkTWlas8koOXTP+
 FNDi4SMEHIl7UT/Tj1RCjgrkspFbUD+i42naWb0qRaCbjfWWv0fWf9+EuFFQWZzgzKn6Q8WdXwH
 T5hQi1tKcLrFNJodJ6VqiSh9CAuAg8tECqp6CNcVllyoPz8Uuz13nLHWZNEcAnOqDecpb+biz7k
 4/Dx2898mMxODZrgjPAyWAduULFCuQ7vzeOCskogHkaHuRTlcIDYay2pp3buhBzBSpoPnRpcLbq
 tlM8gO299zvorwUr0Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123243

Please merge these changes in whinlatter. Tested on AB and locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1225

The following changes since commit a4e768dcfae181dd99e39c4286fa0729ca7f4e47:

  bpftool-native: Empty DEBUG_PREFIX_MAP_EXTRA (2025-12-17 16:54:28 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/whinlatter-next
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/whinlatter-next

Ankur Tyagi (1):
  fetchmail: patch CVE-2025-61962

Gyorgy Sarvari (26):
  fex: ignore unrelated CVEs
  accountsservice: ignore CVE-2023-3297
  minio: ignore irrelevant CVEs
  cifs-utils: patch CVE-2025-2312
  cups-filters: patch CVE-2025-64524
  dovecot: patch CVE-2025-30189
  fio: ignore CVE-2025-10824
  tigervnc: fix typo in CVE_STATUS
  tigervnc: sync xserver code with oe-core
  tigervnc: ignore CVE-2023-6377
  tigervnc: ignore CVE-2023-6478
  tigervnc: ignore CVE-2025-26594...26601
  civetweb: ignore CVE-2025-9648
  freerdp3: ignore CVE-2025-68118
  gimp: patch CVE-2025-14422
  gimp: patch CVE-2025-14423
  gimp: patch CVE-2025-14424
  gimp: patch CVE-2025-14425
  imagemagick: upgrade 7.1.2-8 -> 7.1.2-12
  libcoap: ignore CVE-2025-50518
  openvpn: upgrade 2.6.16 -> 2.6.17
  php: upgrade 8.4.15 -> 8.4.16
  postgresql: upgrade 17.6 -> 17.7
  python3-configobj: ignore CVE-2023-26112
  python3-django: upgrade 4.2.26 -> 4.2.27
  python3-django: upgrade 5.2.8 -> 5.2.9

Hugo SIMELIERE (2):
  libwebsockets: fix CVE-2025-11677
  libwebsockets: fix CVE-2025-11678

Jason Schonberg (1):
  c-ares: upgrade 1.34.5 -> 1.34.6

 .../gimp/gimp/CVE-2025-14422.patch            |  66 +++++++
 .../gimp/gimp/CVE-2025-14423.patch            | 106 ++++++++++++
 .../gimp/gimp/CVE-2025-14424.patch            |  34 ++++
 .../gimp/gimp/CVE-2025-14425.patch            |  79 +++++++++
 meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb    |  15 +-
 .../accountsservice_23.13.9.bb                |   2 +
 .../civetweb/civetweb_1.16.bb                 |   3 +-
 .../libcoap/libcoap_4.3.5a.bb                 |   2 +
 .../cifs/cifs-utils/CVE-2025-2312.patch       | 135 +++++++++++++++
 .../recipes-support/cifs/cifs-utils_7.0.bb    |   4 +-
 .../dovecot/dovecot/CVE-2025-30189-1.patch    | 128 ++++++++++++++
 .../dovecot/dovecot/CVE-2025-30189-2.patch    |  51 ++++++
 .../dovecot/dovecot/CVE-2025-30189-3.patch    |  36 ++++
 .../dovecot/dovecot/CVE-2025-30189-4.patch    |  72 ++++++++
 .../dovecot/dovecot/CVE-2025-30189-5.patch    |  31 ++++
 .../dovecot/dovecot/CVE-2025-30189-6.patch    |  88 ++++++++++
 .../dovecot/dovecot/CVE-2025-30189-7.patch    |  76 +++++++++
 .../dovecot/dovecot_2.4.1-4.bb                |   7 +
 .../fetchmail/fetchmail/CVE-2025-61962.patch  |  51 ++++++
 .../fetchmail/fetchmail_6.5.2.bb              |   1 +
 .../{openvpn_2.6.16.bb => openvpn_2.6.17.bb}  |   2 +-
 meta-oe/recipes-benchmark/fio/fio_3.39.bb     |   2 +
 .../libwebsockets/CVE-2025-11677.patch        | 161 ++++++++++++++++++
 .../libwebsockets/CVE-2025-11678.patch        | 128 ++++++++++++++
 .../libwebsockets/libwebsockets_4.3.5.bb      |   2 +
 ...c-bypass-autoconf-2.69-version-check.patch |   2 +-
 ...{postgresql_17.6.bb => postgresql_17.7.bb} |   4 +-
 meta-oe/recipes-devtools/fex/fex_2511.bb      |   6 +
 .../php/{php_8.4.15.bb => php_8.4.16.bb}      |   2 +-
 meta-oe/recipes-extended/minio/minio_git.bb   |   6 +
 .../tigervnc/tigervnc_1.15.0.bb               |  16 +-
 .../cups/cups-filters/CVE-2025-64524.patch    |  82 +++++++++
 .../cups/cups-filters_2.0.1.bb                |  10 +-
 .../c-ares/0001-ares_uri-memory-leak.patch    |  21 ---
 .../{c-ares_1.34.5.bb => c-ares_1.34.6.bb}    |   3 +-
 .../freerdp/freerdp3_3.18.0.bb                |   1 +
 ...ick_7.1.2-8.bb => imagemagick_7.1.2-12.bb} |   2 +-
 .../python/python3-configobj_5.0.9.bb         |   2 +
 ...ngo_4.2.26.bb => python3-django_4.2.27.bb} |   2 +-
 ...jango_5.2.8.bb => python3-django_5.2.9.bb} |   2 +-
 40 files changed, 1397 insertions(+), 46 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch
 create mode 100644 meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-1.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-2.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-3.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-4.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-5.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-6.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-7.patch
 create mode 100644 meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.16.bb => openvpn_2.6.17.bb} (98%)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.patch
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.6.bb => postgresql_17.7.bb} (69%)
 rename meta-oe/recipes-devtools/php/{php_8.4.15.bb => php_8.4.16.bb} (99%)
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.5.bb => c-ares_1.34.6.bb} (87%)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-8.bb => imagemagick_7.1.2-12.bb} (99%)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.26.bb => python3-django_4.2.27.bb} (79%)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.8.bb => python3-django_5.2.9.bb} (60%)

-- 
2.52.0



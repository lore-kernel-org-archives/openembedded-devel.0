Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0825D29DC7
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 03:41:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51689.1768275682453322655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 19:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RXrTeYMk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=A7V6swdW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN52SK2965342
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 03:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JoC4hyN7vF/KC9SzWePKpEv0iSKvLaSwy42
	uvNLG1L0=; b=RXrTeYMkIRZCXYgcB5uK2lFBkZVrZf03rZQoDhdlgF3VJhHCkqC
	IlW5HEty7oL6qm/MSv6JSyRWw8YFhT56vLM1sNloWQOZhFc24DAiYAb2+i4Sqo6F
	EFUw9a/cO3bpJRQdxUYu+G4/yHK5Obhu2mGtn/rB+FhST4jn9sJ34CBSZQjuQDyA
	yzblp4E38extpHaEgwH9wUj6/fQ/3N20c/Jyqf+fFGLBc2yZwijchMZZzFLwccCm
	NNVHS9UIQW9qQilBQsD2b8Bjz5f+Mc0RM+7DDgaSdYAzvuy9rCiQ3qxG+2yKh2ZN
	bCdKewQqQw77lf9YQJsyFkzuTLg37PB9u+g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hjwy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 03:41:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c6e05af3bso7710207a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 19:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768275681; x=1768880481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JoC4hyN7vF/KC9SzWePKpEv0iSKvLaSwy42uvNLG1L0=;
        b=A7V6swdWRClHaCZLM5IIOJcxyfj3h1kKXDP7iJoufzsORmjmAdvFoYWbKapICXoKiN
         rn9CAEr49Buv7IlrGJnMl2BGCu07NcYkyr6JITCBt+4mQ0ux5Li3EZhN2gXx33DwniNa
         Apos+0LCyurXiizH9hOhKHv28QLz2aCFg/X3MMvSlqfrST7PErjYLsIVm+wEv7KnnEga
         tXuPoysePZFoVA7teoQ4ecDT66q90dSg1dZOx2cquJcjZcd8l1Z6krEaC3wPnfpfaQlm
         D7mgMxEY66GdTzFcZHcquGi8qGyrJUMBkj/IEREhPWQZAKUzq00dL3U3+Ud3fFQ/jrkq
         wmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768275681; x=1768880481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoC4hyN7vF/KC9SzWePKpEv0iSKvLaSwy42uvNLG1L0=;
        b=erJJiPrXNy58jkcJ/CcrmCHfJ5K42A0praotPYX+Wa7iXieRjomdEN5L1EkNd7aSI9
         m0fosBjhZ/HTX0DL43yZD4TLI9qjkzvwJL7Ojq70sxKZAfodHOrKolqZmkHYOEZ+2X9v
         /ZHnwBjUyOdIspqOFt1IpfSa0OGoNyqiHmfzt6kYdhipHKZo1UJ2eBtL9ew1ycmc+ZWU
         z9sNNY8xfZoedeuBvI/mqXs2rdoeSCVntxChx5RbQ5gInle1bxDj8iHivqSkgLr5uXuV
         qvATit9XOUlSQhx+SEeX8GwOW4omG4YOwQQ09yEWdzyHCJ0vYZ+rDtw6f9F4kM4QwLxd
         5IoQ==
X-Gm-Message-State: AOJu0Yy80+4h4o1IyfdJlmPR0mBrHC04V0wybMipbIhYOApPIGZ0fzUS
	Nj7knxrS5jtHfv31pL5fF0+rCKeV+wSbrGH5iyiK0uXgGVbMA+uoD6+S5B2BeFEGYtpSm84h2K5
	BaYMH0hNsQUEcyNy9HM4bXZ1+paiEb4MZi/tiRdBJ3S8A+/sq1d/BeTCU0pyS7SenXEa6hjW7J0
	NRttgcqt1wqeZZeaT8ps0=
X-Gm-Gg: AY/fxX5JHG5SqpWA96oxoTGaSRFSNAexCCoO5URADNMekMdGTC6aTpvU3GrM6isBaaJ
	zIHgK5qs4PSnXZkLoQl3jh0EIZqOUIqVeBY7WSFZdpA8KZH2e3Ny42LfWpq50WAops5Sb9WR9xE
	bWduwusZDmygju+HbmsKI8AE7k4gbIu391pBvS0Ptc5lvwjtbbdvGnjodZU3Uob/rCAchhsLEiL
	7hjnD9LEx6aDxq4JkJRrj6F1GTdBeZ9DaLWPfeqM9Dv9Fes/Wy+xKyKLNzGSbD1Zi0/VnWXiy9w
	S/94MQSAcwmwmtEpmYJnNDwRNMSTD33xSRj09Zx2kxdZrktx0WKCRG7BS8gYajUB383pkthA3e6
	MLzUbd98vgJNBLRTWYSH6QQSUbPhM1qW3m2ObrLvZ
X-Received: by 2002:a17:90b:4c46:b0:340:b912:536 with SMTP id 98e67ed59e1d1-34f68c27d35mr17528370a91.31.1768275681007;
        Mon, 12 Jan 2026 19:41:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEEAnw06pWRQI6lHA7r+w7CrrxBCudvpDPPATQ/FfOGjMrKryzG3ezaa8ihbL08ekEMFmB6w==
X-Received: by 2002:a17:90b:4c46:b0:340:b912:536 with SMTP id 98e67ed59e1d1-34f68c27d35mr17528329a91.31.1768275680249;
        Mon, 12 Jan 2026 19:41:20 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8afba8sm18220903a91.13.2026.01.12.19.41.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 19:41:19 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/51] Scarthgap pull request
Date: Tue, 13 Jan 2026 09:11:04 +0530
Message-ID: <cover.1768274669.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vZ167qBSm7SqrBwBGEu9UdaRMi_LPcpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAyNyBTYWx0ZWRfX9omFkx6OcQiQ
 TejPIwPuEs7YLFg2pcuvLNUH2SqkxEATWQZ1O4tKxYQCICmBnH21Z+rYXV/Fnw/kGVZ33nTzEiB
 zVTsZ0eunxwE4aJMqQi9HjEcGQh3e0Wi+eQhiK2CYCpacXdJyl5qaw420tDmOnQFEQnHwbYv4k5
 afvoc9B50vDkwfnRurDJP5K/QePGPc56/6ecT0Nca9fgkzF7Hw8/NaOhN8NdTVQRQXA3NFPTR1G
 vo3VTHor3GIyicW02JO50qMBkoGVfcWohgJ9dhCf9o1Fe/jN0EVxPJmuFYAQGHXsDgEi8I11ozi
 nv5dnTdQA5rKD+ghF/g2+Ss8MEhv9X1f8//YgWOojXT12qyHcWtWPiRSy6LLi46JjyBqD20FkeV
 JcapaPedwxnTwF+PJFLQ7pfbVaBAIhljjWKAKIS9FBj2HTtorfWhuPU43vCC6bjhgKiG64Ni4CR
 cHoF4O0D6vwzzVIjnZA==
X-Proofpoint-ORIG-GUID: vZ167qBSm7SqrBwBGEu9UdaRMi_LPcpD
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6965bee1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=j2Z9xXY26hZRyMsMhPYA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 03:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123393

Please merge these changes in scarthgap. Tested locally and on AB.
There are a few unresolved buildpaths warning in scarthgap but they are
not related to these proposed changes.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1243

The following changes since commit 2b26d30fc7f478f5735d514f0c1bc28f6a4148b6:

  atop: patch CVE-2025-31160 (2025-12-30 07:08:16 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Ankur Tyagi (19):
  cifs-utils: patch CVE-2025-2312
  frr: ignore CVE-2024-44070
  libcoap: patch CVE-2025-34468
  mtr: patch CVE-2025-49809
  open62541: patch CVE-2024-53429
  proftpd: patch CVE-2024-48651
  znc: patch CVE-2024-39844
  tinyproxy: patch CVE-2025-63938
  wolfssl: patch CVE-2025-7394
  libde265: patch CVE-2023-43887
  libde265: patch CVE-2023-47471
  vlc: patch CVE-2024-46461
  opusfile: patch CVE-2022-47021
  freerdp3: ignore CVE-2025-68118
  influxdb: ignore CVE-2024-30896
  krb5: ignore CVE-2025-3576
  libwebsockets: ignore CVE-2025-1866
  usb-modeswitch: upgrade 2.6.1 -> 2.6.2
  usb-modeswitch-data: upgrade 20191128 -> 20251207

Colin McAllister (2):
  nginx: upgrade 1.25.4 -> 1.25.5
  nginx: Fix CVE-2025-23419 for 1.25.5

Gyorgy Sarvari (18):
  imagemagick: upgrade 7.1.1-26 -> 7.1.1-47
  imagemagick: mark CVE-2023-5341 as patched
  imagemagick: patch CVE-2025-53014
  imagemagick: patch CVE-2025-53015
  imagemagick: patch CVE-2025-53019
  imagemagick: patch CVE-2025-53101
  imagemagick: patch CVE-2025-55004
  imagemagick: patch CVE-2025-55005
  imagemagick: patch CVE-2025-55154
  imagemagick: patch CVE-2025-55160
  imagemagick: patch CVE-2025-55212
  imagemagick: patch CVE-2025-57803
  imagemagick: patch CVE-2025-57807
  imagemagick: patch CVE-2025-62171
  imagemagick: patch CVE-2025-65955
  dante: upgrade 1.4.3 -> 1.4.4
  libao: ignore CVE-2017-11548
  freerdp3: drop CVE-2025-68118 patch

Katariina Lounento (1):
  libtar: patch CVEs

Khem Raj (1):
  dante: Add _GNU_SOURCE for musl builds

Naman Jain (1):
  unbound: Fix CVE-2025-5994

Peter Marko (6):
  net-snmp: patch CVE-2025-68615
  sox: extend CVE_PRODUCT
  libsodium: patch CVE-2025-69277
  networkmanager: upgrade 1.46.0 -> 1.46.6
  synergy: patch CVE-2020-15117
  id3lib: mark CVE-2007-4460 as fixed

Sanjay Chitroda (1):
  recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch

Vijay Anusuri (1):
  python3-cbor2: Fix CVE-2025-64076

Wang Mingyu (1):
  libvpx: upgrade 1.14.0 -> 1.14.1

 .../recipes-multimedia/libao/libao_1.2.0.bb   |   2 +
 .../libde265/libde265/CVE-2023-43887.patch    |  39 +++
 .../libde265/libde265/CVE-2023-47471.patch    |  42 +++
 .../libde265/libde265_1.0.12.bb               |   5 +-
 .../opusfile/opusfile/CVE-2022-47021.patch    |  45 +++
 .../opusfile/opusfile_0.12.bb                 |   4 +-
 .../recipes-multimedia/sox/sox_14.4.2.bb      |   2 +
 .../vlc/vlc/CVE-2024-46461.patch              |  44 +++
 .../recipes-multimedia/vlc/vlc_3.0.20.bb      |   1 +
 ...ger_1.46.0.bb => networkmanager_1.46.6.bb} |   4 +-
 .../wolfssl/files/CVE-2025-7394-1.patch       |  46 +++
 .../wolfssl/files/CVE-2025-7394-2.patch       | 275 +++++++++++++++
 .../wolfssl/files/CVE-2025-7394-3.patch       | 125 +++++++
 .../wolfssl/files/CVE-2025-7394-4.patch       |  85 +++++
 .../wolfssl/files/CVE-2025-7394-5.patch       |  40 +++
 .../wolfssl/files/CVE-2025-7394-6.patch       |  48 +++
 .../wolfssl/wolfssl_5.7.2.bb                  |   6 +
 .../proftpd/files/CVE-2024-48651.patch        | 320 ++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.7f.bb |   1 +
 .../libcoap/libcoap/CVE-2025-34468.patch      | 127 +++++++
 .../recipes-devtools/libcoap/libcoap_4.3.4.bb |   1 +
 .../recipes-irc/znc/znc/CVE-2024-39844.patch  |  62 ++++
 meta-networking/recipes-irc/znc/znc_1.8.2.bb  |   1 +
 .../dante/{dante_1.4.3.bb => dante_1.4.4.bb}  |   6 +-
 .../recipes-protocols/frr/frr_9.1.3.bb        |   2 +
 .../net-snmp/net-snmp/CVE-2025-68615.patch    |  33 ++
 .../net-snmp/net-snmp_5.9.4.bb                |   1 +
 .../opcua/open62541/CVE-2024-53429.patch      |  44 +++
 .../opcua/open62541_1.3.8.bb                  |   1 +
 .../cifs/cifs-utils/CVE-2025-2312.patch       | 136 ++++++++
 .../recipes-support/cifs/cifs-utils_7.0.bb    |   4 +-
 .../mtr/mtr/CVE-2025-49809.patch              |  39 +++
 .../recipes-support/mtr/mtr_0.95.bb           |   4 +-
 .../tinyproxy/tinyproxy/CVE-2025-63938.patch  |  42 +++
 .../tinyproxy/tinyproxy_1.11.1.bb             |   1 +
 .../unbound/unbound/CVE-2025-5994.patch       | 275 +++++++++++++++
 .../recipes-support/unbound/unbound_1.19.3.bb |   1 +
 .../recipes-connectivity/krb5/krb5_1.21.3.bb  |   2 +
 .../libwebsockets/libwebsockets_4.3.3.bb      |   2 +
 meta-oe/recipes-core/toybox/toybox_0.8.11.bb  |   2 +-
 .../libsodium/libsodium/CVE-2025-69277.patch  |  61 ++++
 .../libsodium/libsodium_1.0.19.bb             |   4 +-
 .../recipes-dbs/influxdb/influxdb_1.8.10.bb   |   1 +
 .../recipes-multimedia/id3lib/id3lib_3.8.3.bb |   2 +
 ...ibvpx-configure-support-blank-prefix.patch |   8 +-
 .../{libvpx_1.14.0.bb => libvpx_1.14.1.bb}    |   2 +-
 .../freerdp/freerdp3/CVE-2025-68118.patch     |  57 ----
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |   3 +-
 .../imagemagick/CVE-2025-53014.patch          |  25 ++
 .../imagemagick/CVE-2025-53015.patch          |  51 +++
 .../imagemagick/CVE-2025-53019.patch          |  26 ++
 .../imagemagick/CVE-2025-53101.patch          |  54 +++
 .../imagemagick/CVE-2025-55004.patch          |  65 ++++
 .../imagemagick/CVE-2025-55005.patch          |  34 ++
 .../imagemagick/CVE-2025-55154.patch          |  79 +++++
 .../imagemagick/CVE-2025-55160.patch          | 159 +++++++++
 .../imagemagick/CVE-2025-55212.patch          |  29 ++
 .../imagemagick/CVE-2025-57803.patch          |  60 ++++
 .../imagemagick/CVE-2025-57807.patch          |  45 +++
 .../imagemagick/CVE-2025-62171.patch          |  26 ++
 .../imagemagick/CVE-2025-65955.patch          |  25 ++
 .../imagemagick/imagemagick_7.1.1.bb          |  21 +-
 ...-missing-prototype-compiler-warnings.patch |  53 +++
 ...ix-invalid-memory-de-reference-issue.patch |  44 +++
 ...escriptor-leaks-reported-by-cppcheck.patch | 101 ++++++
 ...0006-fix-memleak-on-tar_open-failure.patch |  26 ++
 ...ix-memleaks-in-libtar-sample-program.patch | 119 +++++++
 ...ng-a-static-buffer-in-th_get_pathnam.patch |  89 +++++
 ...-for-NULL-before-freeing-th_pathname.patch |  30 ++
 ...-stdlib.h-for-malloc-in-lib-decode.c.patch |  26 ++
 ...amming-mistakes-detected-by-static-a.patch | 100 ++++++
 .../libtar/files/CVE-2013-4420.patch          | 160 +++++++++
 ...-33640-CVE-2021-33645-CVE-2021-33646.patch |  42 +++
 .../files/CVE-2021-33643-CVE-2021-33644.patch |  52 +++
 .../recipes-support/libtar/libtar_1.2.20.bb   |  12 +
 .../synergy/synergy/CVE-2020-15117.patch      |  48 +++
 .../recipes-support/synergy/synergy_git.bb    |   1 +
 ...128.bb => usb-modeswitch-data_20251207.bb} |   3 +-
 ...witch_2.6.1.bb => usb-modeswitch_2.6.2.bb} |   2 +-
 .../python/python3-cbor2/CVE-2025-64076.patch |  91 +++++
 .../python/python3-cbor2_5.6.3.bb             |   1 +
 .../CVE-2025-23419.patch                      |   0
 .../nginx/nginx-1.25.5/CVE-2025-23419.patch   | 119 +++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   3 +-
 .../{nginx_1.25.4.bb => nginx_1.25.5.bb}      |   2 +-
 86 files changed, 3800 insertions(+), 82 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-43887.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-47471.patch
 create mode 100644 meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/CVE-2024-46461.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.46.0.bb => networkmanager_1.46.6.bb} (98%)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2024-48651.patch
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/CVE-2025-34468.patch
 create mode 100644 meta-networking/recipes-irc/znc/znc/CVE-2024-39844.patch
 rename meta-networking/recipes-protocols/dante/{dante_1.4.3.bb => dante_1.4.4.bb} (88%)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch
 create mode 100644 meta-networking/recipes-protocols/opcua/open62541/CVE-2024-53429.patch
 create mode 100644 meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
 create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2025-49809.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
 create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.14.0.bb => libvpx_1.14.1.bb} (96%)
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-68118.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53014.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53015.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53019.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53101.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55004.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55005.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55154.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55160.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55212.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57803.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57807.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62171.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-65955.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compiler-warnings.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-reference-issue.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0005-fix-file-descriptor-leaks-reported-by-cppcheck.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failure.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample-program.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0008-decode-avoid-using-a-static-buffer-in-th_get_pathnam.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing-th_pathname.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-lib-decode.c.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0011-libtar-fix-programming-mistakes-detected-by-static-a.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patch
 create mode 100644 meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20191128.bb => usb-modeswitch-data_20251207.bb} (77%)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.6.1.bb => usb-modeswitch_2.6.2.bb} (91%)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-64076.patch
 rename meta-webserver/recipes-httpd/nginx/{files => nginx-1.24.0}/CVE-2025-23419.patch (100%)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2025-23419.patch
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.4.bb => nginx_1.25.5.bb} (74%)

-- 
2.52.0



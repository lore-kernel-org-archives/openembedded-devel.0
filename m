Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF79C531CC
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:58:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11995.1784861907837675529
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ldzy6UVt;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CY7+gFZ6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O2iWCj1464005
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hroH1uiGiQPrEWY7pBkfZz
	/7Ohp/+HwApPvznDIXfrA=; b=ldzy6UVtU5BcRk8HDk+yhuMJb4TV1fNw76Te5f
	fybKghw7XboxS/HU3Bd2O7XZhPNnHPcVIFN8bqxTlaUnkrfRRQ5+HFW4ZQQS+qhM
	ekexvt2OfabucDIkAMBqE0w08tBUMNxEgxLtmF1SmeK9F+IQm/duwqt5aLkKkrVT
	2/xf+js1o1SjFFevw8qO60NRgRxT7/uTaB3+kTYy5UQEx+5QGxhxdPuMJLcEdWz0
	/v22bEMonwJkuwbLtlGDRzsMN4XiS7/ehoUBjCmZk3RNd/kNdTYGo7/Lq5xsGXT5
	dRaF/+YhAjUPgpcZO0l5qVxzJ5ucBPqOADF4ebFik/ApQ0VQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqajssh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:58:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso1612130a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784861906; x=1785466706; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hroH1uiGiQPrEWY7pBkfZz/7Ohp/+HwApPvznDIXfrA=;
        b=CY7+gFZ6gDQi4F3gSvoZWAGGIWuFuJlsNK/0bzBvBTivFWsLnLj7gfmGug+cGG66i7
         pACjmRHSH1bhV11xS+G4cOu25aF2815rZEQBZMP43VkCMJAKgsEPbg8Kgz5N9iAPWjHo
         tnnLy+UyLKMFjJxiQPkGr8R3B1LdSM1BO3bSe3dCdlQ0hTqVvvJzl1ULqSbzcc56Qm3r
         /Y8Xrobim7TnhacsE+hH+l0RJ4z7pM5ALcJkjV+Js43+r3hfg0WZzvR7g4Dqkui6Qzr2
         U9sqcSPZiZl61W4M1hYIqnMTpXfBbD6yLI6YBO0ipd9oElLUtlbEt2cRj5WFjLyj2y+z
         oPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784861906; x=1785466706;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hroH1uiGiQPrEWY7pBkfZz/7Ohp/+HwApPvznDIXfrA=;
        b=GVTbcjAa+QPMooVOcesl3UmQxKrQHMecmjqbSxd3qRejlfbGVVMfkMbLe6j1gngiCi
         HKu9FFG21RvrfEVu5wZkOfrUfflLFT70LfiY6r2IuZZDY/obwNCU3fCegeiFhWQWumJk
         Oyl+PIRPUZWJzJQZMLC08Gh9uv10/BwA/t7IaMBu6evyKqZBwCXiTaJZp6bI5ngURBCE
         GnF8bKmZ2nf5ge7wkeuvPFhsktpV7VaY3abSKK1ChHC2KHbJMKEGitzwp0qxtT/0j0rK
         AxobuFVVabTJr21KmGCB5raQhww/CKtqGfMQdu3W3oKsiX5k8+KuokwNZQK1VCt7hDIA
         Uo7w==
X-Gm-Message-State: AOJu0Yx6BTVBrioLEg37ePKzyl7vjwqEC9kTuJh4WRAMXQ67vcsKAZvK
	KyWRb4sbOmiYDgdFhmUrGStLkt+G3Xn4tSk1xJL/WKU98fyjQxn9W0m7q5x4cdMYFZX40JzSXPb
	F3JkQcvkQGKuWQSZVgjy6kSrlQEavuSncBZoERzOh5Qrf/sehxUiYzJWIYBGA9gnxml5lpbAD8H
	FOkXWDBefUisGrZIxAkL12wQ==
X-Gm-Gg: AR+sD13FwwivDMqaZ53VsqQoXh3BX7ujx14qgE4Rqc494mV8RHKKwZezdLPsDQw+c8I
	tnze37BSz2RhOngKXZZ6OKCyXsE605s64XELGjyfGqyL4HoWnOB3o7d5uO4QhrKAtZrIen52Cjx
	nhnWRGL7UNPo76B4xc4bKpF7ZuonHMcxGCq54BxjAUvWZLMvpeBhd5T2K505VfYHz/ZKbv7hqVS
	6wbmXnTcNuh7odwYm4S0dltHuP/93v+3kT09InnRjTwpyTtB8HzqAHekPV8G28LIh2b2wNe3avt
	HkK8cBpFFdfrQL6AxPNBof7pj2SE7MGKVxa9GywTGGjC/aPUdwHd2xCpQzkbkBgm+lE57akbmyt
	Pn/qc0hBmV41ARfMEm4aIJhHVpKebx14=
X-Received: by 2002:a05:6a21:a8b:b0:3c4:2fe1:fa28 with SMTP id adf61e73a8af0-3c44b274084mr6337356637.71.1784861906251;
        Thu, 23 Jul 2026 19:58:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8b:b0:3c4:2fe1:fa28 with SMTP id adf61e73a8af0-3c44b274084mr6337332637.71.1784861905673;
        Thu, 23 Jul 2026 19:58:25 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9d932sm24234397eec.12.2026.07.23.19.58.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:58:25 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/55] Wrynose pull request
Date: Fri, 24 Jul 2026 08:28:19 +0530
Message-ID: <cover.1784858854.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=6a62d4d3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=TSKdBDlxjC4jlwYYpF8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAyNSBTYWx0ZWRfXzk5dRY2/ZVPY
 EAnKWufWvdFQcDdumXQIZBRQUPFRvTmrZmw6N8no2kg1mKHHof9D2GmTprlacPrsbQMl5WnQzpo
 iyApPwJDeBvF3aXBDO8bUX0tPYj6M2KZvK74qJyh2knbUlraixoL5JkupN23qsEHxSUfWfIYBl9
 YFRxPjsuCGvfP87nsYIZpnKDkyTs7gNc2wzGc3VM9T6mx6kvTmAqf33ELuZmsafr1ljmroV75kB
 tnTnoVTVMFYZDG5AQ6ihiWAELqNjcy1jnTXirDJIZkFkPg23SD1koOsfqLp2MfwIxcYfFWLMHOI
 ndEMxpNb4O5GTiBL0Z2OBW1Bw9V/SI307XlNTmpxQODfj3Y60rj8qb0KLHqGuU0e2sV/8eTUSZ+
 eBwe7ZpTHcUyJH3KLo6cMk/Ue5JhC8elbVna3IAbgb1YH8+kwC4spOz9C4e7ewoIBjGN9trjBwO
 XRA+lq2PVmn8f5B4uTQ==
X-Proofpoint-GUID: sBiq_JFBnOIm4iouzz_BJmWdbAGL2YbX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAyNSBTYWx0ZWRfX5C+5FIAoyHIn
 CmHYuE5hwoDY7mRuWXdoXAq8MUmVvsDx4qN99GC8u27c2eS1gyYuIzSRM8NJnXKVFMmNp7p0VF6
 5KY7ogOudTlK/e2+YOmQBdpGQQX+LrI=
X-Proofpoint-ORIG-GUID: sBiq_JFBnOIm4iouzz_BJmWdbAGL2YbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128436

Please merge these changes in wrynose. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1657

The following changes since commit d97b5602d7f64422c94b7311466cda7f6b1962d5:

  libuio: fix FILE descriptor leak (2026-07-07 08:04:43 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/wrynose

for you to fetch changes up to af8b6d6b2f0b11595b0a0d5b82efa3129d52a628:

  sysdig: Use LuaJIT headers to match the linked LuaJIT library (2026-07-24 06:15:59 +0530)

----------------------------------------------------------------

Alejandro Mery (1):
  ltrace: fix PRIb64 length modifier on LP64 musl

Ankur Tyagi (4):
  haveged: upgrade 1.9.22 -> 1.9.23
  postfix: upgrade 3.10.10 -> 3.10.12
  python3-django: upgrade 6.0.6 -> 6.0.7
  python3-django: upgrade 5.2.15 -> 5.2.16

Darsh Kelaiya (3):
  jq: Fix CVE-2026-43895
  jq: Fix CVE-2026-49839
  jq: Fix CVE-2026-54679

Deepak Rathore (3):
  nmap: Fix CVE-2026-58058
  libidn: Fix CVE-2026-57053
  mbedtls: set CVE_STATUS for CVE-2025-66442

He Zhe (1):
  bpftool-native: Fix -Wdiscarded-qualifiers errors for glibc 2.42+

Jason Schonberg (2):
  c-ares: upgrade 1.34.6 -> 1.34.8
  php: upgrade 8.5.7 -> 8.5.8

Khem Raj (5):
  ifuse: upgrade 1.2.0 -> 1.2.1
  xdebug: upgrade 3.5.1 -> 3.5.3
  apache2: upgrade 2.4.67 -> 2.4.68
  samba: upgrade 4.23.5 -> 4.23.8
  sysdig: Use LuaJIT headers to match the linked LuaJIT library

Leon Anavi (1):
  python3-tornado: Upgrade 6.5.6 -> 6.5.7

Markus Volk (2):
  pipewire: update 1.6.6 -> 1.6.7
  pipewire: update 1.6.7 -> 1.6.8

Peter Marko (11):
  libwebsockets: set status for CVE-2025-1866
  libwebsockets: patch CVE-2026-10650
  7zip: set status for CVE-2026-58052
  bit7z: set status for CVE-2026-45380 and CVE-2026-45384
  c-ares: set status for CVE-2025-31498
  grpc: set status for CVE-2023-33953 and CVE-2024-37168
  python3-grpcio: set status for CVE-2023-33953 and CVE-2024-37168
  protobuf: set status for CVE-2024-7254
  python3-protobuf: set status for CVE-2024-7254
  tcpdump: set status for CVE-2024-2397
  libcoap: set status for CVE-2023-51847

Roland Kovacs (2):
  thrift: fix multiple CVEs
  radvd: fix CVE-2026-48715

Wang Mingyu (19):
  imagemagick: upgrade 7.1.2-24 -> 7.1.2-25
  imagemagick: upgrade 7.1.2-25 -> 7.1.2-26
  imagemagick: upgrade 7.1.2-26 -> 7.1.2-27
  python3-tornado: upgrade 6.5.5 -> 6.5.6
  python3-elementpath: upgrade 5.1.1 -> 5.1.2
  python3-elementpath: upgrade 5.1.2 -> 5.1.3
  swagger-ui: upgrade 5.32.6 -> 5.32.7
  swagger-ui: upgrade 5.32.7 -> 5.32.8
  libnvme: upgrade 1.16.1 -> 1.16.2
  python3-sqlalchemy: upgrade 2.0.49 -> 2.0.50
  python3-sqlalchemy: upgrade 2.0.50 -> 2.0.51
  python3-socketio: upgrade 5.16.1 -> 5.16.2
  python3-socketio: upgrade 5.16.2 -> 5.16.3
  monocypher: upgrade 4.0.2 -> 4.0.3
  proftpd: upgrade 1.3.9b -> 1.3.9c
  python3-tzdata: upgrade 2026.2 -> 2026.3
  memcached: upgrade 1.6.42 -> 1.6.43
  memcached: upgrade 1.6.43 -> 1.6.45
  ldns: upgrade 1.9.0 -> 1.9.2

mark.yang (1):
  python3-h11: set CVE_PRODUCT

 .../ifuse/{ifuse_1.2.0.bb => ifuse_1.2.1.bb}  |    2 +-
 .../{pipewire_1.6.6.bb => pipewire_1.6.8.bb}  |    2 +-
 .../mbedtls/mbedtls_3.6.6.bb                  |   17 +
 .../{samba_4.23.5.bb => samba_4.23.8.bb}      |    2 +-
 ...{postfix_3.10.10.bb => postfix_3.10.12.bb} |    2 +-
 .../{proftpd_1.3.9b.bb => proftpd_1.3.9c.bb}  |    2 +-
 .../radvd/files/CVE-2026-48715.patch          |  213 +++
 .../radvd/files/CVE-2026-48715_dep.patch      |  106 ++
 .../recipes-daemons/radvd/radvd_2.20.bb       |    2 +
 .../libcoap/libcoap_4.3.5b.bb                 |    1 +
 ...emcached_1.6.42.bb => memcached_1.6.45.bb} |    2 +-
 .../recipes-support/tcpdump/tcpdump_4.99.6.bb |    2 +
 .../libwebsockets/CVE-2026-10650.patch        |   46 +
 .../libwebsockets/libwebsockets_4.5.8.bb      |    7 +-
 .../thrift/thrift/CVE-2026-43868.patch        | 1381 +++++++++++++++
 .../thrift/thrift/CVE-2026-43870.patch        |  134 ++
 .../thrift/thrift_0.22.0.bb                   |    4 +
 ...onocypher_4.0.2.bb => monocypher_4.0.3.bb} |    2 +-
 meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb  |    3 +
 .../jq/jq/CVE-2026-43895.patch                | 1543 +++++++++++++++++
 .../jq/jq/CVE-2026-49839.patch                |   37 +
 .../jq/jq/CVE-2026-54679.patch                |   77 +
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |    3 +
 .../ldns/{ldns_1.9.0.bb => ldns_1.9.2.bb}     |    2 +-
 ...t-fix-PRIb64-length-modifier-on-musl.patch |   49 +
 .../recipes-devtools/ltrace/ltrace_0.8.1.bb   |    1 +
 .../php/{php_8.5.7.bb => php_8.5.8.bb}        |    2 +-
 .../protobuf/protobuf_6.33.6.bb               |    2 +
 meta-oe/recipes-extended/7zip/7zip_26.00.bb   |    2 +
 meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb |    3 +
 .../{haveged_1.9.22.bb => haveged_1.9.23.bb}  |    2 +-
 .../libidn/libidn/CVE-2026-57053.patch        |   28 +
 .../recipes-extended/libidn/libidn_1.43.bb    |    1 +
 .../recipes-extended/sysdig/sysdig_0.39.0.bb  |   13 +-
 .../bpftool/bpftool-native_6.16.bb            |    5 +-
 ...-Fix-Wdiscarded-qualifiers-under-C23.patch |   69 +
 .../nmap/files/CVE-2026-58058.patch           |   33 +
 meta-oe/recipes-security/nmap/nmap_7.95.bb    |    1 +
 .../{c-ares_1.34.6.bb => c-ares_1.34.8.bb}    |    4 +-
 ...ck_7.1.2-24.bb => imagemagick_7.1.2-27.bb} |    2 +-
 .../{libnvme_1.16.1.bb => libnvme_1.16.2.bb}  |    4 +-
 ...ngo_5.2.15.bb => python3-django_5.2.16.bb} |    2 +-
 ...jango_6.0.6.bb => python3-django_6.0.7.bb} |    2 +-
 ..._5.1.1.bb => python3-elementpath_5.1.3.bb} |    2 +-
 .../python/python3-grpcio_1.78.0.bb           |    2 +
 .../python/python3-h11_0.16.0.bb              |    2 +
 .../python/python3-protobuf_6.33.6.bb         |    2 +
 ...o_5.16.1.bb => python3-socketio_5.16.3.bb} |    2 +-
 ...2.0.49.bb => python3-sqlalchemy_2.0.51.bb} |    2 +-
 ...nado_6.5.5.bb => python3-tornado_6.5.7.bb} |    2 +-
 ...ata_2026.2.bb => python3-tzdata_2026.3.bb} |    7 +-
 ...gger-ui_5.32.6.bb => swagger-ui_5.32.8.bb} |    2 +-
 .../{apache2_2.4.67.bb => apache2_2.4.68.bb}  |    2 +-
 .../{xdebug_3.5.1.bb => xdebug_3.5.3.bb}      |    2 +-
 54 files changed, 3814 insertions(+), 30 deletions(-)
 rename meta-filesystems/recipes-filesystems/ifuse/{ifuse_1.2.0.bb => ifuse_1.2.1.bb} (83%)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.6.bb => pipewire_1.6.8.bb} (99%)
 rename meta-networking/recipes-connectivity/samba/{samba_4.23.5.bb => samba_4.23.8.bb} (99%)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.10.bb => postfix_3.10.12.bb} (99%)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9b.bb => proftpd_1.3.9c.bb} (99%)
 create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-2026-48715.patch
 create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-2026-48715_dep.patch
 rename meta-networking/recipes-support/memcached/{memcached_1.6.42.bb => memcached_1.6.45.bb} (95%)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43868.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43870.patch
 rename meta-oe/recipes-crypto/monocypher/{monocypher_4.0.2.bb => monocypher_4.0.3.bb} (85%)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch
 rename meta-oe/recipes-devtools/ldns/{ldns_1.9.0.bb => ldns_1.9.2.bb} (89%)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-lens_default-fix-PRIb64-length-modifier-on-musl.patch
 rename meta-oe/recipes-devtools/php/{php_8.5.7.bb => php_8.5.8.bb} (99%)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.22.bb => haveged_1.9.23.bb} (94%)
 create mode 100644 meta-oe/recipes-extended/libidn/libidn/CVE-2026-57053.patch
 create mode 100644 meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
 create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.6.bb => c-ares_1.34.8.bb} (86%)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-24.bb => imagemagick_7.1.2-27.bb} (99%)
 rename meta-oe/recipes-support/libnvme/{libnvme_1.16.1.bb => libnvme_1.16.2.bb} (93%)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.15.bb => python3-django_5.2.16.bb} (61%)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.6.bb => python3-django_6.0.7.bb} (75%)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.1.1.bb => python3-elementpath_5.1.3.bb} (86%)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.16.1.bb => python3-socketio_5.16.3.bb} (88%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.49.bb => python3-sqlalchemy_2.0.51.bb} (88%)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.5.bb => python3-tornado_6.5.7.bb} (93%)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.2.bb => python3-tzdata_2026.3.bb} (67%)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.6.bb => swagger-ui_5.32.8.bb} (94%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.67.bb => apache2_2.4.68.bb} (99%)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.5.1.bb => xdebug_3.5.3.bb} (92%)

-- 
2.54.0



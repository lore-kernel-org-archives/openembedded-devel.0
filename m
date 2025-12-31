Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59001EE57CF
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 01:19:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77652.1767143939869479662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 17:18:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jG81NNgw;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=D1z2hA8I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUMP3Go2980989
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 01:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wH0YW02hs/d8IOuHSaLISqJ3x7+2AdUyOjn
	AUmu7//s=; b=jG81NNgwD743L49HAQzzIVypc+feNWUgknHaYpgDWgfVAB0zBjR
	E3MWvtLjddt2OFV4gPqNXLBtiwwEEVU6SqUmng6rBFA0GGAr+T8VOA8SFPR+IhbV
	ZoAuwZpRyqtZaGA0C2eas440DhjgwIjnqDrqceBtuw5kOidSE0MWI4u0ih6UfkJR
	72H/I8tBIPz84lKdsNtv62OioM1UpfXbVz3KMc5SGPfR1TgR2TUKyrXC27+JHWvs
	P88pkJZH6wxkUEr+noj6w5Dgc1cAsDnuCOXD7g/bJPGHLjPOAVnOvT8ciiGYERo4
	+MIHFQZrpiJgPiw1Al+/gQaYrVrKk77+VZw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky2bm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 01:18:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b952a966d7so21270436b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 17:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767143938; x=1767748738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wH0YW02hs/d8IOuHSaLISqJ3x7+2AdUyOjnAUmu7//s=;
        b=D1z2hA8IYE1H02UHvC5ii8s02JPlBtpa/JQnlACb+UlQ63oTEAFKjnp2OEuo37r81t
         n7YDv2hJalJy0iYj+EBG1lB9HetF5QNpJuhvcCfTweHire4lqGk7yVM160oxaiutjOBa
         uaMWcHiINqqltPRTUYfBtHQ/wVCCvmv+jBJn6hOfWZslP4G3ntJBPpGovApN6IWI6Egh
         B8+Poa4PxukdzU433rQGFc4/lxAzregy75UB/v83wlWbSjcCrAtd5TKq69TV0AsLBydE
         bvVbxYPtIj2oUzb1TlCUs1qiSj9DNuuZ72DeouIEphaDIA9x2RcPamEGETbV9trV7vh9
         Gq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767143938; x=1767748738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wH0YW02hs/d8IOuHSaLISqJ3x7+2AdUyOjnAUmu7//s=;
        b=F6C3ognzj9BAdD1C86UqurpiDqjZKChL+rL/w024EDqd5v/OdwRI4m3jrHqQHeRjQS
         FP38jFjlg/zzB1f8g1vURYArARbp20IirFci6wxhL7vGQoJ1rfO1faaT9MWXQDoOwGkt
         h8u+VRXK/LH1iaoKNOBQWTS/qEzn6P46rjsy3ztApBO/mC1JG++kMS5c66Svqkv5hvTI
         Wkg2uMk/gaNZcuL6uFW8XZn/PNmnIjvdpFktWPJaM+uscx9InPFctx7ZwNEyydFvexeB
         RG/NTXqLVSLqIDvjw3QSZyl8R+fOFwvVW1M36C7ij8n5rftEcqt8CUUGr88QI/e+zF7R
         5tNg==
X-Gm-Message-State: AOJu0YyugNnslD5NE1IoNxcJ4JsuFrOWKhgZnlsRDSrilv5bg8Vz2TMj
	TJUUtmNzrwIRv0rsF1egVSceK4t1pYKKOR2bjJG4YlwqCs2E1jYqP+iUwb2hQfozooTZgCKljBX
	Yh+O5Scy+QdAYu8iT/Za4nKkxAIFndO4nQ+0C+9sI2VsPmCUAbmFvE/QkdNEfDFksea8HHvTlnk
	cteJRfj/mLz5OiHbFmuiE=
X-Gm-Gg: AY/fxX77Dez7xwRLvca8pjmQzM3snKRMVY2hE+5BSfGm16kUBM2JFTI/D6XVtsz/7mK
	Lu3/bYyYqpgiXTIw2n5yWdGZYrQsq0CxdpSYbyQ0M0p4Fyxb2UEdkgDGKKFHVT17sIuXLUj+ge/
	7WUSrP0P+IUUXGwg6rYPTluzoSWMTH5XsfXTYlVz3iVwegOgWJNBVTdHLbU8sy8/TRlmRB3m1N9
	bFzenutSl2cf2cIVX4qv3iFP3eNFf5OopcFSEXuE0lnGyEp3qvq2tkj3hy4P2z4jv5UwezedILx
	1K8k8aa0uHhUuUalyJTLW05257GrakTnt64tJpJuGGaKSe9zLa5R7ySyN0z5A6mh31AbwWaoJ3c
	u4crxHFKnY7tcxaiLsw5y2nQsQLMIxLCBfohPSjaJ
X-Received: by 2002:a05:6a00:4f8b:b0:7ff:c51d:7e0 with SMTP id d2e1a72fcca58-7ffc51d0917mr33131801b3a.3.1767143938446;
        Tue, 30 Dec 2025 17:18:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGX4MKZKDAftbTypXIW8PLmvfmXhGdbSYGQUSZcBDwR3cVAaCOxjwMOL+AI57++Gs2hJ4mkng==
X-Received: by 2002:a05:6a00:4f8b:b0:7ff:c51d:7e0 with SMTP id d2e1a72fcca58-7ffc51d0917mr33131781b3a.3.1767143937887;
        Tue, 30 Dec 2025 17:18:57 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a844d5asm33457867b3a.3.2025.12.30.17.18.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 17:18:57 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/19] Scarthgap pull request
Date: Wed, 31 Dec 2025 06:48:43 +0530
Message-ID: <cover.1767143616.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDAwOCBTYWx0ZWRfX+he13bwat6sY
 HtB4Jxqp9sZlXBU3bmAlv67QHjlE0nV+FLbx5ueTKSMzczLlXctg89OFDO/zzBlxftuiGIpE9uK
 IE773xgm/LY6K5rsFR1Mv59WSfku/0EbPVYOSHJ9x0cgFi044YRZ31v5+jOBzVSN8vG3edfOgTH
 tzDH+mRfDvaqhmYE9CQ1vgTEOwwvGx0eBHOjkuVN5L2XqIxT0scAv9xwJzT6GR5J5WODl0qtzuy
 uqI7xNuSEB/6SJu7D0jvziTUYgc76kz2Nl5AVbPXKhUvtzl0qbwy5DrbUXJxOSyWWR6zpy+yk8d
 cPxx3th+UVXQreQURBkhMOHUTjxeMdT0h/E58gu4cyqjBIZ+fOLYRJGVNtNaEVgxhW8Z5adYq7x
 A3EGvEdqNLTDxNO5lU9PmJaqzj+gBNQYFQTW21vPBm3AyxLYwYCPYEtf8OiZiHSDKcWIMQUR8Em
 9iq6CErxUbWCgxEd9CQ==
X-Proofpoint-ORIG-GUID: k4aQl_kdf2Eh9mE_U0dEU6P1p_dg5jZj
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=69547a03 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=yu_taX9-yH500eS0-FUA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: k4aQl_kdf2Eh9mE_U0dEU6P1p_dg5jZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_04,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310008
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 01:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123039

Please merge these changes in scarthgap. Tested on autobuilder and
locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1211

The following changes since commit e76bf51a92b41d4cb185fc164ae43a863910ccd1:

  redis: Refine CVE-2022-0543 status description (2025-12-22 07:49:04 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Ankur Tyagi (6):
  cups-filters: patch CVE-2025-64524
  freerdp3: patch CVE-2025-68118
  dovecot: upgrade 2.3.21 -> 2.3.21.1
  libiec61850: patch CVE-2024-45969
  libcoap: ignore CVE-2023-51847
  libcoap: patch CVE-2025-59391

Gyorgy Sarvari (9):
  accountservice: ignore CVE-2023-3297
  minio: ignore irrelevant CVEs
  fio: ignore CVE-2025-10824
  postgresql: upgrade 16.10 -> 16.11
  sngrep: upgrade 1.8.1 -> 1.8.2
  libcoap: ignore CVE-2025-50518
  wolfssl: patch CVE-2025-7395
  zabbix: patch CVE-2025-49643
  atop: patch CVE-2025-31160

Hitendra Prajapati (1):
  krb5: fix for CVE-2024-3596

Jason Schonberg (1):
  Add missing HOMEPAGEs to xfce recipes

Peter Marko (1):
  libmemcached: ignore CVE-2023-27478

Vrushti Dabhi (1):
  p7zip 16.02: Fix CVE-2022-47069

 .../accountsservice_22.08.8.bb                |   2 +
 .../libiec61850/files/CVE-2024-45969.patch    |  32 +
 .../libiec61850/libiec61850_1.5.3.bb          |   1 +
 .../wolfssl/files/CVE-2025-7395-1.patch       |  84 +++
 .../wolfssl/files/CVE-2025-7395-2.patch       |  27 +
 .../wolfssl/files/CVE-2025-7395-3.patch       |  25 +
 .../wolfssl/wolfssl_5.7.2.bb                  |  10 +-
 .../libcoap/libcoap/CVE-2025-59391.patch      |  88 +++
 .../recipes-devtools/libcoap/libcoap_4.3.4.bb |   4 +
 ...{dovecot_2.3.21.bb => dovecot_2.3.21.1.bb} |   2 +-
 .../libmemcached/libmemcached_1.0.18.bb       |   2 +
 .../{sngrep_1.8.1.bb => sngrep_1.8.2.bb}      |   2 +-
 meta-oe/recipes-benchmark/fio/fio_3.36.bb     |   2 +
 .../krb5/krb5/CVE-2024-3596.patch             | 628 ++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.21.3.bb  |   1 +
 .../zabbix/zabbix/CVE-2025-49643.patch        |  38 ++
 .../zabbix/zabbix_6.2.9.bb                    |   1 +
 ...c-bypass-autoconf-2.69-version-check.patch |   2 +-
 ...ostgresql_16.10.bb => postgresql_16.11.bb} |   4 +-
 meta-oe/recipes-extended/minio/minio_git.bb   |   6 +
 .../p7zip/files/CVE-2022-47069.patch          |  63 ++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |   1 +
 .../cups/cups-filters/CVE-2025-64524.patch    |  81 +++
 .../cups/cups-filters_2.0.0.bb                |   1 +
 .../atop/atop/CVE-2025-31160.patch            | 607 +++++++++++++++++
 meta-oe/recipes-support/atop/atop_2.4.0.bb    |   1 +
 .../freerdp/freerdp3/CVE-2025-68118.patch     |  57 ++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |   1 +
 meta-xfce/recipes-xfce/exo/exo_4.19.0.bb      |   1 +
 .../recipes-xfce/garcon/garcon_4.19.0.bb      |   1 +
 .../thunar-volman/thunar-volman_4.18.0.bb     |   1 +
 .../recipes-xfce/tumbler/tumbler_4.18.0.bb    |   1 +
 .../xfce4-appfinder/xfce4-appfinder_4.19.1.bb |   1 +
 .../xfce4-panel/xfce4-panel_4.18.3.bb         |   1 +
 .../xfce4-session/xfce4-session_4.18.2.bb     |   1 +
 .../xfce4-settings/xfce4-settings_4.18.2.bb   |   1 +
 .../recipes-xfce/xfconf/xfconf_4.18.0.bb      |   1 +
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb  |   1 +
 38 files changed, 1774 insertions(+), 9 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45969.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/CVE-2025-59391.patch
 rename meta-networking/recipes-support/dovecot/{dovecot_2.3.21.bb => dovecot_2.3.21.1.bb} (97%)
 rename meta-networking/recipes-support/sngrep/{sngrep_1.8.1.bb => sngrep_1.8.2.bb} (95%)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-3596.patch
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2025-49643.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.10.bb => postgresql_16.11.bb} (66%)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2022-47069.patch
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
 create mode 100644 meta-oe/recipes-support/atop/atop/CVE-2025-31160.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-68118.patch

-- 
2.52.0



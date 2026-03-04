Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A799DE67A8A
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 12:39:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17096.1772627969697774345
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 04:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Qog9cGKi;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jcODhI+U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249swoR1213795
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Mar 2026 12:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hvhOdT7EVbzz3emh9ZJ8NCw+tfjaw5Tibi6
	jqxEycGo=; b=Qog9cGKiO6imYasox3KNQ7GDI2Ene6vx/xAfYGa7LIeXwuBQQI7
	iV3ZuWUNLakfiF2K/1dsf1BbrmqoegifdZBytQBiKFGSfh43vFCD92k040Yq/6NP
	SsABJH3sbDGUtNNy1LuiMg8qW9kNbD/YAZYFqBU5u0slKdbgm+Qwl54/vhNoF9O6
	KFum1EMxsi9X0lLPnjGjvdOH3N0+yFFo01ns4KrlJ6K4FR9NiumM27o+H9jG2ZNw
	L8Oh9AH/V6KxHaD/C/4+xdi6Re/oJRSJJ6EjURxRMMeKdPZsbZ49qNlNxwV6wUvY
	cdokrjbYUIqJl6N5Pg0FdGa+jqCfDC96+eg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5rf1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 12:39:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-827470bd62cso2348270b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 04:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772627967; x=1773232767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hvhOdT7EVbzz3emh9ZJ8NCw+tfjaw5Tibi6jqxEycGo=;
        b=jcODhI+U+KlAl6nM6x+gqYvbJPrjt7s4H3AUlbl8ekNB9LMOKsYkDJJcDOcn6NnUoV
         M5nPAF58ry/Oa9pvOvz0G9NfVyIHLzRxQZ5fzq58oDa/Xh6VePohP04FAzbmiY/CLuhL
         ddI1ahuJ+dV0tdGqrISl2B3oQrG7D5fdkoLBajw0EPqk8YZhqOHyPES7GXTfL7d1D794
         2EXDxVrGqf3ulIkRxoyqV10Bm1LAw3bGjKjPx9izqS9tdeP4XjUghBr9EotZmbh6i3Ng
         0yOkFOhyeIob3q1offBevV7bDurOWv+qBfw+Mi5tBOkZI8LKgF+eyYxAKkXOgX2DAUE3
         SZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772627967; x=1773232767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvhOdT7EVbzz3emh9ZJ8NCw+tfjaw5Tibi6jqxEycGo=;
        b=bzQJBbR2oMdMrOb02evhBqYFbP3LYwjHtmOYL/7StoF8E4Ez2VdZdJKRFZhH+snEKq
         AYcv0cKKnt+neod0sav3p6gc0MxiKfZ0qrnvG4LlIgsG4G9yO6MM+n1+20aSloLj+2EV
         BH446uZbNpw3ESvDcjN+dRxxVeuwq2DcLJxOhAwZpfp9Gysw7IfKhg2TOBX4Og15MvRU
         AJU6z50jRj/X8SQbc1bN6Tfanj74IP5OYX4fFItVwC/fX3ZGzU7AoqWUtgbMqZm5C9Fk
         m6v8KkncovfX+Z8bZQgdABIKDqWzDCHu3DYih09R6Mqnyo7vlZnPiwycDFlBV0FmRgCR
         X0Ag==
X-Gm-Message-State: AOJu0Yz105qQvsDyThNcmLvlr6RKPHPgwWQr/PeLUcX5wjqFk5A3HoD3
	47682G3ruK8gBiAIu95acTxznURjjrANaSR/XqCXpMlfSX37MLYCDRy48XMWAeiNzy5XY9K9x76
	IR4w7Ub3RAQ1wgTfz2kmgngceHcD96nW2dCqnUJIRH731hjgpg1e+Wh8f2YdnMrg0Pf2Ee7gI8k
	mtW3qj3Zlhaf9bBOpAibM=
X-Gm-Gg: ATEYQzwyzJYT7ApWnh9ZK4lKUo+nLpp7QlQ7BL2N4qL38ogzQ5lr9q9nhUPJ0Uuw4mF
	oSwOAuHsO/pEsK9jz3oblSbvTpvrIn1ammRNozPN3vXRexwMQgHSDIuhUIONzKrIzetXpzZtbwF
	0j9Ks58CIqFVGAfTyKSaUs1VMIxpAaBX1nS/Ku9E5ap/u+oXBz0m2vLbiualbx9kuebSG2B15Jb
	/evsu6MbQWEcDNGp9Mw1Bx00mM2uea9awyF5ZNpinqxyZWtQCSZPbG7R6KOcAiAH0rZTQpJK3Yk
	REa3IaREf47hXny3uzDBAnI7yrIoislxud5KX9XSBLv3k6cbe5dYFcGmuu2rw8vKUnJL7eVMvbA
	e4TYjYOnPMEfYnYykH8W62sJ4pl8yZVZBd2fjKGrkeTtjWPJzF29c
X-Received: by 2002:a05:6a00:240f:b0:823:9b7:9c0e with SMTP id d2e1a72fcca58-82972cef9a9mr1656615b3a.34.1772627967462;
        Wed, 04 Mar 2026 04:39:27 -0800 (PST)
X-Received: by 2002:a05:6a00:240f:b0:823:9b7:9c0e with SMTP id d2e1a72fcca58-82972cef9a9mr1656593b3a.34.1772627966924;
        Wed, 04 Mar 2026 04:39:26 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82974e75a4csm1342397b3a.30.2026.03.04.04.39.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:39:26 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/12] Scarthgap pull request
Date: Wed,  4 Mar 2026 18:09:21 +0530
Message-ID: <cover.1772625156.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W-r5jNl9snGyMGuvNXLWe5qyj0aOsObt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA5OSBTYWx0ZWRfX11OaziJK/eEa
 G1KOUlwMCv7ZbfOkP9vaMLYD1fGrCb1OfGbZrk5f9XAa4OfiHu6gsgAp0Ud5EScsAUHxQsTugF3
 G2UJLr1OnYJxU5D6QnENXHrsdTuixy5s4CLtqsCnakqIkHht+oH3qm4Qn+k9XwS8azypCoSP83M
 wNvj1b+SMZvVdsNdh9RFOflsWrCzGBmk12EU6vedxR2BpEW5nl0OV6IaI9i+omFLYb/ZC/gPlm1
 tMDG4g+2rp1zW2fxhjMcPsiUQLC23+mbBzAtGkZV2sgiEWyb9GvTjN3PvWUVihCxMy9m+vgRj/W
 03vt9UjdTHkTj82EXe0q4eSC/YlXgd/FiC0Wru/dezb8SMpjad11vhng/FPFD2CfDmuZ3oVoQ9v
 D1QxgyqC+HGsSCuKBvaPSU06cCIAfWovdGTNwUutOvgkI/3r3O7bym0ahUEwgCXADg5AMJfOOUH
 ZwGPtI7QUBx14G560Xw==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a82800 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=5KgLxMy_OAud9kngw0QA:9 a=IoOABgeZipijB_acs4fv:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: W-r5jNl9snGyMGuvNXLWe5qyj0aOsObt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 12:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124849

Please merge these changes in scarthgap. Tested locally with
qemuarm/qemux86-64/qemuarm64 and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1333


The following changes since commit ec0469748be4159fb83fb0fa0148d786484c88cf:

  nodejs: fix gcc compile failed for 32 bit arm target (2026-02-12 15:59:04 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Alexandre Truong (1):
  source-han-sans-*-fonts: rename downloaded files in SRC_URI

Anil Dongare (1):
  wireshark 4.2.14: Fix CVE-2026-0962

Ankur Tyagi (1):
  dovecot: ignore CVE-2025-30189

Anuj Mittal (1):
  README: update listed maintainer

Daniel Klauer (1):
  nbench-byte: Fix sysinfo generation in parallel build

Geoff Parker (1):
  python3-m2crypto: fix python3-m2crypto-native do_configure:prepend()

Gyorgy Sarvari (1):
  nginx: patch CVE-2026-1642

Martin Jansa (1):
  nodejs: add missing Upstream-Status

Peter Marko (1):
  fcgi: add follow-up patch for CVE-2025-23016

Tafil Avdyli (1):
  python3-pybind11-json: fix Targets.cmake trying to reference host

Vijay Anusuri (1):
  postgresql: upgrade 16.11 -> 16.12

Yoann Congal (1):
  polkit: Switch PAM files to common-*

 README.md                                     |   2 +-
 meta-filesystems/README.md                    |   2 +-
 meta-gnome/README.md                          |   2 +-
 meta-initramfs/README.md                      |   2 +-
 meta-multimedia/README.md                     |   2 +-
 meta-networking/MAINTAINERS                   |   2 +-
 meta-networking/README.md                     |   2 +-
 .../dovecot/dovecot_2.3.21.1.bb               |   1 +
 .../wireshark/files/CVE-2026-0962.patch       | 152 ++++++++++++++++++
 .../wireshark/wireshark_4.2.14.bb             |   1 +
 meta-oe/README.md                             |   2 +-
 ...sysinfo-generation-in-parallel-build.patch |  69 ++++++++
 .../sysinfo.sh-Fix-typo-in-rm-command.patch   |  27 ++++
 .../nbench-byte/nbench-byte_2.2.3.bb          |   4 +-
 ...c-bypass-autoconf-2.69-version-check.patch |   2 +-
 ...ostgresql_16.11.bb => postgresql_16.12.bb} |   4 +-
 ...ert-stop-using-deprecated-ares_query.patch |   1 +
 ...pport-openembedded-OS-for-PAM-config.patch |  48 ++++++
 meta-oe/recipes-extended/polkit/polkit_124.bb |   5 +
 .../source-han-sans-cn-fonts_2.004.bb         |   2 +-
 .../source-han-sans-jp-fonts_2.004.bb         |   2 +-
 .../source-han-sans-kr-fonts_2.004.bb         |   2 +-
 .../source-han-sans-tw-fonts_2.004.bb         |   2 +-
 meta-perl/README.md                           |   2 +-
 meta-python/README.md                         |   2 +-
 .../python/python3-m2crypto_0.40.1.bb         |   2 +-
 ...p-PYTHON_INCLUDE_DIRS-from-interface.patch |  34 ++++
 .../python/python3-pybind11-json_0.2.13.bb    |   3 +-
 meta-webserver/README.md                      |   2 +-
 .../nginx/files/CVE-2026-1642.patch           |  46 ++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
 ...25-23016.patch => CVE-2025-23016-01.patch} |   0
 .../fcgi/fcgi/CVE-2025-23016-02.patch         |  83 ++++++++++
 .../recipes-support/fcgi/fcgi_git.bb          |   3 +-
 meta-xfce/README.md                           |   2 +-
 35 files changed, 495 insertions(+), 23 deletions(-)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysinfo-generation-in-parallel-build.patch
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-typo-in-rm-command.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.11.bb => postgresql_16.12.bb} (75%)
 create mode 100644 meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11-json/0001-CMakeLists-drop-PYTHON_INCLUDE_DIRS-from-interface.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
 rename meta-webserver/recipes-support/fcgi/fcgi/{CVE-2025-23016.patch => CVE-2025-23016-01.patch} (100%)
 create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016-02.patch

-- 
2.53.0



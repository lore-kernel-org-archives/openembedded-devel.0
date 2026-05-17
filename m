Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F563CD4F48
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20192.1779006242710629268
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MZFmyiJ+;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=eV/0H9IC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GLF7Nq2167400
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aDvUahrz7jJxjEoMQqhHWUFZB2bieXVt+fe
	MzM6+o/0=; b=MZFmyiJ+uZtTqcvzsHQoC4Y1CwSGGkHq4pNwa9fuDAte9AHBZs+
	eGnSUnnoKkgXiHMwZVtOU5DwTKh9jrJ8HVVufRLqRrRg/jxl+N6fRH9KgzeUwKX+
	N0q62XKHYWhn9u7wqaSZG+DJmpYkILjYYVxzUfv53+5wBic9p6zFTa68MdJMqZnO
	Cwh7hfp14TfAdDnt8ZucMSw91HAVly+3jrGCxL8WtyHbYvMqiHvswGzda5Ij40gD
	x2DIX8nmBt3RGULpyxEakUR7ueg4D/wpVT5CYKT5IvjC74SomoOSczxYrGLPWH9E
	mBz+Id5h1dD9nLlKLL3vsEDPVvAVlNOZa9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gy52h1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso2356417a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006240; x=1779611040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDvUahrz7jJxjEoMQqhHWUFZB2bieXVt+feMzM6+o/0=;
        b=eV/0H9ICFL5rkC6CliWjkwKNbl71dPTTIV05oF5kpsSriC9oJAe8D6PBMqb7osM8HA
         Blp+j607Mm3diUK49AhWEnFwtwUKcMqPiskcxW/UbkJo+K+kwLdh80IXVO/vq/rXrKeJ
         NGMV+hPOl+kh1TY/PZm9C4MBaE55WKv0KcIBWmSSqEBIhvlWY9ngrENbH/pFCaE8OSGv
         VNmjKiB3JqOSwHXZsfLt8wOi18m4oQ+D/splUkAXquOXRjbjTCa9YHwPUwXS2yqfGTOI
         8SDopWZLjgL4wzW+mSlOQktvvYix/VzFUfVwoZQkXGd1JzKAWrIehZRJRACFSYlDMG9y
         McWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006240; x=1779611040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDvUahrz7jJxjEoMQqhHWUFZB2bieXVt+feMzM6+o/0=;
        b=ho+PNIhYXqh53Ofcp1/ErnzNsQa/BzrkjlqnAmOg+r3fchuKA8w5Hu9oYLnpdLwTln
         7UndhOfieAUBDToMBhWjRKthf2jO7+0sg2v9Dw1unq1H34uDN8OJ5EahW21vNKBcIz0X
         7htB9AR92qcZR7++ZUNYAe74pyd9CrEuOxQNujEWEmpuQJ9+HEPbbpWMjzWZdCKtFudU
         djKrFvVDl86tVXEncK0bq0nZ5IRPa/hpLLCC7QWnTIS3CVnoScjIdWIaYWpmGUrol5rF
         kd4y6f4G5lIprU9bpnMjgVZ/b4JxjpKDT3hrfRj3OCi34Nvb8RR/ARb1/pH+x0o9DxKh
         aqNQ==
X-Gm-Message-State: AOJu0YzgptbAiDywc5agPzgbJg+pw1XbXHg3rvPgPf3ofZhC5HNS1QwF
	SaviyoFJqNMnWhQUPtFOtvez1OYMM5X4f1dDEhZrx+2ikvujafI4x5Uyp87VXJdcl0OYyzsJqvQ
	BlQ4Eo6MwQ7IUHTIvN7hLImCM3SJZZsz3rODnHzNs8rJmOZwomsizMF34eRcDSUsbAxF/yZrid0
	hqdQZbdnj3NGQfC1mQ/c4ueQ==
X-Gm-Gg: Acq92OGq7xxGP9rxfT0uru7ay0w7R8hX80aFVxXZUU4gpPB2SiOZJKiyNmewXQ5azk1
	BqdV0/TMDMN0XcWZp/kDJNc7ag5x4n5PqEY2/NP95aCSI9jn4o+1H9JXVFpVNGWdOWh6kGsDiSA
	whRMtk/bawr2CBGmvPOkskGOoLEBJ+u3YaxV6CieRAGNG6ohU4tI3lpjfQGwkIrCX0YtUJnUCr9
	HvcUAeZcLpXmSjGhkOqe7gRgv1UtsRwAcDavAMneLvvuFWjPWl3bPRDaDDleAMcWaJc6ShlUXJe
	5Jd0/tdfJzPzf1tplUbCeWRwb7IJva3L/JrGV+ieXMM3WOwPQ4y74f0NHp2zcu8c0fIPJPoJAQh
	VWpTL718WKOmKeRjTuk9kOnQTiMDq6gpVwe8G7G0kgfm4Ha8NK+T4
X-Received: by 2002:a17:90b:5483:b0:368:b692:eb9f with SMTP id 98e67ed59e1d1-36951b8e50fmr10843864a91.19.1779006240456;
        Sun, 17 May 2026 01:24:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5483:b0:368:b692:eb9f with SMTP id 98e67ed59e1d1-36951b8e50fmr10843840a91.19.1779006239752;
        Sun, 17 May 2026 01:23:59 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.23.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:23:59 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][PATCH 00/29] Wrynose pull request
Date: Sun, 17 May 2026 13:49:28 +0530
Message-ID: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wusb99fv c=1 sm=1 tr=0 ts=6a097b21 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=JFbu4M2HoakZdZ_joAgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: LEPt9wp35gki0Cfb0kaJPvkg-cDjori0
X-Proofpoint-ORIG-GUID: LEPt9wp35gki0Cfb0kaJPvkg-cDjori0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX3N4izRYcT3LF
 8DVfZ853Dw9Ov2OxseY36QM95KLJbRVDBd6bWhF2N7AFfF51DCtT604HIfwJ3Owc8CgSCDyFkzR
 d9D6kfbDWa3mR2wTw5ppbbZo0f9LafQxU6/C8ccgpjFcbAb6dhfNRj5s0Nn7UXnnp02fXQCmZIc
 8pdXvi/mHieUqRRrKd4yQc6kvsyjSLy0uUZkeWVlOuDFlVGgxiXmCYwL3yKyibWt8qT2yD6AZKg
 qBNqhH/+aWt0TwmLUeQ51x1lMaXHVc6fIJO68dgte36IFzm8mJJUXAkTC4PfE+otZY3u03jec9v
 0qCxVe7aJJHLSeTD+dQfPXPCka6elJ1SC4lgZt3FfxRJdZj1K+FxXpekE2mnKYtjpq52WhtUzX+
 ffGdLyE5BGtdchlAodkQWG8/rRGPxltpgujp8mne8xqvNJjB3h2d5bdf6Q91qQYMuWtaUhbVpsL
 YqEoE2TrSSWOETy6txA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127013

Includes some build and CVE fixes and some upgrades that included only bug fixes.

Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1526

The following changes since commit 420222862f5a6d95023b8f5f3b7e1808b2264ef9:

  networkmanager: re-implement the vala detection (2026-04-24 18:39:52 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/wrynose

for you to fetch changes up to 9af4488d46cb4fd4c0d2d64820c86225ebd6ac71:

  libtsm: upgrade 4.4.3 -> 4.5.0 (2026-05-17 11:52:30 +0530)

----------------------------------------------------------------

Adam Duskett (1):
  kmscon: upgrade 9.3.3 -> 9.3.5

Changqing Li (1):
  postfix: make it can compile with linux 7.x

Ernest Van Hoecke (1):
  jsoncpp: Fix C++11 ABI breakage when compiled with C++17

Fabian Pflug (1):
  pkcs11-provider: fix build error on 32 bit systems

Gianfranco Costamagna (1):
  vboxguestdrivers: Upgrade to 7.2.8

Gyorgy Sarvari (1):
  libcoap: mark CVE-2026-29013 patched

Hongxu Jia (1):
  thin-provisioning-tools: fix compile failure on 32bit BSPs

Jason Schonberg (2):
  xfdesktop: upgrade 4.20.1 -> 4.20.2
  orage: upgrade 4.20.2 -> 4.20.3

Jiaying Song (1):
  python3-blivet: switch from setuptools3_legacy to
    python_setuptools_build_meta

Liu Yiding (1):
  eog: Add HOMEPAGE

Liyin Zhang (1):
  apache2: upgrade 2.4.66 -> 2.4.67

Peter Marko (1):
  cryptsetup: update udev package config

Ross Burton (1):
  iwd: depend on the regulatory database

Wang Mingyu (10):
  bubblewrap: upgrade 0.11.1 -> 0.11.2
  fastfetch: upgrade 2.61.0 -> 2.62.1
  imagemagick: upgrade 7.1.2-19 -> 7.1.2-21
  strongswan: upgrade 6.0.5 -> 6.0.6
  valkey: upgrade 9.0.3 -> 9.0.4
  libauthen-sasl-perl: upgrade 2.1800 -> 2.2000
  hunspell: upgrade 1.7.2 -> 1.7.3
  znc: upgrade 1.10.1 -> 1.10.2
  python3-ujson: upgrade 5.12.0 -> 5.12.1
  libtsm: upgrade 4.4.3 -> 4.5.0

Yi Zhao (4):
  webkitgtk3: fix build on riscv64
  proftpd: upgrade 1.3.9 -> 1.3.9a
  postfix: upgrade 3.10.8 -> 3.10.9
  nftables: improve reproducibility

Zhang Xiao (1):
  python3-aspectlib: Fix pytest compatibility

 meta-gnome/recipes-gnome/eog/eog_49.3.bb      |   2 +
 .../files/0001-Fix-build-with-musl.patch      |  50 +++
 ...kedefs-Account-for-linux-7.x-version.patch |  47 +++
 .../{postfix_3.10.8.bb => postfix_3.10.9.bb}  |   4 +-
 .../{proftpd_1.3.9.bb => proftpd_1.3.9a.bb}   |   4 +-
 .../libcoap/libcoap_4.3.5b.bb                 |   1 +
 ...URCE_DATE_EPOCH-for-build-time-stamp.patch |  41 ++
 .../recipes-filter/nftables/nftables_1.1.6.bb |   1 +
 .../znc/{znc_1.10.1.bb => znc_1.10.2.bb}      |   2 +-
 ...trongswan_6.0.5.bb => strongswan_6.0.6.bb} |   2 +-
 meta-oe/recipes-connectivity/iwd/iwd_3.12.bb  |   1 +
 .../cryptsetup/cryptsetup_2.8.6.bb            |   2 +-
 ...akage-when-compiled-with-C-17-1668-1.patch | 368 ++++++++++++++++++
 .../recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb |   1 +
 .../{valkey_9.0.3.bb => valkey_9.0.4.bb}      |   2 +-
 .../{kmscon_9.3.3.bb => kmscon_9.3.5.bb}      |   2 +-
 .../{libtsm_4.4.3.bb => libtsm_4.5.0.bb}      |   2 +-
 ...blewrap_0.11.1.bb => bubblewrap_0.11.2.bb} |   2 +-
 ...astfetch_2.61.0.bb => fastfetch_2.62.1.bb} |   2 +-
 .../{hunspell_1.7.2.bb => hunspell_1.7.3.bb}  |   4 +-
 ...ck_7.1.2-19.bb => imagemagick_7.1.2-21.bb} |   2 +-
 ...-Fix-i686-build-failures-in-cipher.c.patch |  62 +++
 .../pkcs11-provider/pkcs11-provider_1.2.bb    |   1 +
 .../thin-provisioning-tools_1.3.1.bb          |   4 +-
 ...ers_7.2.6.bb => vboxguestdrivers_7.2.8.bb} |   2 +-
 .../webkitgtk/webkitgtk3_2.50.6.bb            |   4 +
 ....1800.bb => libauthen-sasl-perl_2.2000.bb} |   2 +-
 ...-aspectlib-backport-fix-for-selftest.patch |  37 ++
 .../python/python3-aspectlib_2.0.0.bb         |   1 +
 ...json_5.12.0.bb => python3-ujson_5.12.1.bb} |   2 +-
 .../python-blivet/python3-blivet_3.13.2.bb    |   2 +-
 .../{apache2_2.4.66.bb => apache2_2.4.67.bb}  |   2 +-
 .../{orage_4.20.2.bb => orage_4.20.3.bb}      |   2 +-
 ...fdesktop_4.20.1.bb => xfdesktop_4.20.2.bb} |   2 +-
 34 files changed, 642 insertions(+), 23 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.8.bb => postfix_3.10.9.bb} (98%)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9.bb => proftpd_1.3.9a.bb} (98%)
 create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch
 rename meta-networking/recipes-irc/znc/{znc_1.10.1.bb => znc_1.10.2.bb} (94%)
 rename meta-networking/recipes-support/strongswan/{strongswan_6.0.5.bb => strongswan_6.0.6.bb} (99%)
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.3.bb => valkey_9.0.4.bb} (98%)
 rename meta-oe/recipes-graphics/kmscon/{kmscon_9.3.3.bb => kmscon_9.3.5.bb} (97%)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.3.bb => libtsm_4.5.0.bb} (95%)
 rename meta-oe/recipes-security/bubblewrap/{bubblewrap_0.11.1.bb => bubblewrap_0.11.2.bb} (90%)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.61.0.bb => fastfetch_2.62.1.bb} (98%)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.7.2.bb => hunspell_1.7.3.bb} (89%)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-19.bb => imagemagick_7.1.2-21.bb} (99%)
 create mode 100644 meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-failures-in-cipher.c.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.6.bb => vboxguestdrivers_7.2.8.bb} (97%)
 rename meta-perl/recipes-perl/libauthen/{libauthen-sasl-perl_2.1800.bb => libauthen-sasl-perl_2.2000.bb} (92%)
 create mode 100644 meta-python/recipes-devtools/python/python3-aspectlib/0001-python3-aspectlib-backport-fix-for-selftest.patch
 rename meta-python/recipes-devtools/python/{python3-ujson_5.12.0.bb => python3-ujson_5.12.1.bb} (88%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.66.bb => apache2_2.4.67.bb} (99%)
 rename meta-xfce/recipes-apps/orage/{orage_4.20.2.bb => orage_4.20.3.bb} (88%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.20.1.bb => xfdesktop_4.20.2.bb} (88%)

-- 
2.53.0



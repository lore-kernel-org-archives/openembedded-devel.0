Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FEFCD6E75
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 03:01:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.353.1780628474893657337
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2026 20:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=JDYzYH+z;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=AJ1+H/TN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654MpwBJ1132195
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 Jun 2026 03:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KcQjqltIWiSiCzLrFSy+2W
	p0ZAvyznSIXmEi1ByK00I=; b=JDYzYH+zqBiOn6x+HUfb6YWarkgLSbdIClYfIm
	WJZs1+7xVIyueNy8wTq+3BXfK8SM99J3SCxFr7OfyFYy2+8Qim5Ggj3BLygHN5dE
	eEb42Yye6LVa+q8n7+2WKtfZnnlEwiWy6oZ1a1oh0D8U949AG99fAHFp6xQjHNdp
	gifM22zyGJTW7zpcDPDdZiNbKUtAUGVnhMnxsNyWJIgxs2iTrgQekr2/h8rPbm9L
	dm+HjfkjmKJcN4qzWF/gCJXT3HNDAJgR8I9WQVaicAn6/4kBHuTxvqoJ8LL+7KXr
	ec8UHBgKE6dDaF5hXaY+1DF5Itgcd2d/9WNBeHTN6CS7iQAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsmecr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jun 2026 03:01:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1845bddfso16920245ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 20:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780628472; x=1781233272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KcQjqltIWiSiCzLrFSy+2Wp0ZAvyznSIXmEi1ByK00I=;
        b=AJ1+H/TN9ZhEP1hdpNUQ9N9DLjIIrNPnWvK1oIKQAJqC3zebvVeBF77eN+GorPICB3
         P/YZr8Ig25+OicSKCrsHbC4alQxTX9UzSEoSgtTVlPNtzM61BmtmAndy4bMwCqDnK5dt
         LqHhFEDWUI2utwCqU+Rh+5fSVSXCggygLPN9J5XGnfsxg90QpfmC9zN7mUickg5Heg66
         Fgd2CSpwDgXbp3FFPufiGVKzMsEXun/E0PxEmAqQ0gXV2rPayoD1JARN3jQKABCCpNkp
         80dNGlWOyXq7FAQsW8947K+/EgLsqTt1iWkTASM7CYYuiLxufOfLvYfvzvnetBxcEj+t
         /EiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780628472; x=1781233272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcQjqltIWiSiCzLrFSy+2Wp0ZAvyznSIXmEi1ByK00I=;
        b=nzwjNFt0RVbTR6CkCWGRfVgJ8mTKh4DuNJZxrnNoUQgrypvjwf8eHg6cXNWG/0S7z0
         6/xpefzVJbe6x48aPH9d7fpvvcAM2Cs75NsZxirxAw1cz/gu7F6RIfcQ+aek51ySPCKU
         9vUdvTGkINWYSmUXA89ZqXhvfWmchcjugUrhorEtZoALIotePZegoEuqDYpjzRnrAUGC
         ukBtfqrK1Kwj0J13SQ73mByGTlCt9n0+JLuFZZDMDN/O14BSntMx4lQAGdWNDEQjbfoK
         JsSiC+hvuQc1Z8Fw68oaIWOHyWZ+RgDVgIdwVmzvW7a3EqU7dcDXkCbgN2AuYmDvQFXC
         Md0A==
X-Forwarded-Encrypted: i=1; AFNElJ+fqxwZFwhkA2jG2ziHgU7wR6vGJk/GSj3ZZr4lHC4RZDLuKlcXWjHn7cGgKmty2a8ZDpg1yUap+SRDBIFz3CSgEhI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzgzVEc1LUS+MF/oLrjIyDDfxA9mid8V12sJY94eZOYNVyfUiP
	QXJyPvKlllfJMmEsRXLZOOvqjeqo9Cdxrd9vPrkTQGzbjnw1xoBDFtu+PuUMblhlMVUUSRF5aVB
	X1vYRZzwLjXgnG95GXsYMvoczzWu47oRbTb2DKor5A6+oZg3pojoZSBhg3ZrRCZLrsP1ieBDbrk
	G0SzNJ99kQ
X-Gm-Gg: Acq92OG+Kch60uOSZA0aFODWM+N1RxdFTAy+BrUVChs/0DQbA0kDESVuQwVy3rtkJnA
	+IPtMhlfQ6+iGdGnJ4Tw8vzLg6MAhuyG7jo420a0Z3pUTUINBQWmaDyYiXmBFG8QGLPH0Qredjz
	h0By/nGdUegedzhPlYk41TMCBCu+znwyHY0dV/rdmiymHgGMkGbCmNI8JEFARzPBzdX5sGQzql8
	SdNXgmVLG4J21sZJ1SnJPkPJSkf2exH5GfBS59ErUhr0fjxgmla6Z07E36cjFAq47yBdYG+Plvf
	bB8EGv+PZsoHO3Y9a6eaFOmM+2hGytBCWbA1rPdDObSqBNn3hFlfJrZmSbW/TPWcThp2GDD6BCg
	rcviGWzKAifdB5r0281qD325H3DtCP2Mdg18Y1hwH3gzvZU7zgX13L9mHVVWBSos=
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr15158025ad.1.1780628472142;
        Thu, 04 Jun 2026 20:01:12 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr15157545ad.1.1780628471582;
        Thu, 04 Jun 2026 20:01:11 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm76725295ad.82.2026.06.04.20.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:01:11 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/27] Wrynose pull request
Date: Fri,  5 Jun 2026 08:31:03 +0530
Message-ID: <cover.1780628170.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GBNakwW5YkX43wEOOI3XRPcPMtebgTSc
X-Proofpoint-ORIG-GUID: GBNakwW5YkX43wEOOI3XRPcPMtebgTSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAyNiBTYWx0ZWRfX9w5EG3EUUF28
 Kk9Slyta1T9RO7xAGDgSkRWl4pTgE4XP0bmn0DhSWZ0J1xJ1XoYTEa1JNkZ8zxPJDeQc01EQ/Rf
 22eOcaXhAfRCTuMPspGitJWKrIWqc/5sBvoTRoutFLZnCIemXrZZWgKmjmcNPZ4TrFzbK3AnvpH
 5DHP+2QwSoGx/cnOB/VlOiWn3vTtfAYfuKM7VmkkMq8ASyuRAaeobFzWJ5yazAxOTb843UpqM4M
 PWOgMFErzbSk6SdzRdINNkYnNzYRLVs3GXZkYvTLiy8PXU/cl14DrAmhs6bIT80DcdKncuNPB8Y
 walE31vNJEH8KawFUPQXH56s6X/LTRxhTYVSilLM1VY2yTL0lqe1LOzCyILNrVpGUp5FYoBK4d7
 YqigG5LIwt4t3U4q8+ujZuhFyLWG7EJDOy2Mmna4e8XWJd/X1VkUZ0gK+FYokUEXhto4LMI+Ijf
 JiBLN6Vf4K8t3Sn6RHw==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a223bf9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=EVeF8XYmiK8HtvDKcMAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jun 2026 03:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127404

Please merge these changes in wrynose. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1540

The following changes since commit 9af4488d46cb4fd4c0d2d64820c86225ebd6ac71:

  libtsm: upgrade 4.4.3 -> 4.5.0 (2026-05-17 11:52:30 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/wrynose

for you to fetch changes up to a43f0d532c399458cae44ce66f3799a220fbb497:

  README: update listed maintainer (2026-05-29 09:29:32 +0530)

----------------------------------------------------------------

Abhishek Bachiphale (4):
  dnsmasq: fix CVE-2026-4891
  dnsmasq: fix CVE-2026-4892
  dnsmasq: fix CVE-2026-4893
  dnsmasq: fix CVE-2026-5172

Adam Duskett (1):
  kmscon: fix zlib cross-compiling errors

Ankur Tyagi (3):
  python3-django: upgrade 5.2.13 -> 5.2.14
  python3-django: upgrade 6.0.4 -> 6.0.5
  imagemagick: upgrade 7.1.2-22 -> 7.1.2-23

Anuj Mittal (1):
  README: update listed maintainer

Guocai He (1):
  postgresql: upgrade 17.8 -> 17.10

Jason Schonberg (2):
  Update README.md example with new branch name.
  nodejs: upgrade 22.22.2 -> 22.22.3

Jiaying Song (1):
  layer.conf: remove dead BBFILES_DYNAMIC entry for clang-layer

Markus Volk (1):
  pipewire: update 1.6.3 -> 1.6.5

Wang Mingyu (13):
  localsearch: upgrade 3.11.0 -> 3.11.1
  neatvnc: upgrade 0.9.5 -> 0.9.6
  python3-inline-snapshot: upgrade 0.32.6 -> 0.32.7
  python3-tzdata: upgrade 2026.1 -> 2026.2
  python3-typeguard: upgrade 4.5.1 -> 4.5.2
  python3-huey: upgrade 3.0.0 -> 3.0.1
  swagger-ui: upgrade 5.32.2 -> 5.32.5
  swagger-ui: upgrade 5.32.5 -> 5.32.6
  imagemagick: upgrade 7.1.2-21 -> 7.1.2-22
  bit7z: upgrade 4.0.11 -> 4.0.12
  uriparser: upgrade 1.0.0 -> 1.0.1
  uriparser: upgrade 1.0.1 -> 1.0.2
  lldpd: upgrade 1.0.21 -> 1.0.22

 README.md                                     |  2 +-
 meta-filesystems/README.md                    |  4 +-
 meta-gnome/README.md                          |  4 +-
 ...search_3.11.0.bb => localsearch_3.11.1.bb} |  2 +-
 meta-initramfs/README.md                      |  5 +-
 meta-multimedia/README.md                     |  4 +-
 .../{pipewire_1.6.3.bb => pipewire_1.6.5.bb}  |  2 +-
 meta-networking/MAINTAINERS                   |  3 +-
 meta-networking/README.md                     |  2 +-
 .../{lldpd_1.0.21.bb => lldpd_1.0.22.bb}      |  2 +-
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  4 ++
 .../dnsmasq/files/CVE-2026-4891.patch         | 40 +++++++++++++
 .../dnsmasq/files/CVE-2026-4892.patch         | 36 +++++++++++
 .../dnsmasq/files/CVE-2026-4893.patch         | 34 +++++++++++
 .../dnsmasq/files/CVE-2026-5172.patch         | 34 +++++++++++
 meta-oe/README.md                             |  4 +-
 meta-oe/conf/layer.conf                       |  2 -
 ...c-bypass-autoconf-2.69-version-check.patch |  2 +-
 ...postgresql_17.8.bb => postgresql_17.10.bb} |  2 +-
 .../0001-detect-aarch64-Neon-correctly.patch  | 51 ----------------
 .../0001-fix-arm-Neon-intrinsics-types.patch  | 59 ------------------
 ...header-value-__builtin_ctzll-undefin.patch | 60 -------------------
 .../{nodejs_22.22.2.bb => nodejs_22.22.3.bb}  |  5 +-
 .../7zip/{bit7z_4.0.11.bb => bit7z_4.0.12.bb} |  2 +-
 ...0001-fix-zlib-cross-compiling-errors.patch | 51 ++++++++++++++++
 .../recipes-graphics/kmscon/kmscon_9.3.5.bb   |  5 +-
 .../neatvnc/neatvnc/0001-Use-aml-v1.patch     | 21 +++----
 .../{neatvnc_0.9.5.bb => neatvnc_0.9.6.bb}    |  2 +-
 ...ck_7.1.2-21.bb => imagemagick_7.1.2-23.bb} |  2 +-
 ...{uriparser_1.0.0.bb => uriparser_1.0.2.bb} |  2 +-
 meta-perl/README.md                           |  6 +-
 meta-python/README.md                         |  6 +-
 ...ngo_5.2.13.bb => python3-django_5.2.14.bb} |  2 +-
 ...jango_6.0.4.bb => python3-django_6.0.5.bb} |  2 +-
 ...n3-huey_3.0.0.bb => python3-huey_3.0.1.bb} |  2 +-
 ...6.bb => python3-inline-snapshot_0.32.7.bb} |  2 +-
 ...rd_4.5.1.bb => python3-typeguard_4.5.2.bb} |  2 +-
 ...ata_2026.1.bb => python3-tzdata_2026.2.bb} |  2 +-
 meta-webserver/README.md                      |  5 +-
 ...gger-ui_5.32.2.bb => swagger-ui_5.32.6.bb} |  2 +-
 meta-xfce/README.md                           |  5 +-
 41 files changed, 250 insertions(+), 234 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{localsearch_3.11.0.bb => localsearch_3.11.1.bb} (96%)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.3.bb => pipewire_1.6.5.bb} (99%)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.21.bb => lldpd_1.0.22.bb} (96%)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.8.bb => postgresql_17.10.bb} (87%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-detect-aarch64-Neon-correctly.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-fix-arm-Neon-intrinsics-types.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.2.bb => nodejs_22.22.3.bb} (96%)
 rename meta-oe/recipes-extended/7zip/{bit7z_4.0.11.bb => bit7z_4.0.12.bb} (98%)
 create mode 100644 meta-oe/recipes-graphics/kmscon/files/0001-fix-zlib-cross-compiling-errors.patch
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.9.5.bb => neatvnc_0.9.6.bb} (96%)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-21.bb => imagemagick_7.1.2-23.bb} (99%)
 rename meta-oe/recipes-support/uriparser/{uriparser_1.0.0.bb => uriparser_1.0.2.bb} (91%)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.13.bb => python3-django_5.2.14.bb} (61%)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.4.bb => python3-django_6.0.5.bb} (75%)
 rename meta-python/recipes-devtools/python/{python3-huey_3.0.0.bb => python3-huey_3.0.1.bb} (79%)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.32.6.bb => python3-inline-snapshot_0.32.7.bb} (88%)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.5.1.bb => python3-typeguard_4.5.2.bb} (88%)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.1.bb => python3-tzdata_2026.2.bb} (85%)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.2.bb => swagger-ui_5.32.6.bb} (94%)

-- 
2.54.0



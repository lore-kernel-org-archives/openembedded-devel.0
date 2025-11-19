Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C47CF6497
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 23:34:12 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21061.1763595241946815208
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 15:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=p8aAcpNH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=PruyO6y2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJNEUTT3314703
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 23:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2b/puTj7wx92s4kM6WfYOI
	Zc6BMdp9BCXmciP3HrqGQ=; b=p8aAcpNHXYvJdmSpqUxeEboLpNTj1cs0yYybl7
	5ou8HFn3HUYOxeCMBVLUdZnZQaD5jCN9XaYROOWEeKCO2PJ3ylvF+SQWGXgbcFJ7
	+sEMAz3SRoIiUQ/PMJ0aDiOu9HRgckoYS0+0zld1rhCiirz4ZLF5laFvlzVEVuJd
	mbxzYwGtdZVqBbugJq1cKT+6LVU1DqYPRGGBrZb4jWFoLShIxTPSYGm+vlFu6Pra
	tto3wXU+cGNDIQB955H6r1WCBmnxOs1Q6riS7lfHiPb5cyWVfMXKh9bP/ZbQInz+
	6qI11frjs/BDGNcGYY6cgVSy5D2h2Mx2e+j8LZOvHpaDFrYA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6fgb9xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 23:34:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b90740249dso515879b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 15:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763595240; x=1764200040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2b/puTj7wx92s4kM6WfYOIZc6BMdp9BCXmciP3HrqGQ=;
        b=PruyO6y20coycy/C8j7RVHPZig5pvAOMxIf9VZsR7hsECj9A8AQYR1lZ81E1/cp86b
         j/AHLhh4LTtZL3wrz7wS10dfLb4YIpYRLxY9bw0LwjijS9xgRiXPRyjjK1rDggLde/wj
         lFy8JrD7XfHcPziSvXQAzM1nGEKQVr5Gu9CP2/LuZl3JwCqZLiFIFhznVpuwo+NO0obB
         g7Z9pT0C2FlyzqS/sa9Epkec7ibnUw742DmWpAbupnd3ZxhSFtxKeNIe55vt0CV/TYoa
         jiNVuJgB5P/dkid6wnlHPjFtuLojAzAi51QAHr1S4w+Le3EXyqEio8Jl3TUCp7kkYVmS
         YJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763595240; x=1764200040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2b/puTj7wx92s4kM6WfYOIZc6BMdp9BCXmciP3HrqGQ=;
        b=YIxOgEKngejE48XMxk8diGJg6RFp89mrx01X5vWX8qyEpDMo6QVR47JZHbmod3oR/c
         tQtDg3Zd+Zy4TV48YZIX5rrPGb+vcGknMx1ErC7IKx5cthGYvJsEMaAIEQOmw/jOESuT
         jNNxUoqsvM63T52UaDxJ6K3p5L/gpmi68r65VwJNDJ3ws7yW5gjFqSLk0sMtwkGykNGh
         FZU0++nWDAcJwrDrC1miha2c29WsYdQNPZDYbt0+akl+fFy4kaZ/gh4n1DfTVdByq6nh
         DpPLmQfZzmzaOTKwDQBRy/8zBnYyV9pwbFjtQsWD5NWoFrhdH6VdloF1Wax6dJhFnZ5R
         zpcg==
X-Forwarded-Encrypted: i=1; AJvYcCWhSYrFFKz+g+bpwOPe4XZtIyOx2q2tWDAnu5JVTr1/MlXtrCX23FnX+aj1IaJLXQfg+5pwgKabX17XROsO4WUl4cU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwGeAdIKjzWd2ALBmTgJ1sXptGC9BXj3/VHGa96eFe9ssn/pSB6
	d407p7ShfR2HkOqm605maO3X4ZOXb5TrFChSAAs0VOmxoGG8ed1O/Rm5kqlYDjSEXcPIzHOoZ0Q
	Ukm6n090ha7tbWddo8XZ9ELJg3BNlJMf/fefEVT8G1l2A2CNF0t8iRq5BySWeaoFRiwe9+MSAvy
	1HYI74GdVF
X-Gm-Gg: ASbGncv1wC2GUZWNju7kM9EbXF5NuOcIZD77KQiRvrp/YECQYdA9L0LnttCgOShqndz
	Ockrs3Hxe89ipCEKA1BIyU0STmQPA+9H1hcA+I1EoQ+fvCInlKdvAiMoZAa+WZTasxPq4C61Lcx
	SyhKijv0kkHWhIf6QQNq5+MnObrfzmHKn8mZQW44ZOUyFecAe1R5SN8mN4/sfglX0sxw65u277q
	OsRsEG3trBaMENfnbTaqgSn6jWvOxk6noauVvpa5vloMFb+U9rux4uLEB/kZtN7fId759j8v0en
	hr4Y1NWhh1yJ1wnDH/p6OsZaf2H+C+wI8J32s/oOjur6m88Ehc59VXv1Oz3iNHqd4wxtKaVSMLl
	m0ESZXz4mNOoXwaMP7K0Ne51aqM6bgBc9QLL7JWaD
X-Received: by 2002:a05:6a20:1585:b0:34f:7454:b977 with SMTP id adf61e73a8af0-3613e9705b3mr345798637.48.1763595239492;
        Wed, 19 Nov 2025 15:33:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/Pw1tthT8QxVPNeNVAoaI9yGeMlngF7RJqrA8McaujM/cUOsaUYOX4Rcu5p9EcAYIT++29w==
X-Received: by 2002:a05:6a20:1585:b0:34f:7454:b977 with SMTP id adf61e73a8af0-3613e9705b3mr345761637.48.1763595238901;
        Wed, 19 Nov 2025 15:33:58 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f155f6e7sm475166b3a.63.2025.11.19.15.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 15:33:58 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/74] Scarthgap pull request
Date: Thu, 20 Nov 2025 05:03:50 +0530
Message-ID: <cover.1763595040.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IZVSBwiyDjS7bRTnMXVn4k31sP7pr2d_
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=691e53e8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8
 a=l8F31PViw6Xrj59VTakA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE4NCBTYWx0ZWRfX3K2ccCMNRa4I
 CurQacuQNwL3Eauu8EdklI+s0agN4QiOahVDaE03ICsBCf/mzMuids5cl6MKeewe/MXf7crBD6t
 O9ixk1n3e2hdvE4ts1dp22Q7tE44pKcRhMF6z/tvNrZjYn8MdiOmbcarOYzDnBDCaj6JIYPalIr
 jn0vGs7fC8/uR97pd+HmgxS6lzF3UKQjU02wkzM/GeshXoG8gDaslTaAc4Qrhbquo/P+mgkQK3m
 8cUYRNdSaMymFB4ziYPC2D/oux9UCKYO60A/pfVddQLyDKeD8ftSrp4VmqxE0pKc/pPCoEVvR1a
 /3pwFoVEjORguGaiTZDLnx9kvmEnwI3jOtWenc4r61eOk1xJ4hnEu8YmxRaFwKE0q/Qg3hJOh+s
 fLIT3gtxOS1VB/cOJmMwNiemkt5gPg==
X-Proofpoint-ORIG-GUID: IZVSBwiyDjS7bRTnMXVn4k31sP7pr2d_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_07,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190184
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 23:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121918

Please merge these changes in scarthgap. Tested on AB and locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1098

The following changes since commit f1f248262d662315159ee96c604f97415d1dbe6a:

  cockpit: remove deprecated packages (2025-11-12 11:38:29 +0530)

are available in the Git repository at:

  https://github.com/anujm1/meta-openembedded anujm/scarthgap
  https://github.com/anujm1/meta-openembedded/tree/anujm/scarthgap

Ankur Tyagi (10):
  tbb: upgrade 2021.11.0 -> 2021.12.0
  jasper: upgrade 4.1.1 -> 4.1.2
  libspiro: upgrade 20221101 -> 20230902
  redis-plus-plus: upgrade 1.3.11 -> 1.3.12
  redis: upgrade 7.2.11 -> 7.2.12
  redis: upgrade 6.2.20 -> 6.2.21
  botan: patch CVE-2024-34703
  botan: patch CVE-2024-50382 and CVE-2024-50383
  freerdp3: patch CVE-2025-4478
  hdf5: patch CVE-2025-2926

Anuj Mittal (1):
  remmina: add DEPENDS on curl

Armin Kuster (1):
  audit: fix build when systemd is enabled.

Bartosz Golaszewski (2):
  libgpiod: update to v1.6.5
  libgpiod: update v2.1.2 -> v2.1.3

Ethan Roderick (1):
  openldap: make license match spdx identifier

Gyorgy Sarvari (17):
  audiofile: patch CVE-2019-13147 and CVE-2022-24599
  audiofile: patch CVE-2018-13440 and CVE-2018-17059
  linuxptp: ignore CVE-2024-42861
  rsyslog: set status for CVE-2015-3243
  apache2: ignore CVE-2025-3891
  webmin: patch CVE-2017-15644, CVE-2017-15645 and CVE-2017-15646
  webmin: patch CVE-2017-17089
  webmin: patch CVE-2019-15642
  webmin: patch CVE-2022-0824
  webmin: patch CVE-2022-0829
  libwmf: add proper CVE tag to patch
  libwmf: add missing CVE tag to patch
  libwmf: patch CVE-2015-0848 and CVE-2015-4588
  libwmf: patch CVE-2015-4695
  libwmf: patch CVE-2015-4696
  libwmf: patch CVE-2016-9011
  iptraf-ng: patch CVE-2024-52949

J. S. (1):
  libhtml-tree-perl: fix QA Issue: TMPDIR [buildpaths]

Jason Schonberg (3):
  xrdp: upgrade 0.9.19 -> 0.9.20
  usbids: upgrade 2023.01.16 -> 2025.04.01
  usbids: upgrade 2025.04.01 -> 2025.09.15

Jiaying Song (1):
  minifi-cpp: fix python shebang in minifi-python

Khem Raj (3):
  libforms: Remove buildpaths from fd2ps and fdesign scripts
  libwmf: Fix buildpaths QA Errors in libwmf-config
  fvwm: Fix buildpaths QA Errors

Markus Volk (2):
  xdg-desktop-portal: update 1.18.1 -> 1.18.4
  flatpak;xdg-desktop-portal: add missing runtime dependency on
    fuse3-utils

Michael Wyraz (3):
  python3-passlib: add native support
  python3-transitions: add native support
  python3-passlib: add python3-misc as a depencency

Ninette Adhikari (1):
  redis: Update status for CVE-2022-3734

Peter Marko (4):
  audiofile: mark CVE-2020-18781 as patched
  proftpd: set status of CVE-2001-0027
  rtmpdump: mark CVE-2015-8270, CVE-2015-8271 and CVE-2015-8272 as fixed
  squid: patch CVE-2025-62168

Shinji Matsunaga (1):
  audit: Fix CVE_PRODUCT

Wang Mingyu (16):
  evtest: upgrade 1.35 -> 1.36
  xmlsec1: upgrade 1.3.4 -> 1.3.5
  openldap: upgrade 2.6.7 -> 2.6.8
  openldap: upgrade 2.6.9 -> 2.6.10
  mcelog: upgrade 198 -> 199
  mcelog: upgrade 199 -> 200
  libiodbc: upgrade 3.52.15 -> 3.52.16
  libbytesize: upgrade 2.10 -> 2.11
  libbpf: upgrade 1.4.0 -> 1.4.2
  libbpf: upgrade 1.4.2 -> 1.4.3
  libbpf: upgrade 1.4.3 -> 1.4.5
  libbpf: upgrade 1.4.5 -> 1.4.6
  openjpeg: upgrade 2.5.3 -> 2.5.4
  feh: upgrade 3.10.2 -> 3.10.3
  cryptsetup: upgrade 2.7.2 -> 2.7.3
  cryptsetup: upgrade 2.7.3 -> 2.7.4

Yi Zhao (4):
  openldap: upgrade 2.6.8 -> 2.6.9
  audit: upgrade 4.0.1 -> 4.0.2
  libbpf: upgrade 1.4.6 -> 1.4.7
  cryptsetup: upgrade 2.7.4 -> 2.7.5

Yoann Congal (2):
  klibc: fix debug pkgs reproducibility
  grilo: fix buildpaths QA error

alperak (1):
  pcp: Fix contains reference to TMPDIR [buildpaths] warnings

 .../recipes-gnome/grilo/grilo_0.3.16.bb       |  11 +-
 meta-initramfs/classes/klibc.bbclass          |   2 +-
 .../rtmpdump/rtmpdump_2.4.bb                  |   4 +
 .../recipes-daemons/proftpd/proftpd_1.3.7f.bb |   2 +
 .../squid/files/CVE-2025-62168.patch          | 211 +++++++++++++++++
 .../recipes-daemons/squid/squid_6.14.bb       |   1 +
 meta-oe/licenses/{OpenLDAP => OLDAP-2.8}      |   0
 .../linuxptp/linuxptp_4.1.bb                  |   2 +
 .../botan/botan/CVE-2024-34703.patch          |  38 +++
 .../CVE-2024-50382-and-CVE-2024-50383.patch   |  66 ++++++
 meta-oe/recipes-crypto/botan/botan_3.2.0.bb   |   5 +-
 ...ryptsetup_2.7.2.bb => cryptsetup_2.7.5.bb} |   2 +-
 .../iptraf/iptraf-ng/CVE-2024-52949.patch     | 218 ++++++++++++++++++
 .../iptraf/iptraf-ng_1.2.1.bb                 |   1 +
 .../flatpak/flatpak_1.15.8.bb                 |   1 +
 .../libwmf/CVE-2015-0848-CVE-2015-4588.patch  | 135 +++++++++++
 .../libwmf/libwmf/CVE-2015-4695.patch         |  70 ++++++
 .../libwmf/libwmf/CVE-2015-4696.patch         |  37 +++
 .../libwmf/libwmf/CVE-2016-9011.patch         |  50 ++++
 .../libwmf/libwmf-0.2.8.4-intoverflow.patch   |   2 +
 .../libwmf/libwmf-0.2.8.4-useafterfree.patch  |   2 +
 .../recipes-extended/libwmf/libwmf_0.2.8.4.bb |  10 +-
 .../minifi-cpp/minifi-cpp_0.15.0.bb           |   4 +
 ...us_1.3.11.bb => redis-plus-plus_1.3.12.bb} |   2 +-
 ...-hiredis-use-default-CC-if-it-is-set.patch |   6 +-
 ...ile-to-use-environment-build-setting.patch |   2 +-
 ...003-hack-to-force-use-of-libc-malloc.patch |  10 +-
 .../0004-src-Do-not-reset-FINAL_LIBS.patch    |  10 +-
 ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |   2 +-
 ...006-Define-correct-gregs-for-RISCV32.patch |   2 +-
 .../init-redis-server                         |   0
 .../{redis-7.2.11 => redis-7.2.12}/redis.conf |   0
 .../redis.service                             |   0
 .../{redis_6.2.20.bb => redis_6.2.21.bb}      |   2 +-
 .../{redis_7.2.11.bb => redis_7.2.12.bb}      |   5 +-
 .../rsyslog/rsyslog/rsyslog.conf              |   3 +-
 .../rsyslog/rsyslog_8.2402.0.bb               |   2 +
 .../feh/{feh_3.10.2.bb => feh_3.10.3.bb}      |   2 +-
 ...spiro_20221101.bb => libspiro_20240902.bb} |   2 +-
 meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb   |   3 +
 .../{jasper_4.1.1.bb => jasper_4.1.2.bb}      |   2 +-
 .../libforms/libforms_1.2.5pre1.bb            |   5 +
 .../openjpeg/openjpeg/CVE-2025-54874.patch    |  44 ----
 .../{openjpeg_2.5.3.bb => openjpeg_2.5.4.bb}  |   3 +-
 .../{libbpf_1.4.0.bb => libbpf_1.4.7.bb}      |   4 +-
 .../audiofile/audiofile_0.3.6.bb              |   4 +
 ...ays-check-the-number-of-coefficients.patch |   1 +
 .../audiofile/files/CVE-2018-13440.patch      |  36 +++
 .../audiofile/files/CVE-2018-17059.patch      |  35 +++
 .../audiofile/files/CVE-2019-13147.patch      |  31 +++
 .../audiofile/files/CVE-2022-24599.patch      |  50 ++++
 ...ute_malloc__-with-__attribute__-__ma.patch |  49 ----
 .../audit/{audit_4.0.1.bb => audit_4.0.2.bb}  |  12 +-
 .../freerdp/freerdp3/CVE-2025-4478.patch      |  60 +++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |   1 +
 .../hdf5/files/CVE-2025-2926.patch            |  32 +++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
 ...ibbytesize_2.10.bb => libbytesize_2.11.bb} |   2 +-
 ...ts-set-direction-when-reconfiguring-.patch |  38 ---
 .../{libgpiod_1.6.4.bb => libgpiod_1.6.5.bb}  |   2 +-
 .../{libgpiod_2.1.2.bb => libgpiod_2.1.3.bb}  |   4 +-
 ...ibiodbc_3.52.15.bb => libiodbc_3.52.16.bb} |   4 +-
 .../mcelog/{mcelog_198.bb => mcelog_200.bb}   |  11 +-
 .../{openldap_2.6.7.bb => openldap_2.6.10.bb} |  10 +-
 meta-oe/recipes-support/pcp/pcp_6.0.5.bb      |   4 +
 .../recipes-support/remmina/remmina_1.4.34.bb |   1 +
 ...suppress-new-GCC-12-13-warnings-1192.patch |  57 -----
 ....cmake-remove-cross-compiation-check.patch |  33 ---
 .../{tbb_2021.11.0.bb => tbb_2021.12.0.bb}    |   8 +-
 ...ids_2023.01.16.bb => usbids_2025.09.15.bb} |   3 +-
 ...1.18.1.bb => xdg-desktop-portal_1.18.4.bb} |   6 +-
 .../0001-nss-nspr-fix-for-multilib.patch      |   7 +-
 .../xmlsec1/change-finding-path-of-nss.patch  |   7 +-
 .../{xmlsec1_1.3.4.bb => xmlsec1_1.3.5.bb}    |   2 +-
 ...guished_name-in-etc-xrdp-openssl.con.patch |   7 +-
 .../xrdp/0001-Fix-the-compile-error.patch     |  12 +-
 ...1-arch-Define-NO_NEED_ALIGN-on-ppc64.patch |   9 +-
 ...001-mark-count-with-unused-attribute.patch |   9 +-
 .../xrdp/{xrdp_0.9.19.bb => xrdp_0.9.20.bb}   |   2 +-
 ...ld-on-32bit-arches-with-64bit-time_t.patch |   7 +-
 .../evtest/{evtest_1.35.bb => evtest_1.36.bb} |   2 +-
 .../libhtml/libhtml-tree-perl_5.03.bb         |   7 +
 .../python/python3-passlib_1.7.4.bb           |   3 +
 .../python/python3-transitions_0.9.0.bb       |   2 +
 .../recipes-httpd/apache2/apache2_2.4.65.bb   |   1 +
 ...issions-check-when-saving-allowed-cr.patch |  25 ++
 ...e-potentially-malicious-HTTP-headers.patch |  53 +++++
 ...0001-Foreign-module-may-need-a-check.patch |  27 +++
 ...0001-HTML-escape-command-description.patch |  29 +++
 ...es-cannot-contact-special-characters.patch |  26 +++
 .../recipes-webadmin/webmin/webmin_1.850.bb   |   7 +-
 91 files changed, 1403 insertions(+), 321 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch
 rename meta-oe/licenses/{OpenLDAP => OLDAP-2.8} (100%)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2024-34703.patch
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2024-50382-and-CVE-2024-50383.patch
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.7.2.bb => cryptsetup_2.7.5.bb} (98%)
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng/CVE-2024-52949.patch
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-0848-CVE-2015-4588.patch
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.11.bb => redis-plus-plus_1.3.12.bb} (95%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0001-hiredis-use-default-CC-if-it-is-set.patch (89%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (97%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0003-hack-to-force-use-of-libc-malloc.patch (81%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0004-src-Do-not-reset-FINAL_LIBS.patch (74%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (92%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0006-Define-correct-gregs-for-RISCV32.patch (97%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_6.2.20.bb => redis_6.2.21.bb} (96%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.11.bb => redis_7.2.12.bb} (93%)
 rename meta-oe/recipes-graphics/feh/{feh_3.10.2.bb => feh_3.10.3.bb} (88%)
 rename meta-oe/recipes-graphics/fontforge/{libspiro_20221101.bb => libspiro_20240902.bb} (85%)
 rename meta-oe/recipes-graphics/jasper/{jasper_4.1.1.bb => jasper_4.1.2.bb} (95%)
 delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.3.bb => openjpeg_2.5.4.bb} (86%)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.0.bb => libbpf_1.4.7.bb} (92%)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2018-13440.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2018-17059.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2019-13147.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2022-24599.patch
 delete mode 100644 meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
 rename meta-oe/recipes-security/audit/{audit_4.0.1.bb => audit_4.0.2.bb} (90%)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-4478.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2926.patch
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.10.bb => libbytesize_2.11.bb} (93%)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.6.4.bb => libgpiod_1.6.5.bb} (94%)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.1.2.bb => libgpiod_2.1.3.bb} (87%)
 rename meta-oe/recipes-support/libiodbc/{libiodbc_3.52.15.bb => libiodbc_3.52.16.bb} (82%)
 rename meta-oe/recipes-support/mcelog/{mcelog_198.bb => mcelog_200.bb} (79%)
 rename meta-oe/recipes-support/openldap/{openldap_2.6.7.bb => openldap_2.6.10.bb} (96%)
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch
 rename meta-oe/recipes-support/tbb/{tbb_2021.11.0.bb => tbb_2021.12.0.bb} (92%)
 rename meta-oe/recipes-support/usbids/{usbids_2023.01.16.bb => usbids_2025.09.15.bb} (84%)
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.18.1.bb => xdg-desktop-portal_1.18.4.bb} (88%)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.4.bb => xmlsec1_1.3.5.bb} (96%)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.19.bb => xrdp_0.9.20.bb} (97%)
 rename meta-oe/recipes-test/evtest/{evtest_1.35.bb => evtest_1.36.bb} (90%)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Add-missing-permissions-check-when-saving-allowed-cr.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Escape-potentially-malicious-HTTP-headers.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Foreign-module-may-need-a-check.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-HTML-escape-command-description.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Object-names-cannot-contact-special-characters.patch

-- 
2.51.2



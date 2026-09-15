Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61B7C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 06:09:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17175.1789452580532423224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 23:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=f83JrEwM;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LUPNjKpM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nR0U2623199
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 06:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4/djwG8bgdkrarysIeAbIk3eaGCaoHcTaSg
	i/oXhVQM=; b=f83JrEwM3E2nmLPiAJo7ltT1AnNzSc4U/S1dG8w4yyyT8Pk8M6O
	wr914mrB/mVfoU/QF/LKHG8DoiA3GWie6ZL1HEKLQnq85ZjstnFVhG9a0amfffeK
	zRhBsSddYqY0cWREYAYVh/feog0S2iP16ntxE3myf2K6Vw0kLhQ1tt48+e+Y8c3w
	hElriZ4AdMUeZEYIFwPhd6hlDKOAb6ACmHW74OepWldeRmKN5pN7jhYeSuYnuSMi
	yd06j544vnvQgY7xjIKZsME5d3203ZnOYdHoCuwzbPvNrp8y7SvE8m4NaKhb6UDl
	5TelxCOdw1UJsqehFYc+YohLzfWMB7M+sYQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9tqqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 06:09:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so3386542a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 23:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789452578; x=1790057378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/djwG8bgdkrarysIeAbIk3eaGCaoHcTaSgi/oXhVQM=;
        b=LUPNjKpMIQVGKvCD1pHD0CXe6PfXiWR7F4a7+RHp6bZS16YI287YICbaWHR9glk/U/
         isTkSFveQE+s0fLg6SEGSPrCW8T/QHjqkX32qecq2Tpslwl/PVK1bH3zOr6SBAsuUlek
         WjhpSHrentYjtj1IObR5GipQU+oMCBkDAnOtRPx17nNM8nmjxNR3ly5b2sXB4lyhJr+k
         25tKufu7qdZ8XyfhLvX3o0wksfsSWk/kE8VEKKyk8RwtMhc4649cP+wajgWHBaMVd7+8
         SfF6/Welx/em6Qmkd+qRt+wZRIdsz9/NEMjh5ixmnglMuLKl36ICJToqoebjxt6sKrM+
         M3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452578; x=1790057378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4/djwG8bgdkrarysIeAbIk3eaGCaoHcTaSgi/oXhVQM=;
        b=gpQDKq9Y/Ts8r0x2IsECfGo648ivoijvGCYqPfRtovLq79cOcjCARA7ByL2CeJAs56
         EtJnyFuW99rgs6mLSGOCvrb0T7uqPOWRztzeJ2D5109aCrB5e7mL06cyZz/0MNCvXR0o
         YOMxw4bp+GDzDk5TY4Yvl4PDs55XLyoCrSag+I0+nXXks37DAWhjIoAojI/bJvT+MVYn
         nsJMhkXnPWHq22Fvqtq6jN5WBZSXg3i1/CiG/mzlzlEAxOaTl6eArix79dMdKUuIH3Kl
         8DPvqLG/wbxXoWKvE+97KKqhrAg/aIDdYdptsR1TA4oi+mMXHHlJQ3B/Piz1JRvTk+48
         jn/Q==
X-Gm-Message-State: AFuF++mzyeQW/0ieu2Ief3zkIK6/ace1kq32U9+unNWsmqN+YknVBogw
	NYFSU+7yIKdopyfsGoH0AfmYEBWNILbhZhdlGk/s3VRT36MBBO3zrPzAFLV5u82AA/SHvu8OGJ3
	FpiGyLJAUbu43IX7OJ7oR7j6/p3/j2XwE2IdHH2SkTHsL+9hw4i27y4eYHR/5tRHd1RpIgCFzKp
	QQcXrvMIa2gvho9b5LGD8=
X-Gm-Gg: AYBFou0NCb6aOfeGR+9EpilWa84lGRMjLozm+KXHPufqQlfVfRTZUszaYEFSOTigzY1
	Fj3oxpn145FRMb3zTyOTpfBpVinMLRFbcWXSQmFNAGMMjCuRQP3vTFC4qbmYIeZjHOrrqt5jNIX
	H6YdwsGy6D+b4eaqAvqTo/F8jmTGy7CB4w9gvx1EXNBrgkHdWZCy5OYJ+MtC0miYj0KqcFZ35O1
	pHnljhKA2loL4wCJWkLjl3AIFDkUdcq+qGvbHyY/UGwQzakeGCrgbjN3g58VKwEDhDWFhEBURQG
	j9hAF2zDTbB3qIlBeTtbM8dfA9PFLCPhclb3Jy1Ab18DO1/kpSILTA71y905mpxKnMAAA0sd6FZ
	9N8uyyou6W2NFTAxm88StnOyLzz9Qsio=
X-Received: by 2002:a05:6a20:2585:b0:3d7:b3c1:cc34 with SMTP id adf61e73a8af0-3db406b3628mr12108152637.26.1789452577688;
        Mon, 14 Sep 2026 23:09:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:2585:b0:3d7:b3c1:cc34 with SMTP id adf61e73a8af0-3db406b3628mr12108076637.26.1789452577081;
        Mon, 14 Sep 2026 23:09:37 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365bb6ba0sm28447183c88.15.2026.09.14.23.09.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:09:36 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 000/142] Wrynose pull request
Date: Tue, 15 Sep 2026 11:39:29 +0530
Message-ID: <cover.1789439085.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8e123 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=6OrrFN_7J_smZXNRCFoA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA4NiBTYWx0ZWRfX2BIhUVJCaZ34
 ACxV/sb8KU7xf3CQNg+MPkfXrkM4A4cUyOq3M/t5p9bn28o15KGqQbAG13ZsI04cEDGKfjV657Z
 hJceA8kOkJf4mG8liGUdgBR66+n21gb7WUxmO0tRTQEMRbOkFy9EH6sJKr1huBliyWLAEHYBnfQ
 JeEPdC8XbobWX5lPuGLwZJGE+005CpKRcbVgFYpnB0IpnObVCSoLnJF+y3dSjGs7qVYiULU/jFf
 5JKIX2Q+IqNXgc3G8dHj8gbgCuiRCIoICnbDa5mhL4+B+6K0rk3sXEmApn69Lp4wo92KuT07e9n
 0j2jQwbNZa0dCF2NGG5RUErAQGbL71eAhedpXKpXJnLoIJ/lE0vXLFRLxNh6NLdJiiTex+YZ0ma
 rHyOcobL70PHmc5W6jBjuWi9m6TXZdCauQMGB/BkPYrW5CwZ4v0haWswE2ASDrjnWbaOaH+dP/E
 QPyVJqlN/9X6a//TBkg==
X-Proofpoint-GUID: Mla2xgeKPdaGBCj6OpQVdKSfzXMSKLz2
X-Proofpoint-ORIG-GUID: Mla2xgeKPdaGBCj6OpQVdKSfzXMSKLz2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA4NiBTYWx0ZWRfX20NbypoVjyon
 C9SZHqLlFF6yNcRGJU3dFktbh1/Fy2gYRtbECDUbUKsIbbXtspKiE+kAvzJpiSpH3PKSntcNJ21
 l5YnftITxqUuOAbHDWqXx46t1BaxjsE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 06:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130034

Please merge these changes in wrynose. Tested on autobuilder and locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1803

The following changes since commit 14282a02be9c74a1276a7cda7d6c89e054699a11:

  libhtml-tree-perl, libmodule-build-tiny-perl: Drop obsolete TMPDIR scrubbing (2026-08-26 07:13:01 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/wrynose

for you to fetch changes up to 2d08f417301392ef61a7527448207db2eba09845:

  unbound: patch CVE-2026-56444 (2026-09-15 07:52:54 +0530)

----------------------------------------------------------------

Abhishek Bachiphale (3):
  thrift: fix CVE-2026-58662
  thrift: fix CVE-2026-48586
  thrift: fix CVE-2026-48145

Adarsh Jagadish Kamini (4):
  thrift: fix CVE-2026-41608
  thrift: fix CVE-2026-45112
  thrift: fix CVE-2026-55969
  thrift: fix CVE-2026-55970

Ankur Tyagi (127):
  python3-django: upgrade 5.2.16 -> 5.2.17
  asyncmqtt: upgrade 10.3.0 -> 10.3.1
  proftpd: upgrade 1.3.9c -> 1.3.9d
  capnproto: ignore CVE-2026-59704
  bubblewrap: mark CVE-2026-41163 patched
  bcc: mark CVE-2024-2314 patched
  cockpit: mark CVE-2024-2947 patched
  dool: patch CVE-2026-56651
  dool: patch CVE-2026-56652
  dovecot: ignore already fixed CVEs
  editorconfig-core-c: ignore CVE-2024-53849
  editorconfig-core-c: patch CVE-2026-40489
  civetweb: ignore CVE-2026-5789
  eject: ignore CVE-2026-28065
  firewalld: patch CVE-2026-4948
  freeipmi: patch CVE-2026-50031
  haveged: ignore CVE-2026-41054
  gpm: ignore CVE-2025-4558
  gpsd: patch CVE-2026-58459
  gerbera: ignore CVE-2025-23386
  hostapd: patch CVE-2026-58374
  hdf5: patch CVE-2026-17572
  hdf5: patch CVE-2026-17573
  hdf5: patch CVE-2026-17574
  hdf5: patch CVE-2026-19025
  iftop: ignore CVE-2026-3824, CVE-2026-3825 and CVE-2026-3826
  iniparser: mark CVE-2025-0633 pached
  jq: ignore CVE-2025-49014
  lcms: patch CVE-2026-42798
  libde265: mark CVE-2026-45382 and CVE-2026-45383 patched
  libde265: patch CVE-2026-49295
  libde265: patch CVE-2026-49337
  libde265: patch CVE-2026-49346
  libfido2, libfido2-initial: ignore CVE-2026-40947
  libheif: patch CVE-2026-32738
  libheif: patch CVE-2026-32739
  libheif: patch CVE-2026-32740
  libheif: patch CVE-2026-32741
  libheif: patch CVE-2026-41071
  libheif: patch CVE-2026-62289
  libheif: patch CVE-2026-62377
  libiec61850: mark CVE-2024-45969 patched
  libiec61850: patch CVE-2026-18582
  libiec61850: patch CVE-2026-18583
  libiec61850: patch CVE-2026-19108
  libiec61850: patch CVE-2026-19206
  libkcapi: patch CVE-2026-71226
  libkcapi: patch CVE-2026-71227
  libkcapi: patch CVE-2026-71225
  libnfs: patch CVE-2026-53689
  libnfs: patch CVE-2026-57918
  libssh: ignore CVE-2025-14821
  libssh: mark CVEs patched
  miniupnpd: patch CVE-2026-5720
  python3-zeroconf: patch CVE-2026-47180
  python3-zeroconf: patch CVE-2026-47183
  python3-zeroconf: patch CVE-2026-47184
  valkey: mark CVE-2026-56684 and CVE-2026-63639 patched
  libyang: patch CVE-2026-41401
  tinyproxy: patch CVE-2026-31842
  tinyproxy: patch CVE-2026-54387
  tinyproxy: patch CVE-2026-55202
  nginx: mark CVE-2026-1642 patched
  open62541: patch CVE-2026-11946
  tesseract: patch CVE-2026-73066
  tesseract: patch CVE-2026-73067
  wolfssl: mark CVEs patched
  wolfssl: patch CVE-2026-10098
  wolfssl: patch CVE-2026-10512
  wolfssl: ignore CVE-2026-12340
  wolfssl: patch CVE-2026-55958
  wolfssl: patch CVE-2026-6091
  wolfssl: patch CVE-2026-6092
  wolfssl: patch CVE-2026-6094
  wolfssl: patch CVE-2026-6291
  wolfssl: patch CVE-2026-6325
  wolfssl: patch CVE-2026-6412
  wolfssl: patch CVE-2026-6450
  wolfssl: patch CVE-2026-6731
  wolfssl: patch CVE-2026-7531
  freerdp3: patch CVE-2026-40254
  freerdp3: patch CVE-2026-55191
  freerdp3: patch CVE-2026-55192
  freerdp3: patch CVE-2026-55193
  freerdp3: patch CVE-2026-55194
  freerdp3: patch CVE-2026-55564
  freerdp3: patch CVE-2026-55648
  freerdp3: patch CVE-2026-63633
  freerdp3: patch CVE-2026-63652
  freerdp3: patch CVE-2026-64620
  freerdp3: patch CVE-2026-64621
  freerdp3: patch CVE-2026-66401
  freerdp3: patch CVE-2026-67288
  python3-gunicorn: mark CVE-2024-1135 patched
  python3-h11: mark CVE-2025-43859 patched
  zabbix: ignore multiple CVEs
  unbound: patch CVE-2026-33278
  unbound: patch CVE-2026-42944
  unbound: patch CVE-2026-42959
  unbound: patch CVE-2026-32792
  unbound: patch CVE-2026-40622
  unbound: patch CVE-2026-41292
  unbound: patch CVE-2026-42534
  unbound: patch CVE-2026-42923
  unbound: patch CVE-2026-42960
  unbound: patch CVE-2026-44390
  unbound: patch CVE-2026-44608
  unbound: patch CVE-2026-46582
  unbound: patch CVE-2026-32665
  unbound: patch CVE-2026-42955
  unbound: patch CVE-2026-44621
  unbound: patch CVE-2026-44687
  unbound: patch CVE-2026-50045
  unbound: patch CVE-2026-50046
  unbound: patch CVE-2026-50243
  unbound: patch CVE-2026-50248
  unbound: patch CVE-2026-50251
  unbound: patch CVE-2026-50252
  unbound: patch CVE-2026-52863
  unbound: patch CVE-2026-54478
  unbound: patch CVE-2026-55708
  unbound: patch CVE-2026-55717
  unbound: patch CVE-2026-55973
  unbound: patch CVE-2026-55990
  unbound: patch CVE-2026-55991
  unbound: patch CVE-2026-56416
  unbound: patch CVE-2026-56444

Deepak Rathore (1):
  rsyslog: Fix CVE-2026-19654

Devansh Patel (1):
  python3-cbor2: use exact CVE_PRODUCT mapping

Himanshu Jadon (3):
  suitesparse: fix CMake 4 configure failure
  suitesparse: avoid install rpath buildpaths QA
  samba, libldb: add package conflicts

Jason Schonberg (1):
  php: upgrade 8.5.9 -> 8.5.10

Joel Winarske (1):
  capnproto: build position independent code

Omkar Patil (1):
  postgresql: upgrade 17.10 -> 17.11

 .../gerbera/gerbera_3.0.0.bb                  |    2 +
 .../libde265/libde265/CVE-2026-49295.patch    |   41 +
 .../libde265/libde265/CVE-2026-49337.patch    |   53 +
 .../libde265/libde265/CVE-2026-49346.patch    |  102 +
 .../libde265/libde265_1.0.19.bb               |    9 +-
 .../libheif/libheif/CVE-2026-32738.patch      |   32 +
 .../libheif/libheif/CVE-2026-32739.patch      |   54 +
 .../libheif/libheif/CVE-2026-32740.patch      |   40 +
 .../libheif/libheif/CVE-2026-32741.patch      |   29 +
 .../libheif/libheif/CVE-2026-41071-1.patch    |   34 +
 .../libheif/libheif/CVE-2026-41071-2.patch    |   44 +
 .../libheif/libheif/CVE-2026-62289.patch      |  189 ++
 .../libheif/libheif/CVE-2026-62377.patch      |  175 +
 .../libheif/libheif_1.21.2.bb                 |    8 +
 .../firewalld/files/CVE-2026-4948.patch       |   38 +
 .../firewalld/firewalld_2.2.3.bb              |    1 +
 .../civetweb/civetweb_1.16.bb                 |    1 +
 .../libiec61850/files/CVE-2026-18582.patch    |   51 +
 .../libiec61850/files/CVE-2026-18583.patch    |   35 +
 .../libiec61850/files/CVE-2026-19108.patch    |  208 ++
 .../libiec61850/files/CVE-2026-19206-1.patch  |  129 +
 .../libiec61850/files/CVE-2026-19206-2.patch  |  134 +
 .../libiec61850/files/CVE-2026-19206-3.patch  |  115 +
 .../libiec61850/libiec61850_1.6.1.bb          |    8 +
 .../miniupnpd/files/CVE-2026-5720.patch       |   35 +
 .../miniupnpd/miniupnpd_2.1.20191006.bb       |    1 +
 .../samba/samba_4.23.11.bb                    |    3 +
 .../wolfssl/files/CVE-2026-10098-1.patch      |  368 ++
 .../wolfssl/files/CVE-2026-10098-2.patch      |  126 +
 .../wolfssl/files/CVE-2026-10512.patch        |  182 +
 .../wolfssl/files/CVE-2026-55958.patch        |   36 +
 .../wolfssl/files/CVE-2026-6091-1.patch       |  295 ++
 .../wolfssl/files/CVE-2026-6091-2.patch       |   30 +
 .../wolfssl/files/CVE-2026-6091-3.patch       |   36 +
 .../wolfssl/files/CVE-2026-6092.patch         |  163 +
 .../wolfssl/files/CVE-2026-6094-1.patch       |   32 +
 .../wolfssl/files/CVE-2026-6094-2.patch       |   35 +
 .../wolfssl/files/CVE-2026-6094-3.patch       |   39 +
 .../wolfssl/files/CVE-2026-6094-4.patch       |   36 +
 .../wolfssl/files/CVE-2026-6094-5.patch       |   73 +
 .../wolfssl/files/CVE-2026-6291.patch         | 2948 +++++++++++++++++
 .../wolfssl/files/CVE-2026-6325.patch         |  123 +
 .../wolfssl/files/CVE-2026-6412-1.patch       |  159 +
 .../wolfssl/files/CVE-2026-6412-2.patch       |   56 +
 .../wolfssl/files/CVE-2026-6450-1.patch       |  456 +++
 .../wolfssl/files/CVE-2026-6450-2.patch       |  404 +++
 .../wolfssl/files/CVE-2026-6731-1.patch       |   39 +
 .../wolfssl/files/CVE-2026-6731-2.patch       |  171 +
 .../wolfssl/files/CVE-2026-7531.patch         |  180 +
 .../wolfssl/wolfssl_5.9.1.bb                  |   25 +
 .../{proftpd_1.3.9c.bb => proftpd_1.3.9d.bb}  |    2 +-
 .../opcua/open62541/CVE-2026-11946.patch      |   48 +
 .../opcua/open62541_1.4.16.bb                 |    1 +
 .../recipes-support/dovecot/dovecot_2.4.4.bb  |    8 +
 .../recipes-support/iftop/iftop_1.0pre4.bb    |    3 +
 .../recipes-support/libldb/libldb_2.8.2.bb    |    2 +
 .../tinyproxy/tinyproxy/CVE-2026-31842.patch  |   33 +
 .../tinyproxy/tinyproxy/CVE-2026-54387.patch  |   37 +
 .../tinyproxy/tinyproxy/CVE-2026-55202.patch  |  107 +
 .../tinyproxy/tinyproxy_1.11.3.bb             |    3 +
 .../unbound/unbound/CVE-2026-32665.patch      |  119 +
 .../unbound/unbound/CVE-2026-32792.patch      |   31 +
 .../unbound/unbound/CVE-2026-33278.patch      |  296 ++
 .../unbound/unbound/CVE-2026-40622.patch      |   58 +
 .../unbound/unbound/CVE-2026-41292.patch      |   83 +
 .../unbound/unbound/CVE-2026-42534.patch      |   70 +
 .../unbound/unbound/CVE-2026-42923.patch      |  114 +
 .../unbound/unbound/CVE-2026-42944-1.patch    |   61 +
 .../unbound/unbound/CVE-2026-42944-2.patch    |  231 ++
 .../unbound/unbound/CVE-2026-42955.patch      |   98 +
 .../unbound/unbound/CVE-2026-42959.patch      |   36 +
 .../unbound/unbound/CVE-2026-42960.patch      |   38 +
 .../unbound/unbound/CVE-2026-44390.patch      |   37 +
 .../unbound/unbound/CVE-2026-44608.patch      |   59 +
 .../unbound/unbound/CVE-2026-44621.patch      |   98 +
 .../unbound/unbound/CVE-2026-44687.patch      |   31 +
 .../unbound/unbound/CVE-2026-46582.patch      |  151 +
 .../unbound/unbound/CVE-2026-50045.patch      |  278 ++
 .../unbound/unbound/CVE-2026-50046.patch      |   61 +
 .../unbound/unbound/CVE-2026-50243.patch      |   36 +
 .../unbound/unbound/CVE-2026-50248.patch      |   77 +
 .../unbound/unbound/CVE-2026-50251.patch      |   72 +
 .../unbound/unbound/CVE-2026-50252.patch      | 1294 ++++++++
 .../unbound/unbound/CVE-2026-52863.patch      |  132 +
 .../unbound/unbound/CVE-2026-54478.patch      |   38 +
 .../unbound/unbound/CVE-2026-55708.patch      |   51 +
 .../unbound/unbound/CVE-2026-55717.patch      |   90 +
 .../unbound/unbound/CVE-2026-55973.patch      |   47 +
 .../unbound/unbound/CVE-2026-55990.patch      |   59 +
 .../unbound/unbound/CVE-2026-55991.patch      |  112 +
 .../unbound/unbound/CVE-2026-56416.patch      |   68 +
 .../unbound/unbound/CVE-2026-56444.patch      |   51 +
 .../recipes-support/unbound/unbound_1.24.2.bb |   32 +
 .../recipes-devtools/bcc/bcc_0.36.1.bb        |    2 +
 ...syncmqtt_10.3.0.bb => asyncmqtt_10.3.1.bb} |    2 +-
 .../hostapd/hostapd/CVE-2026-58374-1.patch    |   49 +
 .../hostapd/hostapd/CVE-2026-58374-2.patch    |   43 +
 .../hostapd/hostapd_2.11.bb                   |    2 +
 .../libnfs/libnfs/CVE-2026-53689.patch        |   34 +
 .../libnfs/libnfs/CVE-2026-57918.patch        |   34 +
 .../libnfs/libnfs_6.0.2.bb                    |    2 +
 .../thrift/thrift/CVE-2026-41608.patch        |  176 +
 .../thrift/thrift/CVE-2026-45112.patch        |  306 ++
 .../thrift/thrift/CVE-2026-48145.patch        |  137 +
 .../thrift/thrift/CVE-2026-48586-01.patch     |  109 +
 .../thrift/thrift/CVE-2026-48586-02.patch     |   78 +
 .../thrift/thrift/CVE-2026-55969.patch        |  295 ++
 .../thrift/thrift/CVE-2026-55970.patch        |   67 +
 .../thrift/thrift/CVE-2026-58662.patch        |  120 +
 .../thrift/thrift_0.22.0.bb                   |    8 +
 .../zabbix/zabbix_7.0.24.bb                   |    8 +
 .../libkcapi/libkcapi/CVE-2026-71225.patch    |   38 +
 .../libkcapi/libkcapi/CVE-2026-71226-1.patch  |  604 ++++
 .../libkcapi/libkcapi/CVE-2026-71226-2.patch  |   55 +
 .../libkcapi/libkcapi/CVE-2026-71226-3.patch  |   93 +
 .../libkcapi/libkcapi/CVE-2026-71227.patch    |   40 +
 .../recipes-crypto/libkcapi/libkcapi_1.5.0.bb |    5 +
 ...c-bypass-autoconf-2.69-version-check.patch |    6 +-
 ...ostgresql_17.10.bb => postgresql_17.11.bb} |    2 +-
 .../capnproto/capnproto_1.4.0.bb              |   10 +
 .../editorconfig-core-c/CVE-2026-40489.patch  |   39 +
 .../editorconfig-core-c_0.12.9.bb             |    6 +-
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |    2 +
 .../php/{php_8.5.9.bb => php_8.5.10.bb}       |    2 +-
 .../0004-Allow-build-with-CMake-4.patch       |   86 +
 ...dd-install-rpath-to-shared-libraries.patch |   37 +
 .../suitesparse/suitesparse_5.10.1.bb         |    2 +
 .../haveged/haveged_1.9.23.bb                 |    2 +
 .../libyang/libyang/CVE-2026-41401.patch      |   43 +
 .../libyang/libyang_3.13.6.bb                 |    1 +
 .../rsyslog/CVE-2026-19654-regression.patch   |   56 +
 .../rsyslog/rsyslog/CVE-2026-19654.patch      |   51 +
 .../rsyslog/rsyslog_8.2512.0.bb               |    2 +
 .../recipes-extended/valkey/valkey_9.0.5.bb   |    2 +
 .../tesseract/tesseract/CVE-2026-73066.patch  |  152 +
 .../tesseract/CVE-2026-73067-1.patch          |  423 +++
 .../tesseract/CVE-2026-73067-2.patch          |   96 +
 .../tesseract/tesseract_5.5.2.bb              |    6 +-
 .../gpsd/gpsd/CVE-2026-58459-1.patch          |   48 +
 .../gpsd/gpsd/CVE-2026-58459-2.patch          |   46 +
 .../gpsd/gpsd/CVE-2026-58459-3.patch          |   58 +
 .../recipes-navigation/gpsd/gpsd_3.27.5.bb    |    3 +
 .../bubblewrap/bubblewrap_0.11.2.bb           |    2 +
 .../dool/dool/CVE-2026-56651.patch            |   47 +
 .../dool/dool/CVE-2026-56652.patch            |   35 +
 meta-oe/recipes-support/dool/dool_1.3.8.bb    |    5 +-
 meta-oe/recipes-support/eject/eject_2.1.5.bb  |    2 +
 .../freeipmi/freeipmi/CVE-2026-50031-1.patch  |   33 +
 .../freeipmi/freeipmi/CVE-2026-50031-2.patch  |   33 +
 .../freeipmi/freeipmi_1.6.17.bb               |    5 +-
 .../freerdp/freerdp3/CVE-2026-40254-1.patch   |   46 +
 .../freerdp/freerdp3/CVE-2026-40254-2.patch   |   30 +
 .../freerdp/freerdp3/CVE-2026-55191.patch     |   47 +
 .../freerdp/freerdp3/CVE-2026-55192.patch     |   79 +
 .../freerdp/freerdp3/CVE-2026-55193.patch     |   37 +
 .../freerdp/freerdp3/CVE-2026-55194.patch     |   53 +
 .../freerdp/freerdp3/CVE-2026-55564.patch     |   28 +
 .../freerdp/freerdp3/CVE-2026-55648.patch     |   28 +
 .../freerdp/freerdp3/CVE-2026-63633.patch     |   28 +
 .../freerdp/freerdp3/CVE-2026-63652.patch     |   53 +
 .../freerdp/freerdp3/CVE-2026-64620.patch     |   37 +
 .../freerdp/freerdp3/CVE-2026-64621.patch     |   27 +
 .../freerdp/freerdp3/CVE-2026-66401.patch     |   86 +
 .../freerdp/freerdp3/CVE-2026-67288.patch     |   69 +
 .../freerdp/freerdp3_3.24.2.bb                |   17 +-
 meta-oe/recipes-support/gpm/gpm_git.bb        |    2 +
 .../hdf5/files/CVE-2026-17572.patch           |  253 ++
 .../hdf5/files/CVE-2026-17573.patch           |   53 +
 .../hdf5/files/CVE-2026-17574.patch           |   65 +
 .../hdf5/files/CVE-2026-19025.patch           |  112 +
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |    4 +
 .../iniparser/iniparser_4.2.6.bb              |    2 +
 .../lcms/lcms/CVE-2026-42798.patch            |   38 +
 meta-oe/recipes-support/lcms/lcms_2.18.bb     |    1 +
 .../libfido2/libfido2-initial_1.16.0.bb       |    2 +
 .../libfido2/libfido2_1.16.0.bb               |    2 +
 .../recipes-support/libssh/libssh_0.11.5.bb   |   11 +
 .../python/python3-cbor2_5.9.0.bb             |    2 +-
 ...project-lower-setuptools-requirement.patch |   28 +
 ...ngo_5.2.16.bb => python3-django_5.2.17.bb} |    5 +-
 .../python/python3-gunicorn_25.3.0.bb         |    2 +
 .../python/python3-h11_0.16.0.bb              |    2 +
 .../python3-zeroconf/CVE-2026-47180.patch     |  110 +
 .../python3-zeroconf/CVE-2026-47183.patch     |  401 +++
 .../python3-zeroconf/CVE-2026-47184.patch     |  558 ++++
 .../python/python3-zeroconf_0.148.0.bb        |    5 +
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |    1 +
 .../recipes-webadmin/cockpit/cockpit_352.bb   |    1 +
 188 files changed, 17895 insertions(+), 16 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32738.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32739.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32740.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32741.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-1.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-2.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62289.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62377.patch
 create mode 100644 meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/CVE-2026-4948.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18582.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18583.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19108.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-1.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-2.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-3.patch
 create mode 100644 meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-5720.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10512.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-55958.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-3.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6092.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-3.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-4.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-5.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6291.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6325.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6450-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6450-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-7531.patch
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9c.bb => proftpd_1.3.9d.bb} (99%)
 create mode 100644 meta-networking/recipes-protocols/opcua/open62541/CVE-2026-11946.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-55202.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-32665.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-32792.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-33278.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-40622.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-41292.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42534.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42923.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-1.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-2.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42955.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42959.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42960.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-44390.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-44608.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-44621.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-44687.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-46582.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-50045.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-50046.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-50243.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-50248.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-50251.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-50252.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-52863.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-54478.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-55708.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-55717.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-55973.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-55990.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-55991.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-56416.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-56444.patch
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.3.0.bb => asyncmqtt_10.3.1.bb} (87%)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-1.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-2.patch
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-41608.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-45112.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48145.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-01.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-02.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55970.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71225.patch
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71226-1.patch
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71226-2.patch
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71226-3.patch
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71227.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.10.bb => postgresql_17.11.bb} (87%)
 create mode 100644 meta-oe/recipes-devtools/editorconfig/editorconfig-core-c/CVE-2026-40489.patch
 rename meta-oe/recipes-devtools/php/{php_8.5.9.bb => php_8.5.10.bb} (99%)
 create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0004-Allow-build-with-CMake-4.patch
 create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0005-Do-not-add-install-rpath-to-shared-libraries.patch
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73066.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-1.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-2.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch
 create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56651.patch
 create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56652.patch
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-1.patch
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-2.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-1.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-2.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55191.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55192.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55193.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55194.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55564.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55648.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63633.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63652.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64620.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64621.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-66401.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-67288.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19025.patch
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-pyproject-lower-setuptools-requirement.patch
 rename meta-python/recipes-devtools/python/{python3-django_5.2.16.bb => python3-django_5.2.17.bb} (42%)
 create mode 100644 meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47180.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47183.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47184.patch

-- 
2.54.0



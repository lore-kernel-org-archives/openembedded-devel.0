Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47320FF885A
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 05:07:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.756.1777093622614275732
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2026 22:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=YRFzK0T7;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=c6Zzmsz1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3L3dL1729443
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2026 05:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qNEE9jXUtDhqjlI+MgsmCI
	HKv6KcaPYLnhRCKZaduuE=; b=YRFzK0T7NV2njhibW6xA6V7346bX8pedVPftMZ
	pc89kJHzClO7gXoWidSdb0HvmiK2AoouDguFlUNm5qBCH46pEIJFSmQZ3g6eLPSm
	X6nAZ4gAVDTpISAJAzKRshSJJ4DNCtz6o28n9nZkqrdQzqD+InxODZhODsUdopaV
	q6vsxxbaouj5lUVC0GenGh3DyYpGjw1/Y0yIq7JmWspbuhsN12gKcmBIkSnv3dt4
	oyNJAGzw46UWuLmV5ZDngF10KbxrCEmCUh3ya0xrQTjkLpdORzSMkicFx8N00Klr
	GCHJ0X3zmrXeRr5xx4IdPykzmhShzvX+VWOUBx8uw1npzWPw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx85qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2026 05:07:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f460260cfso8658831b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 22:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777093620; x=1777698420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qNEE9jXUtDhqjlI+MgsmCIHKv6KcaPYLnhRCKZaduuE=;
        b=c6Zzmsz1EwRTmYOUTt16HygXSmn2yJtIrkpTIhmkfvUnMP0dvSgwCf9xf4tGXKUida
         6VdDyydjJPtnAihI4l4Pv2V6wSW0OdSjNq9OQvsrWqXQof8+nnJH52sSTIYg8NA2gubm
         b5Y8ve5IDFs4bHdOv8YizeSiZg4dr3vu25Ygf9i+R33oyKIf4iATfnnAL8Vd8FQpyU/5
         OwgQvJfUaVq0v5fF/3VmZ3O5sVE7Ag4d+g8JItddKcp8PuJgk9CHLvhN0wHqoegnGvn8
         PxSoSiojv3I7dMeVS0uEs3tzgpgmbDIA8sFlYKHutPZbK/O69yZN+e/BiK7uaGDuxX2W
         qzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777093620; x=1777698420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNEE9jXUtDhqjlI+MgsmCIHKv6KcaPYLnhRCKZaduuE=;
        b=H1eMDES3N1n+UDpWu1UaZ/GvI1wtNlrmpuUEQD0bXp4L0+pstpyB5ate/1YuDS+9+U
         n8sbfji/BWbxo/quSXDPlCUQMnv4aCV2iq4UKv60UOS1wkeceuSM4OqX0KcF/Y31JVY8
         2COHoFRBIx2xXjZ4Fid/hLWqjcueecZX6BH8D7G4S4e7y1fpFV/H0OkJbZuJPSSKrNEC
         pf/MC1RqqSfvmVTiibGbm5Rncwx5s3MXnGh7HuAg1cEcxeRoO+FQTB7N9QGE9ld0guv4
         CmeuyaCZoYrmVY58JqHCRtZgozFd4q2xJTsWYl8T3ATgJwBD5+2WZ0XQl31Ivt1DK12v
         Gl0Q==
X-Gm-Message-State: AOJu0YzIshR/awfR8uAysu71x1aMjC6JoQFbTv1De2kGaCo0pQ1G/vUd
	FyRbg4yNWJ2+u9E513U7BXNxj7n6ER2TkXCzfrduSBdh1IKV0MsN5rDdOSm0WjHcp85AFNhtcul
	bz9oOJga3qzaU1EZ9JRuWTi2MBddamgyMNnBvp34/U4nK6xVpoqr2PQKHJp0gVTNEaeDBXmhhSv
	NYrKP1EUfFeuvhcxszzKY=
X-Gm-Gg: AeBDietlVoI3hd4iHK1CPpfMZA8g9fiQ53/R03sOoIuexzDsizschvpwxwjY2TDLLaK
	tfV8Zt1LFUP/rApJ/ZuJ5VCg6UW30/g7ts64VwUqDsBy5egBke9KAYmiK9t47shFCgj1uG/nvhY
	MrhsWtUnH+G0rdqXmwoJeOWGjDofb3666z6SQINvg7Mp6oTrRDztFMbFKmku0YRxYJytQihCyN9
	3Fo/GNnL1W/jHUHGG5GDP31zyDekxdsEUuUOze97bvkCxe3ogqIDZnwrnkrAJlnrbH3ooxFlUvc
	AC+bRDwBQNpCMlRO392QqVxZDKgp/V449u+MtZmzfzpERAuq9bdOyY7WLW8dYf+/nm4eozpcBiL
	2L0rZcCnjlmooQwL4JBHdur907TphVy6DZuSgVSbMqSj5o0jf/2ergH/zvWN6JgQ=
X-Received: by 2002:a05:6a00:2889:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-82f8c7db2bemr37141788b3a.5.1777093620066;
        Fri, 24 Apr 2026 22:07:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:2889:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-82f8c7db2bemr37141755b3a.5.1777093619304;
        Fri, 24 Apr 2026 22:06:59 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm31686336b3a.38.2026.04.24.22.06.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 22:06:58 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/75] Whinlatter pull request
Date: Sat, 25 Apr 2026 10:36:45 +0530
Message-ID: <cover.1777043268.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-GUID: uhzWB7Xv2-fMatBHbRwqc3M20pFv1sNY
X-Proofpoint-ORIG-GUID: uhzWB7Xv2-fMatBHbRwqc3M20pFv1sNY
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ec4bf5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=hYXWXrUy1Gg7xAQmtjcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA0NyBTYWx0ZWRfX4GPOA/8R4Wko
 BJUGUI4WzF6dI1MMD84gTVt/V8/1TPtEGWBX9crbIFhlBAceKREnudNZGD9ZGFSk2zYIZwtfNGG
 ghiCvzvz6Korp0TGMq4jIyppBO3XA8DHWMK1VlDbUFHpNSoMKVj6B6VtRh/LUwt5KXBbB+ZYdwg
 fAgH/IwwHYHFchM0s1M5kCEhxELbWvSxDpzvUlQ4GD5DQMfzF04rTSyTY+1zT+ZDN3QlKaUtqFF
 cP0jFaUEVqCPboKaly1ZeYeSCvGURV7WX6cDruS22rl9YLaMKTMTVu365luWKislkUbVVu6gkS5
 92BDI7ShSC659Gsar5O6b0Ko9/BS35CIlQ36MaM73nFLWGSdhCpLrFcsYeKM34MZLtwzIbkVoYj
 ym14dS/YOMQDPDvH8NB4vGVvdz2VPOtkjJ/rGIlGusTgz1ZhLDZs72O9SV95bJIjHp/vg14KWfv
 fGx2SEBVsyy+yqqo7uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250047
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 63P3L3dL1729443
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2026 05:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126611

Please merge these changes in whinlatter. Tested on autobuilder and local=
ly.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1503

The following changes since commit 8bcdb0cc1dab116253b409e78fb868ced7d839=
7c:

  bluealsa: fix QA issue staticdev (2026-03-26 10:31:48 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/whinlatte=
r-next
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/=
whinlatter-next

for you to fetch changes up to bf300f9b6c90c130b2d0e84303153df7c0d68852:

  lshw: Fix binmerge (2026-04-23 10:53:58 +0530)

----------------------------------------------------------------

Ankur Tyagi (17):
  nginx: upgrade 1.29.1 -> 1.29.2
  python3-astroid: upgrade 4.0.2 -> 4.0.4
  python3-aiofiles: fix HOMEPAGE
  python3-alembic: add HOMEPAGE
  python3-apiflash: upgrade 3.0.0 -> 3.0.2
  gvfs: upgrade 1.58.2 -> 1.58.4
  libde265: patch CVE-2026-33165
  wolfssl: patch CVE-2026-0819
  wolfssl: patch CVE-2026-2646
  wolfssl: ptach CVE-2026-3229
  wolfssl: patch CVE-2026-3230
  wolfssl: patch CVE-2026-3547
  wolfssl: patch CVE-2026-4159
  wolfssl: patch CVE-2026-4395
  zabbix: ignore CVE-2026-23919
  tigervnc: patch CVE-2026-34352
  strongswan: patch CVE-2026-25075

Deepak Rathore (3):
  libssh: Fix CVE-2026-0968
  libssh: Fix CVE-2026-0967
  libssh: Fix CVE-2026-0965

Gyorgy Sarvari (32):
  nginx: upgrade 1.28.2 -> 1.28.3
  freeipmi: upgrade 1.6.16 -> 1.6.17
  botan: patch CVE-2026-32877
  botan: patch CVE-2026-32883
  botan: patch CVE-2026-32884
  dovecot: patch CVE-2025-59031
  dovecot: mark CVE-2026-0394 patched
  nodejs: ignore fixed CVEs
  opensc: patch CVE-2025-49010
  opensc: patch CVE-2025-66037
  opensc: patch CVE-2025-66038
  imagemagick: upgrade 7.1.2-17 -> 7.1.2-18
  giflib: patch CVE-2025-31344
  botan: patch CVE-2026-34582
  corosync: patch CVE-2026-35091
  corosync: patch CVE-2026-35092
  hiawatha: upgrade 11.7 -> 11.8
  monkey: upgrade 1.8.4 -> 1.8.7
  monkey: patch CVEs
  openjpeg: patch CVE-2026-6192
  libgphoto2: patch CVE-2026-40333
  libgphoto2: patch CVE-2026-40334
  libgphoto2: patch CVE-2026-40335
  libgphoto2: patch CVE-2026-40336
  libgphoto2: patch CVE-2026-40338
  libgphoto2: patch CVE-2026-40339
  libgphoto2: patch CVE-2026-40340
  libgphoto2: patch CVE-2026-40341
  jq: patch CVE-2026-32316
  jq: patch CVE-2026-33947
  jq: patch CVE-2026-33948
  jq: patch CVE-2026-39979

Jason Schonberg (4):
  Update README.md with branch name.
  nodejs: upgrade 22.22.0 -> 22.22.1
  nodejs: upgrade 22.22.1 -> 22.22.2
  php: upgrade 8.4.19 -> 8.4.20

J=C3=B6rg Sommer (1):
  lshw: Fix binmerge

Liu Yiding (1):
  gjs: upgrade 1.84.1 -> 1.84.2

Markus Volk (5):
  iwd: update 3.10 -> 3.11
  nautilus: update 49.4 -> 49.5
  libdvdread: use https for fetching code
  libdvdcss: use https for fetching code
  libdvdnav: use https for fetching code

Michal Sieron (1):
  gnome-bluetooth3: Fix RRECOMMENS typo

Peter Kjellerstedt (1):
  jq: Use Git to fetch the code

Vijay Anusuri (1):
  giflib: Fix CVE-2026-23868

Wang Mingyu (7):
  iwd: upgrade 3.11 -> 3.12
  openldap: upgrade 2.6.10 -> 2.6.12
  openldap: upgrade 2.6.12 -> 2.6.13
  nautilus: upgrade 49.2 -> 49.3
  nautilus: upgrade 49.3 -> 49.4
  gvfs: upgrade 1.58.0 -> 1.58.1
  imagemagick: upgrade 7.1.2-18 -> 7.1.2-19

Zhang Peng (2):
  gvfs: upgrade 1.58.1 -> 1.58.2
  libwnck3: upgrade 43.2 -> 43.3

 .../gjs/{gjs_1.84.1.bb =3D> gjs_1.84.2.bb}      |   2 +-
 .../gnome-bluetooth3_3.34.5.bb                |   2 +-
 .../gvfs/{gvfs_1.58.0.bb =3D> gvfs_1.58.4.bb}   |   2 +-
 ...40d59c32d7ebeb94d242436e3144cefc174a.patch |  40 --
 .../{libwnck3_43.2.bb =3D> libwnck3_43.3.bb}    |   5 +-
 .../{nautilus_49.2.bb =3D> nautilus_49.5.bb}    |   2 +-
 .../libde265/libde265/CVE-2026-33165.patch    |  45 +++
 .../libde265/libde265_1.0.16.bb               |   1 +
 .../libdvdnav/libdvdnav_6.1.1.bb              |   2 +-
 .../recipes-multimedia/vlc/libdvdcss_1.4.3.bb |   2 +-
 .../wolfssl/files/CVE-2026-0819.patch         |  31 ++
 .../wolfssl/files/CVE-2026-2646-1.patch       |  39 ++
 .../wolfssl/files/CVE-2026-2646-2.patch       |  51 +++
 .../wolfssl/files/CVE-2026-3229-1.patch       | 104 +++++
 .../wolfssl/files/CVE-2026-3229-2.patch       |  42 ++
 .../wolfssl/files/CVE-2026-3229-3.patch       |  28 ++
 .../wolfssl/files/CVE-2026-3230.patch         |  69 ++++
 .../wolfssl/files/CVE-2026-3547.patch         |  30 ++
 .../wolfssl/files/CVE-2026-4159.patch         |  32 ++
 .../wolfssl/files/CVE-2026-4395.patch         |  31 ++
 .../wolfssl/wolfssl_5.8.0.bb                  |  10 +
 .../corosync/corosync/CVE-2026-35091.patch    |  47 +++
 .../corosync/corosync/CVE-2026-35092.patch    |  57 +++
 .../corosync/corosync_3.1.10.bb               |   2 +
 .../dovecot/dovecot/CVE-2025-59031.patch      | 142 +++++++
 .../dovecot/dovecot_2.4.1-4.bb                |   2 +
 .../strongswan/CVE-2026-25075.patch           |  48 +++
 .../strongswan/strongswan_6.0.3.bb            |   4 +-
 .../iwd/{iwd_3.10.bb =3D> iwd_3.12.bb}          |   2 +-
 .../zabbix/zabbix_7.0.19.bb                   |   1 +
 .../botan/botan/CVE-2026-32877.patch          | 158 ++++++++
 .../botan/botan/CVE-2026-32883.patch          | 171 +++++++++
 .../botan/botan/CVE-2026-32884.patch          | 171 +++++++++
 .../botan/botan/CVE-2026-34582.patch          |  28 ++
 meta-oe/recipes-crypto/botan/botan_3.10.0.bb  |   7 +-
 .../giflib/giflib/CVE-2025-31344.patch        |  28 ++
 .../giflib/giflib/CVE-2026-23868.patch        |  34 ++
 .../recipes-devtools/giflib/giflib_5.2.2.bb   |   4 +-
 ...-with-disable-maintainer-mode-and-so.patch |  44 +++
 .../jq/jq/CVE-2026-32316.patch                |  53 +++
 .../jq/jq/CVE-2026-33947.patch                | 104 +++++
 .../jq/jq/CVE-2026-33948.patch                |  49 +++
 .../jq/jq/CVE-2026-39979.patch                |  31 ++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  19 +-
 meta-oe/recipes-devtools/lshw/lshw_02.20.bb   |   4 +-
 .../{nodejs_22.22.0.bb =3D> nodejs_22.22.2.bb}  |  13 +-
 .../php/{php_8.4.19.bb =3D> php_8.4.20.bb}      |   2 +-
 .../gphoto2/libgphoto2/CVE-2026-40333.patch   | 150 ++++++++
 .../gphoto2/libgphoto2/CVE-2026-40334.patch   |  37 ++
 .../gphoto2/libgphoto2/CVE-2026-40335.patch   |  43 +++
 .../gphoto2/libgphoto2/CVE-2026-40336.patch   |  44 +++
 .../gphoto2/libgphoto2/CVE-2026-40338.patch   |  34 ++
 .../gphoto2/libgphoto2/CVE-2026-40339.patch   |  41 ++
 .../gphoto2/libgphoto2/CVE-2026-40340.patch   |  40 ++
 .../gphoto2/libgphoto2/CVE-2026-40341.patch   |  69 ++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  10 +-
 .../openjpeg/openjpeg/CVE-2026-6192.patch     |  35 ++
 .../openjpeg/openjpeg_2.5.4.bb                |   1 +
 .../tigervnc/files/CVE-2026-34352.patch       |  31 ++
 .../tigervnc/tigervnc_1.15.0.bb               |   1 +
 .../libdvdread/libdvdread_6.1.3.bb            |   2 +-
 ...{freeipmi_1.6.16.bb =3D> freeipmi_1.6.17.bb} |   2 +-
 ...ck_7.1.2-17.bb =3D> imagemagick_7.1.2-19.bb} |   2 +-
 .../libssh/libssh/CVE-2026-0965.patch         | 286 ++++++++++++++
 .../libssh/libssh/CVE-2026-0967.patch         | 362 ++++++++++++++++++
 .../libssh/libssh/CVE-2026-0968_p1.patch      |  64 ++++
 .../libssh/libssh/CVE-2026-0968_p2.patch      | 132 +++++++
 .../recipes-support/libssh/libssh_0.11.3.bb   |   4 +
 ...{openldap_2.6.10.bb =3D> openldap_2.6.13.bb} |   4 +-
 .../opensc/opensc/CVE-2025-49010.patch        |  71 ++++
 .../opensc/opensc/CVE-2025-66037.patch        |  34 ++
 .../opensc/opensc/CVE-2025-66038.patch        |  40 ++
 .../recipes-support/opensc/opensc_0.26.1.bb   |   6 +-
 .../python/python3-aiofiles_24.1.0.bb         |   2 +-
 .../python/python3-alembic_1.17.2.bb          |   1 +
 ...ask_3.0.0.bb =3D> python3-apiflask_3.0.2.bb} |   2 +-
 ...roid_4.0.2.bb =3D> python3-astroid_4.0.4.bb} |   2 +-
 ..._-nonstring-to-remove-unterminated-s.patch |  43 ---
 ...ute__-nonstring-with-macro-MBEDTLS_A.patch |  42 --
 ...BEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch |  33 --
 .../{hiawatha_11.7.bb =3D> hiawatha_11.8.bb}    |   5 +-
 ...tp-fix-malformed-request-crash-paths.patch | 160 ++++++++
 ...eduler-guard-protocol-close-callback.patch |  51 +++
 ...server-parser-harden-boundary-checks.patch | 108 ++++++
 .../{monkey_1.8.4.bb =3D> monkey_1.8.7.bb}      |  14 +-
 .../{nginx_1.28.2.bb =3D> nginx_1.28.3.bb}      |   2 +-
 .../{nginx_1.29.1.bb =3D> nginx_1.29.2.bb}      |   2 +-
 meta-xfce/README.md                           |   2 +-
 88 files changed, 3605 insertions(+), 204 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.84.1.bb =3D> gjs_1.84.2.bb} (=
94%)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.58.0.bb =3D> gvfs_1.58.4.bb=
} (97%)
 delete mode 100644 meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7=
ebeb94d242436e3144cefc174a.patch
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_43.2.bb =3D> libwnck3_=
43.3.bb} (78%)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.2.bb =3D> nautilus=
_49.5.bb} (93%)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/=
CVE-2026-33165.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-0819.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-2646-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-2646-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-3229-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-3229-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-3229-3.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-3230.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-3547.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-4159.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CV=
E-2026-4395.patch
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CV=
E-2026-35091.patch
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CV=
E-2026-35092.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2=
025-59031.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/CVE-2026-25075.patch
 rename meta-oe/recipes-connectivity/iwd/{iwd_3.10.bb =3D> iwd_3.12.bb} (=
95%)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-32877.pat=
ch
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-32883.pat=
ch
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-32884.pat=
ch
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-34582.pat=
ch
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344=
.patch
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868=
.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-Support-building-=
with-disable-maintainer-mode-and-so.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.0.bb =3D> nodejs_22=
.22.2.bb} (93%)
 rename meta-oe/recipes-devtools/php/{php_8.4.19.bb =3D> php_8.4.20.bb} (=
99%)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40333.patch
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40334.patch
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40335.patch
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40336.patch
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40338.patch
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40339.patch
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40340.patch
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-=
40341.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6=
192.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2026-3435=
2.patch
 rename meta-oe/recipes-support/freeipmi/{freeipmi_1.6.16.bb =3D> freeipm=
i_1.6.17.bb} (93%)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-17.bb =3D>=
 imagemagick_7.1.2-19.bb} (99%)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.p=
atch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.p=
atch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p=
1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p=
2.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.6.10.bb =3D> openlda=
p_2.6.13.bb} (98%)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2025-49010.=
patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2025-66037.=
patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2025-66038.=
patch
 rename meta-python/recipes-devtools/python/{python3-apiflask_3.0.0.bb =3D=
> python3-apiflask_3.0.2.bb} (83%)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.0.2.bb =3D=
> python3-astroid_4.0.4.bb} (90%)
 delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/0001-Add-=
__attribute__-nonstring-to-remove-unterminated-s.patch
 delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/0002-Repl=
ace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch
 delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/define-MB=
EDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_11.7.bb =3D> hiaw=
atha_11.8.bb} (90%)
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/0001-server=
-http-fix-malformed-request-crash-paths.patch
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/0002-server=
-scheduler-guard-protocol-close-callback.patch
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/0003-server=
-parser-harden-boundary-checks.patch
 rename meta-webserver/recipes-httpd/monkey/{monkey_1.8.4.bb =3D> monkey_=
1.8.7.bb} (86%)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.28.2.bb =3D> nginx_1.=
28.3.bb} (66%)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.29.1.bb =3D> nginx_1.=
29.2.bb} (77%)

--=20
2.53.0



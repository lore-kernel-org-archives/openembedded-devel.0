Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD47CF419A5
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 12:33:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17765.1776256373333919522
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 05:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pZ0PYWqd;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=f7sr0pH0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9I16l1565936
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 12:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DukSgK1MVLLUXAjbz8GWTgoG2SoZp+6RQhN
	NXHKOVAA=; b=pZ0PYWqdzuhmaCEinPNSl8/Cn31Xv7B1Lu84TFCxAXCsV3JZxkw
	X8Kapdr+df9xgT++weCwGpV4G4ThjTZdhi85nOcTqiDH9jaDuqTrHgKwnmxTIGGU
	Wap6n6iVZKgY9Acn/dqx3hUDLvprGPZ9rDyINBmWhMeM4e8CgjywiWxVWuqtlqdb
	gQsA30ALpuhtT59aucfz+4EWpEfxYo9p+4Fhe9l3QWtM/tkZGVfJ1DsxMGV/7RFy
	8G8HfWHtBYlgUNhi0hCj45h66vkDL3nNXIJuG/78W9EQU6g4p1EFL4V1Dssp16sL
	ri4Tf5jLsq4BY+rCHk6h1EAeY3DTP6fFBng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7wv0mxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 12:32:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so7259711a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776256371; x=1776861171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DukSgK1MVLLUXAjbz8GWTgoG2SoZp+6RQhNNXHKOVAA=;
        b=f7sr0pH0VNPzMmPuBiGEwifENBA4JfqPR7Rou8qF3jVyENDExcei9JKX6f+SQgILFK
         992IOZdqNAMM48/+3iwd3H+rKtUrWW83v+yAeebm29lNAe8H0E6Mh+y3NxsPhZRbpxnj
         8mG2GmzXVcGFVC65qHeqLYo8pnwuAbNHUQABLcKsnqcntyj+q7rqTJET1t1VqBQMmN+b
         F1cwBehY2tnZb2ZSRGO6Io/641TkNbSj+pAai4GFKv+u68PvoF2mGOZKg1jwLSAtdQ2b
         K0ZSFTU1DZ6cft4AZO/Nqkf2w0D34w5HLkTFWbTrgWV7dNGEfEQJtN0scNWN0IzLrn0o
         moOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256371; x=1776861171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DukSgK1MVLLUXAjbz8GWTgoG2SoZp+6RQhNNXHKOVAA=;
        b=dOIXsK1yizFwuCpIxZevAX3oNZ5Mf6VtrFxp+alebfrggXrtkUm8Hd3WfeAQKLtKVz
         nqS0YTtC5mZq3zUkjLzeBefVVldHJSxAACEzUu6vVJCUnbVgt9BmPWdh6R3IHuJKoGEI
         oZc4J2i/KEq/GkagsEvLxx04ip2rMfoKUpc/9c0VryPskJKljqVYuAHbPBvQix47F+rJ
         T2oD6V+ie7zP4Hws1ngTYCgkeIVuCOGReiGvsT8ZM/MunEpSjAgTAQNHHwQJLZL41e4w
         78c+1TDb3eNpUJKWm1qtvNEOofDaUdUyLiaQmGRRN+HQGj+daV+1BRpDEN2EEyG53grq
         k5YQ==
X-Gm-Message-State: AOJu0YxwX+fL13++0CC81wM7YxDoqH4ejTbIzWl+Mx8A0BwJF8tbuxDf
	LJDde5x/X85UDhIAqS9F5tSDEdHyV5GMgLUhUO+wtMVdYPQRujAuSiERAHJhAyFrG5bBg5yicXI
	MuIeSgWYKMztZzbudDMysTeBsfeE1mER/m8SZoGwtauNjECduiJby9qi3m991PDj/YKKyZKWRqe
	qs/DGuqfW9r6ROwn3cgjs=
X-Gm-Gg: AeBDiesIPiJt0HVWdEBqe029QBi3UxCTe2QgR/nMrIDV5ZWFuLOA4/cj4Ru4Vhc33sl
	TAL97WOordlWw9rGSXShyBEr9lmyTqMq6spKHdmYIAK7Yc/l2slOw6jI6WCYcDmQqrFwig0tAwY
	xzR4xZppBqQpxIEiArWeSYUpY6Ifjh17k+1CbJI9v5wJaaYSW2EnZR4Pfjhe1lr5Bq4qF2Ez4Xe
	Hx7bN8hx9+qVhOdzTI02eSzDZ8IEMU2CB4cYX2ahacF45OKSQC0jBwaY1cBkFfNhQzj14eSfmOR
	nP3003rF8bCpE1tqiH4XjNUyGgUZ0qXPFnOTtOwaGMhU4srH2PERiBAtRjuVAeYlK+PpNEcBkLC
	/V+opB3VEufkmycs2wnZ+wOWqfV2jZ6ziagEaDro5VxT8IQsgMS1d
X-Received: by 2002:a17:90a:2ce5:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-35e579a823cmr7863916a91.7.1776256370697;
        Wed, 15 Apr 2026 05:32:50 -0700 (PDT)
X-Received: by 2002:a17:90a:2ce5:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-35e579a823cmr7863894a91.7.1776256369963;
        Wed, 15 Apr 2026 05:32:49 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fce824122sm1497195a91.2.2026.04.15.05.32.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:32:49 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/47] Scarthgap pull request
Date: Wed, 15 Apr 2026 18:02:40 +0530
Message-ID: <cover.1776247700.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TnWkIssllXM7FAu-OIhZzyvM8eakGw4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDExNSBTYWx0ZWRfX1mQ+gaI9Y4Ov
 O1MPn91fKekSFNfOpgHvFud9zwp9Uz0s9W9hrdI/Z6GuJ1b8PXeK1uHEP7bWgUlniF32jguLNOh
 moKvah3rb7j0WgjGTbmztnoQN8t9Xg5Zt1bKUK/Ha0418xQAsUscAcSrFHKFDiq57rltzl20DWy
 of4/zpg3Bbl/YqwC2Y49pP/TvYnDPQHYZw3xYyDlHTlb+cSxBh/yEghG0L4FBS3hGMoL0NNM3tk
 IR+lrkyL0omOSalgnERWsjykjLMIQK4e7DB4bco+g+ERZ2NtAZvayn3IeIMahs5eRJX5M8x03UW
 EkV2huoiXGmUKhylSJCs/ii7Fxpz7b+DWROO0o/wT/OAwrpsdgVf4La7NH7J+uFr4hI90FTAUgD
 yTXyUa+hOAVcWkDLAsXnF0PItiZA0jcLmnlXRWzRewczt5ticdNcZHO6UiZWn/n7VaCvFXILxz0
 FTABYVNG5ChpLChmHdA==
X-Authority-Analysis: v=2.4 cv=GYgnWwXL c=1 sm=1 tr=0 ts=69df8573 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=ttGdkKyJUEinwMykvzoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: TnWkIssllXM7FAu-OIhZzyvM8eakGw4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 12:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126359

Please merge these changes in scarthgap. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1469

The following changes since commit 1ad0d777d1de1769e5995eb806f7ae5c15d0be54:

  strongswan: Fix CVE-2026-25075 (2026-04-03 15:00:48 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

for you to fetch changes up to 5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e:

  nginx: fix CVE-2026-28753 (2026-04-15 14:12:18 +0530)

----------------------------------------------------------------

Ankur Tyagi (32):
  abseil-cpp: ignore CVE-2025-0838
  freerdp3: fix CVE-2026-25941
  freerdp3: fix CVE-2026-33952
  freerdp3: fix CVE-2026-23948
  freerdp3: fix CVE-2026-24491
  freerdp3: fix CVE-2026-24675
  freerdp3: fix CVE-2026-24676
  freerdp3: ignore CVE-2026-24677 and CVE-2026-24678
  freerdp3: fix CVE-2026-24679
  freerdp3: fix CVE-2026-24680 and CVE-2026-27950
  freerdp3: fix CVE-2026-24681
  freerdp3: fix CVE-2026-24682
  freerdp3: fix CVE-2026-24683
  freerdp3: fix CVE-2026-29774
  freerdp3: fix CVE-2026-29775
  freerdp3: fix CVE-2026-29776
  freerdp3: fix CVE-2026-31806
  freerdp3: fix CVE-2026-31897
  freerdp3: fix CVE-2026-33984
  libde265: upgrade 1.0.12 -> 1.0.16
  libraw: ignore CVE-2026-5318
  libvncserver: fix CVE-2026-32853
  libvncserver: fix CVE-2026-32854
  nodejs: upgrade 20.20.0 -> 20.20.2
  python3-django: upgrade 4.2.29 -> 4.2.30
  python3-ecdsa: fix CVE-2026-33936
  python3-flask: upgrade 3.0.2 -> 3.0.3
  python3-tornado: fix CVE-2026-35536
  python3-werkzeug: ignore CVE-2026-27199
  nginx: fix CVE-2026-27651
  nginx: fix CVE-2026-27654
  nginx: fix CVE-2026-28753

Guocai He (1):
  yasm: fix CVE-2021-33454

Gyorgy Sarvari (2):
  giflib: patch CVE-2025-31344
  mbedtls: upgrade 3.6.5 -> 3.6.6

Haixiao Yan (3):
  python3-django: fix CVE-2025-64459
  python3-django: fix CVE-2025-57833
  python3-django: fix CVE-2025-59681

Hitendra Prajapati (2):
  nginx: Fix for CVE-2026-27784
  nginx: Fix for CVE-2026-28755

Jackson James (1):
  unbound: Fix CVE-2025-11411

Jinfeng Wang (1):
  nmap: rename enum PCAP_SOCKET

Libo Chen (4):
  hdf5: fix CVE-2025-2153
  hdf5: fix CVE-2025-2310
  hdf5: fix CVE-2025-44905
  hdf5: fix CVE-2025-2309

Peter Marko (1):
  grpc: set status for CVE-2026-33186

 .../libde265/libde265/CVE-2023-43887.patch    |   39 -
 .../libde265/libde265/CVE-2023-47471.patch    |   42 -
 ...{libde265_1.0.12.bb => libde265_1.0.16.bb} |    4 +-
 .../{mbedtls_3.6.5.bb => mbedtls_3.6.6.bb}    |    2 +-
 .../unbound/0001-CVE-2025-11411-1.patch       | 1874 +++++++++++++++++
 .../unbound/0002-CVE-2025-11411-2.patch       |  153 ++
 .../unbound/unbound/CVE-2025-11411.patch      |   48 -
 .../recipes-support/unbound/unbound_1.19.3.bb |    3 +-
 .../abseil-cpp/abseil-cpp_20240116.3.bb       |    2 +
 .../giflib/giflib/CVE-2025-31344.patch        |   28 +
 .../recipes-devtools/giflib/giflib_5.2.2.bb   |    3 +-
 meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb  |    2 +
 .../{nodejs_20.20.0.bb => nodejs_20.20.2.bb}  |    4 +-
 .../yasm/yasm/CVE-2021-33454.patch            |   29 +
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |    1 +
 .../libvncserver/CVE-2026-32853.patch         |   76 +
 .../libvncserver/CVE-2026-32854.patch         |   66 +
 .../libvncserver/libvncserver_0.9.14.bb       |    5 +-
 .../files/nmap-rename-enum-PCAP_SOCKET.patch  |   81 +
 meta-oe/recipes-security/nmap/nmap_7.80.bb    |    1 +
 .../freerdp/freerdp3/CVE-2026-23948.patch     |   55 +
 .../freerdp/freerdp3/CVE-2026-24491.patch     |   52 +
 .../freerdp/freerdp3/CVE-2026-24675.patch     |   32 +
 .../freerdp/freerdp3/CVE-2026-24676.patch     |   34 +
 .../freerdp/freerdp3/CVE-2026-24679.patch     |   44 +
 .../CVE-2026-24680_CVE-2026-27950.patch       |   24 +
 .../freerdp/freerdp3/CVE-2026-24681.patch     |   26 +
 .../freerdp/freerdp3/CVE-2026-24682.patch     |   31 +
 .../freerdp/freerdp3/CVE-2026-24683.patch     |  114 +
 .../freerdp/freerdp3/CVE-2026-25941.patch     |   28 +
 .../freerdp/freerdp3/CVE-2026-29774.patch     |   75 +
 .../freerdp/freerdp3/CVE-2026-29775.patch     |   30 +
 .../freerdp/freerdp3/CVE-2026-29776.patch     |   30 +
 .../freerdp/freerdp3/CVE-2026-31806.patch     |   36 +
 .../freerdp/freerdp3/CVE-2026-31897.patch     |   28 +
 .../freerdp/freerdp3/CVE-2026-33952.patch     |   38 +
 .../freerdp/freerdp3/CVE-2026-33984.patch     |   34 +
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |   19 +
 .../hdf5/files/CVE-2025-2153.patch            |   51 +
 .../hdf5/files/CVE-2025-2309.patch            |   41 +
 .../hdf5/files/CVE-2025-2310.patch            |   37 +
 .../hdf5/files/CVE-2025-44905.patch           |   46 +
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |    4 +
 .../recipes-support/libraw/libraw_0.21.2.bb   |    2 +
 .../0001-lower-setuptools-requirements.patch  |    0
 .../CVE-2025-57833.patch                      |   88 +
 .../CVE-2025-59681.patch                      |  178 ++
 .../CVE-2025-64459-1.patch                    |   57 +
 .../CVE-2025-64459-2.patch                    |   63 +
 ...ngo_4.2.29.bb => python3-django_4.2.30.bb} |    2 +-
 .../python/python3-django_5.0.14.bb           |    7 +-
 .../python/python3-ecdsa/CVE-2026-33936.patch |   56 +
 .../python/python3-ecdsa_0.19.0.bb            |    1 +
 ...-flask_3.0.2.bb => python3-flask_3.0.3.bb} |    4 +-
 .../python3-tornado/CVE-2026-35536.patch      |  155 ++
 .../python/python3-tornado_6.4.2.bb           |    1 +
 .../python/python3-werkzeug_3.0.6.bb          |    1 +
 .../nginx/files/CVE-2026-27784.patch          |   88 +
 .../nginx/nginx-1.24.0/CVE-2026-27651.patch   |   34 +
 .../nginx/nginx-1.24.0/CVE-2026-27654.patch   |   81 +
 .../nginx/nginx-1.24.0/CVE-2026-28753.patch   |   93 +
 .../nginx/nginx-1.24.0/CVE-2026-28755.patch   |   48 +
 .../nginx/nginx-1.25.5/CVE-2026-28755.patch   |   48 +
 meta-webserver/recipes-httpd/nginx/nginx.inc  |    1 +
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |    8 +-
 .../recipes-httpd/nginx/nginx_1.25.5.bb       |    2 +
 66 files changed, 4247 insertions(+), 143 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-43887.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-47471.patch
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.12.bb => libde265_1.0.16.bb} (84%)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.5.bb => mbedtls_3.6.6.bb} (98%)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/0001-CVE-2025-11411-1.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/0002-CVE-2025-11411-2.patch
 delete mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2025-11411.patch
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.20.0.bb => nodejs_20.20.2.bb} (98%)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33454.patch
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch
 create mode 100644 meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-23948.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24491.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24675.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24676.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24679.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24680_CVE-2026-27950.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24681.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24682.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24683.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-25941.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29774.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29775.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29776.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31806.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31897.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33952.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33984.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2153.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2309.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2310.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-44905.patch
 rename meta-python/recipes-devtools/python/{python3-django-4.2.29 => python3-django-4.2.30}/0001-lower-setuptools-requirements.patch (100%)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-57833.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-59681.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-2.patch
 rename meta-python/recipes-devtools/python/{python3-django_4.2.29.bb => python3-django_4.2.30.bb} (82%)
 create mode 100644 meta-python/recipes-devtools/python/python3-ecdsa/CVE-2026-33936.patch
 rename meta-python/recipes-devtools/python/{python3-flask_3.0.2.bb => python3-flask_3.0.3.bb} (80%)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-35536.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-27784.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28753.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2026-28755.patch

-- 
2.53.0



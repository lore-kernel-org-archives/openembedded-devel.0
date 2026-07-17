Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33457C44515
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 23:26:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.771.1784330773459652672
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2026 16:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=n6wg8mQ+;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=SfZDhpZf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HNEVx03024012
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 23:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q2JnXEidnWz1cmro9ZdSo2oreBpRuP2IYCD
	ezLgdSEM=; b=n6wg8mQ+ui/lh9PqQbDHh0Nl2a8GD116qam1lqloYh9dnzbWGWU
	t3jH2G+51ZJCt6Mzq3EpoubdK7Msp0HYGXfoNJS6NdZqMAqUoaGbhxv7MfJxHkyj
	fqGUwS6EXuomKtauEg5QR0YrTflyfWnAmzFXx08yA+6O/bzIlbjBXyRzAsHadmVm
	QfyoLVFNu2t0gYMKmLLLa1VCj8rkNA9Kp+tuN67L0yjDj88jQwaUPi3j69dZ71Zj
	f6h5HunrwjRR8uUW6IsC/qkB1oUp8CM7CkBbharAWQFYL3PkplZkSnFZyROEgRoa
	L80TplI8uSw4h+nl3KwEujNcL2UDMZ1LwvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrp8s74v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 23:26:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso12507529a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 16:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784330772; x=1784935572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q2JnXEidnWz1cmro9ZdSo2oreBpRuP2IYCDezLgdSEM=;
        b=SfZDhpZfGXzOBzMpu2NXrH7cE40yudrAaRuBBcRAIj94MMKYOPCovetVndGQxFZyRQ
         Nhb37VruIAW/JRyxkUrF/bQPoO9CdTCo3dJnzDim0xnaXrUCb5fAGngNdVwk/PMIMZqS
         ls0HjnWLAwvsKrRIEOJDHS8BTQeDSvlIgg5CnAztG0Uwjr6YdOfEJs2XZjEqoIqpI7T1
         X4Sb4QCUzsa0qgMJYoaOMUvLox4Rac1TPjco3glBu5yXrY5PsoSgTx0DjtevAXcjbT2z
         rkWNQgCJs856+NWoN/RNY4tWjEe3o/y6udAg6qpxFD3wQY2zUMPuYLt7LATBMG7dQFYI
         o6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784330772; x=1784935572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q2JnXEidnWz1cmro9ZdSo2oreBpRuP2IYCDezLgdSEM=;
        b=HkgkT/3vlro4rjKwy/h0E2qJum/Y4v9Nb4KFJrb+BLvOksKU+QfKhHbo2UMv7VuZQU
         pNaJByERBCrjaYrlbEneBYvjOXs4Hj9itbLoJDQZXl8qo6fOD5G/ZrE29X8ujDxN29ML
         HJ98+zl1WHmATvrgyQTfgFfIjQuJQx+y3BtcAiqlVqw7Ax1RDqQyaSL/euVcZfJP9Zz+
         cA6Czm2M2cwCvIWAKuBbttDJEY2QBczzXpkNuC5M8nPBa0FTQcCXzhYz3fNL3Ge4lWcA
         SOctDf945IaMNXnZFpHI+d3CfDaxkZufJMIihSLDJvWrJu1hbJiabvlhU+iuJOOL43TS
         rHug==
X-Gm-Message-State: AOJu0YwVnl9aDI6UfRd8bK26YtuFq+GbJ/SyQYFyDWjtE+6zy9W6rP0X
	unafCOlKPIxppcZhjzxxzsnt28U8HIVXDPvoorsRqxZ0EwszSK2oEAewcQcek/koQbDhLWy6z+o
	WfPtQjJZ3lOKZ8MdT/uyOwNmXjdXvZgKEmoGxEohzEHvoAoMYdFK++EwvJ+Lg3lqmWUBPZnqOf1
	fNwYLUSrPZqOdJT+CMQh313A==
X-Gm-Gg: AfdE7clF0BewhTojryzF0RJjXjr1PrA+da1S8Z839QR3kWPWGq7PsJRYFzyjK/RzrsJ
	hHWTeHBH+dBN+yYKqy8mGWx6iwgMlyQ1+AAifsPGMXmEX+tITJum9Zghrj5lS9I0ZzC/0wQ7cO8
	8Gb39MFu8v8dAxSbif0tWnLVlxRWDsfDtyg+AOCSsLYZaUnJK4Fx0jJk6F7gRpxIHYpGaPiA8xx
	IGynbByG3sD9NOmVZ9TPfUyEHWpaXMLyliVGypCrfKuRaOrbCm4E9lTkzX7g9t9jjuRk+iE3aL6
	yug51CtJ79SX7rbFL1kdq8F1Vl2IK1+I/n+OH0KkUYdbcyuYGRTrbW0O/6rikJnnDwjFFIJLyk3
	EFgpJqY+y1E/ZaEidmD2DtHGALOqVW7I=
X-Received: by 2002:a17:90b:1dca:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38e4b454d1cmr5131743a91.10.1784330771941;
        Fri, 17 Jul 2026 16:26:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1dca:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38e4b454d1cmr5131718a91.10.1784330771365;
        Fri, 17 Jul 2026 16:26:11 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de21asm10647297eec.23.2026.07.17.16.26.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:26:10 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/14] Scarthgap pull request
Date: Sat, 18 Jul 2026 04:56:04 +0530
Message-ID: <cover.1784290740.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDI0MSBTYWx0ZWRfX9GljqqCFbVvM
 JfBJ3m/MAO/C1txoYohrS2j0xMrfcBgCIXsc5r2WQSan06Z1v5kOmHfmNPIf+xB8odpdVxYSXjJ
 lfUD9LMipy2osHsAjcl21vpu/XwQY8o=
X-Proofpoint-ORIG-GUID: OAQa2LqM2IUj04eNS--EZ7npmeLKYfgH
X-Proofpoint-GUID: OAQa2LqM2IUj04eNS--EZ7npmeLKYfgH
X-Authority-Analysis: v=2.4 cv=fMYJG5ae c=1 sm=1 tr=0 ts=6a5aba14 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=IXavJW9oYoNocdHOnnAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDI0MSBTYWx0ZWRfX3R2d5xuPOAJe
 DWbup6i10QZdD/Z2yatdPNtGrlN3JVKg2k/bCnF/OsWH/+rb0Ki6J2p+LCHhkYC++sROYUCaYRA
 TVJkeWgkq+JZ39C6lwcIguxF3jiKiQMmPmQXHmkKVK1EMSgp5MU3/LTOVDVT7Ozys5q3YHu2y6/
 rs4cKEGtIGOGIT80E+9733JuXZTXnRrIcln3DaPirEvFaiXxF5XG+GLWIkGariR593RKkSa81D7
 hHmYt0yE9h7qVhJqwk7ZhBJYSt7xTJxWKoei3kYHMHGODD3QykLsC1x6qHm3OnmJfpENrNveGCf
 b+MFQD4KDvwyaWtRtbT9GIMTIUC07983+AQ1+WyQOoADygxPcEo9un3dzYlZOoub/uUL+zr/Fv/
 AUx6rPpUMtBecc7weUWWUrqMTVl2ZZJjFb/3LGzWKZQSQSjkzsTt/cZDpy4t529Zl0q7HPHhGm7
 9Fq43t5sz8b+hRgMeyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170241
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 23:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128251

Please merge these changes in scarthgap. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1637

The following changes since commit 29a044218285fdc7fcdd63d5f0929cb3a27b6fed:

  python3-matplotlib: fix build (2026-07-02 15:08:44 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

for you to fetch changes up to 7eb94107580092f79ff1b639a87762fe6f96aa12:

  nginx: fix CVE-2026-42055 (2026-07-16 15:49:44 +0530)

----------------------------------------------------------------

Ashishkumar Parmar (2):
  samba: Fix CVE-2026-3012
  samba: Fix CVE-2026-4408

Benjamin Robin (Schneider Electric) (2):
  dnsmasq: fix CVE-2026-2291
  nginx: fix CVE-2026-42055

Deepak Rathore (4):
  lldpd: Fix CVE-2026-46433
  mbedtls: set CVE_STATUS for CVE-2025-66442
  nmap: fix CVE-2026-58058
  libidn: fix CVE-2026-57053

Esa Jaaskela (1):
  uutils-coreutils: fix buildpaths QA warning

Etienne Cordonnier (1):
  uutils-coreutils: disable stdbuf compilation

Jason Schonberg (1):
  php: upgrade 8.2.31 -> 8.2.32

Roland Kovacs (1):
  radvd: fix CVE-2026-48715

Sudhir Dumbhare (1):
  mariadb: upgrade 10.11.16 -> 10.11.18

Yunseong Kim (1):
  libyang: Fix CVE-2026-41401 and CVE-2026-44673

 .../mbedtls/mbedtls_3.6.6.bb                  |   17 +
 .../samba/samba/CVE-2026-3012_p1.patch        |  131 ++
 .../samba/samba/CVE-2026-3012_p2.patch        |   51 +
 .../samba/samba/CVE-2026-4408_p1.patch        |   75 ++
 .../samba/samba/CVE-2026-4408_p10.patch       |  339 +++++
 .../samba/samba/CVE-2026-4408_p11.patch       |   94 ++
 .../samba/samba/CVE-2026-4408_p12.patch       |   47 +
 .../samba/samba/CVE-2026-4408_p13.patch       |  174 +++
 .../samba/samba/CVE-2026-4408_p14.patch       |   59 +
 .../samba/samba/CVE-2026-4408_p15.patch       | 1108 +++++++++++++++++
 .../samba/samba/CVE-2026-4408_p16.patch       |  422 +++++++
 .../samba/samba/CVE-2026-4408_p17.patch       |   55 +
 .../samba/samba/CVE-2026-4408_p18.patch       |   52 +
 .../samba/samba/CVE-2026-4408_p2.patch        |  133 ++
 .../samba/samba/CVE-2026-4408_p3.patch        |  208 ++++
 .../samba/samba/CVE-2026-4408_p4.patch        |  179 +++
 .../samba/samba/CVE-2026-4408_p5.patch        |   46 +
 .../samba/samba/CVE-2026-4408_p6.patch        |  131 ++
 .../samba/samba/CVE-2026-4408_p7.patch        |   84 ++
 .../samba/samba/CVE-2026-4408_p8.patch        |   39 +
 .../samba/samba/CVE-2026-4408_p9.patch        |   61 +
 .../samba/samba_4.19.9.bb                     |   20 +
 .../lldpd/files/CVE-2026-46433.patch          |   36 +
 .../recipes-daemons/lldpd/lldpd_1.0.18.bb     |    1 +
 .../radvd/files/CVE-2026-48715.patch          |  213 ++++
 .../radvd/files/CVE-2026-48715_dep.patch      |  106 ++
 .../recipes-daemons/radvd/radvd_2.19.bb       |    2 +
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |    1 +
 .../dnsmasq/files/CVE-2026-2291.patch         |   40 +
 .../files/0002-do-not-compile-stdbuf.patch    |   39 +
 .../uutils-coreutils_0.0.28.bb                |    5 +-
 ...10.11.16.bb => mariadb-native_10.11.18.bb} |    0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |    2 +-
 ...ariadb_10.11.16.bb => mariadb_10.11.18.bb} |    0
 .../php/{php_8.2.31.bb => php_8.2.32.bb}      |    2 +-
 .../libidn/libidn/CVE-2026-57053.patch        |   28 +
 .../recipes-extended/libidn/libidn_1.41.bb    |    1 +
 .../libyang/libyang/CVE-2026-41401.patch      |   49 +
 .../libyang/libyang/CVE-2026-44673.patch      |   66 +
 .../libyang/libyang_2.1.148.bb                |    2 +
 .../nmap/files/CVE-2026-58058.patch           |   33 +
 meta-oe/recipes-security/nmap/nmap_7.80.bb    |    1 +
 .../nginx/files/CVE-2026-42055.patch          |  102 ++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |    1 +
 44 files changed, 4252 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p1.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p2.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p1.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p10.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p11.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p12.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p13.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p14.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p15.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p16.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p17.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p18.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p2.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p3.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p4.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p5.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p6.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p7.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p8.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p9.patch
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/CVE-2026-46433.patch
 create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-2026-48715.patch
 create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-2026-48715_dep.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
 create mode 100644 meta-oe/recipes-core/uutils-coreutils/files/0002-do-not-compile-stdbuf.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.16.bb => mariadb-native_10.11.18.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.16.bb => mariadb_10.11.18.bb} (100%)
 rename meta-oe/recipes-devtools/php/{php_8.2.31.bb => php_8.2.32.bb} (99%)
 create mode 100644 meta-oe/recipes-extended/libidn/libidn/CVE-2026-57053.patch
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673.patch
 create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42055.patch

-- 
2.54.0



Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2898.1794507289363365491
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 10:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XddpL+e6;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild13.wrs.com, ip: 205.220.166.238, mailfrom: prvs=5776a7c2b2=vgarigan@oak-lpgbuild13.wrs.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFd1Ca1577082
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 10:14:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=h9CZjLChG
	nqvqDS6FZw1i52Vt9nrK2rmHkvBBtxT1v4=; b=XddpL+e66UQbf1Gt7b/YVCSnQ
	us6vMS67xAwLvSHiB+D7m4s9hFUHfPFDZnNVAduYo8+tejbPQPIiPKUK950PgFXa
	4sZrB1UoiD0/TEBBcYM1nvRyfYQyV0d5ttmhe2aLywFPbNe8nqGQJpvRBgR3WE9f
	U8teb6SBqEHu0/rHRYllNn3TqNLv5m287Hso8VaU5OF/+yoE5Bt+73Q4KHh8H76P
	w+Ka8oJKR+SRAk2/K/eWUzuKC6BYEkG/MgBs2dIArVoJmCoiXbqTgIwlFhIX2O4N
	FURl526YtZ2iwGuhiyFPOj/C49glbefI8wQyQVQpKDRuB9v1G9anX9zNI268A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ht4cjhydv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 10:14:48 -0800 (PST)
Received: from ala-p2exch02.corp.ad.wrs.com (10.11.226.102) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Thu, 12 Nov 2026 10:14:47 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-p2exch02.corp.ad.wrs.com (10.11.226.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 12 Nov 2026 10:14:47 -0800
Received: from oak-lpgbuild13.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 12 Nov 2026 10:14:47 -0800
Received: by oak-lpgbuild13.wrs.com (Postfix, from userid 1762445478)
	id 7BD324BC01AB; Thu, 12 Nov 2026 18:14:47 +0000 (UTC)
From: Venkata Gariganti <venkata.gariganti@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Venkata Gariganti <venkata.gariganti@windriver.com>
Subject: [meta-oe][scarthgap][PATCH] mariadb: upgrade 10.11.18 -> 10.11.19
Date: Thu, 12 Nov 2026 18:14:43 +0000
Message-ID: <20261112181443.2412803-1-venkata.gariganti@windriver.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a6aWIka_s031nf30DyJ1_feODhs4qjbX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX2tfakf/KHOv2
 F+ELYSSjr1pfegdCqyS1ZXG+NaF0OQOI+KTK8HbbXqKOdZ0OVbUmG0QktUDoqWybZmNEwc+SH34
 ze2gPio9iGw3fINLFMYUJge6yOnFJcxuPQwRxdUL45ICSd4qMEII
X-Proofpoint-GUID: a6aWIka_s031nf30DyJ1_feODhs4qjbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX6RmAWrw48ydw
 XwYR6K9kGGXSIwFjY0p44U382twrqDEHW7WYSWak/ti+YRaWspN8N0EYYy/vd1aIHofZm8fI5tj
 gNa9sf9//oorlh95BU0GRKcE63GTGzrfoAXIlBu3gstpiUPVuCgk6t6PLOzIa0TAMGL55ILgrtL
 u+4rM1VzpZEAWi2v1ebsiMf5wkqFQnkw4V42gx+eUqibK+wnvVQdf+ODgQB5c907oDXrshKh5a+
 cXpRMdz+zQnH/dchuysxDONwEhlVg9f9APl0rMCPF5M/hw8ybXaZwUWgRYQdmJHn04MU1V4v5nb
 9ONZDPH3BX7iQxh2O0QyYMUkPfdxSbC/F936Q69r5xXiLGMLontGnU+ed0Fb1qNY272KlaakZiC
 uelYCmWdMmdVTa6DmkBXWJBCu3pmYGskrAdM5nWDpdEGAkR8wSDTpKkb+EgDxSJ51zUjtN3fRn5
 uUjpMm87T5Ncsfhi2ew==
X-Authority-Analysis: v=2.4 cv=X9bHu2Te c=1 sm=1 tr=0 ts=6af60218 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=jpp-Wi3FAAAA:8 a=hkEv4HZQAAAA:8 a=JzDNrboiAAAA:20
 a=t7CeM3EgAAAA:8 a=FP6M-8rVlcepR4PVOKAA:9 a=3HWhRrkoiJongTt84g_J:22
 a=NA03pvyaApPJG5valX87:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 clxscore=1011 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 18:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132212
Content-Type: text/plain; charset="utf-8"

Upgrade mariadb to release 10.11.19, a stable (GA) maintenance release
of the 10.11 LTS series.

Release notes:
- https://mariadb.com/docs/release-notes/community-server/10.11/10.11.19

Signed-off-by: Venkata Gariganti <venkata.gariganti@windriver.com>
---
 .../{mariadb-native_10.11.18.bb => mariadb-native_10.11.19.bb}  | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
 .../mysql/{mariadb_10.11.18.bb => mariadb_10.11.19.bb}          | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.18.bb => mariadb-native_10.11.19.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.18.bb => mariadb_10.11.19.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.18.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.19.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.18.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.19.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index ff22b49b47..7ddbed0714 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
           "
-SRC_URI[sha256sum] = "a46852c68075be7c31c7b33fee233c5b5a00c8c28117f5204d124e4f2fd56fa8"
+SRC_URI[sha256sum] = "b8e543ee69d380fb1cfd563226f49e0fe96e4d67e7b7a9045ee514a168ed2066"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.18.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.19.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.18.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.19.bb

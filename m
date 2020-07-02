Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
 by mx.groups.io with SMTP id smtpd.web10.402.1593707775661457564
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2020 09:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fb.com header.s=facebook header.b=onGSEI/G;
 spf=pass (domain: fb.com, ip: 67.231.145.42, mailfrom: prvs=44520df2fc=andrestc@fb.com)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 062GQuZf017626
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Jul 2020 09:36:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=PfSOd2pSNNdTBxIqtLLB5LwwVrGkh1emA2zgEEw2cUE=;
 b=onGSEI/GLLsOv9g5ZgCL4lNmv4ZzH7j9DpMoSSJXIp2ti4Gy4l5RY/EFYfxaH7MCVQLF
 ZEjdDdSanlfFjazP6fazjrb7/EckstCwNjKhN4DbMyMb+30GeVRLopyIdQFfxy8Jy8oh
 CwnLXOxwElmASgqs+lEWkEhndh2YJ6AnnVU= 
Received: from mail.thefacebook.com ([163.114.132.120])
	by mx0a-00082601.pphosted.com with ESMTP id 321k40g1n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2020 09:36:14 -0700
Received: from intmgw003.03.ash8.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:11d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 2 Jul 2020 09:36:13 -0700
Received: by devbig014.lla2.facebook.com (Postfix, from userid 185260)
	id 7E1935A005D8; Thu,  2 Jul 2020 09:36:09 -0700 (PDT)
Smtp-Origin-Hostprefix: devbig
From: andrestc@fb.com
Smtp-Origin-Hostname: devbig014.lla2.facebook.com
To: <openembedded-devel@lists.openembedded.org>
CC: Andre Carvalho <andrestc@fb.com>
Smtp-Origin-Cluster: lla2c09
Subject: [meta-networking][PATCH] netcat: Set CPE_PRODUCT
Date: Thu, 2 Jul 2020 09:36:02 -0700
Message-ID: <20200702163602.1768259-1-andrestc@fb.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-FB-Internal: Safe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-02_09:2020-07-02,2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 spamscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=977 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1011 cotscore=-2147483648 lowpriorityscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007020113
X-FB-Internal: deliver
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This way yocto cve-check can find open CVE's. See also:

http://lists.openembedded.org/pipermail/openembedded-core/2017-July/13989=
7.html

"Results from cve-check are not very good at the moment.
One of the reasons for this is that component names used in CVE
database differ from yocto recipe names. This series fixes several
of those name mapping problems by setting the CVE_PRODUCT correctly
in the recipes. To check this mapping with after a build, I'm exporting
LICENSE and CVE_PRODUCT variables to buildhistory for recipes and
packages."

Value added is based on:
https://nvd.nist.gov/products/cpe/search/results?keyword=3Dnetcat&status=3D=
FINAL&orderBy=3DCPEURI&namingFormat=3D2.3

Signed-off-by: Andre Carvalho <andrestc@fb.com>
---
 meta-networking/recipes-support/netcat/netcat_0.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/met=
a-networking/recipes-support/netcat/netcat_0.7.1.bb
index 14d743f82..1e113de51 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] =3D "b55af0bbdf5acc02d1eb6ab18da2acd=
77a400bafd074489003f3df0967
=20
 inherit autotools
=20
+CVE_PRODUCT =3D "netcat_project:netcat"
+
 do_install_append() {
     install -d ${D}${bindir}
     mv ${D}${bindir}/nc ${D}${bindir}/nc.${BPN}
--=20
2.24.1


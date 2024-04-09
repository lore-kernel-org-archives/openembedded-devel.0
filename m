Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE91BC67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 20:25:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.149405.1712694332803472616
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Apr 2024 13:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Aw3xwIlW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=482968419c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4394dGxT000614
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Apr 2024 13:25:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/mOND
	2/3i+PyfKAcUGKJcq3Z+skidmtbnYSlcRz0seQ=; b=Aw3xwIlWB2Nqi2ez0S4xF
	St8PROvJ/gufkSUVUIPZGNmXZX/genHhjcLaSWltTj9QMdcVBhgGcLxhkpWfywGu
	oNdXF9tf46e+R7QuZ4qrl2oWpVxoV3y8glxOGsA1BCyQzl1yCiGh6TmOB03dJX+a
	K8YikUyhglqH19IxWv4gQAFR4kdDBNLCb12HzjLeo01Q0X4fWmcNAmiWaicnrOwQ
	RHxrzQQrMuZDXVZdQnW9zPiv7KcbgjfAo20AKXQ6EoJegKAEDQY4d1jYEKYnWXGn
	CaNEdTcCFdYukFXmByPfqR8EqZVXU71guBXutZ/6Hhbc+bb02nbaMZTrbzUIg7Fw
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wgjtp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 13:25:32 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 9 Apr 2024 13:25:31 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Tue, 9 Apr 2024 13:25:31 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 0/5] convert remaining ftp SRC_URIs to https/http
Date: Tue, 9 Apr 2024 13:25:26 -0700
Message-ID: <20240409202531.1050101-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xdaHE6qrXM24uMXBJWYkPteyPk6wOyi0
X-Proofpoint-ORIG-GUID: xdaHE6qrXM24uMXBJWYkPteyPk6wOyi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=991
 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404090137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 20:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109880

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Fedora 40 is switching to wget2:
   https://fedoraproject.org/wiki/Releases/40/ChangeSet?ref=news.itsfoss.com#Wget2_as_wget
which is rumoured to have dropped support for --passive-ftp and more and more firewalls are 
blocking ftp trafic so covert the 5 packages in meta-openembedded that are still using ftp 
in their SRC_URI to https or http.

Also clean up some HOMEPAGE links and drop some obsolete SRC_URI[md5sum]s.

Randy MacLeod (5):
  ncftp: Upgrade to 3.2.7
  pimd: switch SRC_URI to https
  tnftp: switch the SRC_URI to https
  postfix: switch SRC_URI to http
  libmad: switch links/SRC_URI to https sites

 .../ncftp/ncftp/ncftp-3.2.5-gcc10.patch       | 83 -------------------
 .../ncftp/{ncftp_3.2.6.bb => ncftp_3.2.7.bb}  |  6 +-
 .../recipes-daemons/postfix/postfix_3.8.6.bb  |  2 +-
 .../recipes-support/pimd/pimd_2.3.2.bb        |  3 +-
 .../recipes-support/tnftp/tnftp_20230507.bb   |  2 +-
 .../libmad/libmad_0.15.1b.bb                  |  7 +-
 6 files changed, 8 insertions(+), 95 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch
 rename meta-networking/recipes-daemons/ncftp/{ncftp_3.2.6.bb => ncftp_3.2.7.bb} (79%)

-- 
2.43.0



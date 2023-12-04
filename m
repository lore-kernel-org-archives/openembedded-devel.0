Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A289EC10F13
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 06:54:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.64008.1701672896623937468
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Dec 2023 22:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kGZidQqc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0702f83593=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B46joMC003378
	for <openembedded-devel@lists.openembedded.org>; Sun, 3 Dec 2023 22:54:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=XFzDv
	ViDK6p5lQHBsn5bqGMJQ6NwBV2TGwQEBrTHrco=; b=kGZidQqc+B0wEYJJ74pxb
	duIqne96nHoqHPrCbhtJVlx7kK/7UC093g8YpbRjuFXpi7N528DcuF3fCMzNKuti
	/6Zm/RSLjNmeDT7nExKUEp9o1uw1McA8UcI3/78SlLG5LvJNGxrsNJBv1A0vSHBm
	K3Ju3j80IrF6TGSONGnsb2T1xZZnyDrsnprfhXBI1qfYr83sSKzzVIvzdhtBz/l7
	pK5NsOLka2Rfo4ACueq+hULeEhmgSPhSvMfrrnw7TxJ9nRelIdRFQYkxQwqn5bKg
	pgkb/IdCVbWxnUXUP2nv1L8/l+pEddXe5nQL7o+Yl/udRuc52QupuaqpStRE+Kji
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ur4ym12hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 03 Dec 2023 22:54:56 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 3 Dec 2023 22:54:58 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 3 Dec 2023 22:54:57 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH] libnma: remove conflict xml file
Date: Mon, 4 Dec 2023 14:54:52 +0800
Message-ID: <20231204065452.2829159-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DGRhKnYbBbRnmSPe3AeFQ_wPLk3lbQZa
X-Proofpoint-ORIG-GUID: DGRhKnYbBbRnmSPe3AeFQ_wPLk3lbQZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=755
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312040051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 06:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107199

From: Kai Kang <kai.kang@windriver.com>

The file org.gnome.nm-applet.gschema.xml conflicts with the one
provided by network-manager-applet, so remove it from libnma and use the
one from network-manager-applet.

| Error: Transaction test error:
|   file /usr/share/glib-2.0/schemas/org.gnome.nm-applet.gschema.xml conflicts
    between attempted installs of network-manager-applet-1.34.0-r0.core2_ 64
    and libnma-1.10.6-r0.core2_64

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
index bff9a3360..75b0418c3 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
@@ -27,3 +27,8 @@ EXTRA_OEMESON:append:riscv32 = " -Dvapi=false"
 EXTRA_OEMESON:append:powerpc64le = " -Dvapi=false"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
+
+do_install:append() {
+    # conflicts with the file provided by network-manager-applet
+    rm -f ${D}${datadir}/glib-2.0/schemas/org.gnome.nm-applet.gschema.xml
+}
-- 
2.34.1



Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14BAC4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 06:44:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.180671.1698734692765240094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Oct 2023 23:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jroKCGMU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96681f5ee0=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39V6JA0C006681
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 06:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=C5rqJ
	9sKmqAnLQ7p1k/hVPL8907Q0nPipv6XvALsJeM=; b=jroKCGMU5zQe4bZk/vh2C
	TKII7kr4EAlY99Ga0SFN46OqpAG1+WhsIeoBChmFnOY1q3FBijCltMB6zi7WduDX
	pcSaP78ezeo/qSUGPoJmRkJw51GiKUzvSEfXIVk+KHZ9dLQlkVVO8YLYJc7+R8mM
	Kv3tvrUGJMSkltAzZMXt8It6seFq1sQvbUT553Fc+wo9xja9KzwjNnSYPKtsZoYh
	YaThIe/npxe6S0BMe+DovgDHabqebl2BYz4ahynAtO0rYWXz2dnnlyYJy+b6UrRy
	H4kzpvwPW7VbwPxIVOhe66N8Elwo51PPolvP/SviMqlWoSLB0yzZc3G/jdf0WScp
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0s96b4hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 06:44:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 23:44:52 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 23:44:51 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] xfce4-panel-profiles: 1.0.13 -> 1.0.14
Date: Tue, 31 Oct 2023 14:44:46 +0800
Message-ID: <20231031064446.1155479-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mS6B2L3IJAJzy5O5ercrV_CA1k-PjoS8
X-Proofpoint-GUID: mS6B2L3IJAJzy5O5ercrV_CA1k-PjoS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=746 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310310051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 06:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105800

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfce4-panel-profiles from 1.0.13 to 1.0.14. Drop the patch that
it has dropped the creation of the link file already.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../not-create-link-to-locale.patch           | 22 -------------------
 ...0.13.bb => xfce4-panel-profiles_1.0.14.bb} |  6 ++---
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch
 rename meta-xfce/recipes-apps/xfce4-panel-profiles/{xfce4-panel-profiles_1.0.13.bb => xfce4-panel-profiles_1.0.14.bb} (81%)

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch
deleted file mode 100644
index b5421f6f7..000000000
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-It is useless to create a link to $(PREFIX)/share/locale that there is no
-reference to $(PREFIX)/share/$(APPNAME)/locale in source code.
-
-Upstream-Status: Submitted [https://bugzilla.xfce.org/show_bug.cgi?id=16693]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- Makefile.in.in | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile.in.in b/Makefile.in.in
-index c0ce866..c2f26fe 100644
---- a/Makefile.in.in
-+++ b/Makefile.in.in
-@@ -70,7 +70,6 @@ install: all xfce4-panel-profiles.1
- 	install data/metainfo/*.xml $(DESTDIR)/$(PREFIX)/share/metainfo
- 
- 	cp -rf locale $(DESTDIR)/$(PREFIX)/share
--	ln -sf $(PREFIX)/share/locale $(DESTDIR)/$(PREFIX)/share/$(APPNAME)/locale
- 
- 	install -d $(DESTDIR)/$(MANDIR)/man1
- 	install xfce4-panel-profiles.1 $(DESTDIR)/$(MANDIR)/man1
diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.14.bb
similarity index 81%
rename from meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
rename to meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.14.bb
index feb912160..38f6eb6eb 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.14.bb
@@ -9,10 +9,8 @@ REQUIRED_DISTRO_FEATURES = "x11 gobject-introspection-data"
 
 DEPENDS += "intltool-native"
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2 \
-           file://not-create-link-to-locale.patch \
-           "
-SRC_URI[sha256sum] = "bc387c13f94109422dc72b0fcb919b0dc11619ba589d03e492252b0d2513b170"
+SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "6d08354e8c44d4b0370150809c1ed601d09c8b488b68986477260609a78be3f9"
 
 do_configure() {
     # special configure - no autotools...
-- 
2.34.1



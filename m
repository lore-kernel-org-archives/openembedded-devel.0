Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82078EFCBA1
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28885.1773581757740886233
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ePGqwgdj;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=999; q=dns/txt;
  s=iport01; t=1773581759; x=1774791359;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HgxJD5koja6vJOYJbK0H7/DxkjMLHeAYZam4QDy2sEg=;
  b=ePGqwgdjFpbI9oSinn/vhYKBjmC4l8BBkT2ZsNq7hBvztuzIlYgz0N4c
   fIcZbu5YfprjJZOY5nqJOGR2aASkd/mcwxEMXLGNrKP41uiRgYsPu9Tw5
   inSOGCcfIM5BnqZeMzaW/fHsVuCdhZ9SIoiMEkqdGm0wSqVWJ3wIrxJhs
   cpUafvzQNkxWPj9Kvzbe4a9fIjkG5BWDhmqbnFAJMN9ugKitBej/tL/4I
   9HakevTt9n6CvXkxNU26T2Z78CzHQ4bvym3Lw7tJetbBTa5iEbCwKO3En
   V9MTAo8yt8s9HkmlhnhrcgXsfT8eQ7fTIUeKPbF3D9XEZDXMjnYtkhnXM
   Q==;
X-CSE-ConnectionGUID: laBuQFmQQNeOs8z6C4Yw0A==
X-CSE-MsgGUID: 7096naGPSbO/ZBOVH4mOwQ==
X-IPAS-Result: =?us-ascii?q?A0DaBQAatbZp/4v/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ8xIAQBAYUHAo0iAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbF9giyBAYMoAYFT2?=
 =?us-ascii?q?yYBCxQBgTiFPIgZdIR6JxsbgXKEB3aECoEGhXcEgiKBDoF/kS1IgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWFGg+IcnRtgRODLQMLGA1IESw3F?=
 =?us-ascii?q?BsEPm4HjXo9gjMBPVEBgUZoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaDyBW?=
 =?us-ascii?q?XAVgyIJSRkPjl/MfSM1PQEBBwIHDQMLgWiQAIF9AQE?=
IronPort-Data: A9a23:6cgMG68lkM1O821yeREBDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mQbWW+AMvmNMzCgKt52PYXi9RlQupWAx9RmGQA/qy9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsaTtJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kyNKcFw8hyOFho+
 NsDeCJTRUyymLqflefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FboqFIIPaGZsO9qqej
 j2erjr/Cz4iD9a4jgiv1UyM2uroghquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:kZoRAaweoQGakL3EYWwtKrPwLb1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 uJt8NFebvN5Z8Qt7ec3DWF
X-Talos-CUID: 9a23:0uQveW+vhoJ9oqvFCMeVv0odMN0cXHjk9VHdBFToGzhCFIyKEXbFrQ==
X-Talos-MUID: 9a23:M2zJGQkFERpHZK7p7OLTdno9bJY25a2BMHsHttI0ke66FXB1HCik2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="688278463"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id DB96218000222
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 43848CC8D5A; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 12/24] cunit: extend recipe for nativesdk builds
Date: Sun, 15 Mar 2026 06:34:29 -0700
Message-Id: <20260315133441.3034831-13-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125239

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require cunit to be available
as SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
nativesdk variant for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-oe/recipes-test/cunit/cunit_2.1-3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
index 75ba477757..ec8062b6a1 100644
--- a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
@@ -33,4 +33,4 @@ do_install_ptest() {
 FILES:${PN}-dev += "${datadir}/CUnit"
 FILES:${PN}-doc += "${docdir}"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6



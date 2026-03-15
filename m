Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6957EFCBA6
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28712.1773581757723641044
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aK3zK22d;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=934; q=dns/txt;
  s=iport01; t=1773581757; x=1774791357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PRAknTw3zD9LLk7wbZ5X69cc2ECMImWs5DfSFDaP3VI=;
  b=aK3zK22dgxFyJsaU8/jWC7zZ721q7uDiye6/4FzteNzUTNchi9cGBdBh
   hGDMilR2P6vopaPI2qhVoRiPL8jgWnQvoUlTEz2MpCU+P+j1GrkWqLIxI
   Hp0V3uPMZ8rv3wvW7b4pQyjkxaCEsOfYu1APiMfnPnziRfd044yAO+AQQ
   id0L014yIJHoH8qHOMNku7G2cK1LODekruEbiEAATVdCc2Szwk/Vcfe7Z
   aQI1WY+2QDPrT2JU/ONH+qC0j3GXwuxXxYl50FsNFo+4Kk1l+1gXVq/Vm
   M9clf3v36yjGSmJqmiDNnCGsvM4rXCXcNgWrTHaDeXcemDtXHk5hiQ0qy
   g==;
X-CSE-ConnectionGUID: 0TwytyllRjCYM9A1eqo/MA==
X-CSE-MsgGUID: 1/Su7AllT9+tE66hTaNawQ==
X-IPAS-Result: =?us-ascii?q?A0AjBwCjtLZp/4//Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ8xIAQBAYUHAo0iAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbF8giyBAYMoAYFT2?=
 =?us-ascii?q?yYBCxQBgTiFPIgZdIR6JxsbgXKEB3aFEIV3BIIigQ6TLEiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBCxsHBYUaD4hydG2BE4MtAwsYDUgRLDcUGwQ+b?=
 =?us-ascii?q?geNej2CMwE9UYFHaAEopXShDgoog3SMHpU6GjOqa5kGpFmEaIFpATqBWXAVg?=
 =?us-ascii?q?yIJSRkP21wjNQI7AQEHAgcNAwuBaJF9AQE?=
IronPort-Data: A9a23:LpHHyqM+GE9BOcvvrR31lsFynXyQoLVcMsEvi/4bfWQNrUor1DEGz
 2EXDD2Hb/beajbwKdt3YISw9UMEvJGAndJmQXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf+gmMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj661SE1AqLIkcwORcMEQf3
 KUVMTdKSznW0opawJrjIgVtrt4oIM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzN3wsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQvgea0b4SMJYziqcN9xwGju
 z3v+2DFU1IGGYLByQaM1Huzv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:KSRhza5t9JOlcJmk3APXwMnXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5gPW
 MKSdkZNDU2ZmIK6vrH3A==
X-Talos-CUID: =?us-ascii?q?9a23=3A9uoulWhNxl+iTW87awcYnMNSCjJuKkHC3WvBJ0u?=
 =?us-ascii?q?CC01Ybey8EFKJ/+RBup87?=
X-Talos-MUID: 9a23:nfEz/AXRF+7XaLbq/Garvyw9HcNs3/XtFG1Tz5U6su+NKhUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="696176178"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id D959B18000267
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 3FD52CC8D59; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 11/24] audit: extend recipe for native builds
Date: Sun, 15 Mar 2026 06:34:28 -0700
Message-Id: <20260315133441.3034831-12-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125227

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require audit to be available
as host artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native variant for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-oe/recipes-security/audit/audit_4.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.1.3.bb b/meta-oe/recipes-security/audit/audit_4.1.3.bb
index 12636045d4..c91572d48a 100644
--- a/meta-oe/recipes-security/audit/audit_4.1.3.bb
+++ b/meta-oe/recipes-security/audit/audit_4.1.3.bb
@@ -104,3 +104,5 @@ do_install:append() {
 }
 
 CVE_PRODUCT = "linux:audit"
+
+BBCLASSEXTEND += "native"
-- 
2.35.6



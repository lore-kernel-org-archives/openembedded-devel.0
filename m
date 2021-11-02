Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5C7C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:51:52 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.2348.1635879111333277362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=AtNJUDEP;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635879112;
  x=1667415112;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fLmOitqbEv9UwXCfmPDbY0Ln7Ht/hBCkgfDDXDkF4Nk=;
  b=AtNJUDEPLINfCAm9TGRkONA6I1DlPiZXKo1hG/iZ4yjTJ96pngSWaQnZ
   pn+ppYXvwREGuP0oYFQchVD3ThW+n2hYb2zkMV9EuLoVD7+RerA6CFXcJ
   NrJfwLSkVPv6Qty3/d7KevB4zo66gYweJ/UX98gObz4jieNAq6ODBLbED
   MhNdoZ+EmpF0j1I+rzsi/NRDgQXkkR8HU3GjM+shoVZwkblqSvA2no3/e
   rsVbQhv1YhyZ3rlUGaIkwzNhqfFGCSpRLTMEtTZuRebc5bo9rmy/2xqDl
   HzXJ9Hrj23yo2N5I3xKcTkxCoeueqLRGi8D7i0/eDc86U61jzZPA66cdr
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe,meta-networking][PATCH 4/8] atop: Do not install the
 /var/log/atop directory
Date: Tue, 2 Nov 2021 19:51:40 +0100
Message-ID: <20211102185144.13556-4-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211102185144.13556-1-pkj@axis.com>
References: <20211102185144.13556-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 18:51:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93790

/var/log is normally a link to /var/volatile/log and /var/volatile is a
tmpfs mount. So anything created in /var/log will not be available when
the tmpfs is mounted.

/var/log/atop will be created in runtime.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/atop/atop_2.4.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/atop/atop_2.4.0.bb b/meta-oe/recipes-support/atop/atop_2.4.0.bb
index c91d86610..819303c57 100644
--- a/meta-oe/recipes-support/atop/atop_2.4.0.bb
+++ b/meta-oe/recipes-support/atop/atop_2.4.0.bb
@@ -42,6 +42,10 @@ do_install() {
         rm -f ${D}${sysconfdir}/init.d/atopacct
     fi
 
+    # /var/log/atop will be created in runtime
+    rm -rf ${D}${localstatedir}/log
+    rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
+
     # remove atopacct related files
     rm -rf ${D}${sbindir} ${D}${mandir}/man8
 }


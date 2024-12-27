Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313EEE7718F
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:57:50 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.11074.1735297060424576841
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:57:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lw4shqMe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202412271057418b3c13a4f659286a5c-9xdoi6@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412271057418b3c13a4f659286a5c
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:57:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NTYHsXBf8zAhZ4jQ4kF2oIF+qacHczVSJQLUz8olCWY=;
 b=lw4shqMeB8HNeGnnU1EGvcNg607yGf4q+73l0LC4L5fVrJO3c29Jw6Cd4ioUubebASIzlW
 yzAAgr6gxI5ZxQo2wKTlvESDFq4ApsgmOImlSHFRtGD5km90ewgI1dFE2di3kaK9EZ08QKwi
 bKOSE+L9Fnod9SzTz5Y8VptbWLrmiIQO4jQFMi6gqaFJsl5TnSFq8uCw8+ur4YWwYRU+sGrF
 KtJ7g/UU/nODziqzgRpBNv6YNCyARaJM4ReyoI9GfCizx+YyYb01st07eeY1StnPxTKiCick
 NbaMYEgWPBoslaD9ySbOkmDzCnqHF2ey1yuofL+h04+YwkJt5uAWlNCg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 05/15] procmail: patch CVE-2017-16844.
Date: Fri, 27 Dec 2024 11:56:05 +0100
Message-Id: <20241227105615.3303193-6-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114563

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian.
https://sources.debian.org/data/main/p/procmail/3.22-26%2Bdeb10u1/debian/patches/30

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../procmail/procmail/CVE-2017-16844.patch    | 20 +++++++++++++++++++
 .../recipes-support/procmail/procmail_3.22.bb |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch

diff --git a/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch b/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
new file mode 100644
index 0000000000..6e04989c33
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
@@ -0,0 +1,20 @@
+From: Santiago Vila <sanvila@debian.org>
+Subject: Fix heap-based buffer overflow in loadbuf()
+Bug-Debian: http://bugs.debian.org/876511
+X-Debian-version: 3.22-26
+
+CVE: CVE-2017-16844
+Upstream-Status: Inactive-Upstream [lastrelease: 2001]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/src/formisc.c
++++ b/src/formisc.c
+@@ -103,7 +103,7 @@
+ }
+ 							    /* append to buf */
+ void loadbuf(text,len)const char*const text;const size_t len;
+-{ if(buffilled+len>buflen)			  /* buf can't hold the text */
++{ while(buffilled+len>buflen)			  /* buf can't hold the text */
+      buf=realloc(buf,buflen+=Bsize);
+   tmemmove(buf+buffilled,text,len);buffilled+=len;
+ }
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index efe716ea51..59b78c0a6a 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://from-debian-to-fix-man-file.patch \
     file://man-file-mailstat.1-from-debian.patch \
     file://CVE-2014-3618.patch \
+    file://CVE-2017-16844.patch \
 "
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
 
-- 
2.30.2



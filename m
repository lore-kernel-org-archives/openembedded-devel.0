Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BF3E77192
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:57:50 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.11074.1735297060424576841
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:57:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=tc2fyMHr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202412271057360bd0aeebc1b1072f4d-g6zipe@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412271057360bd0aeebc1b1072f4d
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:57:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=M4smZcIhKYD+dzJj9QSfFyax/TfP0NjeLhi44PXylFM=;
 b=tc2fyMHrSDymj/iTXQV5ZdQWUApL6kP9gm86pceKZFNMcZ77sedI4Hyb2zkQyflpFFPPl4
 w/6AWrHrFJMIORIn8dCt1n4Zm29ZSZeShUWZRd78x+znd2a/BushsgynKiUrVcqb3irpHRDA
 lln+msROuU0MOACSCSvCMeHQFjzd6hZJUbaFIlJggHxA3KvfZgxW8bZ8TcZPLYSjJRJ3+0rl
 NW4kaXfwwQs6s0Vq/3DuQ5z3ZKYqcP0974LloQnmlvf6MDX1B0DfhS9eHCdCeyIyNm5hub8x
 /nSMqwU8ucJIXCTQzMFZRRrAFdeE2N14jbyd2pVsSgklJqbpswHAE2Mg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 04/15] procmail: patch CVE-2014-3618
Date: Fri, 27 Dec 2024 11:56:04 +0100
Message-Id: <20241227105615.3303193-5-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114562

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian.
https://sources.debian.org/data/main/p/procmail/3.22-20%2Bdeb7u1/debian/patches/CVE-2014-3618.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../procmail/procmail/CVE-2014-3618.patch     | 29 +++++++++++++++++++
 .../recipes-support/procmail/procmail_3.22.bb |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch

diff --git a/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch b/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
new file mode 100644
index 0000000000..b041924361
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
@@ -0,0 +1,29 @@
+Description: Fix heap-overflow in formail
+ CVE-2014-3618: Heap-overflow in formail when processing
+ specially-crafted email headers.
+Origin: http://www.openwall.com/lists/oss-security/2014/09/03/8
+Bug-Debian: https://bugs.debian.org/704675
+Bug-Debian: https://bugs.debian.org/760443
+Forwarded: not-needed
+Last-Update: 2014-09-04
+
+CVE: CVE-2014-3618
+Upstream-Status: Inactive-Upstream [lastrelease: 2001]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/src/formisc.c
++++ b/src/formisc.c
+@@ -84,12 +84,11 @@ normal:	   *target++= *start++;
+ 	case '"':*target++=delim='"';start++;
+       }
+      ;{ int i;
+-	do
++	while(*start)
+ 	   if((i= *target++= *start++)==delim)	 /* corresponding delimiter? */
+ 	      break;
+ 	   else if(i=='\\'&&*start)		    /* skip quoted character */
+ 	      *target++= *start++;
+-	while(*start);						/* anything? */
+       }
+      hitspc=2;
+    }
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 3623bd7776..efe716ea51 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -12,7 +12,9 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://from-debian-to-fix-compile-errors.patch \
     file://from-debian-to-modify-parameters.patch \
     file://from-debian-to-fix-man-file.patch \
-    file://man-file-mailstat.1-from-debian.patch"
+    file://man-file-mailstat.1-from-debian.patch \
+    file://CVE-2014-3618.patch \
+"
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
 
 LICENSE = "GPL-2.0-only & Artistic-1.0"
-- 
2.30.2



Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37573E77191
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:57:30 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.11066.1735297042544966650
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=c/qe+EoY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202412271057206379a10f67b0e55381-ajqyzl@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202412271057206379a10f67b0e55381
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:57:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=H884qaZQW2s9j9NViL+eYLjhSUk4ZM+EFWnY9MU0jDg=;
 b=c/qe+EoYSygU8Q7FyzmNqKV+wwJA0HZnkgh0ZK6T1IO18G0YE3SUt6St+JbAQNTd8Lpm65
 vfNSSRws+GYFywfzRvuhV9bhd7lzMsNmE7iIlmkXRssYcjTqgudiwFc6kVpibGnL2DM2ysEd
 7EUnBIw9s0APrXUWpU2HR+Q6ORYdV+vgF//tpD4NpgHZBX7hhUxRwCG7jrA3A6NK3EK0qc9M
 C1a4Zo16sWzbVNlYNKFRchKvq8e5NntRJHuuwkqhniDn16Bw6ExzQ6ic2YbLelEiBUkzCZFv
 VJyPSRwYcHKG0yybNZM1EUXoZ5LBWYWoEYf3sZJjmJ0Hp03/Ca7I96OQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 01/15] uw-imap: patch CVE-2018-19518
Date: Fri, 27 Dec 2024 11:56:01 +0100
Message-Id: <20241227105615.3303193-2-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114559

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian from
https://salsa.debian.org/lts-team/packages/uw-imap/-/commit/873b07f46ce40f43bca10ec85fe63a7a0b934294

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../uw-imap/uw-imap/CVE-2018-19518.patch      | 24 +++++++++++++++++++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch
new file mode 100644
index 0000000000..d942a752b3
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch
@@ -0,0 +1,24 @@
+uw-imap (8:2007f~dfsg-6) unstable; urgency=medium
+
+  * [CVE-2018-19518] 2013_disable_rsh.patch (new): Disable access to IMAP
+    mailboxes through running imapd over rsh, and therefore ssh (Closes:
+    #914632). Code using the library can enable it with tcp_parameters()
+    after making sure that the IMAP server name is sanitized.
+
+ -- Magnus Holmgren <holmgren@debian.org>  Tue, 26 Feb 2019 23:35:43 +0100
+
+CVE: CVE-2018-19518
+Upstream-Status: Inactive-Upstream [lastrelease: 2007]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/src/osdep/unix/Makefile
++++ b/src/osdep/unix/Makefile
+@@ -988,7 +988,7 @@ onceenv:
+ 	 -DMD5ENABLE=\"$(MD5PWD)\" -DMAILSPOOL=\"$(MAILSPOOL)\" \
+ 	 -DANONYMOUSHOME=\"$(MAILSPOOL)/anonymous\" \
+ 	 -DACTIVEFILE=\"$(ACTIVEFILE)\" -DNEWSSPOOL=\"$(NEWSSPOOL)\" \
+-	 -DRSHPATH=\"$(RSHPATH)\" -DLOCKPGM=\"$(LOCKPGM)\" \
++	 -DLOCKPGM=\"$(LOCKPGM)\" \
+ 	 -DLOCKPGM1=\"$(LOCKPGM1)\" -DLOCKPGM2=\"$(LOCKPGM2)\" \
+ 	 -DLOCKPGM3=\"$(LOCKPGM3)\" > OSCFLAGS
+ 	echo $(BASELDFLAGS) $(EXTRALDFLAGS) > LDFLAGS
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 6df54ee185..54d33379da 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://0001-Fix-Wincompatible-function-pointer-types.patch \
            file://uw-imap-newer-tls.patch \
            file://uw-imap-fix-incompatible-pointer-types.patch \
+           file://CVE-2018-19518.patch \
            "
 
 SRC_URI[sha256sum] = "53e15a2b5c1bc80161d42e9f69792a3fa18332b7b771910131004eb520004a28"
-- 
2.30.2



Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DB8E77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 12:45:53 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.32715.1735044346327733638
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 04:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WraM3iE0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20241224124543a5e7489e126fc35a78-1fvrdq@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20241224124543a5e7489e126fc35a78
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 24 Dec 2024 13:45:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=iJ4FLbnv6MdjsfgG8hie+aI8epkdDLMHzZURN/RKWKY=;
 b=WraM3iE0X4T5udDwbc0SPcvncnT4p9zjGGnJvkW+lVjYkMtysJG/0275Fz+EQjqMPbmlt1
 +W3qmskQIpnsOig6bp6rMjaqazqf57bSCOLGUxRKC6xn5F6xXD6FzQQsk6f0f48ARLBrfD6P
 oDbM5DE8FfRzUbpVPxXd5EhpL3ZzQEHxYli8dCsvkkzX5ZXNsok8NVv/BHZxULtq0a7P5RPN
 J8ONWh3arHTAHja4AtINyapm2z/qU1j6XfR3HzC5sEAvaU8MxXK2Cw22YjyrN0Pys6RB1Mca
 pIeGn/rFE5mfoSHip74gZsE2x0TacFhSFJq5wW2YftyBIGamCWN7f5rQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 4/6] libconfuse: patch CVE-2022-40320
Date: Tue, 24 Dec 2024 13:44:15 +0100
Message-Id: <20241224124417.2547005-5-peter.marko@siemens.com>
In-Reply-To: <20241224124417.2547005-1-peter.marko@siemens.com>
References: <20241224124417.2547005-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 12:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114545

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] poiting to [2] pointing to [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-40320
[2] https://github.com/libconfuse/libconfuse/issues/163
[3] https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libconfuse/files/CVE-2022-40320.patch     | 42 +++++++++++++++++++
 .../libconfuse/libconfuse_3.3.bb              |  1 +
 2 files changed, 43 insertions(+)
 create mode 100755 meta-oe/recipes-support/libconfuse/files/CVE-2022-40320.patch

diff --git a/meta-oe/recipes-support/libconfuse/files/CVE-2022-40320.patch b/meta-oe/recipes-support/libconfuse/files/CVE-2022-40320.patch
new file mode 100755
index 0000000000..52296b9c0f
--- /dev/null
+++ b/meta-oe/recipes-support/libconfuse/files/CVE-2022-40320.patch
@@ -0,0 +1,42 @@
+From d73777c2c3566fb2647727bb56d9a2295b81669b Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Fri, 2 Sep 2022 16:12:46 +0200
+Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+
+CVE: CVE-2022-40320
+Upstream-Status: Backport [https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/confuse.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/confuse.c b/src/confuse.c
+index 6d1fdbd..05566b5 100644
+--- a/src/confuse.c
++++ b/src/confuse.c
+@@ -1872,17 +1872,20 @@ DLLIMPORT char *cfg_tilde_expand(const char *filename)
+ 			file = filename + 1;
+ 		} else {
+ 			/* ~user or ~user/path */
+-			char *user;
++			char *user; /* ~user or ~user/path */
++			size_t len;
+ 
+ 			file = strchr(filename, '/');
+ 			if (file == 0)
+ 				file = filename + strlen(filename);
+ 
+-			user = malloc(file - filename);
++			len = file - filename - 1;
++			user = malloc(len + 1);
+ 			if (!user)
+ 				return NULL;
+ 
+-			strncpy(user, filename + 1, file - filename - 1);
++			strncpy(user, &filename[1], len);
++			user[len] = 0;
+ 			passwd = getpwnam(user);
+ 			free(user);
+ 		}
diff --git a/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb b/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
index e6f28c7b69..0e2f1f27b3 100644
--- a/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
+++ b/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
@@ -6,6 +6,7 @@ SRC_URI = "https://github.com/libconfuse/libconfuse/releases/download/v${PV}/con
 SRC_URI[sha256sum] = "3a59ded20bc652eaa8e6261ab46f7e483bc13dad79263c15af42ecbb329707b8"
 
 SRC_URI += "file://0001-only-apply-search-path-logic-to-relative-pathnames.patch"
+SRC_URI += "file://CVE-2022-40320.patch"
 
 inherit autotools-brokensep pkgconfig gettext
 
-- 
2.30.2



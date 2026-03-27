Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D2D10ED651
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:38 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68400.1774605570190847798
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 02:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Wa1iynaJ;
 spf=pass (domain: mvista.com, ip: 209.85.210.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8296dabef74so1889982b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 02:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774605569; x=1775210369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBfiG8nSUV6+Z2mJOYOT2f1ZUJ53dv2pDE9cLMjo/48=;
        b=Wa1iynaJmcGaSS58lbYOY3OKii8/zPgyT+OBsTlhhect5MDSRGVZwsjJ20SWdeaKlb
         4dP9p/C4Z7sTRUwnAuxFbP/BLK5eV8biwqtFekjqt/lkef+W9c6l+sk9uG3emghTuh6r
         uftSnfL5S7KFzGBUb5ND/gYln7boIITmf9UtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605569; x=1775210369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBfiG8nSUV6+Z2mJOYOT2f1ZUJ53dv2pDE9cLMjo/48=;
        b=JGHwNJiLKrLTHQH0Ky8yceYZEEnzNj4DP46+IOB2Ayl1q5gpASGZcjhZEjFMpWTkMB
         79503KdUubtZQ/vzz+iZ/ZWrO0BsKX9AXbDuvnuCb/NaJ+rt1VrOzI+6og4fIP/t65Q/
         qZYzmJTM2cTXfjRrH1gv4o0+Er9HcygUV4Du00fmu/lVXklvf2KebNkEcoPXS2qAC5Cu
         Bmg2iYkO888SfFhkSTfConxDVsh4qOYFoo67+c5X0JupeIHhB48Td6XZE7p/99z9W0tE
         g406EY9MB9P1FbZbAcNCS/1UtuWRNZBz09TDidBN1woPYFXfWHJrG9bNxH9ISE7ULQ6Y
         r0ow==
X-Gm-Message-State: AOJu0Yxb9Nd2VlQcumIiKFvnppL41V6EBvj7nFUrjfLLUOVLGkvx4aCb
	Y/KuaOmi3ODqIZ4tZ2z41wyV0vH1311bSHVBp2fP/91iX3uLbhVyFjOiMAcPHh+sJyqzWi0KJfp
	nPVaBvew=
X-Gm-Gg: ATEYQzz3vdi6+DJp0Z/BsiUPPEHDFAyHPyTB1Z5XW6IyTsOw0TpDsnEL74sCdezL3qe
	XemKRVz20P4X/HGgLE+TTqICIHS9ZZ9ap4AzXKuiPhEZPlxdf7EmlSuN/7AG8VGBfis+LCp9Ye7
	85vjRv8PIw9rQN6uJxInb/LtuyXIjr113Ue9sTHA/xi23+WRtMn7+E8nPE9nKDxXB38IYpdFbBF
	eidhTJskoCEzsTFuSsm8WiA++cz6VjYm97HKtKzXUGWtTvSlPHaNQHPlVTtubBtQMIBA8pSAFaC
	W5WgWhMz/nflQLPr4qOYvDA4VUrTUwbj//rSs1pi1ASfSUaNuVGGf9whP47V45KDeQokkB8kDLb
	tAjRdE91VgeuC247E4Y/TYB1dDh178j3aqrGVjYWcy5ZaiEFGqEOAgP1v9OHkzl5OO3Fz7sW9ZD
	VsI4aAHTWdKsvN9gfLxcB7C0vH3ypywKkq4p0K
X-Received: by 2002:a05:6a00:2d0f:b0:827:4372:dd15 with SMTP id d2e1a72fcca58-82c95ef3c59mr1920815b3a.40.1774605569049;
        Fri, 27 Mar 2026 02:59:29 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:d28a:4e57:2e4f:db70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d400f62sm4695453b3a.55.2026.03.27.02.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:59:28 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH 2/2] libssh: Fix CVE-2026-0964
Date: Fri, 27 Mar 2026 15:29:04 +0530
Message-Id: <20260327095904.54402-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260327095904.54402-1-vanusuri@mvista.com>
References: <20260327095904.54402-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 09:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125785

From: Vijay Anusuri <vanusuri@mvista.com>

Pick commit according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-0964
[2] https://www.libssh.org/security/advisories/CVE-2026-0964.txt

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh/libssh/CVE-2026-0964.patch         | 46 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch
new file mode 100644
index 0000000000..7ad76c6e5e
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch
@@ -0,0 +1,46 @@
+From a5e4b12090b0c939d85af4f29280e40c5b6600aa Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 22 Dec 2025 19:16:44 +0100
+Subject: [PATCH] CVE-2026-0964 scp: Reject invalid paths received through scp
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit daa80818f89347b4d80b0c5b80659f9a9e55e8cc)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=a5e4b12090b0c939d85af4f29280e40c5b6600aa]
+CVE: CVE-2026-0964
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/scp.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/scp.c b/src/scp.c
+index 652551e3..4590cf79 100644
+--- a/src/scp.c
++++ b/src/scp.c
+@@ -738,6 +738,22 @@ int ssh_scp_pull_request(ssh_scp scp)
+         size = strtoull(tmp, NULL, 10);
+         p++;
+         name = strdup(p);
++	/* Catch invalid name:
++	 *  - empty ones
++	 *  - containing any forward slash -- directory traversal handled
++	 *    differently
++	 *  - special names "." and ".." referring to the current and parent
++	 *    directories -- they are not expected either
++	 */
++	if (name == NULL || name[0] == '\0' || strchr(name, '/') ||
++	    strcmp(name, ".") == 0 || strcmp(name, "..") == 0) {
++	    ssh_set_error(scp->session,
++			  SSH_FATAL,
++			  "Received invalid filename: %s",
++			  name == NULL ? "<NULL>" : name);
++	    SAFE_FREE(name);
++	    goto error;
++	}
+         SAFE_FREE(scp->request_name);
+         scp->request_name = name;
+         if (buffer[0] == 'C') {
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 8cc0883b2b..387720f7dd 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-3731.patch \
            file://CVE-2026-0966-1.patch \
            file://CVE-2026-0966-2.patch \
+           file://CVE-2026-0964.patch \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
-- 
2.25.1



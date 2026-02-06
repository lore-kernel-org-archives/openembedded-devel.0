Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76E3EB28ED
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:21:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6908.1770366052793254765
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:20:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K8p+Ab9Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-435f177a8f7so422748f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 00:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770366051; x=1770970851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVPzcy1F7yZLy9MMl6UK5SI5n2uJHnM50Grdo/WIloM=;
        b=K8p+Ab9Z9otPSN+HX15pN4rjIriiqmQpEhSxGe05w0poWHb9kvxY37jTK6QL1d+EWu
         21Wb0v8rxNa3cnP+GMVmY+bbt9L9s3t4ZuzGT0SEXOVT3jm1o+xmOwQVBnMSieCnfn31
         ON+dhDUj2ncoPFEx3aQJaAM17UhZGR9Z4hq/QElIivYVYSx1Tr52AZ0dbPhjJ+ftk/Su
         yYAVdbm5mqhgRDto4PhR/KAsxhKIsHbLP2h2kOdvT3fwV0/iJp8Q59bnAOFoqQz0zIrt
         h4Kgtb39y5pJ4yqLmWjtYbfwrFjkMS805vkxcBNzaN/ZTXLKOiXmN/sE95sA7PVsC8o5
         viNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770366051; x=1770970851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MVPzcy1F7yZLy9MMl6UK5SI5n2uJHnM50Grdo/WIloM=;
        b=SjwhVxLQcGvSIMHTDi7AeOuc5lNG+Cfmbl6HijxIkRAW+vx1/4+NpAS9Anfagq7nF1
         lTgQ1Wuq/QIpnzuxO2GBjYXs6rE2MK2fy9K7ppzbYOObfcb4B/IS67Sy6YpbTb/L9TPH
         3Sh+nOcX0mFGWF6E2bOgXVImMjVRqQXnuHRGkQLHaxsYa5Su8OEo5JNZ0MpSWKj3MGsn
         LNzcbDFIV1SvYy5BYfVcDEhMp2HUvK20+CCnVKbNVAlwV1mH1msuNow7GN6ZRKyaUR3w
         KCcvqzY1+PWqroY7uR1D3qu3jxjpBgWYEIxuOwTiu2s3gLkuD3hltwpKVb9fB1bneGRB
         gWPw==
X-Gm-Message-State: AOJu0Yz9Kk9JCHqyjqpQDUqiLoih8W1ccnVjbyg7uEovG1t8/2kl4zMB
	wDNudLNnMNOKWXJYHqIT8ZBdSk2ZDIQ08f1lTZV6bVAPWC5DUcs4O0ZMDTbuRw==
X-Gm-Gg: AZuq6aLwClTZqMLZIo+rXg8+4qK3dYeL8qmK7GBfrZimFVHQU1uncUGCp1qi3HDee59
	gkSh8sKXgTxQmsJg/AruZ0FmUdPAU2f+lC86M5XP4DgtAiN3FZ1zRJqDD1b69KzJl3rbcBtw9ci
	SezQumP2g/7kR0Zk3dteVXH8xJbXUowNTsQpsDQcHAAqHpF8l4OVfHNtpY4zb+ZgAglAMzOO430
	zPUQZvcGgmz54LpATSz0RoVeARIYXSWLvWDOhTf1s9GWYtbBKaofnzdGj8N6+8yMhGf1lootkeg
	cYK6Qpc1NvcN1YpQk3+5sptICW3ZmHQi83W1oOhEJwVXea0/ba6kNE0UH3LlvYF7sxDbVc7Z5Ad
	7FwdsOBSpY8o2arnvQlgpt2ERZ+M0tS4etBERTQ9v1UQBoXB6J15XEZ9ZoQUyrnWzd0cAF2CwHm
	vK8yUNGt2z
X-Received: by 2002:a5d:588b:0:b0:432:5b81:480 with SMTP id ffacd0b85a97d-43629341fdbmr3049011f8f.24.1770366051083;
        Fri, 06 Feb 2026 00:20:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362975ac28sm4332200f8f.42.2026.02.06.00.20.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:20:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 4/8] fontforge: patch CVE-2025-15270
Date: Fri,  6 Feb 2026 09:20:44 +0100
Message-ID: <20260206082048.1442403-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206082048.1442403-1-skandigraun@gmail.com>
References: <20260206082048.1442403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124233

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15270

Pick the patch that mentions this vulnerbaility explicitly
in its description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 15f2f350cc3c170cb016f824fbccfe2426307abc)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15270.patch  | 44 +++++++++++++++++++
 .../fontforge/fontforge_20230101.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
new file mode 100644
index 0000000000..335aa3f9a2
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
@@ -0,0 +1,44 @@
+From 647e17c1313b0be5159616e4345e6007e1f377a5 Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Sat, 31 Jan 2026 21:23:41 +0100
+Subject: [PATCH] Fix CVE-2025-15270: Heap buffer overflow in SFD kern class
+ parsing (#5743)
+
+Fixes: CVE-2025-15270 | ZDI-25-1194 | ZDI-CAN-28563
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15270
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/d01333a5bfa2ac4ed698c24b323d02107deacad7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/sfd.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/fontforge/sfd.c b/fontforge/sfd.c
+index 894176254..3692973fe 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -8286,6 +8286,10 @@ bool SFD_GetFontMetaData( FILE *sfd,
+ 	for ( i=classstart; i<kc->first_cnt; ++i ) {
+ 	  if (kernclassversion < 3) {
+ 	    getint(sfd,&temp);
++	    if (temp < 0) {
++	      LogError(_("Corrupted SFD file: Invalid kern class name length %d. Aborting load."), temp);
++	      return false;
++	    }
+ 	    kc->firsts[i] = malloc(temp+1); kc->firsts[i][temp] = '\0';
+ 	    nlgetc(sfd);	/* skip space */
+ 	    fread(kc->firsts[i],1,temp,sfd);
+@@ -8303,6 +8307,10 @@ bool SFD_GetFontMetaData( FILE *sfd,
+ 	for ( i=1; i<kc->second_cnt; ++i ) {
+ 	  if (kernclassversion < 3) {
+ 	    getint(sfd,&temp);
++	    if (temp < 0) {
++	      LogError(_("Corrupted SFD file: Invalid kern class name length %d. Aborting load."), temp);
++	      return false;
++	    }
+ 	    kc->seconds[i] = malloc(temp+1); kc->seconds[i][temp] = '\0';
+ 	    nlgetc(sfd);	/* skip space */
+ 	    fread(kc->seconds[i],1,temp,sfd);
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index b1e5ba0b63..da764538c3 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://CVE-2025-15279-2.patch \
            file://CVE-2025-15275.patch \
            file://CVE-2025-15269.patch \
+           file://CVE-2025-15270.patch \
            "
 
 S = "${WORKDIR}/git"


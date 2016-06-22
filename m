Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7FBEF60621
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 17:16:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a66so3238151wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jhWImFUcH5ijf8hKO0P1yQIel6NUQ9ttFtblTjAO8YE=;
	b=btV21xZLVJCqgz2U5UJVx+TwlPBq6gGw97R6VxZiuWqQJ0p5e7IPAVAc9aQSlcH9S5
	YBHDIxOPoFyJlovKw6S/BEfI+iEx+q8foR6IGwjZYwCJg4Kp6z3aWwKV7wB1zOno0ULx
	WLktbjdPnEX/lRsnOX+6KoTc1R6MbzkfUdj8ngHaeOaINnEWGwDyJbJ+htztR8Fe8TE2
	XH3bxO+vBOTEZdTk1Zu0YnvuhT/cGqMBObwouwicHnG6nvA0lFxXmVRCCxpXSctr5gll
	fuMLlF79CdIrxlL9YFYPdL+RgN4lahnfFqIQ+HOR/fHLwcJVf64Oymh1oRPRuySXtXzp
	TzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jhWImFUcH5ijf8hKO0P1yQIel6NUQ9ttFtblTjAO8YE=;
	b=f/U9uneaI10+woAY/88sVwUFdfSnR9bfNwkMJQocAluKRxecOv26Jgsz1pcAutu6Fj
	iC8TZUThAvsL6PNLHNcrHcHPJHO0t6E4L4wcHDrVXL+WKj22RYWOEVrbYfnEXdzecuJS
	JVMwg8JB/2PUL09FTXN8O+S/Gt5Ch2btn9uwZejWmvv1jajTXaqLEohvA3Doah7XOmTH
	jMHG5CBHE6Brmg2/j56h6ax8AtkfPp7LfQkWjBwXyhodEdaHpMdFcesSa1hBx9+lA7eL
	FMtbBLv3XZTtqSi93Hk8EOP9XL63n2YDR7EBsiTB9kUPWRD//sRcrjb4MilDKYQoIBh8
	un/g==
X-Gm-Message-State: ALyK8tLfh5USqaMjWdXK+yzQoyRbe7w+Eqk6oDv+4cFHo4//mp1rgLZaTkvZUk1wy3ipng==
X-Received: by 10.194.65.5 with SMTP id t5mr12569873wjs.35.1466615819715;
	Wed, 22 Jun 2016 10:16:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id yr4sm321767wjc.18.2016.06.22.10.16.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jun 2016 10:16:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jun 2016 19:17:18 +0200
Message-Id: <20160622171718.8664-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160622152337.437-1-Martin.Jansa@gmail.com>
References: <20160622152337.437-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-xfce][PATCHv2] packagegroup-xfce-base, toscoterm, xfce4-terminal: blacklist because of vte
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2016 17:16:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb             | 4 ++++
 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb  | 4 ++++
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
index 24f813b..a68012a 100644
--- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
+++ b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
@@ -25,3 +25,7 @@ do_install() {
 }
 
 RDEPENDS_${PN}_append_libc-glibc += "glibc-gconv-ibm437"
+
+# http://lists.openembedded.org/pipermail/openembedded-core/2016-June/122916.html
+# http://errors.yoctoproject.org/Errors/Details/69556/
+PNBLACKLIST[toscoterm] ?= "BROKEN: not compatible with vte 0.44.1, needs 0.28.2"
diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
index 1049b27..b0bce96 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
@@ -10,3 +10,7 @@ FILES_${PN} += "${datadir}/xfce4 \
 
 SRC_URI[md5sum] = "6a2816d8b0933cd707ed456ceb731399"
 SRC_URI[sha256sum] = "912f4716c2395a14a80620ef982b4af1e2a67a8df9a1ef0b802ecae826057e08"
+
+# http://lists.openembedded.org/pipermail/openembedded-core/2016-June/122916.html
+# http://errors.yoctoproject.org/Errors/Details/69552/
+PNBLACKLIST[xfce4-terminal] ?= "BROKEN: not compatible with vte 0.44.1, needs 0.28.2"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 28cfc7f..1fa5011 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -33,3 +33,5 @@ RDEPENDS_${PN} = " \
     thunar \
     thunar-volman \
 "
+
+PNBLACKLIST[packagegroup-xfce-base] ?= "Depends on broken xfce4-terminal"
-- 
2.9.0



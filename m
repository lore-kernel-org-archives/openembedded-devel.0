Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id ACA9A75593
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:26 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 59-v6so3201254plc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bfZPXiUwqiv8/ksjHTbTABJQM4XerECWt2lxfTJCKnE=;
	b=Pwhg9/GeBhq2HynQcbanFkiPnnMu9+M60X64sQtF9z9l0EfLTcqVpK9oHv8fbCrpep
	yj00xSotkO3D92oKb+vOFSOSVUdhmMCoFrSCfL8w/o4uzl72isw+pWJz0uwVZuv8TCan
	XE6c10bPYJHavFR6YT7bN3gdSesbg4Qq/l5vilqH2wyIg4aiY6Z3QXYHT5iM56hERAXf
	SB09ASbjIHcfOoFPkBWTrNZF0ZwYfniA4kgS8238ORqMv4O2YMFR6MZbyUJHjTQvWd6W
	jW/WDJfUW2/y3mw/6Ad5MWXX85r3YVh2J5Q6l8YiUkIXh5h52WpTnuUEhyL7qR7EFCCR
	2COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bfZPXiUwqiv8/ksjHTbTABJQM4XerECWt2lxfTJCKnE=;
	b=cz0Lm1dX1EgKpmNXAp12HmDjtD8T4I5zyAjQ+dXZHWJDid7ZKc20m5Rabs194MDpDK
	jsnpCMztWvzlkmkMVWggWhYQT7i64XIEPUS9cR8cPb+g9dAH1wLdLlP7bH31falAXBnO
	JttT5pUqYccpHiRP62T6S219uGbFu0GgwrUT0v/BwuF8Wi+fjyd+yNVKYOGE2DPkniBB
	bscsZXzVhlsOAgLJawZjd5qNcvIX2cOv/7cubuzz1188QS+ouD79R80HOI/bSQlREyfa
	buIZsuq5gJiE41j+/fCF/qnZC1hAr0WhZogMh7N+Mkx7xSK2GsCxjNUaIw9Twe+3pDuC
	9rZA==
X-Gm-Message-State: ALQs6tDA25y9gOFgBhGYhbIQEQCHC6FpyV5+CNYNLW6/3o8i7ra3JDyK
	p+zN5bRA+SGzJKvkzkxBw0U=
X-Google-Smtp-Source: AIpwx4+npeTGH+AQ9wvRdENuKHy7tndMtAxBtY5d5v6+CEQWlSJznB11z2LPMdV63ilDoC+UZZu19w==
X-Received: by 2002:a17:902:bb8c:: with SMTP id
	m12-v6mr16191804pls.119.1523170768069; 
	Sat, 07 Apr 2018 23:59:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:48 -0700
Message-Id: <1523170729-26321-36-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 36/37] libdivecomputer: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:26 -0000

WARNING: libdivecomputer-0.4.2+gitrAUTOINC+5f765f9143-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch fix-ar.patch
patching file configure.ac
Hunk #1 succeeded at 54 with fuzz 1 (offset 30 lines).

Now at patch fix-ar.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch b/meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch
index cc3f5d4..f65d26a 100644
--- a/meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch
+++ b/meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch
@@ -2,11 +2,11 @@
  configure.ac |    1 +
  1 file changed, 1 insertion(+)
 
+Index: git/configure.ac
+===================================================================
 --- git.orig/configure.ac
 +++ git/configure.ac
-@@ -24,10 +24,11 @@ LT_INIT([win32-dll])
- LT_PROG_RC
- 
+@@ -56,6 +56,7 @@ AM_CONDITIONAL([ENABLE_EXAMPLES], [test
  # Checks for programs.
  AC_PROG_CC
  AC_PROG_CC_C99
@@ -14,5 +14,3 @@
  
  # Enable automake silent build rules.
  m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])
- 
- # Checks for native Windows.
-- 
2.7.4



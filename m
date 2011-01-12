Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pd14o-0004zk-3f
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 14:49:26 +0100
Received: by bwz10 with SMTP id 10so516123bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 05:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=uXU8KuiLLHrNVDV0fO24st3kYHRgwIXQRHiDYCOYcM0=;
	b=gjcdkcF+vDWeBYla+eKIIEJPCEWvy/2bmogy9cM57EsjY99qtq1hV/QiEE/oNgR/9J
	0UaYHIAa/Rj8R+xorghwhi6kc5wBdxVkVo3yKEVVFa7c9KboLXASW7zG140+ejF3SuWm
	F+3VexiPvINGXGKHo6S6T0SBZ8BQzej8nsF6g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=UgKbmeBtUM9mlrHiwMw9Kx8J0SmvM287euelOvnCUXFR5GQZ+XL3sXsdXW072ZQeQU
	u0o0MU56bHZpmoyxR2LczCvcwyJp/YDyLQ5/ONWMqx7MlV8IY16n7Bge9Hh/CQv98HEK
	1EpztXQOETn+XY0IDJ4SyxtduwELWoKeZNye4=
Received: by 10.204.102.146 with SMTP id g18mr746950bko.163.1294840136280;
	Wed, 12 Jan 2011 05:48:56 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 12sm27577bki.7.2011.01.12.05.48.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 05:48:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 14:49:03 +0100
Message-Id: <1294840143-21429-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
Subject: [RFC] tslib: relax EV_VERSION check as 2.6.37 has slightly newer EV_VERSION, but works ok without tslib changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jan 2011 13:49:26 -0000

---
 ...RSION-check-fail-only-if-version-of-runni.patch |   25 ++++++++++++++++++++
 recipes/tslib/tslib_git.bb                         |    5 ++-
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 recipes/tslib/tslib/0001-relax-EV_VERSION-check-fail-only-if-version-of-runni.patch

diff --git a/recipes/tslib/tslib/0001-relax-EV_VERSION-check-fail-only-if-version-of-runni.patch b/recipes/tslib/tslib/0001-relax-EV_VERSION-check-fail-only-if-version-of-runni.patch
new file mode 100644
index 0000000..2ff1e0a
--- /dev/null
+++ b/recipes/tslib/tslib/0001-relax-EV_VERSION-check-fail-only-if-version-of-runni.patch
@@ -0,0 +1,25 @@
+From cdf285aa7cbcc7de9ad5a8bf4c053372153f4242 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 12 Jan 2011 14:36:35 +0100
+Subject: [PATCH] relax EV_VERSION check, fail only if version of running kernel is lower than EV_VERSION from kernel headers
+
+---
+ plugins/input-raw.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/plugins/input-raw.c b/plugins/input-raw.c
+index 9511a0d..4396eab 100644
+--- a/plugins/input-raw.c
++++ b/plugins/input-raw.c
+@@ -78,7 +78,7 @@ static int check_fd(struct tslib_input *i)
+ 		return -1;
+ 	}
+ 
+-	if (version != EV_VERSION) {
++	if (version < EV_VERSION) {
+ 		fprintf(stderr, "tslib: Selected device uses a different version of the event protocol than tslib was compiled for\n");
+ 		return -1;
+ 	}
+-- 
+1.7.4.rc1
+
diff --git a/recipes/tslib/tslib_git.bb b/recipes/tslib/tslib_git.bb
index 7c37395..74e17c3 100644
--- a/recipes/tslib/tslib_git.bb
+++ b/recipes/tslib/tslib_git.bb
@@ -1,8 +1,9 @@
-SRC_URI = "git://github.com/kergoth/tslib.git;protocol=git"
+SRC_URI = "git://github.com/kergoth/tslib.git;protocol=git \
+           file://0001-relax-EV_VERSION-check-fail-only-if-version-of-runni.patch"
 S = "${WORKDIR}/git"
 SRCREV = "860d69cadedef0dec8ba6259ab5850691d3402e7"
 PV = "1.0+gitr${SRCPV}"
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.4.rc1




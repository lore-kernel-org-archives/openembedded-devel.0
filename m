Received: from [209.85.218.227] (helo=mail-bw0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1MwzDe-0007JJ-4n
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Oct 2009 16:16:21 +0200
Received: by bwz27 with SMTP id 27so1506130bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Oct 2009 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=rmnJIEGTvbpbP/YBO+9vte6X8/LLhAeGRv5GThjvKaE=;
	b=Zq7Uvyqa1PYGkpox2zPpcn58h0JStswW4nOU4QG7EkG27wnztjhlaVCQkqlPE6KNR5
	E4tUHDPjwIwkzjnVjhTg9I1LyJnxeFUUeN0EkPnYczywLTbsWVUJvEsfiKuzc6NU3XqF
	KS4bGhlON9LY0ZnI8QVDPYxtYrmNYwP2PdTN4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=G27P19ppVk70weVIeCbAm7P9K/PdokIampDfLTT8Uw/7m2kSofHWnd1NLVUi+iTfpe
	zwytWfnrguqifrY868WSygSTE3b7SLso3253tuQEUAXhnsNxk91i3OIogQ4AFJ3AGveJ
	c5yOQ8cno4KEEzNW3kcW2LLGqt8jen17DGV8s=
Received: by 10.103.122.22 with SMTP id z22mr1998407mum.123.1255270523177;
	Sun, 11 Oct 2009 07:15:23 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j10sm7125772mue.44.2009.10.11.07.15.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 11 Oct 2009 07:15:22 -0700 (PDT)
From: "Martin.Jansa" <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Oct 2009 16:15:11 +0200
Message-Id: <1255270512-22926-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.rc2
In-Reply-To: <E1Mwyda-0001aa-3j@melo.openembedded.org>
References: <E1Mwyda-0001aa-3j@melo.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.218.227
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] Merge libdrm-glamo_git directly to libdrm_git.
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
X-List-Received-Date: Sun, 11 Oct 2009 14:16:21 -0000

---
 conf/distro/include/sane-srcrevs.inc         |    1 +
 recipes/dri/libdrm-glamo_git.bb              |   17 -----------------
 recipes/dri/libdrm_git.bb                    |   19 +++++++++++++++++++
 4 files changed, 30 insertions(+), 19 deletions(-)
 delete mode 100644 recipes/dri/libdrm-glamo_git.bb
 create mode 100644 recipes/dri/libdrm_git.bb

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 7df13da..951ea3e 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -80,6 +80,7 @@ SRCREV_pn-intuition ?= "194"
 SRCREV_pn-kismet ?= "2285"
 SRCREV_pn-kismet-newcore ?= "2285"
 SRCREV_pn-libcalenabler2 ?= "1410"
+SRCREV_pn-libdrm ?= "	a107e5b12960f64722bff424502a4fc0ad33dc8f"
 SRCREV_pn-libefso ?= "194"
 SRCREV_pn-libexalt ?= "78"
 SRCREV_pn-libexalt-dbus ?= "76"
diff --git a/recipes/dri/libdrm-glamo_git.bb b/recipes/dri/libdrm-glamo_git.bb
deleted file mode 100644
index 337cca9..0000000
--- a/recipes/dri/libdrm-glamo_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SECTION = "x11/base"
-LICENSE = "MIT"
-SRC_URI = "git://git.bitwiz.org.uk/libdrm.git;protocol=git;branch=glamo"
-PROVIDES = "drm"
-DEPENDS = "libpthread-stubs virtual/kernel"
-
-PV=2.4.4+gitr${SRCPV}
-
-DEFAULT_PREFERENCE = "-1"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/dri/libdrm_git.bb b/recipes/dri/libdrm_git.bb
new file mode 100644
index 0000000..e9feeb2
--- /dev/null
+++ b/recipes/dri/libdrm_git.bb
@@ -0,0 +1,19 @@
+SECTION = "x11/base"
+LICENSE = "MIT"
+SRC_URI = "git://anongit.freedesktop.org/mesa/drm;protocol=git;branch=master"
+SRC_URI_om-gta02 = "git://git.bitwiz.org.uk/libdrm.git;protocol=git;branch=glamo"
+PROVIDES = "drm"
+DEPENDS = "libpthread-stubs virtual/kernel"
+
+PV=2.4.15+gitr${SRCREV}
+
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_om-gta02 = "1"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+do_stage() {
+	autotools_stage_all
+}
-- 
1.6.5.rc2




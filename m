Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1EA772CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 13:23:51 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id kp2so14590234wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 05:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RzfQjgSHzyvRk/p3mZOvqsJH/zQgkougmSqjSHWRc3Y=;
	b=E6f8yrYfBaVjL7kwOKX2jcKSZPqIf3WmjRr+znaPtqtV/SWE3aqMjHRU6prDlSvuc9
	Aye8T/ZLRDDBktcrwVFsKBiuOKvpkrN2Utl2aPl8EKWyVN4Z+uITcoIYQ0Qn3emmJLZz
	Clp/FJnk0fcQAzkZdvmA5Ps1gSgOHCiBFWHf5J7bpGEs8sh46awPtHIL+IBX7tpmisXf
	rRG4QlqxPq8CeCNqSZmWai3EooskVfXnUKoxamIh/qyq10kfi/J3YhgiA9e+l5G79il2
	BnRNG58kntYRetmhLQA00VBMJ1YOh+5o1D6OCL5mWAFmmxgi6PP/w+merv/Iw0HkGASF
	HEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RzfQjgSHzyvRk/p3mZOvqsJH/zQgkougmSqjSHWRc3Y=;
	b=SWCBMIpjJj3Uf6aTgbN5S3KHmQVQTYlxjnD3QaQiDdJmR2TgWD2HMV2JEFerbjnpXN
	E1xymPr1QYVX5hQRfjRUV8PrmJSfpFaUlUsP96/sfTsuk3rCfnD9f5lhtKgs+pzcgAWQ
	im5OyhiO5+Gs4/wEoPWYBgAhdVKF05sloUUY40NpY+xl75jkSYOYmUrvN9onRH3luVHy
	CyShoR9EApjPK9wWwReur54UxvNHsKZfGVh1H3ERlD+erHSVO3e+9UpTuH3HjsMPGgFR
	+KMPiu0ztyWvr9vLaEfMMQtUqs1kiLj4tGl1CwlpzEyBoevXivcqVVBNKKTA/gdDR+xg
	+eZg==
X-Gm-Message-State: AIkVDXJJH0MrnwoxURIXZ6TYjOZCReRYp1JfvYpknMwNfD3SYDA2SXJq1sm3QhOIrGAJyw==
X-Received: by 10.194.14.73 with SMTP id n9mr3020708wjc.189.1481894632420;
	Fri, 16 Dec 2016 05:23:52 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-90-226-171.hsi11.unitymediagroup.de. [109.90.226.171])
	by smtp.googlemail.com with ESMTPSA id
	c202sm4199064wme.1.2016.12.16.05.23.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Dec 2016 05:23:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 14:23:37 +0100
Message-Id: <1481894617-17690-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481894617-17690-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481894617-17690-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] esound: fix build after update of audiofile
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
X-List-Received-Date: Fri, 16 Dec 2016 13:23:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...sing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch | 31 ++++++++++++++++++++++
 meta-oe/recipes-multimedia/esound/esound_0.2.36.bb | 11 +++++---
 2 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/esound/esound/0001-replace-missing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch

diff --git a/meta-oe/recipes-multimedia/esound/esound/0001-replace-missing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch b/meta-oe/recipes-multimedia/esound/esound/0001-replace-missing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch
new file mode 100644
index 0000000..89c97a4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/esound/esound/0001-replace-missing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch
@@ -0,0 +1,31 @@
+From 218e0702d6ce4d2cb20d5d108daa16afca2b7c41 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 16 Dec 2016 13:22:51 +0100
+Subject: [PATCH] replace missing AM_PATH_AUDIOFILE by PKG_CHECK_MODULES(
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstrem-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 486c492..dccfd1b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -353,7 +353,7 @@ echo "---------------------------------------------------------------------"
+ echo "--- Checking for the audiofile library.  NOTE: This library is now"
+ echo "--- REQUIRED from proper compilation of the esound package."
+ 
+-AM_PATH_AUDIOFILE(0.1.5, [
++PKG_CHECK_MODULES(AUDIOFILE, audiofile, [
+ 
+ build_esdplay=true
+ echo "--- libaudiofile found. Building esound with audiofile support"
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
index 035358d..dc6c366 100644
--- a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
+++ b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
@@ -8,10 +8,13 @@ inherit gnome binconfig
 
 PR = "r1"
 
-SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/esound/0.2/esound-0.2.36.tar.bz2;name=archive \
-           file://esound_0.2.36-1ubuntu5.diff.gz \
-           file://no-docs.patch \
-           file://configure-fix.patch"
+SRC_URI = " \
+    ftp://ftp.gnome.org/pub/GNOME/sources/esound/0.2/esound-0.2.36.tar.bz2;name=archive \
+    file://esound_0.2.36-1ubuntu5.diff.gz \
+    file://no-docs.patch \
+    file://configure-fix.patch \
+    file://0001-replace-missing-AM_PATH_AUDIOFILE-by-PKG_CHECK_MODUL.patch \
+"
 
 SRC_URI[archive.md5sum] = "3facb5aa0115cc1c31771b9ad454ae76"
 SRC_URI[archive.sha256sum] = "68bf399fcbd45c5e9ba99cd13a3a479e4ef2bc5dc52e540ffa00aef1e1b19a76"
-- 
2.7.4



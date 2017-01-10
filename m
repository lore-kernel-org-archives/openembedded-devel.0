Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA6471A8D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 18:49:02 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c206so84959476wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 10:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZrwLz4G36tAh6R3lTGCv5OEkLPjZruMXV7hB7RgvGXs=;
	b=umTTGfQRhEkxnQ+Lpp/6PqPBcrHJW/opjW3du4eVnSRvDnzlxs0wEY1bmOvIwsv3aV
	FVAIvvQ7cg6117+e+goWsOdfQC5HCYHDg9GTq7+KnvCmSIabG1Cr4KJXRr0xKSe83o5a
	rymhpNUJDK0zPVlVMi1hlgQ9WzF4PRXQlB1jcYc5LKCUeiZkzc6ysd9XubFh4GrT3OwI
	kXU2JOrkXHX2iIVdRX1Q/R5cyN1sDC0dPvXAMtex5iwuiZa6yqBdclSaDZKSjWF3PuQQ
	ZG1BtemeMO6oUNO5W0uaAbgxZk58JyXEtW6P2cmqbDVQ1NGsqlZPf9NXL29M443fEXr9
	0a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZrwLz4G36tAh6R3lTGCv5OEkLPjZruMXV7hB7RgvGXs=;
	b=uJ6I78/gt2InQ1F5cnMbs95UtXgnIISHVNX9FlW1pg1/dvjsqKn1w3lZoDYH0S48LD
	J4Uws9ammmebbkScmahJ13uJugFIYf5THAAkPQaTh8q6pNZrQIhtGwteIgVk/g5IyOS6
	u2ALnEVY1KvOLj+eiAaUskqeI73uRY3U03CxthppyQ3JaNc+br+vSbwttgLmmX138VBI
	TMo+ya409/FfnqJJ00sglFsSIKl3I6ljLkkZTfi7ceuZoboxOefAfEPY1OSNvnXTdSh6
	DlCoWJYwgoaTsQbXwD990wc2lEiyBaigm1cBh4asoP/eJEne40H1ZJ/3VWomuPtuCXJ3
	J4VQ==
X-Gm-Message-State: AIkVDXJYLjDITep6DLhD4xvexVAI9+Iu6i0ce8GWFOAUNqOUgWfcu0UbhTYqLolU3XJJkw==
X-Received: by 10.28.224.10 with SMTP id x10mr2875064wmg.134.1484074142028;
	Tue, 10 Jan 2017 10:49:02 -0800 (PST)
Received: from localhost.localdomain (p579F7DD6.dip0.t-ipconnect.de.
	[87.159.125.214]) by smtp.googlemail.com with ESMTPSA id
	r5sm9007071wme.23.2017.01.10.10.49.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 10:49:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jan 2017 19:48:47 +0100
Message-Id: <1484074127-21458-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH V2 3/3] firefox: do not link against crmf library it is not there
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
X-List-Received-Date: Tue, 10 Jan 2017 18:49:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

and build succeeds without it

fixes:

| <...>/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/6.2.0/ld: error: cannot find -lcrmf

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...link-against-crmf-library-it-is-not-there.patch | 47 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_45.6.0esr.bb       |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch

diff --git a/recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch b/recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch
new file mode 100644
index 0000000..65a4a04
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0003-do-not-link-against-crmf-library-it-is-not-there.patch
@@ -0,0 +1,47 @@
+From 82862c9be8e1c87d32b639403f1f5715c8f4be59 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 15 Dec 2016 00:23:41 +0100
+Subject: [PATCH] do not link against crmf library - it is not there
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure                          | 5 -----
+ config/external/nss/crmf/moz.build | 1 -
+ 2 file changed, 6 deletions(-)
+
+diff --git a/configure b/configure
+index 918c8d6..9d31b5c 100755
+--- a/configure
++++ b/configure
+@@ -15689,11 +15689,6 @@ echo "configure:15633: checking for NSS - version >= $min_nss_version" >&5
+ 
+ fi
+ 
+-if test -n "$MOZ_NATIVE_NSS"; then
+-   NSS_LIBS="$NSS_LIBS -lcrmf"
+-else
+-   NSS_CFLAGS="-I${DIST}/include/nss"
+-fi
+ 
+ 
+ echo $ac_n "checking for YASM assembler""... $ac_c" 1>&6
+diff --git a/config/external/nss/crmf/moz.build b/config/external/nss/crmf/moz.build
+index 9b8005f..4bfcc81 100644
+--- a/config/external/nss/crmf/moz.build
++++ b/config/external/nss/crmf/moz.build
+@@ -8,7 +8,6 @@ Library('crmf')
+ 
+ if CONFIG['MOZ_NATIVE_NSS']:
+     OS_LIBS += [l for l in CONFIG['NSS_LIBS'] if l.startswith('-L')]
+-    OS_LIBS += ['-lcrmf']
+ else:
+     USE_LIBS += [
+         # The dependency on nss is not real, but is required to force the
+-- 
+2.5.5
+
diff --git a/recipes-mozilla/firefox/firefox_45.6.0esr.bb b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
index a4ae32f..bed50dd 100644
--- a/recipes-mozilla/firefox/firefox_45.6.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.6.0esr.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch \
            file://0001-use-pkg-config-to-find-nss.patch \
            file://0002-use-pkg-config-to-find-nspr.patch \
+           file://0003-do-not-link-against-crmf-library-it-is-not-there.patch \
            "
 
 SRC_URI[archive.md5sum] = "ee3cf2401a5716cebacaae5fb70d133f"
-- 
2.5.5



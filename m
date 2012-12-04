Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfrOZ-0004lN-9n
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 13:14:41 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2148097eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 04:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Oh1d+SdCvemIrbKt78Genv9JBEBc262x/vJ1hdVrTJ4=;
	b=w9QeL8PsAtQE+4/gooBW6Ijz7J02xLhlVizJWvoKAEzXv81pTj+klHCeR8XeTIo03O
	ov17jlcYexFao19wYGgfsnjwePFwaT7++/kvCMFsxQs1z8FttA3Okyok6MAUoP4c08fd
	dkAM1xO/mfUUdeXb0IGLKJ+Cds8UStma21FCE0kR1NUMfwkumU3ICkNosW4XSNrf0uXN
	0tNriNxwfLPZY5OAt3eNoRbKMSYEeFFCTXXobC7NQfQgHm8A7YCXPhvDc9hV9idxgcK/
	YcMVf1L0EszUMc3zBKP5kWIvJENrFsN0FSgWOAlVf1FobGlWDrINfnmemWQcFUWuqWIR
	SXKw==
Received: by 10.14.172.195 with SMTP id t43mr48077990eel.17.1354622417085;
	Tue, 04 Dec 2012 04:00:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm2229471eem.3.2012.12.04.04.00.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 04:00:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 12:59:53 +0100
Message-Id: <67fb38a586d83ccca1102fa48b7f976d98e23e2b.1354622319.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354622319.git.Martin.Jansa@gmail.com>
References: <cover.1354622319.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354622319.git.Martin.Jansa@gmail.com>
References: <cover.1354622319.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] samba: update waf-as-source.patch to apply
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
X-List-Received-Date: Tue, 04 Dec 2012 12:14:41 -0000

* and Applying patch waf-as-source.patch
  ...
  File buildtools/bin/waf-svn is not empty after patch; not deleting
  ...
  Patch waf-as-source.patch does not apply (enforce with -f)
  I've dropped this chunk and now it builds

* there is also WARNING about unpackaged but empty base_sbindir
  WARNING: QA Issue: samba: Files/directories were installed but not
  shipped
    /sbin
  created by do_install in samba.inc but used only when cifs is built,
  maybe we should remove it from samba.inc now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch | 4 ----
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb                  | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch
index 3ba7d23..985ed5a 100644
--- a/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch
+++ b/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch
@@ -44,10 +44,6 @@ index 9ef8a1f..0000000
 -You can get a svn copy of the upstream source with:
 -
 -  svn checkout http://waf.googlecode.com/svn/trunk/ waf-read-only
-diff --git a/buildtools/bin/waf-svn b/buildtools/bin/waf-svn
-deleted file mode 100755
-index 6d54d5f..0000000
-Binary files a/buildtools/bin/waf-svn and /dev/null differ
 diff --git a/buildtools/update-waf.sh b/buildtools/update-waf.sh
 new file mode 100755
 index 0000000..bb3a4bf
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index cc09a48..7c54dae 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.8.0




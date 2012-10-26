Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRq4O-0006cB-4o
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 21:59:52 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so1219925eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3S5vboDMNgOytDtWHSFIttdQlL05XmkVpvAPIZRnPDs=;
	b=FHpL5x+Wsc63iVZ/HQRruNGNFOm+g2bumKiNpyrcDPV3C97vWb57X9vEQWWUwSVjwL
	bKB/3qGgdAgwPUikpeiJsVB2U18pZAQ0fUNRQanPe6l6yW7bnWY+TtJ0iL3z6JlyKhXh
	Ynqb70SnBTYPtbgZTNq9hS566xeG6R3qksOxNgNERCakVvCxS4EcAbfTkR+TaVR6uMmM
	hxHqCLhO9Nu+vIAjbYHZrAU81iliecR8TrPKiZLpjpE4hazfZutEVDt0w6Rt3Dup1IAG
	R8XgTihdy00ZiZpzZtVTbucTpa/pjH9LG8ouj8uyoCEoFBcn76saP+NePYWDu1UZG6Qo
	ujNw==
Received: by 10.14.194.2 with SMTP id l2mr35878539een.12.1351280781794;
	Fri, 26 Oct 2012 12:46:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i1sm4645742eeo.8.2012.10.26.12.46.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Oct 2012 12:46:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2012 21:46:10 +0200
Message-Id: <1351280770-21814-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [PATCH] samba: update waf-as-source.patch to apply
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
X-List-Received-Date: Fri, 26 Oct 2012 19:59:52 -0000

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
 I've forgot to push updated branch with this part in last pull-request, 
 so here it is with another PR bump.

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
1.7.12.4




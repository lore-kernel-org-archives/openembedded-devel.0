Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRKa2-0002Wt-AN
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 12:22:26 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so1053738wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2012 03:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Yt4Z+1Eu4kESnWXRQ3cjbnFHA/sPYVkUPmA3uTcCu1Q=;
	b=FmN+b5V/pcxcwN31iHqWUEfeYKqcem94E8r2OmgcvUi+jiNYpOCCNRA4ksJhnKv9g3
	SucQVWFhOpshLT+uPyqJ0zyJDoVMWeutlDG5GbtTSu+9SjbBJxnTJqjAxwfT9pruDqpA
	iVCssJE3AZPHVjLxHJ3VzsjWCxUMWLe4qJXtjqynCxB1oCegn+4AX4h7wvUBWDC9xtTG
	SwhB7PXhYd3AjPmA7Jov9vF498ChCTXdDrlYcJs4xjRBeQ2XUhI1GG3qE6ic/s3qNW/2
	oOy2jThOL4jpPaTSb7UZpdoqX+nXwep4QTFvY5ErVkSc0EZUC940aAw6lxMHZYWHEH73
	lYrQ==
Received: by 10.216.201.143 with SMTP id b15mr10515337weo.96.1351159737965;
	Thu, 25 Oct 2012 03:08:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m14sm9168680wie.8.2012.10.25.03.08.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Oct 2012 03:08:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 12:09:11 +0200
Message-Id: <1351159751-21366-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <20121025094931.GM3269@jama.jama.net>
References: <20121025094931.GM3269@jama.jama.net>
MIME-Version: 1.0
Subject: [meta-oe]PATCH] samba: update documentation2.patch and waf-as-source.patch to apply
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
X-List-Received-Date: Thu, 25 Oct 2012 10:22:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* fails here because of non-ASCII characters:
  ERROR: Command Error: exit status: 1  Output:
  Applying patch documentation2.patch
  ...
  patching file swat/lang/tr/help/welcome.html
  Hunk #1 FAILED at 40.
  Hunk #2 succeeded at 66 with fuzz 2.
  1 out of 2 hunks FAILED -- rejects in file swat/lang/tr/help/welcome.html
  Patch documentation2.patch does not apply (enforce with -f)

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
 .../samba/samba-3.6.8/documentation2.patch                     | 10 +++++-----
 .../recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch |  4 ----
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb              |  2 ++
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation2.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation2.patch
index 88e98f1..902e8e2 100644
--- a/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation2.patch
+++ b/meta-oe/recipes-connectivity/samba/samba-3.6.8/documentation2.patch
@@ -300,15 +300,15 @@ Index: samba/swat/lang/tr/help/welcome.html
 @@ -40,7 +40,6 @@
     <ul>
      <li><a href="/swat/help/smbstatus.1.html" target="docs">smbstatus</a> - Samba gözlemcisi
-     <li><a href="/swat/help/testparm.1.html" target="docs">testparm</a> - ayar dosyas?n? kontrol eder
--    <li><a href="/swat/help/testprns.1.html" target="docs">testprns</a> - yaz?c? ayarlar?n? kontrol eder
-     <li><a href="/swat/help/nmblookup.1.html" target="docs">nmblookup</a> - NetBIOS isim sorgulama arac?
+     <li><a href="/swat/help/testparm.1.html" target="docs">testparm</a> - ayar dosyasını kontrol eder
+-    <li><a href="/swat/help/testprns.1.html" target="docs">testprns</a> - yazıcı ayarlarını kontrol eder
+     <li><a href="/swat/help/nmblookup.1.html" target="docs">nmblookup</a> - NetBIOS isim sorgulama aracı
     </ul>
   <li><b>Kitaplar</b>
 @@ -66,4 +65,4 @@
  
-  E?er SWAT'?n bu sürümü ile ilgili konular? tart??mak istiyorsan?z, lütfen
+  Eğer SWAT'ın bu sürümü ile ilgili konuları tartışmak istiyorsanız, lütfen
  <A HREF="http://lists.samba.org/">samba</A> eposta listesine üye olun.
 - 
 \ No newline at end of file
-+
++ 
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
index 61fa4b3..cc09a48 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,6 +3,8 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+PR = "r1"
+
 SRC_URI += "\
     file://config-h.patch \
     file://documentation.patch;patchdir=.. \
-- 
1.7.12.4




Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsET9-0000sC-Ac
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:09:27 +0100
Received: by gwaa20 with SMTP id a20so1107689gwa.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=n0K8wFU0lEzy7hIPFBsFZxKi/KG7LMxRqCJnWxX8z70=;
	b=kD665lxXcJvHZ2QxQ6kcAqX4clHN+07kvBOD0IiNyJI3W3f315wXLDzjzsmK9AiLRG
	vImrRjfecIulrqiCQMkYDTN7viBOwx+0aXi+oFjXQd/ur08o9Ko8JXAuyNImFSIQvAlx
	cvhZ2tIF1e6MiVGcuC+/A/H0IGCKKcc5AkAws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=HYIuC1mKGbDFmOBz02ma3sa5nOO0ATIeW0lsRoU1F2Zr4kUyo87ciKk81kNcYPACYj
	fpFh+K+FgswzdMTnx7HkkAgUDXQVkB7+RBRiLCj9G1pMH9XQY68gNX17ZbufPg5c5Esj
	HJAcKOd5G3otyEMUSog0iMnljTVE3sHAyjH+k=
Received: by 10.236.108.135 with SMTP id q7mr7365869yhg.20.1298466469972;
	Wed, 23 Feb 2011 05:07:49 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.07.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:07:49 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:13 +0000
Message-Id: <1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 02/14] cmake: drop 2.6.4 as it is not used by any distro
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
X-List-Received-Date: Wed, 23 Feb 2011 13:09:27 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 .../fix_fortify_source_compilation.patch           |   32 --------------------
 recipes/cmake/cmake-native_2.6.4.bb                |   10 ------
 recipes/cmake/cmake_2.6.4.bb                       |   11 -------
 3 files changed, 0 insertions(+), 53 deletions(-)
 delete mode 100644 recipes/cmake/cmake-2.6.4/fix_fortify_source_compilation.patch
 delete mode 100644 recipes/cmake/cmake-native_2.6.4.bb
 delete mode 100644 recipes/cmake/cmake_2.6.4.bb

diff --git a/recipes/cmake/cmake-2.6.4/fix_fortify_source_compilation.patch b/recipes/cmake/cmake-2.6.4/fix_fortify_source_compilation.patch
deleted file mode 100644
index 316ab0c..0000000
--- a/recipes/cmake/cmake-2.6.4/fix_fortify_source_compilation.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-upstream: http://public.kitware.com/mantis/view.php?id=9267
-status: pending
-origin: http://sisyphus.ru/ru/srpm/Sisyphus/cmake/patches/0
-comment: fix cmake building when FORTIFY_SOURCE is enabled
---- a/Source/kwsys/SystemInformation.cxx
-+++ b/Source/kwsys/SystemInformation.cxx
-@@ -1896,9 +1896,14 @@
-             case 5: sprintf (this->ChipID.ProcessorName,"Pentium II (0.25 micron)"); break;
-             case 6: sprintf (this->ChipID.ProcessorName,"Pentium II With On-Die L2 Cache"); break;
-             case 7: sprintf (this->ChipID.ProcessorName,"Pentium III (0.25 micron)"); break;
-+/*
-             case 8: sprintf (this->ChipID.ProcessorName,"Pentium III (0.18 micron) With 256 KB On-Die L2 Cache "); break;
-             case 0xa: sprintf (this->ChipID.ProcessorName,"Pentium III (0.18 micron) With 1 Or 2 MB On-Die L2 Cache "); break;
-             case 0xb: sprintf (this->ChipID.ProcessorName,"Pentium III (0.13 micron) With 256 Or 512 KB On-Die L2 Cache "); break;
-+*/
-+            case 8: sprintf (this->ChipID.ProcessorName,"Pentium III (0.18 micron) With 256 KB L2 Cache "); break;
-+            case 0xa: sprintf (this->ChipID.ProcessorName,"Pentium III (0.18 micron), 1/2 MB L2 Cache "); break;
-+            case 0xb: sprintf (this->ChipID.ProcessorName,"Pentium III (0.13 micron), 256/512 KB L2 Cache "); break;
-             default: sprintf (this->ChipID.ProcessorName,"Unknown P6 family"); return false;
-             }
-           break;
---- a/Utilities/cmtar/encode.c
-+++ b/Utilities/cmtar/encode.c
-@@ -32,7 +32,7 @@ th_finish(TAR *t)
-   int i, sum = 0;
- 
-   if (t->options & TAR_GNU)
--    strncpy(t->th_buf.magic, "ustar  ", 8);
-+    memcpy(t->th_buf.magic, "ustar  ", 8);
-   else
-   {
-     strncpy(t->th_buf.version, TVERSION, TVERSLEN);
diff --git a/recipes/cmake/cmake-native_2.6.4.bb b/recipes/cmake/cmake-native_2.6.4.bb
deleted file mode 100644
index aab6b62..0000000
--- a/recipes/cmake/cmake-native_2.6.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit native
-require cmake.inc
-
-do_install() {
-	oe_runmake install
-}
-
-SRC_URI += "file://fix_fortify_source_compilation.patch"
-SRC_URI[md5sum] = "50f387d0436696c4a68b5512a72c9cde"
-SRC_URI[sha256sum] = "9cdd2152e37b05d0d40d334a1bb2dfc0250021797360f971c6ea3d457ac9fdf2"
diff --git a/recipes/cmake/cmake_2.6.4.bb b/recipes/cmake/cmake_2.6.4.bb
deleted file mode 100644
index b5a47a8..0000000
--- a/recipes/cmake/cmake_2.6.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require cmake.inc
-
-inherit cmake
-
-do_configure_append() {
-	sed -i -e 's,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=1,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=0,' CMakeCache.txt
-}
-
-SRC_URI += "file://fix_fortify_source_compilation.patch"
-SRC_URI[md5sum] = "50f387d0436696c4a68b5512a72c9cde"
-SRC_URI[sha256sum] = "9cdd2152e37b05d0d40d334a1bb2dfc0250021797360f971c6ea3d457ac9fdf2"
-- 
1.7.2.3




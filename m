Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqc3-0004XI-U8
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:02:40 +0100
Received: by fxm17 with SMTP id 17so12727984fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=B3fGUMwfYeOsXMFN6vEHRD4eINFXKPGCSNIfn3jYxqo=;
	b=lJwBLD0pQjjg+nnbU6qKGpQaTaAAN6qWMJbAPBkDRwqo9ab9/VK0UIan0G6/FMFM77
	kfLRoGczh8/v8CB6ZZuEaXZCU6tCgrUMkkEnulhdly+/DQ8HYw5XfGz/4dEy5xq66aaf
	rvL+pIlNGaMI1dgu5IFg4vv1W816VP3XYM+aA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qvmOOttSkmL+b+BE620e20rqal76htHIDieJH+pE73OpGLHWM+vDZKKI/WF5acy7mn
	0DQHDKhJR21crEf/ErMGGdlEtPHULAjY/VdghZGixn0GIymA6mGWDjdyb/rMhJpbSDZW
	mrLVfUi3GB0aujmgd0J9RfXwWSPrZxyhvV47U=
Received: by 10.223.83.197 with SMTP id g5mr327498fal.52.1294084938436;
	Mon, 03 Jan 2011 12:02:18 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id n3sm4881229faa.5.2011.01.03.12.02.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:02:17 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqbf-0000om-LP; Mon, 03 Jan 2011 21:02:15 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 21:01:56 +0100
Message-Id: <1294084926-3115-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 02/12] class_image: fix typos
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
X-List-Received-Date: Mon, 03 Jan 2011 20:02:40 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 docs/usermanual/reference/class_image.xml |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/usermanual/reference/class_image.xml b/docs/usermanual/reference/class_image.xml
index 227f7e1..a6e6b47 100644
--- a/docs/usermanual/reference/class_image.xml
+++ b/docs/usermanual/reference/class_image.xml
@@ -18,7 +18,7 @@
       <para>Inherits the rootfs class for the appropriate package type,
       typically <xref linkend="rootfs_ipkg_class" />, in order to bring in the
       functionality required to generate a root filesystem image. The root
-      filesystem image is generate from a set of of packages (typically .ipkg
+      filesystem image is generated from a set of of packages (typically .ipkg
       packages), and then the required images are generated using the contents
       of the root filesystem;</para>
     </listitem>
@@ -26,7 +26,7 @@
     <listitem>
       <para>Sets <command>BUILD_ALL_DEPS = "1"</command> to force the
       dependency system to build all packages that are listed in the
-      <command>RDEPENDS</command> and/or <command>RRECOMENDS</command> of the
+      <command>RDEPENDS</command> and/or <command>RRECOMMENDS</command> of the
       packages to be installed;</para>
     </listitem>
 
@@ -126,7 +126,7 @@
 
       <listitem>
         <para>Specifies the file that lists the device nodes that should be
-        created in the <command>/dev </command>directory of the image. This
+        created in the <command>/dev</command> directory of the image. This
         needs to be an absolute filename and so should be specified relative
         to <command>${BBPATH}</command>. Only a single device table is
         supported. Use <command>IMAGE_DEVICE_TABLES</command> instead if you
@@ -217,8 +217,8 @@
 
     <para>The <command>IMAGE_PREPROCESS_COMMAND</command> and
     <command>IMAGE_POSTPROCESS_COMMAND</command> variables will be processed
-    within the same <xref linkend="fakeroot" /> instance as the rest of the
-    rest of this class.</para>
+    within the same <xref linkend="fakeroot" /> instance as the rest of
+    this class.</para>
   </section>
 
   <section>
@@ -292,12 +292,12 @@ IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt files/device_table_add-sci
 
     <para>"Package feed", or feed for short, is a term used by <command>ipkg</command> 
     package manager, commonly used in embedded systems, to name a package repository 
-    holding packages. Structurally, a feed is a directory - local, or on HTTP of FTP server, -
+    holding packages. Structurally, a feed is a directory - local, or on HTTP or FTP server, -
     holding packages and package descriptor file, named <command>Packages</command> or 
     <command>Packages.gz</command> if compressed. Multiple feeds are supported.</para>
 
     <para>OpenEmbedded has support to pre-configure feeds within generated images, 
-    so once image is installed on a device, user can immediately install new software, 
+    so once an image is installed on a device, the user can immediately install new software, 
     without the need to manually edit config files. There are several ways to pre-configure 
     feed support, described below.</para>
     
-- 
1.7.2.3




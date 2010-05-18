Received: from mail2.matrix-vision.com ([85.214.244.251])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.jones@matrix-vision.de>) id 1OEP2h-0000DL-9T
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 17:49:17 +0200
Received: from mail2.matrix-vision.com (localhost [127.0.0.1])
	by mail2.matrix-vision.com (Postfix) with ESMTP id 5EAF044A79
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 17:35:37 +0200 (CEST)
Received: from erinome (g2.matrix-vision.com [80.152.136.245])
	by mail2.matrix-vision.com (Postfix) with ESMTPA id 8E7EC44A61
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 17:35:36 +0200 (CEST)
Received: from erinome (localhost [127.0.0.1])
	by erinome (Postfix) with ESMTP id 905B06F8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 17:35:35 +0200 (CEST)
Received: by erinome (Postfix, from userid 108)
	id 8197E6F9B; Tue, 18 May 2010 17:35:35 +0200 (CEST)
Received: from [192.168.65.46] (host65-46.intern.matrix-vision.de
	[192.168.65.46]) by erinome (Postfix) with ESMTPA id 6C37A6F8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 17:35:35 +0200 (CEST)
Message-ID: <4BF2B3C7.7060700@matrix-vision.de>
Date: Tue, 18 May 2010 17:35:35 +0200
From: Michael Jones <michael.jones@matrix-vision.de>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-MV-Disclaimer: true (erinome)
X-AV-Checked: ClamAV using ClamSMTP (erinome)
X-AV-Checked: ClamAV using ClamSMTP (mail2)
X-SA-Exim-Connect-IP: 85.214.244.251
X-SA-Exim-Mail-From: michael.jones@matrix-vision.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] docs/ spelling fixes
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
X-List-Received-Date: Tue, 18 May 2010 15:49:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Just a few things in the documentation I noticed while reading up on OE. I don't understand why 'git diff' included "\ No newline at end of file" for some of these, or how I could instruct it not to, but I also didn't want to pick apart my patch outside of git.

Signed-off-by: Michael Jones <michael.jones@matrix-vision.de>
---
 docs/usermanual/chapters/metadata.xml         |    2 +-
 docs/usermanual/chapters/recipes.xml          |   18 +++++++++---------
 docs/usermanual/chapters/usage.xml            |   10 +++++-----
 docs/usermanual/reference/class_autotools.xml |    4 ++--
 docs/usermanual/reference/class_binconfig.xml |    4 ++--
 docs/usermanual/reference/class_image.xml     |    4 ++--
 docs/usermanual/reference/dirs_install.xml    |    2 +-
 docs/usermanual/reference/fakeroot.xml        |    4 ++--
 8 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/docs/usermanual/chapters/metadata.xml b/docs/usermanual/chapters/metadata.xml
index c698be9..bbf6f73 100644
--- a/docs/usermanual/chapters/metadata.xml
+++ b/docs/usermanual/chapters/metadata.xml
@@ -95,7 +95,7 @@
 
     <para>OpenEmbedded has files ending with <emphasis>.conf</emphasis>,
     <emphasis>.inc</emphasis>, <emphasis>.bb</emphasis>
-    and<emphasis>.bbclass</emphasis>. The syntax and semantic of these files
+    and<emphasis>.bbclass</emphasis>. The syntax and semantics of these files
     are best described in the <ulink
     url="http://bitbake.berlios.de/manual"><application>BitBake</application>
     manual</ulink>.</para>
diff --git a/docs/usermanual/chapters/recipes.xml b/docs/usermanual/chapters/recipes.xml
index 90a1810..dd0b22e 100644
--- a/docs/usermanual/chapters/recipes.xml
+++ b/docs/usermanual/chapters/recipes.xml
@@ -451,7 +451,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
       </listitem>
 
       <listitem>
-        <para>The classes, that are used via the inherit keyword, define
+        <para>The classes that are used via the inherit keyword define
         and/or use the majority of the remaining variables. A class is like
         a library that contains parts of a bitbake recipe that is used by
         multiple recipes. To make them usable in more situations they often
@@ -503,7 +503,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
     <para>Practically all recipes start with a header section which describes
     various aspects of the package that is being built. This information is
     typically used directly by the package format (such as ipkg or deb) as
-    it's meta data used to describe the package.</para>
+    its meta data used to describe the package.</para>
 
     <para>Variables used in the header include:</para>
 
@@ -835,7 +835,7 @@ S = "${WORKDIR}/widgets"</screen></para>
       <title>D: The destination directory</title>
 
       <para>The destination directory is where the completed application and
-      all of it's files are installed into in preparation for packaging.
+      all of its files are installed into in preparation for packaging.
       Typically an installation would place files in directories such as
       <emphasis role="bold">/etc</emphasis> and <emphasis
       role="bold">/usr/bin</emphasis> by default. Since those directories are
@@ -1037,7 +1037,7 @@ ${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"</screen></para>
       done is when one recipe includes another one in which the default values
       will be based on the name of the package doing the including, not the
       included package. Typically the included package will expect the files
-      to be located in a directory based on it's own name.</para>
+      to be located in a directory based on its own name.</para>
 
       <para>As an example the m4-native recipe includes the m4 recipe. This is
       fine, except that the m4 recipe expects its files and patches to be
@@ -1458,7 +1458,7 @@ inherit autotools</screen></para>
   </section>
 
   <section id="recipes_methods" xreflabel="methods">
-    <title>Methods: Inbuilt methods to make your life easier</title>
+    <title>Methods: Built-in methods to make your life easier</title>
 
     <para>There are several helper functions defined by the base class, which
     is included by default for all recipes. Many of these are used a lot in
@@ -1931,7 +1931,7 @@ NOTE: package helloworld-0.1-r0: task do_package_write: completed</screen>We
 
             <listitem>
               <para>Documentation related files. All documentation is
-              separated into it's own package so that it does not need to be
+              separated into its own package so that it does not need to be
               installed unless explicitly required.<screen>FILES_${PN}-doc = "\
     ${docdir} \
     ${mandir} \
@@ -2447,7 +2447,7 @@ addtask unpack_extra after do_unpack before do_patch</screen></para>
     building later applications.</para>
 
     <para>Taking bzip2 as an example you can see that it stages a header file
-    and it's library files:<screen>do_stage () {
+    and its library files:<screen>do_stage () {
     install -m 0644 bzlib.h ${STAGING_INCDIR}/
     oe_libinstall -a -so libbz2 ${STAGING_LIBDIR}
 }</screen></para>
@@ -2929,7 +2929,7 @@ fi</screen></para>
     some action, such as changing user or group owners or creating device
     nodes. Since OpenEmbedded will not keep the user and group information
     it's usually preferable to remove that from the makefiles. For device
-    nodes it's usually preferably to create them from the initial device node
+    nodes it's usually preferable to create them from the initial device node
     lists or via udev configuration.</para>
 
     <para>However if you can't get by without root permissions then you can
@@ -3135,7 +3135,7 @@ do_configure() {
     object, then replaces any dots with underscores. Therefore if the <emphasis
     role="bold">PV</emphasis> was <emphasis role="bold">0.9.0</emphasis> then
     <emphasis role="bold">TAG</emphasis> will be set to <emphasis
-    role="bold">0-9-0</emphasis>.</para>
+    role="bold">0_9_0</emphasis>.</para>
 
     <para>Some of the more common python code in use in existing recipes is
     shown in the following table:</para>
diff --git a/docs/usermanual/chapters/usage.xml b/docs/usermanual/chapters/usage.xml
index 058fa5d..f9dda87 100644
--- a/docs/usermanual/chapters/usage.xml
+++ b/docs/usermanual/chapters/usage.xml
@@ -5,7 +5,7 @@
   <section id="usage_introduction" xreflabel="introduction">
     <title>Introduction</title>
 
-    <para>If your reading this manual you probably already have some idea of
+    <para>If you're reading this manual you probably already have some idea of
     what OpenEmbedded is all about, which is taking a lot of software and
     creating something that you can run on another device. This involves
     downloading some source code, compiling it, creating packages (like .deb
@@ -13,7 +13,7 @@
     device. The difficulties of cross-compiling and the variety of devices
     which can be supported lead to a lot more complexity in an OpenEmbedded
     based distribution than you'd find in a typical desktop distribution
-    (which cross-compiling isn't needed).</para>
+    (for which cross-compiling isn't needed).</para>
 
     <para>A major part of OpenEmbedded deals with compiling source code for
     various projects. For each project this generally requires the same basic
@@ -745,7 +745,7 @@ NOTE: build 200705041709: completed</screen><note>
           available for other applications to include and link against.</para>
 
           <note>
-            <para>This is different to the <emphasis>install</emphasis> task
+            <para>This is different from the <emphasis>install</emphasis> task
             in that this is responsible for making available libraries and
             headers for use during build on the development host. Therefore
             it's libraries which normal have to stage things while
@@ -853,7 +853,7 @@ NOTE: package perl-5.8.8-r11: task do_listtasks: completed
 NOTE: package perl-5.8.8: completed
 $ </screen></para>
 
-    <para>If your being observant you'll note that
+    <para>If you're being observant you'll note that
     <emphasis>listtasks</emphasis> is in fact a task itself, and that the
     <emphasis role="bold">-c</emphasis> option to bitbake allows you to
     explicitly run specific tasks. We'll make use of this in the next section
@@ -876,7 +876,7 @@ $ </screen></para>
     the named recipe only. Note that this ignores any dependencies that are in
     the recipe, so these must have already been built previously.</para>
 
-    <para>Here's a typically example that cleans up the package (using the
+    <para>Here's a typical example that cleans up the package (using the
     <emphasis>clean</emphasis> task) and the rebuilds it with debugging output
     from bitbake enabled:<screen>$ <command>bitbake</command> -b &lt;bb-file&gt; -c clean
 $ <command>bitbake</command> -b &lt;bb-file&gt; -D</screen></para>
diff --git a/docs/usermanual/reference/class_autotools.xml b/docs/usermanual/reference/class_autotools.xml
index a9e1a57..248b66a 100644
--- a/docs/usermanual/reference/class_autotools.xml
+++ b/docs/usermanual/reference/class_autotools.xml
@@ -12,7 +12,7 @@
   <para>The autotools class takes care of all of the details for you. It
   defines appropriate tasks for <emphasis>configure</emphasis>,
   <emphasis>compile</emphasis>, <emphasis>stage</emphasis> and
-  <emphasis>install</emphasis>. At it's simplest adding an inherit for the
+  <emphasis>install</emphasis>. At its simplest adding an inherit for the
   autotools class is all that is required. The netcat recipe for example
   is:<screen>DESCRIPTION = "GNU Netcat"
 HOMEPAGE = "http://netcat.sourceforge.net"
@@ -150,4 +150,4 @@ do_configure() {
     oe_runconf
 }</screen></para>
   </section>
-</section>
\ No newline at end of file
+</section>
diff --git a/docs/usermanual/reference/class_binconfig.xml b/docs/usermanual/reference/class_binconfig.xml
index 049f85e..4c60e67 100644
--- a/docs/usermanual/reference/class_binconfig.xml
+++ b/docs/usermanual/reference/class_binconfig.xml
@@ -37,10 +37,10 @@
   class.</para>
 
   <para>The class will search in source directory, <command>${S}</command>,
-  and all it's subdirectories, for files that end in
+  and all its subdirectories, for files that end in
   <command>-config</command> and process them as described above. All that is
   required to use the class is the addition of binconfig in an inherit
   statement:</para>
 
   <para><screen>inherit autotools binconfig</screen></para>
-</section>
\ No newline at end of file
+</section>
diff --git a/docs/usermanual/reference/class_image.xml b/docs/usermanual/reference/class_image.xml
index b591e9a..227f7e1 100644
--- a/docs/usermanual/reference/class_image.xml
+++ b/docs/usermanual/reference/class_image.xml
@@ -349,10 +349,10 @@ Alias /bogofeed ${DEPLOY_DIR}
 	<command>deploy/ipk</command>).</para>
         <para>Now, every image built will automatically contain feed configs
 	for the deploy directory (as of time of writing, deploy directory is internally structured with
-	per-arch subdirectories; so, there several feed configs are being generated, one for each subdirectory).
+	per-arch subdirectories; so, there are several feed configs being generated, one for each subdirectory).
         </para>
 
     </section>
 
   </section>
-</section>
\ No newline at end of file
+</section>
diff --git a/docs/usermanual/reference/dirs_install.xml b/docs/usermanual/reference/dirs_install.xml
index 75f85ac..14f3fc6 100644
--- a/docs/usermanual/reference/dirs_install.xml
+++ b/docs/usermanual/reference/dirs_install.xml
@@ -6,7 +6,7 @@
   control the directories into which files are installed.</para>
 
   <para>These variables can be used directly by the recipe to refer to paths
-  that will be used after the package is installed. For example, when specify
+  that will be used after the package is installed. For example, when specifying
   the location of configuration files you need to specify the location on the
   target as show in the following example from quagga:<screen># Indicate that the default files are configuration files
 CONFFILES_${PN} = "${sysconfdir}/default/quagga"
diff --git a/docs/usermanual/reference/fakeroot.xml b/docs/usermanual/reference/fakeroot.xml
index 5eb6a48..8457565 100644
--- a/docs/usermanual/reference/fakeroot.xml
+++ b/docs/usermanual/reference/fakeroot.xml
@@ -45,7 +45,7 @@ brw-------  1 root root 22, 0 Aug 18 13:20 hdc
     device node, even though we did not have to give a password for the root
     user. In reality this device node still doesn't exist, it just looks like
     it exits. Fakeroot is lying to the shell process and telling it that
-    <emphasis>"yes, this file exists and these are it's
+    <emphasis>"yes, this file exists and these are its
     properties"</emphasis>. We'll talk more about how fakeroot actually works
     in a minute.</para>
 
@@ -183,4 +183,4 @@ crw-r----- root/root    204,10 2006-08-16 13:07:12 ./dev/ttySC2
     oe_runmake install-man DESTDIR=${D}
     ...</screen></para>
   </section>
-</section>
\ No newline at end of file
+</section>

MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner, Hans-Joachim Reich



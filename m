Received: from ey-out-1920.google.com ([74.125.78.144])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1OHA0Y-0006xx-E3
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 08:22:30 +0200
Received: by ey-out-1920.google.com with SMTP id 26so197024eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 23:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=snE17Lc+fF783zhwd0ZTmfkdH4d+Gtb6VE7Zb8nc2cg=;
	b=jfXIKKeAdtoo3zs6faS+fjSiISdttlFcxwFjlptM/IKraZcl+QgY7NrN2djMrYOj/8
	v8HUoEFJQTwIg2xYfwYTI1R/lr7sPyYeOmoDsp0Ur9oykIAC7SeD5NfOHtpqJ4dR+LUj
	IvEZ2rcAMMbHUQ3F3yGv/lPDOCkGKceJxWSVg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rnGxZx7SAk3uOjV0X02FF4LkO67HIoSdKXOJ9nRio3mNQJ3oCcDHzDCqDDD7jCBl84
	FdqETAnCfFPhujCrIpEunBk+Mlg8OZupboNosu01vqLtYcEcuDnaTosW3iiC7z7sAzTb
	08yETnSiG61kDmOMcGw9saWvf3VnbXI41UJMM=
Received: by 10.213.35.18 with SMTP id n18mr1074480ebd.64.1274854701142;
	Tue, 25 May 2010 23:18:21 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 16sm2838642ewy.7.2010.05.25.23.18.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 23:18:20 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 08:17:55 +0200
Message-Id: <1274854676-5931-6-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1274854676-5931-1-git-send-email-koen@openembedded.org>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
X-SA-Exim-Connect-IP: 74.125.78.144
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k-kooi@ti.com>, Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 6/7] Usermanual/recipes: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 06:22:30 -0000

From: Chase Maupin <chase.maupin@ti.com>

* Fixed up typos and other errors in the documentation.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Koen Kooi <k-kooi@ti.com>
---
 docs/usermanual/chapters/recipes.xml |   66 +++++++++++++++++-----------------
 1 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/docs/usermanual/chapters/recipes.xml b/docs/usermanual/chapters/recipes.xml
index 6a574d8..9c1ec5d 100644
--- a/docs/usermanual/chapters/recipes.xml
+++ b/docs/usermanual/chapters/recipes.xml
@@ -154,7 +154,7 @@ VAR2 = "The version is ${PV}"</screen></para>
 
           <para>The following example:<screen>VAR1 ?= "New value"</screen>will
           set <emphasis role="bold">VAR1</emphasis> to <emphasis>"New
-          value"</emphasis> if its currently empty. However if it was already
+          value"</emphasis> if it is currently empty. However if it was already
           set it would be unchanged. In the following <emphasis
           role="bold">VAR1</emphasis> is left with the value
           <emphasis>"Original value"</emphasis>:<screen>VAR1 = "Original value"
@@ -290,7 +290,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
     </variablelist>
 
     <para>For a detailed description of the syntax for the bitbake recipe
-    files you should refer to the bitbake use manual.</para>
+    files you should refer to the bitbake user manual.</para>
   </section>
 
   <section id="recipes_versioning" xreflabel="versioning">
@@ -418,7 +418,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
   <section id="recipes_variables" xreflabel="variables">
     <title>Variables</title>
 
-    <para>One of the most confusing part of bitbake recipes for new users is
+    <para>One of the most confusing parts of bitbake recipes for new users is
     the large amount of variables that appear to be available to change and/or
     control the behaviour of some aspect of the recipe. Some variables, such
     as those derived from the file name are reasonably obvious, others are not
@@ -503,7 +503,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
     <para>Practically all recipes start with a header section which describes
     various aspects of the package that is being built. This information is
     typically used directly by the package format (such as ipkg or deb) as
-    its meta data used to describe the package.</para>
+    it is meta data used to describe the package.</para>
 
     <para>Variables used in the header include:</para>
 
@@ -536,7 +536,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
         <term>SECTION</term>
 
         <listitem>
-          <para>The section is used to categorise the application into a
+          <para>The section is used to categorize the application into a
           specific group. Often used by GUI based installers to help users
           when searching for software.</para>
 
@@ -625,7 +625,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
     file or a compressed archive file, such as .tar.gz or .zip, then the files
     will be uncompressed and extracted from the archive automatically.</para>
 
-    <para>Archive files will be extracted from with the working directory,
+    <para>Archive files will be extracted from within the working directory,
     <emphasis role="bold">${WORKDIR}</emphasis> and plain files will be copied
     into the same directory. Patches will be applied from within the unpacked
     source directory, <emphasis role="bold">${S}</emphasis>. (Details on these
@@ -722,7 +722,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
 
         <listitem>
           <para>This is where patches are applied and where the program is
-          expected to be compiled in.</para>
+          expected to be compiled.</para>
         </listitem>
       </varlistentry>
 
@@ -790,7 +790,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
            file://watchquagga.default"</screen>The recipe has two init files
       and two configuration files, which are not patches, but are actually
       files that it wants to include in the generated packages. Bitbake will
-      copy these files into the work directory. So to access them during the
+      copy these files into the working directory. So to access them during the
       install task we refer to them via the <emphasis
       role="bold">WORKDIR</emphasis> variable:<screen>do_install () {
     # Install init script and default settings
@@ -809,7 +809,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
       directory called <emphasis
       role="bold">&lt;packagename&gt;-&lt;version&gt;</emphasis> in the
       <emphasis role="bold">WORKDIR</emphasis> directory. This is the
-      directory in which it will change into before patching, compiling and
+      directory it will change into before patching, compiling and
       installing the package.</para>
 
       <para>For example, we have a package called <emphasis
@@ -875,7 +875,7 @@ S = "${WORKDIR}/widgets"</screen></para>
       <title>Staging directories</title>
 
       <para>Staging is used to make libraries, headers and binaries available
-      for the build of one recipe for use by another recipe. Building a
+      from the build of one recipe for use by another recipe. Building a
       library for example requires that packages be created containing the
       libraries and headers for development on the target as well as making
       them available on the host for building other packages that need the
@@ -1339,7 +1339,7 @@ $</screen>This shows us that the helloworld program is for an SH
       programs that you need to run a configure script for, passing various
       parameters, and then make. To make these work when cross-compiling you
       need to provides a lot of variables to the configure script. But all the
-      hard work as already been done for you. There's an <xref
+      hard work has already been done for you. There's an <xref
       linkend="autotools_class" /> which takes care of most of the complexity
       of building an autotools based package.</para>
 
@@ -1387,7 +1387,7 @@ inherit autotools</screen></para>
         </listitem>
 
         <listitem>
-          <para>Make modifications to prevent the configure script from tying
+          <para>Make modifications to prevent the configure script from trying
           to compile and run programs - any programs it compiles will be for
           the target and not the host and so cannot be run.</para>
         </listitem>
@@ -1519,7 +1519,7 @@ inherit autotools</screen></para>
           role="bold">.so</emphasis>, <emphasis role="bold">.a</emphasis> and
           associated libtool <emphasis role="bold">.la</emphasis> libraries.
           It will determine the appropriate libraries to install and take care
-          of any modifications that may be require for <emphasis
+          of any modifications that may be required for <emphasis
           role="bold">.la</emphasis> files.</para>
 
           <para>This function supports the following options:</para>
@@ -1839,7 +1839,7 @@ NOTE: package helloworld-0.1-r0: task do_package_write: completed</screen>We
     <section>
       <title>Default packages and files</title>
 
-      <para>The defaults package settings are defined in <emphasis
+      <para>The default package settings are defined in <emphasis
       role="bold">conf/bitbake.conf</emphasis> and are suitable for a lot of
       recipes without any changes. The following list shows the default values
       for the packaging related variables:</para>
@@ -2363,7 +2363,7 @@ addtask unpack_extra after do_unpack before do_patch</screen></para>
     <para>Often a certain pattern is followed in more than one recipe, or
     maybe some complex python based functionality is required to achieve the
     desired end result. This is achieved through the use of classes, which can
-    be found in the classes subdirectory at the top-level of on OE
+    be found in the classes subdirectory at the top-level of an OE
     checkout.</para>
 
     <para>Being aware of the available classes and understanding their
@@ -2390,7 +2390,7 @@ addtask unpack_extra after do_unpack before do_patch</screen></para>
     <para>A class is used via the inherit method. The following is an example
     for the <emphasis>curl</emphasis> recipe showing that it uses three
     classes:<screen>inherit autotools pkgconfig binconfig</screen>In this case
-    it is utilising the services of three separate classes:</para>
+    it is utilizing the services of three separate classes:</para>
 
     <variablelist>
       <varlistentry>
@@ -2443,7 +2443,7 @@ addtask unpack_extra after do_unpack before do_patch</screen></para>
     libraries, available for use by other recipes. This is different to
     installing because installing is about making things available for
     packaging and then eventually for use on the target device. Staging on the
-    other hand is about making things available on the host system for use by
+    other hand is about making things available on the host system for use in
     building later applications.</para>
 
     <para>Taking bzip2 as an example you can see that it stages a header file
@@ -2463,7 +2463,7 @@ addtask unpack_extra after do_unpack before do_patch</screen></para>
         <term>STAGING_INCDIR</term>
 
         <listitem>
-          <para>The directory into which staged headers files should be
+          <para>The directory into which staged header files should be
           installed. This is the equivalent of the standard <emphasis
           role="bold">/usr/include</emphasis> directory.</para>
         </listitem>
@@ -2531,7 +2531,7 @@ EXTRA_OECONF = "--disable-ldap \
           script of the package. In the gnupg case it needs to be told where
           the bzip2 headers and libraries are, and this is done via the
           <emphasis>--with-bzip2</emphasis> option. In this case it points to
-          the directory which include the lib and include subdirectories.
+          the directory which includes the lib and include subdirectories.
           Since OE doesn't define a variable for one level above the include
           and lib directories <emphasis role="bold">..</emphasis> is used to
           indicate one directory up. Without this, gnupg would search the host
@@ -2717,9 +2717,9 @@ pkg_postinst_${PN}-rdisc6 () {
 
         <listitem>
           <para>This class is used when installing and/or removing qpf fonts.
-          It register scripts to update the font paths and font cache
+          It registers scripts to update the font paths and font cache
           information to ensure that the font information is kept up to date
-          as fonts and installed and removed.</para>
+          as fonts are installed and removed.</para>
         </listitem>
       </varlistentry>
 
@@ -2972,7 +2972,7 @@ fi</screen></para>
       </listitem>
 
       <listitem>
-        <para>How do handle incrementally creating patches</para>
+        <para>How to handle incrementally creating patches</para>
       </listitem>
 
       <listitem>
@@ -3025,7 +3025,7 @@ fi</screen></para>
     </orderedlist>
 
     <para>This results in the packaging system, such as ipkg, considering
-    the released version to be older then the rc version.</para>
+    the released version to be older than the rc version.</para>
 
     <para>In OpenEmbedded the correct naming of pre and rc versions is to use
     the previous version number followed by a + followed by the new version
@@ -3138,7 +3138,7 @@ do_configure() {
     role="bold">0_9_0</emphasis>.</para>
 
     <para>Some of the more common python code in use in existing recipes is
-    shown in the following table:</para>
+    shown in the following list:</para>
 
     <variablelist>
       <varlistentry>
@@ -3389,7 +3389,7 @@ $</screen>then we would expect it to select version
     (since all of the existing versions have a preference of 0). Note that you
     can still call bitbake directly on the recipe:<screen>bitbake -b recipes/procps/procps_4.0.0.bb</screen>This
     enables you to test, and fix the package manually without having bitbake
-    automatically select normally.</para>
+    automatically select it normally.</para>
 
     <para>By using this feature in conjunction with overrides you can also
     disable (or select) specific versions based on the override. The following
@@ -3418,7 +3418,7 @@ $</screen>then we would expect it to select version
       </listitem>
 
       <listitem>
-        <para>samlpe/standard script?</para>
+        <para>sample/standard script?</para>
       </listitem>
 
       <listitem>
@@ -3445,13 +3445,13 @@ $</screen>then we would expect it to select version
     from other packages.</para>
 
     <para>The most common reason for alternatives is to reduce the size of the
-    binaries. But cutting down on features, built in help and error messages
+    binaries. By cutting down on features, built in help, error messages
     and combining multiple binaries into one large binary it's possible to
     save considerable space. Often users are not expected to use the commands
     interactively in embedded appliances and therefore these changes have no
     visible effect to the user. In some situations users may have interactive
     access, or they may be more advanced users who want shell access on
-    appliances that normal don't provide it, and in these cases they should be
+    appliances that normally don't provide it, and in these cases they should be
     able to install the full functional version if they desire.</para>
 
     <section>
@@ -3478,7 +3478,7 @@ update-alternatives: Linking //usr/bin/find to find.findutils
 update-alternatives: Linking //usr/bin/xargs to xargs.findutils</screen></para>
 
       <para>Then we see that the standard version of find changes to the full
-      featured implement ion:<screen>root@titan:~$ find --version
+      featured implementation:<screen>root@titan:~$ find --version
 find --version
 GNU find version 4.2.29
 Features enabled: D_TYPE O_NOFOLLOW(enabled) LEAF_OPTIMISATION
@@ -3576,7 +3576,7 @@ which find
         </listitem>
 
         <listitem>
-          <para>even if your distro don't use /var in tmpfs, others do</para>
+          <para>even if your distro doesn't use /var in tmpfs, others do</para>
         </listitem>
 
         <listitem>
@@ -3588,7 +3588,7 @@ which find
     <section>
       <title>Logging and log files</title>
 
-      <para>As a consequence of the non-volatile and/or small capacity of the
+      <para>As a consequence of the volatile and/or small capacity of the
       <emphasis role="bold">/var</emphasis> file system some distributions
       choose methods of logging other than writing to a file. The most typical
       is the use of an in-memory circular log buffer which can be read using
@@ -3616,7 +3616,7 @@ which find
         </listitem>
 
         <listitem>
-          <para>Don't include any <command>/var</command> directories, file or
+          <para>Don't include any <command>/var</command> directories, files or
           symlinks in packages. They would be lost on a reboot and so should
           not be included in packages.</para>
         </listitem>
@@ -3643,7 +3643,7 @@ which find
 
     <itemizedlist>
       <listitem>
-        <para>about optimisation</para>
+        <para>about optimization</para>
       </listitem>
 
       <listitem>
-- 
1.7.0




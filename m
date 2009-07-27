Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MVL3I-0001w0-G8
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jul 2009 09:55:21 +0200
Received: by rv-out-0708.google.com with SMTP id l33so837523rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2009 00:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=VeVIdQqH8M2Gyp0E0x2jWTQtjwFQ17Mdp9Eoqn48lVI=;
	b=Dh5YWrNVKrAqpTVV0kKURhJSrlWxTBJr32+u1cnkGPsUIoPjB8NOb7Gu2JZB1gfUke
	TCEBa7exHyB/gSX1VU99sNKty79KdO8z/e/MNYXWcngwzKeBvGonm8gkqangpwBLgkhh
	WAluWtB/+FsJkPF7gFmXKczv7RZwpbPaubJLE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=JjOUEh+qVAwQX4w9yv5cLxhDL7OXLRcm/yrpBh6C92EyC+5VkG4ixkSyYojlihAxxG
	T43j4ff1IkYn7bcIx2lwQKpcNqYYLIoJYM52tR2Yi5W1i5uAfFnE4iTAgf5S2x07c2Gq
	h1Ku6YWw8Fk9yEVlkrVojau5VninIW2K5a4rM=
Received: by 10.140.136.6 with SMTP id j6mr3513607rvd.21.1248680440548;
	Mon, 27 Jul 2009 00:40:40 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 3sm11295094pzk.65.2009.07.27.00.40.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 27 Jul 2009 00:40:39 -0700 (PDT)
Message-ID: <4A6D59E2.20106@gmail.com>
Date: Mon, 27 Jul 2009 17:10:18 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] docs/usermanual/chapters/recipes.xml
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
X-List-Received-Date: Mon, 27 Jul 2009 07:55:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Mainly grammar fixes.

-Graham

diff --git a/docs/usermanual/chapters/recipes.xml b/docs/usermanual/chapters/recipes.xml
index 1107873..480e8be 100644
--- a/docs/usermanual/chapters/recipes.xml
+++ b/docs/usermanual/chapters/recipes.xml
@@ -5,24 +5,24 @@
   <section id="recipes_introduction" xreflabel="introduction">
     <title>Introduction</title>
 
-    <para>A bitbake recipe is a set of instructions that describe what needs
+    <para>A bitbake recipe is a set of instructions that describes what needs
     to be done to retrieve the source code for some application, apply any
     necessary patches, provide any additional files (such as init scripts),
-    compile it, install it and generated binary packages. The end result is a
+    compile it, install it and generate binary packages. The end result is a
     binary package that you can install on your target device, and maybe some
     intermediate files, such as libraries and headers, which can be used when
-    building other application.</para>
+    building other applications.</para>
 
     <para>In many ways the process is similar to creating .deb or .rpm
     packages for your standard desktop distributions with one major difference
     - in OpenEmbedded everything is being cross-compiled. This often makes the
     task far more difficult (depending on how well suited the application is
-    to cross compiling), then it is for other packaging systems and sometime
+    to cross compiling), than it is for other packaging systems and sometimes
     impossible.</para>
 
     <para>This chapter assumes that you are familiar with working with
-    bitbake, including the work flow, required directory structures, bitbake
-    configuration and the use of monotone. If you are not familiar with these
+    bitbake, including the work flow, required directory structures and bitbake
+    configuration. If you are not familiar with these
     then first take a look at the chapter on bitbake usage.</para>
   </section>
 
@@ -41,7 +41,7 @@
           a task function, or to compliment (append or prepend to an existing
           function) a default function. Standard functions use sh shell
           syntax, although access to OpenEmbedded variables and internal
-          methods is also available.</para>
+          methods are also available.</para>
 
           <para>The following is an example function from the sed
           recipe:</para>
@@ -67,7 +67,7 @@
           contents of other variables. In addition to assignment, appending
           and prepending operations are also supported.</para>
 
-          <para>The follow example shows the some of the ways variables can be
+          <para>The following example shows some of the ways variables can be
           used in recipes:<screen>S = "${WORKDIR}/postfix-${PV}"
 PR = "r4"
 CFLAGS += "-DNO_ASM"
@@ -111,7 +111,7 @@ require otherfile.inc</screen></para>
         <term>Line continuation: \</term>
 
         <listitem>
-          <para>To split a line over multiple lines you should place a \ at
+          <para>To split a statement over multiple lines you should place a \ at
           the end of the line that is to be continued on the next line.</para>
 
           <screen>VAR = "A really long \
@@ -123,15 +123,6 @@ require otherfile.inc</screen></para>
       </varlistentry>
 
       <varlistentry>
-        <term>Comments: #</term>
-
-        <listitem>
-          <para>Any lines beginning with a # are comments and will be
-          ignored.<screen># This is a comment</screen></para>
-        </listitem>
-      </varlistentry>
-
-      <varlistentry>
         <term>Using variables: ${...}</term>
 
         <listitem>
@@ -159,7 +150,7 @@ VAR2 = "The version is ${PV}"</screen></para>
           variable, but only when the variable is currently unset. This is
           commonly used to provide a default value for use when no specific
           definition is provided by the machine or distro configuration of the
-          users local.conf configuration.</para>
+          user's local.conf configuration.</para>
 
           <para>The following example:<screen>VAR1 ?= "New value"</screen>will
           set <emphasis role="bold">VAR1</emphasis> to <emphasis>"New
@@ -203,11 +194,11 @@ VAR1 ?= "New value"</screen></para>
           <emphasis>+=</emphasis>, and <emphasis>=+</emphasis> operators have
           been applied.</para>
 
-          <para>The following example show the space being explicitly added to
+          <para>The following example shows the space being explicitly added to
           the start to ensure the appended value is not merged with the
           existing value:<screen>SRC_URI_append = " file://fix-makefile.patch;patch=1"</screen>The
           <emphasis>_append</emphasis> method can also be used with overrides,
-          which result in the actions only being performed for the specified
+          which results in the actions only being performed for the specified
           target or machine: [TODO: Link to section on overrides]<screen>SRC_URI_append_sh4 = " file://fix-makefile.patch;patch=1"</screen>Note
           that the appended information is a variable itself, and therefore
           it's possible to used <emphasis>+=</emphasis> or
@@ -226,7 +217,7 @@ SRC_URI_append += "file://fix-install.patch;patch=1"</screen></para>
           space, and it is applied after all the <emphasis>+=</emphasis>, and
           <emphasis>=+</emphasis> operators have been applied.</para>
 
-          <para>The following example show the space being explicitly added to
+          <para>The following example shows the space being explicitly added to
           the end to ensure the prepended value is not merged with the
           existing value:<screen>CFLAGS_prepend = "-I${S}/myincludes "</screen>The
           <emphasis>_prepend</emphasis> method can also be used with
@@ -239,7 +230,7 @@ SRC_URI_append += "file://fix-install.patch;patch=1"</screen></para>
           <emphasis>_prepend</emphasis> information:<screen>CFLAGS_prepend = "-I${S}/myincludes "
 CFLAGS_prepend += "-I${S}/myincludes2 "</screen>Note also the lack of a space
           when using += to append to a prepend value - remember that the +=
-          operator is adding space itself.</para>
+          operator adds space itself.</para>
         </listitem>
       </varlistentry>
 
@@ -261,7 +252,7 @@ CFLAGS_prepend += "-I${S}/myincludes2 "</screen>Note also the lack of a space
           a python script in the contrib directory called
           <emphasis>oe-stylize.py</emphasis> which can be used to reformat
           your recipes to the correct style. The output will contain a list of
-          warning (to let you know what you did wrong) which should be edited
+          warnings (to let you know what you did wrong) which should be edited
           out before using the new file.<screen>contrib/oe-stylize.py myrecipe.bb &gt; fixed-recipe.bb
 vi fixed-recipe.bb
 mv fixed.recipe.bb myrecipe.bb</screen></para>
@@ -287,9 +278,9 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
         <term>Shell syntax</term>
 
         <listitem>
-          <para>When describing a list of actions to take shell syntax is used
-          (as if you were writing a shell script). You should ensure that you
-          script would work with a generic sh and not require any bash (or
+          <para>When describing a list of actions to take, shell syntax is used
+          (as if you were writing a shell script). You should ensure that your
+          script works with a generic sh and not require any bash (or
           other shell) specific functionality. The same applies to various
           system utilities (sed, grep, awk etc) that you may wish to use. If
           in doubt you should check with multiple implementations - including
@@ -307,7 +298,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
 
     <para>Recipes in OpenEmbedded use a standard naming convention that
     includes the package name and version number in the filename. In addition
-    to the name and version there is also a release number, which is indicates
+    to the name and version there is also a release number, which indicates
     changes to the way the package is built and/or packaged. The release
     number is contained within the recipe itself.</para>
 
@@ -380,9 +371,8 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
         <term>PR</term>
 
         <listitem>
-          <para>The package release. This is explicitly set in the recipe, or
-          if not set it defaults to "<emphasis>r0"</emphasis> if not
-          set.</para>
+          <para>The package release. This is explicitly set in the recipe.
+          It defaults to "<emphasis>r0"</emphasis> if not set.</para>
         </listitem>
       </varlistentry>
 
@@ -405,7 +395,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
           <para>The package name, version and release separated by
           hyphens.<screen>PF = "${PN}-${PV}-${PR}"</screen></para>
 
-          <para>For the s<command>trace_4.5.14.bb recipe</command>, with PR
+          <para>For the <command>strace_4.5.14.bb recipe</command>, with PR
           set to <emphasis>"r1"</emphasis> in the recipe, the PF variable
           would be set to <emphasis>"strace-4.5.14-r1"</emphasis>.</para>
         </listitem>
@@ -454,7 +444,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
       </listitem>
 
       <listitem>
-        <para>Bitbake itself will define some variables. The FILE variables
+        <para>Bitbake itself will define some variables. The FILE variable
         that defines the name of the bitbake recipe being processed is set by
         bitbake itself for example. Refer to the bitbake manual for more
         information on the variables that bitbake sets.</para>
@@ -462,8 +452,8 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
 
       <listitem>
         <para>The classes, that are used via the inherit keyword, define
-        and/or use the majority of the remaining variables. A class is a like
-        a library that contain parts of a bitbake recipe that are used by
+        and/or use the majority of the remaining variables. A class is like
+        a library that contains parts of a bitbake recipe that is used by
         multiple recipes. To make them usable in more situations they often
         include a large number of variables to control how the class
         operates.</para>
@@ -479,7 +469,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
         <term>target</term>
 
         <listitem>
-          <para>Refers to things built for the target are expected to be run
+          <para>Refers to things built for the target and are expected to be run
           on the target device itself.</para>
         </listitem>
       </varlistentry>
@@ -510,7 +500,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
   <section id="recipes_header" xreflabel="header">
     <title>Header</title>
 
-    <para>Practically all recipes start was the header section which describes
+    <para>Practically all recipes start with a header section which describes
     various aspects of the package that is being built. This information is
     typically used directly by the package format (such as ipkg or deb) as
     it's meta data used to describe the package.</para>
@@ -523,7 +513,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
 
         <listitem>
           <para>Describes what the software does. Hopefully this gives enough
-          information to a use to know if it's the right application for
+          information to a user to know if it's the right application for
           them.</para>
 
           <para>The default description is: <emphasis>"Version ${PV}-${PR} of
@@ -586,10 +576,10 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
   <section id="recipes_sources" xreflabel="sources">
     <title>Sources: Downloading, patching and additional files</title>
 
-    <para>A recipes purpose is to describe how to take a software package and
+    <para>A recipe's purpose is to describe how to take a software package and
     build it for your target device. The location of the source file (or
     files) is specified via the <xref linkend="src_uri_variable" /> in the
-    recipe. This can describe several types of URI's, the most common
+    recipe. This can describe several types of URIs, the most common
     are:</para>
 
     <variablelist>
@@ -625,13 +615,13 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
         <term>patches</term>
 
         <listitem>
-          <para>Patches are plain files which are treated as patched and
+          <para>Plain files which are treated as patches and
           automatically applied.</para>
         </listitem>
       </varlistentry>
     </variablelist>
 
-    <para>If a http, https or file URI refers to a compressed file, an archive
+    <para>If an http, https or file URI refers to a compressed file, an archive
     file or a compressed archive file, such as .tar.gz or .zip, then the files
     will be uncompressed and extracted from the archive automatically.</para>
 
@@ -658,7 +648,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
           <para>This is the URI of the havp source code. Note the use of the
           <emphasis role="bold">${PV}</emphasis> variable to specify the
           version. This is done to enable the recipe to be renamed for a new
-          version without the need the edit the recipe itself. Because this is
+          version without the need to edit the recipe itself. Because this is
           a .tar.gz compressed archive the file will be decompressed and
           extracted in the working dir <emphasis
           role="bold">${WORKDIR}</emphasis>.</para>
@@ -696,15 +686,15 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
     </variablelist>
 
     <para>Full details on the <emphasis role="bold">SRC_URI</emphasis>
-    variable and all the support URI's is available in the <xref
+    variable and all the support URIs are available in the <xref
     linkend="src_uri_variable" /> section of the reference chapter.</para>
   </section>
 
   <section id="recipes_directories" xreflabel="directories">
     <title>Directories: What goes where</title>
 
-    <para>A large part of the work or a recipe is involved with specifying
-    where files and found and where they have to go. It's important for
+    <para>A large part of the work of a recipe is involved with specifying
+    where files are found and where they have to go. It's important for
     example that programs do not try and use files from <emphasis
     role="bold">/usr/include</emphasis> or <emphasis
     role="bold">/usr/lib</emphasis> since they are for the host system, not
@@ -785,13 +775,13 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
     <section>
       <title>WORKDIR: The working directory</title>
 
-      <para>The working directory is where the source code is extracted, to
-      which plain files (not patches) are copied and where the logs and
+      <para>The working directory is where the source code is extracted,
+      plain files (not patches) are copied and where the logs and
       installation files are created. A typical reason for needing to
       reference the work directory is for the handling of non patch
       files.</para>
 
-      <para>If we take a look at the recipe for quagga we can see an example
+      <para>If we take a look at the recipe for quagga we can see example
       non patch files for configuration and init scripts:<screen>SRC_URI = "http://www.quagga.net/download/quagga-${PV}.tar.gz \
            file://fix-for-lib-inpath.patch;patch=1 \
            file://quagga.init \
@@ -820,7 +810,7 @@ mv fixed.recipe.bb myrecipe.bb</screen></para>
       role="bold">&lt;packagename&gt;-&lt;version&gt;</emphasis> in the
       <emphasis role="bold">WORKDIR</emphasis> directory. This is the
       directory in which it will change into before patching, compiling and
-      installating the package.</para>
+      installing the package.</para>
 
       <para>For example, we have a package called <emphasis
       role="bold">widgets_1.2.bb</emphasis> which we are extracting from the
@@ -846,7 +836,7 @@ S = "${WORKDIR}/widgets"</screen></para>
 
       <para>The destination directory is where the completed application and
       all of it's files are installed into in preparation for packaging.
-      Typically an installation would places files in directories such as
+      Typically an installation would place files in directories such as
       <emphasis role="bold">/etc</emphasis> and <emphasis
       role="bold">/usr/bin</emphasis> by default. Since those directories are
       used by the host system we do not want the packages to install into
@@ -896,16 +886,16 @@ S = "${WORKDIR}/widgets"</screen></para>
       <emphasis>stage</emphasis> task in the recipe. Any recipes that contain
       items that are required to build other packages should have a
       <emphasis>stage</emphasis> task to make sure the items are all correctly
-      placed into the staging area. The following example from clamav show the
+      placed into the staging area. The following example from clamav shows the
       clamav library and header being placed into the staging area:<screen>do_stage () {
         oe_libinstall -a -so libclamav ${STAGING_LIBDIR}
         install -m 0644 libclamav/clamav.h ${STAGING_INCDIR}
 }</screen></para>
 
-      <para>The following from the p3scan recipe show the path to the clamav
+      <para>The following from the p3scan recipe shows the path to the clamav
       library and header being passed to the configure script. Without this
       the configure script would either fail to find the library, or worse
-      still search the host systems directories for the library. Passing in
+      still search the host system's directories for the library. Passing in
       the location results in it searching the correct location and finding
       the clamav library and headers:<screen>EXTRA_OECONF = "--with-clamav=${STAGING_LIBDIR}/.. \
                 --with-openssl=${STAGING_LIBDIR}/.. \
@@ -936,7 +926,7 @@ S = "${WORKDIR}/widgets"</screen></para>
 
       <para>Typically you will not need to modify these, but it is useful to
       be aware of the default values. In particular when searching for patches
-      and/or files (file:// URI's), the default search path is:</para>
+      and/or files (file:// URIs), the default search path is:</para>
 
       <variablelist>
         <varlistentry>
@@ -956,7 +946,7 @@ S = "${WORKDIR}/widgets"</screen></para>
           <listitem>
             <para>This is the package name and version, such as "<emphasis
             role="bold">strace-4.5.14</emphasis>". This is by far the most
-            common place to place version specified patches.</para>
+            common place to place version specific patches.</para>
           </listitem>
         </varlistentry>
 
@@ -975,7 +965,7 @@ S = "${WORKDIR}/widgets"</screen></para>
           <listitem>
             <para>This is just the directory called "<emphasis
             role="bold">files</emphasis>". This is commonly used for patches
-            and files that apply to all version of the package.</para>
+            and files that apply to all versions of the package.</para>
           </listitem>
         </varlistentry>
 
@@ -993,8 +983,8 @@ S = "${WORKDIR}/widgets"</screen></para>
       role="bold">${FILE_DIRNAME}</emphasis> which is the directory in which
       the recipe that is being processed is located.</para>
 
-      <para>The full set of variables that control the file locations and
-      patch are:</para>
+      <para>The full set of variables that control the file locations
+      are:</para>
 
       <variablelist>
         <varlistentry>
@@ -1020,7 +1010,7 @@ S = "${WORKDIR}/widgets"</screen></para>
 
           <listitem>
             <para>The default set of directories which are available to use
-            for the file:// URI's. Each directory is searched, in the
+            for the file:// URIs. Each directory is searched, in the
             specified order, in an attempt to find the file specified by each
             file:// URI: <screen>FILESPATH = "${FILE_DIRNAME}/${PF}:${FILE_DIRNAME}/${P}:\
 ${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"</screen></para>
@@ -1031,7 +1021,7 @@ ${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"</screen></para>
           <term>FILESDIR</term>
 
           <listitem>
-            <para>The default directory to search for file:// URI's. Only used
+            <para>The default directory to search for file:// URIs. Only used
             if the file is not found in FILESPATH. This can be used to easily
             add one additional directory to the search path without having to
             modify the default FILESPATH setting. By default this is just the
@@ -1047,16 +1037,16 @@ ${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"</screen></para>
       done is when one recipe includes another one in which the default values
       will be based on the name of the package doing the including, not the
       included package. Typically the included package will expect the files
-      to be located in a directories based on it's own name.</para>
+      to be located in a directory based on it's own name.</para>
 
       <para>As an example the m4-native recipe includes the m4 recipe. This is
-      fine, except that the m4 recipes expects its files and patches to be
-      located in a directory called <emphasis role="bold">m4</emphasis>
-      directory while the native file name results in them being searched for
+      fine, except that the m4 recipe expects its files and patches to be
+      located in a directory called <emphasis role="bold">m4</emphasis>,
+      while the native file name results in them being searched for
       in <emphasis role="bold">m4-native</emphasis>. So the m4-native recipe
       sets the <emphasis role="bold">FILESDIR</emphasis> variable to the value
-      that of m4 to add the actual m4 directory (where m4 itself has its files
-      stored) to the list of directories search for:<screen>        include m4_${PV}.bb
+      of the actual m4 directory (where m4 itself has its files
+      stored):<screen>        include m4_${PV}.bb
         inherit native
         FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/m4"</screen></para>
     </section>
@@ -1075,13 +1065,13 @@ ${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"</screen></para>
 
       <para>Now it's time for our first recipe. This is going to be one of the
       simplest possible recipes: all code is included and there's only one
-      file to compile and one readme file. While this isn't all that common
+      file to compile and one readme file. While this isn't all that common,
       it's a useful example because it doesn't depend on any of the helper
       classes which can sometime hide a lot of what is going on.</para>
 
       <para>First we'll create the myhelloworld.c file and a readme file.
       We'll place this in the files subdirectory, which is one of the places
-      that is searched for file:// URI's:<screen>mkdir recipes/myhelloworld
+      that is searched for file:// URIs:<screen>mkdir recipes/myhelloworld
 mkdir recipes/myhelloworld/files
 cat &gt; recipes/myhelloworld/files/myhelloworld.c
 #include &lt;stdio.h&gt;
@@ -1108,13 +1098,13 @@ Readme file for myhelloworld.
 PR = "r0"</screen></para>
 
       <para>Next we need to tell it which files we want to be included in the
-      recipe, which we do via file:// URI's and the SRC_URI variable:<screen>SRC_URI = "file://myhelloworld.c \
+      recipe, which we do via file:// URIs and the SRC_URI variable:<screen>SRC_URI = "file://myhelloworld.c \
            file://README.txt"</screen></para>
 
-      <para>Note the use of the \ to continue a file and the file of file://
-      local URI's, rather than other types such as http://.</para>
+      <para>Note the use of the \ to continue a file and the use of file://
+      local URIs, rather than other types such as http://.</para>
 
-      <para>Now we need provide a compile task which tells bitbake how to
+      <para>Now we need to provide a compile task which tells bitbake how to
       compile this program. We do this by defining a do_compile function in
       the recipe and providing the appropriate commands:</para>
 
@@ -1129,7 +1119,7 @@ PR = "r0"</screen></para>
           <para>use of the pre-defined compiler variables, <emphasis
           role="bold">${CC}</emphasis>, <emphasis
           role="bold">${CFLAGS}</emphasis> and <emphasis
-          role="bold">${LDFLAGS}</emphasis>. These are setup automatically to
+          role="bold">${LDFLAGS}</emphasis>. These are set up automatically to
           contain the settings required to cross-compile the program for the
           target.</para>
         </listitem>
@@ -1155,7 +1145,7 @@ PR = "r0"</screen></para>
 
       <itemizedlist>
         <listitem>
-          <para>use the <emphasis role="bold">install</emphasis> command to
+          <para>use of the <emphasis role="bold">install</emphasis> command to
           create directories and install the files, not cp.</para>
         </listitem>
 
@@ -1181,7 +1171,7 @@ PR = "r0"</screen></para>
         <listitem>
           <para>use of <emphasis role="bold">${WORKDIR}</emphasis> to get
           access to the <emphasis role="bold">README.txt</emphasis> file,
-          which was provided via file:// URI.</para>
+          which was provided via a file:// URI.</para>
         </listitem>
       </itemizedlist>
 
@@ -1338,7 +1328,7 @@ tmp/work/myhelloworld-0.1-r0/install/myhelloworld/usr/bin/myhelloworld: ELF 32-b
 ~/oe%&gt;</screen>This shows us that the helloworld program is for an SH
       processor (obviously this will change depending on what your target
       system is), while checking the <emphasis role="bold">/bin/ls</emphasis>
-      program on host shows us that the host system is an AMD X86-64 system.
+      program on the host shows us that the host system is an AMD X86-64 system.
       That's exactly what we wanted.</para>
     </section>
 
@@ -1351,7 +1341,7 @@ tmp/work/myhelloworld-0.1-r0/install/myhelloworld/usr/bin/myhelloworld: ELF 32-b
       need to provides a lot of variables to the configure script. But all the
       hard work as already been done for you. There's an <xref
       linkend="autotools_class" /> which takes care of most of the complexity
-      of building an autotools based packages.</para>
+      of building an autotools based package.</para>
 
       <para>Let's take a look at the tuxnes recipe which is an example of a
       very simple autotools based recipe:<screen>%~oe&gt; cat recipes/tuxnes/tuxnes_0.75.bb
@@ -1367,11 +1357,11 @@ SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/tuxnes/tuxnes-0.75.tar.g
 inherit autotools</screen></para>
 
       <para>This is a really simple recipe. There's the standard header that
-      describes the package. Then the SRC_URI, which in this case is a http
+      describes the package. Then the SRC_URI, which in this case is an http
       URL that causes the source code to be downloaded from the specified URI.
       And finally there's an "<emphasis role="bold">inherit
       autotools</emphasis>" command which loads the autotools class. The
-      autotools class will take care of generating the require configure,
+      autotools class will take care of generating the required configure,
       compile and install tasks. So in this case there's nothing else to do -
       that's all there is to it.</para>
 
@@ -1392,7 +1382,7 @@ inherit autotools</screen></para>
 
         <listitem>
           <para>Make modifications to prevent searching for headers and
-          libraries in the normal locations (since they below to the host
+          libraries in the normal locations (since they belong to the host
           system, not the target);</para>
         </listitem>
 
@@ -1434,7 +1424,7 @@ inherit autotools</screen></para>
 
         <listitem>
           <para>Specifies build-time dependencies, via a list of bitbake
-          recipes to build prior to build the recipe. These are programs
+          recipes to build prior to building the recipe. These are programs
           (flex-native) or libraries (libpcre) that are required in order to
           build the package.</para>
         </listitem>
@@ -1457,7 +1447,7 @@ inherit autotools</screen></para>
     </variablelist>
 
     <para>If we take openssh for an example, it requires zlib and openssl in
-    order to both built and run. In the recipe we have:<screen>DEPENDS = "zlib openssl"</screen>This
+    order to both build and run. In the recipe we have:<screen>DEPENDS = "zlib openssl"</screen>This
     tells bitbake that it will need to build and stage zlib and openssl prior
     to trying to build openssh, since openssh requires both of them. Note that
     there is no <emphasis role="bold">RDEPENDS</emphasis> even though openssh
@@ -1581,7 +1571,7 @@ inherit autotools</screen></para>
         <term>oenote</term>
 
         <listitem>
-          <para>Used to display an informational messages to the user.</para>
+          <para>Used to display informational messages to the user.</para>
 
           <para>The following example from net-snmp uses oenote to tell the
           user which endianess it determined was appropriate for the target
@@ -1652,7 +1642,7 @@ inherit autotools</screen></para>
         <listitem>
           <para>The base conditional python function is used to set a variable
           to one of two values based on the definition of a third variable.
-          The general usage is:<screen>${@base_conditional('&lt;variable-name&gt;', '&lt;value&gt;', '&lt;true-result&gt;', &lt;false-result&gt;', d)}"</screen>where:</para>
+          The general usage is:<screen>${@base_conditional('&lt;variable-name&gt;', '&lt;value&gt;', '&lt;true-result&gt;', '&lt;false-result&gt;', d)}"</screen>where:</para>
 
           <variablelist>
             <varlistentry>
@@ -1698,7 +1688,7 @@ inherit autotools</screen></para>
           </note>
 
           <para>The following example from the openssl recipe shows the
-          addition of either <emphasis role="bold">-DL_ENDING</emphasis> or
+          addition of either <emphasis role="bold">-DL_ENDIAN</emphasis> or
           <emphasis role="bold">-DB_ENDIAN</emphasis> depending on the value
           of <emphasis role="bold">SITEINFO_ENDIANESS</emphasis> which is set
           to le for little endian targets and to be for big endian
@@ -1715,7 +1705,7 @@ inherit autotools</screen></para>
   <section id="recipes_packages" xreflabel="packages">
     <title>Packaging: Defining packages and their contents</title>
 
-    <para>A bitbake recipe is a set of instructions from creating one, or
+    <para>A bitbake recipe is a set of instructions for creating one, or
     more, packages for installation on the target device. Typically these are
     .ipkg or .deb packages (although bitbake itself isn't associated with any
     particular packaging format).</para>
@@ -1753,8 +1743,8 @@ NOTE: package helloworld-0.1-r0: task do_package_write: completed</screen>We
         package <emphasis role="bold">helloworld-dev-0.1-r0_sh4.ipk</emphasis>
         and a locale package <emphasis
         role="bold">helloworld-locale-0.1-r0_sh4.ipk</emphasis>. It didn't
-        create the package due to the fact that it couldn't find any files
-        that would actually go in the package.</para>
+        create the packages due to the fact that it couldn't find any files
+        that would actually go in the packages.</para>
       </listitem>
     </itemizedlist>
 
@@ -1773,7 +1763,7 @@ NOTE: package helloworld-0.1-r0: task do_package_write: completed</screen>We
         directories that are considered to belong to those packages. The
         documentation packages for example include anything found <emphasis
         role="bold">/usr/share/doc</emphasis>. The set of files and
-        directories is controlled via the <emphasis
+        directories are controlled via the <emphasis
         role="bold">FILES_&lt;package-name&gt;</emphasis> variables.</para>
       </listitem>
 
@@ -1800,7 +1790,7 @@ NOTE: package helloworld-0.1-r0: task do_package_write: completed</screen>We
       binaries, and it would be common to only use one or the other, then you
       should consider separating them into separate packages.</para>
 
-      <para>By default several groups of files are automatically separate out,
+      <para>By default several groups of files are automatically separated out,
       including:</para>
 
       <variablelist>
@@ -1811,7 +1801,7 @@ NOTE: package helloworld-0.1-r0: task do_package_write: completed</screen>We
             <para>Any files required for development. This includes header
             files, static libraries, the shared library symlinks required only
             for linking etc. These would only ever need to be installed by
-            someone attempt to compile applications on the target device.
+            someone attempting to compile applications on the target device.
             While this does happen it is very uncommon and so these files are
             automatically moved into a separate package</para>
           </listitem>
@@ -2026,7 +2016,7 @@ PACKAGES += "FILES-${PN}-test"</screen>
       role="bold">${PN}-test</emphasis>, and if we look at the definition of
       <emphasis role="bold">FILES-${PN}</emphasis> it contains the <emphasis
       role="bold">${bindir}/*</emphasis> wildcard. Since <emphasis
-      role="bold">${PN}</emphasis> is first it'll match that wildcard are be
+      role="bold">${PN}</emphasis> is first it'll match that wildcard and be
       moved into the <emphasis role="bold">${PN}</emphasis> package prior to
       processing of the <emphasis role="bold">${PN}-test</emphasis>
       package.</para>
@@ -2044,7 +2034,7 @@ PACKAGES += "FILES-${PN}-test"</screen>
           now this will only match things in the bindir that start with p, and
           therefore not match our test program. Note that <emphasis
           role="bold">FILES-${PN}</emphasis> contains a lot more entries and
-          we'd need to add any of the other that refer to files that are to be
+          we'd need to add any of the others that refer to files that are to be
           included in the package. In this case we have no other files, so
           it's safe to do this simple declaration.</para>
         </listitem>
@@ -2076,7 +2066,7 @@ PACKAGES += "FILES-${PN}-test"</screen>
       exactly what files went into each package, which files were not packaged
       and which packages contain no files.</para>
 
-      <para>One of easiest method is to run find on the install directory. In
+      <para>One of the easiest methods is to run find on the install directory. In
       the install directory there is one subdirectory created per package, and
       the files are moved into the install directory as they are matched to a
       specific package. The following shows the packages and files for the
@@ -2097,7 +2087,7 @@ tmp/work/helloworld-0.1-r0/install/helloworld/usr/bin
 tmp/work/helloworld-0.1-r0/install/helloworld/usr/bin/helloworld
 ~/oe%&gt;</screen>The above shows that the -local, -dbg and -dev packages are
       all empty, and the -doc and base package contain a single file each.
-      Uses "<emphasis role="bold">-type f</emphasis>" option to find to show
+      Using the "<emphasis role="bold">-type f</emphasis>" option to find to show
       just files will make this clearer as well.</para>
 
       <para>In addition to the install directory the image directory (which
@@ -2115,7 +2105,7 @@ tmp/work/helloworld-0.1-r0/image/usr/share/doc/helloworld
       f</emphasis>" makes this much clearer:<screen>~/oe%&gt; find tmp/work/helloworld-0.1-r0/image -type f
 ~/oe%&gt;</screen></para>
 
-      <para>Messages reading missing files are also display by bitbake during
+      <para>Messages regarding missing files are also displayed by bitbake during
       the package task:<screen>NOTE: package helloworld-0.1-r0: task do_package: started
 NOTE: the following files were installed but not shipped in any package:
 NOTE:   /usualdir/README.txt
@@ -2137,11 +2127,11 @@ NOTE: package helloworld-0.1-r0: task do_package: completed</screen>Except in
       in the first place during the install task.</para>
 
       <para>In some cases it may be easier to let the package install the file
-      and then explicitly remove the file and the end of the install task. The
+      and then explicitly remove the file at the end of the install task. The
       following example from the samba recipe shows the removal of several
       files that get installed via the default install task generated by the
       <xref linkend="autotools_class" />. By using
-      <emphasis>do_install_append</emphasis> these commands and run after the
+      <emphasis>do_install_append</emphasis> these commands are run after the
       autotools generated install task:</para>
 
       <screen>do_install_append() {
@@ -2161,7 +2151,7 @@ NOTE: package helloworld-0.1-r0: task do_package: completed</screen>Except in
       packages.</para>
 
       <para>Debian naming is enabled by including the debian class via either
-      <command>local.conf</command> or your distributions configuration
+      <command>local.conf</command> or your distribution's configuration
       file:<screen>INHERIT += "debian"</screen></para>
 
       <para>The policy works by looking at the shared library name and version
@@ -2234,7 +2224,7 @@ tmp/deploy/ipk/sh4/liblzo-dbg_1.08-r14_sh4.ipk</screen></para>
       <title>Empty packages</title>
 
       <para>By default empty packages are ignored. Occasionally you may wish
-      to actually created empty packages, typically done when you want a
+      to actually create empty packages, typically done when you want a
       virtual package which will install other packages via dependencies
       without actually installing anything itself. The <emphasis
       role="bold">ALLOW_EMPTY</emphasis> variable is used to control the
@@ -2276,15 +2266,15 @@ tmp/deploy/ipk/sh4/liblzo-dbg_1.08-r14_sh4.ipk</screen></para>
         <term>Overriding the default task implementation</term>
 
         <listitem>
-          <para>By defining your own implementation of task you'll override
+          <para>By defining your own implementation of a task you'll override
           any default or class provided implementations.</para>
 
-          <para>For example, you can define you own implementation of the
+          <para>For example, you can define your own implementation of the
           compile task to override any default implementation:<screen>do_compile() {
       oe_runmake DESTDIR=${D}
 }</screen></para>
 
-          <para>If you with to totally prevent the task from running you need
+          <para>If you wish to totally prevent the task from running you need
           to define your own empty implementation. This is typically done via
           the definition of the task using a single colon:<screen>do_configure() {
     :
@@ -2296,8 +2286,8 @@ tmp/deploy/ipk/sh4/liblzo-dbg_1.08-r14_sh4.ipk</screen></para>
         <term>Appending or prepending to the task</term>
 
         <listitem>
-          <para>Sometime you want the default implementation, but you require
-          addition functionality. This can done by appending or pre-pending
+          <para>Sometimes you want the default implementation, but you require
+          additional functionality. This can done by appending or pre-pending
           additional functionality onto the task.</para>
 
           <para>The following example from units shows an example of
@@ -2307,7 +2297,7 @@ tmp/deploy/ipk/sh4/liblzo-dbg_1.08-r14_sh4.ipk</screen></para>
        install -m 0655 units.dat ${D}${datadir}
 }</screen></para>
 
-          <para>The following example from the cherokee recipe show an example
+          <para>The following example from the cherokee recipe shows an example
           of adding functionality prior to the default
           <emphasis>install</emphasis> task. In this case it compiles a
           program that is used during installation natively so that it will
@@ -2324,7 +2314,7 @@ tmp/deploy/ipk/sh4/liblzo-dbg_1.08-r14_sh4.ipk</screen></para>
         <term>Defining a new task</term>
 
         <listitem>
-          <para>Another option is define a totally new task, and then register
+          <para>Another option is to define a totally new task, and then register
           that with bitbake so that it runs in between two of the existing
           tasks.</para>
 
@@ -2340,9 +2330,9 @@ addtask unpack_extra after do_unpack before do_patch</screen></para>
 
           <note>
             <para>The task to add does not have the do_ prepended to it,
-            however the tasks to insert it after and before do have the _do
+            however the tasks to insert it after and before do have the do_
             prepended. No errors will be generated if this is wrong, the
-            additional task simple won't be executed.</para>
+            additional task simply won't be executed.</para>
           </note>
         </listitem>
       </varlistentry>
@@ -2381,7 +2371,7 @@ addtask unpack_extra after do_unpack before do_patch</screen></para>
 
     <itemizedlist>
       <listitem>
-        <para>Save developers time being performing actions that they would
+        <para>Save developers time by performing actions that they would
         otherwise need to perform themselves;</para>
       </listitem>
 
@@ -2392,8 +2382,8 @@ addtask unpack_extra after do_unpack before do_patch</screen></para>
       </listitem>
 
       <listitem>
-        <para>A lot of detail on how things work can be learnt for looking at
-        how classes are implement.</para>
+        <para>A lot of detail on how things work can be learnt from looking at
+        how classes are implemented.</para>
       </listitem>
     </itemizedlist>
 
@@ -2525,7 +2515,7 @@ EXTRA_OECONF = "--disable-ldap \
           <para>Remember that <emphasis role="bold">DEPENDS</emphasis> defines
           the list of build time dependencies. In this case the staged headers
           and libraries from bzip2 are required to build gnupg, and therefore
-          we need to make sure the bzip2 recipe has run and staging the
+          we need to make sure the bzip2 recipe has run and staged the
           headers and libraries. By adding the <emphasis
           role="bold">DEPENDS</emphasis> on bzip2 this ensures that this
           happens.</para>
@@ -2539,12 +2529,12 @@ EXTRA_OECONF = "--disable-ldap \
           <para>This variable is used by the <xref
           linkend="autotools_class" /> to provide options to the configure
           script of the package. In the gnupg case it needs to be told where
-          the bzip2 headers and libraries files are, and this is done via the
-          <emphasis>--with-bzip2</emphasis> option. In this case it needs to
+          the bzip2 headers and libraries are, and this is done via the
+          <emphasis>--with-bzip2</emphasis> option. In this case it points to
           the directory which include the lib and include subdirectories.
           Since OE doesn't define a variable for one level above the include
           and lib directories <emphasis role="bold">..</emphasis> is used to
-          indicate one directory up. Without this gnupg would search the host
+          indicate one directory up. Without this, gnupg would search the host
           system headers and libraries instead of those we have provided in
           the staging area for the target.</para>
         </listitem>
@@ -2552,9 +2542,9 @@ EXTRA_OECONF = "--disable-ldap \
     </variablelist>
 
     <para>Remember that staging is used to make things, such as headers and
-    libraries, available to used by other recipes later on. While header and
-    libraries are the most common item requiring staging other items such as
-    the pkgconfig files need to be staged as well, while for native packages
+    libraries, available for use by other recipes later on. While headers and
+    libraries are the most common items requiring staging, other items such as
+    the pkgconfig files need to be staged as well. For native packages,
     the binaries also need to be staged.</para>
   </section>
 
@@ -2591,12 +2581,12 @@ EXTRA_OECONF = "--disable-ldap \
   </section>
 
   <section id="recipes_installation_scripts" xreflabel="installation scripts">
-    <title>Installation scripts: Running scripts during package install and/or
+    <title>Installation scripts: Running scripts during package installation and/or
     removal</title>
 
-    <para>Packaging system such as .ipkg and .deb support pre and post
+    <para>Packaging systems such as .ipkg and .deb support pre and post
     installation and pre and post removal scripts which are run during package
-    install and/or package removal on the target system.</para>
+    installation and/or package removal on the target system.</para>
 
     <para>These scripts can be defined in your recipes to enable actions to be
     performed at the appropriate time. Common uses include starting new
@@ -2637,7 +2627,7 @@ EXTRA_OECONF = "--disable-ldap \
         <listitem>
           <para>The prerm is run prior to the removal of the contents of a
           package. During prerm the contents of the package are still
-          available for use by the script. The prerm scripts</para>
+          available for use by the script.</para>
         </listitem>
       </varlistentry>
 
@@ -2684,7 +2674,7 @@ pkg_postinst_${PN}-rdisc6 () {
     </note>
 
     <para>Note that several classes will also register scripts, and that any
-    script you declare will have the script for the classes append to by these
+    script you declare will have the script for the classes appended by these
     classes. The following classes all generate additional script
     contents:</para>
 
@@ -2693,7 +2683,7 @@ pkg_postinst_${PN}-rdisc6 () {
         <term>update-rc.d</term>
 
         <listitem>
-          <para>This class is used by daemons to register there init scripts
+          <para>This class is used by daemons to register their init scripts
           with the init code.</para>
 
           <para>Details are provided in the <xref
@@ -2738,7 +2728,7 @@ pkg_postinst_${PN}-rdisc6 () {
 
         <listitem>
           <para>This class is used by packages that contain binaries which may
-          also be available for other packages. It tells that system that
+          also be provided by other packages. It tells the system that
           another alternative is available for consideration. The alternatives
           system will create a symlink to the correct alternative from one or
           more available on the system.</para>
@@ -2772,18 +2762,18 @@ pkg_postinst_${PN}-rdisc6 () {
         <listitem>
           <para>The base class used by packaging classes such as those for
           .ipkg and .deb. The package class may create scripts used to update
-          the dynamic linkers ld cache.</para>
+          the dynamic linker's ld cache.</para>
         </listitem>
       </varlistentry>
     </variablelist>
 
-    <para>The following example from p3scan shows and postinst script which
-    ensure that the required user and group entries exist, and registers the
+    <para>The following example from p3scan shows a postinst script which
+    ensures that the required user and group entries exist, and registers the
     need for volatiles (directories and/or files under <emphasis
     role="bold">/var</emphasis>). In addition to explicitly declaring a
     postinst script it uses the update-rc.d class which will result in an
     additional entry being added to the postinst script to register the init
-    scripts and start the daemon (via call to update-rc.d as describes in the
+    scripts and start the daemon (via call to update-rc.d as described in the
     <xref linkend="recipes_alternatives" /> section).<screen>inherit autotools update-rc.d
 
 ...
@@ -2825,7 +2815,7 @@ fi</screen></para>
 
     <para>In order to prevent this from happening you need to tell the
     packaging system which files are configuration files. Such files will
-    result in the user being asked how the user wants to handle any
+    result in the user being asked how they want to handle any
     configuration file changes (if any), as shown in this example:<screen>Downloading http://nynaeve.twibble.org/ipkg-titan-glibc//./p3scan_2.9.05d-r1_sh4.ipk
     Configuration file '/etc/p3scan/p3scan.conf'
     ==&gt; File on system created by you or by a script.
@@ -2841,7 +2831,7 @@ fi</screen></para>
     separated list of configuration files. The following example from clamav
     shows two files being marked as configuration files:<screen>CONFFILES_${PN}-daemon = "${sysconfdir}/clamd.conf \
                           ${sysconfdir}/default/clamav-daemon"</screen>Note
-    the user of <command>${PN}-daemon</command> as the package name. The
+    the use of <command>${PN}-daemon</command> as the package name. The
     <command>${PN}</command> variable will expand to <command>clamav</command>
     and therefore these conf files are declared as being in the clamav-daemon
     package.</para>
@@ -2885,7 +2875,7 @@ fi</screen></para>
 
         <listitem>
           <para>Used to specify that the current package replaces an older
-          package with a different name. During package installing the package
+          package with a different name. During package installation the package
           that is being replaced will be removed since it is no longer needed
           when this package is installed.</para>
         </listitem>
@@ -2910,7 +2900,7 @@ fi</screen></para>
           udev and linux-hotplug. Both declare that they runtime provide
           "hotplug". So any packages that require "hotplug" to work simply
           declare that it RDEPENDS on "hotplug". It's up to the distribution
-          to specify which actual implementation of "virtual/xserver" is
+          to specify which actual implementation of "virtual/hotplug" is
           used.</para>
         </listitem>
       </varlistentry>
@@ -2922,7 +2912,7 @@ fi</screen></para>
           <para>Used to explicitly specify what a package provides at build
           time. This is typically used when two or more packages can provide
           the same functionality. For example there are several different X
-          servers in OpenEmbedded, and each as declared as providing
+          servers in OpenEmbedded, and each declared as providing
           "virtual/xserver". Therefore a package that depends on an X server
           to build can simply declare that it DEPENDS on "virtual/xserver".
           It's up to the distribution to specify which actual implementation
@@ -2935,10 +2925,10 @@ fi</screen></para>
   <section id="recipes_fakeroot" xreflabel="fakeroot">
     <title>Fakeroot: Dealing with the need for "root"</title>
 
-    <para>Sometimes packages requires root permissions in order to perform
+    <para>Sometimes packages require root permissions in order to perform
     some action, such as changing user or group owners or creating device
     nodes. Since OpenEmbedded will not keep the user and group information
-    it's usually preferably to remove that from the makefiles. For device
+    it's usually preferabe to remove that from the makefiles. For device
     nodes it's usually preferably to create them from the initial device node
     lists or via udev configuration.</para>
 
@@ -2951,7 +2941,7 @@ fi</screen></para>
     you also need to add a dependency on
     <command>fakeroot-native</command>:<screen>DEPENDS = "fakeroot-native"</screen>See
     the fuse recipe for an example. Further information on <xref
-    linkend="fakeroot" />, including a description of it works, is provided in
+    linkend="fakeroot" />, including a description of how it works, is provided in
     the reference section: <xref linkend="fakeroot" />.</para>
   </section>
 
@@ -3034,7 +3024,7 @@ fi</screen></para>
       </listitem>
     </orderedlist>
 
-    <para>This in turn result in packaging system, such as ipkg, considering
+    <para>This results in the packaging system, such as ipkg, considering
     the released version to be older then the rc version.</para>
 
     <para>In OpenEmbedded the correct naming of pre and rc versions is to use
@@ -3111,7 +3101,7 @@ require iproute2.inc
 DATE = "060323"</screen></para>
 
     <para>The following example from cherokee shows a similar method of
-    including additional patches for this version only. However it also show
+    including additional patches for this version only. However it also shows
     another technique in which the configure task is defined in the recipe for
     this version, thus replacing the <emphasis>configure</emphasis> task that
     is provided by the common include:<screen>PR = "r7"
@@ -3142,7 +3132,7 @@ do_configure() {
     <emphasis>${@...}</emphasis>, as shown in the following example:<screen>TAG = ${@bb.data.getVar('PV',d,1).replace('.', '_')}</screen></para>
 
     <para>The above example retrieves the PV variable from the bitbake data
-    object, the replaces any dots with underscores. Therefore if the <emphasis
+    object, then replaces any dots with underscores. Therefore if the <emphasis
     role="bold">PV</emphasis> was <emphasis role="bold">0.9.0</emphasis> then
     <emphasis role="bold">TAG</emphasis> will be set to <emphasis
     role="bold">0-9-0</emphasis>.</para>
@@ -3182,10 +3172,10 @@ do_configure() {
         <listitem>
           <para>Return the directory only part of a filename.</para>
 
-          <para>This is most commonly seen in existing recipes when settings
+          <para>This is most commonly seen in existing recipes when setting
           the <emphasis role="bold">FILESDIR</emphasis> variable (as described
           in the <xref linkend="recipes_filespath_dir" /> section). By
-          obtaining name of the recipe file itself, <emphasis
+          obtaining the name of the recipe file itself, <emphasis
           role="bold">FILE</emphasis>, and then using os.path.dirname to strip
           the filename part:<screen>FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/make-${PV}"</screen>Note
           however that this is no longer required as <emphasis
@@ -3199,12 +3189,12 @@ do_configure() {
         <term>&lt;variable&gt;.split(&lt;key&gt;)[&lt;index&gt;]</term>
 
         <listitem>
-          <para>Splits are variable around the specified key. Use <emphasis
+          <para>Splits the variable around the specified key. Use <emphasis
           role="bold">[&lt;index&gt;]</emphasis> to select one of the matching
           items from the array generated by the split command.</para>
 
-          <para>The following example from the recipe g<emphasis
-          role="bold">enext2fs_1.3+1.4rc1.bb</emphasis> would take the
+          <para>The following example from the recipe <emphasis
+          role="bold">genext2fs_1.3+1.4rc1.bb</emphasis> would take the
           <emphasis role="bold">PV</emphasis> of <emphasis
           role="bold">1.3+1.4rc1</emphasis> and split it around the <emphasis
           role="bold">+</emphasis> sign, resulting in an array containing
@@ -3230,7 +3220,7 @@ do_configure() {
         <term>base_conditional</term>
 
         <listitem>
-          <para>This functions is used to set a variable to one of two values
+          <para>This function is used to set a variable to one of two values
           based on the definition of a third variable. The general usage
           is:<screen>${@base_conditional('&lt;variable-name&gt;', '&lt;value&gt;', '&lt;true-result&gt;', &lt;false-result&gt;', d)}"</screen>where:</para>
 
@@ -3272,7 +3262,7 @@ do_configure() {
           </variablelist>
 
           <para>The following example from the openssl recipe shows the
-          addition of either <emphasis role="bold">-DL_ENDING</emphasis> or
+          addition of either <emphasis role="bold">-DL_ENDIAN</emphasis> or
           <emphasis role="bold">-DB_ENDIAN</emphasis> depending on the value
           of <emphasis role="bold">SITEINFO_ENDIANESS</emphasis> which is set
           to le for little endian targets and to be for big endian
@@ -3288,7 +3278,7 @@ do_configure() {
         <term>base_contains</term>
 
         <listitem>
-          <para>Similar to base_conditional expect that it is checking for the
+          <para>Similar to base_conditional except that it is checking for the
           value being an element of an array. The general usage is:<screen>${@base_contains('&lt;array-name&gt;', '&lt;value&gt;', '&lt;true-result&gt;', &lt;false-result&gt;', d)}"</screen></para>
 
           <para>where:<variablelist>
@@ -3341,7 +3331,7 @@ do_configure() {
     <para>Tasks may be implemented in python by prefixing the task function
     with "python ". In general this should not be needed and should be avoided
     where possible. The following example from the devshell recipe shows how
-    the compile task is implemented python:<screen>python do_compile() {
+    the compile task is implemented in python:<screen>python do_compile() {
     import os
     import os.path
 
@@ -3393,7 +3383,7 @@ procps_3.1.15.bb  procps_3.2.1.bb  procps_3.2.5.bb  procps_3.2.7.bb
 
     <para>Imagine that you are adding procps version 4.0.0, but that it does
     not yet work. You could delete or rename your new recipe so you can build
-    a working image, but what you really to do is just ignore the new 4.0.0
+    a working image, but what you really want to do is just ignore the new 4.0.0
     version until it works. By adding:<screen>DEFAULT_PREFERENCE = "-1"</screen>to
     the recipe this is what will happen. Bitbake will now ignore this version
     (since all of the existing versions have a preference of 0). Note that you
@@ -3513,7 +3503,7 @@ which find
         </listitem>
       </orderedlist>
 
-      <para>The <xref linkend="update-alternatives_class" /> is the provides
+      <para>The <xref linkend="update-alternatives_class" /> provides
       the simplest method of using alternatives but it only works for a single
       alternative. For multiple alternatives they need to be manually
       registered during post install.</para>
@@ -3608,7 +3598,7 @@ which find
       method that is suitable for its goals all packages should be configured
       by default to log via syslog, and not log directly to a file, if
       possible. If the distribution and/or end-user requires logging to a file
-      then they can configured syslog and/or your application to implement
+      then they can configure syslog and/or your application to implement
       this.</para>
     </section>
 
@@ -3621,7 +3611,7 @@ which find
       <itemizedlist>
         <listitem>
           <para>Configure all logging to use syslog whenever possible. This
-          leaves the decision on where to log upto the individual
+          leaves the decision on where to log up to the individual
           distributions.</para>
         </listitem>
 



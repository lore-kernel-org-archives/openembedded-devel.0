Received: from [74.125.46.156] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1LkMXx-0002Td-Em
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 19:00:49 +0100
Received: by yw-out-1718.google.com with SMTP id 9so454816ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2009 10:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:message-id
	:user-agent:mime-version:content-type;
	bh=MQKw25vyEkejWBC9Y5dvhkLQkqJtmwA2YN9JmzJdxB4=;
	b=mMsx5HORGvrsUqRmnNI8ikADNHW17p19/TCJcroplqg0Et54hrswLz1C0UPhsPWK8u
	xGVCTu+BcSj45DmNWcNJeWbvaJJe1L3fQg6PXpxNeqd2K8AWMWGxcV3gV2N1+yvHt2lP
	u8qTWPCMSP1Bvd+jlhQBfCbA/BZMYYDpoDM6g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:message-id:user-agent:mime-version:content-type;
	b=kOjFBhDWPy/KO8SqucRqdHHtBVp+5b1iQqXGKiM5yWAohxzZ6kM2rTgQFmSeSL3S9X
	gxQ5A54BS84Z5b8CFBes+OSGOlYT18mL5HRaq2yC/9Q4K+tbUW+vl+wZOm8egBk568Yl
	8dnNQbpH4vJ0+CjW4rBJgWIyj7Kito2VpWgeE=
Received: by 10.142.174.18 with SMTP id w18mr1058653wfe.24.1237485590583;
	Thu, 19 Mar 2009 10:59:50 -0700 (PDT)
Received: from dorkboy (99-203-159-164.pools.spcsdns.net [99.203.159.164])
	by mx.google.com with ESMTPS id 29sm2086512wfg.33.2009.03.19.10.59.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Mar 2009 10:59:49 -0700 (PDT)
Date: Thu, 19 Mar 2009 10:59:46 -0700 (PDT)
From: "Theodore A. Roth" <taroth@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.1.00.0903191058400.9107@localhost.localdomain>
User-Agent: Alpine 1.00 (DEB 882 2007-12-20)
MIME-Version: 1.0
Subject: (No subject)
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
X-List-Received-Date: Thu, 19 Mar 2009 18:00:50 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

From 2c41e9d95bfedd8a73a29478fbe49e7ec538e7f9 Mon Sep 17 00:00:00 2001
From: Theodore A. Roth <troth@openavr.org>
Date: Thu, 19 Mar 2009 10:50:54 -0700
Subject: [PATCH] doc/usermanual/chapters: Replace references to packages dir with recipes dir.

---
 docs/usermanual/chapters/common_use_cases.xml |    6 +-
 docs/usermanual/chapters/features.xml         |    8 ++--
 docs/usermanual/chapters/getting_oe.xml       |    6 +-
 docs/usermanual/chapters/metadata.xml         |    2 +-
 docs/usermanual/chapters/recipes.xml          |   30 +++++++-------
 docs/usermanual/chapters/usage.xml            |   50 ++++++++++++------------
 6 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs/usermanual/chapters/common_use_cases.xml
index 4497683..143cbe0 100644
--- a/docs/usermanual/chapters/common_use_cases.xml
+++ b/docs/usermanual/chapters/common_use_cases.xml
@@ -252,10 +252,10 @@ export LOCALDIR=$PWD/secret-isv
 
         <screen>
 DL_DIR = "${OEDIR}/sources"
-BBFILES := "${OEDIR}/openembedded/packages/*/*.bb ${LOCALDIR}/packages/*/*.bb"
+BBFILES := "${OEDIR}/openembedded/recipes/*/*.bb ${LOCALDIR}/recipes/*/*.bb"
 BBFILE_COLLECTIONS = "upstream local"
-BBFILE_PATTERN_upstream = "^${OEDIR}/openembedded/packages/"
-BBFILE_PATTERN_local = "^${LOCALDIR}/packages/"
+BBFILE_PATTERN_upstream = "^${OEDIR}/openembedded/recipes/"
+BBFILE_PATTERN_local = "^${LOCALDIR}/recipes/"
 BBFILE_PRIORITY_upstream = "5"
 BBFILE_PRIORITY_local = "10"
 BBMASK = ""
diff --git a/docs/usermanual/chapters/features.xml b/docs/usermanual/chapters/features.xml
index 8eecaa9..3cbf1d8 100644
--- a/docs/usermanual/chapters/features.xml
+++ b/docs/usermanual/chapters/features.xml
@@ -39,10 +39,10 @@
     <para>This section is a stub, help us by expanding it</para>
 
     <para><screen>
-BBFILES := "${OEDIR}/openembedded/packages/*/*.bb ${LOCALDIR}/packages/*/*.bb"
+BBFILES := "${OEDIR}/openembedded/recipes/*/*.bb ${LOCALDIR}/recipes/*/*.bb"
 BBFILE_COLLECTIONS = "upstream local"
-BBFILE_PATTERN_upstream = "^${OEDIR}/openembedded/packages/"
-BBFILE_PATTERN_local = "^${LOCALDIR}/packages/"
+BBFILE_PATTERN_upstream = "^${OEDIR}/openembedded/recipes/"
+BBFILE_PATTERN_local = "^${LOCALDIR}/recipes/"
 BBFILE_PRIORITY_upstream = "5"
 BBFILE_PRIORITY_local = "10"
 </screen></para>
@@ -75,4 +75,4 @@ MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget"
 
     <para>This section is a stub, help us by expanding it</para>
   </section>
-</chapter>
\ No newline at end of file
+</chapter>
diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
index d71ea71..ed7fd11 100644
--- a/docs/usermanual/chapters/getting_oe.xml
+++ b/docs/usermanual/chapters/getting_oe.xml
@@ -232,7 +232,7 @@ $ vi build/conf/local.conf</screen>
         distribution and the Openmoko gta01 machine:
 
         <screen>
-BBFILES = "${OEBASE}/openembedded/packages/*/*.bb"
+BBFILES = "${OEBASE}/openembedded/recipes/*/*.bb"
 DISTRO = "angstrom-2008.1"
 MACHINE = "om-gta01"</screen>
       </para>
@@ -297,11 +297,11 @@ MACHINE = "om-gta01"</screen>
     <para>To build a single package, bypassing the long parse step (and
       therefore its dependencies -- use with care):
 
-      <screen>$ bitbake -b $OEBASE/openembedded/packages/blah/blah.bb</screen>
+      <screen>$ bitbake -b $OEBASE/openembedded/recipes/blah/blah.bb</screen>
     </para>
 
     <para>There are a few groups of special recipes located in subdirectories
-      of the <filename>$OEBASE/openembedded/packages/</filename>
+      of the <filename>$OEBASE/openembedded/recipes/</filename>
       directory. These groups are:
 
       <variablelist>
diff --git a/docs/usermanual/chapters/metadata.xml b/docs/usermanual/chapters/metadata.xml
index 54fb523..3e76b2d 100644
--- a/docs/usermanual/chapters/metadata.xml
+++ b/docs/usermanual/chapters/metadata.xml
@@ -65,7 +65,7 @@
         </varlistentry>
 
         <varlistentry>
-          <term><filename>packages/</filename></term>
+          <term><filename>recipes/</filename></term>
           <listitem>
             <para>Conatins all of the
               <application>BitBake</application> <filename>.bb</filename>
diff --git a/docs/usermanual/chapters/recipes.xml b/docs/usermanual/chapters/recipes.xml
index c1ca456..1107873 100644
--- a/docs/usermanual/chapters/recipes.xml
+++ b/docs/usermanual/chapters/recipes.xml
@@ -1081,9 +1081,9 @@ ${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"</screen></para>
 
       <para>First we'll create the myhelloworld.c file and a readme file.
       We'll place this in the files subdirectory, which is one of the places
-      that is searched for file:// URI's:<screen>mkdir packages/myhelloworld
-mkdir packages/myhelloworld/files
-cat &gt; packages/myhelloworld/files/myhelloworld.c
+      that is searched for file:// URI's:<screen>mkdir recipes/myhelloworld
+mkdir recipes/myhelloworld/files
+cat &gt; recipes/myhelloworld/files/myhelloworld.c
 #include &lt;stdio.h&gt;
 
 int main(int argc, char** argv)
@@ -1092,11 +1092,11 @@ int main(int argc, char** argv)
         return 0;
 }
 ^D
-cat &gt; packages/myhelloworld/files/README.txt
+cat &gt; recipes/myhelloworld/files/README.txt
 Readme file for myhelloworld.
 ^D</screen></para>
 
-      <para>Now we have a directory for our recipe, packages/myhelloworld, and
+      <para>Now we have a directory for our recipe, recipes/myhelloworld, and
       we've created a files subdirectory in there to store our local files.
       We've created two local files, the C source code for our helloworld
       program and a readme file. Now we need to create the bitbake
@@ -1186,7 +1186,7 @@ PR = "r0"</screen></para>
       </itemizedlist>
 
       <para>We'll consider this release 0 and version 0.1 of a program called
-      helloworld. So we'll name the recipe myhelloworld_0.1.bb:<screen>cat &gt; packages/myhelloworld/myhelloworld_0.1.bb
+      helloworld. So we'll name the recipe myhelloworld_0.1.bb:<screen>cat &gt; recipes/myhelloworld/myhelloworld_0.1.bb
 DESCRIPTION = "Hello world program"
 PR = "r0"
 
@@ -1203,13 +1203,13 @@ do_install() {
         install -m 0644 ${WORKDIR}/README.txt ${D}${docdir}/myhelloworld
 }
 ^D</screen>Now we are ready to build our package, hopefully it'll all work
-      since it's such a simple example:<screen>~/oe%&gt; bitbake -b packages/myhelloworld/myhelloworld_0.1.bb
+      since it's such a simple example:<screen>~/oe%&gt; bitbake -b recipes/myhelloworld/myhelloworld_0.1.bb
 NOTE: package myhelloworld-0.1: started
 NOTE: package myhelloworld-0.1-r0: task do_fetch: started
 NOTE: package myhelloworld-0.1-r0: task do_fetch: completed
 NOTE: package myhelloworld-0.1-r0: task do_unpack: started
-NOTE: Unpacking /home/lenehan/devel/oe/local-packages/myhelloworld/files/helloworld.c to /home/lenehan/devel/oe/build/titan-glibc-25/tmp/work/myhelloworld-0.1-r0/
-NOTE: Unpacking /home/lenehan/devel/oe/local-packages/myhelloworld/files/README.txt to /home/lenehan/devel/oe/build/titan-glibc-25/tmp/work/myhelloworld-0.1-r0/
+NOTE: Unpacking /home/lenehan/devel/oe/local-recipes/myhelloworld/files/helloworld.c to /home/lenehan/devel/oe/build/titan-glibc-25/tmp/work/myhelloworld-0.1-r0/
+NOTE: Unpacking /home/lenehan/devel/oe/local-recipes/myhelloworld/files/README.txt to /home/lenehan/devel/oe/build/titan-glibc-25/tmp/work/myhelloworld-0.1-r0/
 NOTE: package myhelloworld-0.1-r0: task do_unpack: completed
 NOTE: package myhelloworld-0.1-r0: task do_patch: started
 NOTE: package myhelloworld-0.1-r0: task do_patch: completed
@@ -1354,7 +1354,7 @@ tmp/work/myhelloworld-0.1-r0/install/myhelloworld/usr/bin/myhelloworld: ELF 32-b
       of building an autotools based packages.</para>
 
       <para>Let's take a look at the tuxnes recipe which is an example of a
-      very simple autotools based recipe:<screen>%~oe&gt; cat packages/tuxnes/tuxnes_0.75.bb
+      very simple autotools based recipe:<screen>%~oe&gt; cat recipes/tuxnes/tuxnes_0.75.bb
 DESCRIPTION = "Tuxnes Nintendo (8bit) Emulator"
 HOMEPAGE = "http://prdownloads.sourceforge.net/tuxnes/tuxnes-0.75.tar.gz"
 LICENSE = "GPLv2"
@@ -3366,7 +3366,7 @@ do_configure() {
     via the <command>PV</command> variable).</para>
 
     <para>For example if we were to ask bitbake to build procps and the
-    following packages are available:<screen>~/oe%&gt; ls packages/procps 
+    following packages are available:<screen>~/oe%&gt; ls recipes/procps 
 procps-3.1.15/    procps-3.2.1/    procps-3.2.5/    procps-3.2.7/    procps.inc
 procps_3.1.15.bb  procps_3.2.1.bb  procps_3.2.5.bb  procps_3.2.7.bb
 ~/oe%&gt;</screen>then we would expect it to select version
@@ -3397,7 +3397,7 @@ procps_3.1.15.bb  procps_3.2.1.bb  procps_3.2.5.bb  procps_3.2.7.bb
     version until it works. By adding:<screen>DEFAULT_PREFERENCE = "-1"</screen>to
     the recipe this is what will happen. Bitbake will now ignore this version
     (since all of the existing versions have a preference of 0). Note that you
-    can still call bitbake directly on the recipe:<screen>bitbake -b packages/procps/procps_4.0.0.bb</screen>This
+    can still call bitbake directly on the recipe:<screen>bitbake -b recipes/procps/procps_4.0.0.bb</screen>This
     enables you to test, and fix the package manually without having bitbake
     automatically select normally.</para>
 
@@ -3406,7 +3406,7 @@ procps_3.1.15.bb  procps_3.2.1.bb  procps_3.2.5.bb  procps_3.2.7.bb
     example from glibc shows that this version has been disabled for the sh3
     architecture because it doesn't support sh3. This will force bitbake to
     try and select one of the other available versions of glibc
-    instead:<screen>packages/glibc/glibc_2.3.2+cvs20040726.bb:DEFAULT_PREFERENCE_sh3 = "-99"</screen></para>
+    instead:<screen>recipes/glibc/glibc_2.3.2+cvs20040726.bb:DEFAULT_PREFERENCE_sh3 = "-99"</screen></para>
   </section>
 
   <section id="recipes_initscripts" xreflabel="initscripts">
@@ -3634,7 +3634,7 @@ which find
         <listitem>
           <para>The only directories that you can assume exist are those
           listed in the default volatiles file:
-          <command>packages/initscripts/initscripts-1.0/volatiles</command>.</para>
+          <command>recipes/initscripts/initscripts-1.0/volatiles</command>.</para>
         </listitem>
 
         <listitem>
@@ -3707,4 +3707,4 @@ which find
 
     <para></para>
   </section>
-</chapter>
\ No newline at end of file
+</chapter>
diff --git a/docs/usermanual/chapters/usage.xml b/docs/usermanual/chapters/usage.xml
index 9fe20fa..5dd00d6 100644
--- a/docs/usermanual/chapters/usage.xml
+++ b/docs/usermanual/chapters/usage.xml
@@ -574,51 +574,51 @@ NOTE: Resolving missing task queue dependencies
 NOTE: preferred version 2.5 of glibc not available (for item virtual/sh4-linux-libc-for-gcc)
 NOTE: Preparing Runqueue
 NOTE: Executing runqueue
-NOTE: Running task 208 of 226 (ID: 11, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
+NOTE: Running task 208 of 226 (ID: 11, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
           role="bold">do_fetch</emphasis>)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_fetch</emphasis>: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_fetch</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 209 of 226 (ID: 2, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
+NOTE: Running task 209 of 226 (ID: 2, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
           role="bold">do_unpack</emphasis>)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_unpack</emphasis>: started
 NOTE: Unpacking /home/lenehan/devel/oe/sources/lzo-1.08.tar.gz to /home/lenehan/devel/oe/build/titan-glibc-25/tmp/work/lzo-1.08-r14/
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_unpack</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 216 of 226 (ID: 3, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
+NOTE: Running task 216 of 226 (ID: 3, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
           role="bold">do_patch</emphasis>)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_patch</emphasis>: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_patch</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 217 of 226 (ID: 4, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
+NOTE: Running task 217 of 226 (ID: 4, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
           role="bold">do_configure</emphasis>)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_configure</emphasis>: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_configure</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 218 of 226 (ID: 12, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
+NOTE: Running task 218 of 226 (ID: 12, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
           role="bold">do_qa_configure</emphasis>)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_qa_configure</emphasis>: started
 NOTE: Checking sanity of the config.log file
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_qa_configure</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 219 of 226 (ID: 0, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
+NOTE: Running task 219 of 226 (ID: 0, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
           role="bold">do_compile</emphasis>)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_compile</emphasis>: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_compile</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 220 of 226 (ID: 1, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
+NOTE: Running task 220 of 226 (ID: 1, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
           role="bold">do_install</emphasis>)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_install</emphasis>: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_install</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 221 of 226 (ID: 5, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
+NOTE: Running task 221 of 226 (ID: 5, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
           role="bold">do_package</emphasis>)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_package</emphasis>: started
@@ -631,7 +631,7 @@ NOTE: Checking Package: lzo-locale
 NOTE: DONE with PACKAGE QA
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_package</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 222 of 226 (ID: 8, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, <emphasis
+NOTE: Running task 222 of 226 (ID: 8, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, <emphasis
           role="bold">do_package_write</emphasis>)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_package_write</emphasis>: started
@@ -642,23 +642,23 @@ Packaged contents of lzo-dev into /home/lenehan/devel/oe/build/titan-glibc-25/tm
 NOTE: Not creating empty archive for lzo-locale-1.08-r14
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_package_write</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 223 of 226 (ID: 6, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, do_populate_staging)
+NOTE: Running task 223 of 226 (ID: 6, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, do_populate_staging)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_populate_staging</emphasis>: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_populate_staging</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 224 of 226 (ID: 9, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, do_qa_staging)
+NOTE: Running task 224 of 226 (ID: 9, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, do_qa_staging)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_qa_staging</emphasis>: started
 NOTE: QA checking staging
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_qa_staging</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 225 of 226 (ID: 7, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, do_distribute_sources)
+NOTE: Running task 225 of 226 (ID: 7, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, do_distribute_sources)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_distribute_sources</emphasis>: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_distribute_sources</emphasis>: completed
 NOTE: package lzo-1.08: completed
-NOTE: Running task 226 of 226 (ID: 10, /home/lenehan/devel/oe/build/titan-glibc-25/packages/lzo/lzo_1.08.bb, do_build)
+NOTE: Running task 226 of 226 (ID: 10, /home/lenehan/devel/oe/build/titan-glibc-25/recipes/lzo/lzo_1.08.bb, do_build)
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_build</emphasis>: started
 NOTE: package lzo-1.08-r14: task <emphasis role="bold">do_build</emphasis>: completed
@@ -827,7 +827,7 @@ NOTE: build 200705041709: completed</screen><note>
 
     <para>To determine the full list of tasks available for a specific recipe
     you can run bitbake on the recipe and asking it for the full list of
-    available tasks:<screen>~%&gt; bitbake -b packages/perl/perl_5.8.8.bb -c listtasks
+    available tasks:<screen>~%&gt; bitbake -b recipes/perl/perl_5.8.8.bb -c listtasks
 NOTE: package perl-5.8.8: started
 NOTE: package perl-5.8.8-r11: task do_listtasks: started
 do_fetchall
@@ -1020,27 +1020,27 @@ NOTE: package perl-5.8.8: completed
 
     <para>A typically development session might involve editing files in the
     working directory and then recompiling until it all works:<screen>[<emphasis>... test ...</emphasis>]
-~%&gt; bitbake -b packages/testapp/testapp_4.3.bb -c compile -D
+~%&gt; bitbake -b recipes/testapp/testapp_4.3.bb -c compile -D
 
 [<emphasis>... save a copy of main.c and make some changes ...</emphasis>]
 ~%&gt; vi tmp/work/testapp-4.3-r0/main.c
-~%&gt; bitbake -b packages/testapp/testapp_4.3.bb -c compile -D -f
+~%&gt; bitbake -b recipes/testapp/testapp_4.3.bb -c compile -D -f
 
 [<emphasis>... create a patch and add it to the recipe ...</emphasis>]
-~%&gt; vi packages/testapp/testapp_4.3.bb
+~%&gt; vi recipes/testapp/testapp_4.3.bb
 
 [<emphasis>... test from clean ...</emphasis>]
-~%&gt; bitbake -b packages/testapp/testapp_4.3.bb -c clean
-~%&gt; bitbake -b packages/testapp/testapp_4.3.bb
+~%&gt; bitbake -b recipes/testapp/testapp_4.3.bb -c clean
+~%&gt; bitbake -b recipes/testapp/testapp_4.3.bb
 
 [<emphasis>... NOTE: How to create the patch is not covered at this point ...</emphasis>]</screen></para>
 
     <para>Here's another example showing how you might go about fixing up the
-    packaging in your recipe:<screen>~%&gt; bitbake -b packages/testapp/testapp_4.3.bb -c install -f
-~%&gt; bitbake -b packages/testapp/testapp_4.3.bb -c stage -f
+    packaging in your recipe:<screen>~%&gt; bitbake -b recipes/testapp/testapp_4.3.bb -c install -f
+~%&gt; bitbake -b recipes/testapp/testapp_4.3.bb -c stage -f
 ~%&gt; find tmp/work/testapp_4.3/install
 ...
-~%&gt; vi packages/testapp/testapp_4.3.bb</screen>At this stage you play with
+~%&gt; vi recipes/testapp/testapp_4.3.bb</screen>At this stage you play with
     the <emphasis role="bold">PACKAGE_</emphasis> and <emphasis
     role="bold">FILES_</emphasis> variables and then repeat the above
     sequence.</para>
@@ -1103,7 +1103,7 @@ BB&gt;&gt; build net-snmp</screen>Note that you can use wildcards in the
             role="bold">devshell</emphasis>"</screen></para>
 
       <para>With the inclusion of this class you'll find that devshell is
-      added as a new task that you can use on recipes:<screen>~%&gt; bitbake -b packages/lzo/lzo_1.08.bb -c listtasks
+      added as a new task that you can use on recipes:<screen>~%&gt; bitbake -b recipes/lzo/lzo_1.08.bb -c listtasks
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task do_listtasks: started
 <emphasis role="bold">do_devshell</emphasis>
@@ -1130,7 +1130,7 @@ NOTE: package lzo-1.08-r14: task do_listtasks: completed
 NOTE: package lzo-1.08: completed</screen></para>
 
       <para>To bring up the devshell you call bitbake on a recipe and ask it
-      for the devshell task:<screen>~%&gt; ./bb -b packages/lzo/lzo_1.08.bb -c devshell
+      for the devshell task:<screen>~%&gt; ./bb -b recipes/lzo/lzo_1.08.bb -c devshell
 NOTE: package lzo-1.08: started
 NOTE: package lzo-1.08-r14: task do_devshell: started
 [<emphasis>... devshell will appear here ...</emphasis>]
@@ -1190,4 +1190,4 @@ bash: alias: `./configure': invalid alias name
 
     <para>[To be done]</para>
   </section>
-</chapter>
\ No newline at end of file
+</chapter>
-- 
1.5.4.3

Signed-off-by: Theodore A. Roth <taroth@gmail.com>




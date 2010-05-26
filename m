Received: from mail-gw0-f65.google.com ([74.125.83.65])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OHGVw-0006yM-QX
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 15:19:45 +0200
Received: by gwj23 with SMTP id 23so25578gwj.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=HEQtUzdc4qQBqNUcYn5EI/fEwbrrxkSyI9QaTspLw2M=;
	b=atXzsAeWXoVeKdZ0jPS+fgOpODiNloVwEU8lNYhwTx9yFNUqqR8yripuBUi8p6hrJZ
	2242LeWgxObFs5UBNy5zVHoucNN+/Den9auH/PqithCmlRczKa/iS1hxjp4hnYA57P8A
	fyd4q8lC5v+9IMpUBsmUH8kL9g9fLav4fvUyM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=IA1RHfp8vL49uqA69Jb82xWdjMZP889MIecMEDB9w0kpWe/9ZTxLefQa80YMLZ+Vx1
	E9Q3H5e3leOGfsV9VDZ/HElm2ClQaC/gEZ/7dv+DB9OSAs9TVg47FQ4FePFEAEfG09yS
	ngug9+ufb/8st6GMYJDKecXonQkZyQ1H0IyV4=
Received: by 10.101.6.29 with SMTP id j29mr10450950ani.155.1274879689777;
	Wed, 26 May 2010 06:14:49 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id n18sm433983anl.12.2010.05.26.06.14.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 06:14:49 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 08:09:29 -0500
Message-Id: <1274879375-19626-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 74.125.83.65
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCHv2 1/7] common_use_cases: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 13:20:30 -0000

* Fixed up typos and other errors in the documentation.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 docs/usermanual/chapters/common_use_cases.xml |   45 +++++++++++++-----------
 1 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs/usermanual/chapters/common_use_cases.xml
index 7ae3ee5..d86d0ca 100644
--- a/docs/usermanual/chapters/common_use_cases.xml
+++ b/docs/usermanual/chapters/common_use_cases.xml
@@ -7,11 +7,12 @@
 
     <para>Creating a new distribution is not complicated, however we urge you
     to try existing distributions first, because it's also very easy to do
-    wrong. The config need to be created in /conf/distro directory. So what
-    has to be inside? <itemizedlist>
+    wrong. The config needs to be created in $OEBASE/openembedded/conf/distro 
+    directory. So what has to be inside? 
+      <itemizedlist>
         <listitem>
           <para><command>DISTRO_VERSION</command> so users will know which
-          version of distribution they use.</para>
+          version of the distribution they are using.</para>
         </listitem>
 
         <listitem>
@@ -71,29 +72,30 @@ SRCDATE = "20061014"
   <section id="commonuse_new_machine">
     <title>Adding a new Machine</title>
 
-    <para>To be able to build for device OpenEmbedded have to know it, so
-    machine config file need to be written. All those configs are stored in
-    /conf/machine/ directory.</para>
+    <para>To be able to build for a device OpenEmbedded has to know about it, 
+    so a machine config file needs to be written. All of the machine 
+    configs are stored in $OEBASE/openembedded/conf/machine/ directory.</para>
 
     <para>As usual some variables are required: <itemizedlist>
         <listitem>
-          <para><command>TARGET_ARCH</command> which describe which CPU
-          architecture does machine use.</para>
+          <para><command>TARGET_ARCH</command> describes which CPU
+          architecture the machine uses.</para>
         </listitem>
 
         <listitem>
-          <para><command>MACHINE_FEATURES</command> which describe which
-          features device has. More about it in <link
+          <para><command>MACHINE_FEATURES</command> which describes which
+          features the device has. More about it in <link
           linkend="task-base">task-base</link> section.</para>
         </listitem>
 
         <listitem>
           <para><command>PREFERRED_PROVIDER_virtual/kernel</command> has to
-          point into proper kernel recipe for this machine.</para>
+          point to the proper kernel recipe for this machine.</para>
         </listitem>
       </itemizedlist></para>
 
-    <para>Next kernel recipe needs to be added.</para>
+    <para>Next the kernel recipe needs to be added if it doesn't already exist.
+    </para>
   </section>
 
   <section id="commonuse_new_package">
@@ -105,7 +107,7 @@ SRCDATE = "20061014"
     <section>
         <title>building from unstable source code</title>
         <para>Building against the latest, bleeding-edge source has some intricacies of its own.
-        For one, it is desirable to pin down a 1 code revision that is known to build to
+        For one, it is desirable to pin down a code revision that is known to build to
         prevent random breakage in OE at the most inopportune time for all OE users.  Here is
         how to do that properly.
           <itemizedlist>
@@ -113,7 +115,8 @@ SRCDATE = "20061014"
             <listitem><para>for cvs: add 'PV = "1.1+cvs${SRCREV}"' to your bb file.</para></listitem>
           </itemizedlist>
         Accompany either with an entry to conf/distro/include/sane-srcrevs.inc for a revision that you know
-        builds successfully.
+        builds successfully.  It is also common to define the stable SRCREV 
+        for your package directly in the package recipe.
         </para>
         <para>
         If you really absolutely have to follow the latest commits, you can do that by adding
@@ -126,7 +129,7 @@ SRCDATE = "20061014"
   <section id="commonuse_new_image">
     <title>Creating your own image</title>
 
-    <para>Creating own image is easy - only few variables needs to be set:
+    <para>Creating own image is easy - only few variables need to be set:
     <itemizedlist>
         <listitem>
           <para><command>IMAGE_BASENAME</command> to give a name for your own
@@ -147,7 +150,7 @@ SRCDATE = "20061014"
           <para><command>IMAGE_LINGUAS</command> is an optional list of
           languages which has to be installed into the image</para>
         </listitem>
-      </itemizedlist> Then adding of the <emphasis>image</emphasis> class use:
+      </itemizedlist> Then add the <emphasis>image</emphasis> class using:
     <screen>
 inherit image
 </screen> And the image recipe is ready for usage.</para>
@@ -240,7 +243,7 @@ export LOCALDIR=$PWD/secret-isv
                     </screen>
 
         <para>Use <command>source build_source</command> to source the script,
-        use <command>env</command> to check that the variable where
+        use <command>env</command> to check that the variables were
         exported.</para>
       </section>
 
@@ -484,8 +487,8 @@ RDEPENDS_${PN} += "\
             <title>Putting it together</title>
             <para>In the previous two sections we have prepared the host and
             target side. One thing that is missing is combining the two newly
-            created tasks and actually create the SDK. This is what we are going
-            to do now.</para>
+            created tasks and actually creating the SDK. This is what we are 
+            going to do now.</para>
 
             <para>Create <filename>meta-toolchain-YOU.bb</filename> in the
             <filename>recipes/meta</filename> directory and place the following
@@ -529,7 +532,7 @@ SDK_SUFFIX = "toolchain-YOUR"
             optional dependencies like directFB, glib-2.0, gstreamer-0.10, tslib
             and more esoteric dependencies like mysql and postgres. This allows
             developers to simply start developing using Qt and enables system
-            integrator to easily recompile Qt and base libraries without tracking
+            integrators to easily recompile Qt and base libraries without tracking
             down extra dependencies.
             </para>
 
@@ -575,7 +578,7 @@ $ <command>bitbake</command> meta-toolchain-qte
             should start by downloading the SDK and untar it to the root folder
             (<filename>/</filename>). Once this operation is finished you will
             find a new directory <filename>/usr/local/angstrom/arm/</filename> and
-            it contains the <filename>environment-setup</filename> to setup the
+            it contains the <filename>environment-setup</filename> file to setup the
             <emphasis>QMAKESPEC</emphasis> and various other paths.
             </para>
 
-- 
1.6.0.4




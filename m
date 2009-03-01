Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1Ldrcp-0005ot-VH
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Mar 2009 20:47:00 +0100
Received: by rv-out-0708.google.com with SMTP id b17so2161454rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2009 11:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:user-agent:mime-version:content-type;
	bh=3ZrS4Ivwiki4jmBXaislu+k04LukzxhnCmzknfz6IYU=;
	b=ut0WzEAK4Vty0kSW8d3ST+FMkLZtfJ50XPq8Lfd44GkDipV+U4W8lV5ppwMwflB5ZK
	v+zLPO8DH8NbP//x2nUvv2KVnNzNvxjnSP3IK/pbBYxzWZ8QPqHb2cww8XmOzp8MCDKn
	kP+YE6LPKLv1GnpGNVc4JkVHZ7WATHVk/6Lys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:user-agent:mime-version
	:content-type;
	b=mG0SaZbHDg+qgWCjz/OHvza9G09DAGfBTCG8VajkbGIRET5O9qgoR297iTpHrAdzey
	1slwIOBAnXBJ8v5VAzDImcf7vfJKuwcUNznnQbACC8M9dAZQNMPm6sxvVM//YhCYIkzY
	bwe5LYOdRIjs5qcCBM3HqoAftJV6vEB80jscM=
Received: by 10.142.191.5 with SMTP id o5mr2556328wff.326.1235936592155;
	Sun, 01 Mar 2009 11:43:12 -0800 (PST)
Received: from dorkboy (68-29-136-50.pools.spcsdns.net [68.29.136.50])
	by mx.google.com with ESMTPS id 20sm8359052wfi.12.2009.03.01.11.43.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 01 Mar 2009 11:43:11 -0800 (PST)
Date: Sun, 1 Mar 2009 11:43:05 -0800 (PST)
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <alpine.DEB.1.00.0903011142130.4985@localhost.localdomain>
User-Agent: Alpine 1.00 (DEB 882 2007-12-20)
MIME-Version: 1.0
Subject: [PATCH] metadata.xml: Update 'File Layout' section.
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
X-List-Received-Date: Sun, 01 Mar 2009 19:47:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


---
 docs/usermanual/chapters/metadata.xml |  107 ++++++++++++++++++++++++++-------
 1 files changed, 84 insertions(+), 23 deletions(-)

diff --git a/docs/usermanual/chapters/metadata.xml b/docs/usermanual/chapters/metadata.xml
index f4cf3bc..54fb523 100644
--- a/docs/usermanual/chapters/metadata.xml
+++ b/docs/usermanual/chapters/metadata.xml
@@ -5,28 +5,89 @@
   <section id="metadata_file_layout">
     <title>File Layout</title>
 
-    <para>OpenEmbedded has six directories three of them hold
-    <application>BitBake</application> metadata.</para>
-
-    <para>The <emphasis>conf</emphasis> directory is holding the bitbake.conf,
-    machine and distribution configuration. bitbake.conf is read when
-    <application>BitBake</application> is started and this will include among
-    others a local.conf the machine and distribution configuration files.
-    These files will be searched in the <command>BBPATH</command> environment
-    variable.</para>
-
-    <para><emphasis>classes</emphasis> is the directory holding
-    <application>BitBake</application> bbclass. These classes can be inherited
-    by the <application>BitBake</application> files. BitBake automatically
-    inherits the base.bbclass on every parsed file. <command>BBPATH</command>
-    is used to find the class.</para>
-
-    <para>In <emphasis>packages</emphasis> the
-    <application>BitBake</application> files are stored. For each task or
-    application we have a directory. These directories store the real
-    <application>BitBake</application> files. They are the ones ending with
-    <emphasis>.bb</emphasis>. And for each application and version we have
-    one.</para>
+    <para>The OpenEmbedded
+      directory, <filename>$OEBASE/openembedded/</filename>, has seven
+      directories, three of which hold
+      <application>BitBake</application> metadata.
+
+      <variablelist>
+        <varlistentry>
+          <term><filename>classes/</filename></term>
+          <listitem>
+            <para>Contains <application>BitBake</application>
+              <filename>.bbclass</filename> files. These classes can
+              be inherited by other <application>BitBake</application>
+              files. Every <application>BitBake</application>
+              <filename>.bb</filename> file automatically inherits the
+              <filename>base.bbclass</filename>. <varname>BBPATH</varname>
+              is used to find the <filename>.bbclass</filename> files.
+            </para>
+          </listitem>
+        </varlistentry>
+
+        <varlistentry>
+          <term><filename>conf/</filename></term>
+          <listitem>
+            <para>Contains the configuration files for OpenEmbedded.
+              The <filename>bitbake.conf</filename> is read when
+              <application>BitBake</application> is started and this will
+              include the <filename>local.conf</filename>, the machine and
+              distribution configuration files, among others. These files
+              will be located using the <varname>BBPATH</varname> environment
+              variable as a search path.
+            </para>
+          </listitem>
+        </varlistentry>
+
+        <varlistentry>
+          <term><filename>contrib/</filename></term>
+          <listitem>
+            <para>Contains miscellaneous scripts that do not
+              belong in the other directories.
+            </para>
+          </listitem>
+        </varlistentry>
+
+        <varlistentry>
+          <term><filename>docs/</filename></term>
+          <listitem>
+            <para>Contains the source for the user manual and other
+              documentation files.
+            </para>
+          </listitem>
+        </varlistentry>
+
+        <varlistentry>
+          <term><filename>files/</filename></term>
+          <listitem><para>Contains setup tables for populating
+              the <filename>/dev</filename> directory of various target images.
+          </para></listitem>
+        </varlistentry>
+
+        <varlistentry>
+          <term><filename>packages/</filename></term>
+          <listitem>
+            <para>Conatins all of the
+              <application>BitBake</application> <filename>.bb</filename>
+              files. There is a subdirectory for each task or application
+              and within that subdirectory is
+              a <application>BitBake</application> <filename>.bb</filename> file
+              for each supported version of an application or task.
+            </para>
+          </listitem>
+        </varlistentry>
+
+        <varlistentry>
+          <term><filename>site/</filename></term>
+          <listitem>
+            <para>Contains site configuration files for
+              the <application>autoconf</application>/<application>automake</application>
+              system.
+            </para>
+          </listitem>
+        </varlistentry>
+      </variablelist>
+    </para>
   </section>
 
   <section id="metadata_syntax">
@@ -126,4 +187,4 @@ FILES_${PN} += "/usr/weirdpath/importantfile.foo"
     will get appended to the standard file-list, not replace the standard
     one.</para>
   </section>
-</chapter>
\ No newline at end of file
+</chapter>
-- 
1.5.4.3

Signed-off-by: Theodore A. Roth <taroth@gmail.com>



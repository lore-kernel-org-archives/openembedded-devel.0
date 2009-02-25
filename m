Received: from [209.85.200.175] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1Lc9aj-0002gE-H3
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 03:33:45 +0100
Received: by wf-out-1314.google.com with SMTP id 28so3273675wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2009 18:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:user-agent:mime-version:content-type;
	bh=iWfNCQvY/SZ0Exq+ohPXSPT7f4OJ1Ew3L+zRpTYqebw=;
	b=P34d+qHrtAcqcPtn0hEt6HKsHnG1B38avaacEXK49HLub3ejbnSYkCYSCud2/wzkd0
	hp2QMOcO0zSL17UZ/5QSgzdazvJ9VaV3ZoI5DqGBrue4+cgNpItaWciC5o4uHUVjZF/I
	qQRq855punYcTAs72a1eQDv4aLf8O7+JuXiOI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:user-agent:mime-version
	:content-type;
	b=LqPcj+u0TCKLOpCFfkGPLufdB9ezL5mFSNdVXF0ezT0Hfn9BnArVOkTsMf8uPb9Yje
	TceZaNzb57J9d24+O+fzy6kN/nYgmp4SwKGWPsCxVGQEaJ7TKCMD+r6m5ofcA+0YudRb
	KArs7u9AXtvIXeiYcNfR+BTqCzRE7PTSy4+nY=
Received: by 10.142.144.16 with SMTP id r16mr2847655wfd.214.1235529038928;
	Tue, 24 Feb 2009 18:30:38 -0800 (PST)
Received: from dorkboy (68-29-178-240.pools.spcsdns.net [68.29.178.240])
	by mx.google.com with ESMTPS id 28sm15321814wfd.45.2009.02.24.18.30.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Feb 2009 18:30:38 -0800 (PST)
Date: Tue, 24 Feb 2009 18:30:31 -0800 (PST)
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <alpine.DEB.1.00.0902241827020.19556@localhost.localdomain>
User-Agent: Alpine 1.00 (DEB 882 2007-12-20)
MIME-Version: 1.0
Subject: [PATCH] getting_oe.xml: Update documentation.
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
X-List-Received-Date: Wed, 25 Feb 2009 02:33:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

 * New section about directory structure.
 * Update 'Getting BitBake' section.

Resubmitted against .dev instead of .documentation.

Signed-off-by: Theodore A. Roth <taroth@gmail.com>

---
 docs/usermanual/chapters/getting_oe.xml |  103 +++++++++++++++++++++++++------
 1 files changed, 83 insertions(+), 20 deletions(-)

diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
index 9238e4f..c7eb7ec 100644
--- a/docs/usermanual/chapters/getting_oe.xml
+++ b/docs/usermanual/chapters/getting_oe.xml
@@ -2,30 +2,93 @@
 <chapter id="chapter_getting_oe">
   <title>Getting Started</title>
 
+  <section id="gettingoe_directory_setup">
+    <title>OpenEmbedded Directory Structure</title>
+
+    <para>Before you begin downloading OpenEmbedded, you need to setup your
+    working environment.</para>
+
+	<para>The first step is to decide where on your system you wish to
+    work. This document will use the <varname>$OEBASE</varname> variable to
+    denote the base directory of the OpenEmbedded environment. For
+    example, <varname>$OEBASE</varname> could
+    be <literal>/home/joe/work/oe</literal>.</para>
+
+    <para>The base directory of your OpenEmbedded environment
+    (<varname>$OEBASE</varname>) is the location where sources will be checked
+    out (or unpacked). You must choose a location with <emphasis>no symlinks
+    above it</emphasis>.</para>
+
+	<para>To create the directory structure:
+
+    <screen>
+$ mkdir -p $OEBASE/build/conf
+$ cd $OEBASE</screen>
+
+	The <literal>$OEBASE/build</literal> directory will contain your
+	local configurations and extensions to the OpenEmbedded system which allow
+	you to build your applications and images.
+    </para>
+
+	<para>The <varname>$OEBASE</varname> will also contain both bitbake/ and
+	openembedded/ directories. These will be discussed in
+	<xref linkend="gettingoe_getting_bitbake"/> and
+	<xref linkend="gettingoe_getting_oe"/>.
+	</para>
+  </section>
+
   <section id="gettingoe_getting_bitbake">
     <title>Getting <application>BitBake</application></title>
 
-    <para>The required version of <application>BitBake</application> is
-    changing rapidly. At the time of writing (end 2007)
-    <application>BitBake</application> 1.8.latest was required.</para>
-
-    <para>A safe method is to get the <application>BitBake</application> from
-    a stable Subversion branch (those with an even minor number). <screen>
-<command>svn</command> co http://svn.berlios.de/svnroot/repos/bitbake/branches/bitbake-1.8
-...
-A   bitbake-1.8/classes/base.bbclass
-U   bitbake-1.8
-At revision 827.
-            </screen> <application>BitBake</application> is checked out now;
-    this completes the first and most critical dependency of OpenEmbedded.
-    Issuing <command>svn</command> <command>up</command> in the
-    <emphasis>bitbake-1.8</emphasis> directory will update
-    <application>BitBake</application> to the latest stable version, but
-    generally it is a good idea to stick with a specific known working version
-    of <application>BitBake</application> until OpenEmbedded asks you to
-    upgrade.</para>
+    <para>Before using OE, you must first obtain the build tool it needs:
+    bitbake.</para>
+
+    <para>It is recommended to run bitbake without installing it, as a sibling
+    directory of <literal>openembedded/</literal>
+    and <literal>build/</literal> directories. Indeed, as bitbake is written
+    in python it does not need compilation for being used. You'll just have to
+    set the PATH variable so that the BitBake tools are accessible (see
+    <xref linkend="gettingoe_configuring_oe"/>).</para>
+
+	<section><title>Getting <application>BitBake</application> Using Subversion</title>
+	  <para>To checkout the latest version of the BitBake 1.8 branch, use the
+		following command:
+		<screen>
+$ cd $OEBASE
+$ <command>svn</command> co svn://svn.berlios.de/bitbake/branches/bitbake-1.8/ bitbake
+</screen>
+	  </para>
+
+	  <para><application>BitBake</application> is checked out now and
+		the <varname>$OEBASE</varname> directory will contain
+		a <literal>bitbake/</literal> subdirectory.</para>
+
+	  <para>If you need to access a Subversion server through a proxy, see the
+		<ulink url="http://subversion.tigris.org/faq.html#proxy">SVN FAQ</ulink>
+	  </para>
+	</section>
+
+	<section><title>Updating <application>BitBake</application></title>
+	  <para>Bitbake is being revised fairly often. Periodically it's a good
+		idea to check the repository of bitbake stable branches to see if a
+		new stable branch is available or if the current branch has been
+		revised. Compare your existing bitbake directory with the latest
+		bitbake branch in the repository. Your existing bitbake branch and
+		its 'last changed revision' number can be found as follows:
+
+		<screen>$ cd $OEBASE/bitbake; svn info</screen>
+
+		If there is a new stable branch, you will want to move or delete
+		your existing bitbake directory and repeat the process listed above
+		under "To obtain bitbake". If there is no new branch, it is easy to
+		update bitbake:
+
+		<screen>$ cd $OEBASE/bitbake; svn update</screen>
+	  </para>
+	</section>
   </section>
 
+
   <section id="gettingoe_getting_oe">
     <title>Getting OpenEmbedded</title>
 
@@ -67,4 +130,4 @@ bitbake &lt;recipe_name&gt;
 
     <para>This section is a stub, help us by expanding it</para>
   </section>
-</chapter>
\ No newline at end of file
+</chapter>
-- 
1.5.4.3




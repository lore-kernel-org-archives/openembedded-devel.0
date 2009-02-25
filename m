Received: from [209.85.200.172] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1Lc9fq-0002oO-HV
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 03:39:02 +0100
Received: by wf-out-1314.google.com with SMTP id 25so2923251wfc.6
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 18:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:user-agent:mime-version:content-type;
	bh=HqrQX7unWXonRPoAATAHPUGc9i0K39KjdPNNkr5ORmw=;
	b=V2xF4QleLQF8QzbM7+ix+yCDk+rjAT/IJA6NNCJkrCDXPqVE+TeUDVkBaI4I5jxyig
	H1+C7Ez1iYOCLmwKCQc3bN9//4l91x8dLswNCKFaCproUtFJ8ST6Jr3MJc4E7PO2eVHO
	RufMw+cgCGz2KO1alRQWSexDqyomA1qkgN+XU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:user-agent:mime-version
	:content-type;
	b=fWDztgeOQs+tTpDhS5mkdTYZrz8yEyMIn9upnYLua9Gl4ofgUebOAGokxyRxAHZx5z
	BtULt8Acn4YmrqnatzFmefyHkF9auTL7hAJhYSTVdlnt7taW8NBaUQ8KTEkVUQ+woxwp
	SHFkTYxQOSdsEpZ4kLUeuy4rceWAgIdag0o1E=
Received: by 10.142.165.21 with SMTP id n21mr236722wfe.143.1235529355573;
	Tue, 24 Feb 2009 18:35:55 -0800 (PST)
Received: from dorkboy (68-29-178-240.pools.spcsdns.net [68.29.178.240])
	by mx.google.com with ESMTPS id 22sm14294987wfg.23.2009.02.24.18.35.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Feb 2009 18:35:54 -0800 (PST)
Date: Tue, 24 Feb 2009 18:35:51 -0800 (PST)
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@openembedded.org
Message-ID: <alpine.DEB.1.00.0902241833540.19556@localhost.localdomain>
User-Agent: Alpine 1.00 (DEB 882 2007-12-20)
MIME-Version: 1.0
Subject: [PATCH] getting_oe.xml: Add Configuring OpenEmbedded section.
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
X-List-Received-Date: Wed, 25 Feb 2009 02:39:03 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

This patch fills in the stub for the "Configuring OpenEmbedded" section.

Signed-off-by: Theodore A. Roth <taroth@gmail.com>

---
 docs/usermanual/chapters/getting_oe.xml |   97 ++++++++++++++++++++++++++++++-
 1 files changed, 96 insertions(+), 1 deletions(-)

diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
index 69b9126..3c68504 100644
--- a/docs/usermanual/chapters/getting_oe.xml
+++ b/docs/usermanual/chapters/getting_oe.xml
@@ -141,7 +141,102 @@ $ git pull</screen>
   <section id="gettingoe_configuring_oe">
     <title>Configuring OpenEmbedded</title>
 
-    <para>This section is a stub, help us by expanding it</para>
+    <para>At this point, your <literal>$OEBASE/</literal> directory should
+      contain at least the following subdirectories:
+      <itemizedlist>
+        <listitem><simpara><literal>build/</literal></simpara></listitem>
+        <listitem><simpara><literal>bitbake/</literal></simpara></listitem>
+        <listitem><simpara><literal>openembedded/</literal></simpara></listitem>
+      </itemizedlist>
+    </para>
+
+    <section><title>Environment Setup</title>
+      <para>There are a few environment variables that you will need to set
+        before you can build software for OpenEmbedded using BitBake. You will
+        need to set these variables every time you open a terminal for
+        development. You can automate this in
+        <filename>~/.profile</filename>, <filename>/etc/profile</filename>, or
+        perhaps use a script to set the necessary variables for using BitBake.
+      </para>
+
+      <para>Since the path to your OpenEmbedded installation will be used in
+        many places, setting it in your environment will allow you to use
+        the <varname>$OEBASE</varname> variable in all pathes and make it
+        easier to change in the future should the need arise. To
+        set <varname>$OEBASE</varname> if you use a Bourne like shell
+        <footnote>
+          <para>If you use a CSH like shell (e.g. on a FreeBSD system), you
+            will set environment variables like this:
+            <screen>
+$ setenv VAR_NAME "VAR_VALUE"</screen>
+          </para>
+        </footnote>, do this:
+
+        <screen>
+$ export OEBASE=/path/to/your/oe/installation</screen>
+
+      </para>
+
+      <para>If you followed the recommendation to use BitBake from svn, you
+        will need to add the path to the BitBake executable to
+        your <varname>PATH</varname> environment variable like this:
+
+        <screen>
+$ export PATH=$OEBASE/bitbake/bin:$PATH</screen>
+      </para>
+
+      <para>In order for bitbake to find the configuration files for
+        OpenEmbedded, you will need to set the <varname>BBPATH</varname>
+        variable.
+
+        <screen>
+$ export BBPATH=$OEBASE/build:$OEBASE/openembedded</screen>
+      </para>
+
+      <para>Finally, if you wish to allow BitBake to inherit
+        the <varname>$OEBASE</varname> variable from the environment, you will
+        need to set the <varname>BB_ENV_EXTRAWHITE</varname> variable:
+
+        <screen>
+$ export BB_ENV_EXTRAWHITE="OEBASE"</screen>
+
+        Note the absence of the "$" character which implies that you are
+        setting <varname>BB_ENV_EXTRAWHITE</varname> to the variable name, not
+        the variable value.
+      </para>
+    </section>
+
+    <section><title>Local Configuration</title>
+      <para>It is now time to create your local configuration. While you could
+        copy the default <filename>local.conf.sample</filename> like this:
+
+        <screen>
+$ cd $OEBASE
+$ cp openembedded/conf/local.conf.sample build/conf/local.conf
+$ vi build/conf/local.conf</screen>
+
+        It is actually recommended to start smaller and
+        keep <filename>local.conf.sample</filename> in the background. Add
+        entries from there step-by-step as you understand and need
+        them. Please, do not just edit
+        <filename>build/conf/local.conf.sample</filename> but
+        actually <emphasis>READ</emphasis> it (read it and then edit it).
+      </para>
+
+      <para>For building an <literal>org.openembedded.dev</literal> branch, in
+        your <filename>local.conf</filename> file, you should have at least
+        the following three
+        entries: <varname>BBFILES</varname>, <varname>DISTRO</varname>
+        and <varname>MACHINE</varname>. For example, consider the following
+        mininal <literal>local.conf</literal> file for the &Aring;ngstr&ouml;m
+        distribution and the Openmoko gta01 machine:
+
+        <screen>
+BBFILES = "${OEBASE}/openembedded/packages/*/*.bb"
+DISTRO = "angstrom-2008.1"
+MACHINE = "om-gta01"</screen>
+      </para>
+    </section>
   </section>
 
   <section id="gettingoe_building_software">
-- 
1.5.4.3




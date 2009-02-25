Received: from [209.85.200.171] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1Lc9d2-0002iW-GI
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 03:36:08 +0100
Received: by wf-out-1314.google.com with SMTP id 25so2922091wfc.6
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 18:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:user-agent:mime-version:content-type;
	bh=Xv/v0HAMMytLThINbzrYX/zSEXECGDOQYE2LVk22Xzs=;
	b=tMsDVKLqPoeqdtQSjsPgqBIRt5RWoj8XsxdPXJVhWPvFJWxCTeFTOalkwSgo9lKCiW
	TCb81IT2UexFjWBJktzy/3yg6hN8bj7mNFBJ6kdJwbLsfrgaJLbX00yZF4CyXbFQN+yH
	/4GXo/hJ0VY9zjSof3RZD24ymGCEFzQ8lH+Hg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:user-agent:mime-version
	:content-type;
	b=FAtCocf3vqbgfa8dB7xQG1t6UqBZzUa0V7++rInfsUbVEUwvGFvrhMaXb8aWrNwdmy
	Yn4W/HC3rO0cwAsP0eWbfv81BIYxRfBoOByWQ7EPF7XQ3wvLMq0FW9ZHziRYEBokvEwV
	OW+CgoP6EDdYDWTOOKp5mCf8CikTd+1nC1AuA=
Received: by 10.142.170.6 with SMTP id s6mr2276260wfe.322.1235529181200;
	Tue, 24 Feb 2009 18:33:01 -0800 (PST)
Received: from dorkboy (68-29-178-240.pools.spcsdns.net [68.29.178.240])
	by mx.google.com with ESMTPS id 28sm9669772wfd.5.2009.02.24.18.32.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Feb 2009 18:33:00 -0800 (PST)
Date: Tue, 24 Feb 2009 18:32:57 -0800 (PST)
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@openembedded.org
Message-ID: <alpine.DEB.1.00.0902241830490.19556@localhost.localdomain>
User-Agent: Alpine 1.00 (DEB 882 2007-12-20)
MIME-Version: 1.0
Subject: [PATCH] getting_oe.xml: Update getting openembedded section.
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
X-List-Received-Date: Wed, 25 Feb 2009 02:36:08 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

Resubmitted against .dev branch instead of .documentation.

getting_oe.xml: Update getting openembedded section.

Signed-off-by: Theodore A. Roth <taroth@gmail.com>

---
 docs/usermanual/chapters/getting_oe.xml |   60 ++++++++++++++++++++++---------
 1 files changed, 43 insertions(+), 17 deletions(-)

diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
index c7eb7ec..69b9126 100644
--- a/docs/usermanual/chapters/getting_oe.xml
+++ b/docs/usermanual/chapters/getting_oe.xml
@@ -92,24 +92,50 @@ $ <command>svn</command> co svn://svn.berlios.de/bitbake/branches/bitbake-1.8/ b
   <section id="gettingoe_getting_oe">
     <title>Getting OpenEmbedded</title>
 
+    <para><emphasis>Note:</emphasis> Once upon a time OpenEmbedded used
+      Monotone for version control. If you have an OE Monotone repository on
+      your computer, you should replace it with the Git repository.</para>
+
     <para>The OpenEmbedded metadata has a high rate of development, so it's a
-    good idea to stay up to date. You'll need monotone 0.28 to get the
-    metadata and stay up to date. Monotone is available in most distributions
-    and has binaries at <ulink url="http://venge.net/monotone/">Monotone
-    homepage</ulink>.</para>
-
-    <para>Next step is getting snapshot of database. <screen>
-wget http://openembedded.org/snapshots/OE.mtn.bz2 http://openembedded.org/snapshots/OE.mtn.bz2.md5
-</screen> Or if you have monotone 0.30 or later: <screen>
-wget http://www.openembedded.org/snapshots/OE-this-is-for-mtn-0.30.mtn.bz2 
-wget http://www.openembedded.org/snapshots/OE-this-is-for-mtn-0.30.mtn.bz2.md5
-</screen> Then verify integrity of snapshot by checking md5sum. <screen>
-md5sum -c OE.mtn.bz2.md5sum
-</screen> Then unpack database. <screen>
-bunzip OE.mtn.bz2
-</screen> Finally checkout the development branch. <screen>
-mtn --db=OE.mtn co -b org.openembedded.dev
-</screen></para>
+      good idea to stay up to date. You'll need Git to get the metadata and
+      stay up to date. Git is available in most distributions and has binaries
+      at <ulink url="http://git-scm.com/">Git homepage</ulink>.</para>
+
+    <section><title>Checking Out OpenEmbedded With Git</title>
+      <para>Once you have installed Git, checkout the OpenEmbedded repository:
+        <screen>
+$ cd $OEBASE
+$ git clone git://git.openembedded.net/openembedded</screen>
+        The <literal>$OEBASE/openembedded/</literal> directory should now
+        exist.</para>
+    </section>
+
+    <section><title>Updating OpenEmbedded</title>
+      <para>The <literal>org.openembedded.dev</literal> branch of OpenEmbedded
+        is updated very frequently (as much as several times an hour). The
+        distro branches are not updated as much but still fairly often. It
+        seems good practice to update your OpenEmbedded tree at least
+        daily. To do this, run:
+        <screen>
+$ cd $OEBASE
+$ git pull</screen>
+      </para>
+    </section>
+    <section><title>Changing Branches</title>
+      <para>Working with multiple branches is very easy to do with Git. The
+        OpenEmbedded repository holds many branches. To list all branches, use this command:
+        <screen>$ git branch -a</screen>
+        Branch names that begin with <literal>origin/</literal> denote
+        branches that exist on the remote server. The name with a * in front
+        of it is the branch currently checked out. If you want to work with a
+        remote branch, you must first create a local copy of it. The following
+        command will create a local copy of a remote branch:
+        <screen>$ git branch &lt;local_name&gt; &lt;remote_name&gt;</screen>
+        To change branches, use this command:
+        <screen>$ git checkout &lt;branch_name&gt;</screen>
+        There are more complicated branch operations that can be done with git,
+        but those are beyond the scope of this document.</para>
+    </section>
   </section>
 
   <section id="gettingoe_configuring_oe">
-- 
1.5.4.3




Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jacob@technosorcery.net>) id 1O6yB7-0000vf-Mq
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Apr 2010 05:43:15 +0200
Received: by pxi14 with SMTP id 14so2271149pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 20:39:32 -0700 (PDT)
Received: by 10.115.64.6 with SMTP id r6mr3338161wak.226.1272425972092;
	Tue, 27 Apr 2010 20:39:32 -0700 (PDT)
Received: from sfa-5.perlninja.com ([96.225.220.117])
	by mx.google.com with ESMTPS id n32sm6454392wae.10.2010.04.27.20.39.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 27 Apr 2010 20:39:31 -0700 (PDT)
Received: by sfa-5.perlninja.com (Postfix, from userid 1000)
	id D602B37E01E6; Tue, 27 Apr 2010 20:39:28 -0700 (PDT)
From: Jacob Helwig <jacob@technosorcery.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Apr 2010 20:39:13 -0700
Message-Id: <1272425953-19544-1-git-send-email-jacob@technosorcery.net>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: jacob@technosorcery.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Add missing opening <varlistentry> tag in the user manual.
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
X-List-Received-Date: Wed, 28 Apr 2010 03:43:15 -0000

While we're here, remove the straggling hard-tabs.

Signed-off-by: Jacob Helwig <jacob@technosorcery.net>
---

I hope this is the right way to submit a documentation fix.  If not, please
point me at the FM, since I didn't find it in looking through the Wiki, or the
repo.

 docs/usermanual/reference/var_src_uri.xml |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/reference/var_src_uri.xml
index bc49571..b858e8a 100644
--- a/docs/usermanual/reference/var_src_uri.xml
+++ b/docs/usermanual/reference/var_src_uri.xml
@@ -455,11 +455,12 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
         </listitem>
       </varlistentry>
 
+      <varlistentry>
         <term>tag</term>
 
         <listitem>
           <para>The git tag to retrieve. The default is
-	  <command>"master"</command>.  This may be placed into
+          <command>"master"</command>.  This may be placed into
           <command>SRCREV</command> instead.</para>
         </listitem>
       </varlistentry>
@@ -470,7 +471,7 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
         <listitem>
           <para>The method to use to access the repository. Common options are
           <command>"git"</command>, <command>"http"</command> and
-	  <command>"rsync"</command>. The default is
+          <command>"rsync"</command>. The default is
           <command>"rsync"</command>.</para>
         </listitem>
       </varlistentry>
@@ -484,7 +485,7 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
 
           <listitem>
             <para>The revision of the git source to be checked out.
-	    The default is <command>1</command> which is invalid and leads to
+            The default is <command>1</command> which is invalid and leads to
             an error.</para>
           </listitem>
         </varlistentry>
-- 
1.7.0.4




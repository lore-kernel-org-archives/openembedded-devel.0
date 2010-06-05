Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OKoGD-0002O1-G8
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 09:57:43 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OKoC3-0004fi-NJ for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 03:53:25 -0400
Date: Sat, 5 Jun 2010 03:53:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.00.1006050351360.10633@lynx>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Manual: Add missing unpack file formats to list.
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
X-List-Received-Date: Sat, 05 Jun 2010 07:57:43 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Add entries for .tbz2, .xz, .tar.xz and .jar files.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/reference/var_src_uri.xml
index b858e8a..a86fdba 100644
--- a/docs/usermanual/reference/var_src_uri.xml
+++ b/docs/usermanual/reference/var_src_uri.xml
@@ -113,7 +113,7 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
     </varlistentry>

     <varlistentry>
-      <term>.tbz, .tar.bz2</term>
+      <term>.tbz, .tbz2, .tar.bz2</term>

       <listitem>
         <para>Bzip2 compressed tar archives which will be extracted with
@@ -143,7 +143,25 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
     </varlistentry>

     <varlistentry>
-      <term>.zip</term>
+      <term>.xz</term>
+
+      <listitem>
+        <para>xz (LZMA2) compressed files which will be decompressed with
+        <command>"xz -dc &lt;srcfile&gt; &gt; &lt;srcfile&gt;"</command>.</para>
+      </listitem>
+    </varlistentry>
+
+    <varlistentry>
+      <term>.tar.xz</term>
+
+      <listitem>
+        <para>xz (LZMA2) compressed tar archives which will be decompressed with
+        <command>"xz -dc &lt;srcfile&gt; | tar x --no-same-owner -f -"</command>.</para>
+      </listitem>
+    </varlistentry>
+
+    <varlistentry>
+      <term>.zip, .jar</term>

       <listitem>
         <para>Zip archives which will be extracted with <command>"unzip -q


-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================



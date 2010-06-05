Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OKnbN-0000VP-6E
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 09:15:32 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OKnXE-0001Em-GO for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 03:11:12 -0400
Date: Sat, 5 Jun 2010 03:11:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.00.1006050308120.10201@lynx>
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
Subject: [PATCH] Some simple updates in OE manual, reference chapter.
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
X-List-Received-Date: Sat, 05 Jun 2010 07:15:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Obvious fixes:

"recipies" -> "recipes"
Update references to patch= and pnum= to striplevel=

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  there's way more that can be updated on that page alone but i'd
rather do this in logical chunks if that's ok.



diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/reference/var_src_uri.xml
index b858e8a..b973bec 100644
--- a/docs/usermanual/reference/var_src_uri.xml
+++ b/docs/usermanual/reference/var_src_uri.xml
@@ -2,7 +2,7 @@
 <section id="src_uri_variable" xreflabel="SRC_URI variable">
   <title>SRC_URI variable: Source code and patches</title>

-  <para>All recipies need to contain a definition of
+  <para>All recipes need to contain a definition of
   <command>SRC_URI</command>. It determines what files and source code is
   needed and where that source code should be obtained from. This includes
   patches to be applied and basic files that are shipped as part of the
@@ -10,8 +10,8 @@

   <para>A typical <command>SRC_URI</command> contains a list of URL's, patches
   and files as shown in this example from quagga:<screen>SRC_URI = "http://www.quagga.net/download/quagga-${PV}.tar.gz \
-           file://ospfd-no-opaque-lsa-fix.patch;patch=1 \
-           file://fix-for-lib-inpath.patch;patch=1 \
+           file://ospfd-no-opaque-lsa-fix.patch \
+           file://fix-for-lib-inpath.patch \
            file://quagga.init \
            file://quagga.default \
            file://watchquagga.init \
@@ -37,8 +37,8 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
   a checksum will throw errors.</para>
   <para>Each URI supports a set of additional options. These options are
   tag/value pairs of the form <command>"a=b"</command> and are semi-colon
-  separated from each other and from the URI. The follow examples shows two
-  options being included, the patch and pnum options:<screen>file://ospfd-no-opaque-lsa-fix.patch;patch=1;pnum=2</screen>The
+  separated from each other and from the URI. The following example shows one
+  option being included, the striplevel option:<screen>file://ospfd-no-opaque-lsa-fix.patch;striplevel=2</screen>The
   supported methods for fetching source and files are:</para>

   <variablelist>
@@ -209,7 +209,7 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
     scripts, to be included in the final package.</para>

     <para>The following example shows the specification of a patch
-    file:<screen>file://ospfd-no-opaque-lsa-fix.patch;patch=1</screen></para>
+    file:<screen>file://ospfd-no-opaque-lsa-fix.patch</screen></para>

     <para>Patch files are be copied to the patches subdirectory of the source
     directory, <command>${S}/patches</command>, and then applied from the


rday
-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================



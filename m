Received: from mail-gw0-f65.google.com ([74.125.83.65])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OHGVi-0006xu-JW
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 15:19:07 +0200
Received: by gwj23 with SMTP id 23so25561gwj.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 06:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=36wj12R5EbXxNPMdR0AcXxZQ8TIBODG1FI8iwpRBEmM=;
	b=AYvySHDFPtcN3TIG1Gm8jbCft9GqnftMkjuvAuRnSb2PsOsjB1RHhL7dS7QFxPVK5c
	hWJ+SRcI8Wj3vvvLpLr0qYruQEP+K+89zrjG7pW/YRcwuqTRk2LASojqdYsTFUGtY/tF
	T5obrXgGPetRnXiA62CaYPdzTf7fwnsN5/Jps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HrWYqdIT+sS2G1JX5eavzoefzf4ehczx8tDt6SNW1nyJjVZHiH5m5kpV5LRxJryj4b
	MLtt2X1+Rbkr55gFDjivHYddCnsP205lELT3u917rOYEnAXTYC8vO7bV998xBvVDaSJh
	TeXkOBlGO82f1twitesk2y/ZwMtn8FxCIDZDU=
Received: by 10.100.243.18 with SMTP id q18mr10202351anh.166.1274879693919;
	Wed, 26 May 2010 06:14:53 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id n18sm433983anl.12.2010.05.26.06.14.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 06:14:52 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 08:09:32 -0500
Message-Id: <1274879375-19626-4-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1274879375-19626-3-git-send-email-chase.maupin@ti.com>
References: <1274879375-19626-1-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-2-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-3-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 74.125.83.65
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCHv2 4/7] getting_oe: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 13:19:12 -0000

* Fixed up typos and other errors in the documentation.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 docs/usermanual/chapters/getting_oe.xml |   26 ++++++++++++++++++++++----
 1 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
index d18c955..c82df3a 100644
--- a/docs/usermanual/chapters/getting_oe.xml
+++ b/docs/usermanual/chapters/getting_oe.xml
@@ -98,7 +98,7 @@ $ <command>git</command> clone git://git.openembedded.org/openembedded</screen>
         seems good practice to update your OpenEmbedded tree at least
         daily. To do this, run:
         <screen>
-$ <command>cd</command> $OEBASE
+$ <command>cd</command> $OEBASE/openembedded
 $ <command>git</command> pull</screen>
       </para>
     </section>
@@ -142,7 +142,7 @@ $ <command>git</command> pull</screen>
 
       <para>Since the path to your OpenEmbedded installation will be used in
         many places, setting it in your environment will allow you to use
-        the <varname>$OEBASE</varname> variable in all pathes and make it
+        the <varname>$OEBASE</varname> variable in all paths and make it
         easier to change in the future should the need arise. To
         set <varname>$OEBASE</varname> if you use a Bourne like shell
         <footnote>
@@ -342,6 +342,16 @@ MACHINE = "om-gta01"</screen>
             </varlistentry>
 
             <varlistentry>
+              <term><literal>base-image</literal></term>
+              <listitem>
+                <para>Build an image that is the smallest possible image
+                  which allows for ssh access and the ability to install
+                  additional packages using ipkg.
+                </para>
+              </listitem>
+            </varlistentry>
+
+            <varlistentry>
               <term><literal>console-image</literal></term>
               <listitem>
                 <para>Build an image without the X11, gtk+, or qt windowing
@@ -463,9 +473,10 @@ MACHINE = "om-gta01"</screen>
             </varlistentry>
 
             <varlistentry>
-              <term><literal>task-native-sdk</literal></term>
+              <term><literal>task-sdk-native</literal></term>
               <listitem>
-                <para>Mata-package for native (on-device) SDK.
+                <para>Meta-package for native (on-device) SDK.  i.e. libc, gcc,
+                  make, etc.
                 </para>
               </listitem>
             </varlistentry>
@@ -536,6 +547,13 @@ MACHINE = "om-gta01"</screen>
                 <para>Builds the appropriate kernel for your device.</para>
               </listitem>
             </varlistentry>
+
+            <varlistentry>
+              <term><literal>virtual/bootloader</literal></term>
+              <listitem>
+                <para>Builds the appropriate bootloader for your device.</para>
+              </listitem>
+            </varlistentry>
           </variablelist>
         </para>
       </section>
-- 
1.6.0.4




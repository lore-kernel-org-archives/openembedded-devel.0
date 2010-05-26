Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1OHA0W-0006yb-K2
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 08:22:27 +0200
Received: by ewy21 with SMTP id 21so599657ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 23:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=qmHSu0S55RSdgL7XHk0T3+EqHkJUZd5/l1qU4osWJ8w=;
	b=rpyV7Cc/+iiVL/ygnigyMBlPEmGj16c4rT/ldt3Km8TwTGheHebuRhAy3LS/JqcFLU
	d2xQz6BZd4/QkoTdEvqTHfzOU/Y8rEljuboeC50aFaeHDKHZeTNOBe0se4YqUBfUhiNc
	IHjudvFUUPUp8pDAR8DkvtKDkilI69dpZyPRQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DNOENeRA2JBwYKid1xcF46/JySfYF+x73tnMJZfN2H7GbJwQag91SI2sqGyWdPAxyS
	R0AaRoRv83Hh4cCd5Q1J5LpQUfC53I5/qr6JiuGeEBsTk4DIYKkI3bbxdUf+f7TMQyVE
	elpck/U+20lox9MwCMM85X+L6ROAU6TztpvDs=
Received: by 10.213.8.206 with SMTP id i14mr1047383ebi.72.1274854697149;
	Tue, 25 May 2010 23:18:17 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 13sm2810853ewy.1.2010.05.25.23.18.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 23:18:16 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 08:17:53 +0200
Message-Id: <1274854676-5931-4-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1274854676-5931-1-git-send-email-koen@openembedded.org>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
X-SA-Exim-Connect-IP: 209.85.219.221
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k-kooi@ti.com>, Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 4/7] Usermanual/getting_oe: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 06:22:28 -0000

From: Chase Maupin <chase.maupin@ti.com>

* Fixed up typos and other errors in the documentation.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Koen Kooi <k-kooi@ti.com>
---
 docs/usermanual/chapters/getting_oe.xml |   26 ++++++++++++++++++++++----
 1 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
index d18c955..cb82220 100644
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
+                <para>Build and image that is the smallest possible image
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
1.7.0




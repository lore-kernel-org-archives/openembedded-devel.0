Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PNL4W-0005jn-EP
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 08:56:21 +0100
Received: by fxm17 with SMTP id 17so3267992fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 23:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=ru7uPIU5Mc4XUf+EINAMwTUiXwDUO6PyR694qf5RB1I=;
	b=qNtGj+Z1ZCNbUdWqOyjzy6v89rrmkz4gDjEUeYp6anM0aa0Bh+MkFAekl3aieau7K5
	Vx/ojzDhu+eOeNN3WE4m0g97OkJat4VMLmI1FGd5nnpJ+e65M7EtlM0johdqYRop+jn8
	HzFInC2RkIvAIhTfAEnanhxE7UJ2ucOks5D44=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rVdOb4NkgfaEQT0Q8UvgYK0cqtQWdyl2+8iMx2DQox4kv9ai2i6QcrsorGHJhqsi/C
	Lpg//fXwhF6TSJ2uzc/7H2XqIDfersro3WBofyO9uZa6vOazrk1Cx5HR8j3XMtvg6753
	iBDByuq/kVnSfNaGGh/XMHQSkX9eh2kOaU6S8=
Received: by 10.223.86.206 with SMTP id t14mr6407510fal.30.1291103699671;
	Mon, 29 Nov 2010 23:54:59 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f24sm927846fak.24.2010.11.29.23.54.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Nov 2010 23:54:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Nov 2010 08:55:05 +0100
Message-Id: <1291103706-18824-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] usermanual: update info with SRCPV, in recipe SRCREV and remove sane-srcdates
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
X-List-Received-Date: Tue, 30 Nov 2010 07:56:21 -0000

---
 docs/usermanual/chapters/common_use_cases.xml |   20 ++++----------------
 1 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs/usermanual/chapters/common_use_cases.xml
index 2114047..61b4963 100644
--- a/docs/usermanual/chapters/common_use_cases.xml
+++ b/docs/usermanual/chapters/common_use_cases.xml
@@ -55,17 +55,6 @@ PREFERRED_VERSION_linux-omap1_omap5912osk ?= "2.6.18+git"
 PREFERRED_VERSION_linux-openzaurus ?= "2.6.17"
             </screen></para>
         </listitem>
-
-        <listitem>
-          <para>To get more stable build it is good to make use of
-          sane-srcdates.inc file which contain working SRCDATE for many of
-          floating recipes. <screen>
-require conf/distro/include/sane-srcdates.inc
-            </screen> It also should have global <command>SRCDATE</command>
-          value set (format is ISO date: YYYYMMDD): <screen>
-SRCDATE = "20061014"
-            </screen></para>
-        </listitem>
       </itemizedlist></para>
   </section>
 
@@ -152,12 +141,11 @@ SRCDATE = "20061014"
         prevent random breakage in OE at the most inopportune time for all OE users.  Here is
         how to do that properly.
           <itemizedlist>
-            <listitem><para>for svn: add 'PV = "1.1+svnr${SRCREV}"' to your bb file.</para></listitem>
-            <listitem><para>for cvs: add 'PV = "1.1+cvs${SRCREV}"' to your bb file.</para></listitem>
+            <listitem><para>for svn: add 'PV = "1.1+svnr${SRCPV}"' to your bb file.</para></listitem>
+            <listitem><para>for git: add 'PV = "1.1+gitr${SRCPV}"' to your bb file.</para></listitem>
+            <listitem><para>for cvs: add 'PV = "1.1+cvs${SRCPV}"' to your bb file.</para></listitem>
           </itemizedlist>
-        Accompany either with an entry to conf/distro/include/sane-srcrevs.inc for a revision that you know
-        builds successfully.  It is also common to define the stable SRCREV
-        for your package directly in the package recipe.
+        Accompany with stable SRCREV for your package directly in the package recipe.
         </para>
         <para>
         If you really absolutely have to follow the latest commits, you can do that by adding
-- 
1.7.3.2




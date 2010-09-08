Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OtPAR-0007JG-QT
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 20:14:44 +0200
Received: by gwb1 with SMTP id 1so201318gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 11:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=NA1zVWRXMugJHm+4dL0C3IFFwFf0R0U7SqYHjjKGoEI=;
	b=e+ZX4uHaY2TR8yIoyL8Osf10oLDH6cUz6THF/uqKw3BIjcoZccRz40aSj2vQHGLUX3
	GIZtnWBQCUlHpXSGGShZaXRfNkMfntKiZw9am6LYZDRs0gl+GOUsXXWvAAJyHABbM1qY
	kiAs6ERcvrb7Mz5wLS5S1Fk6EThIK1RosX2Wg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=OLZMlxkKTwnno7JAFDtKIlnkWkFsxxxvYzaZOiOzjOd9CQLudZfR0YT8heY96PpJO0
	6/OHov/tDfaT3Ei6CF0u69ot1GmKqF/aXM6cqti7j8/CAUb+2FjJtId32sEnXjOHOLI1
	f+hjiOKGetVCXv42kJXZ727QOt7x/tTZS/IJk=
Received: by 10.151.102.8 with SMTP id e8mr163225ybm.83.1283969635626;
	Wed, 08 Sep 2010 11:13:55 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id m12sm331851ybn.19.2010.09.08.11.13.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 08 Sep 2010 11:13:54 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Sep 2010 13:03:55 -0500
Message-Id: <1283969035-1397-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHv2] common_use_cases: add description of SOC_FAMILY
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
X-List-Received-Date: Wed, 08 Sep 2010 18:14:44 -0000

* Added a description of the SOC_FAMILY variable that
  can be set in the machine configuration files.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 docs/usermanual/chapters/common_use_cases.xml |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs/usermanual/chapters/common_use_cases.xml
index d86d0ca..ef81b95 100644
--- a/docs/usermanual/chapters/common_use_cases.xml
+++ b/docs/usermanual/chapters/common_use_cases.xml
@@ -94,6 +94,30 @@ SRCDATE = "20061014"
         </listitem>
       </itemizedlist></para>
 
+    <para>There are also some optional variables that can be defined:
+    <itemizedlist>
+    <listitem>
+          <para><command>SOC_FAMILY</command> describes a family of processors
+            that all share common features such as kernel versions,
+            bootloaders, etc.  This is used to allow overrides for a whole
+            set of devices rather than per machine overrides being used.
+            The use of SOC_FAMILY as an override is currently a distribution
+            or local setting.
+          </para>
+          <para>
+            NOTE: SOC_FAMILY is different than MACHINE_CLASS in that 
+            MACHINE_CLASS is intended to specify a grouping of devices
+            that may have different processors but share common features.
+            For example all OMAP3 devices can be described using the SOC_FAMILY
+            "omap3" and this value can be used in overrides to prevent
+            requiring multiple machine specific overrides.  MACHINE_CLASS
+            might be used to describe a class of devices such as a cell
+            phone in which the processor may be different but the
+            features such as touchscreen, GPS, modem, etc are the same.
+          </para>
+        </listitem>
+    </itemizedlist></para>
+
     <para>Next the kernel recipe needs to be added if it doesn't already exist.
     </para>
   </section>
-- 
1.7.0.4




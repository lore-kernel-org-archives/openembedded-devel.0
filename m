Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OtMdP-0000VE-TI
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 17:32:29 +0200
Received: by gwb1 with SMTP id 1so90732gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=AZl9a39oOZKOeE92foMfLSm/3VmjXNfLiMCkpawFwL8=;
	b=f05b+rOKoInjg9aW0VgU5QwRdH+UFCDi9GAedd5nNPPH9jlffw6B0AXsF+9O50QSNO
	alKPxryGUgrjyOfqcsT8EgBTGiuf//UdO3t7HW81/T1Cv+4nePySs172toHrdcGhDeEd
	jjnNwc6FDQ2rU8H8QO4lpFNICkJ6EzUyZVYAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=vPyJ1DBAjTCeO5yCusK9B07QBpT3LiisCF4JFN68mQ3WToH12wSSskc6xOUFJlhDQO
	ehgpcvQKasY7W2AP8m2pqg4kZggFX5iP1SWGE5Q4182NxFpOig+CaQB8yqk9CvEbkJgf
	ecRdyjC2HBTEEdOCNaWjmHJTQpMqRLN3Y/ExY=
Received: by 10.100.41.9 with SMTP id o9mr86261ano.240.1283959905729;
	Wed, 08 Sep 2010 08:31:45 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i30sm157060anh.29.2010.09.08.08.31.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 08 Sep 2010 08:31:44 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Sep 2010 10:21:46 -0500
Message-Id: <1283959306-16633-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] common_use_cases: add description of SOC_FAMILY
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
X-List-Received-Date: Wed, 08 Sep 2010 15:32:29 -0000

* Added a description of the SOC_FAMILY variable that
  can be set in the machine configuration files.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 docs/usermanual/chapters/common_use_cases.xml |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs/usermanual/chapters/common_use_cases.xml
index d86d0ca..9d1dc6d 100644
--- a/docs/usermanual/chapters/common_use_cases.xml
+++ b/docs/usermanual/chapters/common_use_cases.xml
@@ -94,6 +94,19 @@ SRCDATE = "20061014"
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
+        </listitem>
+    </itemizedlist></para>
+
     <para>Next the kernel recipe needs to be added if it doesn't already exist.
     </para>
   </section>
-- 
1.7.0.4




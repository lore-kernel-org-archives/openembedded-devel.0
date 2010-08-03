Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OgKFT-0007ug-H0
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 18:21:54 +0200
Received: by fxm12 with SMTP id 12so2157441fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=MVVyorfve6UuzZxv92Nox1JxgX2ZEKuQX1aVzNx5Ba0=;
	b=GxUrAkAntdzmZ3S5UbWGcdcKjlgu63R1o0EKwIBoafYHIU0JRmdQgdAJ4eFdMJDUDT
	GmXRl8wyXh/FeBT2LsUPB/5+U9/wFa8kO7s2LO2f0PryXSGfAX05QhMWOEdYAANZM0MH
	237I+4yPNQxBfb1tKlfo+edtuk5juVbvq2pgE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Pao0pOpSxkEiQAp+1nxue3/G/lSwo6iceTwYdtGEcOR9GNMZ95km6zx+aiABfo6qc+
	3oSFHARTSnoDpXnedJjqF+GXK6Ab5Hh7l93v+B4q8zmMu6MRnZ/kSlK20zgEP7hhkcmJ
	TyLGfIK4dNDzixaDmBXBPIiD1yaf7xxszPGFA=
Received: by 10.223.120.65 with SMTP id c1mr7574208far.68.1280852504524;
	Tue, 03 Aug 2010 09:21:44 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.72.151])
	by mx.google.com with ESMTPS id s20sm2570960faa.28.2010.08.03.09.21.41
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 09:21:43 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 11:23:21 -0500
Message-Id: <1280852605-3524-7-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
References: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 07/11][v2] initscripts: functions machine id xilinx virtex5 platforms
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
X-List-Received-Date: Tue, 03 Aug 2010 16:21:54 -0000

* Add machine_id support for xilinx virtex platforms
  used in xserver-common for args settings.
* On Xilinx platforms there is no line `Hardware`. Instead it is
  stored in the line starting with `platform`.
* Bump PR
* v2 nicer machine_id function for handling xilinx virtex platforms

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/initscripts/files/functions    |    6 +++++-
 recipes/initscripts/initscripts_1.0.bb |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes/initscripts/files/functions b/recipes/initscripts/files/functions
index fb9a914..51c1f13 100644
--- a/recipes/initscripts/files/functions
+++ b/recipes/initscripts/files/functions
@@ -5,7 +5,11 @@
 #
 
 machine_id() {		# return the machine ID
-    awk 'BEGIN { FS=": " } /Hardware/ { gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
+    id=`awk 'BEGIN { FS=": " } /Hardware/ { gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo`
+    if [ -n "$id" ]; then
+        id=`awk 'BEGIN { FS=": " } /platform/ { gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo`
+    fi
+    echo -n "$id"
 }
 
 killproc() {		# kill the named process(es)
diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts/initscripts_1.0.bb
index 1b0a94c..38fe85e 100644
--- a/recipes/initscripts/initscripts_1.0.bb
+++ b/recipes/initscripts/initscripts_1.0.bb
@@ -4,7 +4,7 @@ PRIORITY = "required"
 DEPENDS = "makedevs"
 RDEPENDS_${PN} = "makedevs"
 LICENSE = "GPL"
-PR = "r121"
+PR = "r122"
 
 SRC_URI = "file://functions \
            file://halt \
-- 
1.7.2




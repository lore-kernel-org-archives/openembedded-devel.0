Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1Oeri4-0000lV-Hb
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:41:23 +0200
Received: by mail-wy0-f175.google.com with SMTP id 38so1347518wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=dLzVZTx5i+yxuBtj6V52cdS7XQIhcdBXlR68DGKIm7M=;
	b=CeXTRIQzv43DKOuZ0Q0JlZDPQR5lDLGyzwhfN0cIO/l3yF3EWN77HBkWFHtMWQsjHc
	zFdLKj8s8EY713KEabgnrmr21xD854mkcDwOJFJdncYtOLyhFgE31HAKUYzsXJ+ddFdc
	Fm+dzeBa06h3MG+HLvSDg8Xlk+ZwjpPIhmxKA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=he81OSocW8v1/ZMnnXG+yAYYWVKZFQ0zWWHm1T5zWhFM2CTMHnvqRurlVSMTnH2ift
	E8X3a174xIFzoFKtJ2EnQoAQ60ZKh/ikmyF9wp+3qV4oLp4Bvu1H/5+CbHabIMzdT97s
	KWarkwnSYJNYjCGn6yGUnLqzgrT0JbhbB6Fk8=
Received: by 10.227.208.7 with SMTP id ga7mr1896087wbb.126.1280504454880;
	Fri, 30 Jul 2010 08:40:54 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.218.190])
	by mx.google.com with ESMTPS id h3sm2015014wbb.15.2010.07.30.08.40.52
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jul 2010 08:40:54 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 10:42:32 -0500
Message-Id: <1280504555-3633-7-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 07/10] initscripts: module id xilinx virtex
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
X-List-Received-Date: Fri, 30 Jul 2010 15:41:23 -0000

* Add machine_id support for xilinx virtex platforms
  used in xserver-common for args settings
* Bump PR

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/initscripts/files/functions    |    7 ++++++-
 recipes/initscripts/initscripts_1.0.bb |    2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes/initscripts/files/functions b/recipes/initscripts/files/functions
index fb9a914..3e7d687 100644
--- a/recipes/initscripts/files/functions
+++ b/recipes/initscripts/files/functions
@@ -5,7 +5,12 @@
 #
 
 machine_id() {		# return the machine ID
-    awk 'BEGIN { FS=": " } /Hardware/ { gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
+    id=`awk 'BEGIN { FS=": " } /Hardware/ { gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo`
+    if [ -n "$id" ]; then
+        echo -n "${id}"
+    else
+        awk 'BEGIN { FS=": " } /platform/ { gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
+    fi
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




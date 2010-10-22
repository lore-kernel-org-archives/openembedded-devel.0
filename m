Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9PLU-00085D-6e
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 23:40:17 +0200
Received: by pxi2 with SMTP id 2so351765pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=6zW/rMWCFEX2xEiWdIRJzgau2tKFE4bjJ+Zo7y1YTAs=;
	b=FJcnRxk95qtAue8+P9TGlSA4vud8RJju6z77IRBrh3kjRtZNWE5Odf90ZIZvE/MiT/
	n8W2XlfCjvWv01Fm7+xdsVFuacIdifNSrWYUuQ/M/0eoWXSxrMp+uTzK70prboOX6pVa
	2rBNoWQMTDqrI55I7kFOcjCbw/fVC17riU92A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=BGqNsmio+Q2w3sOHStuI9kWy8rjnDEt5tVAG6pEzvm78F2NnYDQ29KiP5VevfT8+tb
	/m6FUoggETw5YWlOir1Q4XWyXT3Y/Hejj4BfYBHh4aS0Ualaq3LfcQhSrH3HqnjdbeD2
	GjNiVgddMsmWF6Cz0XBWZgqD9X4dB4rKTshNg=
Received: by 10.142.166.13 with SMTP id o13mr2700421wfe.253.1287783572291;
	Fri, 22 Oct 2010 14:39:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w6sm219532wfd.9.2010.10.22.14.39.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 14:39:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 14:39:27 -0700
Message-Id: <1287783567-32647-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bitbake.conf: Add one recipe identifying OVERRIDE based on recipe type
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
X-List-Received-Date: Fri, 22 Oct 2010 21:40:17 -0000

It adds an override based on type of recipe
e.g. recipes ending with usual suffixes like -native -cross, -sdk
add the same to overrides with out leading '-'
It also add the same override for BBCLASSEXTEND
For normal recipes we add 'target' to overrides

This will give up better control over defining and combining
recipes into using BBCLASSEXTEND and still have finer control
if needed. We wont require to have virtclass-xxx overrides
anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/utils.bbclass |    3 +++
 conf/bitbake.conf     |    2 ++
 lib/oe/utils.py       |    8 ++++++++
 3 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/classes/utils.bbclass b/classes/utils.bbclass
index 10d49ce..7c96509 100644
--- a/classes/utils.bbclass
+++ b/classes/utils.bbclass
@@ -36,6 +36,9 @@ def base_both_contain(variable1, variable2, checkvalue, d):
 def base_prune_suffix(var, suffixes, d):
     return oe.utils.prune_suffix(var, suffixes, d)
 
+def base_get_suffix(var, suffixes, d):
+    return oe.utils.get_suffix(var, suffixes, d)
+
 def oe_filter(f, str, d):
     return oe.utils.str_filter(f, str, d)
 
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 539ab3d..2f3dd6b 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -195,6 +195,8 @@ MACHINE_KERNEL_PR = ""
 # otherwise it is the same as PN and P
 SPECIAL_PKGSUFFIX = "-native -cross -initial -intermediate -nativesdk -crosssdk -cross-canadian -sdk"
 BPN = "${@base_prune_suffix('${PN}', '${SPECIAL_PKGSUFFIX}'.split(), d)}"
+# Add a _target override so we can do target specific overrides when using BBCLASSEXTEND
+OVERRIDES_prepend = "${@base_get_suffix('${PN}', '${SPECIAL_PKGSUFFIX}'.split(), d)}:"
 BP = "${BPN}-${PV}"
 
 # Package info.
diff --git a/lib/oe/utils.py b/lib/oe/utils.py
index 2169ed2..4822864 100644
--- a/lib/oe/utils.py
+++ b/lib/oe/utils.py
@@ -67,6 +67,14 @@ def prune_suffix(var, suffixes, d):
             return var.replace(suffix, "")
     return var
 
+def get_suffix(var, suffixes, d):
+    # See if var ends with any of the suffixes listed and
+    # if found return it otherwise return "target'
+    for suffix in suffixes:
+        if var.endswith(suffix):
+	    return suffix[1:]
+    return "target"
+
 def str_filter(f, str, d):
     from re import match
     return " ".join(filter(lambda x: match(f, x, 0), str.split()))
-- 
1.7.1




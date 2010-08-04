Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgjAZ-00068u-A1
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 20:58:34 +0200
Received: by pvg13 with SMTP id 13so2205471pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 11:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=1KgXyVJ6pXjXNmrbyxaUzgUZehIf/fwWfOiUW0YgysA=;
	b=fN4sM5I3kX/suvmfBYQJFddbdd9Fu6jGQuTGXClnQ9IVcLHBTs2aoBn3YcaGfUTh6g
	OjAwIU4wn9lABc7HbL8GB4ugC3BjmMKMVt1B6EwfuNhqBwQTYiWBjySyXlAuQd5GgcqX
	APvn1w4qZBGxAHThvu64bJm04xaltA5zT3StU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=N0wWlb/YjDOUGg/VLt3Bb5c+/7PhO4eBDmgBlg+n9H4heFSNeVV3bgsxVMrw+EINIH
	Lv5JTpHmbVyNSW6+/OnUFXiYTTL+nmdF7VsQ1uwbb5M/+TRGrj18zSri//fK3W801buW
	RiR4HCAbkH6UHTZhG88cnzLnJjGlkoMITdufE=
Received: by 10.143.41.17 with SMTP id t17mr8168306wfj.315.1280948301094;
	Wed, 04 Aug 2010 11:58:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm10876016wfl.1.2010.08.04.11.58.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 11:58:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 11:58:05 -0700
Message-Id: <1280948285-3458-8-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
References: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 7/7] autotools_stage.bbclass: Delete
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
X-List-Received-Date: Wed, 04 Aug 2010 18:58:34 -0000

* This class should not be needed anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/autotools_stage.bbclass |    5 -----
 classes/recipe_sanity.bbclass   |    2 +-
 2 files changed, 1 insertions(+), 6 deletions(-)
 delete mode 100644 classes/autotools_stage.bbclass

diff --git a/classes/autotools_stage.bbclass b/classes/autotools_stage.bbclass
deleted file mode 100644
index ff0f4cd..0000000
--- a/classes/autotools_stage.bbclass
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit autotools
-
-do_stage () {
-	autotools_stage_all
-}
diff --git a/classes/recipe_sanity.bbclass b/classes/recipe_sanity.bbclass
index daae4ae..bb60ffa 100644
--- a/classes/recipe_sanity.bbclass
+++ b/classes/recipe_sanity.bbclass
@@ -51,7 +51,7 @@ def can_use_autotools_base(cfgdata, d):
     if not bb.data.inherits_class("autotools", d):
         return False
 
-    for i in ["autoreconf"] + ["%s_do_configure" % cls for cls in ["gnomebase", "gnome", "e", "autotools", "autotools_stage", "efl", "gpephone", "openmoko", "openmoko2", "xfce", "xlibs"]]:
+    for i in ["autoreconf"] + ["%s_do_configure" % cls for cls in ["gnomebase", "gnome", "e", "autotools", "efl", "gpephone", "openmoko", "openmoko2", "xfce", "xlibs"]]:
         if cfg.find(i) != -1:
             return False
 
-- 
1.7.1




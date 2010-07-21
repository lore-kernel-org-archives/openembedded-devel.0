Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ObdfP-0002n6-Jc
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 20:05:17 +0200
Received: by mail-pz0-f47.google.com with SMTP id 2so2472268pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 11:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=h6Iq3fSnDPZ6jbhYfYSToUM2aJ8/pWLo0EdVonEnPXA=;
	b=PCwVfN8Dkf0DNWpJ9MGl4ov1gphFfsiqG0zmD/8Xlyi+7Dou8R75Tqy1trnjPGHqdx
	10gl/Oub8Vgh0IzrYAwkko7sYiyTBV3zdRIYyk6GCNyLKuC+tvrOH0nCEwbikXPN/i9Y
	Y/O/Lu1x9oJKRUEZWqTX+mXdHK8bVtiJUnL/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=L5UorHFlEsbn+FfDv2z9cjreH7rD+urZjBACAPXLlKcQhedxA7vEBplJrob1QAbICb
	RX4M4JZ+jx589FM9I1lHce+SMjkGfjS16brvEnd8pWzeEBhRwS2NfDDCxv9gS6ySq/dg
	j2qu13iUrFLR9JG7CSE4JQd4mPn00aUesBzL4=
Received: by 10.142.156.14 with SMTP id d14mr641651wfe.86.1279735506436;
	Wed, 21 Jul 2010 11:05:06 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm9343482wfl.1.2010.07.21.11.05.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Jul 2010 11:05:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 11:04:46 -0700
Message-Id: <1279735486-7050-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/4] sanity.bbclass, abi_version.conf: Bump the ABI to inform that cross has died.
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
X-List-Received-Date: Wed, 21 Jul 2010 18:05:17 -0000

* tmpdir layout is changed bump ABI version to force a rebuild.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/sanity.bbclass |    2 ++
 conf/abi_version.conf  |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index 8eb7453..cff415a 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -149,6 +149,8 @@ def check_sanity(e):
 			os.system(bb.data.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done", e.data))
 			f = file(abifile, "w")
 			f.write(current_abi)
+		elif abi == "5" and current_abi != "5":
+			messages = messages + "Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n"
 		elif (abi != current_abi):
 			# Code to convert from one ABI to another could go here if possible.
 			messages = messages + "Error, TMPDIR has changed ABI (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi)
diff --git a/conf/abi_version.conf b/conf/abi_version.conf
index 92b6b58..a59abf6 100644
--- a/conf/abi_version.conf
+++ b/conf/abi_version.conf
@@ -4,7 +4,7 @@
 # that breaks the format and have been previously discussed on the mailing list 
 # with general agreement from the core team.
 #
-OELAYOUT_ABI = "4"
+OELAYOUT_ABI = "5"
 
 #
 # DISTRO_PR allows us to regenerate all packages when a fundamental change is
-- 
1.7.1




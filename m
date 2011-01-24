Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhSsO-0000KQ-Ri
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 21:19:01 +0100
Received: by qyk8 with SMTP id 8so3213722qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 12:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FI90MKNTOU9EZXDbpQmRIMdzIHWmnDdnhsWbmp7jeAQ=;
	b=LY9M/XJ2muTKJ6XgxkLOupd4aSauMC56SLqmc+OkzP8s8ZKdtqJlBxhwuB+Tr07UDJ
	OCpRJfiNelCvAAToLaY6bhc6oRkcNAf0tH0ZPiZBIi1VeKvndr8d4I41g8F5WsQ4pOCI
	p8rStnPn6spkpJxz+n+iJ5IwDN6P2wH8S8+xY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=r6kOzolz2JMhgFTgGDfSU0UiWnOXyHeQiiqrvN5RZtw5361xEz75hU5uOMRqKAXsx4
	ss5budI4B6MXhkMXbrlFS4awOor8fDyFrKfKu03nQf9hkbUF3Rplk4dV0zk8X/+/5eJ5
	pYXK0jULrEtqj6OFlATaGmh9BLlx1R6xk/U98=
Received: by 10.224.89.79 with SMTP id d15mr4486010qam.213.1295900294658;
	Mon, 24 Jan 2011 12:18:14 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t7sm9616474qcs.28.2011.01.24.12.18.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 12:18:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 12:18:09 -0800
Message-Id: <1295900293-25470-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1295900293-25470-1-git-send-email-raj.khem@gmail.com>
References: <1295900293-25470-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 1/5] classes/package_ipk.bbclass, classes/sourceipk.bbclass: Use opkg-utils-native instead of ipkg-utils-native
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
X-List-Received-Date: Mon, 24 Jan 2011 20:19:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/package_ipk.bbclass |    4 ++--
 classes/sourceipk.bbclass   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 97e5cd8..fea678d 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -70,7 +70,7 @@ do_package_update_index_ipk[lockfiles] = "${DEPLOY_DIR_IPK}.lock"
 do_package_update_index_ipk[nostamp] = "1"
 do_package_update_index_ipk[recrdeptask] += "do_package_write_ipk"
 do_package_update_index_ipk[recrdeptask] += "do_package_write_ipk"
-do_package_update_index_ipk[depends] += "ipkg-utils-native:do_populate_sysroot"
+do_package_update_index_ipk[depends] += "opkg-utils-native:do_populate_sysroot"
 
 #
 # Update the Packages index files in ${DEPLOY_DIR_IPK}
@@ -315,7 +315,7 @@ python do_package_ipk () {
 python () {
     if bb.data.getVar('PACKAGES', d, True) != '':
         deps = (bb.data.getVarFlag('do_package_write_ipk', 'depends', d) or "").split()
-        deps.append('ipkg-utils-native:do_populate_sysroot')
+        deps.append('opkg-utils-native:do_populate_sysroot')
         deps.append('fakeroot-native:do_populate_sysroot')
         bb.data.setVarFlag('do_package_write_ipk', 'depends', " ".join(deps), d)
 }
diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
index 17a7cdd..b443ef6 100644
--- a/classes/sourceipk.bbclass
+++ b/classes/sourceipk.bbclass
@@ -34,9 +34,9 @@
 # Need to figure out how to use ipkg-build in this class.
 # I tried adding it as a dependency for the do_create_srcipk
 # task using:
-#   do_create_srcipk[depends] += "ipkg-utils-native:do_populate_sysroot"
+#   do_create_srcipk[depends] += "opkg-utils-native:do_populate_sysroot"
 # But then there is a circular dependency between sourcipk.bbclass and
-# ipkg-utils-native.  Until I can figure out how to resolve this
+# opkg-utils-native.  Until I can figure out how to resolve this
 # circular dependency I am extracting the needed pieces from ipkg-build
 # into this class and building the source ipk myself.
 
-- 
1.7.0.4




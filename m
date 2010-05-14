Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCq40-0003ry-H4
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 10:16:11 +0200
Received: by fxm11 with SMTP id 11so2060149fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=koiYV9oNKiv7y4SH160MVqn7VE06fSeYC6CcuGaHfVU=;
	b=TbiIUap0wniaHc3Cj3DA8i7lKxP+8rF3TO+qa4/HXnsL3B5Ekbip6oGm59wFHWjXoe
	+hFU0O9YzJE0r3MXmWH3agxwk1rokRxoTsKTcZa45/D1sLEG7CSrUOMPeDlxYNNqe41A
	fxy9WTZSiDkSFynPniSuJFNpiYUMSshWsEJUM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=D32Um8kY6Pi76KK39+kv5MJxg3qOLEegG4O6Pp26GhMunCll6wLe9r3zsEFL7wA4EV
	CDR6XovQt7x4NssSTlUMQlozQe6A/9iPaDLqJXnjdWjOq6V2PiViyqZiWuGqWQLETKzy
	udQC2SuP1CI12r4uZQt5L+T1i9K9YNPCwxi50=
Received: by 10.223.56.27 with SMTP id w27mr1165136fag.37.1273824732172;
	Fri, 14 May 2010 01:12:12 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r25sm9785874fai.23.2010.05.14.01.12.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 14 May 2010 01:12:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 May 2010 10:12:14 +0200
Message-Id: <1273824734-18014-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eglibc: append SRCPV to PR to automatically pick SRCREV changes without bumping PR manually
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
X-List-Received-Date: Fri, 14 May 2010 08:16:11 -0000

---
 recipes/eglibc/eglibc_2.10.bb |    5 +++--
 recipes/eglibc/eglibc_2.11.bb |    5 +++--
 recipes/eglibc/eglibc_2.9.bb  |    5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
index 150d775..fb2877d 100644
--- a/recipes/eglibc/eglibc_2.10.bb
+++ b/recipes/eglibc/eglibc_2.10.bb
@@ -4,9 +4,10 @@ DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.10"
 PR = "${INC_PR}.9"
-SVN_REV="10152"
+PR_append = "+svnr${SRCPV}"
+SRCREV="10152"
 EGLIBC_BRANCH="eglibc-2_10"
-SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};rev=${SVN_REV};proto=svn \
+SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \
            file://armv4t-interworking.patch;patch=1 \
            file://IO-acquire-lock-fix.patch;patch=1 \
diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
index 988a9bc..5bcce87 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
@@ -5,9 +5,10 @@ DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.11"
 PR = "${INC_PR}.4"
-SVN_REV="10454"
+PR_append = "+svnr${SRCPV}"
+SRCREV="10454"
 EGLIBC_BRANCH="eglibc-2_11"
-SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};rev=${SVN_REV};proto=svn \
+SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \
            file://IO-acquire-lock-fix.patch;patch=1 \
            file://shorten-build-commands.patch;patch=1 \
diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
index 914bc77..8212c51 100644
--- a/recipes/eglibc/eglibc_2.9.bb
+++ b/recipes/eglibc/eglibc_2.9.bb
@@ -4,9 +4,10 @@ DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.9"
 PR = "${INC_PR}.9"
-SVN_REV="10153"
+PR_append = "+svnr${SRCPV}"
+SRCREV="10153"
 EGLIBC_BRANCH="eglibc-2_9"
-SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};rev=${SVN_REV};proto=svn \
+SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \
 	   file://armv4t-interworking.patch;patch=1 \
 	   file://IO-acquire-lock-fix.patch;patch=1 \
-- 
1.7.1




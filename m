Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NwTWE-0006Ug-8R
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 06:57:38 +0200
Received: by gwj19 with SMTP id 19so512540gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 21:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=VlM3U9SQvRDqu0uyy+/LhZKki0rU35Z7fP59u3Yu1so=;
	b=vdz9gY8scS7FE2uLEpW50XUV7afC0zP2UHuX3mofxewBSma/xqQbnF9LMR+QJmUxOz
	vLU2yXpJsnCOM1LKnnIsXNc4nCqIYrSs7nTlDAln+N9wZ8ybMJdjT63OV20gOr08E9ZI
	gLK/PukXKzbIZDEmoc80M9OHRyumywJ7DdEsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LrIKeHNrpJC73BXj5T6Nyy4oO8jdEG9IPQaTtfcvuKTAz37vcs4K2SMKXoNr1nwU2G
	++2rOEGdhTIGEM3BC/1/H3T0fT9x9x1OSYf/bVBgwuT5s4HG6u/vUjDdPrK2l0DZv4g6
	bWXM6vyXeN4NVwekI4MbZ3SmLQVDo6ZWzOEgg=
Received: by 10.101.214.4 with SMTP id r4mr6409714anq.141.1269924863079;
	Mon, 29 Mar 2010 21:54:23 -0700 (PDT)
Received: from localhost.localdomain ([201.153.211.3])
	by mx.google.com with ESMTPS id j42sm5029405ibr.19.2010.03.29.21.54.20
	(version=SSLv3 cipher=RC4-MD5); Mon, 29 Mar 2010 21:54:22 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 22:53:30 -0600
Message-Id: <1269924810-3069-2-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1269924810-3069-1-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1269924810-3069-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] openm4-autoconf-fix.patch: new file
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
X-List-Received-Date: Tue, 30 Mar 2010 04:57:38 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 .../imagemagick/files/openm4-autoconf-fix.patch    |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 recipes/imagemagick/files/openm4-autoconf-fix.patch

diff --git a/recipes/imagemagick/files/openm4-autoconf-fix.patch b/recipes/imagemagick/files/openm4-autoconf-fix.patch
new file mode 100644
index 0000000..8ad882b
--- /dev/null
+++ b/recipes/imagemagick/files/openm4-autoconf-fix.patch
@@ -0,0 +1,27 @@
+diff --git a/m4/openmp.m4 b/m4/openmp.m4
+index e7b0e7b..dbfbece 100644
+--- a/m4/openmp.m4
++++ b/m4/openmp.m4
+@@ -1,10 +1,12 @@
+-# openmp.m4 serial 4
+-dnl Copyright (C) 2006-2007 Free Software Foundation, Inc.
++# openmp.m4 serial 5
++dnl Copyright (C) 2006-2008 Free Software Foundation, Inc.
+ dnl This file is free software; the Free Software Foundation
+ dnl gives unlimited permission to copy and/or distribute it,
+ dnl with or without modifications, as long as this notice is preserved.
+
+ dnl This file can be removed once we assume autoconf >= 2.62.
++dnl Expand to nothing in autoconf >= 2.62. m4_copy has a different
++m4_ifdef([AC_OPENMP], [], [
+
+ # _AC_LANG_OPENMP
+ # ---------------
+@@ -92,3 +94,5 @@ AC_DEFUN([AC_OPENMP],
+   fi
+   AC_SUBST([OPENMP_]_AC_LANG_PREFIX[FLAGS])
+ ])
++
++])
+--
+1.6.6.1
--
1.6.6.1



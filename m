Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrtI-0004Zk-Pa
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:04:48 +0100
Received: by mail-ee0-f47.google.com with SMTP id v2so902377eea.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HI+q8AP12jLdvt4sQSYdghe2E6LXta5uffl69avlFnI=;
	b=b83NdZVLXYHRKdTRG0tP52OYbVYQ7+nSHJPtSWzGtXABdZfCKMdUCuINnOcjg8nD2k
	O9bul5WdNXfrCKkd4qP6IfbpHvFe4Ga8hd2ttupFV6UPVbyqTE6dQUKkH/sJxqSFUxE6
	GsXFrxmyIrx0nXbaq/qAofCNSgdvRsrGYv4uE=
Received: by 10.14.10.222 with SMTP id 70mr2173072eev.131.1323165483755;
	Tue, 06 Dec 2011 01:58:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d6sm69296897eec.10.2011.12.06.01.58.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:58:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:05 +0100
Message-Id: <f84d6767048d00a7fdb4d3c02b8423aa241dffe9.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 06/16] efl-from-svn: update preferred versions
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
X-List-Received-Date: Tue, 06 Dec 2011 10:04:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/conf/distro/include/efl-from-svn.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-efl/conf/distro/include/efl-from-svn.inc b/meta-efl/conf/distro/include/efl-from-svn.inc
index 1bda8df..03f203c 100644
--- a/meta-efl/conf/distro/include/efl-from-svn.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn.inc
@@ -1,4 +1,4 @@
-EFL_PREFERRED_VERSION ?= "1.0.999%"
+EFL_PREFERRED_VERSION ?= "1.1.%"
 PREFERRED_VERSION_ecore ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_ecore-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_edbus ?= "${EFL_PREFERRED_VERSION}"
@@ -15,3 +15,7 @@ PREFERRED_VERSION_embryo ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_embryo-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_evas ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_evas-native ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_expedite ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_expedite-native ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_eet ?= "1.5.%"
+PREFERRED_VERSION_eet-native ?= "1.5%"
-- 
1.7.8




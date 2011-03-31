Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5Eyk-0000WF-UH
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 12:19:51 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1699187bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=LgAYRj9c77GoETMQG7ZRy4z4D8Q1MhMS+1aiQ9k2Unw=;
	b=AciiLy9zzs1rGN01+N5z4cEI7bSmZtV+R7ma8h22Or05ar9fc89ipw8c5xGcBFZz79
	/Zt/PTSwT6AS3irK4mrFcRwN/FHVhDncLPStxOPysX4qdYn6BDVV1FZWwO0x3Eab4xPT
	j2M7CGRnnZ0QUeEjphoNcOJDcEAaCR+ezsf2w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eMtnebA5Ke6PhRrBDjeGREPUP2xzWterIo9imTxlqJqgehe31G3VoPYnoaKitCOMg7
	QzitQMMvAT3+4CH3ICGxRYpqLiOKcxeixoOLu5UEus3hlBg4wsTprdM8WDSby/Fhm1oO
	SzmqIFzPcfPhK+Tcz8G5lL9Oh7lucv84ijbJ0=
Received: by 10.204.22.197 with SMTP id o5mr2220005bkb.68.1301566673097;
	Thu, 31 Mar 2011 03:17:53 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t1sm630985bkx.19.2011.03.31.03.17.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:17:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 12:17:46 +0200
Message-Id: <f2f3e53abbcdbc44ab467be03614895d95502c70.1301560589.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301560589.git.Martin.Jansa@gmail.com>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/8] ethumb: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Mar 2011 10:19:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ethumb_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index 428b652..2908ee1 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "EFL based thumbnail generation library"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
 DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
 PV = "0.1.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
-- 
1.7.4.1




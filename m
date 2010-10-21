Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHZ-0007Ju-P9
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:16 +0200
Received: by yxt3 with SMTP id 3so2495804yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Es7KUbqX/FwcjlomiA2Jom8PvNfpnKGIDp47Hy5QvTQ=;
	b=OTSE04nYwXUJ/17Dnf2XT50ZbsZQ2RcTMJF3EAcEJJ/Xc6a+64bcGnNgmrSbdAAsKn
	mBXGw/Y4QMR3eLtzRWaHIe0SmFoAnssc0D6vnsRxLQzm9HR/qS5f90MRFbEntD7tTTU/
	IHAWq5f9zizJj16JSNTx5ml1PZj92g+DZs/f8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fqXtj/iJ06zdlvu44jc4OxFIVMqlLxP5NrxFtt0siAQijSnfxzMGEN7kldGwILu6mU
	vMZiYiFMuot/mYXCsRh4o8/IMDEdrQwSL9RsOES1qJd+noiSNzm5/eWbWnFn+6yr0kya
	Wat7ken/CNBSNcwgicMS3DseJUdM2OV1O3oGs=
Received: by 10.150.143.21 with SMTP id q21mr3726795ybd.142.1287668016046;
	Thu, 21 Oct 2010 06:33:36 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:35 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:09 -0500
Message-Id: <1287668010-11310-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 01/22] autoconf: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:34:16 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/autoconf/autoconf.inc        |    2 +-
 recipes/autoconf/autoconf213_2.13.bb |    1 +
 recipes/autoconf/autoconf_2.61.bb    |    2 ++
 3 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.inc
index 35b0289..fe12daf 100644
--- a/recipes/autoconf/autoconf.inc
+++ b/recipes/autoconf/autoconf.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A package of M4 macros to produce scripts to \
 automatically configure sourcecode."
-LICENSE = "GPL"
+LICENSE = "GPLv3+-with-Autoconf-Configure-Script-Exception-v3.0"
 HOMEPAGE = "http://www.gnu.org/software/autoconf/"
 SECTION = "devel"
 DEPENDS += "m4-native"
diff --git a/recipes/autoconf/autoconf213_2.13.bb b/recipes/autoconf/autoconf213_2.13.bb
index d060bbd..cd55073 100644
--- a/recipes/autoconf/autoconf213_2.13.bb
+++ b/recipes/autoconf/autoconf213_2.13.bb
@@ -1,4 +1,5 @@
 require autoconf.inc
+LICENSE = "GPLv2+"
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz"
 EXTRA_OECONF = "--program-transform-name=s/\$/2.13/"
 EXTRA_OEMAKE = 'acdatadir="${datadir}/autoconf-${PV}" infodir="${datadir}/autoconf-${PV}/info"'
diff --git a/recipes/autoconf/autoconf_2.61.bb b/recipes/autoconf/autoconf_2.61.bb
index 9542e21..4588608 100644
--- a/recipes/autoconf/autoconf_2.61.bb
+++ b/recipes/autoconf/autoconf_2.61.bb
@@ -1,5 +1,7 @@
 require autoconf.inc
 
+LICENSE = "GPLv2+"
+
 PR = "${INC_PR}.1"
 
 SRC_URI += "file://autoreconf-include.patch \
-- 
1.7.0.4




Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Neax7-0004Io-9D
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:33 +0100
Received: by fxm27 with SMTP id 27so1137661fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=pv6D4YCxxvmlki9KvtfvV/efN4GR/qOc97nqkcNOS0Q=;
	b=lBju7N8TND0W8oiNC3IIeqhC6nZakn8DQBQDsXyLgBeDqE4QSK+gsiLVNkBlRZAtd0
	E3DnnEzOrkVhDIiNQp07gxGqsCfs53iYP0T256Kjg4F5wBAtKRisebEgU9/Qbp9DWC3y
	bv3819FIIdune2/CAEJ+sVYjDAHQURWDuvSQk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=yEXGCiMP5/WXMcLg88YfdIgoTKfp6Dqmvf85oTa6kCS/Z+7TMZqhXsJ+U3V4a8zQHG
	o1TPMPG459BhRpk/mukr2OKP1etk9Nwsm1rxzXlp5ndgK8OFJOoHA/nzV0boaerSMISi
	EOEFKmU8aM7eyzD4KvMcFbdnZ4p8ibk+FVA6E=
Received: by 10.223.3.196 with SMTP id 4mr3481478fao.63.1265663577060;
	Mon, 08 Feb 2010 13:12:57 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id z15sm100262fkz.6.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004GB-Dm; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:25 +0100
Message-Id: <1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 04/12] matchbox-panel-2: fix DEPENDS
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:33 -0000

libacpi has no recipe as opposed to acpid

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/matchbox2/matchbox-panel-2_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/matchbox2/matchbox-panel-2_svn.bb b/recipes/matchbox2/matchbox-panel-2_svn.bb
index ae3b122..1a61370 100644
--- a/recipes/matchbox2/matchbox-panel-2_svn.bb
+++ b/recipes/matchbox2/matchbox-panel-2_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "matchbox-panel-2 is a lightweight dock (system tray) application
 LICENSE = "GPLv2"
 SECTION = "x11/panels"
 DEPENDS = "gtk+ startup-notification dbus dbus-glib matchbox-panel-2-icon-themes"
-DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
+DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "acpid", "",d)}"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 RDEPENDS_${PN} = "matchbox-panel-2-icon-theme"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.6.5




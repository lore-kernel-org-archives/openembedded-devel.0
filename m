Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdg-0004lM-Jy
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:12 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so492439eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.182.134 as permitted sender)
	client-ip=10.14.182.134; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.182.134 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.182.134])
	by 10.14.182.134 with SMTP id o6mr723422eem.40.1329999053659 (num_hops
	= 1); Thu, 23 Feb 2012 04:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=FK2MXJqF79qE1GlCB5JASgNQHbLxWqjCKpWydRtBfac=;
	b=NaYA3FiIC7RGKM16d4om0oXTCIcNYXmccJahFxhKoJLILChcK0/2KVM1K1e+QPZQg7
	Gx+lOgG5btSxPh4buc2CpKXCojNf46qNOcgI8W4K4yZ+PNAP7OTUpD+dg/JaD/sgldQt
	LOzoOfCnEmQM5t+cCptb9o8bGc1HLu5wqvpGs=
Received: by 10.14.182.134 with SMTP id o6mr572270eem.40.1329999053565;
	Thu, 23 Feb 2012 04:10:53 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:10:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:36 +0100
Message-Id: <1329999054-23112-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 05/23] systemd.bbclass: automatically create packages set in SYSTEMD_PACKAGES
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/systemd.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 6517357..e779bef 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -63,8 +63,17 @@ def systemd_after_parse(d):
 				if systemd_services == "":
 					raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_SERVICE / %s" % (bb_filename, service_pkg)
 
+	# prepend systemd-packages not already included
+	def systemd_create_package(pkg_systemd):
+		packages = d.getVar('PACKAGES', 1)
+		if not pkg_systemd in packages:
+			packages = "%s %s" % (pkg_systemd, packages)
+			d.setVar('PACKAGES', packages)
+
 
 	systemd_check_vars()
+	for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
+		systemd_create_package(pkg_systemd)
 
 
 python __anonymous() {
-- 
1.7.6.4




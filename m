Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdi-0004lM-82
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:14 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so492439eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:10:55 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.184.194 as permitted sender)
	client-ip=10.14.184.194; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.184.194 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.184.194])
	by 10.14.184.194 with SMTP id s42mr706825eem.54.1329999055288 (num_hops
	= 1); Thu, 23 Feb 2012 04:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=SJkl/G9g72Z6yld3uQB6g/52/mb15sNaZqR21Zx0vs0=;
	b=TX5j4hRLg2r47YYwBaqSjbK7edn0nz0xASudfEmV4z1CkoBbz52Z64Bzncr0uoyjZu
	J7A9M0V0ztQMhpx3HOf9WxiMk5usj624EgoT5tWFYtCrCvWz0AV0UvRn8/rmau8eIQPv
	FSco9LWhuDDcIfnmg9nTdLWamusqbo1iV8DG8=
Received: by 10.14.184.194 with SMTP id s42mr561132eem.54.1329999055246;
	Thu, 23 Feb 2012 04:10:55 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:10:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:38 +0100
Message-Id: <1329999054-23112-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 07/23] systemd.bbclass: run code in populate_packages_prepend only if ${D} exists
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All further manipulations need to be performed only once. This modication
avoids unwanted behaviour when inheriting rm_work.bbclass [1]

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/038067.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index b2d4191..e13f09d 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -127,6 +127,8 @@ python populate_packages_prepend () {
 		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
 
 
-	for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-		systemd_generate_package_scripts(pkg_systemd)
+	# run all modifications once when creating package
+	if os.path.exists('${D}'):
+		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
+			systemd_generate_package_scripts(pkg_systemd)
 }
-- 
1.7.6.4




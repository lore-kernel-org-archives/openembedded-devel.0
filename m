Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0bC9-0004iV-RE
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 17:07:02 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so626258eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:58:42 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.45.75 as permitted sender) client-ip=10.14.45.75; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.45.75 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.45.75])
	by 10.14.45.75 with SMTP id o51mr1254497eeb.20.1330012722690 (num_hops
	= 1); Thu, 23 Feb 2012 07:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PMqbXHtjYhVh1sW17ZNCtNpAh4sFXHmjAX7j1Jz6yKw=;
	b=sYPeT/HbvJ1E+bEEvvHZyaj9e3OGFf+slbmUWI89gfxz3zxtUQU1YUZILV892l2rFH
	P1BCQ2iyYajWg5LmWJ+H60zPRtqI88TcbgBiBVYta6YCp04R5QyxByUUFZ9yvaDVc7gp
	WJeCYjZR1g4hwxnkPXIXPmEAZneEM/q5ADePk=
Received: by 10.14.45.75 with SMTP id o51mr993101eeb.20.1330012722600;
	Thu, 23 Feb 2012 07:58:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v51sm6768624eef.2.2012.02.23.07.58.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:58:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 16:58:04 +0100
Message-Id: <947569550575be045346293c5834dea3d03fcf62.1330012507.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <93f56c062e7a5103f15551808826f76c94779005.1330012507.git.Martin.Jansa@gmail.com>
References: <93f56c062e7a5103f15551808826f76c94779005.1330012507.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330012507.git.Martin.Jansa@gmail.com>
References: <cover.1330012507.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 7/7] ntp: use systemd_unitdir variable
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
X-List-Received-Date: Thu, 23 Feb 2012 16:07:04 -0000

* maybe we should move systemd_unitdir definition outside systemd.bbclass
  because it's used in few more recipes which doesn't inherit systemd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
index 063d82a..ece8720 100644
--- a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
+++ b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
@@ -1,6 +1,6 @@
 require ntp.inc
 
-PR = "r4"
+PR = "r5"
 
 inherit systemd
 
@@ -29,14 +29,14 @@ do_install_append() {
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
 
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${base_libdir}/systemd/system/
-	install -m 0644 ${WORKDIR}/ntpd.service ${D}${base_libdir}/systemd/system/
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
+	install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
 }
 
 PACKAGES =+ "${PN}-systemd"
 
-FILES_${PN}-systemd = "${base_libdir}/systemd/system/"
+FILES_${PN}-systemd = "${systemd_unitdir}/system/"
 RDEPENDS_${PN}-systemd = "${PN}"
 
 FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
-- 
1.7.8.4




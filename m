Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PpS4W-0004kT-RW
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 22:04:32 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so607413fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 13:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NnmDhRCobs/BZKY09HnRRufJQv6cJCy14iW15xgPrwY=;
	b=kuOkyglH238RyEWF8Bof8C8U5aZEz05Ut+DzOorhCWjXnPq1hmQP/0GwDnY8vGDaJk
	I369VVP117OhQjKFLX2yDpaCLHn4/sGaU70qTCegXBmVrY9NiRhyuSoFMsshRZgVwBg0
	+YKo21ni7eD7Bl+evVvZ9xFOeq1SRsEh+Etu4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dXxwa1Y0dc8M9VwMSctrqb3eb8twNdmpPcFUhT2gho+dgEbR4xSPBa9FpvjIKrDeH9
	6be7UJKd6pHwoFfdVijwpnW9/DyOgy+POdJIZrpMj3gsdvgQb4xu5Bq3ZPPUTja5Zla3
	/plkePYr7QCOilaaq3Irqtp87QyPhsMBw8Lc8=
Received: by 10.223.70.141 with SMTP id d13mr3531869faj.111.1297803804727;
	Tue, 15 Feb 2011 13:03:24 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l3sm1697905fan.0.2011.02.15.13.03.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Feb 2011 13:03:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Feb 2011 22:03:00 +0100
Message-Id: <1297803782-8395-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
References: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] libsoup-2.4: add 2.33.6 version needed for newer webkit-efl
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
X-List-Received-Date: Tue, 15 Feb 2011 21:04:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/gnome/libsoup-2.4_2.33.6.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gnome/libsoup-2.4_2.33.6.bb

diff --git a/recipes/gnome/libsoup-2.4_2.33.6.bb b/recipes/gnome/libsoup-2.4_2.33.6.bb
new file mode 100644
index 0000000..e2dcb36
--- /dev/null
+++ b/recipes/gnome/libsoup-2.4_2.33.6.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "An HTTP library implementation in C"
+SECTION = "x11/gnome/libs"
+LICENSE = "GPL"
+DEPENDS = "libproxy glib-2.0 gnutls libxml2 sqlite3 gnome-keyring"
+
+inherit gnome
+
+SRC_URI = "${GNOME_MIRROR}/libsoup/${@gnome_verdir("${PV}")}/libsoup-${PV}.tar.bz2;name=libsoup"
+SRC_URI[libsoup.md5sum] = "3a7219057d289dd7dcdd67681d27eebe"
+SRC_URI[libsoup.sha256sum] = "988f7897fe125a77a5946b2fd6d47d7374fd94a1406e810482cfff6a52a6a923"
+
+S = "${WORKDIR}/libsoup-${PV}"
+
+PACKAGES =+ "libsoup-gnome"
+FILES_libsoup-gnome = "${libdir}/libsoup-gnome*.so.*"
+FILES_${PN} = "${libdir}/libsoup-2*.so.*"
+FILES_${PN}-dev = "${includedir}/ ${libdir}/"
+FILES_${PN}-doc = "${datadir}/"
-- 
1.7.4.1




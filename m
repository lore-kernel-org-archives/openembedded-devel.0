Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PfJh3-000620-9G
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 23:06:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 795F8942734;
	Tue, 18 Jan 2011 17:05:47 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13575-01; Tue, 18 Jan 2011 17:05:47 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 4E462890312; Tue, 18 Jan 2011 17:05:47 -0500 (EST)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 73D7D895971;
	Tue, 18 Jan 2011 17:05:44 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 686F51C004B8; Tue, 18 Jan 2011 17:05:44 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jan 2011 17:05:43 -0500
Message-Id: <1295388343-2058-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3.2
In-Reply-To: <1295388343-2058-1-git-send-email-msmith@cbnco.com>
References: <1295388343-2058-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH 2/2] libsoup-2.4: update 2.29.91 to 2.32.2
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
X-List-Received-Date: Tue, 18 Jan 2011 22:06:25 -0000

The new release fixes several issues and is API/ABI compatible.
(at least, webkit-gtk still builds and runs.)

Signed-off-by: Michael Smith <msmith@cbnco.com>
Cc: Koen Kooi <koen@openembedded.org>
---
 ...isable-TLS-1.2-in-addition-to-1.0-and-1.1.patch |   29 --------------------
 ...ibsoup-2.4_2.29.91.bb => libsoup-2.4_2.32.2.bb} |    8 +----
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 recipes/gnome/libsoup-2.4/Disable-TLS-1.2-in-addition-to-1.0-and-1.1.patch
 rename recipes/gnome/{libsoup-2.4_2.29.91.bb => libsoup-2.4_2.32.2.bb} (68%)

diff --git a/recipes/gnome/libsoup-2.4/Disable-TLS-1.2-in-addition-to-1.0-and-1.1.patch b/recipes/gnome/libsoup-2.4/Disable-TLS-1.2-in-addition-to-1.0-and-1.1.patch
deleted file mode 100644
index 1a03581..0000000
--- a/recipes/gnome/libsoup-2.4/Disable-TLS-1.2-in-addition-to-1.0-and-1.1.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 01a43ad9824fba77384534c6d588e0e0d653986e Mon Sep 17 00:00:00 2001
-From: Dan Winship <danw@gnome.org>
-Date: Tue, 29 Jun 2010 13:43:20 +0000
-Subject: Disable TLS 1.2 in addition to 1.0 and 1.1
-
-Due to bug 581342 we want to only negotiate SSL 3.0. Previously we
-were telling gnutls to not do TLS1.0 or TLS1.1, but that means with
-newer versions of gnutls that support TLS1.2 it would try to negotiate
-that instead and generally fail. Fix that by disabling TLS1.2 too
-(which works fine even with gnutls versions that don't support TLS1.2
-yet).
-
-https://bugzilla.gnome.org/show_bug.cgi?id=622857
----
-diff --git a/libsoup/soup-gnutls.c b/libsoup/soup-gnutls.c
-index cb0fbe5..0b57f28 100644
---- a/libsoup/soup-gnutls.c
-+++ b/libsoup/soup-gnutls.c
-@@ -477,7 +477,7 @@ soup_ssl_wrap_iochannel (GIOChannel *sock, gboolean non_blocking,
- 		goto THROW_CREATE_ERROR;
- 
- 	/* See http://bugzilla.gnome.org/show_bug.cgi?id=581342 */
--	if (gnutls_priority_set_direct (session, "NORMAL:!VERS-TLS1.1:!VERS-TLS1.0", NULL) != 0)
-+	if (gnutls_priority_set_direct (session, "NORMAL:!VERS-TLS1.2:!VERS-TLS1.1:!VERS-TLS1.0", NULL) != 0)
- 		goto THROW_CREATE_ERROR;
- 
- 	if (gnutls_credentials_set (session, GNUTLS_CRD_CERTIFICATE,
---
-cgit v0.8.3.1
diff --git a/recipes/gnome/libsoup-2.4_2.29.91.bb b/recipes/gnome/libsoup-2.4_2.32.2.bb
similarity index 68%
rename from recipes/gnome/libsoup-2.4_2.29.91.bb
rename to recipes/gnome/libsoup-2.4_2.32.2.bb
index aec60fa..5bc793c 100644
--- a/recipes/gnome/libsoup-2.4_2.29.91.bb
+++ b/recipes/gnome/libsoup-2.4_2.32.2.bb
@@ -3,15 +3,11 @@ SECTION = "x11/gnome/libs"
 LICENSE = "GPL"
 DEPENDS = "libproxy glib-2.0 gnutls libxml2 sqlite3 gnome-keyring"
 
-PR = "r2"
-
 inherit gnome
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${@gnome_verdir("${PV}")}/libsoup-${PV}.tar.bz2;name=libsoup"
-SRC_URI[libsoup.md5sum] = "900390c0ead254fbb23f3f0b84fd18bb"
-SRC_URI[libsoup.sha256sum] = "626c88f6b87463cb092733d2bcd5672ca69529a766cc6c5cc817f34b49c821b1"
-
-SRC_URI += "file://Disable-TLS-1.2-in-addition-to-1.0-and-1.1.patch"
+SRC_URI[libsoup.md5sum] = "03f37350a2a31046ebabb8470e75abcc"
+SRC_URI[libsoup.sha256sum] = "96e6973c8b7459523c0f44e7aec69528ff2fbd388e8ddc415f91bcc42f50777f"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.6.3.2




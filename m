Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PEmWJ-0000sf-45
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 18:25:39 +0100
Received: by eya28 with SMTP id 28so2291895eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=6F0neWKhhqrRTtwHG4/QdaeWBzW9PVguu99dxbk05aQ=;
	b=DJOrlM0Jfqx05fN37cb7aHbl9w8pwAV9xv+xzhHXtk1CNnnZb7Gg/1WHJCqdVEgiR7
	yXNRPC1kiGmWEqONnv3fZP5Fy4h9IFBnw9IBOaBrUTea//ndrJsCsUBlbubm1T/ppYIF
	XToifrD9y8/LhLi1tMii/XTR8O1zwcjpZjiLk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=pO8mBqfIbZkgrzeQhQJvTV6bfQQq2fCep99ydmGjov5HlQD6bEwFJJdYASSNv8nGfq
	G+8LCyKB5aUZtzmWTojG7K3fj8Yq+5sYSa8DemMyraEGTMBfNlWmD81bVVa7qNfKE3G1
	L4hIOX2DfiD0hydr7JaoExxe55+zje29irYyI=
Received: by 10.213.113.211 with SMTP id b19mr71582ebq.94.1289064284166;
	Sat, 06 Nov 2010 10:24:44 -0700 (PDT)
Received: from localhost.localdomain ([93.182.199.230])
	by mx.google.com with ESMTPS id q58sm2318712eeh.21.2010.11.06.10.24.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Nov 2010 10:24:43 -0700 (PDT)
Sender: Camille Moncelier <pixdamix@gmail.com>
From: Camille Moncelier <moncelier@devlife.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Nov 2010 17:24:30 +0000
Message-Id: <1289064270-20041-2-git-send-email-moncelier@devlife.org>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1289064270-20041-1-git-send-email-moncelier@devlife.org>
References: <1289064270-20041-1-git-send-email-moncelier@devlife.org>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: [PATCH 02/11] dropbear: Removed openmoko references. Added /etc/default/dropbear
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
X-List-Received-Date: Sat, 06 Nov 2010 17:25:40 -0000

Signed-off-by: Camille Moncelier <moncelier@devlife.org>
---
 recipes/dropbear/dropbear.inc     |    4 +---
 recipes/dropbear/dropbear/default |    4 ++++
 2 files changed, 5 insertions(+), 3 deletions(-)
 create mode 100644 recipes/dropbear/dropbear/default

diff --git a/recipes/dropbear/dropbear.inc b/recipes/dropbear/dropbear.inc
index 1569ea3..db1b26e 100644
--- a/recipes/dropbear/dropbear.inc
+++ b/recipes/dropbear/dropbear.inc
@@ -15,8 +15,6 @@ SRC_URI = "\
   file://fix-2kb-keys.patch \
   file://allow-nopw.patch;apply=no \
   file://init \
-"
-SRC_URI_append_openmoko = "\
   file://default \
 "
 
@@ -82,4 +80,4 @@ pkg_postrm_append () {
 	update-alternatives --remove scp ${bindir}/dropbearmulti
 }
 
-CONFFILES_${PN}_openmoko += "${sysconfdir}/default/dropbear"
+CONFFILES_${PN} += "${sysconfdir}/default/dropbear"
diff --git a/recipes/dropbear/dropbear/default b/recipes/dropbear/dropbear/default
new file mode 100644
index 0000000..a4f2bfd
--- /dev/null
+++ b/recipes/dropbear/dropbear/default
@@ -0,0 +1,4 @@
+# DROPBEAR_BANNER=""
+# DROPBEAR_RSAKEY="/etc/dropbear/dropbear_rsa_host_key"
+# DROPBEAR_DSSKEY="/etc/dropbear/dropbear_dss_host_key"
+# DROPBEAR_KEYTYPES="rsa"
-- 
1.7.3.1




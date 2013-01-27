Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TzUbl-0005tq-1D
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 16:57:26 +0100
Received: by mail-ee0-f41.google.com with SMTP id c13so911546eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 07:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=LovrknGamowKMsuWOhOBymfP4eo1S/mXD1RDXDGOyaI=;
	b=o5I9hzCS5Kr7GqmQuClOGNN+Rm2Kwj4PuFnYX88PU0yJHAceXmzGD4TjUWXCGo3RVk
	k7ZOLQoKyOHKAwqb6Eb6y9Wz0iFEAsWWGWzPE4xcXDlylSA/J5UC3w53AR0e+vfuk1sI
	Q9cwCbu0Ww1xn2i6qyj0h4T6YhZb05ufDznhHvnqqRJZPhDaLxiHoClsYCD4wIKmSH8f
	FBq3261ko3IwIycwXlUdzX2Jy9C3U1+R+yuJ3jgpdnpde/vv1H2MrSSgHhUW2gP8P6cm
	Y41l7gwEEb5VsvGrMLUe64uhKLdLDkcn+w7lfJtcgCsvbjLcjN/rA78ir/iwMB8zwCo3
	EAHA==
X-Received: by 10.14.221.9 with SMTP id q9mr42336123eep.3.1359301308027;
	Sun, 27 Jan 2013 07:41:48 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id q5sm11876147eeo.17.2013.01.27.07.41.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 27 Jan 2013 07:41:47 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Jan 2013 16:41:21 +0100
Message-Id: <1359301282-5470-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
References: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn/Qrtd4WTkWGXxCsKksqpf6malR2a1vdi23EY+tT0DtvVmbnjIuufwjNMFMWTH33viATIZ
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 6/7] apcupsd: fix QA error and SUMMARY
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
X-List-Received-Date: Sun, 27 Jan 2013 15:57:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
index e50d03f..bd11f0d 100644
--- a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
+++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
@@ -1,4 +1,4 @@
-SUMMARY = "foo"
+SUMMARY = "Apcupsd a daemon for controlling APC UPSes"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c12853cc7fdf20d17b4fddefd26b7802"
@@ -32,4 +32,8 @@ do_configure() {
 	oe_runconf
 }
 
+do_install_append() {
+	rm ${D}${datadir}/hal -rf
+}
+
 
-- 
1.8.1




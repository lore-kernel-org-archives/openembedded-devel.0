Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OiM69-0003Gq-3E
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 08:44:37 +0200
Received: by pxi16 with SMTP id 16so1389336pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Aug 2010 23:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=5nBlwUtcIY3jOzDcZTQrK3UnqSTKyy1+moDxuq/aE/4=;
	b=m0aeHb9PpqXuR+oImupYcU48gN7ipuIqyZUfEYG9GOY2yGpB1P2r3XjLPVDIBUEOz0
	E9o+nvup53JxGFZLSDRV+IXkqXmHqfsrEPn42eZ/Gwgwi8zVuKCxkcFgWNATblO0HV7a
	HejanjpHV7KfIbVKO3pMYvuRF8d0MWezCvctk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=u4cVOim6O20ugFRV7gnfyKskkSnbaMV3vfyJJJXLeyh+oN9sylfhbSuzAfLWga8wCx
	eOZzYaOtoF1alE3nlFB2vOKotz28kLQFOlOgQ5Js9gogKc1ZalsCpGklp7xyHZpmy8Ni
	4ioiKBv77a8XCXhrusnTT3onE7EgXekEkQRME=
Received: by 10.114.74.3 with SMTP id w3mr18132073waa.3.1281336262426;
	Sun, 08 Aug 2010 23:44:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d39sm9741194wam.16.2010.08.08.23.44.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 08 Aug 2010 23:44:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Aug 2010 23:44:14 -0700
Message-Id: <1281336254-11566-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] cross.bbclass: Override STAGING_* paths to match cross installation
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
X-List-Received-Date: Mon, 09 Aug 2010 06:44:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/cross.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index cf14db1..64f7902 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -50,6 +50,14 @@ exec_prefix = "${prefix}"
 base_sbindir = "${base_prefix}/bin"
 sbindir = "${exec_prefix}/bin"
 
+# staging should be special for cross
+STAGING_BINDIR = "${bindir}"
+STAGING_LIBDIR = "${libdir}"
+STAGING_INCDIR = "${includedir}"
+STAGING_ETCDIR = "${sysconfdir}"
+STAGING_DATADIR = "${datadir}"
+STAGING_SBINDIR = "${sbindir}"
+
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 }
-- 
1.7.1




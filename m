Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgjAT-00064s-A9
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 20:58:37 +0200
Received: by pzk2 with SMTP id 2so2204205pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 11:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=+1eMcUXwiFl+V95aLlyrRbxe6+GjlP9Z2KYgqyEnxhM=;
	b=eino06LzMR5mAuhGmhNK4iOm10RrOqLw1HxMs9JTiLrjUPkuN5xaSt2PWzNHIUDtNU
	rWN7KUW4J0MLc/QSj5dEcgpEqg7rivSRCsMVRuRPgeebfA4a/XoWOJWYH1MLnjJ4cO0y
	R1xnr+py+AoV3ireg0SbKFBRZyFyHTCMb1YfA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LIVHxrqhGeSybSC2kjpgGs0/iCQpTR9bmYdfMKAJhz8YdpX0Sy8uH/8OilPSTQnvRC
	QDduv93r6MnbQVWFwmR0djidVUU1Nelg0q+EXmNTiOJ597TFyfVLXDY+PbtyjekpIode
	gn/ipF6ru5XQKiAAS3lPhWM3REydnH1aLSO7g=
Received: by 10.142.177.4 with SMTP id z4mr8512888wfe.280.1280948295145;
	Wed, 04 Aug 2010 11:58:15 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm10876016wfl.1.2010.08.04.11.58.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 11:58:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 11:58:00 -0700
Message-Id: <1280948285-3458-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
References: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/7] openobex_1.5.bb: Get rid of legacy staging
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
X-List-Received-Date: Wed, 04 Aug 2010 18:58:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/openobex/openobex_1.5.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/openobex/openobex_1.5.bb b/recipes/openobex/openobex_1.5.bb
index fa08df7..7b08047 100644
--- a/recipes/openobex/openobex_1.5.bb
+++ b/recipes/openobex/openobex_1.5.bb
@@ -5,20 +5,20 @@ SECTION = "libs"
 PROVIDES = "openobex-apps"
 DEPENDS = "virtual/libusb0 bluez-libs"
 LICENSE = "GPLv2/LGPLv2.1"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.tar.gz \
            file://disable-cable-test.patch \
            file://libusb_crosscompile_check.patch"
 
-inherit autotools_stage binconfig pkgconfig
+inherit autotools binconfig pkgconfig
 
 EXTRA_OECONF = "--enable-apps --enable-syslog --enable-dump \
                 --with-usb=${STAGING_LIBDIR}/.. --with-bluez=${STAGING_LIBDIR}/.."
 
-do_stage_append() {
-	install -d ${STAGING_DATADIR}/aclocal
-	install -m 0644 ${S}/openobex.m4 ${STAGING_DATADIR}/aclocal
+do_install_append() {
+	install -d ${D}${datadir}/aclocal
+	install -m 0644 ${S}/openobex.m4 ${D}${datadir}/aclocal
 }
 
 PACKAGES += "openobex-apps"
-- 
1.7.1




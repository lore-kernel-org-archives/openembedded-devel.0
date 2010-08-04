Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgjAV-00066J-Ii
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 20:58:39 +0200
Received: by pvg13 with SMTP id 13so2205445pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=P3+3/DZXw3feVewX+yK5j6nPi6Z04KL/FA33tCML42s=;
	b=B9m8UIJp5tgCGgmiHCyooUpkPBtjmNUzLrvSDgHQCFZ90zoqeH3RIIe9D7kLMIwWPX
	AnEjbnn49W4MgnXVG5MJCNO1yI3eOXHe25CrgmEdaWikJ0Y7BcjaQDKZkPiosRABBRoW
	ikNWpklVEH2iGSpI+8zNA9+NYck4D+AgVK4uw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wcEiSWcmdbvo96ajMwnTlUU2h4e5i2uDSpUvprEIVptzHx90WXAy4Px/TXx4fUvx3O
	jSdR0iPef4X2Gtp3ONZt3MG8FGPBW5HWQqanLgv0aAyukupo//u0nm6Y8MX9HcaBQbgL
	fcyyumeWUslkCmuya3BuOvOMm8/HKzBXORRHA=
Received: by 10.142.185.16 with SMTP id i16mr8106664wff.231.1280948297275;
	Wed, 04 Aug 2010 11:58:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm10876016wfl.1.2010.08.04.11.58.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 11:58:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 11:58:02 -0700
Message-Id: <1280948285-3458-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
References: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/7] gupnp_0.13.1.bb: Get rid of legacy staging
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
X-List-Received-Date: Wed, 04 Aug 2010 18:58:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/upnp/gupnp_0.13.1.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/upnp/gupnp_0.13.1.bb b/recipes/upnp/gupnp_0.13.1.bb
index cd49b66..726efd7 100644
--- a/recipes/upnp/gupnp_0.13.1.bb
+++ b/recipes/upnp/gupnp_0.13.1.bb
@@ -4,15 +4,17 @@ DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gtk-doc-native libgee"
 SRC_URI = "http://gupnp.org/sources/${PN}/${PN}-${PV}.tar.gz \
            file://nodoc.patch"
 
-inherit autotools_stage pkgconfig
+inherit autotools pkgconfig
+
+PR = "r1"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
 
-do_stage_append () {
-	install ${S}/tools/gupnp-binding-tool ${STAGING_BINDIR_NATIVE}
+do_install_append () {
+	install ${S}/tools/gupnp-binding-tool ${D}${STAGING_BINDIR_NATIVE}
 }
 
 SRC_URI[md5sum] = "9b5fcf8146ba9a2bd84382f61717aa0e"
-- 
1.7.1




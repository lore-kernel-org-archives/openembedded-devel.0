Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OZCD4-0008AT-6E
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 02:21:55 +0200
Received: by pzk2 with SMTP id 2so112032pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 17:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=Gs1wbEJRsDOcfFaF5y+78EScFj1L+hteLzv7IU/hnz0=;
	b=uUVtS2ihjc3nUzRHEU+kNpbuBxzquSz6vBpgemtDrt+9oBescFQp6QUCJtQOPqdT98
	+2P/6wdfDPT4qrLCe4kb1J4zrtwgCgUi7oBXRdT1oB5tcE22bu4zzmpSeq8IBh3W+1Jd
	NzIrMCSRDtOT2WFa+eIJ1EByf+eQVqe+E1HXk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=Sx0CM/HvxaMADk5KKZviY/1KZ0jdE4goNwNQE2aCaIoOl8NI935j5jkC7ZdO8h3Btt
	p8eflA2C67PgREV8D1peN0Y1kav07EE8uQxVzykW+SbmB3oXvPFMJRe7jFni3fTV+SEH
	OPfunlF/aZ/ZjP+yRnlwi8L3+xV54kEnTxtak=
Received: by 10.142.211.5 with SMTP id j5mr462620wfg.36.1279153308440;
	Wed, 14 Jul 2010 17:21:48 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id f2sm472180wfp.11.2010.07.14.17.21.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 14 Jul 2010 17:21:47 -0700 (PDT)
Message-ID: <4C3E5496.9090306@gmail.com>
Date: Thu, 15 Jul 2010 09:51:42 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gpsd: Unbreak gpsd_2.38.bb and gpsd_2.39.bb.
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
X-List-Received-Date: Thu, 15 Jul 2010 00:21:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gpsd/gpsd.inc     |    3 +--
 recipes/gpsd/gpsd_2.90.bb |    5 +++++
 recipes/gpsd/gpsd_2.91.bb |    5 +++++
 recipes/gpsd/gpsd_2.94.bb |    5 +++++
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
index fbb867c..a415211 100644
--- a/recipes/gpsd/gpsd.inc
+++ b/recipes/gpsd/gpsd.inc
@@ -49,14 +49,13 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rules.d
     install -d ${D}${base_libdir}/udev/
     install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
-    install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
 }
 
 pkg_postinst_${PN}-conf() {
 	update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 10
 }
 
-pkg_postrm_${PN}-conf() {	
+pkg_postrm_${PN}-conf() {
 	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default	
 }
 
diff --git a/recipes/gpsd/gpsd_2.90.bb b/recipes/gpsd/gpsd_2.90.bb
index 25c739b..69cd9ba 100644
--- a/recipes/gpsd/gpsd_2.90.bb
+++ b/recipes/gpsd/gpsd_2.90.bb
@@ -7,3 +7,8 @@ SRC_URI[gpsd.sha256sum] = "8c81461266fc95aae6519ec996d7e4f4801fb5a02dbcc7a5d1c13
 PR = "${INC_PR}.0"
 
 PARALLEL_MAKE = ""
+
+do_install_append() {
+	install -d ${D}${base_libdir}/udev/
+	install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
+}
diff --git a/recipes/gpsd/gpsd_2.91.bb b/recipes/gpsd/gpsd_2.91.bb
index 7c575cb..2c964ca 100644
--- a/recipes/gpsd/gpsd_2.91.bb
+++ b/recipes/gpsd/gpsd_2.91.bb
@@ -8,3 +8,8 @@ SRC_URI[gpsd.sha256sum] = "02ee0f0a86a3c74fe807ea0a3fce908cb94dd7ff3afcef0b1fb66
 PR = "${INC_PR}.0"
 
 PARALLEL_MAKE = ""
+
+do_install_append() {
+	install -d ${D}${base_libdir}/udev/
+	install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
+}
diff --git a/recipes/gpsd/gpsd_2.94.bb b/recipes/gpsd/gpsd_2.94.bb
index 66bd559..2b5e9d3 100644
--- a/recipes/gpsd/gpsd_2.94.bb
+++ b/recipes/gpsd/gpsd_2.94.bb
@@ -10,3 +10,8 @@ SRC_URI[gpsd.sha256sum] = "1520b87d106d198aa42137db4b230615dbd0d06b04e6fcc84e010
 PR = "${INC_PR}.1"
 
 PARALLEL_MAKE = ""
+
+do_install_append() {
+	install -d ${D}${base_libdir}/udev/
+	install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
+}
-- 
1.7.1




Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgjAT-00065R-D8
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 20:58:38 +0200
Received: by pxi16 with SMTP id 16so42790pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ixCU6KxutsYVXZrz6ZMqFhAXdadssIbJc8sQnBSGYaU=;
	b=ZpxsKx5J6/VjCyXh/J/Ooh1PotnniUwiHfdYoiMbvbACPA92ZhyZaXAYn94wYCoJzV
	OiPKqMG/7mW0BddDEaPkzRAkSzp8NxUak5Gl1KdMAyuVvvmLoNHNaAOPDFwPz8O2OX7g
	SWAARKvgO3T1oakioBVsWocpRFkRmXHlAf7xE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iDcymlBgNIcRKRvhkowLZpAV4Ku4U+r1npzEOe7HBUkirH5kmCXbW/BzBIESSRXSzf
	ajJZD6BJ4ezgXNXFEp2ZQ/MGae9miSCbNVUu8XqLTDG4buskoxediedxZjOzp6NxpZYY
	wUNUM7UYyV3+NVZq/HBxsGpRChv0/ULPEJqB0=
Received: by 10.142.164.3 with SMTP id m3mr8383146wfe.6.1280948296216;
	Wed, 04 Aug 2010 11:58:16 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm10876016wfl.1.2010.08.04.11.58.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 11:58:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 11:58:01 -0700
Message-Id: <1280948285-3458-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
References: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/7] gupnp_0.12.5.bb: Get rid of legacy staging
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
X-List-Received-Date: Wed, 04 Aug 2010 18:58:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/upnp/gupnp_0.12.5.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/upnp/gupnp_0.12.5.bb b/recipes/upnp/gupnp_0.12.5.bb
index 8304875..1dcbcca 100644
--- a/recipes/upnp/gupnp_0.12.5.bb
+++ b/recipes/upnp/gupnp_0.12.5.bb
@@ -2,15 +2,15 @@ LICENSE = "LGPL"
 DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2"
 
 SRC_URI = "http://gupnp.org/sources/${PN}/${PN}-${PV}.tar.gz"
-PR = "r1"
+PR = "r2"
 
-inherit autotools_stage pkgconfig
+inherit autotools pkgconfig
 
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
 
-do_stage_append () {
-	install ${S}/tools/gupnp-binding-tool ${STAGING_BINDIR_NATIVE}
+do_install_append () {
+	install -m 755 ${S}/tools/gupnp-binding-tool ${D}${STAGING_BINDIR_NATIVE}
 }
 SRC_URI[md5sum] = "bfb12195c76bb6632bd917f2c2bc12d6"
 SRC_URI[sha256sum] = "241e416cbe2c02f413fde82a8587bfe2fe9915fbed3a6fb20c86520b8d7543ef"
-- 
1.7.1




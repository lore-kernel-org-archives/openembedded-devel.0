Received: from mail-ey0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PV2v6-00030M-Ci
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 15:10:28 +0100
Received: by eyf5 with SMTP id 5so1747267eyf.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 06:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Y86t30/KzRHVdMyCDI9sIyld/fzo0ifZzN/XgvHcCI8=;
	b=eLeeBAH/z0+aU2soY13FFDRhF8w39ko4SaGliyXI2H9AV5JhDnTjIjALOn1YwW9tAP
	kzm+/4/hKimD3t8oAv4NcbC69txZfcqGDxQ+uxDmKH8Ez7Pyz6Fmy9bXgWrUgejJGm0H
	efygBGCVI5YgYY3G1jZL6TvIrBS7wPTS1cNPU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QOVtPBrWjzNOcb43xYYaos60O+ka7VhID26eiIAAs5WuC7yyxSsfiFG9wabeGDPsTv
	HG6ej6nZXci/w94lG1r6kh/+dtX1nh0zu/euBrp0Kx1AGeZEY9G+cidrazNp1mhc6W1i
	5mhbAJlxdU8Td4N9pLsOkzVxTRJVuVB7Eskwc=
Received: by 10.103.238.16 with SMTP id p16mr180675mur.67.1292940614326;
	Tue, 21 Dec 2010 06:10:14 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l3sm952963fan.0.2010.12.21.06.10.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 06:10:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 15:09:52 +0100
Message-Id: <1292940593-22743-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <20101221133550.GI3282@jama>
References: <20101221133550.GI3282@jama>
Subject: [PATCH 1/2] talloc: install .so links
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
X-List-Received-Date: Tue, 21 Dec 2010 14:10:28 -0000

* otherwise mesa finds talloc.pc, but doesn't link to libtalloc.so.2 in the end
---
 recipes/talloc/talloc_2.0.1.bb |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/recipes/talloc/talloc_2.0.1.bb b/recipes/talloc/talloc_2.0.1.bb
index 9514a15..80f4b37 100644
--- a/recipes/talloc/talloc_2.0.1.bb
+++ b/recipes/talloc/talloc_2.0.1.bb
@@ -10,8 +10,17 @@ SRC_URI[sha256sum] = "5b810527405f29d54f50efd78bf2c89e318f2cd8bed001f22f2a1412fd
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+PR = "r1"
+
 # autoreconf doesn't work well while reconfiguring included libreplace
 do_configure () {
        gnu-configize
        oe_runconf
 }
+
+do_install_append() {
+       install -d ${D}${libdir}
+       ln -s libtalloc.so.2.0.1 ${D}${libdir}/libtalloc.so.2.0
+       ln -s libtalloc.so.2.0 ${D}${libdir}/libtalloc.so.2
+       ln -s libtalloc.so.2 ${D}${libdir}/libtalloc.so
+}
-- 
1.7.3.4




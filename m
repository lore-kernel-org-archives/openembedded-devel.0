Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Of4ic-0005up-Pp
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 07:34:48 +0200
Received: by pvg13 with SMTP id 13so831273pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 22:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=T/vtF9SgjaZwmxQSEa+IJPMBhoclSpG7oPgWDzOu4b4=;
	b=SRtL5sJ7WuV03CO9nPpkcphkNs4CdSqCzWM7RZaLtWRluqd07HkyAUty5M+KAcXLbF
	XGQlmkfmu238hecYDYql2RbdWzu2ltdnzmpRM9/u+kx3sdU44on7PeOJJQg6PAYYzxon
	O8c2PmOuXFJzAegacT4MUIRIhrwD4UswnhvOY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DoQYaAZ66b8WFYWON2rg1R5g+sJ2rK9cTVOlA1aUekGX55PiCSSfPqdlE6VSbLz7QI
	/h5+gmndCVGhvESr11Fq62GVzmkjqi/YariUbzwFi64vG/CrANkzhfyWVPMqGcVhK44h
	KRCrP84Q93DpRAd5xwVHVoe92ayuIf6OWt1Dc=
Received: by 10.114.26.16 with SMTP id 16mr3595463waz.15.1280554462583;
	Fri, 30 Jul 2010 22:34:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n32sm5308381wag.23.2010.07.30.22.34.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Jul 2010 22:34:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 22:34:11 -0700
Message-Id: <1280554451-27780-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/5] mpfr_3.0.0.bb: Override needs to be thumb instead of armv4t
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
X-List-Received-Date: Sat, 31 Jul 2010 05:34:48 -0000

* This covers the case when compiling with thumb mode

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/mpfr/mpfr_3.0.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/mpfr/mpfr_3.0.0.bb b/recipes/mpfr/mpfr_3.0.0.bb
index 6ad2a29..1abccd6 100644
--- a/recipes/mpfr/mpfr_3.0.0.bb
+++ b/recipes/mpfr/mpfr_3.0.0.bb
@@ -3,14 +3,14 @@ require mpfr.inc
 DEPENDS = "gmp"
 S = "${WORKDIR}/mpfr-${PV}"
 NATIVE_INSTALL_WORKS = "1"
-PR = "r1"
+PR = "r2"
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2 \
            file://p3.patch"
 
 # fix build in thumb mode for armv4t
-SRC_URI_append_armv4t = " file://long-long-thumb.patch"
+SRC_URI_append_thumb = " file://long-long-thumb.patch"
 
 SRC_URI[md5sum] = "f45bac3584922c8004a10060ab1a8f9f"
 SRC_URI[sha256sum] = "8f4e5f9c53536cb798a30455ac429b1f9fc75a0f8af32d6e0ac31ebf1024821f"
-- 
1.7.1




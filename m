Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PSHHF-0008Pf-J0
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 23:53:56 +0100
Received: by gyh20 with SMTP id 20so3377432gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 14:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=2aT2Vy8DreYqcyXwGH5IKB9NvLkw0aZLelVs+hTiDWg=;
	b=eymtu30e5fNb/rWx9S/jrKh7cPKRame7mxAg6g9jmKS+KQwYYbQTaUuSAPOqvFHaVS
	sJ4b7CdmC3KOijwdt5zxFBqYQPxi5KaRsaOrSnMQLSiNZBsqUEb5LDksQcUv36UuzEAm
	mK9zquA7x+RXlYV39E4kb+uAKJep1LEauGVzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=WYDTfc7z6ZTHzmN4qgL2ltpk84l9kwcHH6IGMcG5vtpd1UKqbmv6+TEarsNhinETAP
	xB7z8ngYbSQSVclgy/yBkaXseBaeXAx+TvSJY7z3l9hymuOHxMSU0PdxQtI1LeMK8SSw
	T3t/BkQfsMFyuUH4cRDVCr0HnYx0jayHu79qI=
Received: by 10.236.110.12 with SMTP id t12mr9834233yhg.6.1292280737278;
	Mon, 13 Dec 2010 14:52:17 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v8sm4308829yhg.40.2010.12.13.14.52.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Dec 2010 14:52:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Dec 2010 14:52:05 -0800
Message-Id: <1292280726-7153-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] glibc: Replace get_glibc_fpu_setting with get_libc_fpu_setting
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
X-List-Received-Date: Mon, 13 Dec 2010 22:53:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/glibc/glibc_2.10.1.bb            |    2 +-
 recipes/glibc/glibc_2.2.5.bb             |    2 +-
 recipes/glibc/glibc_2.3.2.bb             |    2 +-
 recipes/glibc/glibc_2.3.3.bb             |    2 +-
 recipes/glibc/glibc_2.3.5+cvs20050627.bb |    2 +-
 recipes/glibc/glibc_2.5.bb               |    2 +-
 recipes/glibc/glibc_2.6.1.bb             |    2 +-
 recipes/glibc/glibc_2.9.bb               |    2 +-
 recipes/glibc/glibc_cvs.bb               |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes/glibc/glibc_2.10.1.bb b/recipes/glibc/glibc_2.10.1.bb
index b29e36a..58016e9 100644
--- a/recipes/glibc/glibc_2.10.1.bb
+++ b/recipes/glibc/glibc_2.10.1.bb
@@ -82,7 +82,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 		--without-selinux \
 		${GLIBC_EXTRA_OECONF}"
 
-EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 do_munge() {
 	# Integrate ports and libidn into tree
diff --git a/recipes/glibc/glibc_2.2.5.bb b/recipes/glibc/glibc_2.2.5.bb
index 8622950..40fe49b 100644
--- a/recipes/glibc/glibc_2.2.5.bb
+++ b/recipes/glibc/glibc_2.2.5.bb
@@ -115,7 +115,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 		--with-headers=${STAGING_INCDIR} \
 		${GLIBC_EXTRA_OECONF}"
 
-EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 glibc_do_unpack () {
 	mv ${WORKDIR}/linuxthreads ${WORKDIR}/linuxthreads_db ${S}/
diff --git a/recipes/glibc/glibc_2.3.2.bb b/recipes/glibc/glibc_2.3.2.bb
index 632df5b..323f9b3 100644
--- a/recipes/glibc/glibc_2.3.2.bb
+++ b/recipes/glibc/glibc_2.3.2.bb
@@ -119,7 +119,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 		--with-headers=${STAGING_INCDIR} \
 		${GLIBC_EXTRA_OECONF}"
 
-EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 glibc_do_unpack () {
 	mv "${WORKDIR}/linuxthreads" "${WORKDIR}/linuxthreads_db" "${S}/"
diff --git a/recipes/glibc/glibc_2.3.3.bb b/recipes/glibc/glibc_2.3.3.bb
index 6e0ed6b..783e231 100644
--- a/recipes/glibc/glibc_2.3.3.bb
+++ b/recipes/glibc/glibc_2.3.3.bb
@@ -64,7 +64,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 		--with-headers=${STAGING_INCDIR} \
 		${GLIBC_EXTRA_OECONF}"
 
-EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 glibc_do_unpack () {
 	mv "${WORKDIR}/linuxthreads" "${WORKDIR}/linuxthreads_db" "${S}/"
diff --git a/recipes/glibc/glibc_2.3.5+cvs20050627.bb b/recipes/glibc/glibc_2.3.5+cvs20050627.bb
index 2124453..8bf5209 100644
--- a/recipes/glibc/glibc_2.3.5+cvs20050627.bb
+++ b/recipes/glibc/glibc_2.3.5+cvs20050627.bb
@@ -78,7 +78,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 		--without-selinux \
 		${GLIBC_EXTRA_OECONF}"
 
-EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 #avoid too much optimization on ppc
 CFLAGS_dht-walnut += " -O1 -g0 -fPIC -fno-inline-functions -fno-unit-at-a-time "
diff --git a/recipes/glibc/glibc_2.5.bb b/recipes/glibc/glibc_2.5.bb
index cb3b547..1aa7c6b 100644
--- a/recipes/glibc/glibc_2.5.bb
+++ b/recipes/glibc/glibc_2.5.bb
@@ -90,7 +90,7 @@ EXTRA_OECONF = "\
   ${GLIBC_EXTRA_OECONF} \
 "
 
-EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 do_munge() {
 	# Integrate ports and libidn into tree
diff --git a/recipes/glibc/glibc_2.6.1.bb b/recipes/glibc/glibc_2.6.1.bb
index 8acfeff..7e42cd2 100644
--- a/recipes/glibc/glibc_2.6.1.bb
+++ b/recipes/glibc/glibc_2.6.1.bb
@@ -92,7 +92,7 @@ EXTRA_OECONF = "\
   ${GLIBC_EXTRA_OECONF} \
 "
 
-EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 do_munge() {
 	# Integrate ports and libidn into tree
diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index 456871d..fef42b8 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -94,7 +94,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 		--without-selinux \
 		${GLIBC_EXTRA_OECONF}"
 
-EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 do_munge() {
 	# Integrate ports and libidn into tree
diff --git a/recipes/glibc/glibc_cvs.bb b/recipes/glibc/glibc_cvs.bb
index 1c7a785..4281b5d 100644
--- a/recipes/glibc/glibc_cvs.bb
+++ b/recipes/glibc/glibc_cvs.bb
@@ -62,7 +62,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 		--without-selinux \
 		${GLIBC_EXTRA_OECONF}"
 
-EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 do_munge() {
 	# Integrate ports into tree
-- 
1.7.1




Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNFdx-000873-K9
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 04:40:49 +0200
Received: by pwj9 with SMTP id 9so1569957pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 19:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=LnO95mO9Ur6Wz/JgMWF2k9DFWVmieYEj5EO5QRJ8mWo=;
	b=egvyTJ1r3emJNwKFrFbi5f9n9OFwfqAtPFjlIJ6haGo3xkJMKD9nZjKRCuw2ib3mBE
	r/kN1vDxzhEBD4MvZv7EcHRlbjL7v59XXoItGRZTjKO3vAMf/yK8nMlW36HGuWt+BLsy
	qNluuMVOqD22Ci3lHQF67bAfp3h3e9veZH7h4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=xOY4zt2NantNCJvaIip20K5bWmoCEUYuEe838cWPA+mLBshpkyNluo/xFs1q6kYDT2
	nwsiuTCcVHxZTDOCfon3QxjcijHu5HjEnaYEGpD8RlolWQRVaYb5TeBhlrYAVTAZ2UEW
	4DeDnGzdz9qqyv6CxBfUfyGRZkihAjdvkV6KA=
Received: by 10.68.0.10 with SMTP id 10mr5855762pba.443.1305859072266;
	Thu, 19 May 2011 19:37:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z5sm2146049pbb.5.2011.05.19.19.37.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 19:37:51 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2011 19:37:38 -0700
Message-Id: <1305859058-7475-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] uclibc: Rename uclibc-libargp -> uclibc-argp and uclibc-libbacktrace -> uclibc-backtrace
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
X-List-Received-Date: Fri, 20 May 2011 02:40:49 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/uclibc/uclibc.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/uclibc/uclibc.inc b/meta-oe/recipes-core/uclibc/uclibc.inc
index ca2b929..3e21b4e 100644
--- a/meta-oe/recipes-core/uclibc/uclibc.inc
+++ b/meta-oe/recipes-core/uclibc/uclibc.inc
@@ -59,7 +59,7 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-libargp uclibc-libbacktrace"
+PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace"
 
 LEAD_SONAME = "libc.so"
 
@@ -92,8 +92,8 @@ FILES_uclibc-utils = "${bindir} ${sbindir}"
 FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
 FILES_uclibc-gconv = "${libdir}/gconv"
 FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
-FILES_uclibc-libuargp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
-FILES_uclibc-libubacktrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
+FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
+FILES_uclibc-backtrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
 
 RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
 # uclibc does not really have libsegfault but then using the one from glibc is also not
-- 
1.7.4.1




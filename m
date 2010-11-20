Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PJki3-00007Z-Rr
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 11:30:20 +0100
Received: by fxm11 with SMTP id 11so3501328fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 02:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=69IYKza+moGA+Lp8KPdl7tnHI134A8ZCbg6FEgLFW6s=;
	b=IDyRE3Xu5a/hrG4NvbZRC9bomUoHROEXDzruHEtg+RLZUCViKM6dDQB/6MZByC4Na2
	dmx+5A9rfZc/ZMpt18Byn9ONfB9RuujsJBSATou6AEuiVDBfsluUeDhc9I5EVayqpc3i
	lMsD2o7SXU0Wj69gXik0EiFa1fK86XHSM2Kvg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dS/X6VEmrmc7f4EcnwMS/YMiI6op6Oh7DYPQIE6/b34wxI2NSR+LuWTGn8jrA5Lrm0
	OgUgIuEaieKJf+keJeppRzhdYPJuB6UXnC5pieT8V/pv0/QN6qcqmm1YtodpUh3Z17/C
	lZj8e5bCbMy+Wt6qKfpP5W13iNwtrU3Sx7hH8=
Received: by 10.223.74.198 with SMTP id v6mr2994692faj.4.1290248947112;
	Sat, 20 Nov 2010 02:29:07 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z25sm784566fam.42.2010.11.20.02.29.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 20 Nov 2010 02:29:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Nov 2010 11:29:04 +0100
Message-Id: <1290248944-13342-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <1290248944-13342-1-git-send-email-Martin.Jansa@gmail.com>
References: <1290248944-13342-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] eglibc-package: move eglibc-dev to the end of PACKAGES var
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
X-List-Received-Date: Sat, 20 Nov 2010 10:30:20 -0000

* currently it picks too much stuff to eglibc-dev package
* update FILES_eglibc-extra-nss to include only .so files
---
 recipes/eglibc/eglibc-package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index c802bd5..637f2b4 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -40,7 +40,7 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc"
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
 
-PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-pic eglibc-dev eglibc-static eglibc-doc eglibc-locale libcidn libmemusage libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
+PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-pic eglibc-static eglibc-doc eglibc-locale libcidn libmemusage libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile eglibc-dev"
 PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
 
 INSANE_SKIP_eglibc-dbg = True
@@ -77,7 +77,7 @@ FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn*.so"
 FILES_libmemusage = "${base_libdir}/libmemusage.so"
-FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
+FILES_eglibc-extra-nss = "${base_libdir}/libnss*.so"
 FILES_sln = "${base_sbindir}/sln"
 FILES_eglibc-pic = "${eglibcpicfiles}"
 FILES_${PN}-pic = "${eglibcpicfiles}"
-- 
1.7.3.2




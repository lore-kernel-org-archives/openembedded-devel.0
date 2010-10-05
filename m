Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P32CU-0003Av-Rs
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 09:44:39 +0200
Received: by pvg6 with SMTP id 6so1513418pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=BG/muFUdP8b79lIwnegg/00IqIFrjmnfDrnoz0QFYFg=;
	b=WDtktpoID1GH+6WJYuZrSTRh5AlwJQoCmBgw4vyRKy1svFhItH/b47ZC81WtCcq5Tb
	MFkDOKm5M8xNI8kT34VDSK8/SMs0k83pkl7Aa/UkFObvq/6cj4PF2wS8XDkeHVtxDxmu
	w1E0Z7/+uoJ3DrER51XZbSsxbJ0NAi3hxoRQY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kgTO5xecnCObJqq08tYf+j0bGrs1xNq3DkH4m0y4u6eMM7ZY6KPbXHtY5BgaQHm6bv
	5OSZpnfYU1mEjZS/epAUQu6sFbZj86CKE8sRflgD0KdJK/+jpgQIt/7GB+pZsiwoSX9a
	cEpSIXtUKOeJHq829Ji/V9HdSmjpH8A48XpIY=
Received: by 10.142.47.7 with SMTP id u7mr9934801wfu.46.1286264658899;
	Tue, 05 Oct 2010 00:44:18 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 9sm7531414wfd.0.2010.10.05.00.44.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 05 Oct 2010 00:44:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Oct 2010 00:43:59 -0700
Message-Id: <1286264643-6352-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/6] bitbake.conf: No need to add sysroot to -rpath-link or -L in TARGET_LDFLAGS
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
X-List-Received-Date: Tue, 05 Oct 2010 07:44:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/bitbake.conf |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 4e80d97..fc39093 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -484,10 +484,9 @@ export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
-export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} \
-                         -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} \
-                         -Wl,-O1 \
-                         ${TARGET_LINK_HASH_STYLE}"
+
+export TARGET_LDFLAGS =  "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
+
 export SDK_LDFLAGS = "-L${STAGING_DIR_SDK}${libdir} \
                          -Wl,-rpath-link,${STAGING_DIR_SDK}${libdir} \
                          -Wl,-O1"
-- 
1.7.1




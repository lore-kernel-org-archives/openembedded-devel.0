Received: from mail-iw0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P6e3u-0001dw-FK
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 08:46:43 +0200
Received: by iwn41 with SMTP id 41so475909iwn.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 23:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=MrOELrJ+1g5wY5OlsCFhxgdu9ybRAfif9wH6bNOmo24=;
	b=EYkmj8QYMoQJpN+pSvFZnYjU5AjD69RSLIUhpDXnaEhhMNmwSbbM84lAWY42M/ENMG
	8Pl8p73IcbB0gyamteyQ9bBdOqMZkNqgPBgszBNMpAuusk76XS2dVUOkHu3mBkrdT+qK
	w+LXOz7pKpRdsh7eMWvSFSQNiV68dBilrRMmk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=unrrp5aGD87AuSfwnH7bKrCZXVpkMw54b176beAoURcoax23TuZa9xvIjEwybPfXWH
	wKCjJQg3aZ54GjckXyeUoIzWnwGjdKs0H02ZIn29rCQ90Glfy2x17602an3YC38wj9lJ
	fsImdxHiUqlAr96AorMK/ZUhBc/IhnEnOGJWc=
Received: by 10.231.171.7 with SMTP id f7mr209423ibz.72.1287125174430;
	Thu, 14 Oct 2010 23:46:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p1sm626316ybn.5.2010.10.14.23.46.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 23:46:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 23:46:05 -0700
Message-Id: <1287125165-25527-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287125165-25527-1-git-send-email-raj.khem@gmail.com>
References: <1287125165-25527-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] gcc-package-cross.inc: Edit the libdir enties in libstdc++.la and libsupc++.la
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
X-List-Received-Date: Fri, 15 Oct 2010 06:46:43 -0000

We manually move libstdc++ to staging sysroot from default install
location where gcc-cross installed it. During this process we have
to make sure that .la files are edited to contain proper libdir
entry pointing relative to sysroot.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-package-cross.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index 59e7dde..045c790 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -28,6 +28,13 @@ do_install () {
 			mv -f ${D}${prefix}/$d/* ${D}${target_libdir} || true
 		fi
 	done
+	# since we are moving the .la files to target sysroot we need to make sure that
+	# libdir points to right place within the target sysroot
+	for la in ${D}${target_libdir}/libstdc++.la ${D}${target_libdir}/libsupc++.la; do
+		if [ -f $la ]; then
+			sed -i -e "s:^libdir=.*:libdir='${target_libdir}':g;" $la
+		fi
+	done
 
 	# Manually run the target stripper since we won't get it run by
 	# the packaging.
-- 
1.7.1




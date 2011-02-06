Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pm8vh-0005dn-Dd
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 19:01:45 +0100
Received: by wwi17 with SMTP id 17so3821199wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 10:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=ujAAR8ZQtZI3SRyjSK3UXN+yB4+8trfqMp4DhgduYwk=;
	b=pr/fMtNrJCS/pGLzYriH3rHJiMUupjytP+s6N+8LiCQ35NvtwNp8l22jDvOItgKTPF
	3hRoQvmhH+J4e2oXijGaMgQto3irrAF5Xal544ONn8q8IKYfKacIgOIiJ7GlCgDfoUQi
	02WSc7FT4GKIxtJ+tSkJdDVOCnB6CqERheKHo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=pc/+DWhMZfndNtTzEQRye5lLRjNxs/lNnfo5KsbSrFGCsqID0XvnfUG6XZPKfRGrGQ
	TzbN/MKsbrwxk3MYCIeDAl+je6byIgmRAue9ujAkJ9JOTcSxnvxW3mKEzAmXO5HkBero
	ILmuVHOTD+ghieh0Sl+tpYeEcaLKBQ9LOkH1A=
Received: by 10.227.129.83 with SMTP id n19mr1558589wbs.174.1297015241518;
	Sun, 06 Feb 2011 10:00:41 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id n1sm1691631weq.7.2011.02.06.10.00.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Feb 2011 10:00:40 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Feb 2011 19:00:35 +0100
Message-Id: <1297015235-31439-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] dpkg-native: Fix the admindir location.
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
X-List-Received-Date: Sun, 06 Feb 2011 18:01:45 -0000

Until now the admindir was specified as $STAGING_DIR_NATIVE/var/dpkg,
which caused update-alternatives to put alternative definitions there.
This patch causes the definitions to be put into the host's rootfs
during rootfs_deb_do_rootfs (when running busybox postinst for
example).

resulting line in Dpkg.pm: our $admindir="$ENV{D}/var/dpkg"

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 recipes/dpkg/dpkg-native.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/dpkg/dpkg-native.inc b/recipes/dpkg/dpkg-native.inc
index a230f29..f7b243c 100644
--- a/recipes/dpkg/dpkg-native.inc
+++ b/recipes/dpkg/dpkg-native.inc
@@ -18,6 +18,7 @@ EXTRA_OECONF = "--without-static-progs \
 		--with-zlib \
 		--with-bz2lib \
 		--without-selinux \
+		--with-admindir='\$\$$ENV{D}/var/dpkg' \
 		--without-sgml-doc"
 
 do_stage_append() {
-- 
1.7.1




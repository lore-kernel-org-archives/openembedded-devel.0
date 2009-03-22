Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthieu.poullet@gmail.com>) id 1LlQ7J-0006bH-4C
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Mar 2009 17:01:41 +0100
Received: by fg-out-1718.google.com with SMTP id 19so240277fgg.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2009 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=0J1fXXbWXGC1H/N7azyjVSDpApC+xc+XiTH0Si5jjog=;
	b=q6rgTkIUz8wKRBIgx09ofB6HkHTQdhB3Q8xx3PeZoIqXRv1RtjDBpV1JHlKmSdTPoD
	LXSMT22PuGQ0SoKhNlqc8Bh+mFMlxBOnWmJIVrLjpucVgnhQvNBqFyYKjOs9sXSlksLz
	vUZvAWTkojMaaj6xmEal6Tmq6Q6x8yn4UnJug=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=EiCVnjY6eNkGLh9OuntYlha+QI4GUhqp7U6B/GR5+WwuyaG5Zdt5EKkKYYWD0lLNsF
	MOpzCgJ52MTrOAUZqNmisHblYJ8GdTchWCKoRz0d4hfb6E2OzJccfS1I61j6yfRnnA92
	1CXlTdVr2hh8nRLZ8mb1g9KloPzZ7gOIw1Gyc=
Received: by 10.86.3.4 with SMTP id 4mr2896495fgc.41.1237737624935;
	Sun, 22 Mar 2009 09:00:24 -0700 (PDT)
Received: from localhost.localdomain (77-22-121-59-dynip.superkabel.de
	[77.22.121.59])
	by mx.google.com with ESMTPS id d4sm3208601fga.9.2009.03.22.09.00.24
	(version=SSLv3 cipher=RC4-MD5); Sun, 22 Mar 2009 09:00:24 -0700 (PDT)
From: Matthieu Poullet <matthieu.poullet@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Mar 2009 17:00:23 +0100
Message-Id: <1237737623-10538-1-git-send-email-matthieu.poullet@gmail.com>
X-Mailer: git-send-email 1.5.6.3
Cc: Matthieu Poullet <matthieu.poullet@gmail.com>
Subject: [PATCH] Angstrom: weak-assign DEPLOY_DIR
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
X-List-Received-Date: Sun, 22 Mar 2009 16:01:41 -0000

Allow DEPLOY_DIR to be outside of TMPDIR,
so that it can be set in local.conf

---
 conf/distro/include/angstrom.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index 60f2e55..7493055 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -21,7 +21,7 @@ ANGSTROMLIBC ?= "glibc"
 PSTAGE_EXTRAPATH = "${ANGSTROMLIBC}"
 
 CACHE = "${TMPDIR}/cache/${ANGSTROMLIBC}/${MACHINE}"
-DEPLOY_DIR = "${TMPDIR}/deploy/${ANGSTROMLIBC}"
+DEPLOY_DIR ?= "${TMPDIR}/deploy/${ANGSTROMLIBC}"
 require conf/distro/include/angstrom-${ANGSTROMLIBC}.inc
 
 # ARM920T and up can use thumb mode to decrease binary size at the expense of speed
-- 
1.5.6.3




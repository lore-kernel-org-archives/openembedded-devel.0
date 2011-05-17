Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMQs4-00019b-IF
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 22:28:01 +0200
Received: by pwj9 with SMTP id 9so459987pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 13:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=mpiKnlSICiUqhHcsiqqSkXV+/1CdHC53kWAYoVxeROE=;
	b=l/feRFagqu3rUGskv4AYPZCFJjc4MzV/GXf4N2/UwzfyZVDcWWq0Nnj6JNrb5DAxKi
	RHHCv+iKhSWF74Nwp2AdDIBn9N9GrZVAkW6dFuHcZ5sjBQIRFeYRC5uE09IPsHEmmowb
	B1QIi/wydN0fJRpDn0CM8DHDADFNAgQeyLgdk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=SSGe//Of7y5aHLskZmzEZo+pnItbxf2a7L3GK+JOqUsfVU+mEM80UbHfU1OGqydI7K
	IBnFnzso6J+BHG2Tmi3HoBBlkw5GF2ma9HLE+9NmHDA30Q0q1yn/8JRpe6AK3F0Wt/6i
	Wtqzum+9kFwLtlas35PpDWJ+CLJ7ZQg0Eii+A=
Received: by 10.68.39.69 with SMTP id n5mr1632744pbk.182.1305663905697;
	Tue, 17 May 2011 13:25:05 -0700 (PDT)
Received: from localhost.localdomain ([99.57.141.118])
	by mx.google.com with ESMTPS id t6sm571716pbc.21.2011.05.17.13.25.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 13:25:04 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2011 13:24:50 -0700
Message-Id: <1305663890-20372-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] uclibc_git.bb: inherit gitpkgv to get PV
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
X-List-Received-Date: Tue, 17 May 2011 20:28:01 -0000

From: Khem Raj <raj.khem@gmail.com>

use GITPKGVTAG for PV
Cleanup unused UCLIBC_BASE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/uclibc/uclibc_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/uclibc/uclibc_git.bb b/meta-oe/recipes-core/uclibc/uclibc_git.bb
index cbc8ab8..05eea00 100644
--- a/meta-oe/recipes-core/uclibc/uclibc_git.bb
+++ b/meta-oe/recipes-core/uclibc/uclibc_git.bb
@@ -6,17 +6,17 @@
 # UCLIBC_BASE can be set in a distro file, but whether this works depends
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
-UCLIBC_BASE ?= "0.9.32"
 SRCREV="074930dd7f2a18a7013cdb72cc38136f3be39c40"
-PR_append = "+gitr${SRCPV}"
 
 require uclibc.inc
+inherit gitpkgv
+PV = "${GITPKGVTAG}"
 PR = "${INC_PR}.1"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 #recent versions uclibc require real kernel headers
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-FILESPATHPKG =. "uclibc-git:uclibc-${UCLIBC_BASE}:"
+FILESPATHPKG =. "uclibc-git:"
 
 #as stated above, uclibc needs real kernel-headers
 #however: we can't depend on virtual/kernel when nptl hits due to depends deadlocking ....
-- 
1.7.4.1




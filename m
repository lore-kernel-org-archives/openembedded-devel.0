Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aHe-0005Tz-9H
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:04:06 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so3155541bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=MvFkh+m77BWWPFiLQ0wm+uvMetKoE9t3pdgbhhV/qA4=;
	b=cDxKi9tTae4sxESGil5b9YHzlfnlLDi6PmQk4PGSwBub8dRa3J+epFaauB119fB1Fv
	/1cqQ0rQ6z1vNg/0JeQ+bxRH2ort4N4Iy6LJgaz+AkAUAn8rqThzjtDh4Hfr/G37xGL/
	5cpwNrTfqD0gGxIL0eRfgOmTidIJH8001cuDk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RkzcY7cqmuKnrslsHez/m9nnTVur5+q/4UpFcJlU3nwdEczCbq7Gyw0FX4eN3zev69
	HWmnLgxl7gYR5pgB6/we7KXe6+pSv3YN7f5NWcZKtylHcpjEIOs+3hP77ViSCmI99Y29
	/clgz5bMdi0xvMjhvukLnPOucCVjZKbgUIj9Q=
Received: by 10.204.19.18 with SMTP id y18mr958151bka.179.1300456941838;
	Fri, 18 Mar 2011 07:02:21 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b6sm2166524bkb.22.2011.03.18.07.02.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:02:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 15:00:27 +0100
Message-Id: <1300456829-25755-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 10/12] ti-wifi-utils: depend only on libnl(-2.0) not libnl2(-2.0)
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
X-List-Received-Date: Fri, 18 Mar 2011 14:04:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/ti/ti-wifi-utils_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-utils_git.bb
index e6795a8..92edb7f 100644
--- a/recipes/ti/ti-wifi-utils_git.bb
+++ b/recipes/ti/ti-wifi-utils_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
 LICENSE = "TI-BSD"
 
-DEPENDS = "libnl2"
+DEPENDS = "libnl"
 
 PV ="0.0"
 PR_append = "+gitr${SRCPV}"
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/gxk/ti-utils.git;protocol=git"
 S = "${WORKDIR}/git"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
-CFLAGS += "-I${STAGING_INCDIR}/libnl2/ -DCONFIG_LIBNL20"
+CFLAGS += " -DCONFIG_LIBNL20"
 
 do_install() {
 	install -d ${D}${bindir}
-- 
1.7.4.1




Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aGZ-0005TR-56
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:02:59 +0100
Received: by fxm19 with SMTP id 19so3646660fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=hx+wN7KUZSbaMZLdyTbeQwyWeWDM8Br57A9M3VG9VHk=;
	b=VltUpSamyY6ezWKU2s6garHx6r1EXk/tAbwO0i3Fq2Qmsi1Eb0fYE7i7frhYhGUjK5
	yoMVXGOJ2i9dy8169TPSMXhYiSLCBlfDvR8OKp/3KBgsJwmx/jB+J3CXjfzShT3p2ViM
	YQMEnd5GGaX3YJkUgwir3tcBhXWO+cotQDknI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OEecIKh/6aRLcwWGuA9lHWgh+5MBM8MQtZPem/Quha/y1/t7EpUbAR4J/GJKuNKeFJ
	GYAvcgHm+FcqTXPiQKOoNuF/JE16Dlfkf2UdIjCX+koTO6ZFENsqWP3FHcoxim2lhyvs
	vv1G3ftbJZ+baTJ4zdRB1rrjQQj7E8IJT6Pus=
Received: by 10.223.91.79 with SMTP id l15mr1299417fam.53.1300456869126;
	Fri, 18 Mar 2011 07:01:09 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n15sm1399237fam.12.2011.03.18.07.01.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:01:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 15:00:21 +0100
Message-Id: <1300456829-25755-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 04/12] libnl_git: remove fix-pktloc-dep-race.patch from this version
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
X-List-Received-Date: Fri, 18 Mar 2011 14:02:59 -0000

* it does not apply because there isn't pktloc in this SRCREV yet,
  commented out in upstream src/lib/Makefile.am

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/libnl/libnl_git.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/libnl/libnl_git.bb b/recipes/libnl/libnl_git.bb
index b844bdd..e645892 100644
--- a/recipes/libnl/libnl_git.bb
+++ b/recipes/libnl/libnl_git.bb
@@ -14,7 +14,6 @@ inherit autotools
 SRC_URI = "\
   git://git.kernel.org/pub/scm/libs/netlink/libnl.git;protocol=git \
   file://fix-pc-file.patch \
-  file://fix-pktloc-dep-race.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
1.7.4.1




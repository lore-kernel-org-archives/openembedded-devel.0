Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C86BF706AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:56:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h38W030281; Fri, 18 Jul 2014 09:43:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bqXXY2wFtb4r; Fri, 18 Jul 2014 09:43:06 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gxSp030255
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:00 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kk-0006jV-3W; Fri, 18 Jul 2014 09:42:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:36 +0100
Message-Id: <1405672966-25729-17-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 17/27] engrave: Use autotools-brokensep to avoid build failures
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jul 2014 08:56:59 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-efl/recipes-efl/efl/engrave_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/engrave_svn.bb b/meta-efl/recipes-efl/efl/engrave_svn.bb
index 3e35c9c..92d7ca1 100644
--- a/meta-efl/recipes-efl/efl/engrave_svn.bb
+++ b/meta-efl/recipes-efl/efl/engrave_svn.bb
@@ -6,6 +6,6 @@ DEPENDS = "evas ecore"
 PV = "0.0.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
-inherit efl
+inherit efl autotools-brokensep
 SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
-- 
2.0.2



Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RZKS2-0003Sz-Jd
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Dec 2011 11:46:42 +0100
Received: by eaal1 with SMTP id l1so414327eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2011 02:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RWY1F9Cu0rayWPBrdQZq8WscCdcRP4GvOUUkf9mDweQ=;
	b=hQfbnXQfACfQaO07kxS4gbdcNIteW1rvrHSWO/zcqHuvoTQBcVfSY1ctd5IBh32A4s
	he9U33xel9SMZRp8E+V40qOOwokgMsvfH88vnvEXjx3//a/KLNn89LGdBaKDbsw3uAUo
	fqYMY7lRrqV/qAy3ChzzgfMFNddjOdcdZu8nI=
Received: by 10.213.28.146 with SMTP id m18mr1228682ebc.117.1323513590734;
	Sat, 10 Dec 2011 02:39:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 53sm43851316eef.2.2011.12.10.02.39.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Dec 2011 02:39:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Dec 2011 11:39:40 +0100
Message-Id: <1323513580-17890-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Subject: [PATCH][meta-oe] connman_0.78.bbappend: fix PR
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
X-List-Received-Date: Sat, 10 Dec 2011 10:46:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../connman/connman_0.78.bbappend                  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend b/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
index 9a01d3d..d6f756c 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
+++ b/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
@@ -2,7 +2,7 @@ inherit systemd
 
 EXTRA_OECONF += "--with-systemdunitdir=${base_libdir}/systemd/system/"
 
-PR .= ".meta-oe.1"
+PRINC := "${@int(PRINC) + 1}"
 
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
-- 
1.7.8




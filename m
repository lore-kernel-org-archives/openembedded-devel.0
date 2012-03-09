Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S62gm-0002ac-RR
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 17:29:09 +0100
Received: by ghbz2 with SMTP id z2so913812ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 08:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=PtAAYvprOygwyX0ljb8sDZ3ogisRKKM5+Hg7Mq9L5VU=;
	b=sYmNnRaWCml4cM3Lu+kAdbu8pzg97ZHyL00GJzBLN9abSvCtrjWijiGhtkNoDiNgwS
	xYN4dE9QX0uTjK/AEe9gP7kvgtM8qUNSDT8wSSCLYPl6WL/6wB/MKdt1vnyNfMwjOLci
	6Lfa/QsPBy1J2LcGGg84Sq1JBfJyXdAccPlbP7kcvgSYDdcc/2zEai842bha7CEoEjzU
	PTLSTeT942C4DJYoKQMrqZwB/5wxwO5PEYmvZH7c9AByh6/xaZYJUz9HgG9zbi3VuiBd
	tW3Ww5xoogTOpK3AYRVsumS8eXtrlcHJub4ohXmKufJ9kKyV1vH55zRpMJl/cZbhFw1o
	bn0g==
Received: by 10.101.176.6 with SMTP id d6mr947098anp.27.1331310029092;
	Fri, 09 Mar 2012 08:20:29 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id v26sm15023935yhk.1.2012.03.09.08.20.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 08:20:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Mar 2012 16:20:16 +0000
Message-Id: <bca4484def2daccf9241eb7c36a1fafb41292f8b.1331309928.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331309928.git.otavio@ossystems.com.br>
References: <cover.1331309928.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331309928.git.otavio@ossystems.com.br>
References: <cover.1331309928.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 2/3] connman: update to 0.79
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
X-List-Received-Date: Fri, 09 Mar 2012 16:29:09 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...connman_0.78.bbappend => connman_0.79.bbappend} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-oe/recipes-connectivity/connman/{connman_0.78.bbappend => connman_0.79.bbappend} (85%)

diff --git a/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend b/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
similarity index 85%
rename from meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
rename to meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
index f1b05aa..6a086a2 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
+++ b/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
@@ -2,7 +2,7 @@ inherit systemd
 
 EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 1}"
 
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
-- 
1.7.2.5




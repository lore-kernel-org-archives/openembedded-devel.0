Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi8F-00040y-3g
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:21:11 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926936eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8A9j7U4fT73e/sRvxMTsQfaLe3gAYrgOXTAvNJrZQ0k=;
	b=oqs2+YL0xcMxKo08c49CmvIVTQShXL0r90/1aK+vLe15pLHLBOXw+BFY8hEsu5krJe
	bBj+2zV2Pqo0DiEmbydXdn7F1xk6mRn/sh/nbi3b92jYoryikFVvhLUFJJ3Yxw9285lI
	NahcaW+c6sD2JSWA7tHl7RB3OsJbguFxP4QdW2rh2bmrclpRQuVdZnAld2q7+KrzMD8n
	BO5hk2LEbak5PVg+s0L8KpEbuKAwGkdgZSFaxDH5ONwxp0URUcEnTq6URUHGUDP8DXT+
	sDswIyTGWmMeKsLa8uE3BNVOWBkea66QDDkic50NlIwNsSxFtXVT2K7j7nr36Q7S6ptU
	E7GA==
Received: by 10.14.225.4 with SMTP id y4mr13111902eep.6.1354586811536;
	Mon, 03 Dec 2012 18:06:51 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f49sm34814371eep.12.2012.12.03.18.06.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:06:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:26 +0100
Message-Id: <fe082532e17009056e49ba394381975019768444.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 53/58] gvim: fix unpackaged files QA warning
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
X-List-Received-Date: Tue, 04 Dec 2012 02:21:12 -0000

* there is a lot of stuff installed to /usr/share/vim, but gvim does not have this in FILES_PN

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vim/gvim_7.2.446.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/vim/gvim_7.2.446.bb b/meta-oe/recipes-support/vim/gvim_7.2.446.bb
index 94215b4..fbc763a 100644
--- a/meta-oe/recipes-support/vim/gvim_7.2.446.bb
+++ b/meta-oe/recipes-support/vim/gvim_7.2.446.bb
@@ -3,8 +3,12 @@ VIMX = "--with-x"
 
 require vim_${PV}.bb
 
+PR = "${INC_PR}.4"
+
 DEPENDS += "gtk+ xt"
 
+FILES_${PN} += "${datadir}/vim"
+
 EXTRA_OECONF += "--enable-gtk2-test"
 
 RREPLACES_${PN} = "vim vim-tiny"
-- 
1.8.0




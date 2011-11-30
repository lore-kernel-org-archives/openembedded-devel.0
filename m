Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfSQ-0008BK-8K
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:23:58 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so154835eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=B13154e3Pply2PkluegMoR3nM+kI7RX0/73rSY1fFKo=;
	b=eXBFifrs6WsnrNhEue71/2x0PiNlJrMEiYjUQNeZn+1Xcw14UZ5UydVY9KeOVjY7IT
	gYMKHFqGEJReTKwrTuzVzT+Wwc7iKERwD6YQmnO7a71OBVPXQpz9IINmJRLkk7sjGmoc
	gQJTOZnOpyS0TjFZS4TY6CB8bYTz0b0kl2k0o=
Received: by 10.14.3.163 with SMTP id 35mr108862eeh.186.1322641040527;
	Wed, 30 Nov 2011 00:17:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm3659854eea.6.2011.11.30.00.17.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:17:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:16:48 +0100
Message-Id: <55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <a>
References: <a>
In-Reply-To: <cover.1322640506.git.Martin.Jansa@gmail.com>
References: <cover.1322640506.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 01/11] elsa: add sessreg xauth to RDEPENDS
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
X-List-Received-Date: Wed, 30 Nov 2011 08:23:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elsa_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
index d0e5e81..4dafdad 100644
--- a/meta-efl/recipes-efl/efl/elsa_svn.bb
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -10,7 +10,8 @@ S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
 
+PR = "r1"
 PV = "0.0.4+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
-RDEPENDS_${PN} = "${PN}-themes"
+RDEPENDS_${PN} += "${PN}-themes sessreg xauth"
-- 
1.7.8.rc4




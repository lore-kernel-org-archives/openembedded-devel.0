Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfSd-0008LO-Fh
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:24:11 +0100
Received: by eaad13 with SMTP id d13so325412eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ezUf1mGK0N09ljhVAFG+cTN4O1E7VPTJBY/cxFH6h9g=;
	b=UxxCKiNXA9MX7FktbXqgVMbdmcFLZITsBZF4YRrgkjJOMklceOLLI1q3KrQWC542Sc
	UALeFf3wgvUQ64+HTLt7S+3UaR7tRlRexzUK8uldoEXUXW+/lLAk+xNNWXOyLYZajX/t
	0ral8EwM447Sg33sa7Nqy1VVKbq1Dfdoe3k1A=
Received: by 10.213.104.140 with SMTP id p12mr193761ebo.46.1322641051517;
	Wed, 30 Nov 2011 00:17:31 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z58sm3688858eea.3.2011.11.30.00.17.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:17:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:16:49 +0100
Message-Id: <80ebe789296d1c1d444aa1ec6f79f012272ffcdb.1322640506.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322640506.git.Martin.Jansa@gmail.com>
References: <cover.1322640506.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 02/11] elsa: add elsa.conf to CONFFILES
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
X-List-Received-Date: Wed, 30 Nov 2011 08:24:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elsa_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
index 4dafdad..17af886 100644
--- a/meta-efl/recipes-efl/efl/elsa_svn.bb
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -15,3 +15,4 @@ PV = "0.0.4+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 RDEPENDS_${PN} += "${PN}-themes sessreg xauth"
+CONFFILES_${PN} += "${sysconfdir}/elsa.conf"
-- 
1.7.8.rc4




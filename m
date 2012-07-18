Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrbqK-0001Dd-9I
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:31:36 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so4571382wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yXp2PEhT1ZFU/vLS99ThzGhit16iPTaacvwZUaxMBc4=;
	b=AKQoOhuovI8aoCiiaxpcguj7y0qej8Y91QV/b3HA5HqGedXucTtwm2eiM1kZINQJrx
	6/u+6UB4c+DTdY0ofqRhkjV0ip3EKbMgL7EEtWwdQaMVDxvtnB9I1kCpoTSrUQxRTiYg
	0GCuHCdwQQ3UbVYPGaBM2PObCwNyzpd+3WWGkKpYufntnfDR+NVVD2A2NDyn8z8yOBsf
	WKV/miK9AHzo/CZt8QlI1xMyDtWbbClzKswlMnphNk9nxGE73EppL204Mni7OsRaR8S5
	5fEICjSdZtZ0LYMr6SwBS+IbI1XV6PdfcA+LaN4SCfk+M96S8BdHeMz/audCQ/FXEWA9
	RZXQ==
Received: by 10.216.135.147 with SMTP id u19mr461235wei.12.1342646415711;
	Wed, 18 Jul 2012 14:20:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm378592wib.3.2012.07.18.14.20.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:20:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:18 +0200
Message-Id: <1d5f04dfc32871dc03176d11543e903829a0a6fe.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 08/14] efreet: inherit gettext
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
X-List-Received-Date: Wed, 18 Jul 2012 21:31:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efreet_svn.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index 720703e..503dc52 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -1,5 +1,7 @@
 require ${BPN}.inc
 
+inherit gettext
+
 SRCREV = "${EFL_SRCREV}"
 PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
-- 
1.7.8.6




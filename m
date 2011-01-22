Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.sappia@gmail.com>) id 1PgexQ-0000K1-Py
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 16:00:52 +0100
Received: by wwi18 with SMTP id 18so1778123wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 06:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=g7nlkwWcv5j2zLekjEN3IMPHtLOVwFpsNthw5eKZzIY=;
	b=w28U04sRfW7iV2Ou2f1bV1GYGYk9pt9DlJ9iFHAn79IpuA2CSlE/vDwy+zkuIMf7Wr
	GkRPVqN0qwWMnn83mjEzKS8ELkKfi9ylOtdI/GsUZi7MNwB6CFZZj3YzbRLZx+D+Kf46
	AUgA/9DQlaLfp4FfRIIfleq48HtIOljIJEgDQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=d0/rEEH0+83Za6FWz970bmkD4gCwGtbRzHSI+3g37Mh/foScv23aJ95aFGXBmAdBEJ
	1zfZE2QEfQShvrEhSCeB2vBXtR8BwHMw044arLlxGayS6mSTAeSSG/21SIeojEFeMlZ0
	oIDTGKFbVi1dzpEL4pUKJuELjRTUyQeeDKdLg=
Received: by 10.227.157.1 with SMTP id z1mr2237020wbw.23.1295708397993;
	Sat, 22 Jan 2011 06:59:57 -0800 (PST)
Received: from localhost.localdomain
	(host210-149-dynamic.52-82-r.retail.telecomitalia.it [82.52.149.210])
	by mx.google.com with ESMTPS id b30sm5521144wen.25.2011.01.22.06.59.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 22 Jan 2011 06:59:57 -0800 (PST)
From: Alessandro Sappia <a.sappia@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jan 2011 15:59:47 +0100
Message-Id: <1295708387-28440-1-git-send-email-a.sappia@gmail.com>
X-Mailer: git-send-email 1.7.1
Cc: Alessandro Sappia <a.sappia@gmail.com>
Subject: [PATCH] Corrected a typo in qtdemo-init script
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
X-List-Received-Date: Sat, 22 Jan 2011 15:00:52 -0000

Signed-off-by: Alessandro Sappia <a.sappia@gmail.com>
---
 recipes/qt4/qt-demo-init/qtdemo-init |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/qt4/qt-demo-init/qtdemo-init b/recipes/qt4/qt-demo-init/qtdemo-init
index ee84be2..affb958 100644
--- a/recipes/qt4/qt-demo-init/qtdemo-init
+++ b/recipes/qt4/qt-demo-init/qtdemo-init
@@ -3,7 +3,7 @@
 set -e
 
 if [ -f /usr/bin/qtdemo ]; then
-	QTDEMO="qtdemo > /var/log/Xsession.log 2>&1"
+	QTDEMO="qtdemo > /var/log/Xsession.log 2> &1"
 else
 	QTDEMO="qtdemoE -qws"
 fi
-- 
1.7.1




Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzB8Q-0002qt-Ev
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 15:19:26 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2053450fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 06:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=wzeDljR0iBLr9gU5L0OmiZX9SU6cuA3rMx3BPnT7mNk=;
	b=ZLpgsHQ5B8Z9GRrdPoAL8oI6ZCSGHjpJNDyKe4RzqMQ9B4usGd9BZONjJeklpZpIBc
	QVTE7k46DpKuDwTXiVleiCDenWoFsKE4EsxaSPN0hg5bXcXy3FDVy1VDTf7/C+kr3jcI
	2e0USv8BqbQGFqKy3CwjIM6RvymRLSIGdT3GQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uPMMftewZlXvkKRKliy8Y4sAGIedGVFyFTbUgxvvSgb7DV/1Kf1PFIVM7vOl7ntpjN
	IQ5Y9YHNVnfYPrykUvK2NU7IMBRrRQx6ambcG8QafqYYklNJeXxWiUzj9L3Lt8+oamOk
	xkFEtpsOSsv0Rvwkl7x1NG7tyGrssqy2evKr8=
Received: by 10.181.134.12 with SMTP id l12mr1731281bkn.80.1226237352862;
	Sun, 09 Nov 2008 05:29:12 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.10
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:11 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:09 +0300
Message-Id: <1226237296-11012-9-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-8-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-5-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-6-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-7-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-8-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] task-sdk-extra: use randrproto-dev instead of randrext-dev
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
X-List-Received-Date: Sun, 09 Nov 2008 14:19:26 -0000

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 packages/tasks/task-sdk-extra.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/packages/tasks/task-sdk-extra.bb b/packages/tasks/task-sdk-extra.bb
index efb12c3..c4414db 100644
--- a/packages/tasks/task-sdk-extra.bb
+++ b/packages/tasks/task-sdk-extra.bb
@@ -28,7 +28,7 @@ RDEPENDS_task-sdk-x11-ext = "\
     libxrandr-dev \
     libxrender-dev \
     libxsettings-client-dev \
-    randrext-dev \
+    randrproto-dev \
     libxau-dev \
     xcalibrateext-dev \
     libxcomposite-dev \
-- 
1.5.6.5




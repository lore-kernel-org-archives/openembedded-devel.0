Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzAmj-0001yu-0I
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:57:01 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2046481fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 05:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=HHv5mhS8VRV9UuuP8NzilpRd4bnMyMbwOV1BiZ3Es8U=;
	b=H5+jPp/zcfgDGn2m84LqGrFHB2/jJIL+IobiRB2yyKqPpzlBnavS7uNYHbhhfOPnYc
	4Op6RpwTTRsVo0OQ2ymRa/3WkiwwCGI81gN8gEzwC6h/NagASFRIYW7FGHWsIrKBpTVj
	Nm0ZU2hg1hIpp698onC88U9bQK8LUo83jXb34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mXjiEP7AfPtXrKHwO8NhgiiRzkwbZxvtj3jJN+PAJ/03kEGcr5qnnhU+pruqVsaNbd
	w2qLxf5Xf4CVoefJCBtB4pe6vigMSgJcZtjYaGyqWjTWbEJh7GbIBDxX9z6nz0eVU0zu
	8YT+i+3zVsmqmf99gUqeFeiCv6316kqtseL+I=
Received: by 10.181.61.18 with SMTP id o18mr1735307bkk.24.1226237346645;
	Sun, 09 Nov 2008 05:29:06 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.04
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:05 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:06 +0300
Message-Id: <1226237296-11012-6-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-5-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-5-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] task-sdk-opie: correctly select qte or qte-mt
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
X-List-Received-Date: Sun, 09 Nov 2008 13:57:01 -0000

preferred-versions-opie*.inc do contain mechanism for selecting between
qte or qte-mt packages. Follow that way to correctly select
task-sdk-opie dependency.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 packages/tasks/task-sdk-opie.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/packages/tasks/task-sdk-opie.bb b/packages/tasks/task-sdk-opie.bb
index a38e583..f6446c4 100644
--- a/packages/tasks/task-sdk-opie.bb
+++ b/packages/tasks/task-sdk-opie.bb
@@ -3,6 +3,8 @@ PR = "r7"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
+PALMTOP_USE_MULTITHREADED_QT ?= "yes"
+
 PACKAGES = "task-sdk-opie"
 
 RDEPENDS_task-sdk-opie = "\
@@ -13,6 +15,6 @@ RDEPENDS_task-sdk-opie = "\
     libopiepim2 \
     libopieui2 \
     libqpe-opie \
-    qte \
+    ${@base_conditional("PALMTOP_USE_MULTITHREADED_QT", "yes", "qte-mt", "qte", d)} \
     libqtaux2 \
     libmailwrapper"
-- 
1.5.6.5




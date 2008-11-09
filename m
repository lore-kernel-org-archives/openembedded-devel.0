Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzAh1-0001Zf-1x
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:51:07 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2044586fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 05:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=BpKAQAvuPZg9gbOF/N6QalwCub8quEZQdWXiJjs0714=;
	b=QGlHQmj3G+ITu2NB3FmBG1gTu+ehDPnakvzNyqK59xkhnaVQghdYAgQoS/WOVYbpxr
	9fZcjhXQuw6mtRLbdAD5nzMvcj0bUNUk6wZ15UWfHY4ze+oEKn8yOUs2cI5ni+dOkSN8
	Ob4mXsXMXMWEwkYUgdhzaPu4joX0ChFbDhFf4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=aw/87Z01kEXQZ+QC0rMq0ZV9erozEAgbSRHL93dKvYSOtNaN+IO+w1J0RYswNsh+sj
	9/aA87f2lFFaxOREVAX5sa+zWh7mc0+MzdTyfohAdFKSnOeu9ofPzFE/AH5EpQnXH0vW
	8ZzvI+cxGkp7tTx1EgQ2KO/iSvDDqMo3HadJQ=
Received: by 10.181.20.13 with SMTP id x13mr227832bki.164.1226237344827;
	Sun, 09 Nov 2008 05:29:04 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.02
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:03 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:05 +0300
Message-Id: <1226237296-11012-5-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] task-sdk-base: switch to newer pixman
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
X-List-Received-Date: Sun, 09 Nov 2008 13:51:08 -0000

task-sdk-base referenced older libpixman-dev, however most packages do
already use newer pixman package (which changed name from libpixman to
pixman). So switch RDEPENDS to contain pixman-dev instead of
libpixman-dev

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 packages/tasks/task-sdk-base.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/packages/tasks/task-sdk-base.bb b/packages/tasks/task-sdk-base.bb
index 4041b27..3d86d03 100644
--- a/packages/tasks/task-sdk-base.bb
+++ b/packages/tasks/task-sdk-base.bb
@@ -34,7 +34,7 @@ RDEPENDS = "\
     libiw-dev \
     libmimedir-dev \
     libpcap-dev \
-    libpixman-dev \
+    pixman-dev \
     libpng-dev \
     libschedule-dev \
     libsm-dev \
-- 
1.5.6.5




Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzAoR-00024T-6d
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:58:47 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2046974fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 05:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=UHr04vTiyuJcw1n/QdvAnUk/6jwkZ7lkk6pZ+jXgNMY=;
	b=am+CfiVq34gA4Ugf3x8VD8K7R6R0DoIRtaRG9/J9E+hUXiWm7/lxfYrCFCxzyZHTN/
	R62+qEF6h9Q+aHrfRBwYVgqDVMyMn6hsfLBuSoC9zYsRN+J7ODUtLhS8aVfxiA6SCQUT
	ETV0n+HVgcdMOL4yWj80J4sfUA6Vk/5VxLYfs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YnAqRe3/otnbB7yi3DmBaYTq/afKO02B5PVlP0wgTs5OuviXMZZUAJ+uaEQJO6Bz5i
	X9yJsQdKv4otD102CQDN2eUYdKmNYPJtEMH8Z17HSfleeFhTbCXk+/w6zXZktgLzoDxK
	rOzdH2hq+vvlvNaaAiF+xt2+dgGAD0oG8R8R0=
Received: by 10.181.138.13 with SMTP id q13mr1733932bkn.42.1226237348775;
	Sun, 09 Nov 2008 05:29:08 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.06
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:07 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:07 +0300
Message-Id: <1226237296-11012-7-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-6-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-5-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-6-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] meta-toolchain-opie: add Opie SDK package
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
X-List-Received-Date: Sun, 09 Nov 2008 13:58:47 -0000

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 packages/meta/meta-toolchain-opie.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 packages/meta/meta-toolchain-opie.bb

diff --git a/packages/meta/meta-toolchain-opie.bb b/packages/meta/meta-toolchain-opie.bb
new file mode 100644
index 0000000..c72208c
--- /dev/null
+++ b/packages/meta/meta-toolchain-opie.bb
@@ -0,0 +1,7 @@
+TOOLCHAIN_TARGET_TASK = "\
+    task-sdk-base \
+    task-sdk-opie"
+
+require meta-toolchain.bb
+
+SDK_SUFFIX = "toolchain-opie"
-- 
1.5.6.5




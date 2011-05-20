Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNUbW-00046D-MW
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 20:39:18 +0200
Received: by pxi6 with SMTP id 6so2978255pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 11:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=aXzyG5Sw8VWBN7zW3J31oYNZ0sNf/5gQoGl0xcA6A7s=;
	b=oGuFUYvY3bs2ALbFSLz+A5Hp5wLYfPHVrxaPVQ22au0AtuaQr6NmzIKcJKaOHnIVlG
	EHuMV765ikPFKuqeFHr6q7DujLZufCYHnaL8yLsyMYGpjII3HQwNRza2Z+tAXTr1zRuS
	bCXfKf5fzTeOrqPqBtyj+9Crgm6ZNqBPhdJNQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=LZqBzBpFpPB48CnZN4uHycqH+H6DvrPFfBn7KeCmAK8xMG8UVj+3MJGPb6FurHzh9n
	vHv6gy7P/mZQpv5KWh0N8XnEK8xzfEzwlRn0GzW5IokZIVJYZX2hqlDtYPWfuIOru+um
	nOOiQQzqH6MkcOaJ5FuePvvR5u8y++mptBK+Y=
Received: by 10.68.16.135 with SMTP id g7mr7654164pbd.486.1305916580615;
	Fri, 20 May 2011 11:36:20 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v6sm2532919pbc.27.2011.05.20.11.36.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 11:36:19 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 May 2011 11:36:05 -0700
Message-Id: <1305916565-15441-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] kernel.bbclass: pass KERNEL_VERSION through legitimize_package_name
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
X-List-Received-Date: Fri, 20 May 2011 18:39:18 -0000

From: Andreas Oberritter <obi@opendreambox.org>

- KERNEL_VERSION may contain characters unsuitable for package
  names, e.g. underscores. Use legitimize_package_name to replace
  those characters.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Acked-by: Phil Blundell <philb@gnu.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index e1e8197..7498c2c 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -238,8 +238,8 @@ RDEPENDS_kernel = "kernel-base"
 # Allow machines to override this dependency if kernel image files are 
 # not wanted in images as standard
 RDEPENDS_kernel-base ?= "kernel-image"
-PKG_kernel-image = "kernel-image-${KERNEL_VERSION}"
-PKG_kernel-base = "kernel-${KERNEL_VERSION}"
+PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
+PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
 ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
-- 
1.7.4.1




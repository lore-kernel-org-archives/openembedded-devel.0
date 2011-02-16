Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpfR8-0002cr-DP
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 12:20:46 +0100
Received: by mail-gy0-f175.google.com with SMTP id 8so533721gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 03:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=cvjjlvzSUYhCd87kJkb4faKO6rXleZeEobjkZWqhJRM=;
	b=oLUr/0PAJ80AcPlBHxVU81NoUpsS3ZWl/vAAqTg+o8VRnBWNU8P8pxCEDkpbsCV6L3
	2zc95fe70gc+vpCsim3s7wWeCQB4ogXK+64b+QuGOKH41yRwBI0atY2cZrBHItNMO9ao
	BtfA1DqjF8D1XaB5yAiGrSJNZw9ptJtbWkXbo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=wGjEzDv8TZPblCGNj0J3X0vq+zROLaOsURbo7n4Jrp1umWT9fPKg1bQtSGc67vMWmz
	FwrMIQtoudN+CLhkiIj1m7i+vx/4uwS48gNprKlD2K04QxYNdTb0a/Zgxs7/V7djOiRd
	r2f6FICYPAlQL8u5wIoCb6ZpJxYtYf9WaaXUQ=
Received: by 10.91.73.20 with SMTP id a20mr622706agl.28.1297855177258;
	Wed, 16 Feb 2011 03:19:37 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 68sm3057927yhl.19.2011.02.16.03.19.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 03:19:36 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:18:54 +0000
Message-Id: <1297855134-19216-13-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 13/13] distro/micro.conf: drop exec_prefix_native since it is unused
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
X-List-Received-Date: Wed, 16 Feb 2011 11:20:46 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/distro/micro.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 963afa8..b1f8f1e 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -91,7 +91,6 @@ PACKAGE_SNAP_LIB_SYMLINKS = "1"
 prefix = ""
 exec_prefix = ""
 prefix_native = ""
-exec_prefix_native = ""
 
 # Don't install ldconfig and associated gubbins
 USE_LDCONFIG = "0"
-- 
1.7.2.3




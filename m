Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3f-0001la-Tf
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:27 +0200
Received: by wgbds1 with SMTP id ds1so2633921wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=U+0qPrRBV88PoMH2GJplgck0pRqbQOvzfYyPQbWmPnE=;
	b=d/ClcYyv19ynENiNnzjolKdMJIA/Q4O3O8z7SHZhp/JGuCSD4J0iudfjeb6ZNW1iFd
	Xv57jS8rOE7/3PblwONf2WOG4gExiyzLqqNbdkYkC9wCJiUCeKttPfKTtDCjbPKPc0nA
	afu9GOVHwibeMykjeRwBjCC+N8Zj2S9BnQc+tWcJLcyyXBuUjkZYX2kAkD8XQr4IA82/
	JR/vJAgUety75zafXsXQk2MOXvkzxrTFpbzuvSzBX8YxRttAl4StkVS2s8rO1HZewa2p
	uV6RMI6XFfCJcfniKqcRadUZwMIEpmJC7fCNsCSSzRrSpAzXqMmGWmPktk15+A2/GXOC
	rPzw==
Received: by 10.180.83.168 with SMTP id r8mr15730686wiy.22.1339364515470;
	Sun, 10 Jun 2012 14:41:55 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:49 +0200
Message-Id: <1339364820-2880-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 16/27] connman: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../connman/connman_0.79.bbappend                  |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/connman/connman_0.79.bbappend (84%)

diff --git a/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend b/meta-systemd/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
similarity index 84%
rename from meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
rename to meta-systemd/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
index 167165f..3d0155e 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
@@ -1,3 +1,5 @@
+PRINC := "${@int(PRINC) + 1}"
+
 inherit systemd
 
 EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
-- 
1.7.4.4




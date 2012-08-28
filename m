Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6FRO-0005cL-1a
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2012 08:38:22 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1154438eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=6Nh7/NIYY8G71DgMU7O6XdZDR2tkxBlHeNOXeac7lBU=;
	b=E4a0Cac9YqoGPbfcnUV+Xh1kRkVqPRcRxZLHYtggic5H3bwt13e8y/FnNN1USR1MvB
	8agqOwlvkFtU4XhBIxMLxYRhJ6GujmxtklDVaHVE3H1Ki1KlJweLOl406V1Yrms+BOEP
	29erNtSii6z2/DKfTCbShq4YJML+hPrX91ZycEj8L0XYH3zz9XfiA+iTptDj0y9Ln/RL
	61eDjlrDsVNDkBOXa8IyOTpocSyeHNInD2z1uV2CroxV5MceD8jAfDqbKcB8JU+AkuKR
	t93Jey4UjOtux/fJZVFTcNDrXJMEsNqEJLPI1RdPx63bbtB4iNkwbznMMYzz4nI4znp4
	QgQQ==
Received: by 10.14.182.134 with SMTP id o6mr20513487eem.26.1346135171912;
	Mon, 27 Aug 2012 23:26:11 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id z6sm58162176eeo.6.2012.08.27.23.26.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:26:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:25:48 +0200
Message-Id: <1346135149-11256-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
References: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQkCv4chEFbXJ+o8HNNtiifQQGUsLxFz2TGfLOpdnlTKk/iPqi7oSYWcYh+oYk7TGxtFdL/J
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][meta-oe][PATCH 6/7] systemd.bbclass: introduce SYSTEMD_AUTO_ENABLE variable
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
X-List-Received-Date: Tue, 28 Aug 2012 06:38:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Currently all services introduced are enabled and started at installation. By
setting SYSTEMD_AUTO_ENABLE = "disable" the default behaviour can be
overridden.
---
 meta-oe/classes/systemd.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index babe15e..a2c8ddf 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -1,5 +1,7 @@
 DEPENDS_append = " systemd-systemctl-native"
 
+SYSTEMD_AUTO_ENABLE ??= "enable"
+
 systemd_postinst() {
 OPTS=""
 
@@ -7,9 +9,9 @@ if [ -n "$D" ]; then
     OPTS="--root=$D"
 fi
 
-systemctl $OPTS enable ${SYSTEMD_SERVICE}
+systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 
-if [ -z "$D" ]; then
+if [ -z "$D" -a ${SYSTEMD_AUTO_ENABLE} = "enable" ]; then
     systemctl start ${SYSTEMD_SERVICE}
 fi
 }
-- 
1.7.7.6




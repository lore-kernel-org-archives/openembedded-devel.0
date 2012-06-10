Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3M-0001fb-6v
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:08 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2267906wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=cYdAfek1R+nAazYlmPC3zb4jFTiEDTRO5s3IygQrCdE=;
	b=zgKDiB9KB9dx1ppjKqNVq8fNZjcjDorAacnG0kPmbNShUBEcKyVvl3/zrrAtjcwyLU
	kUhqwS7K+h7FHQUFtpddxUfttYwAtdLOW360kKyfuVN+zXQdSbRk7UJxuWPSy1Qx8zrg
	gUjJHMeswZgga1/nqqRdfZTeZOf30EyAMLDZP1b3U+PvUgIXVyvGtjQ0hzYNv+RL6q1q
	3nmjMEZB+ivDnci+FJT1VErPv6mID+1/nWJ8hgJigAzWq6exTnYu7VgUHHEOV55AQUJH
	E0aNrHAvx0/Y3AdJVFN48pg4Thu4dxhbutcXQV7t3m7j8PVc5t6NWIASRRBfCOOFLE/E
	FX4Q==
Received: by 10.180.92.69 with SMTP id ck5mr15702415wib.14.1339364497897;
	Sun, 10 Jun 2012 14:41:37 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:36 +0200
Message-Id: <1339364820-2880-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 03/27] layer.conf/README: search directory structure for bbappends changed
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-systemd/README          |    5 +++++
 meta-systemd/conf/layer.conf |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-systemd/README b/meta-systemd/README
index efed2ee..6c67933 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -10,6 +10,11 @@ URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
 
+To make BBMASK'ing per layer possible the following directory structure is
+used:
+    
+$[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name>.bbappend
+
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd]' in the subject'
 
 When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][PATCH'
diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
index 9caec69..3310abc 100644
--- a/meta-systemd/conf/layer.conf
+++ b/meta-systemd/conf/layer.conf
@@ -12,7 +12,7 @@
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/*/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "systemd-layer"
 BBFILE_PATTERN_systemd-layer := "^${LAYERDIR}/"
-- 
1.7.4.4




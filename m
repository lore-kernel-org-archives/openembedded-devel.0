Return-Path: <net147@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9857D6AD40
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 05:21:57 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id xa12so3875409pbc.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2013 22:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JvwSxjQZncM8z6ldyyXIKUXwZoTRdQCkdfWBH9MzpoE=;
	b=on3uEjh5hG7DTdquRGKWS6/ax6+1zq23koZr/nbJyktn/4/D6Om0YhZBGFE9/ToCCk
	sykgnBCwdjkfaMDEaW+TxTzO8u2cIl2Z51iXsGzz7dfz67nPKXtzm3aUgav0IBBFa/F9
	S+uEzMT6SpeEbRD2lKwc0MSxuopx1MldNE0l+IzeVQHXsGRVHJsVnkKGOw2PTfkp9L7Y
	iGCRXkqrGrqGw/qw6wiunAJqpn0zuFiqzlkRZkLjhQRv+a38gsr+u36v2ULktAfFPqro
	5ngymld9l2u41YwrBp/YE2exp/bRs5r8S1+XP9Q8xcgxHKnKsY++1s08bvINYBLHHt83
	dOXQ==
X-Received: by 10.66.164.232 with SMTP id yt8mr21450305pab.21.1373260918166;
	Sun, 07 Jul 2013 22:21:58 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	xe9sm20306951pbc.21.2013.07.07.22.21.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 07 Jul 2013 22:21:57 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2013 15:37:30 +1000
Message-Id: <1373261850-3744-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH v2] samba: remove /var/lock and /var/run from package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2013 05:21:58 -0000

The /var/lock and /var/run directories are already created by
base-files.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index a27a28c..255c0b4 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -57,3 +57,9 @@ do_configure() {
 do_compile () {
     base_do_compile
 }
+
+do_install_append() {
+    rmdir "${D}${localstatedir}/lock"
+    rmdir "${D}${localstatedir}/run"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
+}
-- 
1.8.3.2



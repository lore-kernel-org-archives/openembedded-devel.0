Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjdve-0003FR-KP
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 23:03:38 +0200
Received: by eye4 with SMTP id 4so1612948eye.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 13:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2O2yPDXV7L3wST9YlKLOfM2nS3G/h5+a303JHJeZFqo=;
	b=CMN/cOIYvp2LeWUr+fVtr4JUCKWvKQh0lT1e7VHl8XwXs3BN1jLfV9B1Mi+CmfkRgY
	RKhEh3uKCavYzy/+uLBm4LFFuTmBSqlbaSPZW1w/6uq5XR7QpGxAAvudFZd1y/5K2mhs
	uJNiwrRNfVDE5/GqGUleyaFVq+v3gq/j42F1c=
Received: by 10.205.83.194 with SMTP id ah2mr2709922bkc.49.1311195571174;
	Wed, 20 Jul 2011 13:59:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s16sm4070252fah.0.2011.07.20.13.59.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 13:59:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 22:58:50 +0200
Message-Id: <d497df9ff76e945d268b95c558977f98df671371.1311195484.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <ac2a5d6d9f55737cc5a6297303722d9188e37b33.1311195484.git.Martin.Jansa@gmail.com>
References: <ac2a5d6d9f55737cc5a6297303722d9188e37b33.1311195484.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195484.git.Martin.Jansa@gmail.com>
References: <cover.1311195484.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] vala-terminal: inherit perlnative
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
X-List-Received-Date: Wed, 20 Jul 2011 21:03:38 -0000

* otherwise perl from host is used and if there isn't libxml-parser-perl
  installed on host it fails with:
  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../vala-terminal/vala-terminal_git.bb             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index 1900b6f..2549fd6 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -8,7 +8,7 @@ PV = "1.1.1+gitr${SRCPV}"
 PE = "1"
 PR = "r1"
 
-inherit autotools
+inherit autotools perlnative
 
 SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;protocol=git;branch=master"
 S = "${WORKDIR}/git"
-- 
1.7.6




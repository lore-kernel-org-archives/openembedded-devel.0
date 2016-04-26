Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4605A6FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 08:41:24 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n3so24861693wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 01:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+VI9e/SC93a58TW1TKtMMPMRyKXVP1jOeXjWs3Cz2vI=;
	b=G6C59Kz5OgAUShwIRCEkRFKWJ61ixyNbTVNhKUzGUKL/FBzYLN7g5zLJoqh0FwBbDm
	R4Sh2yJGkYFqlCc5UudBMUUnGvIRNgxsMqRjiQ4ioHhPaltle7LxUMdf+Ynl3sPqnYwJ
	OQJxvzU5+bx7WtENZMa3IxQj/JsD2jQ5TPfr0J9JmyZy3hq2XC11oOJw73lk248xr1gL
	jfmznT171j+jAOB2xRdDOslXWVs7qauyBQ2hnXHfIm0NOphtC5O4W+dvbNuWPLzgeMVh
	XiRhd9kiBHEMSS/bJWYcXURi2KhlQVCH4GBbrQr+z5VMod7LoadHCcQz+baTFgbgxgqZ
	4Xaw==
X-Gm-Message-State: AOPr4FW5srj5fZ5qLHXuDOldGBjC2sGkWsJgNdSKJ9ZmLMaPsRjd71Upf+LRk3VwWtujaw==
X-Received: by 10.28.211.75 with SMTP id k72mr18151933wmg.77.1461660084082;
	Tue, 26 Apr 2016 01:41:24 -0700 (PDT)
Received: from localhost.localdomain ([185.46.212.56])
	by smtp.gmail.com with ESMTPSA id
	q127sm1945396wmd.13.2016.04.26.01.41.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 01:41:23 -0700 (PDT)
From: git@andred.net
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2016 09:41:19 +0100
Message-Id: <1461660079-20627-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsnapshot: use ${bindir} as rsync location
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Apr 2016 08:41:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <git@andred.net>

Signed-off-by: André Draszik <git@andred.net>
---
 .../recipes-support/rsnapshot/rsnapshot/configure-fix-cmd_rsync.patch   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot/configure-fix-cmd_rsync.patch b/meta-oe/recipes-support/rsnapshot/rsnapshot/configure-fix-cmd_rsync.patch
index 7b2361b..6466df4 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot/configure-fix-cmd_rsync.patch
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot/configure-fix-cmd_rsync.patch
@@ -34,7 +34,7 @@ index bc9df9e..2a33d29 100644
  dnl bail out if we can't find it
  if test "$RSYNC" = "no"; then
 -	AC_MSG_ERROR(rsync is required)
-+	RSYNC=/usr/bin/rsync
++	RSYNC=${bindir}/rsync
 +	AC_SUBST(CMD_RSYNC, "cmd_rsync  $RSYNC")
  fi
  
-- 
2.8.1



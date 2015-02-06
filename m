Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8065B605F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Feb 2015 21:38:41 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id p10so16231667wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Feb 2015 13:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=3yAEh3FYi6FFwxDSdreSTBNXuv9hEd/hUNzZpvLXyQY=;
	b=rLyBO9udoKlFzGh+xx7w4iYGz3RXhl3Y+w7UsuQWLjtae4eV0qn3dxBHWrhOu6h3fG
	BXyyCYLufLwaHAIQB8SO2BoQ04jnOwy8W5n36xVyAaNBbQIJ1r62GwKb7sMZxJmoWcM3
	NkKkNyu8QzzpQXNBK9lVmuQk6jVz6Ei1WVoeTYhilGy7TeQV+Qfrkj9S+74YfOAPp3HC
	vCexqrD92mmaPb6bWTNtfv+nOnA4gbAU68c0MXTdJvRDAGKGZhzOZk5q0sQMJJgR3s7/
	zZy6wqTtz5cBNJnzA4YI7nKNYhTmfaebQQcF+EVyrpAE+ULSkuSS0jOKsvhNDN7MRiNC
	U/Ug==
X-Received: by 10.194.189.138 with SMTP id gi10mr12559111wjc.86.1423258721998; 
	Fri, 06 Feb 2015 13:38:41 -0800 (PST)
Received: from localhost.localdomain (p5B0A28DE.dip0.t-ipconnect.de.
	[91.10.40.222])
	by mx.google.com with ESMTPSA id lk2sm3058368wic.22.2015.02.06.13.38.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Feb 2015 13:38:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Feb 2015 22:38:29 +0100
Message-Id: <1423258709-5226-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] samba: add mirrors
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
X-List-Received-Date: Fri, 06 Feb 2015 21:38:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Samba server is down currently so add mirrors. Both were short tested
by wget.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 68e1b1f..aef8aac 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -2,7 +2,14 @@ SECTION = "console/network"
 LICENSE = "GPL-3.0"
 DEPENDS = "readline virtual/libiconv zlib popt"
 
-SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
+SAMBA_MIRROR = "http://samba.org/samba/ftp"
+
+MIRRORS += "\
+${SAMBA_MIRROR}    http://mirror.internode.on.net/pub/samba \n \
+${SAMBA_MIRROR}    http://www.mirrorservice.org/sites/ftp.samba.org \n \
+"
+
+SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://volatiles.03_samba \
            file://smb.conf \
            file://init.samba \
-- 
1.9.3



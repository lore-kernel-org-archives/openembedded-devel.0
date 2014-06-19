Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id E1A9170194
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:12 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id u57so2083450wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3Jnl/NlTmRJPq1EF34QT8WRxjRYEhpNc9nnZn+c2Jps=;
	b=lEQMosJHEX5l+cvS1DG73WHDAkMNEhyjISQC3+pnPsTj32vT3Bk7OTPZ3UVJYPgfEk
	a73AAg7TN5dKf+CuLIydsvZo3l9LyN7eZGP3MFU6YFBZCy7yxmBjei+eSXk3v/f3XMdK
	rARfrnOe0ZDVU1pugWwbqk1q4zQNNtsie+lmgwHRGdnQ6awZxadbrgbvls3l0ZQkWE+n
	CE0qbQEDWHi3N9h6PW0dQyOgpQYN5/MdfZUul24q4ybylLybEElrvFtGfg/hmk0FgRL+
	0dQ2zuvXE+jm7aBQLJOvx+GcgXnm0f42FAfYlM5SdhjDKNeR4oOPBiFn99KvTg0v6nWW
	nENQ==
X-Received: by 10.180.86.4 with SMTP id l4mr4848187wiz.61.1403172013457;
	Thu, 19 Jun 2014 03:00:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bx2sm7663764wjb.47.2014.06.19.03.00.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:44 +0200
Message-Id: <1403171993-26208-16-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 16/25] openmotif: Blacklist because of broken with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
index 2e41524..ac4d188 100644
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
 
 PR = "r3"
 
+PNBLACKLIST[openmotif] = "BROKEN: doesn't build with B!=S"
+
 SRC_URI = "http://motif.ics.com/sites/default/files/openmotif-2.3.3.tar.gz \
            file://configure.patch;patch=1"
 
-- 
2.0.0



Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 691BE70196
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:15 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id y10so2055772wgg.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SmVz06HMENC/MUtEqRVyok6dFZ9QTY6eDRh+8uiVGFA=;
	b=gDXIOF/rO5ykE9nNmEthSJHTj20XQ4BOn60qHL9o3c5Xu8CvhKJpR6TDtOsIqPIPCk
	yGnolJ4GZpYgydY6KPCZ+yNPp5OXQfRjTF9TTL+K4Gg2XYaVmm4spyZBAWVk5EUO5tak
	9ERUBJVJ0yCjafntSvADB2AqSEHCH6W47qN0GcAnLtOT0EqLPiGuhySfBwCeIaE+8QM5
	D19PRyC/J3m4cHMGnlynpwOFYG2tJIj+0GcD0JUaKpeo3ZYhc6FgCbejmSOsUnAq9vXn
	XNRFygQLfUBRBOW4GT0Guo83CILxoGHoP9XbhXxu8rgmbmbrNhERoXxlMN8T/hs7fJah
	edGQ==
X-Received: by 10.194.91.144 with SMTP id ce16mr3887041wjb.18.1403172016118;
	Thu, 19 Jun 2014 03:00:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i8sm31871603wiw.22.2014.06.19.03.00.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:46 +0200
Message-Id: <1403171993-26208-18-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 18/25] krb5: Blacklist because of broken with B!=S
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
 meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
index 5d25527..6d39a0a 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
@@ -7,6 +7,8 @@ DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
 
 inherit autotools binconfig perlnative
 
+PNBLACKLIST[krb5] = "BROKEN: doesn't build with B!=S"
+
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${SHRT_VER}/${P}-signed.tar \
            file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch \
-- 
2.0.0



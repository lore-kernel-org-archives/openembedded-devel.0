Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id B10AD77115
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:27 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so241970wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=fVVmNRcpDHs+vgR/D2cFX4Ubgq2kWyH5VrKnUT9DlVg=;
	b=iOtygXMlyyVZkDY9Hy9ssvLPkiE9yR7EQblxGid+IFYE5dW8RLltt13GHOWJGt3ygl
	PuSzq3T00sZtIaWqHwgCvm3d3nFWLQfFFQSM0LBCmjT76mJPIV5LRIDCtoiZLEXSApZO
	f+oiBNEHldoLe+/Ipng4voWgYJ1qQ2iRosCChP0KE8raDPvGrACmdl1BCa1qe0qY9/Ov
	ken8mnN+6+u+grEQtBkbPZqhjPTgS3h7UkWFd9tWek1s3NQwOBDqnFwa3ywq5w5Va3ty
	uhKaZ8HvZmeeTPbP5Ay46i1LrxilDqOqFQy9k32MS/sjrUpy5/Gd0gLz3A8hWXJ6p47h
	q3Lg==
X-Received: by 10.28.132.18 with SMTP id g18mr6054095wmd.64.1446680667058;
	Wed, 04 Nov 2015 15:44:27 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:52 +0100
Message-Id: <1446680640-31722-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 10/18] gnulib: add native extend
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fontforge-native will require it

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/gnulib/gnulib_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_git.bb b/meta-oe/recipes-support/gnulib/gnulib_git.bb
index a064502..766e41a 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_git.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_git.bb
@@ -30,3 +30,5 @@ do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0



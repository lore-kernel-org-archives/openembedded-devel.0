Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 80DB477121
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:24 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so255899wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=HbFZqHM0Od91H2e4tkaGAkE8O2ylMwpcIRgF2SXBsFc=;
	b=hDDnLtM6w9P50aDv+El7kdJw8uzrBCiiuXW86ayk6srzN8OD4J8QFMMY3lG9qqbwUJ
	ERHiRPod1FATJc/LonM2DcuMHcqr4lsblR+QuwxlGwAl4GKySocE8U/EZimc5D39FcMM
	XYgS4XnNYpgJCAKhuNWJf+vVIGv2kuEiuTmX/3tePoK+wVOLZK7bhOnj33MME5UUfq1j
	AXY0G1UWtV+QpR+Cb0UQQahZxOQaI7TYy6b9cyS3Ty2nH4Z6ydZWTEwzpkisENNZcGYN
	34kTW0QsO5pwYWxfvyl89MAYTjoU0b3RbysMnEBpQZBJzBxJibeMCKSgaDNKLx76fJYW
	4GSQ==
X-Received: by 10.28.7.67 with SMTP id 64mr27284346wmh.70.1446680664567;
	Wed, 04 Nov 2015 15:44:24 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:49 +0100
Message-Id: <1446680640-31722-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 07/18] gnulib: move meta-networking -> meta-oe
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A more common place is required for gnulib because of other recipes (e.g
fontforge) will depend on it

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../netcf => meta-oe/recipes-support/gnulib}/gnulib_git.bb                | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking/recipes-support/netcf => meta-oe/recipes-support/gnulib}/gnulib_git.bb (100%)

diff --git a/meta-networking/recipes-support/netcf/gnulib_git.bb b/meta-oe/recipes-support/gnulib/gnulib_git.bb
similarity index 100%
rename from meta-networking/recipes-support/netcf/gnulib_git.bb
rename to meta-oe/recipes-support/gnulib/gnulib_git.bb
-- 
2.1.0



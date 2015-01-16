Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id E581972332
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 19:19:48 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id l6so14526842qcy.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 11:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=RgY6WeSBfvCAe/1UKUVTYGl6+AYm/sT6esNvx3aDwBg=;
	b=SU4hhYTdnyWA0/zUqZ4uH55+60XuWEU5QPbjnEGcJJTK2wX3p/he5S4m6R0YVU8ZEb
	BsZqWh74MLDffQ9URTqn6eJiP+ciUk5R69r5ifSZr0Lx6WzMvOdIglxJ8wniqOFVwuT+
	T53BumPaGjcFY20EjEJgG3efhGKi2ne7UgdYOAkwMeSf26mJjlUe9g6tuvhFZrKhLwhO
	QnAX5jLaX7vwinlQBa5jut8rNyuv0MLzd4PnGYr81gllg9AEx6dSs5GmCvRGZi9dBWbN
	TOPY/b8r4en8fcpVWJXhT6hJANsGXWAZB2dKss2+fB+4vbTcobLW4Ih6JhyNdhddqjv+
	eTkg==
X-Received: by 10.140.28.54 with SMTP id 51mr17717707qgy.6.1421435989358;
	Fri, 16 Jan 2015 11:19:49 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id z67sm4939763qgz.10.2015.01.16.11.19.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jan 2015 11:19:48 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jan 2015 17:19:10 -0200
Message-Id: <1421435951-15401-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-browser][PATCH 1/2] layer.conf: set LAYERVERSION to "1"
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
X-List-Received-Date: Fri, 16 Jan 2015 19:19:56 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index faf7a64..5275778 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,3 +7,5 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 BBFILE_COLLECTIONS += "browser-layer"
 BBFILE_PATTERN_browser-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_browser-layer = "7"
+
+LAYERVERSION_browser-layer = "1"
-- 
2.1.4



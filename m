Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3C16F72C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 19:20:00 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id z107so17685489qgd.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 11:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=O0BbGDwUnKdyQJKdOtoDOL9XMUndzRUzOpBw0AVyRbI=;
	b=nhUtO20APQo6IQhk5pkQ5QQBfNXOZ9oZlhn2Ug3aait/CVACeAEy55VufyYPbe0DNz
	rsRWsIWhEXwKWO3VWo14rOVo8k2zgHh/72khPoS6wqVEveKZ0f6mZDG+TvS3YCQGsB++
	JXwW4fHAxCMn0W4YvUWT3U7TpHRidsNpxRU3DdR6LZwyaScxXz1tPc9kxlsyIzB7sqrB
	NQ8V0o+Z6JSYArUa2RK3/UR+X8hxNQrCwKiHE5ZhnvA034Io2uSy2VSeq/8S/TjoE2gZ
	DD0h8z2qEil0ihFdWIbRJ20pIfpN1IgUJMSUFvRV8d+CQkokHeISVx4XRseoALm7QbSz
	KiZA==
X-Received: by 10.224.16.200 with SMTP id p8mr15203635qaa.23.1421435998348;
	Fri, 16 Jan 2015 11:19:58 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id z67sm4939763qgz.10.2015.01.16.11.19.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jan 2015 11:19:57 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jan 2015 17:19:11 -0200
Message-Id: <1421435951-15401-2-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1421435951-15401-1-git-send-email-mario@ossystems.com.br>
References: <1421435951-15401-1-git-send-email-mario@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-browser][PATCH 2/2] layer.conf: add dependency on gnome-layer
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
X-List-Received-Date: Fri, 16 Jan 2015 19:20:01 -0000

This layer contains a bbappend file for gnome-settings-daemon, which
is provided by meta-gnome.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 5275778..06cb69a 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -9,3 +9,5 @@ BBFILE_PATTERN_browser-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_browser-layer = "7"
 
 LAYERVERSION_browser-layer = "1"
+
+LAYERDEPENDS_browser-layer = "gnome-layer"
-- 
2.1.4



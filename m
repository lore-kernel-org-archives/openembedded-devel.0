Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi4d-0002l7-H4
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:17:27 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926297eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=20Q4QXAQuR3wO0EvzLNRkr8IP3f2Pby5hJHubZIVTk8=;
	b=v8m9ES2+HkS8kXtexqKpfte61o43BJyzRklxxJHEa/N/K3sNgfuD9rmT4l7kaxUaLF
	xRNV0AMxODJPG2g5IZFTt6EcjtzPMZN79xehmaWhJ16rv4IkevgKeMnRPeYjR676qFE3
	fhkHYaBRVutF+JHwjkcEFOZe3q5LxIdPZ40dicoVNsC5Qlgn86dzCnXRuXnPwSq4WBXW
	5Z47uUACPosgSkJtxNes5rT66IizjJ8UpRTpaARgVIyqIJP5oeEg7u5HTmNUMRlKy/4h
	L1eYshEparoBjy9Bva/Snx7S3Kdsl9tQX5Gb0aHhSDC7XDvkTtvMt2qN8iLrjZx7Qb87
	n+iQ==
Received: by 10.14.209.193 with SMTP id s41mr43104402eeo.9.1354586587946;
	Mon, 03 Dec 2012 18:03:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm34804034eel.14.2012.12.03.18.03.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:03:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:58 +0100
Message-Id: <56b3563877a5a9e67c65edcffdd086cd72fa8ce1.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 25/58] rain: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:17:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/rain_svn.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/rain_svn.bb b/meta-efl/recipes-efl/e17/rain_svn.bb
index 917fe38..d5e6803 100644
--- a/meta-efl/recipes-efl/e17/rain_svn.bb
+++ b/meta-efl/recipes-efl/e17/rain_svn.bb
@@ -1,4 +1,8 @@
 LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
+                    file://COPYING-PLAIN;md5=c910b645eda0005ccec46f75203dc96e"
+
 PV = "0.0.3+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 
-- 
1.8.0




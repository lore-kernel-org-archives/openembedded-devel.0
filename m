Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0C478AF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:16:18 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id h1-v6so3910106eds.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 06:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4TEZbR6/DUG/bYJwLWvBf3puv5CRVGq6Bo9W85H0Dxs=;
	b=JlBHTMrvs3+5NesjWLAIDkZW3wff3XG5sML3W6cGP3JV/ArHeiySyF0qLr+Txgn6Ta
	I9cHxYlTyMwNX3z/S6L71hSAudnhNAXYVjNNk7xHJNR/qKZrM0dpc9KDB0T+BO8ErnQl
	ymeapE+Lo2dBEgjYM1IRXQnyYmEeKK5Dh+tAJ3Ot4mOmRJDjB85cPL7LEw4NyLtcCPGz
	J9pwdfNaolA51rxyUpwydt1wzMKbVvqvWxKgOz47qtCqo+0uClbZrDCqE5P2ya1UaUUw
	Yh5MoL91neKaIZNPDS1UZJPT+Xkzn/eNlCGWO9R4WimetkkDeO9MkEQAqTe+7rSzkArl
	50Jw==
X-Gm-Message-State: AOUpUlFUIR0NgPy1jwhMHoUiCsX9Jw1XJEA1KXo39zzgp+rX0ZJkQrbe
	BUPGH4OkkIe5skdB/Wo4loqe8kZ+
X-Google-Smtp-Source: AAOMgpcEt1yGEqtZJ2TrIXn35mYZFtDENNebI+qlsg4rR7PkqtB/AS/jBQ5WqZ5j2gmLQF6P5sjZvQ==
X-Received: by 2002:a50:9303:: with SMTP id m3-v6mr7437628eda.34.1532697378902;
	Fri, 27 Jul 2018 06:16:18 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d26-v6sm3769919ede.50.2018.07.27.06.16.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 06:16:18 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:16:16 +0100
Message-Id: <20180727131616.13881-2-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727131616.13881-1-git@andred.net>
References: <20180727131616.13881-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][master-next][PATCH 2/2] ca-certificates-java: update to v20180516
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
X-List-Received-Date: Fri, 27 Jul 2018 13:16:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

This is the latest available version and contains
some fixes for Java 10 & Java 11

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../ca-certificates-java/ca-certificates-java.hook.in           | 1 -
 ...icates-java_20170930.bb => ca-certificates-java_20180516.bb} | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename recipes-core/ca-certificates-java/{ca-certificates-java_20170930.bb => ca-certificates-java_20180516.bb} (98%)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in b/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in
index f01fe36..89c764f 100755
--- a/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in
+++ b/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in
@@ -61,4 +61,3 @@ else
 fi | SYSROOT="${D:-}" ${JAVA} -Xmx64m \
                               -jar ${D:-}@@datadir_java@@/@@JARFILENAME@@ \
                               -storepass changeit
-
diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20170930.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
similarity index 98%
rename from recipes-core/ca-certificates-java/ca-certificates-java_20170930.bb
rename to recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
index 35e2c16..2db1915 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20170930.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
@@ -22,7 +22,7 @@ SRC_URI = "\
 	file://${BPN}.hook.in \
 "
 
-SRCREV = "53651f7939e6f35694ee31e5ef0376f1bfce7e55"
+SRCREV = "793b846dcd4e79371bbe8069e4125ec2fd462e57"
 
 inherit java allarch
 
-- 
2.18.0



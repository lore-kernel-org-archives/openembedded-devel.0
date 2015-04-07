Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3406073D13
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2015 15:05:01 +0000 (UTC)
Received: by wgbdm7 with SMTP id dm7so59308916wgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2015 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nLQVi5rdaVTx+F7jUqHS2IN0cNx22mWMf4RuInXZFJ0=;
	b=Q9ZzxGHA6bpoxhITUIk9LW20a/gYIm3V4sStdFpKnZkv8Q8VotjdQK2kYlIvj4A/tG
	rtBaElrbQwLM3wHw/GeNwvklxTPGMqCdVPFF+1mncaWVkR8Db0m66XL2fpnUCuFOd3oR
	14BgOFHsmsfLjowkpzq3ayZ+vRihNv3Q0b0JHAblJ0UthEzI4ayZOx9Yy54RQwOsaNAy
	rbKQAFbyrxZAfltbq+zD2m7OOt2j5npI9eGWqFANEEe0frHzQModcsyPTzrPxYcw6yF1
	Sl32POxTLXNklUKz8EHLNDFQ8RuUv7Jf0NT4DOUupkt53Say7PY8WjhXukjTxnmMpYj9
	4g/w==
X-Received: by 10.194.200.8 with SMTP id jo8mr39723627wjc.64.1428419102723;
	Tue, 07 Apr 2015 08:05:02 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B505.dip0.t-ipconnect.de.
	[217.249.181.5]) by mx.google.com with ESMTPSA id
	dr7sm11370730wib.22.2015.04.07.08.05.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Apr 2015 08:05:01 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Apr 2015 17:04:33 +0200
Message-Id: <1428419079-30420-2-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
In-Reply-To: <1428419079-30420-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1428419079-30420-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH 1/7] icedtea7-native: Add attr-native and libxslt-native as dependency
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
X-List-Received-Date: Tue, 07 Apr 2015 15:05:04 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 1f193e1..ff0c998 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -4,12 +4,12 @@ LICENSE  = "GPL-2.0-with-classpath-exception"
 INC_PR = "r1"
 
 DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
-           rhino-native ant-native \
+           rhino-native ant-native libxslt-native attr-native \
            libx11-native xproto-native libxt-native libxext-native libxrender-native \
            giflib-native jpeg-native libpng-native \
            glib-2.0-native freetype-native zlib-native \
            fontconfig-native zip-native alsa-lib-native \
-	   unzip-native \
+           unzip-native \
           "
 
 inherit native java autotools
-- 
1.8.1.rc3



Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6DDD1771A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:35:32 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id y9so111992486qgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mU5but3eRhOCL580Y04jZptNkDqtHxW6ZscpJ2ue2f4=;
	b=YAHy18DXL22KaQ4PadLSr+tkokStoHHEdOH7ctRiJ860xTL6OL9XXZFu76sGVIrU4k
	aFkeGylsezAi9E6gM9i4tQBSaimYB8xHTK8izegPBSaw0CRodPYp0Z6ILh7evpTt5y3V
	r2gGmnjkCo77bzzgyw5RDrtiM8++eUm47hdSiApmbJIz4POMtmJE3SkiryodgIPWz9+G
	nfdzbdgx6VEgj8/OMl7ArDs5D/2rsQAtRQmK3WgekMAdN8UfIniikN4oBWD6eYWMh5Pv
	jG0iOFyhmJksRV7qNQoB3l3NNhOqd4RvVFX/Diq3/QnJXigT33F4cpR1E1vk7ovlnPXK
	Di1Q==
X-Gm-Message-State: AG10YOSvNlcXCnTkw/tPbk3mM+BkoYTGDrrvsVTJVOgE2dXuoo/8NxX+uPLKyRNOLoCDIw==
X-Received: by 10.140.94.176 with SMTP id g45mr34017127qge.59.1456148133728;
	Mon, 22 Feb 2016 05:35:33 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id w1sm10232368qha.3.2016.02.22.05.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 05:35:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 08:35:00 -0500
Message-Id: <1456148105-9644-6-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456148105-9644-1-git-send-email-derek@asterius.io>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 06/11] python-mccabe: update to 0.4.0
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
X-List-Received-Date: Mon, 22 Feb 2016 13:35:33 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-mccabe_0.2.1.bb => python-mccabe_0.4.0.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-mccabe_0.2.1.bb => python-mccabe_0.4.0.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb
rename to meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
index 4541994..0958f75 100644
--- a/meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "McCabe checker, plugin for flake8"
 HOMEPAGE = "https://github.com/dreamhost/cliff"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
+LIC_FILES_CHKSUM = "file://README.rst;md5=f8b50fba1711ecac6bcdb6324f85a66d"
 
-SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
-SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
+SRC_URI[md5sum] = "8c425db05f310adcd4bb174b991f26f5"
+SRC_URI[sha256sum] = "9a2b12ebd876e77c72e41ebf401cc2e7c5b566649d50105ca49822688642207b"
 
 inherit pypi setuptools
 
-- 
1.9.1



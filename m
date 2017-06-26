Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id C9FAF77EA7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:11:31 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id k67so145649496wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6MN4ok8R8A32krZ+oHuXpNfzgFlRWyeXdn8JC1vTHVc=;
	b=ZFsO9zQ206u294MVb6xsOLxB6UMRqmWsg4KpHpoxXyPAAVRyfZ+u8yb+q8fJc2w1ie
	EDC4enGnn9JCPEIjd8xzzgOqr1Zwp5DDEQ4roGFcMBPtMcVgguDa+Ij1xJWUpIouAR5z
	txuo8eWJJRq1v/rEUwkM1qxdH61XpdbMv5SkmcgTHsc7RKz6FrWUx3NG2Nn40do6qHxd
	dhxooYw/JVPf6m252emoGsw3gsNZyCC/PM6OJ9qw06fdMRFUPZAQDeNHy4criPYZUiTF
	99zrzlsI/xNP9qUqxDD+YQrmKUfBlKeWiYybf2uoiVxNgMcr0b7CdTbSoiE5D9q5nnNw
	3uEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6MN4ok8R8A32krZ+oHuXpNfzgFlRWyeXdn8JC1vTHVc=;
	b=j8VjYXrw5+7PawNfLQXgF6Up3ZTt4YK1vcWd8PCDy2eGV75pOxKzBNX7uq8ahZlqCg
	EUcE8K/c8+m/Q6sGpb0//lphp++IMBxGBYIPWjFszLFh8IvTPGaFwGH0P48/+fgwk4zG
	OINPgSog30cS7k86u9OxFqLoDWW4KfQA0Fet08wOD9KKBpvvN5+ZnPdYvJcWhBOzdOgS
	xQ7FSl5Hx0yb2HdoCHjU2x0Hqy5jWl6pDcu520ioU4V9l5v1pONd+B7523YWUoU6aK2K
	GcKmBr43rHTI+Jn1z2NYjvjj3/uXlZX/D+LxscJPdiujQPJ9VERKgwj6cqOw9YgUTEd2
	1jMw==
X-Gm-Message-State: AKS2vOxX7n6OLP0S+p88OQNWtzHZg5BplnzKONaQXzZvxxYcVq2Xd3mE
	MepnzMUYyHrQ0rgK2kk=
X-Received: by 10.223.163.15 with SMTP id c15mr13264938wrb.71.1498489892206;
	Mon, 26 Jun 2017 08:11:32 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d91sm368379wma.7.2017.06.26.08.11.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 08:11:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jun 2017 16:11:14 +0100
Message-Id: <20170626151117.6221-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170626151117.6221-1-ross.burton@intel.com>
References: <20170626151117.6221-1-ross.burton@intel.com>
Subject: [meta-oe][PATCH 5/8] meson: export PKG_CONFIG to use pkg-config-native for native builds
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
X-List-Received-Date: Mon, 26 Jun 2017 15:11:32 -0000

By default Meson uses 'pkg-config' in native builds but as that is the cross
pkg-config, export PKG_CONFIG to use the correct pkg-config-native binary.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/classes/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index 8f384c127..b5b2b3b7e 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -14,6 +14,7 @@ export CC = "${BUILD_CC}"
 export CXX = "${BUILD_CXX}"
 export LD = "${BUILD_LD}"
 export AR = "${BUILD_AR}"
+export PKG_CONFIG = "pkg-config-native"
 
 def noprefix(var, d):
     return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
-- 
2.11.0



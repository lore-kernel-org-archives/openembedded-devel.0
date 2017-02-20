Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 709D871D99
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:25:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1KIPYDW006449
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Feb 2017 10:25:35 -0800 (PST)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Feb 2017 10:25:34 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Feb 2017 13:24:52 -0500
Message-ID: <1487615092-14989-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CA+chaQdDMYNGa7KC2-Rgoz-+DXh0v7cfUZRx5W1FcP4rcSdbFQ@mail.gmail.com>
References: <CA+chaQdDMYNGa7KC2-Rgoz-+DXh0v7cfUZRx5W1FcP4rcSdbFQ@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH] farsight: fix implicit pkgconfig dependency causing configure fail
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
X-List-Received-Date: Mon, 20 Feb 2017 18:25:37 -0000
Content-Type: text/plain

In the config log we see:

  configure:12277: checking whether to build static libraries
  configure:12281: result: yes
  configure:12419: checking for x86_64-overc-linux-pkg-config
  configure:12452: result: no
  configure:12462: checking for pkg-config
  configure:12495: result: no
  configure:12801: Using Farsight2 source release as package name
  configure:12825: Using Unknown package origin as package origin
  configure:12879: Using /usr/libexec/gst-install-plugins-helper as plugin install helper
  configure:12953: checking for NICE
  configure:13022: error: Need libnice >= 0.0.9

While it libnice that fails configure, it is the absence of pkg-config
several lines above that causes the failure, as libnice is in the sysroot.

For most build hosts, you'll have to remove the default binary that
lives in /usr/bin/pkg-config in order to see this failure.

Cc: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index 2989850e9875..7d88b5405e16 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -9,7 +9,7 @@ PR = "r3"
 
 DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
 
-inherit autotools
+inherit autotools pkgconfig
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
-- 
2.7.4



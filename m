Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 29AB7770D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 12:51:38 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so2688792wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wUY49+9ca8xN2pu57tkLhndyDMm5AdzxGDA3Qke1Gao=;
	b=JNxyjjcMXSQ0FnnkfsOLZNEpZtT9g1M9an0FIaE5w76J+KkL7sIQXDdnMuww2RyDQb
	m188+U5/l+ky+9XIq9YFV8smk5vv7UWvCIdRe6T3vwOVMSCkC6oZgWq/O0ExM4EzcZCq
	oDhvzCUVwIdeXybf2z0zcYU/qCf5Dk9oNkC/3tzPHMnKR4Or+jjuuTIZKJQraGFwU3Sr
	uYEEt2cuTjUUKskLnIGknIdRgb576X15wD22LHWHkem4e+lDDS6LLYeES8RtW4BfIAnK
	B/mgiqzsXO3x+8prvT6PMNRv+fzqMiexpRS5X1ilhWgMfNnJEYlOOjPGWgHWfMRxIMct
	8n1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wUY49+9ca8xN2pu57tkLhndyDMm5AdzxGDA3Qke1Gao=;
	b=lczeVtfaBe9+L6AO/cVcDd5bcuQprDEJ+dsjbQIpl9rKX5Bi5bYmL4XkuOZgBbcGrD
	ekQD5TincljVUMOtw7cwh+bVqL4eSKZqKkr4nkt6dMskUjXfZLxW8N7mgI6hA2UWJRrn
	tgP52PkEOy2Z9ut4PKq2R9QtBLpXAmtawNQzjrGkL7aZGm29TwE/6oee2ciQDHnowF3u
	4w4Jr8H4oDJiHBEgucEXnP+ZAkuD1803/sjBZIgpIe/0kkHWGvyww6smvfPgFC7U4Vfe
	YjrVXwRByfaWYyXYxsG08IRz9Fukxlj43fFeORQ8x1XBj7xf19NREfJ6bOJAGh9zaVcv
	Ei3w==
X-Gm-Message-State: AEkoouvOBihcC5SEh4lyFYn92WmQA9YgiilnL7RSU4yokE6SGBKh8xhIWjtWtZ1noNoEZg==
X-Received: by 10.25.83.85 with SMTP id h82mr2488030lfb.97.1471006298769;
	Fri, 12 Aug 2016 05:51:38 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	f40sm1354364lji.46.2016.08.12.05.51.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Aug 2016 05:51:37 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Aug 2016 14:51:32 +0200
Message-Id: <1471006292-2509-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH] Graphviz: Add new PACKAGECONFIG for graphviz
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
X-List-Received-Date: Fri, 12 Aug 2016 12:51:39 -0000

Although it does not have an obvious name (gvc), Graphviz is an
optional library configurable via configure.ac.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
index a9f01344a9ff..1b558caf4f16 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
@@ -24,6 +24,7 @@ EXTRA_OECONF = "--program-prefix= --program-suffix=.im6 --without-perl --disable
 
 CACHED_CONFIGUREVARS = "ac_cv_sys_file_offset_bits=yes"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[graphviz] = "--with-gvc,--without-gvc,graphviz"
 PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[openjpeg] = "--with-openjp2,--without-openjp2,openjpeg"
-- 
2.8.1



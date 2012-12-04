Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi5w-0002oS-9J
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:18:48 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=g3hhMoQSL9hSH+Ir5KZfkiNVb7MsUDSfJskE257Igo4=;
	b=ckX9YXVcIA2Txh1icpvNjchNFlYlGG7QP6CeOA52mwrYbkGJ9zku9wQge49ks+0pJo
	3FRv2eHu0UlHGd2v6ttRubA4XAQ5ebH/EE0vX0m8ZCUUPxKiXnGySAS1fbR5oMbXQIqZ
	uOciQtVroY+g0uNoMf4m9E5wWMmMkE+Pb3r5hyVl+M0XCAxLyl/0zmSyTE9MTSxN3f4+
	wvk6JZXrhbjWTBDD6vpfo7mWXcoif7c4ly9EzEqqEgWuDjN7p1lE+6b3SIiX6BVsHn6N
	q07T44RbU/iEBXAAxypBK6sLercDifflJtm7AmYamH5IgLBHUZUOrthWvXiCfdCENsYZ
	ZojQ==
Received: by 10.14.0.133 with SMTP id 5mr17123084eeb.29.1354586668698;
	Mon, 03 Dec 2012 18:04:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm34816317eem.3.2012.12.03.18.04.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:04:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:08 +0100
Message-Id: <93fc9bc9cbd02d9ee5ffa5f65e9d50f63adce106.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 35/58] epdfview: move from meta-efl to meta-gnome
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
X-List-Received-Date: Tue, 04 Dec 2012 02:18:48 -0000

* as suggested in http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-November/042449.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-apps/epdfview}/epdfview/browser_command.patch                 | 0
 .../efl => meta-gnome/recipes-apps/epdfview}/epdfview/fix-format.patch    | 0
 .../recipes-apps/epdfview}/epdfview/glib-single-include.patch             | 0
 .../efl => meta-gnome/recipes-apps/epdfview}/epdfview/swap-colors.patch   | 0
 .../efl => meta-gnome/recipes-apps/epdfview}/epdfview_0.1.8.bb            | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/browser_command.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/fix-format.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/glib-single-include.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/swap-colors.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview_0.1.8.bb (100%)

diff --git a/meta-efl/recipes-efl/efl/epdfview/browser_command.patch b/meta-gnome/recipes-apps/epdfview/epdfview/browser_command.patch
similarity index 100%
rename from meta-efl/recipes-efl/efl/epdfview/browser_command.patch
rename to meta-gnome/recipes-apps/epdfview/epdfview/browser_command.patch
diff --git a/meta-efl/recipes-efl/efl/epdfview/fix-format.patch b/meta-gnome/recipes-apps/epdfview/epdfview/fix-format.patch
similarity index 100%
rename from meta-efl/recipes-efl/efl/epdfview/fix-format.patch
rename to meta-gnome/recipes-apps/epdfview/epdfview/fix-format.patch
diff --git a/meta-efl/recipes-efl/efl/epdfview/glib-single-include.patch b/meta-gnome/recipes-apps/epdfview/epdfview/glib-single-include.patch
similarity index 100%
rename from meta-efl/recipes-efl/efl/epdfview/glib-single-include.patch
rename to meta-gnome/recipes-apps/epdfview/epdfview/glib-single-include.patch
diff --git a/meta-efl/recipes-efl/efl/epdfview/swap-colors.patch b/meta-gnome/recipes-apps/epdfview/epdfview/swap-colors.patch
similarity index 100%
rename from meta-efl/recipes-efl/efl/epdfview/swap-colors.patch
rename to meta-gnome/recipes-apps/epdfview/epdfview/swap-colors.patch
diff --git a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb b/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
similarity index 100%
rename from meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
rename to meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
-- 
1.8.0




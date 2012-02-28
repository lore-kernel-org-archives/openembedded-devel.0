Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2Nyq-0002GR-SL
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:24:40 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so769511eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:16:15 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.17.203 as permitted sender) client-ip=10.213.17.203; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.17.203 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.17.203])
	by 10.213.17.203 with SMTP id t11mr5814129eba.127.1330438575828
	(num_hops = 1); Tue, 28 Feb 2012 06:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jqz5aViUdJcqOqXe7kjloVQ8p/B1PSCuqOlZJAO8Qjw=;
	b=LQaU47YuiDzvabfFjcdeV6Ex08r0DOmizp4gHb4mIhpb+P5Af2y99Cc6dP8aFwW0/u
	b+LQsHkHEENczwxNhzEkA+dqvNAPXAj2OJgeNdr8MI1CORzBkPr+4Htga+xR5d9PCH81
	wqZh2759ZQD110j+TA7wmoYsUPYIzH6weMrp4=
Received: by 10.213.17.203 with SMTP id t11mr4308094eba.127.1330438575772;
	Tue, 28 Feb 2012 06:16:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm24020035eef.9.2012.02.28.06.16.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:16:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:43 +0100
Message-Id: <62372c7ca037ed12a0c9bfc90706c6f62c3b3763.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
References: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330438403.git.Martin.Jansa@gmail.com>
References: <cover.1330438403.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 12/14] poppler: bump PR to rebuild after libtiff3->libtiff5 change
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
X-List-Received-Date: Tue, 28 Feb 2012 14:24:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/poppler/poppler_0.18.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.18.0.bb b/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
index c6c4ec9..69d2926 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
@@ -1,6 +1,6 @@
 require poppler.inc
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "lcms"
 
-- 
1.7.8.5



